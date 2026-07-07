/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:500-599

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0500 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 500 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0500 : Poly :=
[
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0500_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0500
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0501 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (16, 1)]
]

/-- Partial product 501 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0501 : Poly :=
[
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0501_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0501
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0502 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (13, 1)]
]

/-- Partial product 502 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0502 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0502_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0502
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0503 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 503 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0503 : Poly :=
[
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0503_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0503
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0504 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (15, 1)]
]

/-- Partial product 504 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0504 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0504_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0504
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0505 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 505 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0505 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0505_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0505
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0506 : Poly :=
[
  term ((-16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (11, 1)]
]

/-- Partial product 506 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0506 : Poly :=
[
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (11, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0506_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0506
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0507 : Poly :=
[
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 507 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0507 : Poly :=
[
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0507_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0507
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0508 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 508 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0508 : Poly :=
[
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0508_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0508
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0509 : Poly :=
[
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (16, 1)]
]

/-- Partial product 509 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0509 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0509_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0509
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0510 : Poly :=
[
  term ((2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 510 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0510 : Poly :=
[
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0510_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0510
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0511 : Poly :=
[
  term ((-26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 511 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0511 : Poly :=
[
  term ((-52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0511_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0511
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0512 : Poly :=
[
  term ((-1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 512 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0512 : Poly :=
[
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0512_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0512
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0513 : Poly :=
[
  term ((351297080140464169244 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0513 : Poly :=
[
  term ((702594160280928338488 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-351297080140464169244 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0513_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0513
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0514 : Poly :=
[
  term ((-3663782623129212817013319989242946842717880042760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (13, 1)]
]

/-- Partial product 514 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0514 : Poly :=
[
  term ((3663782623129212817013319989242946842717880042760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (13, 1)],
  term ((-7327565246258425634026639978485893685435760085520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0514_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0514
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0515 : Poly :=
[
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 515 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0515 : Poly :=
[
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0515_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0515
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0516 : Poly :=
[
  term ((306372887185153316050 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (16, 1)]
]

/-- Partial product 516 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0516 : Poly :=
[
  term ((612745774370306632100 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-306372887185153316050 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0516_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0516
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0517 : Poly :=
[
  term ((6670167029935460643975497808092509516070977186327 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 2), (15, 1)]
]

/-- Partial product 517 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0517 : Poly :=
[
  term ((13340334059870921287950995616185019032141954372654 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((-6670167029935460643975497808092509516070977186327 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0517_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0517
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0518 : Poly :=
[
  term ((-258323950585392061953 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 518 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0518 : Poly :=
[
  term ((-516647901170784123906 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((258323950585392061953 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0518_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0518
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0519 : Poly :=
[
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (13, 1), (16, 1)]
]

/-- Partial product 519 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0519 : Poly :=
[
  term ((518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0519_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0519
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0520 : Poly :=
[
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

/-- Partial product 520 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0520 : Poly :=
[
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (14, 1), (15, 1), (16, 1)],
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0520_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0520
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0521 : Poly :=
[
  term ((-453664992484119035378421445648366363613860327440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1)]
]

/-- Partial product 521 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0521 : Poly :=
[
  term ((453664992484119035378421445648366363613860327440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1)],
  term ((-907329984968238070756842891296732727227720654880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0521_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0521
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0522 : Poly :=
[
  term ((4320208083341927160348193813446289797916698013880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 522 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0522 : Poly :=
[
  term ((-4320208083341927160348193813446289797916698013880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1)],
  term ((8640416166683854320696387626892579595833396027760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0522_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0522
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0523 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 523 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0523 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0523_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0523
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0524 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 524 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0524 : Poly :=
[
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0524_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0524
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0525 : Poly :=
[
  term ((80315219319939296887926566839996895814965554200 : Rat) / 16319527458403652002506053552484100535744053793) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 525 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0525 : Poly :=
[
  term ((-80315219319939296887926566839996895814965554200 : Rat) / 16319527458403652002506053552484100535744053793) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((160630438639878593775853133679993791629931108400 : Rat) / 16319527458403652002506053552484100535744053793) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0525_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0525
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0526 : Poly :=
[
  term ((2637143084351146039080031449373084342394202564160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 526 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0526 : Poly :=
[
  term ((-2637143084351146039080031449373084342394202564160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((5274286168702292078160062898746168684788405128320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0526_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0526
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0527 : Poly :=
[
  term ((189594548867862319340 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 527 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0527 : Poly :=
[
  term ((-189594548867862319340 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((379189097735724638680 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0527_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0527
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0528 : Poly :=
[
  term ((145128557172584253580 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 528 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0528 : Poly :=
[
  term ((290257114345168507160 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-145128557172584253580 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0528_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0528
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0529 : Poly :=
[
  term ((-5274286168702292078160062898746168684788405128320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 2)]
]

/-- Partial product 529 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0529 : Poly :=
[
  term ((5274286168702292078160062898746168684788405128320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-10548572337404584156320125797492337369576810256640 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0529_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0529
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0530 : Poly :=
[
  term ((-379189097735724638680 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 530 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0530 : Poly :=
[
  term ((-758378195471449277360 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((379189097735724638680 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0530_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0530
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0531 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 531 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0531 : Poly :=
[
  term ((9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0531_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0531
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0532 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 532 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0532 : Poly :=
[
  term ((-322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0532_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0532
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0533 : Poly :=
[
  term ((1216856876044779312451243906290177825695937034460 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 533 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0533 : Poly :=
[
  term ((-1216856876044779312451243906290177825695937034460 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((2433713752089558624902487812580355651391874068920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0533_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0533
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0534 : Poly :=
[
  term ((-61054924255674739337 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 534 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0534 : Poly :=
[
  term ((61054924255674739337 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-61054924255674739337 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0534_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0534
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0535 : Poly :=
[
  term ((-9119937106906889408 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 535 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0535 : Poly :=
[
  term ((-18239874213813778816 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((9119937106906889408 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0535_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0535
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0536 : Poly :=
[
  term ((-66295833931332841188588569295495071861046287133262207894749430108 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (9, 1), (10, 2)]
]

/-- Partial product 536 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0536 : Poly :=
[
  term ((66295833931332841188588569295495071861046287133262207894749430108 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (9, 1), (10, 2)],
  term ((-132591667862665682377177138590990143722092574266524415789498860216 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0536_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0536
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0537 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (12, 1)]
]

/-- Partial product 537 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0537 : Poly :=
[
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0537_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0537
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0538 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

/-- Partial product 538 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0538 : Poly :=
[
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0538_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0538
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0539 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (14, 1)]
]

/-- Partial product 539 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0539 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0539_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0539
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0540 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 540 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0540 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0540_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0540
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0541 : Poly :=
[
  term ((1812173386831460341678 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 541 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0541 : Poly :=
[
  term ((3624346773662920683356 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1812173386831460341678 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0541_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0541
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0542 : Poly :=
[
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 542 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0542 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0542_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0542
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0543 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 543 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0543 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0543_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0543
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0544 : Poly :=
[
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 544 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0544 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0544_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0544
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0545 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 545 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0545 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0545_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0545
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0546 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 546 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0546 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0546_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0546
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0547 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 547 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0547 : Poly :=
[
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0547_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0547
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0548 : Poly :=
[
  term ((-6879692970533202134170383124482138364024056138960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 548 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0548 : Poly :=
[
  term ((6879692970533202134170383124482138364024056138960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1)],
  term ((-13759385941066404268340766248964276728048112277920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0548_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0548
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0549 : Poly :=
[
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 549 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0549 : Poly :=
[
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0549_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0549
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0550 : Poly :=
[
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 550 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0550 : Poly :=
[
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0550_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0550
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0551 : Poly :=
[
  term ((-29386668978230799244945450158104164003514908560 : Rat) / 6672516152943365104472918447567390859442150073) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 551 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0551 : Poly :=
[
  term ((29386668978230799244945450158104164003514908560 : Rat) / 6672516152943365104472918447567390859442150073) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-58773337956461598489890900316208328007029817120 : Rat) / 6672516152943365104472918447567390859442150073) [(1, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0551_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0551
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0552 : Poly :=
[
  term ((130829056337574772199 : Rat) / 743872845369839712198) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 552 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0552 : Poly :=
[
  term ((-130829056337574772199 : Rat) / 743872845369839712198) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((130829056337574772199 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0552_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0552
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0553 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 553 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0553 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0553_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0553
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0554 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 554 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0554 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0554_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0554
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0555 : Poly :=
[
  term ((915885272251414144041 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 555 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0555 : Poly :=
[
  term ((915885272251414144041 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-915885272251414144041 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0555_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0555
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0556 : Poly :=
[
  term ((10496325128840171797721771982866673038429844606080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 556 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0556 : Poly :=
[
  term ((-10496325128840171797721771982866673038429844606080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 2)],
  term ((20992650257680343595443543965733346076859689212160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0556_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0556
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0557 : Poly :=
[
  term ((119183501288768944495 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 557 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0557 : Poly :=
[
  term ((238367002577537888990 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-119183501288768944495 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0557_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0557
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0558 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 558 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0558 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0558_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0558
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0559 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 559 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0559 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0559_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0559
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0560 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 560 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0560 : Poly :=
[
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0560_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0560
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0561 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 561 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0561 : Poly :=
[
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0561_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0561
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0562 : Poly :=
[
  term ((73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 562 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0562 : Poly :=
[
  term ((-73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2)],
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0562_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0562
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0563 : Poly :=
[
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 563 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0563 : Poly :=
[
  term ((-146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0563_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0563
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0564 : Poly :=
[
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 564 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0564 : Poly :=
[
  term ((-1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0564_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0564
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0565 : Poly :=
[
  term ((618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 565 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0565 : Poly :=
[
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0565_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0565
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0566 : Poly :=
[
  term ((-1918002276316581903985733622192066176887648918220 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 566 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0566 : Poly :=
[
  term ((1918002276316581903985733622192066176887648918220 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (14, 1)],
  term ((-3836004552633163807971467244384132353775297836440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0566_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0566
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0567 : Poly :=
[
  term ((-229938303797622043168 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 567 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0567 : Poly :=
[
  term ((229938303797622043168 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-459876607595244086336 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0567_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0567
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0568 : Poly :=
[
  term ((-335739494058835453637 : Rat) / 212535098677097060628) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 568 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0568 : Poly :=
[
  term ((-335739494058835453637 : Rat) / 106267549338548530314) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((335739494058835453637 : Rat) / 212535098677097060628) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0568_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0568
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0569 : Poly :=
[
  term ((-16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1)]
]

/-- Partial product 569 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0569 : Poly :=
[
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0569_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0569
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0570 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (12, 1)]
]

/-- Partial product 570 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0570 : Poly :=
[
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0570_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0570
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0571 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 571 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0571 : Poly :=
[
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0571_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0571
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0572 : Poly :=
[
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (14, 1)]
]

/-- Partial product 572 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0572 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0572_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0572
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0573 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 573 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0573 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0573_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0573
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0574 : Poly :=
[
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 574 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0574 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0574_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0574
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0575 : Poly :=
[
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 575 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0575 : Poly :=
[
  term ((-9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0575_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0575
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0576 : Poly :=
[
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 576 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0576 : Poly :=
[
  term ((322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0576_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0576
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0577 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 577 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0577 : Poly :=
[
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0577_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0577
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0578 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 578 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0578 : Poly :=
[
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0578_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0578
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0579 : Poly :=
[
  term ((1174493095241641418455517824228089251994157122187 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 579 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0579 : Poly :=
[
  term ((2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1174493095241641418455517824228089251994157122187 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0579_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0579
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0580 : Poly :=
[
  term ((-40310688859448079374 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0580 : Poly :=
[
  term ((-80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((40310688859448079374 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0580_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0580
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0581 : Poly :=
[
  term ((-1782947522253943742265012789177491122558028325016 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 581 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0581 : Poly :=
[
  term ((1782947522253943742265012789177491122558028325016 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (10, 1), (11, 1)],
  term ((-3565895044507887484530025578354982245116056650032 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0581_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0581
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0582 : Poly :=
[
  term ((-116321207017376115407284420640732868233991733690960 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 582 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0582 : Poly :=
[
  term ((116321207017376115407284420640732868233991733690960 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-232642414034752230814568841281465736467983467381920 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0582_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0582
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0583 : Poly :=
[
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 583 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0583 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0583_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0583
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0584 : Poly :=
[
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 584 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0584 : Poly :=
[
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0584_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0584
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0585 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 585 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0585 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0585_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0585
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0586 : Poly :=
[
  term ((-14258783894257471880402447437778524035432120800468 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 586 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0586 : Poly :=
[
  term ((14258783894257471880402447437778524035432120800468 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-28517567788514943760804894875557048070864241600936 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0586_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0586
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0587 : Poly :=
[
  term ((70352001024965438320 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 587 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0587 : Poly :=
[
  term ((-70352001024965438320 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((140704002049930876640 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0587_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0587
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0588 : Poly :=
[
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 588 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0588 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0588_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0588
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0589 : Poly :=
[
  term ((34866426494830021240393674721937852979503111525416 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 589 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0589 : Poly :=
[
  term ((-34866426494830021240393674721937852979503111525416 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((69732852989660042480787349443875705959006223050832 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0589_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0589
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0590 : Poly :=
[
  term ((9719168276359851907535757751487408441114982505600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 590 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0590 : Poly :=
[
  term ((-9719168276359851907535757751487408441114982505600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((19438336552719703815071515502974816882229965011200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0590_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0590
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0591 : Poly :=
[
  term ((99497380142514907060 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 591 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0591 : Poly :=
[
  term ((-99497380142514907060 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((198994760285029814120 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0591_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0591
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0592 : Poly :=
[
  term ((335086832813874661914 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 592 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0592 : Poly :=
[
  term ((670173665627749323828 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-335086832813874661914 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0592_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0592
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0593 : Poly :=
[
  term ((-58895292355353791722851715812729077631841532280136 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 593 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0593 : Poly :=
[
  term ((-117790584710707583445703431625458155263683064560272 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((58895292355353791722851715812729077631841532280136 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0593_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0593
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0594 : Poly :=
[
  term ((-71148735861998395164 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0594 : Poly :=
[
  term ((-142297471723996790328 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((71148735861998395164 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0594_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0594
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0595 : Poly :=
[
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 595 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0595 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0595_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0595
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0596 : Poly :=
[
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 596 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0596 : Poly :=
[
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0596_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0596
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0597 : Poly :=
[
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 597 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0597 : Poly :=
[
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0597_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0597
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0598 : Poly :=
[
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 598 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0598 : Poly :=
[
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0598_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0598
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0599 : Poly :=
[
  term ((-9719168276359851907535757751487408441114982505600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 599 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0599 : Poly :=
[
  term ((-19438336552719703815071515502974816882229965011200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((9719168276359851907535757751487408441114982505600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0599_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0599
        rs_R009_ueqv_R009NYNYN_generator_28_0500_0599 =
      rs_R009_ueqv_R009NYNYN_partial_28_0599 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0500_0599 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0500,
  rs_R009_ueqv_R009NYNYN_partial_28_0501,
  rs_R009_ueqv_R009NYNYN_partial_28_0502,
  rs_R009_ueqv_R009NYNYN_partial_28_0503,
  rs_R009_ueqv_R009NYNYN_partial_28_0504,
  rs_R009_ueqv_R009NYNYN_partial_28_0505,
  rs_R009_ueqv_R009NYNYN_partial_28_0506,
  rs_R009_ueqv_R009NYNYN_partial_28_0507,
  rs_R009_ueqv_R009NYNYN_partial_28_0508,
  rs_R009_ueqv_R009NYNYN_partial_28_0509,
  rs_R009_ueqv_R009NYNYN_partial_28_0510,
  rs_R009_ueqv_R009NYNYN_partial_28_0511,
  rs_R009_ueqv_R009NYNYN_partial_28_0512,
  rs_R009_ueqv_R009NYNYN_partial_28_0513,
  rs_R009_ueqv_R009NYNYN_partial_28_0514,
  rs_R009_ueqv_R009NYNYN_partial_28_0515,
  rs_R009_ueqv_R009NYNYN_partial_28_0516,
  rs_R009_ueqv_R009NYNYN_partial_28_0517,
  rs_R009_ueqv_R009NYNYN_partial_28_0518,
  rs_R009_ueqv_R009NYNYN_partial_28_0519,
  rs_R009_ueqv_R009NYNYN_partial_28_0520,
  rs_R009_ueqv_R009NYNYN_partial_28_0521,
  rs_R009_ueqv_R009NYNYN_partial_28_0522,
  rs_R009_ueqv_R009NYNYN_partial_28_0523,
  rs_R009_ueqv_R009NYNYN_partial_28_0524,
  rs_R009_ueqv_R009NYNYN_partial_28_0525,
  rs_R009_ueqv_R009NYNYN_partial_28_0526,
  rs_R009_ueqv_R009NYNYN_partial_28_0527,
  rs_R009_ueqv_R009NYNYN_partial_28_0528,
  rs_R009_ueqv_R009NYNYN_partial_28_0529,
  rs_R009_ueqv_R009NYNYN_partial_28_0530,
  rs_R009_ueqv_R009NYNYN_partial_28_0531,
  rs_R009_ueqv_R009NYNYN_partial_28_0532,
  rs_R009_ueqv_R009NYNYN_partial_28_0533,
  rs_R009_ueqv_R009NYNYN_partial_28_0534,
  rs_R009_ueqv_R009NYNYN_partial_28_0535,
  rs_R009_ueqv_R009NYNYN_partial_28_0536,
  rs_R009_ueqv_R009NYNYN_partial_28_0537,
  rs_R009_ueqv_R009NYNYN_partial_28_0538,
  rs_R009_ueqv_R009NYNYN_partial_28_0539,
  rs_R009_ueqv_R009NYNYN_partial_28_0540,
  rs_R009_ueqv_R009NYNYN_partial_28_0541,
  rs_R009_ueqv_R009NYNYN_partial_28_0542,
  rs_R009_ueqv_R009NYNYN_partial_28_0543,
  rs_R009_ueqv_R009NYNYN_partial_28_0544,
  rs_R009_ueqv_R009NYNYN_partial_28_0545,
  rs_R009_ueqv_R009NYNYN_partial_28_0546,
  rs_R009_ueqv_R009NYNYN_partial_28_0547,
  rs_R009_ueqv_R009NYNYN_partial_28_0548,
  rs_R009_ueqv_R009NYNYN_partial_28_0549,
  rs_R009_ueqv_R009NYNYN_partial_28_0550,
  rs_R009_ueqv_R009NYNYN_partial_28_0551,
  rs_R009_ueqv_R009NYNYN_partial_28_0552,
  rs_R009_ueqv_R009NYNYN_partial_28_0553,
  rs_R009_ueqv_R009NYNYN_partial_28_0554,
  rs_R009_ueqv_R009NYNYN_partial_28_0555,
  rs_R009_ueqv_R009NYNYN_partial_28_0556,
  rs_R009_ueqv_R009NYNYN_partial_28_0557,
  rs_R009_ueqv_R009NYNYN_partial_28_0558,
  rs_R009_ueqv_R009NYNYN_partial_28_0559,
  rs_R009_ueqv_R009NYNYN_partial_28_0560,
  rs_R009_ueqv_R009NYNYN_partial_28_0561,
  rs_R009_ueqv_R009NYNYN_partial_28_0562,
  rs_R009_ueqv_R009NYNYN_partial_28_0563,
  rs_R009_ueqv_R009NYNYN_partial_28_0564,
  rs_R009_ueqv_R009NYNYN_partial_28_0565,
  rs_R009_ueqv_R009NYNYN_partial_28_0566,
  rs_R009_ueqv_R009NYNYN_partial_28_0567,
  rs_R009_ueqv_R009NYNYN_partial_28_0568,
  rs_R009_ueqv_R009NYNYN_partial_28_0569,
  rs_R009_ueqv_R009NYNYN_partial_28_0570,
  rs_R009_ueqv_R009NYNYN_partial_28_0571,
  rs_R009_ueqv_R009NYNYN_partial_28_0572,
  rs_R009_ueqv_R009NYNYN_partial_28_0573,
  rs_R009_ueqv_R009NYNYN_partial_28_0574,
  rs_R009_ueqv_R009NYNYN_partial_28_0575,
  rs_R009_ueqv_R009NYNYN_partial_28_0576,
  rs_R009_ueqv_R009NYNYN_partial_28_0577,
  rs_R009_ueqv_R009NYNYN_partial_28_0578,
  rs_R009_ueqv_R009NYNYN_partial_28_0579,
  rs_R009_ueqv_R009NYNYN_partial_28_0580,
  rs_R009_ueqv_R009NYNYN_partial_28_0581,
  rs_R009_ueqv_R009NYNYN_partial_28_0582,
  rs_R009_ueqv_R009NYNYN_partial_28_0583,
  rs_R009_ueqv_R009NYNYN_partial_28_0584,
  rs_R009_ueqv_R009NYNYN_partial_28_0585,
  rs_R009_ueqv_R009NYNYN_partial_28_0586,
  rs_R009_ueqv_R009NYNYN_partial_28_0587,
  rs_R009_ueqv_R009NYNYN_partial_28_0588,
  rs_R009_ueqv_R009NYNYN_partial_28_0589,
  rs_R009_ueqv_R009NYNYN_partial_28_0590,
  rs_R009_ueqv_R009NYNYN_partial_28_0591,
  rs_R009_ueqv_R009NYNYN_partial_28_0592,
  rs_R009_ueqv_R009NYNYN_partial_28_0593,
  rs_R009_ueqv_R009NYNYN_partial_28_0594,
  rs_R009_ueqv_R009NYNYN_partial_28_0595,
  rs_R009_ueqv_R009NYNYN_partial_28_0596,
  rs_R009_ueqv_R009NYNYN_partial_28_0597,
  rs_R009_ueqv_R009NYNYN_partial_28_0598,
  rs_R009_ueqv_R009NYNYN_partial_28_0599
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0500_0599 : Poly :=
[
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (14, 2), (16, 1)],
  term ((-129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (9, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (11, 1)],
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (11, 1), (14, 1)],
  term ((-18916941367814117636 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (14, 2), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((5151330975636261723222573842886275589238147356160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((-52565604346854212016 : Rat) / 17711258223091421719) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((26282802173427106008 : Rat) / 17711258223091421719) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2575665487818130861611286921443137794619073678080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((702594160280928338488 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1287832743909065430805643460721568897309536839040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-351297080140464169244 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((3663782623129212817013319989242946842717880042760 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (13, 1)],
  term ((-7327565246258425634026639978485893685435760085520 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((872053046903775930316 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((-518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (14, 2), (16, 1)],
  term ((-306372887185153316050 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((13340334059870921287950995616185019032141954372654 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((-516647901170784123906 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6670167029935460643975497808092509516070977186327 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (8, 2), (15, 1)],
  term ((258323950585392061953 : Rat) / 123978807561639952033) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((518614545066938596432 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (13, 1), (14, 1), (16, 1)],
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (13, 1), (16, 1)],
  term ((-259307272533469298216 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (14, 1), (15, 1), (16, 1)],
  term ((129653636266734649108 : Rat) / 123978807561639952033) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((453664992484119035378421445648366363613860327440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1)],
  term ((-4320208083341927160348193813446289797916698013880 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-80315219319939296887926566839996895814965554200 : Rat) / 16319527458403652002506053552484100535744053793) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10695183322758777244315778646066400362890079433040 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((100662565477306187820 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((5274286168702292078160062898746168684788405128320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((379189097735724638680 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-145128557172584253580 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((5274286168702292078160062898746168684788405128320 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-10548572337404584156320125797492337369576810256640 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((-758378195471449277360 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((379189097735724638680 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7423559290639075008245143720602401770137458993300 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 1)],
  term ((24575175828047181705 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2433713752089558624902487812580355651391874068920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-61054924255674739337 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((9119937106906889408 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((66295833931332841188588569295495071861046287133262207894749430108 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (9, 1), (10, 2)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (12, 1)],
  term ((2218132718185391565880753307864743909767585223680 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-131454267172707667863431044536962833598051126824164903691963340216 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-251437547799297918164 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2), (14, 2)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (14, 2), (16, 1)],
  term ((-1812173386831460341678 : Rat) / 4339258264657398321155) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6879692970533202134170383124482138364024056138960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1)],
  term ((-293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((146829732412467264920437320602048649687671430240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1236041199744804590 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7793892138485552021616839866869131435334585840240 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5364482577170910092047 : Rat) / 743872845369839712198) [(1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-58773337956461598489890900316208328007029817120 : Rat) / 6672516152943365104472918447567390859442150073) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((130829056337574772199 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915885272251414144041 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-10496325128840171797721771982866673038429844606080 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 2)],
  term ((20992650257680343595443543965733346076859689212160 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((238367002577537888990 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-119183501288768944495 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2348986190483282836911035648456178503988314244374 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((80621377718896158748 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-73414866206233632460218660301024324843835715120 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2)],
  term ((293659464824934529840874641204097299375342860480 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((2472082399489609180 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-618020599872402295 : Rat) / 17711258223091421719) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((20625965129558037412834504712149662237957719660 : Rat) / 27643281205051084004244947854207762131974621731) [(1, 1), (9, 1), (14, 1)],
  term ((-630099950272201363041 : Rat) / 247957615123279904066) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3836004552633163807971467244384132353775297836440 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (14, 2)],
  term ((-459876607595244086336 : Rat) / 371936422684919856099) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((335739494058835453637 : Rat) / 212535098677097060628) [(1, 1), (9, 1), (16, 1)],
  term ((16525427742612363982945381802120757995502167423488 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((132203421940898911863563054416966063964017339387904 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (12, 1), (14, 1)],
  term ((-442946779595682125888 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 2), (11, 1), (14, 2)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-9395944761933131347644142593824714015953256977496 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1)],
  term ((322485510875584634992 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((4697972380966565673822071296912357007976628488748 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-161242755437792317496 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1174493095241641418455517824228089251994157122187 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (9, 2), (15, 1)],
  term ((40310688859448079374 : Rat) / 123978807561639952033) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((1782947522253943742265012789177491122558028325016 : Rat) / 580508905306072764089143904938363004771467056351) [(1, 1), (10, 1), (11, 1)],
  term ((116321207017376115407284420640732868233991733690960 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-232642414034752230814568841281465736467983467381920 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((66101710970449455931781527208483031982008669693952 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33050855485224727965890763604241515991004334846976 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3567493805765913503769243870235450560126758583252 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((5769241981993584736 : Rat) / 17711258223091421719) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28517567788514943760804894875557048070864241600936 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((140704002049930876640 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-34866426494830021240393674721937852979503111525416 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((8573383530471455796178798813198328216841605792176 : Rat) / 193502968435357588029714634979454334923822352117) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((81525183640747773824 : Rat) / 17711258223091421719) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((19438336552719703815071515502974816882229965011200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((198994760285029814120 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-335086832813874661914 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-117790584710707583445703431625458155263683064560272 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-142297471723996790328 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((58895292355353791722851715812729077631841532280136 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((71148735861998395164 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-7849951656520422939771349820189306479407478806400 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-15699903313040845879542699640378612958814957612800 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 2)],
  term ((-390418965043469793248 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((195209482521734896624 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-19438336552719703815071515502974816882229965011200 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((9719168276359851907535757751487408441114982505600 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 500 through 599. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0500_0599_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0500_0599
      rs_R009_ueqv_R009NYNYN_block_28_0500_0599 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
