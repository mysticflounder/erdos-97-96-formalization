/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 3:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_03_0400_0499 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0400 : Poly :=
[
  term ((-16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 400 for generator 3. -/
def ep_Q2_024_partial_03_0400 : Poly :=
[
  term ((-16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 3. -/
theorem ep_Q2_024_partial_03_0400_valid :
    mulPoly ep_Q2_024_coefficient_03_0400
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0401 : Poly :=
[
  term ((-4496135166902841 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 3. -/
def ep_Q2_024_partial_03_0401 : Poly :=
[
  term ((-4496135166902841 : Rat) / 2325560442306386) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4496135166902841 : Rat) / 2325560442306386) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4496135166902841 : Rat) / 2325560442306386) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((4496135166902841 : Rat) / 2325560442306386) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 3. -/
theorem ep_Q2_024_partial_03_0401_valid :
    mulPoly ep_Q2_024_coefficient_03_0401
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0402 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 402 for generator 3. -/
def ep_Q2_024_partial_03_0402 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (15, 3)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 3. -/
theorem ep_Q2_024_partial_03_0402_valid :
    mulPoly ep_Q2_024_coefficient_03_0402
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0403 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 403 for generator 3. -/
def ep_Q2_024_partial_03_0403 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 3. -/
theorem ep_Q2_024_partial_03_0403_valid :
    mulPoly ep_Q2_024_coefficient_03_0403
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0404 : Poly :=
[
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 404 for generator 3. -/
def ep_Q2_024_partial_03_0404 : Poly :=
[
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (12, 2), (13, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 3. -/
theorem ep_Q2_024_partial_03_0404_valid :
    mulPoly ep_Q2_024_coefficient_03_0404
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0405 : Poly :=
[
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 405 for generator 3. -/
def ep_Q2_024_partial_03_0405 : Poly :=
[
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 3. -/
theorem ep_Q2_024_partial_03_0405_valid :
    mulPoly ep_Q2_024_coefficient_03_0405
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0406 : Poly :=
[
  term ((933555916338362 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 3. -/
def ep_Q2_024_partial_03_0406 : Poly :=
[
  term ((933555916338362 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((933555916338362 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 3. -/
theorem ep_Q2_024_partial_03_0406_valid :
    mulPoly ep_Q2_024_coefficient_03_0406
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0407 : Poly :=
[
  term ((-23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1)]
]

/-- Partial product 407 for generator 3. -/
def ep_Q2_024_partial_03_0407 : Poly :=
[
  term ((-23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (13, 1)],
  term ((-23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (13, 1)],
  term ((23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (13, 1)],
  term ((23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 3. -/
theorem ep_Q2_024_partial_03_0407_valid :
    mulPoly ep_Q2_024_coefficient_03_0407
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0408 : Poly :=
[
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 408 for generator 3. -/
def ep_Q2_024_partial_03_0408 : Poly :=
[
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 3. -/
theorem ep_Q2_024_partial_03_0408_valid :
    mulPoly ep_Q2_024_coefficient_03_0408
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0409 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 409 for generator 3. -/
def ep_Q2_024_partial_03_0409 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 3. -/
theorem ep_Q2_024_partial_03_0409_valid :
    mulPoly ep_Q2_024_coefficient_03_0409
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0410 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 410 for generator 3. -/
def ep_Q2_024_partial_03_0410 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 3. -/
theorem ep_Q2_024_partial_03_0410_valid :
    mulPoly ep_Q2_024_coefficient_03_0410
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0411 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 411 for generator 3. -/
def ep_Q2_024_partial_03_0411 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 3. -/
theorem ep_Q2_024_partial_03_0411_valid :
    mulPoly ep_Q2_024_coefficient_03_0411
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0412 : Poly :=
[
  term ((59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 412 for generator 3. -/
def ep_Q2_024_partial_03_0412 : Poly :=
[
  term ((59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 3. -/
theorem ep_Q2_024_partial_03_0412_valid :
    mulPoly ep_Q2_024_coefficient_03_0412
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0413 : Poly :=
[
  term ((-1082535559364413 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 3. -/
def ep_Q2_024_partial_03_0413 : Poly :=
[
  term ((-1082535559364413 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 3. -/
theorem ep_Q2_024_partial_03_0413_valid :
    mulPoly ep_Q2_024_coefficient_03_0413
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0414 : Poly :=
[
  term ((-156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (15, 1)]
]

/-- Partial product 414 for generator 3. -/
def ep_Q2_024_partial_03_0414 : Poly :=
[
  term ((-156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (7, 1), (15, 1)],
  term ((-156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (7, 1), (15, 1)],
  term ((156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 2), (15, 1)],
  term ((156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 3. -/
theorem ep_Q2_024_partial_03_0414_valid :
    mulPoly ep_Q2_024_coefficient_03_0414
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0415 : Poly :=
[
  term ((6121702090615831 : Rat) / 1162780221153193) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 3. -/
def ep_Q2_024_partial_03_0415 : Poly :=
[
  term ((6121702090615831 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((6121702090615831 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-6121702090615831 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6121702090615831 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 3. -/
theorem ep_Q2_024_partial_03_0415_valid :
    mulPoly ep_Q2_024_coefficient_03_0415
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0416 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (15, 3)]
]

/-- Partial product 416 for generator 3. -/
def ep_Q2_024_partial_03_0416 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (15, 3)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (15, 3)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 2), (15, 3)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 3. -/
theorem ep_Q2_024_partial_03_0416_valid :
    mulPoly ep_Q2_024_coefficient_03_0416
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0417 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 417 for generator 3. -/
def ep_Q2_024_partial_03_0417 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 3. -/
theorem ep_Q2_024_partial_03_0417_valid :
    mulPoly ep_Q2_024_coefficient_03_0417
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0418 : Poly :=
[
  term ((459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(8, 1)]
]

/-- Partial product 418 for generator 3. -/
def ep_Q2_024_partial_03_0418 : Poly :=
[
  term ((459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1)],
  term ((459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1)],
  term ((-459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)],
  term ((-459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 3. -/
theorem ep_Q2_024_partial_03_0418_valid :
    mulPoly ep_Q2_024_coefficient_03_0418
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0419 : Poly :=
[
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 419 for generator 3. -/
def ep_Q2_024_partial_03_0419 : Poly :=
[
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 3), (11, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 3. -/
theorem ep_Q2_024_partial_03_0419_valid :
    mulPoly ep_Q2_024_coefficient_03_0419
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0420 : Poly :=
[
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 420 for generator 3. -/
def ep_Q2_024_partial_03_0420 : Poly :=
[
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (13, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 3. -/
theorem ep_Q2_024_partial_03_0420_valid :
    mulPoly ep_Q2_024_coefficient_03_0420
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0421 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 421 for generator 3. -/
def ep_Q2_024_partial_03_0421 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 3), (15, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 3. -/
theorem ep_Q2_024_partial_03_0421_valid :
    mulPoly ep_Q2_024_coefficient_03_0421
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0422 : Poly :=
[
  term ((-373787112386234 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 3. -/
def ep_Q2_024_partial_03_0422 : Poly :=
[
  term ((-373787112386234 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((373787112386234 : Rat) / 1162780221153193) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((373787112386234 : Rat) / 1162780221153193) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 3. -/
theorem ep_Q2_024_partial_03_0422_valid :
    mulPoly ep_Q2_024_coefficient_03_0422
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0423 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2)]
]

/-- Partial product 423 for generator 3. -/
def ep_Q2_024_partial_03_0423 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 2)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 2)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 4)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 3. -/
theorem ep_Q2_024_partial_03_0423_valid :
    mulPoly ep_Q2_024_coefficient_03_0423
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0424 : Poly :=
[
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 424 for generator 3. -/
def ep_Q2_024_partial_03_0424 : Poly :=
[
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 3. -/
theorem ep_Q2_024_partial_03_0424_valid :
    mulPoly ep_Q2_024_coefficient_03_0424
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0425 : Poly :=
[
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 425 for generator 3. -/
def ep_Q2_024_partial_03_0425 : Poly :=
[
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 3. -/
theorem ep_Q2_024_partial_03_0425_valid :
    mulPoly ep_Q2_024_coefficient_03_0425
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0426 : Poly :=
[
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 426 for generator 3. -/
def ep_Q2_024_partial_03_0426 : Poly :=
[
  term ((64632555285718 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 3. -/
theorem ep_Q2_024_partial_03_0426_valid :
    mulPoly ep_Q2_024_coefficient_03_0426
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0427 : Poly :=
[
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 427 for generator 3. -/
def ep_Q2_024_partial_03_0427 : Poly :=
[
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 3. -/
theorem ep_Q2_024_partial_03_0427_valid :
    mulPoly ep_Q2_024_coefficient_03_0427
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0428 : Poly :=
[
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 428 for generator 3. -/
def ep_Q2_024_partial_03_0428 : Poly :=
[
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 3. -/
theorem ep_Q2_024_partial_03_0428_valid :
    mulPoly ep_Q2_024_coefficient_03_0428
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0429 : Poly :=
[
  term ((-2650870815205527 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 3. -/
def ep_Q2_024_partial_03_0429 : Poly :=
[
  term ((-2650870815205527 : Rat) / 4651120884612772) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2650870815205527 : Rat) / 4651120884612772) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2650870815205527 : Rat) / 4651120884612772) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 3. -/
theorem ep_Q2_024_partial_03_0429_valid :
    mulPoly ep_Q2_024_coefficient_03_0429
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0430 : Poly :=
[
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 430 for generator 3. -/
def ep_Q2_024_partial_03_0430 : Poly :=
[
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 3. -/
theorem ep_Q2_024_partial_03_0430_valid :
    mulPoly ep_Q2_024_coefficient_03_0430
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0431 : Poly :=
[
  term ((-37665296397180 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 3. -/
def ep_Q2_024_partial_03_0431 : Poly :=
[
  term ((-37665296397180 : Rat) / 1162780221153193) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 3. -/
theorem ep_Q2_024_partial_03_0431_valid :
    mulPoly ep_Q2_024_coefficient_03_0431
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0432 : Poly :=
[
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

/-- Partial product 432 for generator 3. -/
def ep_Q2_024_partial_03_0432 : Poly :=
[
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (13, 2)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (13, 2)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 3. -/
theorem ep_Q2_024_partial_03_0432_valid :
    mulPoly ep_Q2_024_coefficient_03_0432
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0433 : Poly :=
[
  term ((-426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)]
]

/-- Partial product 433 for generator 3. -/
def ep_Q2_024_partial_03_0433 : Poly :=
[
  term ((-426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (14, 1)],
  term ((-426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (14, 1)],
  term ((426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (14, 1)],
  term ((426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 3. -/
theorem ep_Q2_024_partial_03_0433_valid :
    mulPoly ep_Q2_024_coefficient_03_0433
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0434 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (15, 2)]
]

/-- Partial product 434 for generator 3. -/
def ep_Q2_024_partial_03_0434 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 2), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 3. -/
theorem ep_Q2_024_partial_03_0434_valid :
    mulPoly ep_Q2_024_coefficient_03_0434
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0435 : Poly :=
[
  term ((-3791843580843907 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 435 for generator 3. -/
def ep_Q2_024_partial_03_0435 : Poly :=
[
  term ((-3791843580843907 : Rat) / 4651120884612772) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 4651120884612772) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 4651120884612772) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 3. -/
theorem ep_Q2_024_partial_03_0435_valid :
    mulPoly ep_Q2_024_coefficient_03_0435
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0436 : Poly :=
[
  term ((323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1)]
]

/-- Partial product 436 for generator 3. -/
def ep_Q2_024_partial_03_0436 : Poly :=
[
  term ((323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((-323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)],
  term ((-323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 3. -/
theorem ep_Q2_024_partial_03_0436_valid :
    mulPoly ep_Q2_024_coefficient_03_0436
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0437 : Poly :=
[
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 437 for generator 3. -/
def ep_Q2_024_partial_03_0437 : Poly :=
[
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 3. -/
theorem ep_Q2_024_partial_03_0437_valid :
    mulPoly ep_Q2_024_coefficient_03_0437
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0438 : Poly :=
[
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 438 for generator 3. -/
def ep_Q2_024_partial_03_0438 : Poly :=
[
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 3. -/
theorem ep_Q2_024_partial_03_0438_valid :
    mulPoly ep_Q2_024_coefficient_03_0438
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0439 : Poly :=
[
  term ((672243631978108 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 3. -/
def ep_Q2_024_partial_03_0439 : Poly :=
[
  term ((672243631978108 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 3. -/
theorem ep_Q2_024_partial_03_0439_valid :
    mulPoly ep_Q2_024_coefficient_03_0439
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0440 : Poly :=
[
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 440 for generator 3. -/
def ep_Q2_024_partial_03_0440 : Poly :=
[
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 3. -/
theorem ep_Q2_024_partial_03_0440_valid :
    mulPoly ep_Q2_024_coefficient_03_0440
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0441 : Poly :=
[
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 441 for generator 3. -/
def ep_Q2_024_partial_03_0441 : Poly :=
[
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 3. -/
theorem ep_Q2_024_partial_03_0441_valid :
    mulPoly ep_Q2_024_coefficient_03_0441
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0442 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 442 for generator 3. -/
def ep_Q2_024_partial_03_0442 : Poly :=
[
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 3. -/
theorem ep_Q2_024_partial_03_0442_valid :
    mulPoly ep_Q2_024_coefficient_03_0442
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0443 : Poly :=
[
  term ((-3791843580843907 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 443 for generator 3. -/
def ep_Q2_024_partial_03_0443 : Poly :=
[
  term ((-3791843580843907 : Rat) / 2325560442306386) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 3. -/
theorem ep_Q2_024_partial_03_0443_valid :
    mulPoly ep_Q2_024_coefficient_03_0443
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0444 : Poly :=
[
  term ((-67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 444 for generator 3. -/
def ep_Q2_024_partial_03_0444 : Poly :=
[
  term ((-67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 3. -/
theorem ep_Q2_024_partial_03_0444_valid :
    mulPoly ep_Q2_024_coefficient_03_0444
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0445 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 445 for generator 3. -/
def ep_Q2_024_partial_03_0445 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 3. -/
theorem ep_Q2_024_partial_03_0445_valid :
    mulPoly ep_Q2_024_coefficient_03_0445
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0446 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 446 for generator 3. -/
def ep_Q2_024_partial_03_0446 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 3. -/
theorem ep_Q2_024_partial_03_0446_valid :
    mulPoly ep_Q2_024_coefficient_03_0446
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0447 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 3. -/
def ep_Q2_024_partial_03_0447 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 3. -/
theorem ep_Q2_024_partial_03_0447_valid :
    mulPoly ep_Q2_024_coefficient_03_0447
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0448 : Poly :=
[
  term ((-1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 448 for generator 3. -/
def ep_Q2_024_partial_03_0448 : Poly :=
[
  term ((-1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 3. -/
theorem ep_Q2_024_partial_03_0448_valid :
    mulPoly ep_Q2_024_coefficient_03_0448
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0449 : Poly :=
[
  term ((60674568140088 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 3. -/
def ep_Q2_024_partial_03_0449 : Poly :=
[
  term ((60674568140088 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60674568140088 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60674568140088 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60674568140088 : Rat) / 1162780221153193) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 3. -/
theorem ep_Q2_024_partial_03_0449_valid :
    mulPoly ep_Q2_024_coefficient_03_0449
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0450 : Poly :=
[
  term ((-121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (13, 1)]
]

/-- Partial product 450 for generator 3. -/
def ep_Q2_024_partial_03_0450 : Poly :=
[
  term ((-121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (13, 1)],
  term ((-121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (13, 1)],
  term ((121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (13, 1)],
  term ((121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 3. -/
theorem ep_Q2_024_partial_03_0450_valid :
    mulPoly ep_Q2_024_coefficient_03_0450
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0451 : Poly :=
[
  term ((-1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 451 for generator 3. -/
def ep_Q2_024_partial_03_0451 : Poly :=
[
  term ((-1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 3. -/
theorem ep_Q2_024_partial_03_0451_valid :
    mulPoly ep_Q2_024_coefficient_03_0451
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0452 : Poly :=
[
  term ((-16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 452 for generator 3. -/
def ep_Q2_024_partial_03_0452 : Poly :=
[
  term ((-16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 3. -/
theorem ep_Q2_024_partial_03_0452_valid :
    mulPoly ep_Q2_024_coefficient_03_0452
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0453 : Poly :=
[
  term ((6815444218987687 : Rat) / 1162780221153193) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 3. -/
def ep_Q2_024_partial_03_0453 : Poly :=
[
  term ((6815444218987687 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6815444218987687 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6815444218987687 : Rat) / 1162780221153193) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6815444218987687 : Rat) / 1162780221153193) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 3. -/
theorem ep_Q2_024_partial_03_0453_valid :
    mulPoly ep_Q2_024_coefficient_03_0453
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0454 : Poly :=
[
  term ((138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(9, 1), (15, 1)]
]

/-- Partial product 454 for generator 3. -/
def ep_Q2_024_partial_03_0454 : Poly :=
[
  term ((138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(2, 2), (9, 1), (15, 1)],
  term ((138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(3, 2), (9, 1), (15, 1)],
  term ((-138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(8, 2), (9, 1), (15, 1)],
  term ((-138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 3. -/
theorem ep_Q2_024_partial_03_0454_valid :
    mulPoly ep_Q2_024_coefficient_03_0454
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0455 : Poly :=
[
  term ((-12926604740289595 : Rat) / 9302241769225544) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 455 for generator 3. -/
def ep_Q2_024_partial_03_0455 : Poly :=
[
  term ((-12926604740289595 : Rat) / 9302241769225544) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12926604740289595 : Rat) / 9302241769225544) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((12926604740289595 : Rat) / 9302241769225544) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((12926604740289595 : Rat) / 9302241769225544) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 3. -/
theorem ep_Q2_024_partial_03_0455_valid :
    mulPoly ep_Q2_024_coefficient_03_0455
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0456 : Poly :=
[
  term ((690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 456 for generator 3. -/
def ep_Q2_024_partial_03_0456 : Poly :=
[
  term ((690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 2)],
  term ((690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2)],
  term ((-690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2)],
  term ((-690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 3. -/
theorem ep_Q2_024_partial_03_0456_valid :
    mulPoly ep_Q2_024_coefficient_03_0456
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0457 : Poly :=
[
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 457 for generator 3. -/
def ep_Q2_024_partial_03_0457 : Poly :=
[
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 3. -/
theorem ep_Q2_024_partial_03_0457_valid :
    mulPoly ep_Q2_024_coefficient_03_0457
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0458 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 458 for generator 3. -/
def ep_Q2_024_partial_03_0458 : Poly :=
[
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 3. -/
theorem ep_Q2_024_partial_03_0458_valid :
    mulPoly ep_Q2_024_coefficient_03_0458
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0459 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 3. -/
def ep_Q2_024_partial_03_0459 : Poly :=
[
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 3. -/
theorem ep_Q2_024_partial_03_0459_valid :
    mulPoly ep_Q2_024_coefficient_03_0459
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0460 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1)]
]

/-- Partial product 460 for generator 3. -/
def ep_Q2_024_partial_03_0460 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (12, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 3. -/
theorem ep_Q2_024_partial_03_0460_valid :
    mulPoly ep_Q2_024_coefficient_03_0460
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0461 : Poly :=
[
  term ((73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (14, 1)]
]

/-- Partial product 461 for generator 3. -/
def ep_Q2_024_partial_03_0461 : Poly :=
[
  term ((73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2), (14, 1)],
  term ((73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 2), (14, 1)],
  term ((-73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 2), (14, 1)],
  term ((-73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(9, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 3. -/
theorem ep_Q2_024_partial_03_0461_valid :
    mulPoly ep_Q2_024_coefficient_03_0461
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0462 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1)]
]

/-- Partial product 462 for generator 3. -/
def ep_Q2_024_partial_03_0462 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 3), (11, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 5), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 3. -/
theorem ep_Q2_024_partial_03_0462_valid :
    mulPoly ep_Q2_024_coefficient_03_0462
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0463 : Poly :=
[
  term ((1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 463 for generator 3. -/
def ep_Q2_024_partial_03_0463 : Poly :=
[
  term ((1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 3. -/
theorem ep_Q2_024_partial_03_0463_valid :
    mulPoly ep_Q2_024_coefficient_03_0463
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0464 : Poly :=
[
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 464 for generator 3. -/
def ep_Q2_024_partial_03_0464 : Poly :=
[
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 3. -/
theorem ep_Q2_024_partial_03_0464_valid :
    mulPoly ep_Q2_024_coefficient_03_0464
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0465 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 465 for generator 3. -/
def ep_Q2_024_partial_03_0465 : Poly :=
[
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 3. -/
theorem ep_Q2_024_partial_03_0465_valid :
    mulPoly ep_Q2_024_coefficient_03_0465
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0466 : Poly :=
[
  term ((-2163325299394758 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 3. -/
def ep_Q2_024_partial_03_0466 : Poly :=
[
  term ((-2163325299394758 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 3. -/
theorem ep_Q2_024_partial_03_0466_valid :
    mulPoly ep_Q2_024_coefficient_03_0466
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0467 : Poly :=
[
  term ((369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 467 for generator 3. -/
def ep_Q2_024_partial_03_0467 : Poly :=
[
  term ((369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 3. -/
theorem ep_Q2_024_partial_03_0467_valid :
    mulPoly ep_Q2_024_coefficient_03_0467
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0468 : Poly :=
[
  term ((9149829816626653 : Rat) / 4651120884612772) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 468 for generator 3. -/
def ep_Q2_024_partial_03_0468 : Poly :=
[
  term ((9149829816626653 : Rat) / 4651120884612772) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9149829816626653 : Rat) / 4651120884612772) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9149829816626653 : Rat) / 4651120884612772) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9149829816626653 : Rat) / 4651120884612772) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 3. -/
theorem ep_Q2_024_partial_03_0468_valid :
    mulPoly ep_Q2_024_coefficient_03_0468
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0469 : Poly :=
[
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 469 for generator 3. -/
def ep_Q2_024_partial_03_0469 : Poly :=
[
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 2), (13, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 3. -/
theorem ep_Q2_024_partial_03_0469_valid :
    mulPoly ep_Q2_024_coefficient_03_0469
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0470 : Poly :=
[
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 470 for generator 3. -/
def ep_Q2_024_partial_03_0470 : Poly :=
[
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 3. -/
theorem ep_Q2_024_partial_03_0470_valid :
    mulPoly ep_Q2_024_coefficient_03_0470
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0471 : Poly :=
[
  term ((-64632555285718 : Rat) / 1162780221153193) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 3. -/
def ep_Q2_024_partial_03_0471 : Poly :=
[
  term ((-64632555285718 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 3. -/
theorem ep_Q2_024_partial_03_0471_valid :
    mulPoly ep_Q2_024_coefficient_03_0471
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0472 : Poly :=
[
  term ((-2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1)]
]

/-- Partial product 472 for generator 3. -/
def ep_Q2_024_partial_03_0472 : Poly :=
[
  term ((-2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (11, 1), (13, 1)],
  term ((-2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (11, 1), (13, 1)],
  term ((2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (11, 1), (13, 1)],
  term ((2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 3. -/
theorem ep_Q2_024_partial_03_0472_valid :
    mulPoly ep_Q2_024_coefficient_03_0472
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0473 : Poly :=
[
  term ((-2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 473 for generator 3. -/
def ep_Q2_024_partial_03_0473 : Poly :=
[
  term ((-2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 3. -/
theorem ep_Q2_024_partial_03_0473_valid :
    mulPoly ep_Q2_024_coefficient_03_0473
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0474 : Poly :=
[
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 474 for generator 3. -/
def ep_Q2_024_partial_03_0474 : Poly :=
[
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 3. -/
theorem ep_Q2_024_partial_03_0474_valid :
    mulPoly ep_Q2_024_coefficient_03_0474
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0475 : Poly :=
[
  term ((-12880146370366127 : Rat) / 2325560442306386) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 475 for generator 3. -/
def ep_Q2_024_partial_03_0475 : Poly :=
[
  term ((-12880146370366127 : Rat) / 2325560442306386) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12880146370366127 : Rat) / 2325560442306386) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((12880146370366127 : Rat) / 2325560442306386) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 3. -/
theorem ep_Q2_024_partial_03_0475_valid :
    mulPoly ep_Q2_024_coefficient_03_0475
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0476 : Poly :=
[
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 476 for generator 3. -/
def ep_Q2_024_partial_03_0476 : Poly :=
[
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 3. -/
theorem ep_Q2_024_partial_03_0476_valid :
    mulPoly ep_Q2_024_coefficient_03_0476
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0477 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 3. -/
def ep_Q2_024_partial_03_0477 : Poly :=
[
  term ((75330592794360 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 3. -/
theorem ep_Q2_024_partial_03_0477_valid :
    mulPoly ep_Q2_024_coefficient_03_0477
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0478 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (13, 3)]
]

/-- Partial product 478 for generator 3. -/
def ep_Q2_024_partial_03_0478 : Poly :=
[
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 3)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 3)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 3. -/
theorem ep_Q2_024_partial_03_0478_valid :
    mulPoly ep_Q2_024_coefficient_03_0478
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0479 : Poly :=
[
  term ((-29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 479 for generator 3. -/
def ep_Q2_024_partial_03_0479 : Poly :=
[
  term ((-29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 3. -/
theorem ep_Q2_024_partial_03_0479_valid :
    mulPoly ep_Q2_024_coefficient_03_0479
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0480 : Poly :=
[
  term ((-4398958063413877 : Rat) / 2325560442306386) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 3. -/
def ep_Q2_024_partial_03_0480 : Poly :=
[
  term ((-4398958063413877 : Rat) / 2325560442306386) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4398958063413877 : Rat) / 2325560442306386) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4398958063413877 : Rat) / 2325560442306386) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4398958063413877 : Rat) / 2325560442306386) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 3. -/
theorem ep_Q2_024_partial_03_0480_valid :
    mulPoly ep_Q2_024_coefficient_03_0480
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0481 : Poly :=
[
  term ((182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(11, 1), (15, 1)]
]

/-- Partial product 481 for generator 3. -/
def ep_Q2_024_partial_03_0481 : Poly :=
[
  term ((182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (11, 1), (15, 1)],
  term ((182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (11, 1), (15, 1)],
  term ((-182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 2), (11, 1), (15, 1)],
  term ((-182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 3. -/
theorem ep_Q2_024_partial_03_0481_valid :
    mulPoly ep_Q2_024_coefficient_03_0481
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0482 : Poly :=
[
  term ((-15599346427971429 : Rat) / 2325560442306386) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 482 for generator 3. -/
def ep_Q2_024_partial_03_0482 : Poly :=
[
  term ((-15599346427971429 : Rat) / 2325560442306386) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15599346427971429 : Rat) / 2325560442306386) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((15599346427971429 : Rat) / 2325560442306386) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((15599346427971429 : Rat) / 2325560442306386) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 3. -/
theorem ep_Q2_024_partial_03_0482_valid :
    mulPoly ep_Q2_024_coefficient_03_0482
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0483 : Poly :=
[
  term ((4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(12, 1)]
]

/-- Partial product 483 for generator 3. -/
def ep_Q2_024_partial_03_0483 : Poly :=
[
  term ((4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (12, 1)],
  term ((4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (12, 1)],
  term ((-4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(8, 2), (12, 1)],
  term ((-4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 3. -/
theorem ep_Q2_024_partial_03_0483_valid :
    mulPoly ep_Q2_024_coefficient_03_0483
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0484 : Poly :=
[
  term ((110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 484 for generator 3. -/
def ep_Q2_024_partial_03_0484 : Poly :=
[
  term ((110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 3. -/
theorem ep_Q2_024_partial_03_0484_valid :
    mulPoly ep_Q2_024_coefficient_03_0484
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0485 : Poly :=
[
  term ((-6741388318767089 : Rat) / 2325560442306386) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 485 for generator 3. -/
def ep_Q2_024_partial_03_0485 : Poly :=
[
  term ((-6741388318767089 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 3. -/
theorem ep_Q2_024_partial_03_0485_valid :
    mulPoly ep_Q2_024_coefficient_03_0485
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0486 : Poly :=
[
  term ((-59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 486 for generator 3. -/
def ep_Q2_024_partial_03_0486 : Poly :=
[
  term ((-59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 3. -/
theorem ep_Q2_024_partial_03_0486_valid :
    mulPoly ep_Q2_024_coefficient_03_0486
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0487 : Poly :=
[
  term ((5362672684393763 : Rat) / 2325560442306386) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 487 for generator 3. -/
def ep_Q2_024_partial_03_0487 : Poly :=
[
  term ((5362672684393763 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5362672684393763 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5362672684393763 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5362672684393763 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 3. -/
theorem ep_Q2_024_partial_03_0487_valid :
    mulPoly ep_Q2_024_coefficient_03_0487
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0488 : Poly :=
[
  term ((379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2)]
]

/-- Partial product 488 for generator 3. -/
def ep_Q2_024_partial_03_0488 : Poly :=
[
  term ((379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((-379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((-379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 3. -/
theorem ep_Q2_024_partial_03_0488_valid :
    mulPoly ep_Q2_024_coefficient_03_0488
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0489 : Poly :=
[
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 489 for generator 3. -/
def ep_Q2_024_partial_03_0489 : Poly :=
[
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 3. -/
theorem ep_Q2_024_partial_03_0489_valid :
    mulPoly ep_Q2_024_coefficient_03_0489
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0490 : Poly :=
[
  term ((-58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (14, 1)]
]

/-- Partial product 490 for generator 3. -/
def ep_Q2_024_partial_03_0490 : Poly :=
[
  term ((-58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 1), (14, 1)],
  term ((-58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (14, 1)],
  term ((58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (14, 1)],
  term ((58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 3. -/
theorem ep_Q2_024_partial_03_0490_valid :
    mulPoly ep_Q2_024_coefficient_03_0490
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0491 : Poly :=
[
  term ((-12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 491 for generator 3. -/
def ep_Q2_024_partial_03_0491 : Poly :=
[
  term ((-12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((-12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 3. -/
theorem ep_Q2_024_partial_03_0491_valid :
    mulPoly ep_Q2_024_coefficient_03_0491
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0492 : Poly :=
[
  term ((13619159548665671 : Rat) / 2325560442306386) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 492 for generator 3. -/
def ep_Q2_024_partial_03_0492 : Poly :=
[
  term ((13619159548665671 : Rat) / 2325560442306386) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13619159548665671 : Rat) / 2325560442306386) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13619159548665671 : Rat) / 2325560442306386) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13619159548665671 : Rat) / 2325560442306386) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 3. -/
theorem ep_Q2_024_partial_03_0492_valid :
    mulPoly ep_Q2_024_coefficient_03_0492
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0493 : Poly :=
[
  term ((-276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (15, 2)]
]

/-- Partial product 493 for generator 3. -/
def ep_Q2_024_partial_03_0493 : Poly :=
[
  term ((-276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (12, 1), (15, 2)],
  term ((-276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (12, 1), (15, 2)],
  term ((276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (12, 1), (15, 2)],
  term ((276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 3. -/
theorem ep_Q2_024_partial_03_0493_valid :
    mulPoly ep_Q2_024_coefficient_03_0493
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0494 : Poly :=
[
  term ((-22683792249937645 : Rat) / 13953362653838316) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 494 for generator 3. -/
def ep_Q2_024_partial_03_0494 : Poly :=
[
  term ((-22683792249937645 : Rat) / 13953362653838316) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-22683792249937645 : Rat) / 13953362653838316) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((22683792249937645 : Rat) / 13953362653838316) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((22683792249937645 : Rat) / 13953362653838316) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 3. -/
theorem ep_Q2_024_partial_03_0494_valid :
    mulPoly ep_Q2_024_coefficient_03_0494
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0495 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 495 for generator 3. -/
def ep_Q2_024_partial_03_0495 : Poly :=
[
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (12, 2), (13, 1), (15, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 3. -/
theorem ep_Q2_024_partial_03_0495_valid :
    mulPoly ep_Q2_024_coefficient_03_0495
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0496 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(12, 2), (15, 2)]
]

/-- Partial product 496 for generator 3. -/
def ep_Q2_024_partial_03_0496 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (12, 2), (15, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 2), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 3. -/
theorem ep_Q2_024_partial_03_0496_valid :
    mulPoly ep_Q2_024_coefficient_03_0496
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0497 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 497 for generator 3. -/
def ep_Q2_024_partial_03_0497 : Poly :=
[
  term ((-1086154201315805 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 3. -/
theorem ep_Q2_024_partial_03_0497_valid :
    mulPoly ep_Q2_024_coefficient_03_0497
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0498 : Poly :=
[
  term ((-3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 498 for generator 3. -/
def ep_Q2_024_partial_03_0498 : Poly :=
[
  term ((-3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 3. -/
theorem ep_Q2_024_partial_03_0498_valid :
    mulPoly ep_Q2_024_coefficient_03_0498
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 3. -/
def ep_Q2_024_coefficient_03_0499 : Poly :=
[
  term ((39707264479329403 : Rat) / 13953362653838316) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 3. -/
def ep_Q2_024_partial_03_0499 : Poly :=
[
  term ((39707264479329403 : Rat) / 13953362653838316) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39707264479329403 : Rat) / 13953362653838316) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39707264479329403 : Rat) / 13953362653838316) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39707264479329403 : Rat) / 13953362653838316) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 3. -/
theorem ep_Q2_024_partial_03_0499_valid :
    mulPoly ep_Q2_024_coefficient_03_0499
        ep_Q2_024_generator_03_0400_0499 =
      ep_Q2_024_partial_03_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_03_0400_0499 : List Poly :=
[
  ep_Q2_024_partial_03_0400,
  ep_Q2_024_partial_03_0401,
  ep_Q2_024_partial_03_0402,
  ep_Q2_024_partial_03_0403,
  ep_Q2_024_partial_03_0404,
  ep_Q2_024_partial_03_0405,
  ep_Q2_024_partial_03_0406,
  ep_Q2_024_partial_03_0407,
  ep_Q2_024_partial_03_0408,
  ep_Q2_024_partial_03_0409,
  ep_Q2_024_partial_03_0410,
  ep_Q2_024_partial_03_0411,
  ep_Q2_024_partial_03_0412,
  ep_Q2_024_partial_03_0413,
  ep_Q2_024_partial_03_0414,
  ep_Q2_024_partial_03_0415,
  ep_Q2_024_partial_03_0416,
  ep_Q2_024_partial_03_0417,
  ep_Q2_024_partial_03_0418,
  ep_Q2_024_partial_03_0419,
  ep_Q2_024_partial_03_0420,
  ep_Q2_024_partial_03_0421,
  ep_Q2_024_partial_03_0422,
  ep_Q2_024_partial_03_0423,
  ep_Q2_024_partial_03_0424,
  ep_Q2_024_partial_03_0425,
  ep_Q2_024_partial_03_0426,
  ep_Q2_024_partial_03_0427,
  ep_Q2_024_partial_03_0428,
  ep_Q2_024_partial_03_0429,
  ep_Q2_024_partial_03_0430,
  ep_Q2_024_partial_03_0431,
  ep_Q2_024_partial_03_0432,
  ep_Q2_024_partial_03_0433,
  ep_Q2_024_partial_03_0434,
  ep_Q2_024_partial_03_0435,
  ep_Q2_024_partial_03_0436,
  ep_Q2_024_partial_03_0437,
  ep_Q2_024_partial_03_0438,
  ep_Q2_024_partial_03_0439,
  ep_Q2_024_partial_03_0440,
  ep_Q2_024_partial_03_0441,
  ep_Q2_024_partial_03_0442,
  ep_Q2_024_partial_03_0443,
  ep_Q2_024_partial_03_0444,
  ep_Q2_024_partial_03_0445,
  ep_Q2_024_partial_03_0446,
  ep_Q2_024_partial_03_0447,
  ep_Q2_024_partial_03_0448,
  ep_Q2_024_partial_03_0449,
  ep_Q2_024_partial_03_0450,
  ep_Q2_024_partial_03_0451,
  ep_Q2_024_partial_03_0452,
  ep_Q2_024_partial_03_0453,
  ep_Q2_024_partial_03_0454,
  ep_Q2_024_partial_03_0455,
  ep_Q2_024_partial_03_0456,
  ep_Q2_024_partial_03_0457,
  ep_Q2_024_partial_03_0458,
  ep_Q2_024_partial_03_0459,
  ep_Q2_024_partial_03_0460,
  ep_Q2_024_partial_03_0461,
  ep_Q2_024_partial_03_0462,
  ep_Q2_024_partial_03_0463,
  ep_Q2_024_partial_03_0464,
  ep_Q2_024_partial_03_0465,
  ep_Q2_024_partial_03_0466,
  ep_Q2_024_partial_03_0467,
  ep_Q2_024_partial_03_0468,
  ep_Q2_024_partial_03_0469,
  ep_Q2_024_partial_03_0470,
  ep_Q2_024_partial_03_0471,
  ep_Q2_024_partial_03_0472,
  ep_Q2_024_partial_03_0473,
  ep_Q2_024_partial_03_0474,
  ep_Q2_024_partial_03_0475,
  ep_Q2_024_partial_03_0476,
  ep_Q2_024_partial_03_0477,
  ep_Q2_024_partial_03_0478,
  ep_Q2_024_partial_03_0479,
  ep_Q2_024_partial_03_0480,
  ep_Q2_024_partial_03_0481,
  ep_Q2_024_partial_03_0482,
  ep_Q2_024_partial_03_0483,
  ep_Q2_024_partial_03_0484,
  ep_Q2_024_partial_03_0485,
  ep_Q2_024_partial_03_0486,
  ep_Q2_024_partial_03_0487,
  ep_Q2_024_partial_03_0488,
  ep_Q2_024_partial_03_0489,
  ep_Q2_024_partial_03_0490,
  ep_Q2_024_partial_03_0491,
  ep_Q2_024_partial_03_0492,
  ep_Q2_024_partial_03_0493,
  ep_Q2_024_partial_03_0494,
  ep_Q2_024_partial_03_0495,
  ep_Q2_024_partial_03_0496,
  ep_Q2_024_partial_03_0497,
  ep_Q2_024_partial_03_0498,
  ep_Q2_024_partial_03_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_03_0400_0499 : Poly :=
[
  term ((-16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-4496135166902841 : Rat) / 2325560442306386) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (7, 1), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (12, 2), (13, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (7, 1), (12, 2), (15, 1)],
  term ((933555916338362 : Rat) / 1162780221153193) [(2, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (7, 1), (13, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(2, 2), (7, 1), (15, 1)],
  term ((6121702090615831 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (7, 1), (15, 3)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (8, 1), (9, 2)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (13, 2)],
  term ((-426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (8, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (8, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((60674568140088 : Rat) / 1162780221153193) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 1), (13, 1)],
  term ((-1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((6815444218987687 : Rat) / 1162780221153193) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(2, 2), (9, 1), (15, 1)],
  term ((-12926604740289595 : Rat) / 9302241769225544) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (9, 2)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (11, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(2, 2), (9, 2), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 2), (12, 1)],
  term ((73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (9, 2), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (9, 3), (11, 1)],
  term ((1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((9149829816626653 : Rat) / 4651120884612772) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (12, 2), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(2, 2), (11, 1), (12, 2), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(2, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(2, 2), (11, 1), (13, 1)],
  term ((-2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (11, 1), (13, 3)],
  term ((-29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4398958063413877 : Rat) / 2325560442306386) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(2, 2), (11, 1), (15, 1)],
  term ((-15599346427971429 : Rat) / 2325560442306386) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(2, 2), (12, 1)],
  term ((110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((5362672684393763 : Rat) / 2325560442306386) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((-58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(2, 2), (12, 1), (14, 1)],
  term ((-12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((13619159548665671 : Rat) / 2325560442306386) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(2, 2), (12, 1), (15, 2)],
  term ((-22683792249937645 : Rat) / 13953362653838316) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(2, 2), (12, 2), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(2, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(2, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((39707264479329403 : Rat) / 13953362653838316) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-4496135166902841 : Rat) / 2325560442306386) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (7, 1), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (12, 2), (13, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (7, 1), (12, 2), (15, 1)],
  term ((933555916338362 : Rat) / 1162780221153193) [(3, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (7, 1), (13, 1)],
  term ((168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-181622001380355 : Rat) / 1162780221153193) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 1162780221153193) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(3, 2), (7, 1), (15, 1)],
  term ((6121702090615831 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (7, 1), (15, 3)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-373787112386234 : Rat) / 1162780221153193) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (8, 1), (9, 2)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-37665296397180 : Rat) / 1162780221153193) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (13, 2)],
  term ((-426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (8, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (8, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 4651120884612772) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((60674568140088 : Rat) / 1162780221153193) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 1), (13, 1)],
  term ((-1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((6815444218987687 : Rat) / 1162780221153193) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(3, 2), (9, 1), (15, 1)],
  term ((-12926604740289595 : Rat) / 9302241769225544) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (9, 2)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (11, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(3, 2), (9, 2), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 2), (12, 1)],
  term ((73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (9, 2), (14, 1)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (9, 3), (11, 1)],
  term ((1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2163325299394758 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((9149829816626653 : Rat) / 4651120884612772) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (12, 2), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(3, 2), (11, 1), (13, 1)],
  term ((-2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-12880146370366127 : Rat) / 2325560442306386) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((75330592794360 : Rat) / 1162780221153193) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (11, 1), (13, 3)],
  term ((-29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4398958063413877 : Rat) / 2325560442306386) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(3, 2), (11, 1), (15, 1)],
  term ((-15599346427971429 : Rat) / 2325560442306386) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(3, 2), (12, 1)],
  term ((110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6741388318767089 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((5362672684393763 : Rat) / 2325560442306386) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2)],
  term ((-474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(3, 2), (12, 1), (13, 2), (14, 1)],
  term ((-58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(3, 2), (12, 1), (14, 1)],
  term ((-12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((13619159548665671 : Rat) / 2325560442306386) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(3, 2), (12, 1), (15, 2)],
  term ((-22683792249937645 : Rat) / 13953362653838316) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(3, 2), (12, 2), (15, 2)],
  term ((-1086154201315805 : Rat) / 1162780221153193) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((39707264479329403 : Rat) / 13953362653838316) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((4496135166902841 : Rat) / 2325560442306386) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (12, 2), (13, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (13, 1)],
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((-59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 2), (15, 1)],
  term ((-6121702090615831 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 2), (15, 3)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((16976931229948265502788395152476338491476524232867075593 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((4496135166902841 : Rat) / 2325560442306386) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (12, 1), (15, 3)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (12, 2), (13, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 2), (12, 2), (15, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((23694374124688766149852123178106704678 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (13, 1)],
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((-59951096220023500084639778785313459162668637825349993453 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((156876378843318870318570256649573282378861917621890680791 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (9, 2), (15, 1)],
  term ((-6121702090615831 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 2), (15, 3)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((2650870815205527 : Rat) / 4651120884612772) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)],
  term ((426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 2), (15, 2)],
  term ((3791843580843907 : Rat) / 4651120884612772) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 3), (11, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 3), (15, 1)],
  term ((373787112386234 : Rat) / 1162780221153193) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 4)],
  term ((-323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-60674568140088 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (13, 1)],
  term ((1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-6815444218987687 : Rat) / 1162780221153193) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(8, 2), (9, 1), (15, 1)],
  term ((12926604740289595 : Rat) / 9302241769225544) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (12, 1)],
  term ((-73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 2), (14, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 3), (11, 1)],
  term ((-1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-9149829816626653 : Rat) / 4651120884612772) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (12, 2), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (11, 1), (13, 1)],
  term ((2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((12880146370366127 : Rat) / 2325560442306386) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (11, 1), (13, 3)],
  term ((29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((4398958063413877 : Rat) / 2325560442306386) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 2), (11, 1), (15, 1)],
  term ((15599346427971429 : Rat) / 2325560442306386) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(8, 2), (12, 1)],
  term ((-110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5362672684393763 : Rat) / 2325560442306386) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (12, 1), (14, 1)],
  term ((12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (12, 1), (14, 1), (15, 2)],
  term ((-13619159548665671 : Rat) / 2325560442306386) [(8, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 2), (12, 1), (15, 2)],
  term ((22683792249937645 : Rat) / 13953362653838316) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (12, 2), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 2), (12, 2), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-39707264479329403 : Rat) / 13953362653838316) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-459949089743541882302793526832745797176 : Rat) / 599854728701238648283346764014769633995) [(8, 3)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (9, 1), (11, 1)],
  term ((39137400746849611463101820854253627952 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 1), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 3), (9, 1), (15, 1)],
  term ((373787112386234 : Rat) / 1162780221153193) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 2)],
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (11, 1), (12, 1), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 3), (11, 1), (12, 1), (15, 1)],
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 3), (11, 1), (13, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 3), (11, 1), (15, 1)],
  term ((2650870815205527 : Rat) / 4651120884612772) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1020157349445640024349684470050659667113740530926707119 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 3), (13, 1), (15, 1)],
  term ((37665296397180 : Rat) / 1162780221153193) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((20236464028016908558024560015619523336 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (13, 2)],
  term ((426555509366912725916107509627326824796 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 3), (15, 2)],
  term ((3791843580843907 : Rat) / 4651120884612772) [(8, 3), (15, 2), (16, 1)],
  term ((-1942080892773587721528091298117662406656 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((75044803479610622078844277253469055464 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4189554939777403259041079172137271511321467357690977803 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2163325299394758 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-369781982155838457521423787574914294088428152139938950409 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-9149829816626653 : Rat) / 4651120884612772) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 2), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2450278823186923218463668301444425964456 : Rat) / 1799564186103715944850040292044308901985) [(9, 2), (11, 1), (13, 1)],
  term ((2661779531733584752645677051104435516836 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-306849677609162941141519942935896119863282963199083215917 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((12880146370366127 : Rat) / 2325560442306386) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((354370675863676298812148301414579384265140264924470790 : Rat) / 46499947606600990925238671541813294873367321162373069) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((-75330592794360 : Rat) / 1162780221153193) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-40472928056033817116049120031239046672 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (13, 3)],
  term ((29971830110243974206252006213623290605106681974090222291 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((4398958063413877 : Rat) / 2325560442306386) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-182755261911051773662523897986364715871335570142309079497 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(9, 2), (11, 1), (15, 1)],
  term ((15599346427971429 : Rat) / 2325560442306386) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4880379727248822962037830741142813956557 : Rat) / 3599128372207431889700080584088617803970) [(9, 2), (12, 1)],
  term ((-110883075976155199581862349755792023732703002353458391051 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6741388318767089 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((59811556166991714638790470035825323381559636710902699447 : Rat) / 3347996227675271346617184351010557230882447123690860968) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5362672684393763 : Rat) / 2325560442306386) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-379357035428629805364557940313354706654 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2)],
  term ((474284525358848571306967891295317678258 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1), (13, 2), (14, 1)],
  term ((58679308696202874774943205362453976019 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)],
  term ((12477440389381563924484379958620126962636541605309616675 : Rat) / 371999580852807927401909372334506358986938569298984552) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-13619159548665671 : Rat) / 2325560442306386) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((276310849326868277431947432151105292562234750303869003251 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (12, 1), (15, 2)],
  term ((22683792249937645 : Rat) / 13953362653838316) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((24897008634067285794795130322114482756 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (12, 2), (13, 1), (15, 1)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 185999790426403963700954686167253179493469284649492276) [(9, 2), (12, 2), (15, 2)],
  term ((1086154201315805 : Rat) / 1162780221153193) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((3487537904823404702697294438588524629110939420700429135897 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-39707264479329403 : Rat) / 13953362653838316) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-323143585525104200983693516294743893584 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (12, 1)],
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((-672243631978108 : Rat) / 1162780221153193) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (11, 1), (13, 2)],
  term ((1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (11, 1), (15, 2)],
  term ((3791843580843907 : Rat) / 2325560442306386) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((67618184972414262799715201918531918344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 3), (12, 1), (14, 1), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1544049548604926045811296713286833791131035646531119216 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 3), (12, 1), (15, 1)],
  term ((-60674568140088 : Rat) / 1162780221153193) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((121767891807226576396750583489531215777 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (13, 1)],
  term ((1741560084050113960656484077674552482088 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (13, 1), (14, 1)],
  term ((16808386701944260843882974804330257813291882806163549429 : Rat) / 557999371279211891102864058501759538480407853948476828) [(9, 3), (14, 1), (15, 1)],
  term ((-6815444218987687 : Rat) / 1162780221153193) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-138283192879964436025226337896721862171499970333509308059 : Rat) / 7439991617056158548038187446690127179738771385979691040) [(9, 3), (15, 1)],
  term ((12926604740289595 : Rat) / 9302241769225544) [(9, 3), (15, 1), (16, 1)],
  term ((-690301768607306086615260323364954598267 : Rat) / 599854728701238648283346764014769633995) [(9, 4)],
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 1), (13, 1)],
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 4), (11, 1), (15, 1)],
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (12, 1)],
  term ((-73156551419414211686226686115594305836 : Rat) / 119970945740247729656669352802953926799) [(9, 4), (14, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 5), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 400 through 499. -/
theorem ep_Q2_024_block_03_0400_0499_valid :
    checkProductSumEq ep_Q2_024_partials_03_0400_0499
      ep_Q2_024_block_03_0400_0499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
