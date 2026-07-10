/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 4:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_04_0300_0399 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0300 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def ep_Q2_019_partial_04_0300 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem ep_Q2_019_partial_04_0300_valid :
    mulPoly ep_Q2_019_coefficient_04_0300
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0301 : Poly :=
[
  term ((30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def ep_Q2_019_partial_04_0301 : Poly :=
[
  term ((30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem ep_Q2_019_partial_04_0301_valid :
    mulPoly ep_Q2_019_coefficient_04_0301
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0302 : Poly :=
[
  term ((-171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 302 for generator 4. -/
def ep_Q2_019_partial_04_0302 : Poly :=
[
  term ((-171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((-171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem ep_Q2_019_partial_04_0302_valid :
    mulPoly ep_Q2_019_coefficient_04_0302
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0303 : Poly :=
[
  term ((698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(6, 1), (12, 2), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def ep_Q2_019_partial_04_0303 : Poly :=
[
  term ((698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(2, 2), (6, 1), (12, 2), (16, 1)],
  term ((698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(3, 2), (6, 1), (12, 2), (16, 1)],
  term ((-698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(6, 1), (10, 2), (12, 2), (16, 1)],
  term ((-698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(6, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem ep_Q2_019_partial_04_0303_valid :
    mulPoly ep_Q2_019_coefficient_04_0303
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0304 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def ep_Q2_019_partial_04_0304 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem ep_Q2_019_partial_04_0304_valid :
    mulPoly ep_Q2_019_coefficient_04_0304
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0305 : Poly :=
[
  term ((-1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 4. -/
def ep_Q2_019_partial_04_0305 : Poly :=
[
  term ((-1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem ep_Q2_019_partial_04_0305_valid :
    mulPoly ep_Q2_019_coefficient_04_0305
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0306 : Poly :=
[
  term ((3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def ep_Q2_019_partial_04_0306 : Poly :=
[
  term ((3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term ((-3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem ep_Q2_019_partial_04_0306_valid :
    mulPoly ep_Q2_019_coefficient_04_0306
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0307 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 307 for generator 4. -/
def ep_Q2_019_partial_04_0307 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(2, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem ep_Q2_019_partial_04_0307_valid :
    mulPoly ep_Q2_019_coefficient_04_0307
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0308 : Poly :=
[
  term ((-17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 308 for generator 4. -/
def ep_Q2_019_partial_04_0308 : Poly :=
[
  term ((-17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(2, 2), (6, 1), (14, 1), (16, 1)],
  term ((-17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(3, 2), (6, 1), (14, 1), (16, 1)],
  term ((17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem ep_Q2_019_partial_04_0308_valid :
    mulPoly ep_Q2_019_coefficient_04_0308
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0309 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (14, 2), (16, 1)]
]

/-- Partial product 309 for generator 4. -/
def ep_Q2_019_partial_04_0309 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (6, 1), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (6, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 2), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem ep_Q2_019_partial_04_0309_valid :
    mulPoly ep_Q2_019_coefficient_04_0309
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0310 : Poly :=
[
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 4. -/
def ep_Q2_019_partial_04_0310 : Poly :=
[
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem ep_Q2_019_partial_04_0310_valid :
    mulPoly ep_Q2_019_coefficient_04_0310
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0311 : Poly :=
[
  term ((662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (16, 1)]
]

/-- Partial product 311 for generator 4. -/
def ep_Q2_019_partial_04_0311 : Poly :=
[
  term ((662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(2, 2), (6, 1), (16, 1)],
  term ((662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(3, 2), (6, 1), (16, 1)],
  term ((-662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (10, 2), (16, 1)],
  term ((-662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem ep_Q2_019_partial_04_0311_valid :
    mulPoly ep_Q2_019_coefficient_04_0311
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0312 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (16, 1)]
]

/-- Partial product 312 for generator 4. -/
def ep_Q2_019_partial_04_0312 : Poly :=
[
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (8, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (8, 1), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem ep_Q2_019_partial_04_0312_valid :
    mulPoly ep_Q2_019_coefficient_04_0312
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0313 : Poly :=
[
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (12, 1), (16, 1)]
]

/-- Partial product 313 for generator 4. -/
def ep_Q2_019_partial_04_0313 : Poly :=
[
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (12, 1), (16, 1)],
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (12, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (12, 1), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem ep_Q2_019_partial_04_0313_valid :
    mulPoly ep_Q2_019_coefficient_04_0313
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0314 : Poly :=
[
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 314 for generator 4. -/
def ep_Q2_019_partial_04_0314 : Poly :=
[
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (14, 1), (16, 1)],
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (14, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem ep_Q2_019_partial_04_0314_valid :
    mulPoly ep_Q2_019_coefficient_04_0314
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0315 : Poly :=
[
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (16, 1)]
]

/-- Partial product 315 for generator 4. -/
def ep_Q2_019_partial_04_0315 : Poly :=
[
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (16, 1)],
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem ep_Q2_019_partial_04_0315_valid :
    mulPoly ep_Q2_019_coefficient_04_0315
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0316 : Poly :=
[
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (16, 1)]
]

/-- Partial product 316 for generator 4. -/
def ep_Q2_019_partial_04_0316 : Poly :=
[
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 3), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 3), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (10, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem ep_Q2_019_partial_04_0316_valid :
    mulPoly ep_Q2_019_coefficient_04_0316
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0317 : Poly :=
[
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 317 for generator 4. -/
def ep_Q2_019_partial_04_0317 : Poly :=
[
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(2, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(3, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem ep_Q2_019_partial_04_0317_valid :
    mulPoly ep_Q2_019_coefficient_04_0317
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0318 : Poly :=
[
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 318 for generator 4. -/
def ep_Q2_019_partial_04_0318 : Poly :=
[
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem ep_Q2_019_partial_04_0318_valid :
    mulPoly ep_Q2_019_coefficient_04_0318
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0319 : Poly :=
[
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 4. -/
def ep_Q2_019_partial_04_0319 : Poly :=
[
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem ep_Q2_019_partial_04_0319_valid :
    mulPoly ep_Q2_019_coefficient_04_0319
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0320 : Poly :=
[
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 320 for generator 4. -/
def ep_Q2_019_partial_04_0320 : Poly :=
[
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem ep_Q2_019_partial_04_0320_valid :
    mulPoly ep_Q2_019_coefficient_04_0320
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0321 : Poly :=
[
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 4. -/
def ep_Q2_019_partial_04_0321 : Poly :=
[
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem ep_Q2_019_partial_04_0321_valid :
    mulPoly ep_Q2_019_coefficient_04_0321
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0322 : Poly :=
[
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 4. -/
def ep_Q2_019_partial_04_0322 : Poly :=
[
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem ep_Q2_019_partial_04_0322_valid :
    mulPoly ep_Q2_019_coefficient_04_0322
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0323 : Poly :=
[
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 4. -/
def ep_Q2_019_partial_04_0323 : Poly :=
[
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem ep_Q2_019_partial_04_0323_valid :
    mulPoly ep_Q2_019_coefficient_04_0323
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0324 : Poly :=
[
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 324 for generator 4. -/
def ep_Q2_019_partial_04_0324 : Poly :=
[
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem ep_Q2_019_partial_04_0324_valid :
    mulPoly ep_Q2_019_coefficient_04_0324
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0325 : Poly :=
[
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 4. -/
def ep_Q2_019_partial_04_0325 : Poly :=
[
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem ep_Q2_019_partial_04_0325_valid :
    mulPoly ep_Q2_019_coefficient_04_0325
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0326 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 326 for generator 4. -/
def ep_Q2_019_partial_04_0326 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem ep_Q2_019_partial_04_0326_valid :
    mulPoly ep_Q2_019_coefficient_04_0326
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0327 : Poly :=
[
  term ((1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 327 for generator 4. -/
def ep_Q2_019_partial_04_0327 : Poly :=
[
  term ((1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem ep_Q2_019_partial_04_0327_valid :
    mulPoly ep_Q2_019_coefficient_04_0327
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0328 : Poly :=
[
  term ((-391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 4. -/
def ep_Q2_019_partial_04_0328 : Poly :=
[
  term ((-391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem ep_Q2_019_partial_04_0328_valid :
    mulPoly ep_Q2_019_coefficient_04_0328
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0329 : Poly :=
[
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 329 for generator 4. -/
def ep_Q2_019_partial_04_0329 : Poly :=
[
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(2, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem ep_Q2_019_partial_04_0329_valid :
    mulPoly ep_Q2_019_coefficient_04_0329
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0330 : Poly :=
[
  term ((-1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 4. -/
def ep_Q2_019_partial_04_0330 : Poly :=
[
  term ((-1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem ep_Q2_019_partial_04_0330_valid :
    mulPoly ep_Q2_019_coefficient_04_0330
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0331 : Poly :=
[
  term ((-10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 331 for generator 4. -/
def ep_Q2_019_partial_04_0331 : Poly :=
[
  term ((-10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((-10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem ep_Q2_019_partial_04_0331_valid :
    mulPoly ep_Q2_019_coefficient_04_0331
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0332 : Poly :=
[
  term ((577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def ep_Q2_019_partial_04_0332 : Poly :=
[
  term ((577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem ep_Q2_019_partial_04_0332_valid :
    mulPoly ep_Q2_019_coefficient_04_0332
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0333 : Poly :=
[
  term ((2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 4. -/
def ep_Q2_019_partial_04_0333 : Poly :=
[
  term ((2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem ep_Q2_019_partial_04_0333_valid :
    mulPoly ep_Q2_019_coefficient_04_0333
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0334 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 334 for generator 4. -/
def ep_Q2_019_partial_04_0334 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem ep_Q2_019_partial_04_0334_valid :
    mulPoly ep_Q2_019_coefficient_04_0334
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0335 : Poly :=
[
  term ((-457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 335 for generator 4. -/
def ep_Q2_019_partial_04_0335 : Poly :=
[
  term ((-457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem ep_Q2_019_partial_04_0335_valid :
    mulPoly ep_Q2_019_coefficient_04_0335
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0336 : Poly :=
[
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 4. -/
def ep_Q2_019_partial_04_0336 : Poly :=
[
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem ep_Q2_019_partial_04_0336_valid :
    mulPoly ep_Q2_019_coefficient_04_0336
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0337 : Poly :=
[
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 337 for generator 4. -/
def ep_Q2_019_partial_04_0337 : Poly :=
[
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem ep_Q2_019_partial_04_0337_valid :
    mulPoly ep_Q2_019_coefficient_04_0337
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0338 : Poly :=
[
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 338 for generator 4. -/
def ep_Q2_019_partial_04_0338 : Poly :=
[
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem ep_Q2_019_partial_04_0338_valid :
    mulPoly ep_Q2_019_coefficient_04_0338
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0339 : Poly :=
[
  term ((606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 339 for generator 4. -/
def ep_Q2_019_partial_04_0339 : Poly :=
[
  term ((606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem ep_Q2_019_partial_04_0339_valid :
    mulPoly ep_Q2_019_coefficient_04_0339
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0340 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 340 for generator 4. -/
def ep_Q2_019_partial_04_0340 : Poly :=
[
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem ep_Q2_019_partial_04_0340_valid :
    mulPoly ep_Q2_019_coefficient_04_0340
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0341 : Poly :=
[
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def ep_Q2_019_partial_04_0341 : Poly :=
[
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem ep_Q2_019_partial_04_0341_valid :
    mulPoly ep_Q2_019_coefficient_04_0341
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0342 : Poly :=
[
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 4. -/
def ep_Q2_019_partial_04_0342 : Poly :=
[
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem ep_Q2_019_partial_04_0342_valid :
    mulPoly ep_Q2_019_coefficient_04_0342
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0343 : Poly :=
[
  term ((1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 4. -/
def ep_Q2_019_partial_04_0343 : Poly :=
[
  term ((1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem ep_Q2_019_partial_04_0343_valid :
    mulPoly ep_Q2_019_coefficient_04_0343
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0344 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def ep_Q2_019_partial_04_0344 : Poly :=
[
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem ep_Q2_019_partial_04_0344_valid :
    mulPoly ep_Q2_019_coefficient_04_0344
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0345 : Poly :=
[
  term ((-42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 345 for generator 4. -/
def ep_Q2_019_partial_04_0345 : Poly :=
[
  term ((-42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem ep_Q2_019_partial_04_0345_valid :
    mulPoly ep_Q2_019_coefficient_04_0345
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0346 : Poly :=
[
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 346 for generator 4. -/
def ep_Q2_019_partial_04_0346 : Poly :=
[
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem ep_Q2_019_partial_04_0346_valid :
    mulPoly ep_Q2_019_coefficient_04_0346
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0347 : Poly :=
[
  term ((-1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 347 for generator 4. -/
def ep_Q2_019_partial_04_0347 : Poly :=
[
  term ((-1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem ep_Q2_019_partial_04_0347_valid :
    mulPoly ep_Q2_019_coefficient_04_0347
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0348 : Poly :=
[
  term ((-3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def ep_Q2_019_partial_04_0348 : Poly :=
[
  term ((-3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem ep_Q2_019_partial_04_0348_valid :
    mulPoly ep_Q2_019_coefficient_04_0348
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0349 : Poly :=
[
  term ((5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 4. -/
def ep_Q2_019_partial_04_0349 : Poly :=
[
  term ((5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem ep_Q2_019_partial_04_0349_valid :
    mulPoly ep_Q2_019_coefficient_04_0349
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0350 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 350 for generator 4. -/
def ep_Q2_019_partial_04_0350 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem ep_Q2_019_partial_04_0350_valid :
    mulPoly ep_Q2_019_coefficient_04_0350
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0351 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 351 for generator 4. -/
def ep_Q2_019_partial_04_0351 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem ep_Q2_019_partial_04_0351_valid :
    mulPoly ep_Q2_019_coefficient_04_0351
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0352 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 352 for generator 4. -/
def ep_Q2_019_partial_04_0352 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem ep_Q2_019_partial_04_0352_valid :
    mulPoly ep_Q2_019_coefficient_04_0352
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0353 : Poly :=
[
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 353 for generator 4. -/
def ep_Q2_019_partial_04_0353 : Poly :=
[
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem ep_Q2_019_partial_04_0353_valid :
    mulPoly ep_Q2_019_coefficient_04_0353
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0354 : Poly :=
[
  term ((144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 354 for generator 4. -/
def ep_Q2_019_partial_04_0354 : Poly :=
[
  term ((144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem ep_Q2_019_partial_04_0354_valid :
    mulPoly ep_Q2_019_coefficient_04_0354
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0355 : Poly :=
[
  term ((139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 4. -/
def ep_Q2_019_partial_04_0355 : Poly :=
[
  term ((139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem ep_Q2_019_partial_04_0355_valid :
    mulPoly ep_Q2_019_coefficient_04_0355
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0356 : Poly :=
[
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 356 for generator 4. -/
def ep_Q2_019_partial_04_0356 : Poly :=
[
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 2), (12, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem ep_Q2_019_partial_04_0356_valid :
    mulPoly ep_Q2_019_coefficient_04_0356
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0357 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 357 for generator 4. -/
def ep_Q2_019_partial_04_0357 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem ep_Q2_019_partial_04_0357_valid :
    mulPoly ep_Q2_019_coefficient_04_0357
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0358 : Poly :=
[
  term ((11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (16, 1)]
]

/-- Partial product 358 for generator 4. -/
def ep_Q2_019_partial_04_0358 : Poly :=
[
  term ((11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(2, 2), (7, 2), (16, 1)],
  term ((11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(3, 2), (7, 2), (16, 1)],
  term ((-11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (10, 2), (16, 1)],
  term ((-11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem ep_Q2_019_partial_04_0358_valid :
    mulPoly ep_Q2_019_coefficient_04_0358
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0359 : Poly :=
[
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 4. -/
def ep_Q2_019_partial_04_0359 : Poly :=
[
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem ep_Q2_019_partial_04_0359_valid :
    mulPoly ep_Q2_019_coefficient_04_0359
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0360 : Poly :=
[
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 360 for generator 4. -/
def ep_Q2_019_partial_04_0360 : Poly :=
[
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem ep_Q2_019_partial_04_0360_valid :
    mulPoly ep_Q2_019_coefficient_04_0360
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0361 : Poly :=
[
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 361 for generator 4. -/
def ep_Q2_019_partial_04_0361 : Poly :=
[
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem ep_Q2_019_partial_04_0361_valid :
    mulPoly ep_Q2_019_coefficient_04_0361
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0362 : Poly :=
[
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 4. -/
def ep_Q2_019_partial_04_0362 : Poly :=
[
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem ep_Q2_019_partial_04_0362_valid :
    mulPoly ep_Q2_019_coefficient_04_0362
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0363 : Poly :=
[
  term ((213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 4. -/
def ep_Q2_019_partial_04_0363 : Poly :=
[
  term ((213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem ep_Q2_019_partial_04_0363_valid :
    mulPoly ep_Q2_019_coefficient_04_0363
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0364 : Poly :=
[
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 364 for generator 4. -/
def ep_Q2_019_partial_04_0364 : Poly :=
[
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem ep_Q2_019_partial_04_0364_valid :
    mulPoly ep_Q2_019_coefficient_04_0364
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0365 : Poly :=
[
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 365 for generator 4. -/
def ep_Q2_019_partial_04_0365 : Poly :=
[
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem ep_Q2_019_partial_04_0365_valid :
    mulPoly ep_Q2_019_coefficient_04_0365
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0366 : Poly :=
[
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 366 for generator 4. -/
def ep_Q2_019_partial_04_0366 : Poly :=
[
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem ep_Q2_019_partial_04_0366_valid :
    mulPoly ep_Q2_019_coefficient_04_0366
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0367 : Poly :=
[
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 367 for generator 4. -/
def ep_Q2_019_partial_04_0367 : Poly :=
[
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (12, 2), (16, 1)],
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (12, 2), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem ep_Q2_019_partial_04_0367_valid :
    mulPoly ep_Q2_019_coefficient_04_0367
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0368 : Poly :=
[
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 368 for generator 4. -/
def ep_Q2_019_partial_04_0368 : Poly :=
[
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem ep_Q2_019_partial_04_0368_valid :
    mulPoly ep_Q2_019_coefficient_04_0368
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0369 : Poly :=
[
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 4. -/
def ep_Q2_019_partial_04_0369 : Poly :=
[
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem ep_Q2_019_partial_04_0369_valid :
    mulPoly ep_Q2_019_coefficient_04_0369
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0370 : Poly :=
[
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 370 for generator 4. -/
def ep_Q2_019_partial_04_0370 : Poly :=
[
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem ep_Q2_019_partial_04_0370_valid :
    mulPoly ep_Q2_019_coefficient_04_0370
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0371 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 4. -/
def ep_Q2_019_partial_04_0371 : Poly :=
[
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem ep_Q2_019_partial_04_0371_valid :
    mulPoly ep_Q2_019_coefficient_04_0371
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0372 : Poly :=
[
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 4. -/
def ep_Q2_019_partial_04_0372 : Poly :=
[
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem ep_Q2_019_partial_04_0372_valid :
    mulPoly ep_Q2_019_coefficient_04_0372
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0373 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (14, 2), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def ep_Q2_019_partial_04_0373 : Poly :=
[
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (8, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (8, 1), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (10, 2), (14, 2), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem ep_Q2_019_partial_04_0373_valid :
    mulPoly ep_Q2_019_coefficient_04_0373
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0374 : Poly :=
[
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 374 for generator 4. -/
def ep_Q2_019_partial_04_0374 : Poly :=
[
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem ep_Q2_019_partial_04_0374_valid :
    mulPoly ep_Q2_019_coefficient_04_0374
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0375 : Poly :=
[
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (16, 1)]
]

/-- Partial product 375 for generator 4. -/
def ep_Q2_019_partial_04_0375 : Poly :=
[
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(2, 2), (8, 1), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(3, 2), (8, 1), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (10, 2), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem ep_Q2_019_partial_04_0375_valid :
    mulPoly ep_Q2_019_coefficient_04_0375
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0376 : Poly :=
[
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 376 for generator 4. -/
def ep_Q2_019_partial_04_0376 : Poly :=
[
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem ep_Q2_019_partial_04_0376_valid :
    mulPoly ep_Q2_019_coefficient_04_0376
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0377 : Poly :=
[
  term ((-96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 377 for generator 4. -/
def ep_Q2_019_partial_04_0377 : Poly :=
[
  term ((-96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem ep_Q2_019_partial_04_0377_valid :
    mulPoly ep_Q2_019_coefficient_04_0377
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0378 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 378 for generator 4. -/
def ep_Q2_019_partial_04_0378 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem ep_Q2_019_partial_04_0378_valid :
    mulPoly ep_Q2_019_coefficient_04_0378
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0379 : Poly :=
[
  term ((-93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def ep_Q2_019_partial_04_0379 : Poly :=
[
  term ((-93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem ep_Q2_019_partial_04_0379_valid :
    mulPoly ep_Q2_019_coefficient_04_0379
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0380 : Poly :=
[
  term ((-7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 380 for generator 4. -/
def ep_Q2_019_partial_04_0380 : Poly :=
[
  term ((-7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem ep_Q2_019_partial_04_0380_valid :
    mulPoly ep_Q2_019_coefficient_04_0380
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0381 : Poly :=
[
  term ((-3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 381 for generator 4. -/
def ep_Q2_019_partial_04_0381 : Poly :=
[
  term ((-3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem ep_Q2_019_partial_04_0381_valid :
    mulPoly ep_Q2_019_coefficient_04_0381
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0382 : Poly :=
[
  term ((1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 4. -/
def ep_Q2_019_partial_04_0382 : Poly :=
[
  term ((1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem ep_Q2_019_partial_04_0382_valid :
    mulPoly ep_Q2_019_coefficient_04_0382
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0383 : Poly :=
[
  term ((-7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 4. -/
def ep_Q2_019_partial_04_0383 : Poly :=
[
  term ((-7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 4. -/
theorem ep_Q2_019_partial_04_0383_valid :
    mulPoly ep_Q2_019_coefficient_04_0383
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0384 : Poly :=
[
  term ((716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 384 for generator 4. -/
def ep_Q2_019_partial_04_0384 : Poly :=
[
  term ((716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 4. -/
theorem ep_Q2_019_partial_04_0384_valid :
    mulPoly ep_Q2_019_coefficient_04_0384
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0385 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 385 for generator 4. -/
def ep_Q2_019_partial_04_0385 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 4. -/
theorem ep_Q2_019_partial_04_0385_valid :
    mulPoly ep_Q2_019_coefficient_04_0385
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0386 : Poly :=
[
  term ((124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 386 for generator 4. -/
def ep_Q2_019_partial_04_0386 : Poly :=
[
  term ((124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 4. -/
theorem ep_Q2_019_partial_04_0386_valid :
    mulPoly ep_Q2_019_coefficient_04_0386
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0387 : Poly :=
[
  term ((14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 4. -/
def ep_Q2_019_partial_04_0387 : Poly :=
[
  term ((14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 4. -/
theorem ep_Q2_019_partial_04_0387_valid :
    mulPoly ep_Q2_019_coefficient_04_0387
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0388 : Poly :=
[
  term ((-550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 4. -/
def ep_Q2_019_partial_04_0388 : Poly :=
[
  term ((-550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 4. -/
theorem ep_Q2_019_partial_04_0388_valid :
    mulPoly ep_Q2_019_coefficient_04_0388
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0389 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 389 for generator 4. -/
def ep_Q2_019_partial_04_0389 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 4. -/
theorem ep_Q2_019_partial_04_0389_valid :
    mulPoly ep_Q2_019_coefficient_04_0389
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0390 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 390 for generator 4. -/
def ep_Q2_019_partial_04_0390 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 4. -/
theorem ep_Q2_019_partial_04_0390_valid :
    mulPoly ep_Q2_019_coefficient_04_0390
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0391 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 4. -/
def ep_Q2_019_partial_04_0391 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 4. -/
theorem ep_Q2_019_partial_04_0391_valid :
    mulPoly ep_Q2_019_coefficient_04_0391
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0392 : Poly :=
[
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 392 for generator 4. -/
def ep_Q2_019_partial_04_0392 : Poly :=
[
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 4. -/
theorem ep_Q2_019_partial_04_0392_valid :
    mulPoly ep_Q2_019_coefficient_04_0392
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0393 : Poly :=
[
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 4. -/
def ep_Q2_019_partial_04_0393 : Poly :=
[
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 4. -/
theorem ep_Q2_019_partial_04_0393_valid :
    mulPoly ep_Q2_019_coefficient_04_0393
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0394 : Poly :=
[
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 394 for generator 4. -/
def ep_Q2_019_partial_04_0394 : Poly :=
[
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 2), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 4. -/
theorem ep_Q2_019_partial_04_0394_valid :
    mulPoly ep_Q2_019_coefficient_04_0394
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0395 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 4. -/
def ep_Q2_019_partial_04_0395 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 4. -/
theorem ep_Q2_019_partial_04_0395_valid :
    mulPoly ep_Q2_019_coefficient_04_0395
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0396 : Poly :=
[
  term ((-2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(9, 2), (16, 1)]
]

/-- Partial product 396 for generator 4. -/
def ep_Q2_019_partial_04_0396 : Poly :=
[
  term ((-2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(2, 2), (9, 2), (16, 1)],
  term ((-2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(3, 2), (9, 2), (16, 1)],
  term ((2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(9, 2), (10, 2), (16, 1)],
  term ((2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 4. -/
theorem ep_Q2_019_partial_04_0396_valid :
    mulPoly ep_Q2_019_coefficient_04_0396
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0397 : Poly :=
[
  term ((-13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 4. -/
def ep_Q2_019_partial_04_0397 : Poly :=
[
  term ((-13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 4. -/
theorem ep_Q2_019_partial_04_0397_valid :
    mulPoly ep_Q2_019_coefficient_04_0397
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0398 : Poly :=
[
  term ((-3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 4. -/
def ep_Q2_019_partial_04_0398 : Poly :=
[
  term ((-3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 4. -/
theorem ep_Q2_019_partial_04_0398_valid :
    mulPoly ep_Q2_019_coefficient_04_0398
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 4. -/
def ep_Q2_019_coefficient_04_0399 : Poly :=
[
  term ((-102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 399 for generator 4. -/
def ep_Q2_019_partial_04_0399 : Poly :=
[
  term ((-102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 4. -/
theorem ep_Q2_019_partial_04_0399_valid :
    mulPoly ep_Q2_019_coefficient_04_0399
        ep_Q2_019_generator_04_0300_0399 =
      ep_Q2_019_partial_04_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_04_0300_0399 : List Poly :=
[
  ep_Q2_019_partial_04_0300,
  ep_Q2_019_partial_04_0301,
  ep_Q2_019_partial_04_0302,
  ep_Q2_019_partial_04_0303,
  ep_Q2_019_partial_04_0304,
  ep_Q2_019_partial_04_0305,
  ep_Q2_019_partial_04_0306,
  ep_Q2_019_partial_04_0307,
  ep_Q2_019_partial_04_0308,
  ep_Q2_019_partial_04_0309,
  ep_Q2_019_partial_04_0310,
  ep_Q2_019_partial_04_0311,
  ep_Q2_019_partial_04_0312,
  ep_Q2_019_partial_04_0313,
  ep_Q2_019_partial_04_0314,
  ep_Q2_019_partial_04_0315,
  ep_Q2_019_partial_04_0316,
  ep_Q2_019_partial_04_0317,
  ep_Q2_019_partial_04_0318,
  ep_Q2_019_partial_04_0319,
  ep_Q2_019_partial_04_0320,
  ep_Q2_019_partial_04_0321,
  ep_Q2_019_partial_04_0322,
  ep_Q2_019_partial_04_0323,
  ep_Q2_019_partial_04_0324,
  ep_Q2_019_partial_04_0325,
  ep_Q2_019_partial_04_0326,
  ep_Q2_019_partial_04_0327,
  ep_Q2_019_partial_04_0328,
  ep_Q2_019_partial_04_0329,
  ep_Q2_019_partial_04_0330,
  ep_Q2_019_partial_04_0331,
  ep_Q2_019_partial_04_0332,
  ep_Q2_019_partial_04_0333,
  ep_Q2_019_partial_04_0334,
  ep_Q2_019_partial_04_0335,
  ep_Q2_019_partial_04_0336,
  ep_Q2_019_partial_04_0337,
  ep_Q2_019_partial_04_0338,
  ep_Q2_019_partial_04_0339,
  ep_Q2_019_partial_04_0340,
  ep_Q2_019_partial_04_0341,
  ep_Q2_019_partial_04_0342,
  ep_Q2_019_partial_04_0343,
  ep_Q2_019_partial_04_0344,
  ep_Q2_019_partial_04_0345,
  ep_Q2_019_partial_04_0346,
  ep_Q2_019_partial_04_0347,
  ep_Q2_019_partial_04_0348,
  ep_Q2_019_partial_04_0349,
  ep_Q2_019_partial_04_0350,
  ep_Q2_019_partial_04_0351,
  ep_Q2_019_partial_04_0352,
  ep_Q2_019_partial_04_0353,
  ep_Q2_019_partial_04_0354,
  ep_Q2_019_partial_04_0355,
  ep_Q2_019_partial_04_0356,
  ep_Q2_019_partial_04_0357,
  ep_Q2_019_partial_04_0358,
  ep_Q2_019_partial_04_0359,
  ep_Q2_019_partial_04_0360,
  ep_Q2_019_partial_04_0361,
  ep_Q2_019_partial_04_0362,
  ep_Q2_019_partial_04_0363,
  ep_Q2_019_partial_04_0364,
  ep_Q2_019_partial_04_0365,
  ep_Q2_019_partial_04_0366,
  ep_Q2_019_partial_04_0367,
  ep_Q2_019_partial_04_0368,
  ep_Q2_019_partial_04_0369,
  ep_Q2_019_partial_04_0370,
  ep_Q2_019_partial_04_0371,
  ep_Q2_019_partial_04_0372,
  ep_Q2_019_partial_04_0373,
  ep_Q2_019_partial_04_0374,
  ep_Q2_019_partial_04_0375,
  ep_Q2_019_partial_04_0376,
  ep_Q2_019_partial_04_0377,
  ep_Q2_019_partial_04_0378,
  ep_Q2_019_partial_04_0379,
  ep_Q2_019_partial_04_0380,
  ep_Q2_019_partial_04_0381,
  ep_Q2_019_partial_04_0382,
  ep_Q2_019_partial_04_0383,
  ep_Q2_019_partial_04_0384,
  ep_Q2_019_partial_04_0385,
  ep_Q2_019_partial_04_0386,
  ep_Q2_019_partial_04_0387,
  ep_Q2_019_partial_04_0388,
  ep_Q2_019_partial_04_0389,
  ep_Q2_019_partial_04_0390,
  ep_Q2_019_partial_04_0391,
  ep_Q2_019_partial_04_0392,
  ep_Q2_019_partial_04_0393,
  ep_Q2_019_partial_04_0394,
  ep_Q2_019_partial_04_0395,
  ep_Q2_019_partial_04_0396,
  ep_Q2_019_partial_04_0397,
  ep_Q2_019_partial_04_0398,
  ep_Q2_019_partial_04_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_04_0300_0399 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (12, 1), (16, 1)],
  term ((698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(2, 2), (6, 1), (12, 2), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(2, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(2, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(2, 2), (6, 1), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(2, 2), (6, 1), (14, 2), (16, 1)],
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(2, 2), (6, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (8, 1), (16, 1)],
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (12, 1), (16, 1)],
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (14, 1), (16, 1)],
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 2), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (6, 3), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(2, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(2, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(2, 2), (7, 1), (9, 1), (16, 1)],
  term ((577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(2, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (12, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(2, 2), (7, 2), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (12, 2), (16, 1)],
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (8, 1), (13, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(2, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (8, 1), (14, 2), (16, 1)],
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(2, 2), (8, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (9, 2), (12, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(2, 2), (9, 2), (16, 1)],
  term ((-13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (12, 1), (16, 1)],
  term ((698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(3, 2), (6, 1), (12, 2), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(3, 2), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 1), (13, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(3, 2), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(3, 2), (6, 1), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(3, 2), (6, 1), (14, 2), (16, 1)],
  term ((-473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(3, 2), (6, 1), (16, 1)],
  term ((6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (8, 1), (16, 1)],
  term ((115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (12, 1), (16, 1)],
  term ((-11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (14, 1), (16, 1)],
  term ((3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 2), (16, 1)],
  term ((-5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (6, 3), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(3, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(3, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (12, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(3, 2), (7, 2), (16, 1)],
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((-26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (12, 2), (16, 1)],
  term ((-6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (8, 1), (13, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (8, 1), (14, 2), (16, 1)],
  term ((-5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(3, 2), (8, 1), (16, 1)],
  term ((18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (9, 2), (12, 1), (16, 1)],
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(3, 2), (9, 2), (14, 1), (16, 1)],
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(3, 2), (9, 2), (16, 1)],
  term ((-13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((-30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (12, 1), (16, 1)],
  term ((-698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(6, 1), (10, 2), (12, 2), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 2), (14, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (10, 2), (16, 1)],
  term ((-30730101239223980529421569518966210304 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((171071872283294589112039125498430548498 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-698065091760865359997654129510918668 : Rat) / 894241638896928502822456059496668245) [(6, 1), (11, 2), (12, 2), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1135550776972832432058447151757953839836 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3794413803072221830579276566600371556 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((17607813892195054716498802555186717019033 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((473017196147611919693973291936177336872 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-662465002950068680221432236824683329671 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 1), (11, 4), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (10, 2), (16, 1)],
  term ((-6522837319070128112923971457623425808 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (12, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 2), (16, 1)],
  term ((-115168017883287221373572659580319408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((11441033975404501762015948248281624592 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-3226349029495381456434333946545431412 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (10, 2), (16, 1)],
  term ((5249041187478636228520662548267024328 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (11, 2), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28112532995402064206912844842743871392 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-242040753444050740443283680284157725096 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-189919297719986320670262748151478586319 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4189570621696067458085407059354802710803 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-426405613655229668851375194115430692591 : Rat) / 17527136122379798655320138766134697602) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1010666192094079630800174189645853300616 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((391446514359476900998272200540922562336 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((1769082776160380752394463979568033284256 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((10120276183648057555921257358149572287719 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-577660867263870844839074489851126321536 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-2762897923286395200368377756313744122224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-218408367850767137880860467995211824 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-253341068268425999132196248637671184 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1902844954063873728826874009591263739683 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-68073407269639115089427597382736032 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((42003080768923367296061440917631645464 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7875721714227490653490406307494778192 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1067666583181513113620565285573690740946 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((3620171564079367701068850257332196163247 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5519294902134474059488889891546824501477 : Rat) / 50077531778227996158057539331813421720) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((457326321498055965884368956827988328284 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-606088859409043838147965146838034981717 : Rat) / 25038765889113998079028769665906710860) [(7, 1), (11, 3), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((20058566451784358386809914609785136248 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-144302327457312191148301859831002654320 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-139059046123269283658735381230019330604 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (10, 2), (16, 1)],
  term ((10823708518941742256667548153611286112 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-11487814766441242594422435200576906112 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (11, 2), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 2), (12, 2), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 2), (13, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (10, 2), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (10, 2), (14, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (10, 2), (16, 1)],
  term ((26184678354181631812023026927216281624 : Rat) / 43817840305949496638300346915336744005) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-9133293296206918631277339311234846486 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((17700065002638466742461382836014900672 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((6736847150482171410214368141723236505789 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1328559129644869579289846967333067294567 : Rat) / 69750847833960423220151572640740123110) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((18863688612569779276939497394126456792 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4931968254107121451409235981817201246921 : Rat) / 788721125507090939489406244476061392090) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((5748580926342694476043600968982720 : Rat) / 178848327779385700564491211899333649) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((747046076064874633477146758656963703539 : Rat) / 56844765802312860503740990592869289520) [(8, 1), (11, 2), (16, 1)],
  term ((1615139513142498028874157908371606142 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((-6776986649032847498320458444514312298269 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-213061496574334018807930674304170454435649 : Rat) / 10253374631592182213362281178188798097170) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((2936817802379299007228050737620641103581 : Rat) / 315488450202836375795762497790424556836) [(8, 1), (11, 4), (16, 1)],
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((3504057774535462565657168166928191432 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1474866458543997127676397224538761504825 : Rat) / 113926384795468691259580901979875534413) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((7348337124984967264100008913623844857353 : Rat) / 1139263847954686912595809019798755344130) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-716715774000597090197275478449571363976 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-124840892484635402003689071822764393193 : Rat) / 1184265954214851260494603970684776865) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-14106720390705016862261637972144080886671 : Rat) / 209252543501881269660454717922220369330) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((550614687033846001022874691895282711697079 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-18266586592413837262554678622469692972 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (12, 1), (16, 1)],
  term ((96510317011674866571478857601112608976 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((93269391679627773164475860381639860296 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((7400624703788908311965223822821821531921 : Rat) / 225348893002025982711258926993160397740) [(9, 1), (11, 3), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(9, 2), (10, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((2306421248930770676637862930484248398047 : Rat) / 37558148833670997118543154498860066290) [(9, 2), (11, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 3), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13703309708987479531656298808573498403002 : Rat) / 569631923977343456297904509899377672065) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3373504332485321887986812725744997004786 : Rat) / 81375989139620493756843501414196810295) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((102748011334688350682172245155309763438 : Rat) / 8763568061189899327660069383067348801) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 399. -/
theorem ep_Q2_019_block_04_0300_0399_valid :
    checkProductSumEq ep_Q2_019_partials_04_0300_0399
      ep_Q2_019_block_04_0300_0399 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
