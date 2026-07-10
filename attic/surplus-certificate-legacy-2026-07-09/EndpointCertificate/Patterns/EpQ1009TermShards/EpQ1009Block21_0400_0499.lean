/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0400 : Poly :=
[
  term ((-10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 400 for generator 21. -/
def ep_Q1_009_partial_21_0400 : Poly :=
[
  term ((-10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 21. -/
theorem ep_Q1_009_partial_21_0400_valid :
    mulPoly ep_Q1_009_coefficient_21_0400
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0401 : Poly :=
[
  term ((109062900059665680812437 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 401 for generator 21. -/
def ep_Q1_009_partial_21_0401 : Poly :=
[
  term ((109062900059665680812437 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-109062900059665680812437 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 21. -/
theorem ep_Q1_009_partial_21_0401_valid :
    mulPoly ep_Q1_009_coefficient_21_0401
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0402 : Poly :=
[
  term ((-3587936249724511830154190717720582853866484744027666780730001698881006035962982892029571878382963033256401875357 : Rat) / 3478686458440884829632557656874612422980692585840139311284965553549267403835243161101798702235340504336884291136) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 402 for generator 21. -/
def ep_Q1_009_partial_21_0402 : Poly :=
[
  term ((-3587936249724511830154190717720582853866484744027666780730001698881006035962982892029571878382963033256401875357 : Rat) / 1739343229220442414816278828437306211490346292920069655642482776774633701917621580550899351117670252168442145568) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((3587936249724511830154190717720582853866484744027666780730001698881006035962982892029571878382963033256401875357 : Rat) / 3478686458440884829632557656874612422980692585840139311284965553549267403835243161101798702235340504336884291136) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 21. -/
theorem ep_Q1_009_partial_21_0402_valid :
    mulPoly ep_Q1_009_coefficient_21_0402
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0403 : Poly :=
[
  term ((488825139933708924528 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 403 for generator 21. -/
def ep_Q1_009_partial_21_0403 : Poly :=
[
  term ((977650279867417849056 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 21. -/
theorem ep_Q1_009_partial_21_0403_valid :
    mulPoly ep_Q1_009_coefficient_21_0403
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0404 : Poly :=
[
  term ((-765035351744540155571669 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 404 for generator 21. -/
def ep_Q1_009_partial_21_0404 : Poly :=
[
  term ((-765035351744540155571669 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((765035351744540155571669 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 21. -/
theorem ep_Q1_009_partial_21_0404_valid :
    mulPoly ep_Q1_009_coefficient_21_0404
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0405 : Poly :=
[
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 405 for generator 21. -/
def ep_Q1_009_partial_21_0405 : Poly :=
[
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 21. -/
theorem ep_Q1_009_partial_21_0405_valid :
    mulPoly ep_Q1_009_coefficient_21_0405
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0406 : Poly :=
[
  term ((2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 21. -/
def ep_Q1_009_partial_21_0406 : Poly :=
[
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 21. -/
theorem ep_Q1_009_partial_21_0406_valid :
    mulPoly ep_Q1_009_coefficient_21_0406
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0407 : Poly :=
[
  term ((370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 407 for generator 21. -/
def ep_Q1_009_partial_21_0407 : Poly :=
[
  term ((370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 21. -/
theorem ep_Q1_009_partial_21_0407_valid :
    mulPoly ep_Q1_009_coefficient_21_0407
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0408 : Poly :=
[
  term ((-499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 408 for generator 21. -/
def ep_Q1_009_partial_21_0408 : Poly :=
[
  term ((-499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 21. -/
theorem ep_Q1_009_partial_21_0408_valid :
    mulPoly ep_Q1_009_coefficient_21_0408
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0409 : Poly :=
[
  term ((1222062849834272311320 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 21. -/
def ep_Q1_009_partial_21_0409 : Poly :=
[
  term ((2444125699668544622640 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1222062849834272311320 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 21. -/
theorem ep_Q1_009_partial_21_0409_valid :
    mulPoly ep_Q1_009_coefficient_21_0409
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0410 : Poly :=
[
  term ((-804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 410 for generator 21. -/
def ep_Q1_009_partial_21_0410 : Poly :=
[
  term ((-804097384918378324117487 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 21. -/
theorem ep_Q1_009_partial_21_0410_valid :
    mulPoly ep_Q1_009_coefficient_21_0410
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0411 : Poly :=
[
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)]
]

/-- Partial product 411 for generator 21. -/
def ep_Q1_009_partial_21_0411 : Poly :=
[
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 21. -/
theorem ep_Q1_009_partial_21_0411_valid :
    mulPoly ep_Q1_009_coefficient_21_0411
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0412 : Poly :=
[
  term ((237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 412 for generator 21. -/
def ep_Q1_009_partial_21_0412 : Poly :=
[
  term ((237656816706250445897783 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 21. -/
theorem ep_Q1_009_partial_21_0412_valid :
    mulPoly ep_Q1_009_coefficient_21_0412
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0413 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 413 for generator 21. -/
def ep_Q1_009_partial_21_0413 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 21. -/
theorem ep_Q1_009_partial_21_0413_valid :
    mulPoly ep_Q1_009_coefficient_21_0413
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0414 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 21. -/
def ep_Q1_009_partial_21_0414 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 21. -/
theorem ep_Q1_009_partial_21_0414_valid :
    mulPoly ep_Q1_009_coefficient_21_0414
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0415 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 415 for generator 21. -/
def ep_Q1_009_partial_21_0415 : Poly :=
[
  term ((56 : Rat) / 17) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 21. -/
theorem ep_Q1_009_partial_21_0415_valid :
    mulPoly ep_Q1_009_coefficient_21_0415
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0416 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 416 for generator 21. -/
def ep_Q1_009_partial_21_0416 : Poly :=
[
  term ((56 : Rat) / 17) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 21. -/
theorem ep_Q1_009_partial_21_0416_valid :
    mulPoly ep_Q1_009_coefficient_21_0416
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0417 : Poly :=
[
  term ((1465194079638237125086147708911579527368986258230021955071188673154175792319 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 417 for generator 21. -/
def ep_Q1_009_partial_21_0417 : Poly :=
[
  term ((1465194079638237125086147708911579527368986258230021955071188673154175792319 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1465194079638237125086147708911579527368986258230021955071188673154175792319 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 21. -/
theorem ep_Q1_009_partial_21_0417_valid :
    mulPoly ep_Q1_009_coefficient_21_0417
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0418 : Poly :=
[
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 418 for generator 21. -/
def ep_Q1_009_partial_21_0418 : Poly :=
[
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 21. -/
theorem ep_Q1_009_partial_21_0418_valid :
    mulPoly ep_Q1_009_coefficient_21_0418
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0419 : Poly :=
[
  term ((-374251758280452 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 419 for generator 21. -/
def ep_Q1_009_partial_21_0419 : Poly :=
[
  term ((-748503516560904 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((374251758280452 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 21. -/
theorem ep_Q1_009_partial_21_0419_valid :
    mulPoly ep_Q1_009_coefficient_21_0419
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0420 : Poly :=
[
  term ((-571976585098825659278420341933200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 420 for generator 21. -/
def ep_Q1_009_partial_21_0420 : Poly :=
[
  term ((-1143953170197651318556840683866400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((571976585098825659278420341933200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 21. -/
theorem ep_Q1_009_partial_21_0420_valid :
    mulPoly ep_Q1_009_coefficient_21_0420
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0421 : Poly :=
[
  term ((-418960844530549942672982778124028314210885195239119687028202743580449018346939831977162706517791447 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 421 for generator 21. -/
def ep_Q1_009_partial_21_0421 : Poly :=
[
  term ((-418960844530549942672982778124028314210885195239119687028202743580449018346939831977162706517791447 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((418960844530549942672982778124028314210885195239119687028202743580449018346939831977162706517791447 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 21. -/
theorem ep_Q1_009_partial_21_0421_valid :
    mulPoly ep_Q1_009_coefficient_21_0421
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0422 : Poly :=
[
  term ((2582599455467343 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 21. -/
def ep_Q1_009_partial_21_0422 : Poly :=
[
  term ((2582599455467343 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2582599455467343 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 21. -/
theorem ep_Q1_009_partial_21_0422_valid :
    mulPoly ep_Q1_009_coefficient_21_0422
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0423 : Poly :=
[
  term ((454488242852461342661409149873377731802816736079849984986178781402981244630627019838379731241366445142051780145191 : Rat) / 525373421039437813665990039228150490376577247161576657687896206975177298026154920109027279863652762061888381120) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 423 for generator 21. -/
def ep_Q1_009_partial_21_0423 : Poly :=
[
  term ((454488242852461342661409149873377731802816736079849984986178781402981244630627019838379731241366445142051780145191 : Rat) / 262686710519718906832995019614075245188288623580788328843948103487588649013077460054513639931826381030944190560) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-454488242852461342661409149873377731802816736079849984986178781402981244630627019838379731241366445142051780145191 : Rat) / 525373421039437813665990039228150490376577247161576657687896206975177298026154920109027279863652762061888381120) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 21. -/
theorem ep_Q1_009_partial_21_0423_valid :
    mulPoly ep_Q1_009_coefficient_21_0423
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0424 : Poly :=
[
  term ((65984762523010368495911 : Rat) / 773982688410528837272) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 21. -/
def ep_Q1_009_partial_21_0424 : Poly :=
[
  term ((65984762523010368495911 : Rat) / 386991344205264418636) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-65984762523010368495911 : Rat) / 773982688410528837272) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 21. -/
theorem ep_Q1_009_partial_21_0424_valid :
    mulPoly ep_Q1_009_coefficient_21_0424
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0425 : Poly :=
[
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 425 for generator 21. -/
def ep_Q1_009_partial_21_0425 : Poly :=
[
  term ((-297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 21. -/
theorem ep_Q1_009_partial_21_0425_valid :
    mulPoly ep_Q1_009_coefficient_21_0425
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0426 : Poly :=
[
  term ((120533733539856 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 426 for generator 21. -/
def ep_Q1_009_partial_21_0426 : Poly :=
[
  term ((241067467079712 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-120533733539856 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 21. -/
theorem ep_Q1_009_partial_21_0426_valid :
    mulPoly ep_Q1_009_coefficient_21_0426
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0427 : Poly :=
[
  term ((-626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 427 for generator 21. -/
def ep_Q1_009_partial_21_0427 : Poly :=
[
  term ((-626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 21. -/
theorem ep_Q1_009_partial_21_0427_valid :
    mulPoly ep_Q1_009_coefficient_21_0427
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0428 : Poly :=
[
  term ((-7041090701215352733746052915268581624352110015565426645277600289960776738557725804581230591019681 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 428 for generator 21. -/
def ep_Q1_009_partial_21_0428 : Poly :=
[
  term ((-7041090701215352733746052915268581624352110015565426645277600289960776738557725804581230591019681 : Rat) / 36328930389336824278057718385604258481254308953661681934979389742041699199998276766869391378253228) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((7041090701215352733746052915268581624352110015565426645277600289960776738557725804581230591019681 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 21. -/
theorem ep_Q1_009_partial_21_0428_valid :
    mulPoly ep_Q1_009_coefficient_21_0428
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0429 : Poly :=
[
  term ((187125879140226 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 429 for generator 21. -/
def ep_Q1_009_partial_21_0429 : Poly :=
[
  term ((374251758280452 : Rat) / 1395206957462413) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-187125879140226 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 21. -/
theorem ep_Q1_009_partial_21_0429_valid :
    mulPoly ep_Q1_009_coefficient_21_0429
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0430 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 430 for generator 21. -/
def ep_Q1_009_partial_21_0430 : Poly :=
[
  term ((-56 : Rat) / 17) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 21. -/
theorem ep_Q1_009_partial_21_0430_valid :
    mulPoly ep_Q1_009_coefficient_21_0430
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0431 : Poly :=
[
  term ((-14 : Rat) / 17) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 431 for generator 21. -/
def ep_Q1_009_partial_21_0431 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((14 : Rat) / 17) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 21. -/
theorem ep_Q1_009_partial_21_0431_valid :
    mulPoly ep_Q1_009_coefficient_21_0431
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0432 : Poly :=
[
  term ((199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 432 for generator 21. -/
def ep_Q1_009_partial_21_0432 : Poly :=
[
  term ((398706805248041339040983560826400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 21. -/
theorem ep_Q1_009_partial_21_0432_valid :
    mulPoly ep_Q1_009_coefficient_21_0432
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0433 : Poly :=
[
  term ((-1847879551912461070919403450986835192855133101810230486947509800627574835519434937356862163683563094077706069919 : Rat) / 43266046438541937596022709112906510972188714472129842397826746456779306896271581656037540694653756875684925504) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 433 for generator 21. -/
def ep_Q1_009_partial_21_0433 : Poly :=
[
  term ((-1847879551912461070919403450986835192855133101810230486947509800627574835519434937356862163683563094077706069919 : Rat) / 21633023219270968798011354556453255486094357236064921198913373228389653448135790828018770347326878437842462752) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((1847879551912461070919403450986835192855133101810230486947509800627574835519434937356862163683563094077706069919 : Rat) / 43266046438541937596022709112906510972188714472129842397826746456779306896271581656037540694653756875684925504) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 21. -/
theorem ep_Q1_009_partial_21_0433_valid :
    mulPoly ep_Q1_009_coefficient_21_0433
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0434 : Poly :=
[
  term ((-440032972317841344889 : Rat) / 318698754051394227112) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 21. -/
def ep_Q1_009_partial_21_0434 : Poly :=
[
  term ((-440032972317841344889 : Rat) / 159349377025697113556) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((440032972317841344889 : Rat) / 318698754051394227112) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 21. -/
theorem ep_Q1_009_partial_21_0434_valid :
    mulPoly ep_Q1_009_coefficient_21_0434
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0435 : Poly :=
[
  term ((-744785810418373791912196441224170107569314491115195 : Rat) / 3959332705966984439490434124004954502435585901212186) [(3, 1), (14, 1), (15, 3)]
]

/-- Partial product 435 for generator 21. -/
def ep_Q1_009_partial_21_0435 : Poly :=
[
  term ((-744785810418373791912196441224170107569314491115195 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((744785810418373791912196441224170107569314491115195 : Rat) / 3959332705966984439490434124004954502435585901212186) [(3, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 21. -/
theorem ep_Q1_009_partial_21_0435_valid :
    mulPoly ep_Q1_009_coefficient_21_0435
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0436 : Poly :=
[
  term ((301334333849640 : Rat) / 1395206957462413) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 436 for generator 21. -/
def ep_Q1_009_partial_21_0436 : Poly :=
[
  term ((602668667699280 : Rat) / 1395206957462413) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-301334333849640 : Rat) / 1395206957462413) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 21. -/
theorem ep_Q1_009_partial_21_0436_valid :
    mulPoly ep_Q1_009_coefficient_21_0436
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0437 : Poly :=
[
  term ((-3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 437 for generator 21. -/
def ep_Q1_009_partial_21_0437 : Poly :=
[
  term ((-3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 21. -/
theorem ep_Q1_009_partial_21_0437_valid :
    mulPoly ep_Q1_009_coefficient_21_0437
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0438 : Poly :=
[
  term ((6256116904540113 : Rat) / 5580827829849652) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 21. -/
def ep_Q1_009_partial_21_0438 : Poly :=
[
  term ((6256116904540113 : Rat) / 2790413914924826) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6256116904540113 : Rat) / 5580827829849652) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 21. -/
theorem ep_Q1_009_partial_21_0438_valid :
    mulPoly ep_Q1_009_coefficient_21_0438
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0439 : Poly :=
[
  term ((-14 : Rat) / 17) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 21. -/
def ep_Q1_009_partial_21_0439 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 17) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 21. -/
theorem ep_Q1_009_partial_21_0439_valid :
    mulPoly ep_Q1_009_coefficient_21_0439
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0440 : Poly :=
[
  term ((-28 : Rat) / 17) [(3, 2), (6, 1), (16, 1)]
]

/-- Partial product 440 for generator 21. -/
def ep_Q1_009_partial_21_0440 : Poly :=
[
  term ((-56 : Rat) / 17) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 21. -/
theorem ep_Q1_009_partial_21_0440_valid :
    mulPoly ep_Q1_009_coefficient_21_0440
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0441 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 441 for generator 21. -/
def ep_Q1_009_partial_21_0441 : Poly :=
[
  term ((56 : Rat) / 17) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 21. -/
theorem ep_Q1_009_partial_21_0441_valid :
    mulPoly ep_Q1_009_coefficient_21_0441
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0442 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 442 for generator 21. -/
def ep_Q1_009_partial_21_0442 : Poly :=
[
  term ((56 : Rat) / 17) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 21. -/
theorem ep_Q1_009_partial_21_0442_valid :
    mulPoly ep_Q1_009_coefficient_21_0442
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0443 : Poly :=
[
  term ((-12208312919005495028097974287870558307272059696250538151476942440213726320689474519305777001687 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 443 for generator 21. -/
def ep_Q1_009_partial_21_0443 : Poly :=
[
  term ((-12208312919005495028097974287870558307272059696250538151476942440213726320689474519305777001687 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12208312919005495028097974287870558307272059696250538151476942440213726320689474519305777001687 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 21. -/
theorem ep_Q1_009_partial_21_0443_valid :
    mulPoly ep_Q1_009_coefficient_21_0443
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0444 : Poly :=
[
  term ((9437071629105945311759954402238640843462418895539861390482070784221180097032273024154875687 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 444 for generator 21. -/
def ep_Q1_009_partial_21_0444 : Poly :=
[
  term ((9437071629105945311759954402238640843462418895539861390482070784221180097032273024154875687 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-9437071629105945311759954402238640843462418895539861390482070784221180097032273024154875687 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(4, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 21. -/
theorem ep_Q1_009_partial_21_0444_valid :
    mulPoly ep_Q1_009_coefficient_21_0444
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0445 : Poly :=
[
  term ((-286955575944304416324777027882378208000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 445 for generator 21. -/
def ep_Q1_009_partial_21_0445 : Poly :=
[
  term ((-573911151888608832649554055764756416000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((286955575944304416324777027882378208000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 21. -/
theorem ep_Q1_009_partial_21_0445_valid :
    mulPoly ep_Q1_009_coefficient_21_0445
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0446 : Poly :=
[
  term ((-226638478942151451041681923751002670607603826704247537757705129358525248515338443897802353896720265 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 446 for generator 21. -/
def ep_Q1_009_partial_21_0446 : Poly :=
[
  term ((-226638478942151451041681923751002670607603826704247537757705129358525248515338443897802353896720265 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((226638478942151451041681923751002670607603826704247537757705129358525248515338443897802353896720265 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 21. -/
theorem ep_Q1_009_partial_21_0446_valid :
    mulPoly ep_Q1_009_coefficient_21_0446
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0447 : Poly :=
[
  term ((-47931505 : Rat) / 3536493) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 21. -/
def ep_Q1_009_partial_21_0447 : Poly :=
[
  term ((-95863010 : Rat) / 3536493) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((47931505 : Rat) / 3536493) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 21. -/
theorem ep_Q1_009_partial_21_0447_valid :
    mulPoly ep_Q1_009_coefficient_21_0447
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0448 : Poly :=
[
  term ((2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 448 for generator 21. -/
def ep_Q1_009_partial_21_0448 : Poly :=
[
  term ((4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 21. -/
theorem ep_Q1_009_partial_21_0448_valid :
    mulPoly ep_Q1_009_coefficient_21_0448
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0449 : Poly :=
[
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 1), (12, 1), (14, 1)]
]

/-- Partial product 449 for generator 21. -/
def ep_Q1_009_partial_21_0449 : Poly :=
[
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 21. -/
theorem ep_Q1_009_partial_21_0449_valid :
    mulPoly ep_Q1_009_coefficient_21_0449
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0450 : Poly :=
[
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 450 for generator 21. -/
def ep_Q1_009_partial_21_0450 : Poly :=
[
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 21. -/
theorem ep_Q1_009_partial_21_0450_valid :
    mulPoly ep_Q1_009_coefficient_21_0450
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0451 : Poly :=
[
  term ((-70553630575362802873051989469135387132045372729227503999255005280232390367019151939643717385877514744926009943 : Rat) / 4534690707777998290148248480471871930350541326606743378105913200393597914464201732338669652313444385861960960) [(4, 1), (8, 1), (14, 1)]
]

/-- Partial product 451 for generator 21. -/
def ep_Q1_009_partial_21_0451 : Poly :=
[
  term ((-70553630575362802873051989469135387132045372729227503999255005280232390367019151939643717385877514744926009943 : Rat) / 2267345353888999145074124240235935965175270663303371689052956600196798957232100866169334826156722192930980480) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((70553630575362802873051989469135387132045372729227503999255005280232390367019151939643717385877514744926009943 : Rat) / 4534690707777998290148248480471871930350541326606743378105913200393597914464201732338669652313444385861960960) [(4, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 21. -/
theorem ep_Q1_009_partial_21_0451_valid :
    mulPoly ep_Q1_009_coefficient_21_0451
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0452 : Poly :=
[
  term ((199859937229045501532184888497098 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 452 for generator 21. -/
def ep_Q1_009_partial_21_0452 : Poly :=
[
  term ((399719874458091003064369776994196 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-199859937229045501532184888497098 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 21. -/
theorem ep_Q1_009_partial_21_0452_valid :
    mulPoly ep_Q1_009_coefficient_21_0452
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0453 : Poly :=
[
  term ((746239 : Rat) / 7072986) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 453 for generator 21. -/
def ep_Q1_009_partial_21_0453 : Poly :=
[
  term ((746239 : Rat) / 3536493) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-746239 : Rat) / 7072986) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 21. -/
theorem ep_Q1_009_partial_21_0453_valid :
    mulPoly ep_Q1_009_coefficient_21_0453
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0454 : Poly :=
[
  term ((190051789765772436358214591511953100451794576524692094650476578003340303964763078812349253433 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 1), (14, 2)]
]

/-- Partial product 454 for generator 21. -/
def ep_Q1_009_partial_21_0454 : Poly :=
[
  term ((190051789765772436358214591511953100451794576524692094650476578003340303964763078812349253433 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (8, 1), (10, 1), (14, 2)],
  term ((-190051789765772436358214591511953100451794576524692094650476578003340303964763078812349253433 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 21. -/
theorem ep_Q1_009_partial_21_0454_valid :
    mulPoly ep_Q1_009_coefficient_21_0454
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0455 : Poly :=
[
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 2), (14, 1)]
]

/-- Partial product 455 for generator 21. -/
def ep_Q1_009_partial_21_0455 : Poly :=
[
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 2), (10, 1), (14, 1)],
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 21. -/
theorem ep_Q1_009_partial_21_0455_valid :
    mulPoly ep_Q1_009_coefficient_21_0455
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0456 : Poly :=
[
  term ((-2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 456 for generator 21. -/
def ep_Q1_009_partial_21_0456 : Poly :=
[
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 21. -/
theorem ep_Q1_009_partial_21_0456_valid :
    mulPoly ep_Q1_009_coefficient_21_0456
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0457 : Poly :=
[
  term ((-47980652569958849492151625873974856596571593493961555483572877415566256373421503152884209354037046708301225357075769 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 457 for generator 21. -/
def ep_Q1_009_partial_21_0457 : Poly :=
[
  term ((-47980652569958849492151625873974856596571593493961555483572877415566256373421503152884209354037046708301225357075769 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((47980652569958849492151625873974856596571593493961555483572877415566256373421503152884209354037046708301225357075769 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 21. -/
theorem ep_Q1_009_partial_21_0457_valid :
    mulPoly ep_Q1_009_coefficient_21_0457
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0458 : Poly :=
[
  term ((10659052567398419317705 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 21. -/
def ep_Q1_009_partial_21_0458 : Poly :=
[
  term ((21318105134796838635410 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10659052567398419317705 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 21. -/
theorem ep_Q1_009_partial_21_0458_valid :
    mulPoly ep_Q1_009_coefficient_21_0458
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0459 : Poly :=
[
  term ((4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 459 for generator 21. -/
def ep_Q1_009_partial_21_0459 : Poly :=
[
  term ((8935143682098101586160721826277644800 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 21. -/
theorem ep_Q1_009_partial_21_0459_valid :
    mulPoly ep_Q1_009_coefficient_21_0459
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0460 : Poly :=
[
  term ((-20494275036114274436686070883600 : Rat) / 3435605717361227895008739306438197) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 460 for generator 21. -/
def ep_Q1_009_partial_21_0460 : Poly :=
[
  term ((-40988550072228548873372141767200 : Rat) / 3435605717361227895008739306438197) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((20494275036114274436686070883600 : Rat) / 3435605717361227895008739306438197) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 21. -/
theorem ep_Q1_009_partial_21_0460_valid :
    mulPoly ep_Q1_009_coefficient_21_0460
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0461 : Poly :=
[
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 461 for generator 21. -/
def ep_Q1_009_partial_21_0461 : Poly :=
[
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 21. -/
theorem ep_Q1_009_partial_21_0461_valid :
    mulPoly ep_Q1_009_coefficient_21_0461
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0462 : Poly :=
[
  term ((-18642804526293784672069167251752748011127330328824154690854505614597604398584739839271325360901 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(4, 1), (12, 1), (14, 1)]
]

/-- Partial product 462 for generator 21. -/
def ep_Q1_009_partial_21_0462 : Poly :=
[
  term ((-18642804526293784672069167251752748011127330328824154690854505614597604398584739839271325360901 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term ((18642804526293784672069167251752748011127330328824154690854505614597604398584739839271325360901 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(4, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 21. -/
theorem ep_Q1_009_partial_21_0462_valid :
    mulPoly ep_Q1_009_coefficient_21_0462
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0463 : Poly :=
[
  term ((-746239 : Rat) / 7072986) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 463 for generator 21. -/
def ep_Q1_009_partial_21_0463 : Poly :=
[
  term ((-746239 : Rat) / 3536493) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((746239 : Rat) / 7072986) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 21. -/
theorem ep_Q1_009_partial_21_0463_valid :
    mulPoly ep_Q1_009_coefficient_21_0463
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0464 : Poly :=
[
  term ((-61482825108342823310058212650800 : Rat) / 3435605717361227895008739306438197) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 464 for generator 21. -/
def ep_Q1_009_partial_21_0464 : Poly :=
[
  term ((-122965650216685646620116425301600 : Rat) / 3435605717361227895008739306438197) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((61482825108342823310058212650800 : Rat) / 3435605717361227895008739306438197) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 21. -/
theorem ep_Q1_009_partial_21_0464_valid :
    mulPoly ep_Q1_009_coefficient_21_0464
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0465 : Poly :=
[
  term ((1168918923423463252870621897488240 : Rat) / 24049240021528595265061175145067379) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 465 for generator 21. -/
def ep_Q1_009_partial_21_0465 : Poly :=
[
  term ((2337837846846926505741243794976480 : Rat) / 24049240021528595265061175145067379) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1168918923423463252870621897488240 : Rat) / 24049240021528595265061175145067379) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 21. -/
theorem ep_Q1_009_partial_21_0465_valid :
    mulPoly ep_Q1_009_coefficient_21_0465
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0466 : Poly :=
[
  term ((-81746890133062580076822906595927852190585018764672609425109700745777672342567655893744673547258363 : Rat) / 289331092229687831675274514205372825816369651570184675797311626238399169445498763766443152760320) [(4, 1), (14, 1)]
]

/-- Partial product 466 for generator 21. -/
def ep_Q1_009_partial_21_0466 : Poly :=
[
  term ((-81746890133062580076822906595927852190585018764672609425109700745777672342567655893744673547258363 : Rat) / 144665546114843915837637257102686412908184825785092337898655813119199584722749381883221576380160) [(4, 1), (10, 1), (14, 1)],
  term ((81746890133062580076822906595927852190585018764672609425109700745777672342567655893744673547258363 : Rat) / 289331092229687831675274514205372825816369651570184675797311626238399169445498763766443152760320) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 21. -/
theorem ep_Q1_009_partial_21_0466_valid :
    mulPoly ep_Q1_009_coefficient_21_0466
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0467 : Poly :=
[
  term ((-46860653807003532897926400429351414731404592587569805143072638863963865386708745722189727083213791 : Rat) / 113023338989047897753957346088546581941680072300280788242158101419685286399994638830260328732343376) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 467 for generator 21. -/
def ep_Q1_009_partial_21_0467 : Poly :=
[
  term ((-46860653807003532897926400429351414731404592587569805143072638863963865386708745722189727083213791 : Rat) / 56511669494523948876978673044273290970840036150140394121079050709842643199997319415130164366171688) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((46860653807003532897926400429351414731404592587569805143072638863963865386708745722189727083213791 : Rat) / 113023338989047897753957346088546581941680072300280788242158101419685286399994638830260328732343376) [(4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 21. -/
theorem ep_Q1_009_partial_21_0467_valid :
    mulPoly ep_Q1_009_coefficient_21_0467
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0468 : Poly :=
[
  term ((752117583837113 : Rat) / 1395206957462413) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 468 for generator 21. -/
def ep_Q1_009_partial_21_0468 : Poly :=
[
  term ((1504235167674226 : Rat) / 1395206957462413) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-752117583837113 : Rat) / 1395206957462413) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 21. -/
theorem ep_Q1_009_partial_21_0468_valid :
    mulPoly ep_Q1_009_coefficient_21_0468
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0469 : Poly :=
[
  term ((-453246439 : Rat) / 14145972) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 469 for generator 21. -/
def ep_Q1_009_partial_21_0469 : Poly :=
[
  term ((-453246439 : Rat) / 7072986) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((453246439 : Rat) / 14145972) [(4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 21. -/
theorem ep_Q1_009_partial_21_0469_valid :
    mulPoly ep_Q1_009_coefficient_21_0469
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0470 : Poly :=
[
  term ((197246627655706171337397527493458374550555774028544986093721166285130601410817574531521961137657 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(4, 1), (14, 2)]
]

/-- Partial product 470 for generator 21. -/
def ep_Q1_009_partial_21_0470 : Poly :=
[
  term ((197246627655706171337397527493458374550555774028544986093721166285130601410817574531521961137657 : Rat) / 108499159586132936878227942827014809681138619338819253423991859839399688542062036412416182285120) [(4, 1), (10, 1), (14, 2)],
  term ((-197246627655706171337397527493458374550555774028544986093721166285130601410817574531521961137657 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(4, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 21. -/
theorem ep_Q1_009_partial_21_0470_valid :
    mulPoly ep_Q1_009_coefficient_21_0470
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0471 : Poly :=
[
  term ((746239 : Rat) / 3536493) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 471 for generator 21. -/
def ep_Q1_009_partial_21_0471 : Poly :=
[
  term ((1492478 : Rat) / 3536493) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-746239 : Rat) / 3536493) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 21. -/
theorem ep_Q1_009_partial_21_0471_valid :
    mulPoly ep_Q1_009_coefficient_21_0471
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0472 : Poly :=
[
  term ((-63592325541751244969347800120183175410776438603556727746026374156734120 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 2), (14, 1)]
]

/-- Partial product 472 for generator 21. -/
def ep_Q1_009_partial_21_0472 : Poly :=
[
  term ((-127184651083502489938695600240366350821552877207113455492052748313468240 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 2), (10, 1), (14, 1)],
  term ((63592325541751244969347800120183175410776438603556727746026374156734120 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 21. -/
theorem ep_Q1_009_partial_21_0472_valid :
    mulPoly ep_Q1_009_coefficient_21_0472
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0473 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 473 for generator 21. -/
def ep_Q1_009_partial_21_0473 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(5, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 21. -/
theorem ep_Q1_009_partial_21_0473_valid :
    mulPoly ep_Q1_009_coefficient_21_0473
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0474 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 474 for generator 21. -/
def ep_Q1_009_partial_21_0474 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 26352598964624767439079257402424330703751718762625763213139493374379635761531299232546528) [(5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 21. -/
theorem ep_Q1_009_partial_21_0474_valid :
    mulPoly ep_Q1_009_coefficient_21_0474
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0475 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

/-- Partial product 475 for generator 21. -/
def ep_Q1_009_partial_21_0475 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 21. -/
theorem ep_Q1_009_partial_21_0475_valid :
    mulPoly ep_Q1_009_coefficient_21_0475
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0476 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(5, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 476 for generator 21. -/
def ep_Q1_009_partial_21_0476 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(5, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 21. -/
theorem ep_Q1_009_partial_21_0476_valid :
    mulPoly ep_Q1_009_coefficient_21_0476
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0477 : Poly :=
[
  term ((-8610450 : Rat) / 1178831) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 477 for generator 21. -/
def ep_Q1_009_partial_21_0477 : Poly :=
[
  term ((-17220900 : Rat) / 1178831) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((8610450 : Rat) / 1178831) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 21. -/
theorem ep_Q1_009_partial_21_0477_valid :
    mulPoly ep_Q1_009_coefficient_21_0477
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0478 : Poly :=
[
  term ((181043689804898855944361880951280 : Rat) / 3435605717361227895008739306438197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 478 for generator 21. -/
def ep_Q1_009_partial_21_0478 : Poly :=
[
  term ((362087379609797711888723761902560 : Rat) / 3435605717361227895008739306438197) [(5, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-181043689804898855944361880951280 : Rat) / 3435605717361227895008739306438197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 21. -/
theorem ep_Q1_009_partial_21_0478_valid :
    mulPoly ep_Q1_009_coefficient_21_0478
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0479 : Poly :=
[
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 479 for generator 21. -/
def ep_Q1_009_partial_21_0479 : Poly :=
[
  term ((1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 21. -/
theorem ep_Q1_009_partial_21_0479_valid :
    mulPoly ep_Q1_009_coefficient_21_0479
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0480 : Poly :=
[
  term ((331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (6, 1), (8, 1), (15, 3)]
]

/-- Partial product 480 for generator 21. -/
def ep_Q1_009_partial_21_0480 : Poly :=
[
  term ((663061628884425303332393711719888 : Rat) / 10306817152083683685026217919314591) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((-331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (6, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 21. -/
theorem ep_Q1_009_partial_21_0480_valid :
    mulPoly ep_Q1_009_coefficient_21_0480
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0481 : Poly :=
[
  term ((345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (9, 1)]
]

/-- Partial product 481 for generator 21. -/
def ep_Q1_009_partial_21_0481 : Poly :=
[
  term ((-345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (9, 1)],
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 21. -/
theorem ep_Q1_009_partial_21_0481_valid :
    mulPoly ep_Q1_009_coefficient_21_0481
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0482 : Poly :=
[
  term ((52545003418557376633456514877673450891546748913189452453065305483861589232615455738578674222287294100341016771 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(5, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 482 for generator 21. -/
def ep_Q1_009_partial_21_0482 : Poly :=
[
  term ((52545003418557376633456514877673450891546748913189452453065305483861589232615455738578674222287294100341016771 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((-52545003418557376633456514877673450891546748913189452453065305483861589232615455738578674222287294100341016771 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(5, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 21. -/
theorem ep_Q1_009_partial_21_0482_valid :
    mulPoly ep_Q1_009_coefficient_21_0482
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0483 : Poly :=
[
  term ((-13176684572567860635356 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 483 for generator 21. -/
def ep_Q1_009_partial_21_0483 : Poly :=
[
  term ((-26353369145135721270712 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((13176684572567860635356 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 21. -/
theorem ep_Q1_009_partial_21_0483_valid :
    mulPoly ep_Q1_009_coefficient_21_0483
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0484 : Poly :=
[
  term ((-287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 484 for generator 21. -/
def ep_Q1_009_partial_21_0484 : Poly :=
[
  term ((-287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 21. -/
theorem ep_Q1_009_partial_21_0484_valid :
    mulPoly ep_Q1_009_coefficient_21_0484
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0485 : Poly :=
[
  term ((-6468810930309754647790 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 485 for generator 21. -/
def ep_Q1_009_partial_21_0485 : Poly :=
[
  term ((-12937621860619509295580 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((6468810930309754647790 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 21. -/
theorem ep_Q1_009_partial_21_0485_valid :
    mulPoly ep_Q1_009_coefficient_21_0485
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0486 : Poly :=
[
  term ((8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 486 for generator 21. -/
def ep_Q1_009_partial_21_0486 : Poly :=
[
  term ((16525372601631853683446885314225629651221401862278511294708192998249500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 21. -/
theorem ep_Q1_009_partial_21_0486_valid :
    mulPoly ep_Q1_009_coefficient_21_0486
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0487 : Poly :=
[
  term ((-13662527383214179844445538086100743311478214528904053100595082897961410243583094108457882414794671 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 487 for generator 21. -/
def ep_Q1_009_partial_21_0487 : Poly :=
[
  term ((-13662527383214179844445538086100743311478214528904053100595082897961410243583094108457882414794671 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((13662527383214179844445538086100743311478214528904053100595082897961410243583094108457882414794671 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 21. -/
theorem ep_Q1_009_partial_21_0487_valid :
    mulPoly ep_Q1_009_coefficient_21_0487
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0488 : Poly :=
[
  term ((-26038423500388 : Rat) / 1395206957462413) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 21. -/
def ep_Q1_009_partial_21_0488 : Poly :=
[
  term ((-52076847000776 : Rat) / 1395206957462413) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((26038423500388 : Rat) / 1395206957462413) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 21. -/
theorem ep_Q1_009_partial_21_0488_valid :
    mulPoly ep_Q1_009_coefficient_21_0488
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0489 : Poly :=
[
  term ((-3908592118291801897668370366759570874593573782845412882823829508541297295 : Rat) / 32060581806077384621938380785633997748570264596550644600139749851793298872) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 489 for generator 21. -/
def ep_Q1_009_partial_21_0489 : Poly :=
[
  term ((-3908592118291801897668370366759570874593573782845412882823829508541297295 : Rat) / 16030290903038692310969190392816998874285132298275322300069874925896649436) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((3908592118291801897668370366759570874593573782845412882823829508541297295 : Rat) / 32060581806077384621938380785633997748570264596550644600139749851793298872) [(5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 21. -/
theorem ep_Q1_009_partial_21_0489_valid :
    mulPoly ep_Q1_009_coefficient_21_0489
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0490 : Poly :=
[
  term ((-17992867346612572260571373646045059568720910884253645544981684373202128292008073112610352028043311 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(5, 1), (6, 1), (15, 3)]
]

/-- Partial product 490 for generator 21. -/
def ep_Q1_009_partial_21_0490 : Poly :=
[
  term ((-17992867346612572260571373646045059568720910884253645544981684373202128292008073112610352028043311 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(5, 1), (6, 1), (10, 1), (15, 3)],
  term ((17992867346612572260571373646045059568720910884253645544981684373202128292008073112610352028043311 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 21. -/
theorem ep_Q1_009_partial_21_0490_valid :
    mulPoly ep_Q1_009_coefficient_21_0490
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0491 : Poly :=
[
  term ((61399975416910 : Rat) / 1395206957462413) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 491 for generator 21. -/
def ep_Q1_009_partial_21_0491 : Poly :=
[
  term ((122799950833820 : Rat) / 1395206957462413) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-61399975416910 : Rat) / 1395206957462413) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 21. -/
theorem ep_Q1_009_partial_21_0491_valid :
    mulPoly ep_Q1_009_coefficient_21_0491
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0492 : Poly :=
[
  term ((-4131343150407963420861721328556407412805350465569627823677048249562375 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (7, 1)]
]

/-- Partial product 492 for generator 21. -/
def ep_Q1_009_partial_21_0492 : Poly :=
[
  term ((4131343150407963420861721328556407412805350465569627823677048249562375 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (7, 1)],
  term ((-8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 21. -/
theorem ep_Q1_009_partial_21_0492_valid :
    mulPoly ep_Q1_009_coefficient_21_0492
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0493 : Poly :=
[
  term ((-345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1)]
]

/-- Partial product 493 for generator 21. -/
def ep_Q1_009_partial_21_0493 : Poly :=
[
  term ((345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 21. -/
theorem ep_Q1_009_partial_21_0493_valid :
    mulPoly ep_Q1_009_coefficient_21_0493
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0494 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 494 for generator 21. -/
def ep_Q1_009_partial_21_0494 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 21. -/
theorem ep_Q1_009_partial_21_0494_valid :
    mulPoly ep_Q1_009_coefficient_21_0494
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0495 : Poly :=
[
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 495 for generator 21. -/
def ep_Q1_009_partial_21_0495 : Poly :=
[
  term ((-1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 21. -/
theorem ep_Q1_009_partial_21_0495_valid :
    mulPoly ep_Q1_009_coefficient_21_0495
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0496 : Poly :=
[
  term ((-331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 496 for generator 21. -/
def ep_Q1_009_partial_21_0496 : Poly :=
[
  term ((-663061628884425303332393711719888 : Rat) / 10306817152083683685026217919314591) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 21. -/
theorem ep_Q1_009_partial_21_0496_valid :
    mulPoly ep_Q1_009_coefficient_21_0496
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0497 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 497 for generator 21. -/
def ep_Q1_009_partial_21_0497 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 21. -/
theorem ep_Q1_009_partial_21_0497_valid :
    mulPoly ep_Q1_009_coefficient_21_0497
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0498 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 498 for generator 21. -/
def ep_Q1_009_partial_21_0498 : Poly :=
[
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 21. -/
theorem ep_Q1_009_partial_21_0498_valid :
    mulPoly ep_Q1_009_coefficient_21_0498
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0499 : Poly :=
[
  term ((287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 499 for generator 21. -/
def ep_Q1_009_partial_21_0499 : Poly :=
[
  term ((287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 21. -/
theorem ep_Q1_009_partial_21_0499_valid :
    mulPoly ep_Q1_009_coefficient_21_0499
        ep_Q1_009_generator_21_0400_0499 =
      ep_Q1_009_partial_21_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_0400_0499 : List Poly :=
[
  ep_Q1_009_partial_21_0400,
  ep_Q1_009_partial_21_0401,
  ep_Q1_009_partial_21_0402,
  ep_Q1_009_partial_21_0403,
  ep_Q1_009_partial_21_0404,
  ep_Q1_009_partial_21_0405,
  ep_Q1_009_partial_21_0406,
  ep_Q1_009_partial_21_0407,
  ep_Q1_009_partial_21_0408,
  ep_Q1_009_partial_21_0409,
  ep_Q1_009_partial_21_0410,
  ep_Q1_009_partial_21_0411,
  ep_Q1_009_partial_21_0412,
  ep_Q1_009_partial_21_0413,
  ep_Q1_009_partial_21_0414,
  ep_Q1_009_partial_21_0415,
  ep_Q1_009_partial_21_0416,
  ep_Q1_009_partial_21_0417,
  ep_Q1_009_partial_21_0418,
  ep_Q1_009_partial_21_0419,
  ep_Q1_009_partial_21_0420,
  ep_Q1_009_partial_21_0421,
  ep_Q1_009_partial_21_0422,
  ep_Q1_009_partial_21_0423,
  ep_Q1_009_partial_21_0424,
  ep_Q1_009_partial_21_0425,
  ep_Q1_009_partial_21_0426,
  ep_Q1_009_partial_21_0427,
  ep_Q1_009_partial_21_0428,
  ep_Q1_009_partial_21_0429,
  ep_Q1_009_partial_21_0430,
  ep_Q1_009_partial_21_0431,
  ep_Q1_009_partial_21_0432,
  ep_Q1_009_partial_21_0433,
  ep_Q1_009_partial_21_0434,
  ep_Q1_009_partial_21_0435,
  ep_Q1_009_partial_21_0436,
  ep_Q1_009_partial_21_0437,
  ep_Q1_009_partial_21_0438,
  ep_Q1_009_partial_21_0439,
  ep_Q1_009_partial_21_0440,
  ep_Q1_009_partial_21_0441,
  ep_Q1_009_partial_21_0442,
  ep_Q1_009_partial_21_0443,
  ep_Q1_009_partial_21_0444,
  ep_Q1_009_partial_21_0445,
  ep_Q1_009_partial_21_0446,
  ep_Q1_009_partial_21_0447,
  ep_Q1_009_partial_21_0448,
  ep_Q1_009_partial_21_0449,
  ep_Q1_009_partial_21_0450,
  ep_Q1_009_partial_21_0451,
  ep_Q1_009_partial_21_0452,
  ep_Q1_009_partial_21_0453,
  ep_Q1_009_partial_21_0454,
  ep_Q1_009_partial_21_0455,
  ep_Q1_009_partial_21_0456,
  ep_Q1_009_partial_21_0457,
  ep_Q1_009_partial_21_0458,
  ep_Q1_009_partial_21_0459,
  ep_Q1_009_partial_21_0460,
  ep_Q1_009_partial_21_0461,
  ep_Q1_009_partial_21_0462,
  ep_Q1_009_partial_21_0463,
  ep_Q1_009_partial_21_0464,
  ep_Q1_009_partial_21_0465,
  ep_Q1_009_partial_21_0466,
  ep_Q1_009_partial_21_0467,
  ep_Q1_009_partial_21_0468,
  ep_Q1_009_partial_21_0469,
  ep_Q1_009_partial_21_0470,
  ep_Q1_009_partial_21_0471,
  ep_Q1_009_partial_21_0472,
  ep_Q1_009_partial_21_0473,
  ep_Q1_009_partial_21_0474,
  ep_Q1_009_partial_21_0475,
  ep_Q1_009_partial_21_0476,
  ep_Q1_009_partial_21_0477,
  ep_Q1_009_partial_21_0478,
  ep_Q1_009_partial_21_0479,
  ep_Q1_009_partial_21_0480,
  ep_Q1_009_partial_21_0481,
  ep_Q1_009_partial_21_0482,
  ep_Q1_009_partial_21_0483,
  ep_Q1_009_partial_21_0484,
  ep_Q1_009_partial_21_0485,
  ep_Q1_009_partial_21_0486,
  ep_Q1_009_partial_21_0487,
  ep_Q1_009_partial_21_0488,
  ep_Q1_009_partial_21_0489,
  ep_Q1_009_partial_21_0490,
  ep_Q1_009_partial_21_0491,
  ep_Q1_009_partial_21_0492,
  ep_Q1_009_partial_21_0493,
  ep_Q1_009_partial_21_0494,
  ep_Q1_009_partial_21_0495,
  ep_Q1_009_partial_21_0496,
  ep_Q1_009_partial_21_0497,
  ep_Q1_009_partial_21_0498,
  ep_Q1_009_partial_21_0499
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_0400_0499 : Poly :=
[
  term ((-10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((109062900059665680812437 : Rat) / 4676338877845046513121) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3587936249724511830154190717720582853866484744027666780730001698881006035962982892029571878382963033256401875357 : Rat) / 1739343229220442414816278828437306211490346292920069655642482776774633701917621580550899351117670252168442145568) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((977650279867417849056 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-765035351744540155571669 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((2444125699668544622640 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-804097384918378324117487 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((237656816706250445897783 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-109062900059665680812437 : Rat) / 9352677755690093026242) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((3587936249724511830154190717720582853866484744027666780730001698881006035962982892029571878382963033256401875357 : Rat) / 3478686458440884829632557656874612422980692585840139311284965553549267403835243161101798702235340504336884291136) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((765035351744540155571669 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 64435912716619042906761984328259552930371576867186803183617351104941348222820553772690014369535875975840519680) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(3, 1), (9, 1), (14, 1)],
  term ((499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1222062849834272311320 : Rat) / 519593208649449612569) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((804097384918378324117487 : Rat) / 37410711022760372104968) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (9, 1), (14, 2)],
  term ((-237656816706250445897783 : Rat) / 18705355511380186052484) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1465194079638237125086147708911579527368986258230021955071188673154175792319 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (10, 1), (12, 1), (13, 1)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1143953170197651318556840683866400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-418960844530549942672982778124028314210885195239119687028202743580449018346939831977162706517791447 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2582599455467343 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((454488242852461342661409149873377731802816736079849984986178781402981244630627019838379731241366445142051780145191 : Rat) / 262686710519718906832995019614075245188288623580788328843948103487588649013077460054513639931826381030944190560) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((65984762523010368495911 : Rat) / 386991344205264418636) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-297914324167349516764878576489668043027725796446078 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((241067467079712 : Rat) / 1395206957462413) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-7041090701215352733746052915268581624352110015565426645277600289960776738557725804581230591019681 : Rat) / 36328930389336824278057718385604258481254308953661681934979389742041699199998276766869391378253228) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((374251758280452 : Rat) / 1395206957462413) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((398706805248041339040983560826400 : Rat) / 24049240021528595265061175145067379) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1847879551912461070919403450986835192855133101810230486947509800627574835519434937356862163683563094077706069919 : Rat) / 21633023219270968798011354556453255486094357236064921198913373228389653448135790828018770347326878437842462752) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-440032972317841344889 : Rat) / 159349377025697113556) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-744785810418373791912196441224170107569314491115195 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (10, 1), (14, 1), (15, 3)],
  term ((602668667699280 : Rat) / 1395206957462413) [(3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 2034420101802862159571232229593838474950241301405054188358845825554335155199903498944685917182180768) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((6256116904540113 : Rat) / 2790413914924826) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1465194079638237125086147708911579527368986258230021955071188673154175792319 : Rat) / 854948848162063589918356820950239939961873722574683856003726662714487969920) [(3, 1), (12, 1), (13, 1)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((374251758280452 : Rat) / 1395206957462413) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((571976585098825659278420341933200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((418960844530549942672982778124028314210885195239119687028202743580449018346939831977162706517791447 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2582599455467343 : Rat) / 2790413914924826) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-454488242852461342661409149873377731802816736079849984986178781402981244630627019838379731241366445142051780145191 : Rat) / 525373421039437813665990039228150490376577247161576657687896206975177298026154920109027279863652762061888381120) [(3, 1), (12, 1), (15, 1)],
  term ((-65984762523010368495911 : Rat) / 773982688410528837272) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(3, 1), (12, 1), (15, 3)],
  term ((-120533733539856 : Rat) / 1395206957462413) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((626645514959974605488232872800594631960943144392431178400185812244868407543 : Rat) / 427474424081031794959178410475119969980936861287341928001863331357243984960) [(3, 1), (13, 1), (14, 1)],
  term ((7041090701215352733746052915268581624352110015565426645277600289960776738557725804581230591019681 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-187125879140226 : Rat) / 1395206957462413) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28 : Rat) / 17) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((14 : Rat) / 17) [(3, 1), (13, 1), (16, 1)],
  term ((-199353402624020669520491780413200 : Rat) / 24049240021528595265061175145067379) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((1847879551912461070919403450986835192855133101810230486947509800627574835519434937356862163683563094077706069919 : Rat) / 43266046438541937596022709112906510972188714472129842397826746456779306896271581656037540694653756875684925504) [(3, 1), (14, 1), (15, 1)],
  term ((440032972317841344889 : Rat) / 318698754051394227112) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((744785810418373791912196441224170107569314491115195 : Rat) / 3959332705966984439490434124004954502435585901212186) [(3, 1), (14, 1), (15, 3)],
  term ((-301334333849640 : Rat) / 1395206957462413) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((3817624489429911942769709814591122835268377223751305553290718383573802487769065256849548229578270949 : Rat) / 4068840203605724319142464459187676949900482602810108376717691651108670310399806997889371834364361536) [(3, 1), (14, 2), (15, 1)],
  term ((-6256116904540113 : Rat) / 5580827829849652) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((14 : Rat) / 17) [(3, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 17) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((28 : Rat) / 17) [(3, 2), (6, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((56 : Rat) / 17) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 2), (12, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 2), (14, 1), (16, 1)],
  term ((-12208312919005495028097974287870558307272059696250538151476942440213726320689474519305777001687 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12208312919005495028097974287870558307272059696250538151476942440213726320689474519305777001687 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((9437071629105945311759954402238640843462418895539861390482070784221180097032273024154875687 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-573911151888608832649554055764756416000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9437071629105945311759954402238640843462418895539861390482070784221180097032273024154875687 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((286955575944304416324777027882378208000 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-226638478942151451041681923751002670607603826704247537757705129358525248515338443897802353896720265 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-95863010 : Rat) / 3536493) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((226638478942151451041681923751002670607603826704247537757705129358525248515338443897802353896720265 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((47931505 : Rat) / 3536493) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-70553630575362802873051989469135387132045372729227503999255005280232390367019151939643717385877514744926009943 : Rat) / 2267345353888999145074124240235935965175270663303371689052956600196798957232100866169334826156722192930980480) [(4, 1), (8, 1), (10, 1), (14, 1)],
  term ((399719874458091003064369776994196 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((746239 : Rat) / 3536493) [(4, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((190051789765772436358214591511953100451794576524692094650476578003340303964763078812349253433 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(4, 1), (8, 1), (10, 1), (14, 2)],
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 1), (12, 1), (14, 1)],
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((70553630575362802873051989469135387132045372729227503999255005280232390367019151939643717385877514744926009943 : Rat) / 4534690707777998290148248480471871930350541326606743378105913200393597914464201732338669652313444385861960960) [(4, 1), (8, 1), (14, 1)],
  term ((-199859937229045501532184888497098 : Rat) / 10306817152083683685026217919314591) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-746239 : Rat) / 7072986) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-190051789765772436358214591511953100451794576524692094650476578003340303964763078812349253433 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 1), (14, 2)],
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(4, 1), (8, 2), (10, 1), (14, 1)],
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(4, 1), (8, 2), (14, 1)],
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-47980652569958849492151625873974856596571593493961555483572877415566256373421503152884209354037046708301225357075769 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((21318105134796838635410 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8935143682098101586160721826277644800 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((47980652569958849492151625873974856596571593493961555483572877415566256373421503152884209354037046708301225357075769 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-10659052567398419317705 : Rat) / 4676338877845046513121) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-40988550072228548873372141767200 : Rat) / 3435605717361227895008739306438197) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18642804526293784672069167251752748011127330328824154690854505614597604398584739839271325360901 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(4, 1), (10, 1), (12, 1), (14, 1)],
  term ((-746239 : Rat) / 3536493) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-122965650216685646620116425301600 : Rat) / 3435605717361227895008739306438197) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((2337837846846926505741243794976480 : Rat) / 24049240021528595265061175145067379) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-81746890133062580076822906595927852190585018764672609425109700745777672342567655893744673547258363 : Rat) / 144665546114843915837637257102686412908184825785092337898655813119199584722749381883221576380160) [(4, 1), (10, 1), (14, 1)],
  term ((-46860653807003532897926400429351414731404592587569805143072638863963865386708745722189727083213791 : Rat) / 56511669494523948876978673044273290970840036150140394121079050709842643199997319415130164366171688) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((1504235167674226 : Rat) / 1395206957462413) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-453246439 : Rat) / 7072986) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((197246627655706171337397527493458374550555774028544986093721166285130601410817574531521961137657 : Rat) / 108499159586132936878227942827014809681138619338819253423991859839399688542062036412416182285120) [(4, 1), (10, 1), (14, 2)],
  term ((1492478 : Rat) / 3536493) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((20494275036114274436686070883600 : Rat) / 3435605717361227895008739306438197) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18642804526293784672069167251752748011127330328824154690854505614597604398584739839271325360901 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(4, 1), (12, 1), (14, 1)],
  term ((746239 : Rat) / 7072986) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((61482825108342823310058212650800 : Rat) / 3435605717361227895008739306438197) [(4, 1), (12, 1), (15, 2)],
  term ((-1168918923423463252870621897488240 : Rat) / 24049240021528595265061175145067379) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((81746890133062580076822906595927852190585018764672609425109700745777672342567655893744673547258363 : Rat) / 289331092229687831675274514205372825816369651570184675797311626238399169445498763766443152760320) [(4, 1), (14, 1)],
  term ((46860653807003532897926400429351414731404592587569805143072638863963865386708745722189727083213791 : Rat) / 113023338989047897753957346088546581941680072300280788242158101419685286399994638830260328732343376) [(4, 1), (14, 1), (15, 2)],
  term ((-752117583837113 : Rat) / 1395206957462413) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((453246439 : Rat) / 14145972) [(4, 1), (14, 1), (16, 1)],
  term ((-197246627655706171337397527493458374550555774028544986093721166285130601410817574531521961137657 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(4, 1), (14, 2)],
  term ((-746239 : Rat) / 3536493) [(4, 1), (14, 2), (16, 1)],
  term ((-127184651083502489938695600240366350821552877207113455492052748313468240 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 2), (10, 1), (14, 1)],
  term ((63592325541751244969347800120183175410776438603556727746026374156734120 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(4, 2), (14, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(5, 1), (6, 1), (7, 1), (8, 1), (10, 1), (15, 2)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 26352598964624767439079257402424330703751718762625763213139493374379635761531299232546528) [(5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(5, 1), (6, 1), (7, 1), (9, 1), (10, 1), (15, 3)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 3)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2)],
  term ((-17220900 : Rat) / 1178831) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(5, 1), (6, 1), (7, 1), (15, 2)],
  term ((8610450 : Rat) / 1178831) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((362087379609797711888723761902560 : Rat) / 3435605717361227895008739306438197) [(5, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((663061628884425303332393711719888 : Rat) / 10306817152083683685026217919314591) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((-181043689804898855944361880951280 : Rat) / 3435605717361227895008739306438197) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (9, 1)],
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (6, 1), (9, 1), (10, 1)],
  term ((52545003418557376633456514877673450891546748913189452453065305483861589232615455738578674222287294100341016771 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1)],
  term ((-26353369145135721270712 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2)],
  term ((-12937621860619509295580 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-52545003418557376633456514877673450891546748913189452453065305483861589232615455738578674222287294100341016771 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(5, 1), (6, 1), (9, 1), (14, 1)],
  term ((13176684572567860635356 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (6, 1), (9, 1), (15, 2)],
  term ((6468810930309754647790 : Rat) / 4676338877845046513121) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((16525372601631853683446885314225629651221401862278511294708192998249500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (6, 1), (10, 1), (11, 1)],
  term ((-13662527383214179844445538086100743311478214528904053100595082897961410243583094108457882414794671 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-52076847000776 : Rat) / 1395206957462413) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3908592118291801897668370366759570874593573782845412882823829508541297295 : Rat) / 16030290903038692310969190392816998874285132298275322300069874925896649436) [(5, 1), (6, 1), (10, 1), (15, 1)],
  term ((-17992867346612572260571373646045059568720910884253645544981684373202128292008073112610352028043311 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(5, 1), (6, 1), (10, 1), (15, 3)],
  term ((122799950833820 : Rat) / 1395206957462413) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (6, 1), (11, 1)],
  term ((13662527383214179844445538086100743311478214528904053100595082897961410243583094108457882414794671 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((26038423500388 : Rat) / 1395206957462413) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((3908592118291801897668370366759570874593573782845412882823829508541297295 : Rat) / 32060581806077384621938380785633997748570264596550644600139749851793298872) [(5, 1), (6, 1), (15, 1)],
  term ((17992867346612572260571373646045059568720910884253645544981684373202128292008073112610352028043311 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(5, 1), (6, 1), (15, 3)],
  term ((-61399975416910 : Rat) / 1395206957462413) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((4131343150407963420861721328556407412805350465569627823677048249562375 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (7, 1)],
  term ((345655710250799606212097351155886086871380988952658861247646370213385375 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1)],
  term ((-691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(5, 1), (7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1382622841003198424848389404623544347485523955810635444990585480853541500 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1)],
  term ((-663061628884425303332393711719888 : Rat) / 10306817152083683685026217919314591) [(5, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((691311420501599212424194702311772173742761977905317722495292740426770750 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(5, 1), (7, 1), (8, 1), (14, 1)],
  term ((331530814442212651666196855859944 : Rat) / 10306817152083683685026217919314591) [(5, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 289961607224785693080428929477167988186672095902340614326278079972236067002692491977105064662911441891282338560) [(5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-287478147341208373645248900936838063880638651466563452475968820561782188589741022918690865955364028970020292209 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-8262686300815926841723442657112814825610700931139255647354096499124750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(5, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 400 through 499. -/
theorem ep_Q1_009_block_21_0400_0499_valid :
    checkProductSumEq ep_Q1_009_partials_21_0400_0499
      ep_Q1_009_block_21_0400_0499 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
