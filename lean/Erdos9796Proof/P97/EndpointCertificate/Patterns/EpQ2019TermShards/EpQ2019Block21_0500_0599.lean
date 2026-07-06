/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0500 : Poly :=
[
  term ((213851318818602760940850436850732352419 : Rat) / 12519382944556999039514384832953355430) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 500 for generator 21. -/
def ep_Q2_019_partial_21_0500 : Poly :=
[
  term ((213851318818602760940850436850732352419 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-213851318818602760940850436850732352419 : Rat) / 12519382944556999039514384832953355430) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 21. -/
theorem ep_Q2_019_partial_21_0500_valid :
    mulPoly ep_Q2_019_coefficient_21_0500
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0501 : Poly :=
[
  term ((-2224593004166771907455189805143422750861 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 2), (16, 1)]
]

/-- Partial product 501 for generator 21. -/
def ep_Q2_019_partial_21_0501 : Poly :=
[
  term ((-2224593004166771907455189805143422750861 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((2224593004166771907455189805143422750861 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 21. -/
theorem ep_Q2_019_partial_21_0501_valid :
    mulPoly ep_Q2_019_coefficient_21_0501
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0502 : Poly :=
[
  term ((-178844193691970754827466895881998484532 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 502 for generator 21. -/
def ep_Q2_019_partial_21_0502 : Poly :=
[
  term ((-357688387383941509654933791763996969064 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((178844193691970754827466895881998484532 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 21. -/
theorem ep_Q2_019_partial_21_0502_valid :
    mulPoly ep_Q2_019_coefficient_21_0502
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0503 : Poly :=
[
  term ((-697966031230715680934905689160078806887 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (16, 1)]
]

/-- Partial product 503 for generator 21. -/
def ep_Q2_019_partial_21_0503 : Poly :=
[
  term ((-697966031230715680934905689160078806887 : Rat) / 20620160143976233712141339724864350120) [(6, 1), (10, 1), (16, 1)],
  term ((697966031230715680934905689160078806887 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 21. -/
theorem ep_Q2_019_partial_21_0503_valid :
    mulPoly ep_Q2_019_coefficient_21_0503
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0504 : Poly :=
[
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 1), (16, 1)]
]

/-- Partial product 504 for generator 21. -/
def ep_Q2_019_partial_21_0504 : Poly :=
[
  term ((41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 21. -/
theorem ep_Q2_019_partial_21_0504_valid :
    mulPoly ep_Q2_019_coefficient_21_0504
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0505 : Poly :=
[
  term ((-266635318554191336353521236048964348 : Rat) / 894241638896928502822456059496668245) [(6, 2), (16, 1)]
]

/-- Partial product 505 for generator 21. -/
def ep_Q2_019_partial_21_0505 : Poly :=
[
  term ((-533270637108382672707042472097928696 : Rat) / 894241638896928502822456059496668245) [(6, 2), (10, 1), (16, 1)],
  term ((266635318554191336353521236048964348 : Rat) / 894241638896928502822456059496668245) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 21. -/
theorem ep_Q2_019_partial_21_0505_valid :
    mulPoly ep_Q2_019_coefficient_21_0505
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0506 : Poly :=
[
  term ((-577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 506 for generator 21. -/
def ep_Q2_019_partial_21_0506 : Poly :=
[
  term ((-1154870177093119609432281929175136938816 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 21. -/
theorem ep_Q2_019_partial_21_0506_valid :
    mulPoly ep_Q2_019_coefficient_21_0506
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0507 : Poly :=
[
  term ((-163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 507 for generator 21. -/
def ep_Q2_019_partial_21_0507 : Poly :=
[
  term ((-326122285044222404326063845936125337312 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 21. -/
theorem ep_Q2_019_partial_21_0507_valid :
    mulPoly ep_Q2_019_coefficient_21_0507
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0508 : Poly :=
[
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 508 for generator 21. -/
def ep_Q2_019_partial_21_0508 : Poly :=
[
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 21. -/
theorem ep_Q2_019_partial_21_0508_valid :
    mulPoly ep_Q2_019_coefficient_21_0508
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0509 : Poly :=
[
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 509 for generator 21. -/
def ep_Q2_019_partial_21_0509 : Poly :=
[
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 21. -/
theorem ep_Q2_019_partial_21_0509_valid :
    mulPoly ep_Q2_019_coefficient_21_0509
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0510 : Poly :=
[
  term ((-328128258340883340663667296879855744 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 510 for generator 21. -/
def ep_Q2_019_partial_21_0510 : Poly :=
[
  term ((-656256516681766681327334593759711488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((328128258340883340663667296879855744 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 21. -/
theorem ep_Q2_019_partial_21_0510_valid :
    mulPoly ep_Q2_019_coefficient_21_0510
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0511 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 511 for generator 21. -/
def ep_Q2_019_partial_21_0511 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 21. -/
theorem ep_Q2_019_partial_21_0511_valid :
    mulPoly ep_Q2_019_coefficient_21_0511
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0512 : Poly :=
[
  term ((-500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 512 for generator 21. -/
def ep_Q2_019_partial_21_0512 : Poly :=
[
  term ((-1001352458282765253782645800386220505264 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 21. -/
theorem ep_Q2_019_partial_21_0512_valid :
    mulPoly ep_Q2_019_coefficient_21_0512
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0513 : Poly :=
[
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 21. -/
def ep_Q2_019_partial_21_0513 : Poly :=
[
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 21. -/
theorem ep_Q2_019_partial_21_0513_valid :
    mulPoly ep_Q2_019_coefficient_21_0513
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0514 : Poly :=
[
  term ((-572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 514 for generator 21. -/
def ep_Q2_019_partial_21_0514 : Poly :=
[
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 21. -/
theorem ep_Q2_019_partial_21_0514_valid :
    mulPoly ep_Q2_019_coefficient_21_0514
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0515 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 515 for generator 21. -/
def ep_Q2_019_partial_21_0515 : Poly :=
[
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 21. -/
theorem ep_Q2_019_partial_21_0515_valid :
    mulPoly ep_Q2_019_coefficient_21_0515
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0516 : Poly :=
[
  term ((993642049792312595099482254423593012297 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 516 for generator 21. -/
def ep_Q2_019_partial_21_0516 : Poly :=
[
  term ((1987284099584625190198964508847186024594 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-993642049792312595099482254423593012297 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 21. -/
theorem ep_Q2_019_partial_21_0516_valid :
    mulPoly ep_Q2_019_coefficient_21_0516
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0517 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 517 for generator 21. -/
def ep_Q2_019_partial_21_0517 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 21. -/
theorem ep_Q2_019_partial_21_0517_valid :
    mulPoly ep_Q2_019_coefficient_21_0517
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0518 : Poly :=
[
  term ((989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 21. -/
def ep_Q2_019_partial_21_0518 : Poly :=
[
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 21. -/
theorem ep_Q2_019_partial_21_0518_valid :
    mulPoly ep_Q2_019_coefficient_21_0518
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0519 : Poly :=
[
  term ((-16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 519 for generator 21. -/
def ep_Q2_019_partial_21_0519 : Poly :=
[
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 21. -/
theorem ep_Q2_019_partial_21_0519_valid :
    mulPoly ep_Q2_019_coefficient_21_0519
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0520 : Poly :=
[
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 520 for generator 21. -/
def ep_Q2_019_partial_21_0520 : Poly :=
[
  term ((-261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 21. -/
theorem ep_Q2_019_partial_21_0520_valid :
    mulPoly ep_Q2_019_coefficient_21_0520
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0521 : Poly :=
[
  term ((-4993571644111602561710941139847881292 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 521 for generator 21. -/
def ep_Q2_019_partial_21_0521 : Poly :=
[
  term ((-9987143288223205123421882279695762584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((4993571644111602561710941139847881292 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 21. -/
theorem ep_Q2_019_partial_21_0521_valid :
    mulPoly ep_Q2_019_coefficient_21_0521
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0522 : Poly :=
[
  term ((1144498561514249226014365061472607541266 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 522 for generator 21. -/
def ep_Q2_019_partial_21_0522 : Poly :=
[
  term ((2288997123028498452028730122945215082532 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1144498561514249226014365061472607541266 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 21. -/
theorem ep_Q2_019_partial_21_0522_valid :
    mulPoly ep_Q2_019_coefficient_21_0522
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0523 : Poly :=
[
  term ((4874118650625680300699494759676888783 : Rat) / 2146179933352628406773894542792003788) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 523 for generator 21. -/
def ep_Q2_019_partial_21_0523 : Poly :=
[
  term ((4874118650625680300699494759676888783 : Rat) / 1073089966676314203386947271396001894) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4874118650625680300699494759676888783 : Rat) / 2146179933352628406773894542792003788) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 21. -/
theorem ep_Q2_019_partial_21_0523_valid :
    mulPoly ep_Q2_019_coefficient_21_0523
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0524 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 524 for generator 21. -/
def ep_Q2_019_partial_21_0524 : Poly :=
[
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 21. -/
theorem ep_Q2_019_partial_21_0524_valid :
    mulPoly ep_Q2_019_coefficient_21_0524
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0525 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 525 for generator 21. -/
def ep_Q2_019_partial_21_0525 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 21. -/
theorem ep_Q2_019_partial_21_0525_valid :
    mulPoly ep_Q2_019_coefficient_21_0525
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0526 : Poly :=
[
  term ((500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 526 for generator 21. -/
def ep_Q2_019_partial_21_0526 : Poly :=
[
  term ((-500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((1001352458282765253782645800386220505264 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 21. -/
theorem ep_Q2_019_partial_21_0526_valid :
    mulPoly ep_Q2_019_coefficient_21_0526
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0527 : Poly :=
[
  term ((-388239249814810225425005342676910412992 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 21. -/
def ep_Q2_019_partial_21_0527 : Poly :=
[
  term ((388239249814810225425005342676910412992 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-776478499629620450850010685353820825984 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 21. -/
theorem ep_Q2_019_partial_21_0527_valid :
    mulPoly ep_Q2_019_coefficient_21_0527
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0528 : Poly :=
[
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 528 for generator 21. -/
def ep_Q2_019_partial_21_0528 : Poly :=
[
  term ((-572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 21. -/
theorem ep_Q2_019_partial_21_0528_valid :
    mulPoly ep_Q2_019_coefficient_21_0528
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0529 : Poly :=
[
  term ((-1807030945773904649053885397579151557024 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 529 for generator 21. -/
def ep_Q2_019_partial_21_0529 : Poly :=
[
  term ((1807030945773904649053885397579151557024 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3614061891547809298107770795158303114048 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 21. -/
theorem ep_Q2_019_partial_21_0529_valid :
    mulPoly ep_Q2_019_coefficient_21_0529
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0530 : Poly :=
[
  term ((-11495749770386861645187615075629201026967 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 530 for generator 21. -/
def ep_Q2_019_partial_21_0530 : Poly :=
[
  term ((11495749770386861645187615075629201026967 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-11495749770386861645187615075629201026967 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 21. -/
theorem ep_Q2_019_partial_21_0530_valid :
    mulPoly ep_Q2_019_coefficient_21_0530
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0531 : Poly :=
[
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 531 for generator 21. -/
def ep_Q2_019_partial_21_0531 : Poly :=
[
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 21. -/
theorem ep_Q2_019_partial_21_0531_valid :
    mulPoly ep_Q2_019_coefficient_21_0531
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0532 : Poly :=
[
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 21. -/
def ep_Q2_019_partial_21_0532 : Poly :=
[
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 21. -/
theorem ep_Q2_019_partial_21_0532_valid :
    mulPoly ep_Q2_019_coefficient_21_0532
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0533 : Poly :=
[
  term ((-199121750034077785102564683773052764080 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 533 for generator 21. -/
def ep_Q2_019_partial_21_0533 : Poly :=
[
  term ((-398243500068155570205129367546105528160 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((199121750034077785102564683773052764080 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 21. -/
theorem ep_Q2_019_partial_21_0533_valid :
    mulPoly ep_Q2_019_coefficient_21_0533
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0534 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 534 for generator 21. -/
def ep_Q2_019_partial_21_0534 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 21. -/
theorem ep_Q2_019_partial_21_0534_valid :
    mulPoly ep_Q2_019_coefficient_21_0534
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0535 : Poly :=
[
  term ((250338114570691313445661450096555126316 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 535 for generator 21. -/
def ep_Q2_019_partial_21_0535 : Poly :=
[
  term ((500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-250338114570691313445661450096555126316 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 21. -/
theorem ep_Q2_019_partial_21_0535_valid :
    mulPoly ep_Q2_019_coefficient_21_0535
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0536 : Poly :=
[
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 536 for generator 21. -/
def ep_Q2_019_partial_21_0536 : Poly :=
[
  term ((261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 21. -/
theorem ep_Q2_019_partial_21_0536_valid :
    mulPoly ep_Q2_019_coefficient_21_0536
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0537 : Poly :=
[
  term ((-194119624907405112712502671338455206496 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 537 for generator 21. -/
def ep_Q2_019_partial_21_0537 : Poly :=
[
  term ((-388239249814810225425005342676910412992 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((194119624907405112712502671338455206496 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 21. -/
theorem ep_Q2_019_partial_21_0537_valid :
    mulPoly ep_Q2_019_coefficient_21_0537
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0538 : Poly :=
[
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 538 for generator 21. -/
def ep_Q2_019_partial_21_0538 : Poly :=
[
  term ((-1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 21. -/
theorem ep_Q2_019_partial_21_0538_valid :
    mulPoly ep_Q2_019_coefficient_21_0538
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0539 : Poly :=
[
  term ((3180211021734270824357599731400139169925 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 539 for generator 21. -/
def ep_Q2_019_partial_21_0539 : Poly :=
[
  term ((6360422043468541648715199462800278339850 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-3180211021734270824357599731400139169925 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 21. -/
theorem ep_Q2_019_partial_21_0539_valid :
    mulPoly ep_Q2_019_coefficient_21_0539
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0540 : Poly :=
[
  term ((-5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 540 for generator 21. -/
def ep_Q2_019_partial_21_0540 : Poly :=
[
  term ((-11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 21. -/
theorem ep_Q2_019_partial_21_0540_valid :
    mulPoly ep_Q2_019_coefficient_21_0540
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0541 : Poly :=
[
  term ((-903515472886952324526942698789575778512 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 21. -/
def ep_Q2_019_partial_21_0541 : Poly :=
[
  term ((-1807030945773904649053885397579151557024 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((903515472886952324526942698789575778512 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 21. -/
theorem ep_Q2_019_partial_21_0541_valid :
    mulPoly ep_Q2_019_coefficient_21_0541
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0542 : Poly :=
[
  term ((-11495749770386861645187615075629201026967 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 542 for generator 21. -/
def ep_Q2_019_partial_21_0542 : Poly :=
[
  term ((-11495749770386861645187615075629201026967 : Rat) / 175271361223797986553201387661346976020) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((11495749770386861645187615075629201026967 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 21. -/
theorem ep_Q2_019_partial_21_0542_valid :
    mulPoly ep_Q2_019_coefficient_21_0542
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0543 : Poly :=
[
  term ((577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 543 for generator 21. -/
def ep_Q2_019_partial_21_0543 : Poly :=
[
  term ((-577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((1154870177093119609432281929175136938816 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 21. -/
theorem ep_Q2_019_partial_21_0543_valid :
    mulPoly ep_Q2_019_coefficient_21_0543
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0544 : Poly :=
[
  term ((163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 544 for generator 21. -/
def ep_Q2_019_partial_21_0544 : Poly :=
[
  term ((-163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((326122285044222404326063845936125337312 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 21. -/
theorem ep_Q2_019_partial_21_0544_valid :
    mulPoly ep_Q2_019_coefficient_21_0544
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0545 : Poly :=
[
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 545 for generator 21. -/
def ep_Q2_019_partial_21_0545 : Poly :=
[
  term ((-1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 21. -/
theorem ep_Q2_019_partial_21_0545_valid :
    mulPoly ep_Q2_019_coefficient_21_0545
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0546 : Poly :=
[
  term ((288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 546 for generator 21. -/
def ep_Q2_019_partial_21_0546 : Poly :=
[
  term ((577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 21. -/
theorem ep_Q2_019_partial_21_0546_valid :
    mulPoly ep_Q2_019_coefficient_21_0546
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0547 : Poly :=
[
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 547 for generator 21. -/
def ep_Q2_019_partial_21_0547 : Poly :=
[
  term ((-7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 21. -/
theorem ep_Q2_019_partial_21_0547_valid :
    mulPoly ep_Q2_019_coefficient_21_0547
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0548 : Poly :=
[
  term ((81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 548 for generator 21. -/
def ep_Q2_019_partial_21_0548 : Poly :=
[
  term ((163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 21. -/
theorem ep_Q2_019_partial_21_0548_valid :
    mulPoly ep_Q2_019_coefficient_21_0548
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0549 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 549 for generator 21. -/
def ep_Q2_019_partial_21_0549 : Poly :=
[
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 21. -/
theorem ep_Q2_019_partial_21_0549_valid :
    mulPoly ep_Q2_019_coefficient_21_0549
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0550 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 21. -/
def ep_Q2_019_partial_21_0550 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 21. -/
theorem ep_Q2_019_partial_21_0550_valid :
    mulPoly ep_Q2_019_coefficient_21_0550
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0551 : Poly :=
[
  term ((533686720486359594218416661729056844498 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 21. -/
def ep_Q2_019_partial_21_0551 : Poly :=
[
  term ((-533686720486359594218416661729056844498 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1067373440972719188436833323458113688996 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 21. -/
theorem ep_Q2_019_partial_21_0551_valid :
    mulPoly ep_Q2_019_coefficient_21_0551
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0552 : Poly :=
[
  term ((748070617311595229195223916109020389472 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 552 for generator 21. -/
def ep_Q2_019_partial_21_0552 : Poly :=
[
  term ((-748070617311595229195223916109020389472 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1496141234623190458390447832218040778944 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 21. -/
theorem ep_Q2_019_partial_21_0552_valid :
    mulPoly ep_Q2_019_coefficient_21_0552
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0553 : Poly :=
[
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 553 for generator 21. -/
def ep_Q2_019_partial_21_0553 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 21. -/
theorem ep_Q2_019_partial_21_0553_valid :
    mulPoly ep_Q2_019_coefficient_21_0553
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0554 : Poly :=
[
  term ((-20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 554 for generator 21. -/
def ep_Q2_019_partial_21_0554 : Poly :=
[
  term ((20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40014899455245936214724738105760807448 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 21. -/
theorem ep_Q2_019_partial_21_0554_valid :
    mulPoly ep_Q2_019_coefficient_21_0554
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0555 : Poly :=
[
  term ((-20219967649044038267235049494040764734357 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 555 for generator 21. -/
def ep_Q2_019_partial_21_0555 : Poly :=
[
  term ((20219967649044038267235049494040764734357 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20219967649044038267235049494040764734357 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 21. -/
theorem ep_Q2_019_partial_21_0555_valid :
    mulPoly ep_Q2_019_coefficient_21_0555
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0556 : Poly :=
[
  term ((45472262240335686882656011250664241482979 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 556 for generator 21. -/
def ep_Q2_019_partial_21_0556 : Poly :=
[
  term ((-45472262240335686882656011250664241482979 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((45472262240335686882656011250664241482979 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 21. -/
theorem ep_Q2_019_partial_21_0556_valid :
    mulPoly ep_Q2_019_coefficient_21_0556
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0557 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 557 for generator 21. -/
def ep_Q2_019_partial_21_0557 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 21. -/
theorem ep_Q2_019_partial_21_0557_valid :
    mulPoly ep_Q2_019_coefficient_21_0557
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0558 : Poly :=
[
  term ((699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 558 for generator 21. -/
def ep_Q2_019_partial_21_0558 : Poly :=
[
  term ((1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 21. -/
theorem ep_Q2_019_partial_21_0558_valid :
    mulPoly ep_Q2_019_coefficient_21_0558
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0559 : Poly :=
[
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 559 for generator 21. -/
def ep_Q2_019_partial_21_0559 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 21. -/
theorem ep_Q2_019_partial_21_0559_valid :
    mulPoly ep_Q2_019_coefficient_21_0559
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0560 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 21. -/
def ep_Q2_019_partial_21_0560 : Poly :=
[
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 21. -/
theorem ep_Q2_019_partial_21_0560_valid :
    mulPoly ep_Q2_019_coefficient_21_0560
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0561 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 561 for generator 21. -/
def ep_Q2_019_partial_21_0561 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 21. -/
theorem ep_Q2_019_partial_21_0561_valid :
    mulPoly ep_Q2_019_coefficient_21_0561
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0562 : Poly :=
[
  term ((-22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 562 for generator 21. -/
def ep_Q2_019_partial_21_0562 : Poly :=
[
  term ((-22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 21. -/
theorem ep_Q2_019_partial_21_0562_valid :
    mulPoly ep_Q2_019_coefficient_21_0562
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0563 : Poly :=
[
  term ((572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 563 for generator 21. -/
def ep_Q2_019_partial_21_0563 : Poly :=
[
  term ((1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 21. -/
theorem ep_Q2_019_partial_21_0563_valid :
    mulPoly ep_Q2_019_coefficient_21_0563
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0564 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 564 for generator 21. -/
def ep_Q2_019_partial_21_0564 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 21. -/
theorem ep_Q2_019_partial_21_0564_valid :
    mulPoly ep_Q2_019_coefficient_21_0564
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0565 : Poly :=
[
  term ((266843360243179797109208330864528422249 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 565 for generator 21. -/
def ep_Q2_019_partial_21_0565 : Poly :=
[
  term ((533686720486359594218416661729056844498 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-266843360243179797109208330864528422249 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 21. -/
theorem ep_Q2_019_partial_21_0565_valid :
    mulPoly ep_Q2_019_coefficient_21_0565
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0566 : Poly :=
[
  term ((-259621682172500735100365391538974907072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 566 for generator 21. -/
def ep_Q2_019_partial_21_0566 : Poly :=
[
  term ((-519243364345001470200730783077949814144 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((259621682172500735100365391538974907072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 21. -/
theorem ep_Q2_019_partial_21_0566_valid :
    mulPoly ep_Q2_019_coefficient_21_0566
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0567 : Poly :=
[
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 567 for generator 21. -/
def ep_Q2_019_partial_21_0567 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 21. -/
theorem ep_Q2_019_partial_21_0567_valid :
    mulPoly ep_Q2_019_coefficient_21_0567
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0568 : Poly :=
[
  term ((32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 568 for generator 21. -/
def ep_Q2_019_partial_21_0568 : Poly :=
[
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 21. -/
theorem ep_Q2_019_partial_21_0568_valid :
    mulPoly ep_Q2_019_coefficient_21_0568
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0569 : Poly :=
[
  term ((-10003724863811484053681184526440201862 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 569 for generator 21. -/
def ep_Q2_019_partial_21_0569 : Poly :=
[
  term ((-20007449727622968107362369052880403724 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((10003724863811484053681184526440201862 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 21. -/
theorem ep_Q2_019_partial_21_0569_valid :
    mulPoly ep_Q2_019_coefficient_21_0569
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0570 : Poly :=
[
  term ((-2576236772177447573403595486240109267377 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 570 for generator 21. -/
def ep_Q2_019_partial_21_0570 : Poly :=
[
  term ((-2576236772177447573403595486240109267377 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2576236772177447573403595486240109267377 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 21. -/
theorem ep_Q2_019_partial_21_0570_valid :
    mulPoly ep_Q2_019_coefficient_21_0570
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0571 : Poly :=
[
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 571 for generator 21. -/
def ep_Q2_019_partial_21_0571 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 21. -/
theorem ep_Q2_019_partial_21_0571_valid :
    mulPoly ep_Q2_019_coefficient_21_0571
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0572 : Poly :=
[
  term ((45472262240335686882656011250664241482979 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 572 for generator 21. -/
def ep_Q2_019_partial_21_0572 : Poly :=
[
  term ((45472262240335686882656011250664241482979 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-45472262240335686882656011250664241482979 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 21. -/
theorem ep_Q2_019_partial_21_0572_valid :
    mulPoly ep_Q2_019_coefficient_21_0572
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0573 : Poly :=
[
  term ((-159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 573 for generator 21. -/
def ep_Q2_019_partial_21_0573 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 21. -/
theorem ep_Q2_019_partial_21_0573_valid :
    mulPoly ep_Q2_019_coefficient_21_0573
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0574 : Poly :=
[
  term ((-234587195455785662462164569531427224 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 574 for generator 21. -/
def ep_Q2_019_partial_21_0574 : Poly :=
[
  term ((-469174390911571324924329139062854448 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((234587195455785662462164569531427224 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 21. -/
theorem ep_Q2_019_partial_21_0574_valid :
    mulPoly ep_Q2_019_coefficient_21_0574
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0575 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 575 for generator 21. -/
def ep_Q2_019_partial_21_0575 : Poly :=
[
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 21. -/
theorem ep_Q2_019_partial_21_0575_valid :
    mulPoly ep_Q2_019_coefficient_21_0575
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0576 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 21. -/
def ep_Q2_019_partial_21_0576 : Poly :=
[
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 21. -/
theorem ep_Q2_019_partial_21_0576_valid :
    mulPoly ep_Q2_019_coefficient_21_0576
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0577 : Poly :=
[
  term ((48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 577 for generator 21. -/
def ep_Q2_019_partial_21_0577 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 21. -/
theorem ep_Q2_019_partial_21_0577_valid :
    mulPoly ep_Q2_019_coefficient_21_0577
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0578 : Poly :=
[
  term ((46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 21. -/
def ep_Q2_019_partial_21_0578 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 21. -/
theorem ep_Q2_019_partial_21_0578_valid :
    mulPoly ep_Q2_019_coefficient_21_0578
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0579 : Poly :=
[
  term ((157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 579 for generator 21. -/
def ep_Q2_019_partial_21_0579 : Poly :=
[
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (10, 1), (16, 1)],
  term ((314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 21. -/
theorem ep_Q2_019_partial_21_0579_valid :
    mulPoly ep_Q2_019_coefficient_21_0579
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0580 : Poly :=
[
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 580 for generator 21. -/
def ep_Q2_019_partial_21_0580 : Poly :=
[
  term ((41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 21. -/
theorem ep_Q2_019_partial_21_0580_valid :
    mulPoly ep_Q2_019_coefficient_21_0580
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0581 : Poly :=
[
  term ((78723733034873093092581718579664797936 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (16, 1)]
]

/-- Partial product 581 for generator 21. -/
def ep_Q2_019_partial_21_0581 : Poly :=
[
  term ((157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (10, 1), (16, 1)],
  term ((-78723733034873093092581718579664797936 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 21. -/
theorem ep_Q2_019_partial_21_0581_valid :
    mulPoly ep_Q2_019_coefficient_21_0581
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0582 : Poly :=
[
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 582 for generator 21. -/
def ep_Q2_019_partial_21_0582 : Poly :=
[
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 21. -/
theorem ep_Q2_019_partial_21_0582_valid :
    mulPoly ep_Q2_019_coefficient_21_0582
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0583 : Poly :=
[
  term ((191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 583 for generator 21. -/
def ep_Q2_019_partial_21_0583 : Poly :=
[
  term ((383571145058965553171694488694230387136 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 21. -/
theorem ep_Q2_019_partial_21_0583_valid :
    mulPoly ep_Q2_019_coefficient_21_0583
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0584 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 584 for generator 21. -/
def ep_Q2_019_partial_21_0584 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 21. -/
theorem ep_Q2_019_partial_21_0584_valid :
    mulPoly ep_Q2_019_coefficient_21_0584
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0585 : Poly :=
[
  term ((184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 585 for generator 21. -/
def ep_Q2_019_partial_21_0585 : Poly :=
[
  term ((368570679272258420188685258366876988704 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 21. -/
theorem ep_Q2_019_partial_21_0585_valid :
    mulPoly ep_Q2_019_coefficient_21_0585
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0586 : Poly :=
[
  term ((-1633753446694062854398242727932924032473 : Rat) / 131453520917848489914901040746010232015) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 586 for generator 21. -/
def ep_Q2_019_partial_21_0586 : Poly :=
[
  term ((-3267506893388125708796485455865848064946 : Rat) / 131453520917848489914901040746010232015) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1633753446694062854398242727932924032473 : Rat) / 131453520917848489914901040746010232015) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 21. -/
theorem ep_Q2_019_partial_21_0586_valid :
    mulPoly ep_Q2_019_coefficient_21_0586
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0587 : Poly :=
[
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 587 for generator 21. -/
def ep_Q2_019_partial_21_0587 : Poly :=
[
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 21. -/
theorem ep_Q2_019_partial_21_0587_valid :
    mulPoly ep_Q2_019_coefficient_21_0587
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0588 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 588 for generator 21. -/
def ep_Q2_019_partial_21_0588 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 21. -/
theorem ep_Q2_019_partial_21_0588_valid :
    mulPoly ep_Q2_019_coefficient_21_0588
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0589 : Poly :=
[
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 589 for generator 21. -/
def ep_Q2_019_partial_21_0589 : Poly :=
[
  term ((352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 21. -/
theorem ep_Q2_019_partial_21_0589_valid :
    mulPoly ep_Q2_019_coefficient_21_0589
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0590 : Poly :=
[
  term ((-36794799227106577513981514585066308446 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 590 for generator 21. -/
def ep_Q2_019_partial_21_0590 : Poly :=
[
  term ((-73589598454213155027963029170132616892 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((36794799227106577513981514585066308446 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 21. -/
theorem ep_Q2_019_partial_21_0590_valid :
    mulPoly ep_Q2_019_coefficient_21_0590
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0591 : Poly :=
[
  term ((-81108659903948216366074042878259611073199 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 591 for generator 21. -/
def ep_Q2_019_partial_21_0591 : Poly :=
[
  term ((-162217319807896432732148085756519222146398 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((81108659903948216366074042878259611073199 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 21. -/
theorem ep_Q2_019_partial_21_0591_valid :
    mulPoly ep_Q2_019_coefficient_21_0591
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0592 : Poly :=
[
  term ((-90947776118790125370928459374870289011068 : Rat) / 1025337463159218221336228117818879809717) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 21. -/
def ep_Q2_019_partial_21_0592 : Poly :=
[
  term ((-181895552237580250741856918749740578022136 : Rat) / 1025337463159218221336228117818879809717) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((90947776118790125370928459374870289011068 : Rat) / 1025337463159218221336228117818879809717) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 21. -/
theorem ep_Q2_019_partial_21_0592_valid :
    mulPoly ep_Q2_019_coefficient_21_0592
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0593 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 593 for generator 21. -/
def ep_Q2_019_partial_21_0593 : Poly :=
[
  term ((91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 21. -/
theorem ep_Q2_019_partial_21_0593_valid :
    mulPoly ep_Q2_019_coefficient_21_0593
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0594 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 594 for generator 21. -/
def ep_Q2_019_partial_21_0594 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 21. -/
theorem ep_Q2_019_partial_21_0594_valid :
    mulPoly ep_Q2_019_coefficient_21_0594
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0595 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 595 for generator 21. -/
def ep_Q2_019_partial_21_0595 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 21. -/
theorem ep_Q2_019_partial_21_0595_valid :
    mulPoly ep_Q2_019_coefficient_21_0595
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0596 : Poly :=
[
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 596 for generator 21. -/
def ep_Q2_019_partial_21_0596 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 21. -/
theorem ep_Q2_019_partial_21_0596_valid :
    mulPoly ep_Q2_019_coefficient_21_0596
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0597 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 597 for generator 21. -/
def ep_Q2_019_partial_21_0597 : Poly :=
[
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 21. -/
theorem ep_Q2_019_partial_21_0597_valid :
    mulPoly ep_Q2_019_coefficient_21_0597
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0598 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 598 for generator 21. -/
def ep_Q2_019_partial_21_0598 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 21. -/
theorem ep_Q2_019_partial_21_0598_valid :
    mulPoly ep_Q2_019_coefficient_21_0598
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0599 : Poly :=
[
  term ((-840181957710930695993498037475859094929 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 21. -/
def ep_Q2_019_partial_21_0599 : Poly :=
[
  term ((-1680363915421861391986996074951718189858 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((840181957710930695993498037475859094929 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 21. -/
theorem ep_Q2_019_partial_21_0599_valid :
    mulPoly ep_Q2_019_coefficient_21_0599
        ep_Q2_019_generator_21_0500_0599 =
      ep_Q2_019_partial_21_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0500_0599 : List Poly :=
[
  ep_Q2_019_partial_21_0500,
  ep_Q2_019_partial_21_0501,
  ep_Q2_019_partial_21_0502,
  ep_Q2_019_partial_21_0503,
  ep_Q2_019_partial_21_0504,
  ep_Q2_019_partial_21_0505,
  ep_Q2_019_partial_21_0506,
  ep_Q2_019_partial_21_0507,
  ep_Q2_019_partial_21_0508,
  ep_Q2_019_partial_21_0509,
  ep_Q2_019_partial_21_0510,
  ep_Q2_019_partial_21_0511,
  ep_Q2_019_partial_21_0512,
  ep_Q2_019_partial_21_0513,
  ep_Q2_019_partial_21_0514,
  ep_Q2_019_partial_21_0515,
  ep_Q2_019_partial_21_0516,
  ep_Q2_019_partial_21_0517,
  ep_Q2_019_partial_21_0518,
  ep_Q2_019_partial_21_0519,
  ep_Q2_019_partial_21_0520,
  ep_Q2_019_partial_21_0521,
  ep_Q2_019_partial_21_0522,
  ep_Q2_019_partial_21_0523,
  ep_Q2_019_partial_21_0524,
  ep_Q2_019_partial_21_0525,
  ep_Q2_019_partial_21_0526,
  ep_Q2_019_partial_21_0527,
  ep_Q2_019_partial_21_0528,
  ep_Q2_019_partial_21_0529,
  ep_Q2_019_partial_21_0530,
  ep_Q2_019_partial_21_0531,
  ep_Q2_019_partial_21_0532,
  ep_Q2_019_partial_21_0533,
  ep_Q2_019_partial_21_0534,
  ep_Q2_019_partial_21_0535,
  ep_Q2_019_partial_21_0536,
  ep_Q2_019_partial_21_0537,
  ep_Q2_019_partial_21_0538,
  ep_Q2_019_partial_21_0539,
  ep_Q2_019_partial_21_0540,
  ep_Q2_019_partial_21_0541,
  ep_Q2_019_partial_21_0542,
  ep_Q2_019_partial_21_0543,
  ep_Q2_019_partial_21_0544,
  ep_Q2_019_partial_21_0545,
  ep_Q2_019_partial_21_0546,
  ep_Q2_019_partial_21_0547,
  ep_Q2_019_partial_21_0548,
  ep_Q2_019_partial_21_0549,
  ep_Q2_019_partial_21_0550,
  ep_Q2_019_partial_21_0551,
  ep_Q2_019_partial_21_0552,
  ep_Q2_019_partial_21_0553,
  ep_Q2_019_partial_21_0554,
  ep_Q2_019_partial_21_0555,
  ep_Q2_019_partial_21_0556,
  ep_Q2_019_partial_21_0557,
  ep_Q2_019_partial_21_0558,
  ep_Q2_019_partial_21_0559,
  ep_Q2_019_partial_21_0560,
  ep_Q2_019_partial_21_0561,
  ep_Q2_019_partial_21_0562,
  ep_Q2_019_partial_21_0563,
  ep_Q2_019_partial_21_0564,
  ep_Q2_019_partial_21_0565,
  ep_Q2_019_partial_21_0566,
  ep_Q2_019_partial_21_0567,
  ep_Q2_019_partial_21_0568,
  ep_Q2_019_partial_21_0569,
  ep_Q2_019_partial_21_0570,
  ep_Q2_019_partial_21_0571,
  ep_Q2_019_partial_21_0572,
  ep_Q2_019_partial_21_0573,
  ep_Q2_019_partial_21_0574,
  ep_Q2_019_partial_21_0575,
  ep_Q2_019_partial_21_0576,
  ep_Q2_019_partial_21_0577,
  ep_Q2_019_partial_21_0578,
  ep_Q2_019_partial_21_0579,
  ep_Q2_019_partial_21_0580,
  ep_Q2_019_partial_21_0581,
  ep_Q2_019_partial_21_0582,
  ep_Q2_019_partial_21_0583,
  ep_Q2_019_partial_21_0584,
  ep_Q2_019_partial_21_0585,
  ep_Q2_019_partial_21_0586,
  ep_Q2_019_partial_21_0587,
  ep_Q2_019_partial_21_0588,
  ep_Q2_019_partial_21_0589,
  ep_Q2_019_partial_21_0590,
  ep_Q2_019_partial_21_0591,
  ep_Q2_019_partial_21_0592,
  ep_Q2_019_partial_21_0593,
  ep_Q2_019_partial_21_0594,
  ep_Q2_019_partial_21_0595,
  ep_Q2_019_partial_21_0596,
  ep_Q2_019_partial_21_0597,
  ep_Q2_019_partial_21_0598,
  ep_Q2_019_partial_21_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0500_0599 : Poly :=
[
  term ((213851318818602760940850436850732352419 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2224593004166771907455189805143422750861 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-357688387383941509654933791763996969064 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-697966031230715680934905689160078806887 : Rat) / 20620160143976233712141339724864350120) [(6, 1), (10, 1), (16, 1)],
  term ((-213851318818602760940850436850732352419 : Rat) / 12519382944556999039514384832953355430) [(6, 1), (14, 1), (16, 1)],
  term ((2224593004166771907455189805143422750861 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 2), (16, 1)],
  term ((178844193691970754827466895881998484532 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (15, 2), (16, 1)],
  term ((697966031230715680934905689160078806887 : Rat) / 41240320287952467424282679449728700240) [(6, 1), (16, 1)],
  term ((41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-533270637108382672707042472097928696 : Rat) / 894241638896928502822456059496668245) [(6, 2), (10, 1), (16, 1)],
  term ((-20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 1), (16, 1)],
  term ((266635318554191336353521236048964348 : Rat) / 894241638896928502822456059496668245) [(6, 2), (16, 1)],
  term ((-1154870177093119609432281929175136938816 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-326122285044222404326063845936125337312 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-656256516681766681327334593759711488 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((577435088546559804716140964587568469408 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((163061142522111202163031922968062668656 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((328128258340883340663667296879855744 : Rat) / 894241638896928502822456059496668245) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1001352458282765253782645800386220505264 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1987284099584625190198964508847186024594 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32254102473005731847646466222550304 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9987143288223205123421882279695762584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((2288997123028498452028730122945215082532 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4874118650625680300699494759676888783 : Rat) / 1073089966676314203386947271396001894) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((500676229141382626891322900193110252632 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((572601168252413226027654505071092589353 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-993642049792312595099482254423593012297 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((16127051236502865923823233111275152 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((4993571644111602561710941139847881292 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1144498561514249226014365061472607541266 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4874118650625680300699494759676888783 : Rat) / 2146179933352628406773894542792003788) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((39372931123919240970663571141014869051 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1001352458282765253782645800386220505264 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-776478499629620450850010685353820825984 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1145202336504826452055309010142185178706 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3614061891547809298107770795158303114048 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-11495749770386861645187615075629201026967 : Rat) / 87635680611898993276600693830673488010) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((199121750034077785102564683773052764080 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-250338114570691313445661450096555126316 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((194119624907405112712502671338455206496 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3180211021734270824357599731400139169925 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((903515472886952324526942698789575778512 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((11495749770386861645187615075629201026967 : Rat) / 350542722447595973106402775322693952040) [(7, 1), (9, 1), (16, 1)],
  term ((-1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1154870177093119609432281929175136938816 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((326122285044222404326063845936125337312 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-288717544273279902358070482293784234704 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81530571261055601081515961484031334328 : Rat) / 2577520017997029214017667465608043765) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181044854522370957056564957026710029088 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5542400072730437466800905368360327939413 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1067373440972719188436833323458113688996 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1496141234623190458390447832218040778944 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-40014899455245936214724738105760807448 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-20219967649044038267235049494040764734357 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((45472262240335686882656011250664241482979 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (11, 1), (16, 1)],
  term ((-266843360243179797109208330864528422249 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((259621682172500735100365391538974907072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-32727189231292607890478141469511728 : Rat) / 178848327779385700564491211899333649) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((10003724863811484053681184526440201862 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (13, 1), (16, 1)],
  term ((2576236772177447573403595486240109267377 : Rat) / 52581408367139395965960416298404092806) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45472262240335686882656011250664241482979 : Rat) / 1051628167342787919319208325968081856120) [(7, 1), (15, 1), (16, 1)],
  term ((159446090813125616216056378197975936 : Rat) / 368217145428147030573952495086863395) [(7, 1), (15, 3), (16, 1)],
  term ((-469174390911571324924329139062854448 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((234587195455785662462164569531427224 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-48100775819104063716100619943667551440 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-46353015374423094552911793743339776868 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (10, 2), (16, 1)],
  term ((-20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 1), (16, 1)],
  term ((-78723733034873093092581718579664797936 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((383571145058965553171694488694230387136 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((368570679272258420188685258366876988704 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3267506893388125708796485455865848064946 : Rat) / 131453520917848489914901040746010232015) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-73589598454213155027963029170132616892 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-162217319807896432732148085756519222146398 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181895552237580250741856918749740578022136 : Rat) / 1025337463159218221336228117818879809717) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-191785572529482776585847244347115193568 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-184285339636129210094342629183438494352 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1633753446694062854398242727932924032473 : Rat) / 131453520917848489914901040746010232015) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((36794799227106577513981514585066308446 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((81108659903948216366074042878259611073199 : Rat) / 5126687315796091106681140589094399048585) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((90947776118790125370928459374870289011068 : Rat) / 1025337463159218221336228117818879809717) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1680363915421861391986996074951718189858 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((840181957710930695993498037475859094929 : Rat) / 569631923977343456297904509899377672065) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 500 through 599. -/
theorem ep_Q2_019_block_21_0500_0599_valid :
    checkProductSumEq ep_Q2_019_partials_21_0500_0599
      ep_Q2_019_block_21_0500_0599 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
