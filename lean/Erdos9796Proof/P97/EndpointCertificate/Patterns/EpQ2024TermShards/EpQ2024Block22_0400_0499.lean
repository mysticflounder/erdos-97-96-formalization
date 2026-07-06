/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 22:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 22 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_22_0400_0499 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0400 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 400 for generator 22. -/
def ep_Q2_024_partial_22_0400 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 22. -/
theorem ep_Q2_024_partial_22_0400_valid :
    mulPoly ep_Q2_024_coefficient_22_0400
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0401 : Poly :=
[
  term ((52245670401627287180635805823213237884494535199266656267 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (15, 1)]
]

/-- Partial product 401 for generator 22. -/
def ep_Q2_024_partial_22_0401 : Poly :=
[
  term ((52245670401627287180635805823213237884494535199266656267 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-52245670401627287180635805823213237884494535199266656267 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 2), (15, 1)],
  term ((52245670401627287180635805823213237884494535199266656267 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-52245670401627287180635805823213237884494535199266656267 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 22. -/
theorem ep_Q2_024_partial_22_0401_valid :
    mulPoly ep_Q2_024_coefficient_22_0401
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0402 : Poly :=
[
  term ((-735527562051447 : Rat) / 1162780221153193) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 22. -/
def ep_Q2_024_partial_22_0402 : Poly :=
[
  term ((-1471055124102894 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((735527562051447 : Rat) / 1162780221153193) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1471055124102894 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((735527562051447 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 22. -/
theorem ep_Q2_024_partial_22_0402_valid :
    mulPoly ep_Q2_024_coefficient_22_0402
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0403 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (15, 3)]
]

/-- Partial product 403 for generator 22. -/
def ep_Q2_024_partial_22_0403 : Poly :=
[
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (8, 2), (15, 3)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 22. -/
theorem ep_Q2_024_partial_22_0403_valid :
    mulPoly ep_Q2_024_coefficient_22_0403
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0404 : Poly :=
[
  term ((11177629529470399 : Rat) / 6976681326919158) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 404 for generator 22. -/
def ep_Q2_024_partial_22_0404 : Poly :=
[
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (8, 2), (15, 3), (16, 1)],
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 22. -/
theorem ep_Q2_024_partial_22_0404_valid :
    mulPoly ep_Q2_024_coefficient_22_0404
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0405 : Poly :=
[
  term ((23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 405 for generator 22. -/
def ep_Q2_024_partial_22_0405 : Poly :=
[
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 2), (9, 1), (15, 1)],
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 22. -/
theorem ep_Q2_024_partial_22_0405_valid :
    mulPoly ep_Q2_024_coefficient_22_0405
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0406 : Poly :=
[
  term ((197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 406 for generator 22. -/
def ep_Q2_024_partial_22_0406 : Poly :=
[
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 22. -/
theorem ep_Q2_024_partial_22_0406_valid :
    mulPoly ep_Q2_024_coefficient_22_0406
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0407 : Poly :=
[
  term ((5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (15, 2)]
]

/-- Partial product 407 for generator 22. -/
def ep_Q2_024_partial_22_0407 : Poly :=
[
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 1), (10, 1), (15, 2)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 2), (15, 2)],
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 22. -/
theorem ep_Q2_024_partial_22_0407_valid :
    mulPoly ep_Q2_024_coefficient_22_0407
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0408 : Poly :=
[
  term ((-2361660524222056 : Rat) / 1162780221153193) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 408 for generator 22. -/
def ep_Q2_024_partial_22_0408 : Poly :=
[
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (8, 2), (15, 2), (16, 1)],
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 22. -/
theorem ep_Q2_024_partial_22_0408_valid :
    mulPoly ep_Q2_024_coefficient_22_0408
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0409 : Poly :=
[
  term ((1018706743996192919936816560295768394916 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 409 for generator 22. -/
def ep_Q2_024_partial_22_0409 : Poly :=
[
  term ((2037413487992385839873633120591536789832 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-1018706743996192919936816560295768394916 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 3)],
  term ((2037413487992385839873633120591536789832 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((-1018706743996192919936816560295768394916 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 22. -/
theorem ep_Q2_024_partial_22_0409_valid :
    mulPoly ep_Q2_024_coefficient_22_0409
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0410 : Poly :=
[
  term ((113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 410 for generator 22. -/
def ep_Q2_024_partial_22_0410 : Poly :=
[
  term ((227023317378771587790483100738545658576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((227023317378771587790483100738545658576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 22. -/
theorem ep_Q2_024_partial_22_0410_valid :
    mulPoly ep_Q2_024_coefficient_22_0410
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0411 : Poly :=
[
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 411 for generator 22. -/
def ep_Q2_024_partial_22_0411 : Poly :=
[
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 22. -/
theorem ep_Q2_024_partial_22_0411_valid :
    mulPoly ep_Q2_024_coefficient_22_0411
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0412 : Poly :=
[
  term ((933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 412 for generator 22. -/
def ep_Q2_024_partial_22_0412 : Poly :=
[
  term ((1867111832676724 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1867111832676724 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 22. -/
theorem ep_Q2_024_partial_22_0412_valid :
    mulPoly ep_Q2_024_coefficient_22_0412
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0413 : Poly :=
[
  term ((-337894983615969969625187085926354140522 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 413 for generator 22. -/
def ep_Q2_024_partial_22_0413 : Poly :=
[
  term ((-675789967231939939250374171852708281044 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((337894983615969969625187085926354140522 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-675789967231939939250374171852708281044 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((337894983615969969625187085926354140522 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 22. -/
theorem ep_Q2_024_partial_22_0413_valid :
    mulPoly ep_Q2_024_coefficient_22_0413
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0414 : Poly :=
[
  term ((-15603518213015904936870811245151514569015486566888067175 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 414 for generator 22. -/
def ep_Q2_024_partial_22_0414 : Poly :=
[
  term ((-15603518213015904936870811245151514569015486566888067175 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((15603518213015904936870811245151514569015486566888067175 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((-15603518213015904936870811245151514569015486566888067175 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((15603518213015904936870811245151514569015486566888067175 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 22. -/
theorem ep_Q2_024_partial_22_0414_valid :
    mulPoly ep_Q2_024_coefficient_22_0414
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0415 : Poly :=
[
  term ((-5919802215816391 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 22. -/
def ep_Q2_024_partial_22_0415 : Poly :=
[
  term ((-5919802215816391 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5919802215816391 : Rat) / 2325560442306386) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5919802215816391 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((5919802215816391 : Rat) / 2325560442306386) [(7, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 22. -/
theorem ep_Q2_024_partial_22_0415_valid :
    mulPoly ep_Q2_024_coefficient_22_0415
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0416 : Poly :=
[
  term ((5617814070384913633076457310856238170482 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1)]
]

/-- Partial product 416 for generator 22. -/
def ep_Q2_024_partial_22_0416 : Poly :=
[
  term ((11235628140769827266152914621712476340964 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-5617814070384913633076457310856238170482 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 2), (9, 1)],
  term ((11235628140769827266152914621712476340964 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 2), (11, 1)],
  term ((-5617814070384913633076457310856238170482 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 22. -/
theorem ep_Q2_024_partial_22_0416_valid :
    mulPoly ep_Q2_024_coefficient_22_0416
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0417 : Poly :=
[
  term ((-898126954052890364388618255493546313788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 417 for generator 22. -/
def ep_Q2_024_partial_22_0417 : Poly :=
[
  term ((-1796253908105780728777236510987092627576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((898126954052890364388618255493546313788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-1796253908105780728777236510987092627576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((898126954052890364388618255493546313788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 22. -/
theorem ep_Q2_024_partial_22_0417_valid :
    mulPoly ep_Q2_024_coefficient_22_0417
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0418 : Poly :=
[
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 418 for generator 22. -/
def ep_Q2_024_partial_22_0418 : Poly :=
[
  term ((1597164824819487444736734770224430861536 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((1597164824819487444736734770224430861536 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 22. -/
theorem ep_Q2_024_partial_22_0418_valid :
    mulPoly ep_Q2_024_coefficient_22_0418
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0419 : Poly :=
[
  term ((2244834648071990195950482975568146038176 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 419 for generator 22. -/
def ep_Q2_024_partial_22_0419 : Poly :=
[
  term ((4489669296143980391900965951136292076352 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2244834648071990195950482975568146038176 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((4489669296143980391900965951136292076352 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-2244834648071990195950482975568146038176 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 22. -/
theorem ep_Q2_024_partial_22_0419_valid :
    mulPoly ep_Q2_024_coefficient_22_0419
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0420 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 420 for generator 22. -/
def ep_Q2_024_partial_22_0420 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 22. -/
theorem ep_Q2_024_partial_22_0420_valid :
    mulPoly ep_Q2_024_coefficient_22_0420
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0421 : Poly :=
[
  term ((3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 421 for generator 22. -/
def ep_Q2_024_partial_22_0421 : Poly :=
[
  term ((6131274682266476 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((6131274682266476 : Rat) / 1162780221153193) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 22. -/
theorem ep_Q2_024_partial_22_0421_valid :
    mulPoly ep_Q2_024_coefficient_22_0421
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0422 : Poly :=
[
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 422 for generator 22. -/
def ep_Q2_024_partial_22_0422 : Poly :=
[
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 22. -/
theorem ep_Q2_024_partial_22_0422_valid :
    mulPoly ep_Q2_024_coefficient_22_0422
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0423 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 423 for generator 22. -/
def ep_Q2_024_partial_22_0423 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 22. -/
theorem ep_Q2_024_partial_22_0423_valid :
    mulPoly ep_Q2_024_coefficient_22_0423
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0424 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 424 for generator 22. -/
def ep_Q2_024_partial_22_0424 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 22. -/
theorem ep_Q2_024_partial_22_0424_valid :
    mulPoly ep_Q2_024_coefficient_22_0424
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0425 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 425 for generator 22. -/
def ep_Q2_024_partial_22_0425 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 22. -/
theorem ep_Q2_024_partial_22_0425_valid :
    mulPoly ep_Q2_024_coefficient_22_0425
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0426 : Poly :=
[
  term ((313123244664039767436135075090446027966 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 426 for generator 22. -/
def ep_Q2_024_partial_22_0426 : Poly :=
[
  term ((626246489328079534872270150180892055932 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-313123244664039767436135075090446027966 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((626246489328079534872270150180892055932 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-313123244664039767436135075090446027966 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 22. -/
theorem ep_Q2_024_partial_22_0426_valid :
    mulPoly ep_Q2_024_coefficient_22_0426
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0427 : Poly :=
[
  term ((66392348991778283714919428688092230584 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 427 for generator 22. -/
def ep_Q2_024_partial_22_0427 : Poly :=
[
  term ((132784697983556567429838857376184461168 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-66392348991778283714919428688092230584 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((132784697983556567429838857376184461168 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-66392348991778283714919428688092230584 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 22. -/
theorem ep_Q2_024_partial_22_0427_valid :
    mulPoly ep_Q2_024_coefficient_22_0427
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0428 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 428 for generator 22. -/
def ep_Q2_024_partial_22_0428 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 22. -/
theorem ep_Q2_024_partial_22_0428_valid :
    mulPoly ep_Q2_024_coefficient_22_0428
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0429 : Poly :=
[
  term ((-13061852729891273472983799911523588255959055108376476473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 429 for generator 22. -/
def ep_Q2_024_partial_22_0429 : Poly :=
[
  term ((-13061852729891273472983799911523588255959055108376476473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((13061852729891273472983799911523588255959055108376476473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-13061852729891273472983799911523588255959055108376476473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13061852729891273472983799911523588255959055108376476473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 22. -/
theorem ep_Q2_024_partial_22_0429_valid :
    mulPoly ep_Q2_024_coefficient_22_0429
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0430 : Poly :=
[
  term ((1737358325637430 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 430 for generator 22. -/
def ep_Q2_024_partial_22_0430 : Poly :=
[
  term ((3474716651274860 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1737358325637430 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3474716651274860 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1737358325637430 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 22. -/
theorem ep_Q2_024_partial_22_0430_valid :
    mulPoly ep_Q2_024_coefficient_22_0430
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0431 : Poly :=
[
  term ((42497813352314957161512055477280848453468130739724992499 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 431 for generator 22. -/
def ep_Q2_024_partial_22_0431 : Poly :=
[
  term ((42497813352314957161512055477280848453468130739724992499 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-42497813352314957161512055477280848453468130739724992499 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((42497813352314957161512055477280848453468130739724992499 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-42497813352314957161512055477280848453468130739724992499 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 22. -/
theorem ep_Q2_024_partial_22_0431_valid :
    mulPoly ep_Q2_024_coefficient_22_0431
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0432 : Poly :=
[
  term ((8047367194069575 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 432 for generator 22. -/
def ep_Q2_024_partial_22_0432 : Poly :=
[
  term ((8047367194069575 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8047367194069575 : Rat) / 2325560442306386) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((8047367194069575 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8047367194069575 : Rat) / 2325560442306386) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 22. -/
theorem ep_Q2_024_partial_22_0432_valid :
    mulPoly ep_Q2_024_coefficient_22_0432
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0433 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 433 for generator 22. -/
def ep_Q2_024_partial_22_0433 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 22. -/
theorem ep_Q2_024_partial_22_0433_valid :
    mulPoly ep_Q2_024_coefficient_22_0433
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0434 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 434 for generator 22. -/
def ep_Q2_024_partial_22_0434 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 22. -/
theorem ep_Q2_024_partial_22_0434_valid :
    mulPoly ep_Q2_024_coefficient_22_0434
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0435 : Poly :=
[
  term ((-85263253142713261491049133537553819224 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 435 for generator 22. -/
def ep_Q2_024_partial_22_0435 : Poly :=
[
  term ((-170526506285426522982098267075107638448 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((85263253142713261491049133537553819224 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (12, 2), (13, 1)],
  term ((-170526506285426522982098267075107638448 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((85263253142713261491049133537553819224 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 22. -/
theorem ep_Q2_024_partial_22_0435_valid :
    mulPoly ep_Q2_024_coefficient_22_0435
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0436 : Poly :=
[
  term ((7905171874686847162338412068815626425092485108461693629 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 436 for generator 22. -/
def ep_Q2_024_partial_22_0436 : Poly :=
[
  term ((7905171874686847162338412068815626425092485108461693629 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-7905171874686847162338412068815626425092485108461693629 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term ((7905171874686847162338412068815626425092485108461693629 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7905171874686847162338412068815626425092485108461693629 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 22. -/
theorem ep_Q2_024_partial_22_0436_valid :
    mulPoly ep_Q2_024_coefficient_22_0436
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0437 : Poly :=
[
  term ((-3961313025167338 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 437 for generator 22. -/
def ep_Q2_024_partial_22_0437 : Poly :=
[
  term ((-7922626050334676 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3961313025167338 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7922626050334676 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3961313025167338 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 22. -/
theorem ep_Q2_024_partial_22_0437_valid :
    mulPoly ep_Q2_024_coefficient_22_0437
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0438 : Poly :=
[
  term ((-752807614961699240109535186401480302279 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (13, 1)]
]

/-- Partial product 438 for generator 22. -/
def ep_Q2_024_partial_22_0438 : Poly :=
[
  term ((-1505615229923398480219070372802960604558 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((752807614961699240109535186401480302279 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 2), (13, 1)],
  term ((-1505615229923398480219070372802960604558 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((752807614961699240109535186401480302279 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 22. -/
theorem ep_Q2_024_partial_22_0438_valid :
    mulPoly ep_Q2_024_coefficient_22_0438
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0439 : Poly :=
[
  term ((-878659421470763738203385768930122043524 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 439 for generator 22. -/
def ep_Q2_024_partial_22_0439 : Poly :=
[
  term ((-1757318842941527476406771537860244087048 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((878659421470763738203385768930122043524 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-1757318842941527476406771537860244087048 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((878659421470763738203385768930122043524 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 22. -/
theorem ep_Q2_024_partial_22_0439_valid :
    mulPoly ep_Q2_024_coefficient_22_0439
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0440 : Poly :=
[
  term ((-2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 440 for generator 22. -/
def ep_Q2_024_partial_22_0440 : Poly :=
[
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 22. -/
theorem ep_Q2_024_partial_22_0440_valid :
    mulPoly ep_Q2_024_coefficient_22_0440
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0441 : Poly :=
[
  term ((-5218214561190760638147787513552069787476422319742802119 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 441 for generator 22. -/
def ep_Q2_024_partial_22_0441 : Poly :=
[
  term ((-5218214561190760638147787513552069787476422319742802119 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((5218214561190760638147787513552069787476422319742802119 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((-5218214561190760638147787513552069787476422319742802119 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((5218214561190760638147787513552069787476422319742802119 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 22. -/
theorem ep_Q2_024_partial_22_0441_valid :
    mulPoly ep_Q2_024_coefficient_22_0441
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0442 : Poly :=
[
  term ((-192174960254885 : Rat) / 1162780221153193) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 22. -/
def ep_Q2_024_partial_22_0442 : Poly :=
[
  term ((-384349920509770 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((192174960254885 : Rat) / 1162780221153193) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-384349920509770 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((192174960254885 : Rat) / 1162780221153193) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 22. -/
theorem ep_Q2_024_partial_22_0442_valid :
    mulPoly ep_Q2_024_coefficient_22_0442
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0443 : Poly :=
[
  term ((88061550760806508262167160238242104252 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 443 for generator 22. -/
def ep_Q2_024_partial_22_0443 : Poly :=
[
  term ((176123101521613016524334320476484208504 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-88061550760806508262167160238242104252 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((176123101521613016524334320476484208504 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-88061550760806508262167160238242104252 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 22. -/
theorem ep_Q2_024_partial_22_0443_valid :
    mulPoly ep_Q2_024_coefficient_22_0443
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0444 : Poly :=
[
  term ((-260397362277098034629739762152769925542902855649004742137 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 444 for generator 22. -/
def ep_Q2_024_partial_22_0444 : Poly :=
[
  term ((-260397362277098034629739762152769925542902855649004742137 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((260397362277098034629739762152769925542902855649004742137 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-260397362277098034629739762152769925542902855649004742137 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((260397362277098034629739762152769925542902855649004742137 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 22. -/
theorem ep_Q2_024_partial_22_0444_valid :
    mulPoly ep_Q2_024_coefficient_22_0444
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0445 : Poly :=
[
  term ((6240045654200755 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 22. -/
def ep_Q2_024_partial_22_0445 : Poly :=
[
  term ((12480091308401510 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6240045654200755 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((12480091308401510 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6240045654200755 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 22. -/
theorem ep_Q2_024_partial_22_0445_valid :
    mulPoly ep_Q2_024_coefficient_22_0445
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0446 : Poly :=
[
  term ((-168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 446 for generator 22. -/
def ep_Q2_024_partial_22_0446 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 22. -/
theorem ep_Q2_024_partial_22_0446_valid :
    mulPoly ep_Q2_024_coefficient_22_0446
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0447 : Poly :=
[
  term ((-1250951611561428 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 22. -/
def ep_Q2_024_partial_22_0447 : Poly :=
[
  term ((-2501903223122856 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 22. -/
theorem ep_Q2_024_partial_22_0447_valid :
    mulPoly ep_Q2_024_coefficient_22_0447
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0448 : Poly :=
[
  term ((658123120955638202702154656712343516214761169968111040747 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (15, 1)]
]

/-- Partial product 448 for generator 22. -/
def ep_Q2_024_partial_22_0448 : Poly :=
[
  term ((658123120955638202702154656712343516214761169968111040747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-658123120955638202702154656712343516214761169968111040747 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (8, 2), (15, 1)],
  term ((658123120955638202702154656712343516214761169968111040747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-658123120955638202702154656712343516214761169968111040747 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 22. -/
theorem ep_Q2_024_partial_22_0448_valid :
    mulPoly ep_Q2_024_coefficient_22_0448
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0449 : Poly :=
[
  term ((-15830587842115855 : Rat) / 2325560442306386) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 22. -/
def ep_Q2_024_partial_22_0449 : Poly :=
[
  term ((-15830587842115855 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((15830587842115855 : Rat) / 2325560442306386) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-15830587842115855 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15830587842115855 : Rat) / 2325560442306386) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 22. -/
theorem ep_Q2_024_partial_22_0449_valid :
    mulPoly ep_Q2_024_coefficient_22_0449
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0450 : Poly :=
[
  term ((187564736720710846798729715875488993278482352800796451253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (15, 3)]
]

/-- Partial product 450 for generator 22. -/
def ep_Q2_024_partial_22_0450 : Poly :=
[
  term ((187564736720710846798729715875488993278482352800796451253 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((-187564736720710846798729715875488993278482352800796451253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (15, 3)],
  term ((187564736720710846798729715875488993278482352800796451253 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((-187564736720710846798729715875488993278482352800796451253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 22. -/
theorem ep_Q2_024_partial_22_0450_valid :
    mulPoly ep_Q2_024_coefficient_22_0450
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0451 : Poly :=
[
  term ((-4790498005861271 : Rat) / 1162780221153193) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 451 for generator 22. -/
def ep_Q2_024_partial_22_0451 : Poly :=
[
  term ((-9580996011722542 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((4790498005861271 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-9580996011722542 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((4790498005861271 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 22. -/
theorem ep_Q2_024_partial_22_0451_valid :
    mulPoly ep_Q2_024_coefficient_22_0451
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0452 : Poly :=
[
  term ((-3704547471736608696632491622395393811539 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)]
]

/-- Partial product 452 for generator 22. -/
def ep_Q2_024_partial_22_0452 : Poly :=
[
  term ((-3704547471736608696632491622395393811539 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (11, 1)],
  term ((3704547471736608696632491622395393811539 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (9, 2)],
  term ((-3704547471736608696632491622395393811539 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (10, 1)],
  term ((3704547471736608696632491622395393811539 : Rat) / 3599128372207431889700080584088617803970) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 22. -/
theorem ep_Q2_024_partial_22_0452_valid :
    mulPoly ep_Q2_024_coefficient_22_0452
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0453 : Poly :=
[
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 453 for generator 22. -/
def ep_Q2_024_partial_22_0453 : Poly :=
[
  term ((1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 2)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 3), (11, 1)],
  term ((1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 22. -/
theorem ep_Q2_024_partial_22_0453_valid :
    mulPoly ep_Q2_024_coefficient_22_0453
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0454 : Poly :=
[
  term ((215255704107672863047060014698394953736 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 454 for generator 22. -/
def ep_Q2_024_partial_22_0454 : Poly :=
[
  term ((430511408215345726094120029396789907472 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-215255704107672863047060014698394953736 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (13, 1)],
  term ((430511408215345726094120029396789907472 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-215255704107672863047060014698394953736 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 22. -/
theorem ep_Q2_024_partial_22_0454_valid :
    mulPoly ep_Q2_024_coefficient_22_0454
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0455 : Poly :=
[
  term ((-10518212799478636969936587628714820971130038610750609749 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 455 for generator 22. -/
def ep_Q2_024_partial_22_0455 : Poly :=
[
  term ((-10518212799478636969936587628714820971130038610750609749 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((10518212799478636969936587628714820971130038610750609749 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 3), (15, 1)],
  term ((-10518212799478636969936587628714820971130038610750609749 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((10518212799478636969936587628714820971130038610750609749 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 22. -/
theorem ep_Q2_024_partial_22_0455_valid :
    mulPoly ep_Q2_024_coefficient_22_0455
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0456 : Poly :=
[
  term ((2055829118124287 : Rat) / 1162780221153193) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 22. -/
def ep_Q2_024_partial_22_0456 : Poly :=
[
  term ((4111658236248574 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2055829118124287 : Rat) / 1162780221153193) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((4111658236248574 : Rat) / 1162780221153193) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2055829118124287 : Rat) / 1162780221153193) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 22. -/
theorem ep_Q2_024_partial_22_0456_valid :
    mulPoly ep_Q2_024_coefficient_22_0456
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0457 : Poly :=
[
  term ((173559463512792352411089145812176157904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2)]
]

/-- Partial product 457 for generator 22. -/
def ep_Q2_024_partial_22_0457 : Poly :=
[
  term ((347118927025584704822178291624352315808 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (11, 1)],
  term ((-173559463512792352411089145812176157904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 4)],
  term ((347118927025584704822178291624352315808 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (10, 1)],
  term ((-173559463512792352411089145812176157904 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 22. -/
theorem ep_Q2_024_partial_22_0457_valid :
    mulPoly ep_Q2_024_coefficient_22_0457
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0458 : Poly :=
[
  term ((-13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 458 for generator 22. -/
def ep_Q2_024_partial_22_0458 : Poly :=
[
  term ((-27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 22. -/
theorem ep_Q2_024_partial_22_0458_valid :
    mulPoly ep_Q2_024_coefficient_22_0458
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0459 : Poly :=
[
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 459 for generator 22. -/
def ep_Q2_024_partial_22_0459 : Poly :=
[
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 22. -/
theorem ep_Q2_024_partial_22_0459_valid :
    mulPoly ep_Q2_024_coefficient_22_0459
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0460 : Poly :=
[
  term ((-64632555285718 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 22. -/
def ep_Q2_024_partial_22_0460 : Poly :=
[
  term ((-129265110571436 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129265110571436 : Rat) / 1162780221153193) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 22. -/
theorem ep_Q2_024_partial_22_0460_valid :
    mulPoly ep_Q2_024_coefficient_22_0460
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0461 : Poly :=
[
  term ((117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 461 for generator 22. -/
def ep_Q2_024_partial_22_0461 : Poly :=
[
  term ((235636155462533809856378274190956348876 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((235636155462533809856378274190956348876 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 22. -/
theorem ep_Q2_024_partial_22_0461_valid :
    mulPoly ep_Q2_024_coefficient_22_0461
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0462 : Poly :=
[
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 462 for generator 22. -/
def ep_Q2_024_partial_22_0462 : Poly :=
[
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 22. -/
theorem ep_Q2_024_partial_22_0462_valid :
    mulPoly ep_Q2_024_coefficient_22_0462
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0463 : Poly :=
[
  term ((2650870815205527 : Rat) / 4651120884612772) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 22. -/
def ep_Q2_024_partial_22_0463 : Poly :=
[
  term ((2650870815205527 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2650870815205527 : Rat) / 2325560442306386) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 22. -/
theorem ep_Q2_024_partial_22_0463_valid :
    mulPoly ep_Q2_024_coefficient_22_0463
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0464 : Poly :=
[
  term ((-44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1)]
]

/-- Partial product 464 for generator 22. -/
def ep_Q2_024_partial_22_0464 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (12, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (12, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 22. -/
theorem ep_Q2_024_partial_22_0464_valid :
    mulPoly ep_Q2_024_coefficient_22_0464
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0465 : Poly :=
[
  term ((41887751721606385454584611614752270288 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 465 for generator 22. -/
def ep_Q2_024_partial_22_0465 : Poly :=
[
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-41887751721606385454584611614752270288 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-41887751721606385454584611614752270288 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 22. -/
theorem ep_Q2_024_partial_22_0465_valid :
    mulPoly ep_Q2_024_coefficient_22_0465
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0466 : Poly :=
[
  term ((-1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 466 for generator 22. -/
def ep_Q2_024_partial_22_0466 : Poly :=
[
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 22. -/
theorem ep_Q2_024_partial_22_0466_valid :
    mulPoly ep_Q2_024_coefficient_22_0466
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0467 : Poly :=
[
  term ((1650756408727440 : Rat) / 1162780221153193) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 467 for generator 22. -/
def ep_Q2_024_partial_22_0467 : Poly :=
[
  term ((3301512817454880 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 22. -/
theorem ep_Q2_024_partial_22_0467_valid :
    mulPoly ep_Q2_024_coefficient_22_0467
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0468 : Poly :=
[
  term ((-27485105647990694564526106172972130809242851012600059173 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 468 for generator 22. -/
def ep_Q2_024_partial_22_0468 : Poly :=
[
  term ((-27485105647990694564526106172972130809242851012600059173 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((27485105647990694564526106172972130809242851012600059173 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-27485105647990694564526106172972130809242851012600059173 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((27485105647990694564526106172972130809242851012600059173 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 22. -/
theorem ep_Q2_024_partial_22_0468_valid :
    mulPoly ep_Q2_024_coefficient_22_0468
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0469 : Poly :=
[
  term ((407613779763435 : Rat) / 2325560442306386) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 22. -/
def ep_Q2_024_partial_22_0469 : Poly :=
[
  term ((407613779763435 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-407613779763435 : Rat) / 2325560442306386) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((407613779763435 : Rat) / 1162780221153193) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-407613779763435 : Rat) / 2325560442306386) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 22. -/
theorem ep_Q2_024_partial_22_0469_valid :
    mulPoly ep_Q2_024_coefficient_22_0469
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0470 : Poly :=
[
  term ((72852201799388012068747273736804720686 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

/-- Partial product 470 for generator 22. -/
def ep_Q2_024_partial_22_0470 : Poly :=
[
  term ((145704403598776024137494547473609441372 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-72852201799388012068747273736804720686 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)],
  term ((145704403598776024137494547473609441372 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (13, 2)],
  term ((-72852201799388012068747273736804720686 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 22. -/
theorem ep_Q2_024_partial_22_0470_valid :
    mulPoly ep_Q2_024_coefficient_22_0470
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0471 : Poly :=
[
  term ((-1328118227674857279220916867107101768029 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (14, 1)]
]

/-- Partial product 471 for generator 22. -/
def ep_Q2_024_partial_22_0471 : Poly :=
[
  term ((-1328118227674857279220916867107101768029 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((1328118227674857279220916867107101768029 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (9, 2), (14, 1)],
  term ((-1328118227674857279220916867107101768029 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (14, 1)],
  term ((1328118227674857279220916867107101768029 : Rat) / 1199709457402477296566693528029539267990) [(8, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 22. -/
theorem ep_Q2_024_partial_22_0471_valid :
    mulPoly ep_Q2_024_coefficient_22_0471
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0472 : Poly :=
[
  term ((7411133279348208025352651212243081481192149994403717531 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (15, 2)]
]

/-- Partial product 472 for generator 22. -/
def ep_Q2_024_partial_22_0472 : Poly :=
[
  term ((7411133279348208025352651212243081481192149994403717531 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-7411133279348208025352651212243081481192149994403717531 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (9, 2), (15, 2)],
  term ((7411133279348208025352651212243081481192149994403717531 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (10, 1), (15, 2)],
  term ((-7411133279348208025352651212243081481192149994403717531 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 22. -/
theorem ep_Q2_024_partial_22_0472_valid :
    mulPoly ep_Q2_024_coefficient_22_0472
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0473 : Poly :=
[
  term ((15495484080192313 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 473 for generator 22. -/
def ep_Q2_024_partial_22_0473 : Poly :=
[
  term ((15495484080192313 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15495484080192313 : Rat) / 4651120884612772) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((15495484080192313 : Rat) / 2325560442306386) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-15495484080192313 : Rat) / 4651120884612772) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 22. -/
theorem ep_Q2_024_partial_22_0473_valid :
    mulPoly ep_Q2_024_coefficient_22_0473
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0474 : Poly :=
[
  term ((-413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2)]
]

/-- Partial product 474 for generator 22. -/
def ep_Q2_024_partial_22_0474 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (10, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 22. -/
theorem ep_Q2_024_partial_22_0474_valid :
    mulPoly ep_Q2_024_coefficient_22_0474
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0475 : Poly :=
[
  term ((-14741088198971702344858335799280688682 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1)]
]

/-- Partial product 475 for generator 22. -/
def ep_Q2_024_partial_22_0475 : Poly :=
[
  term ((-29482176397943404689716671598561377364 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((14741088198971702344858335799280688682 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)],
  term ((-29482176397943404689716671598561377364 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2)],
  term ((14741088198971702344858335799280688682 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 22. -/
theorem ep_Q2_024_partial_22_0475_valid :
    mulPoly ep_Q2_024_coefficient_22_0475
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0476 : Poly :=
[
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 476 for generator 22. -/
def ep_Q2_024_partial_22_0476 : Poly :=
[
  term ((-1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 22. -/
theorem ep_Q2_024_partial_22_0476_valid :
    mulPoly ep_Q2_024_coefficient_22_0476
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0477 : Poly :=
[
  term ((-4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 477 for generator 22. -/
def ep_Q2_024_partial_22_0477 : Poly :=
[
  term ((-9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 22. -/
theorem ep_Q2_024_partial_22_0477_valid :
    mulPoly ep_Q2_024_coefficient_22_0477
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0478 : Poly :=
[
  term ((-672243631978108 : Rat) / 1162780221153193) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 22. -/
def ep_Q2_024_partial_22_0478 : Poly :=
[
  term ((-1344487263956216 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1344487263956216 : Rat) / 1162780221153193) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 22. -/
theorem ep_Q2_024_partial_22_0478_valid :
    mulPoly ep_Q2_024_coefficient_22_0478
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0479 : Poly :=
[
  term ((-38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 479 for generator 22. -/
def ep_Q2_024_partial_22_0479 : Poly :=
[
  term ((-77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (11, 2), (13, 2)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 22. -/
theorem ep_Q2_024_partial_22_0479_valid :
    mulPoly ep_Q2_024_coefficient_22_0479
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0480 : Poly :=
[
  term ((1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 480 for generator 22. -/
def ep_Q2_024_partial_22_0480 : Poly :=
[
  term ((2449621117765505725180080152194735713792 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((2449621117765505725180080152194735713792 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (14, 1)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 22. -/
theorem ep_Q2_024_partial_22_0480_valid :
    mulPoly ep_Q2_024_coefficient_22_0480
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0481 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 481 for generator 22. -/
def ep_Q2_024_partial_22_0481 : Poly :=
[
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (11, 2), (15, 2)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 22. -/
theorem ep_Q2_024_partial_22_0481_valid :
    mulPoly ep_Q2_024_coefficient_22_0481
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0482 : Poly :=
[
  term ((3791843580843907 : Rat) / 2325560442306386) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 482 for generator 22. -/
def ep_Q2_024_partial_22_0482 : Poly :=
[
  term ((3791843580843907 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3791843580843907 : Rat) / 1162780221153193) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 22. -/
theorem ep_Q2_024_partial_22_0482_valid :
    mulPoly ep_Q2_024_coefficient_22_0482
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0483 : Poly :=
[
  term ((29315353244573309864361195396211332442 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 483 for generator 22. -/
def ep_Q2_024_partial_22_0483 : Poly :=
[
  term ((58630706489146619728722390792422664884 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-29315353244573309864361195396211332442 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((58630706489146619728722390792422664884 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-29315353244573309864361195396211332442 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 22. -/
theorem ep_Q2_024_partial_22_0483_valid :
    mulPoly ep_Q2_024_coefficient_22_0483
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0484 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 484 for generator 22. -/
def ep_Q2_024_partial_22_0484 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 22. -/
theorem ep_Q2_024_partial_22_0484_valid :
    mulPoly ep_Q2_024_coefficient_22_0484
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0485 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 485 for generator 22. -/
def ep_Q2_024_partial_22_0485 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 22. -/
theorem ep_Q2_024_partial_22_0485_valid :
    mulPoly ep_Q2_024_coefficient_22_0485
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0486 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 22. -/
def ep_Q2_024_partial_22_0486 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 22. -/
theorem ep_Q2_024_partial_22_0486_valid :
    mulPoly ep_Q2_024_coefficient_22_0486
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0487 : Poly :=
[
  term ((19345118788647508346127434236606092945741342931608800363 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 487 for generator 22. -/
def ep_Q2_024_partial_22_0487 : Poly :=
[
  term ((19345118788647508346127434236606092945741342931608800363 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-19345118788647508346127434236606092945741342931608800363 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((19345118788647508346127434236606092945741342931608800363 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-19345118788647508346127434236606092945741342931608800363 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 22. -/
theorem ep_Q2_024_partial_22_0487_valid :
    mulPoly ep_Q2_024_coefficient_22_0487
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0488 : Poly :=
[
  term ((1593748022295023 : Rat) / 2325560442306386) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 488 for generator 22. -/
def ep_Q2_024_partial_22_0488 : Poly :=
[
  term ((1593748022295023 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1593748022295023 : Rat) / 2325560442306386) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1593748022295023 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1593748022295023 : Rat) / 2325560442306386) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 22. -/
theorem ep_Q2_024_partial_22_0488_valid :
    mulPoly ep_Q2_024_coefficient_22_0488
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0489 : Poly :=
[
  term ((-98170476889864534173490076991131702251 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1)]
]

/-- Partial product 489 for generator 22. -/
def ep_Q2_024_partial_22_0489 : Poly :=
[
  term ((-196340953779729068346980153982263404502 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((98170476889864534173490076991131702251 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (13, 1)],
  term ((-196340953779729068346980153982263404502 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)],
  term ((98170476889864534173490076991131702251 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 22. -/
theorem ep_Q2_024_partial_22_0489_valid :
    mulPoly ep_Q2_024_coefficient_22_0489
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0490 : Poly :=
[
  term ((1004544259692269049255279645876123808512 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 490 for generator 22. -/
def ep_Q2_024_partial_22_0490 : Poly :=
[
  term ((2009088519384538098510559291752247617024 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1004544259692269049255279645876123808512 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((2009088519384538098510559291752247617024 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1004544259692269049255279645876123808512 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 22. -/
theorem ep_Q2_024_partial_22_0490_valid :
    mulPoly ep_Q2_024_coefficient_22_0490
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0491 : Poly :=
[
  term ((54504817147275290419759462159844365510254198831237638967 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 491 for generator 22. -/
def ep_Q2_024_partial_22_0491 : Poly :=
[
  term ((54504817147275290419759462159844365510254198831237638967 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-54504817147275290419759462159844365510254198831237638967 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((54504817147275290419759462159844365510254198831237638967 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-54504817147275290419759462159844365510254198831237638967 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 22. -/
theorem ep_Q2_024_partial_22_0491_valid :
    mulPoly ep_Q2_024_coefficient_22_0491
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0492 : Poly :=
[
  term ((-7657890813537115 : Rat) / 1162780221153193) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 22. -/
def ep_Q2_024_partial_22_0492 : Poly :=
[
  term ((-15315781627074230 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7657890813537115 : Rat) / 1162780221153193) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15315781627074230 : Rat) / 1162780221153193) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7657890813537115 : Rat) / 1162780221153193) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 22. -/
theorem ep_Q2_024_partial_22_0492_valid :
    mulPoly ep_Q2_024_coefficient_22_0492
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0493 : Poly :=
[
  term ((-1502833169312340120623116938402513731126374012396957593223 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(9, 1), (15, 1)]
]

/-- Partial product 493 for generator 22. -/
def ep_Q2_024_partial_22_0493 : Poly :=
[
  term ((-1502833169312340120623116938402513731126374012396957593223 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((1502833169312340120623116938402513731126374012396957593223 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(8, 2), (9, 1), (15, 1)],
  term ((-1502833169312340120623116938402513731126374012396957593223 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (11, 1), (15, 1)],
  term ((1502833169312340120623116938402513731126374012396957593223 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 22. -/
theorem ep_Q2_024_partial_22_0493_valid :
    mulPoly ep_Q2_024_coefficient_22_0493
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0494 : Poly :=
[
  term ((38620122981239421 : Rat) / 9302241769225544) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 494 for generator 22. -/
def ep_Q2_024_partial_22_0494 : Poly :=
[
  term ((38620122981239421 : Rat) / 4651120884612772) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-38620122981239421 : Rat) / 9302241769225544) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((38620122981239421 : Rat) / 4651120884612772) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-38620122981239421 : Rat) / 9302241769225544) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 22. -/
theorem ep_Q2_024_partial_22_0494_valid :
    mulPoly ep_Q2_024_coefficient_22_0494
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0495 : Poly :=
[
  term ((-624450051029525437875344913431215609901 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 495 for generator 22. -/
def ep_Q2_024_partial_22_0495 : Poly :=
[
  term ((-1248900102059050875750689826862431219802 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1)],
  term ((624450051029525437875344913431215609901 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2)],
  term ((-1248900102059050875750689826862431219802 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1)],
  term ((624450051029525437875344913431215609901 : Rat) / 599854728701238648283346764014769633995) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 22. -/
theorem ep_Q2_024_partial_22_0495_valid :
    mulPoly ep_Q2_024_coefficient_22_0495
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0496 : Poly :=
[
  term ((15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 496 for generator 22. -/
def ep_Q2_024_partial_22_0496 : Poly :=
[
  term ((30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 2), (13, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 22. -/
theorem ep_Q2_024_partial_22_0496_valid :
    mulPoly ep_Q2_024_coefficient_22_0496
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0497 : Poly :=
[
  term ((-931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 497 for generator 22. -/
def ep_Q2_024_partial_22_0497 : Poly :=
[
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 2), (15, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 22. -/
theorem ep_Q2_024_partial_22_0497_valid :
    mulPoly ep_Q2_024_coefficient_22_0497
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0498 : Poly :=
[
  term ((747574224772468 : Rat) / 1162780221153193) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 22. -/
def ep_Q2_024_partial_22_0498 : Poly :=
[
  term ((1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 22. -/
theorem ep_Q2_024_partial_22_0498_valid :
    mulPoly ep_Q2_024_coefficient_22_0498
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 22. -/
def ep_Q2_024_coefficient_22_0499 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1)]
]

/-- Partial product 499 for generator 22. -/
def ep_Q2_024_partial_22_0499 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (12, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (12, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 22. -/
theorem ep_Q2_024_partial_22_0499_valid :
    mulPoly ep_Q2_024_coefficient_22_0499
        ep_Q2_024_generator_22_0400_0499 =
      ep_Q2_024_partial_22_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_22_0400_0499 : List Poly :=
[
  ep_Q2_024_partial_22_0400,
  ep_Q2_024_partial_22_0401,
  ep_Q2_024_partial_22_0402,
  ep_Q2_024_partial_22_0403,
  ep_Q2_024_partial_22_0404,
  ep_Q2_024_partial_22_0405,
  ep_Q2_024_partial_22_0406,
  ep_Q2_024_partial_22_0407,
  ep_Q2_024_partial_22_0408,
  ep_Q2_024_partial_22_0409,
  ep_Q2_024_partial_22_0410,
  ep_Q2_024_partial_22_0411,
  ep_Q2_024_partial_22_0412,
  ep_Q2_024_partial_22_0413,
  ep_Q2_024_partial_22_0414,
  ep_Q2_024_partial_22_0415,
  ep_Q2_024_partial_22_0416,
  ep_Q2_024_partial_22_0417,
  ep_Q2_024_partial_22_0418,
  ep_Q2_024_partial_22_0419,
  ep_Q2_024_partial_22_0420,
  ep_Q2_024_partial_22_0421,
  ep_Q2_024_partial_22_0422,
  ep_Q2_024_partial_22_0423,
  ep_Q2_024_partial_22_0424,
  ep_Q2_024_partial_22_0425,
  ep_Q2_024_partial_22_0426,
  ep_Q2_024_partial_22_0427,
  ep_Q2_024_partial_22_0428,
  ep_Q2_024_partial_22_0429,
  ep_Q2_024_partial_22_0430,
  ep_Q2_024_partial_22_0431,
  ep_Q2_024_partial_22_0432,
  ep_Q2_024_partial_22_0433,
  ep_Q2_024_partial_22_0434,
  ep_Q2_024_partial_22_0435,
  ep_Q2_024_partial_22_0436,
  ep_Q2_024_partial_22_0437,
  ep_Q2_024_partial_22_0438,
  ep_Q2_024_partial_22_0439,
  ep_Q2_024_partial_22_0440,
  ep_Q2_024_partial_22_0441,
  ep_Q2_024_partial_22_0442,
  ep_Q2_024_partial_22_0443,
  ep_Q2_024_partial_22_0444,
  ep_Q2_024_partial_22_0445,
  ep_Q2_024_partial_22_0446,
  ep_Q2_024_partial_22_0447,
  ep_Q2_024_partial_22_0448,
  ep_Q2_024_partial_22_0449,
  ep_Q2_024_partial_22_0450,
  ep_Q2_024_partial_22_0451,
  ep_Q2_024_partial_22_0452,
  ep_Q2_024_partial_22_0453,
  ep_Q2_024_partial_22_0454,
  ep_Q2_024_partial_22_0455,
  ep_Q2_024_partial_22_0456,
  ep_Q2_024_partial_22_0457,
  ep_Q2_024_partial_22_0458,
  ep_Q2_024_partial_22_0459,
  ep_Q2_024_partial_22_0460,
  ep_Q2_024_partial_22_0461,
  ep_Q2_024_partial_22_0462,
  ep_Q2_024_partial_22_0463,
  ep_Q2_024_partial_22_0464,
  ep_Q2_024_partial_22_0465,
  ep_Q2_024_partial_22_0466,
  ep_Q2_024_partial_22_0467,
  ep_Q2_024_partial_22_0468,
  ep_Q2_024_partial_22_0469,
  ep_Q2_024_partial_22_0470,
  ep_Q2_024_partial_22_0471,
  ep_Q2_024_partial_22_0472,
  ep_Q2_024_partial_22_0473,
  ep_Q2_024_partial_22_0474,
  ep_Q2_024_partial_22_0475,
  ep_Q2_024_partial_22_0476,
  ep_Q2_024_partial_22_0477,
  ep_Q2_024_partial_22_0478,
  ep_Q2_024_partial_22_0479,
  ep_Q2_024_partial_22_0480,
  ep_Q2_024_partial_22_0481,
  ep_Q2_024_partial_22_0482,
  ep_Q2_024_partial_22_0483,
  ep_Q2_024_partial_22_0484,
  ep_Q2_024_partial_22_0485,
  ep_Q2_024_partial_22_0486,
  ep_Q2_024_partial_22_0487,
  ep_Q2_024_partial_22_0488,
  ep_Q2_024_partial_22_0489,
  ep_Q2_024_partial_22_0490,
  ep_Q2_024_partial_22_0491,
  ep_Q2_024_partial_22_0492,
  ep_Q2_024_partial_22_0493,
  ep_Q2_024_partial_22_0494,
  ep_Q2_024_partial_22_0495,
  ep_Q2_024_partial_22_0496,
  ep_Q2_024_partial_22_0497,
  ep_Q2_024_partial_22_0498,
  ep_Q2_024_partial_22_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_22_0400_0499 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((52245670401627287180635805823213237884494535199266656267 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1471055124102894 : Rat) / 1162780221153193) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (8, 2), (14, 1), (15, 3), (16, 1)],
  term ((-52245670401627287180635805823213237884494535199266656267 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (8, 2), (15, 1)],
  term ((735527562051447 : Rat) / 1162780221153193) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (8, 2), (15, 3)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (8, 2), (15, 3), (16, 1)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((52245670401627287180635805823213237884494535199266656267 : Rat) / 4184995284594089183271480438763196538603058904613576210) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1471055124102894 : Rat) / 1162780221153193) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((596292272370210102731177090662239802901212841340772628921 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((11177629529470399 : Rat) / 3488340663459579) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-52245670401627287180635805823213237884494535199266656267 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(5, 1), (9, 2), (15, 1)],
  term ((735527562051447 : Rat) / 1162780221153193) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-596292272370210102731177090662239802901212841340772628921 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(5, 1), (9, 2), (15, 3)],
  term ((-11177629529470399 : Rat) / 6976681326919158) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 1), (10, 1), (15, 2)],
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (8, 2), (9, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (8, 2), (15, 2)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (8, 2), (15, 2), (16, 1)],
  term ((395389020476533643914391115102508865632 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10460153440353640239364216033345552355107017253883220276 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-4723321048444112 : Rat) / 1162780221153193) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((47284778305714598658178901405742087504 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-197694510238266821957195557551254432816 : Rat) / 599854728701238648283346764014769633995) [(5, 2), (9, 2), (13, 1), (15, 1)],
  term ((-5230076720176820119682108016672776177553508626941610138 : Rat) / 232499738033004954626193357709066474366836605811865345) [(5, 2), (9, 2), (15, 2)],
  term ((2361660524222056 : Rat) / 1162780221153193) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23642389152857299329089450702871043752 : Rat) / 199951576233746216094448921338256544665) [(5, 2), (9, 3), (15, 1)],
  term ((11235628140769827266152914621712476340964 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-1796253908105780728777236510987092627576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((1597164824819487444736734770224430861536 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4489669296143980391900965951136292076352 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((6131274682266476 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((227023317378771587790483100738545658576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1867111832676724 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-675789967231939939250374171852708281044 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-15603518213015904936870811245151514569015486566888067175 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-5919802215816391 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (9, 2), (10, 1), (15, 1)],
  term ((2037413487992385839873633120591536789832 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (12, 1), (13, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((337894983615969969625187085926354140522 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((15603518213015904936870811245151514569015486566888067175 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((5919802215816391 : Rat) / 2325560442306386) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1018706743996192919936816560295768394916 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (9, 3)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((626246489328079534872270150180892055932 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((132784697983556567429838857376184461168 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13061852729891273472983799911523588255959055108376476473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3474716651274860 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((42497813352314957161512055477280848453468130739724992499 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((8047367194069575 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-170526506285426522982098267075107638448 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (10, 1), (12, 2), (13, 1)],
  term ((7905171874686847162338412068815626425092485108461693629 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-7922626050334676 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1505615229923398480219070372802960604558 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1757318842941527476406771537860244087048 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-5218214561190760638147787513552069787476422319742802119 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-384349920509770 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((176123101521613016524334320476484208504 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-260397362277098034629739762152769925542902855649004742137 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12480091308401510 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((658123120955638202702154656712343516214761169968111040747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-15830587842115855 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((187564736720710846798729715875488993278482352800796451253 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((-9580996011722542 : Rat) / 1162780221153193) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5617814070384913633076457310856238170482 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (8, 2), (9, 1)],
  term ((2037413487992385839873633120591536789832 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (10, 1)],
  term ((898126954052890364388618255493546313788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (12, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-2244834648071990195950482975568146038176 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1), (14, 1)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (9, 1), (15, 2)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (9, 2), (15, 1)],
  term ((227023317378771587790483100738545658576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (10, 1), (12, 1), (13, 1)],
  term ((-2079560072804463260626088927320011649492026472363797717 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1)],
  term ((1867111832676724 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-675789967231939939250374171852708281044 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-15603518213015904936870811245151514569015486566888067175 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-5919802215816391 : Rat) / 1162780221153193) [(7, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-313123244664039767436135075090446027966 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-66392348991778283714919428688092230584 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((13061852729891273472983799911523588255959055108376476473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1737358325637430 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42497813352314957161512055477280848453468130739724992499 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-8047367194069575 : Rat) / 2325560442306386) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((85263253142713261491049133537553819224 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 2), (12, 2), (13, 1)],
  term ((-7905171874686847162338412068815626425092485108461693629 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 2), (12, 2), (15, 1)],
  term ((3961313025167338 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((752807614961699240109535186401480302279 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 2), (13, 1)],
  term ((878659421470763738203385768930122043524 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 2), (13, 1), (14, 2)],
  term ((5218214561190760638147787513552069787476422319742802119 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((192174960254885 : Rat) / 1162780221153193) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-88061550760806508262167160238242104252 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((260397362277098034629739762152769925542902855649004742137 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-6240045654200755 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 2), (14, 2), (15, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(7, 1), (8, 2), (14, 2), (15, 1), (16, 1)],
  term ((-658123120955638202702154656712343516214761169968111040747 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (8, 2), (15, 1)],
  term ((15830587842115855 : Rat) / 2325560442306386) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-187564736720710846798729715875488993278482352800796451253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (8, 2), (15, 3)],
  term ((4790498005861271 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-1018706743996192919936816560295768394916 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (9, 1)],
  term ((-113511658689385793895241550369272829288 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (12, 1), (13, 1)],
  term ((2079560072804463260626088927320011649492026472363797717 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (8, 3), (12, 1), (15, 1)],
  term ((-933555916338362 : Rat) / 1162780221153193) [(7, 1), (8, 3), (12, 1), (15, 1), (16, 1)],
  term ((337894983615969969625187085926354140522 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 3), (13, 1)],
  term ((15603518213015904936870811245151514569015486566888067175 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(7, 1), (8, 3), (15, 1)],
  term ((5919802215816391 : Rat) / 2325560442306386) [(7, 1), (8, 3), (15, 1), (16, 1)],
  term ((626246489328079534872270150180892055932 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((132784697983556567429838857376184461168 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13061852729891273472983799911523588255959055108376476473 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3474716651274860 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((42497813352314957161512055477280848453468130739724992499 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((8047367194069575 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-170526506285426522982098267075107638448 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (11, 1), (12, 2), (13, 1)],
  term ((7905171874686847162338412068815626425092485108461693629 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-7922626050334676 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1505615229923398480219070372802960604558 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1757318842941527476406771537860244087048 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4243375123312046760712148470785626944 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-5218214561190760638147787513552069787476422319742802119 : Rat) / 92999895213201981850477343083626589746734642324746138) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-384349920509770 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((176123101521613016524334320476484208504 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-260397362277098034629739762152769925542902855649004742137 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((12480091308401510 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2501903223122856 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((658123120955638202702154656712343516214761169968111040747 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15830587842115855 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((187564736720710846798729715875488993278482352800796451253 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 1), (11, 1), (15, 3)],
  term ((-9580996011722542 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((11235628140769827266152914621712476340964 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 2), (11, 1)],
  term ((-1796253908105780728777236510987092627576 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (12, 1)],
  term ((561549298408577769244039194638714765344 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((4489669296143980391900965951136292076352 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-4943973512277676026964147316916426960080056575505494716 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((6189246899173456 : Rat) / 1162780221153193) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-313123244664039767436135075090446027966 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-66392348991778283714919428688092230584 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1), (14, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((13061852729891273472983799911523588255959055108376476473 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1737358325637430 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42497813352314957161512055477280848453468130739724992499 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-8047367194069575 : Rat) / 2325560442306386) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (12, 1), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((85263253142713261491049133537553819224 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 2), (12, 2), (13, 1)],
  term ((-7905171874686847162338412068815626425092485108461693629 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 2), (12, 2), (15, 1)],
  term ((3961313025167338 : Rat) / 1162780221153193) [(7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((752807614961699240109535186401480302279 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (9, 2), (13, 1)],
  term ((878659421470763738203385768930122043524 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((2121687561656023380356074235392813472 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (13, 1), (14, 2)],
  term ((5218214561190760638147787513552069787476422319742802119 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 2), (13, 1), (15, 2)],
  term ((192174960254885 : Rat) / 1162780221153193) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-88061550760806508262167160238242104252 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 2), (13, 2), (15, 1)],
  term ((260397362277098034629739762152769925542902855649004742137 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-6240045654200755 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((168614132473848352421619338000873392948252297538773343 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 2), (14, 2), (15, 1)],
  term ((1250951611561428 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-658123120955638202702154656712343516214761169968111040747 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(7, 1), (9, 2), (15, 1)],
  term ((15830587842115855 : Rat) / 2325560442306386) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-187564736720710846798729715875488993278482352800796451253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 2), (15, 3)],
  term ((4790498005861271 : Rat) / 1162780221153193) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-5617814070384913633076457310856238170482 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 3)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 3), (11, 1), (15, 1)],
  term ((898126954052890364388618255493546313788 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (12, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (13, 1), (15, 1)],
  term ((-2244834648071990195950482975568146038176 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 3), (14, 1)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 3), (15, 2)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 4), (15, 1)],
  term ((-29482176397943404689716671598561377364 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1344487263956216 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((2449621117765505725180080152194735713792 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3791843580843907 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((58630706489146619728722390792422664884 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19345118788647508346127434236606092945741342931608800363 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1593748022295023 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-196340953779729068346980153982263404502 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2009088519384538098510559291752247617024 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((54504817147275290419759462159844365510254198831237638967 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-15315781627074230 : Rat) / 1162780221153193) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1502833169312340120623116938402513731126374012396957593223 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((38620122981239421 : Rat) / 4651120884612772) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3704547471736608696632491622395393811539 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (9, 1), (11, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27485105647990694564526106172972130809242851012600059173 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((407613779763435 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((145704403598776024137494547473609441372 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-1328118227674857279220916867107101768029 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((7411133279348208025352651212243081481192149994403717531 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((15495484080192313 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-129265110571436 : Rat) / 1162780221153193) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((235636155462533809856378274190956348876 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((2650870815205527 : Rat) / 2325560442306386) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3704547471736608696632491622395393811539 : Rat) / 3599128372207431889700080584088617803970) [(8, 1), (9, 2)],
  term ((-1248900102059050875750689826862431219802 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (10, 1)],
  term ((30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-158578980440988798546825656080600964718 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-531725580296019651600367175672897669476230613344549809587 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((13795762129788769 : Rat) / 4651120884612772) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (11, 2)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (12, 1)],
  term ((-41887751721606385454584611614752270288 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (9, 2), (12, 1), (15, 2)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((27485105647990694564526106172972130809242851012600059173 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-407613779763435 : Rat) / 2325560442306386) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72852201799388012068747273736804720686 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (13, 2)],
  term ((1328118227674857279220916867107101768029 : Rat) / 1199709457402477296566693528029539267990) [(8, 1), (9, 2), (14, 1)],
  term ((-7411133279348208025352651212243081481192149994403717531 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (9, 2), (15, 2)],
  term ((-15495484080192313 : Rat) / 4651120884612772) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((442787992159072562430436498695039566846 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 3), (11, 1)],
  term ((-215255704107672863047060014698394953736 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 3), (13, 1)],
  term ((10518212799478636969936587628714820971130038610750609749 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (9, 3), (15, 1)],
  term ((-2055829118124287 : Rat) / 1162780221153193) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-173559463512792352411089145812176157904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 4)],
  term ((1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((430511408215345726094120029396789907472 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10518212799478636969936587628714820971130038610750609749 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((4111658236248574 : Rat) / 1162780221153193) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-270535491983755874614226205545862595394 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (11, 1)],
  term ((598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-29315353244573309864361195396211332442 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19345118788647508346127434236606092945741342931608800363 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1593748022295023 : Rat) / 2325560442306386) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((98170476889864534173490076991131702251 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (13, 1)],
  term ((-1004544259692269049255279645876123808512 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-54504817147275290419759462159844365510254198831237638967 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((7657890813537115 : Rat) / 1162780221153193) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1502833169312340120623116938402513731126374012396957593223 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(8, 2), (9, 1), (15, 1)],
  term ((-38620122981239421 : Rat) / 9302241769225544) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((1037623833104645100969113389649649847333 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 2)],
  term ((347118927025584704822178291624352315808 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (10, 1)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (11, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (9, 2), (12, 1)],
  term ((-3704547471736608696632491622395393811539 : Rat) / 1799564186103715944850040292044308901985) [(8, 2), (10, 1)],
  term ((-27847248306233301432122058161629796528 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((244677641669579313228906460478841683965056870609514547 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-129265110571436 : Rat) / 1162780221153193) [(8, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((235636155462533809856378274190956348876 : Rat) / 39990315246749243218889784267651308933) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((89515975580038111168174894928635820341438060891708986319 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((2650870815205527 : Rat) / 2325560442306386) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (12, 1)],
  term ((83775503443212770909169223229504540576 : Rat) / 199951576233746216094448921338256544665) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2430959375450672057935765985789364740848990716162226488 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((3301512817454880 : Rat) / 1162780221153193) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27485105647990694564526106172972130809242851012600059173 : Rat) / 557999371279211891102864058501759538480407853948476828) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((407613779763435 : Rat) / 1162780221153193) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((145704403598776024137494547473609441372 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (13, 2)],
  term ((-1328118227674857279220916867107101768029 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (10, 1), (14, 1)],
  term ((7411133279348208025352651212243081481192149994403717531 : Rat) / 371999580852807927401909372334506358986938569298984552) [(8, 2), (10, 1), (15, 2)],
  term ((15495484080192313 : Rat) / 2325560442306386) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((3704547471736608696632491622395393811539 : Rat) / 3599128372207431889700080584088617803970) [(8, 3)],
  term ((-598568788917681552036098376178017380578 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (9, 1), (11, 1)],
  term ((-215255704107672863047060014698394953736 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 1), (13, 1)],
  term ((10518212799478636969936587628714820971130038610750609749 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 3), (9, 1), (15, 1)],
  term ((-2055829118124287 : Rat) / 1162780221153193) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((-173559463512792352411089145812176157904 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (9, 2)],
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (10, 1)],
  term ((13923624153116650716061029080814898264 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (11, 1), (12, 1), (13, 1)],
  term ((-244677641669579313228906460478841683965056870609514547 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 3), (11, 1), (12, 1), (15, 1)],
  term ((64632555285718 : Rat) / 1162780221153193) [(8, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-117818077731266904928189137095478174438 : Rat) / 39990315246749243218889784267651308933) [(8, 3), (11, 1), (13, 1)],
  term ((-89515975580038111168174894928635820341438060891708986319 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 3), (11, 1), (15, 1)],
  term ((-2650870815205527 : Rat) / 4651120884612772) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((44975123602223741861033454546231653929 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (12, 1)],
  term ((-41887751721606385454584611614752270288 : Rat) / 199951576233746216094448921338256544665) [(8, 3), (12, 1), (13, 1), (15, 1)],
  term ((1215479687725336028967882992894682370424495358081113244 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 3), (12, 1), (15, 2)],
  term ((-1650756408727440 : Rat) / 1162780221153193) [(8, 3), (12, 1), (15, 2), (16, 1)],
  term ((27485105647990694564526106172972130809242851012600059173 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(8, 3), (13, 1), (15, 1)],
  term ((-407613779763435 : Rat) / 2325560442306386) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-72852201799388012068747273736804720686 : Rat) / 599854728701238648283346764014769633995) [(8, 3), (13, 2)],
  term ((1328118227674857279220916867107101768029 : Rat) / 1199709457402477296566693528029539267990) [(8, 3), (14, 1)],
  term ((-7411133279348208025352651212243081481192149994403717531 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 3), (15, 2)],
  term ((-15495484080192313 : Rat) / 4651120884612772) [(8, 3), (15, 2), (16, 1)],
  term ((413173782075119663093768476218434237432 : Rat) / 599854728701238648283346764014769633995) [(8, 4)],
  term ((58630706489146619728722390792422664884 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19345118788647508346127434236606092945741342931608800363 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1593748022295023 : Rat) / 1162780221153193) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-196340953779729068346980153982263404502 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1)],
  term ((2009088519384538098510559291752247617024 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((54504817147275290419759462159844365510254198831237638967 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-15315781627074230 : Rat) / 1162780221153193) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1502833169312340120623116938402513731126374012396957593223 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 2), (11, 1), (15, 1)],
  term ((38620122981239421 : Rat) / 4651120884612772) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29482176397943404689716671598561377364 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2)],
  term ((-1197137577835363104072196752356034761156 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (11, 2), (12, 1)],
  term ((-9205865746343780910712213034837687167831809656983677278 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1344487263956216 : Rat) / 1162780221153193) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-77740590570025540665024722037713088416 : Rat) / 119970945740247729656669352802953926799) [(9, 2), (11, 2), (13, 2)],
  term ((2449621117765505725180080152194735713792 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (11, 2), (14, 1)],
  term ((-80145240988429012696951992263099464806083996848861676521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(9, 2), (11, 2), (15, 2)],
  term ((3791843580843907 : Rat) / 1162780221153193) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-82277267590671944893722099404210035408 : Rat) / 39990315246749243218889784267651308933) [(9, 3), (11, 1)],
  term ((787906385477091391030013807973118643746 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (11, 1), (12, 1)],
  term ((4602932873171890455356106517418843583915904828491838639 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((672243631978108 : Rat) / 1162780221153193) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((38870295285012770332512361018856544208 : Rat) / 119970945740247729656669352802953926799) [(9, 3), (11, 1), (13, 2)],
  term ((-1224810558882752862590040076097367856896 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 1), (14, 1)],
  term ((80145240988429012696951992263099464806083996848861676521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (11, 1), (15, 2)],
  term ((-3791843580843907 : Rat) / 2325560442306386) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((30324538614458553189796995553613669696 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (11, 2), (13, 1)],
  term ((-1862017972688907367940148742016867997082388675896278214 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 3), (11, 2), (15, 1)],
  term ((1495148449544936 : Rat) / 1162780221153193) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-29315353244573309864361195396211332442 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (12, 1), (13, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(9, 3), (12, 1), (13, 1), (14, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(9, 3), (12, 1), (14, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19345118788647508346127434236606092945741342931608800363 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 3), (12, 1), (15, 1)],
  term ((-1593748022295023 : Rat) / 2325560442306386) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((98170476889864534173490076991131702251 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1)],
  term ((-1004544259692269049255279645876123808512 : Rat) / 199951576233746216094448921338256544665) [(9, 3), (13, 1), (14, 1)],
  term ((-54504817147275290419759462159844365510254198831237638967 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 3), (14, 1), (15, 1)],
  term ((7657890813537115 : Rat) / 1162780221153193) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1502833169312340120623116938402513731126374012396957593223 : Rat) / 22319974851168475644114562340070381539216314157939073120) [(9, 3), (15, 1)],
  term ((-38620122981239421 : Rat) / 9302241769225544) [(9, 3), (15, 1), (16, 1)],
  term ((624450051029525437875344913431215609901 : Rat) / 599854728701238648283346764014769633995) [(9, 4)],
  term ((-15162269307229276594898497776806834848 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (11, 1), (13, 1)],
  term ((931008986344453683970074371008433998541194337948139107 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 4), (11, 1), (15, 1)],
  term ((-747574224772468 : Rat) / 1162780221153193) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 400 through 499. -/
theorem ep_Q2_024_block_22_0400_0499_valid :
    checkProductSumEq ep_Q2_024_partials_22_0400_0499
      ep_Q2_024_block_22_0400_0499 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
