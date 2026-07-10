/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0500 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 500 for generator 9. -/
def ep_Q2_002_partial_09_0500 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 9. -/
theorem ep_Q2_002_partial_09_0500_valid :
    mulPoly ep_Q2_002_coefficient_09_0500
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0501 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 501 for generator 9. -/
def ep_Q2_002_partial_09_0501 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 9. -/
theorem ep_Q2_002_partial_09_0501_valid :
    mulPoly ep_Q2_002_coefficient_09_0501
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0502 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 502 for generator 9. -/
def ep_Q2_002_partial_09_0502 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 9. -/
theorem ep_Q2_002_partial_09_0502_valid :
    mulPoly ep_Q2_002_coefficient_09_0502
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0503 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 503 for generator 9. -/
def ep_Q2_002_partial_09_0503 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-130018763424 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 9. -/
theorem ep_Q2_002_partial_09_0503_valid :
    mulPoly ep_Q2_002_coefficient_09_0503
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0504 : Poly :=
[
  term ((-5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 504 for generator 9. -/
def ep_Q2_002_partial_09_0504 : Poly :=
[
  term ((5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1)],
  term ((-10228739102522576808136323134580 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 9. -/
theorem ep_Q2_002_partial_09_0504_valid :
    mulPoly ep_Q2_002_coefficient_09_0504
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0505 : Poly :=
[
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 505 for generator 9. -/
def ep_Q2_002_partial_09_0505 : Poly :=
[
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 9. -/
theorem ep_Q2_002_partial_09_0505_valid :
    mulPoly ep_Q2_002_coefficient_09_0505
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0506 : Poly :=
[
  term ((-52820648452390129983471322084968 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 506 for generator 9. -/
def ep_Q2_002_partial_09_0506 : Poly :=
[
  term ((52820648452390129983471322084968 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-105641296904780259966942644169936 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 9. -/
theorem ep_Q2_002_partial_09_0506_valid :
    mulPoly ep_Q2_002_coefficient_09_0506
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0507 : Poly :=
[
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 507 for generator 9. -/
def ep_Q2_002_partial_09_0507 : Poly :=
[
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 9. -/
theorem ep_Q2_002_partial_09_0507_valid :
    mulPoly ep_Q2_002_coefficient_09_0507
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0508 : Poly :=
[
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 508 for generator 9. -/
def ep_Q2_002_partial_09_0508 : Poly :=
[
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 9. -/
theorem ep_Q2_002_partial_09_0508_valid :
    mulPoly ep_Q2_002_coefficient_09_0508
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0509 : Poly :=
[
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 509 for generator 9. -/
def ep_Q2_002_partial_09_0509 : Poly :=
[
  term ((-39643219857 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((79286439714 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 9. -/
theorem ep_Q2_002_partial_09_0509_valid :
    mulPoly ep_Q2_002_coefficient_09_0509
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0510 : Poly :=
[
  term ((9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 510 for generator 9. -/
def ep_Q2_002_partial_09_0510 : Poly :=
[
  term ((-9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1)],
  term ((19262631284449378994429317521360 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 9. -/
theorem ep_Q2_002_partial_09_0510_valid :
    mulPoly ep_Q2_002_coefficient_09_0510
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0511 : Poly :=
[
  term ((99471172853845604348228056561056 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 511 for generator 9. -/
def ep_Q2_002_partial_09_0511 : Poly :=
[
  term ((-99471172853845604348228056561056 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((198942345707691208696456113122112 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 9. -/
theorem ep_Q2_002_partial_09_0511_valid :
    mulPoly ep_Q2_002_coefficient_09_0511
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0512 : Poly :=
[
  term ((-93206467625888256892506957698163613983699 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 512 for generator 9. -/
def ep_Q2_002_partial_09_0512 : Poly :=
[
  term ((93206467625888256892506957698163613983699 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (15, 1)],
  term ((-186412935251776513785013915396327227967398 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 9. -/
theorem ep_Q2_002_partial_09_0512_valid :
    mulPoly ep_Q2_002_coefficient_09_0512
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0513 : Poly :=
[
  term ((-21311157487 : Rat) / 17763161388) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 513 for generator 9. -/
def ep_Q2_002_partial_09_0513 : Poly :=
[
  term ((21311157487 : Rat) / 17763161388) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21311157487 : Rat) / 8881580694) [(2, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 9. -/
theorem ep_Q2_002_partial_09_0513_valid :
    mulPoly ep_Q2_002_coefficient_09_0513
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0514 : Poly :=
[
  term ((-36335747591504265591312101067263359641156 : Rat) / 22827427415598686891290631687354680805) [(2, 1), (7, 1), (15, 3)]
]

/-- Partial product 514 for generator 9. -/
def ep_Q2_002_partial_09_0514 : Poly :=
[
  term ((36335747591504265591312101067263359641156 : Rat) / 22827427415598686891290631687354680805) [(2, 1), (7, 1), (15, 3)],
  term ((-72671495183008531182624202134526719282312 : Rat) / 22827427415598686891290631687354680805) [(2, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 9. -/
theorem ep_Q2_002_partial_09_0514_valid :
    mulPoly ep_Q2_002_coefficient_09_0514
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0515 : Poly :=
[
  term ((-1191600989 : Rat) / 376338165) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 515 for generator 9. -/
def ep_Q2_002_partial_09_0515 : Poly :=
[
  term ((1191600989 : Rat) / 376338165) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2383201978 : Rat) / 376338165) [(2, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 9. -/
theorem ep_Q2_002_partial_09_0515_valid :
    mulPoly ep_Q2_002_coefficient_09_0515
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0516 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (11, 1)]
]

/-- Partial product 516 for generator 9. -/
def ep_Q2_002_partial_09_0516 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 9. -/
theorem ep_Q2_002_partial_09_0516_valid :
    mulPoly ep_Q2_002_coefficient_09_0516
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0517 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (13, 1)]
]

/-- Partial product 517 for generator 9. -/
def ep_Q2_002_partial_09_0517 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 9. -/
theorem ep_Q2_002_partial_09_0517_valid :
    mulPoly ep_Q2_002_coefficient_09_0517
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0518 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

/-- Partial product 518 for generator 9. -/
def ep_Q2_002_partial_09_0518 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 9. -/
theorem ep_Q2_002_partial_09_0518_valid :
    mulPoly ep_Q2_002_coefficient_09_0518
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0519 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 519 for generator 9. -/
def ep_Q2_002_partial_09_0519 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 9. -/
theorem ep_Q2_002_partial_09_0519_valid :
    mulPoly ep_Q2_002_coefficient_09_0519
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0520 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 520 for generator 9. -/
def ep_Q2_002_partial_09_0520 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 9. -/
theorem ep_Q2_002_partial_09_0520_valid :
    mulPoly ep_Q2_002_coefficient_09_0520
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0521 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 521 for generator 9. -/
def ep_Q2_002_partial_09_0521 : Poly :=
[
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-511495655396046832612059942420864 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 9. -/
theorem ep_Q2_002_partial_09_0521_valid :
    mulPoly ep_Q2_002_coefficient_09_0521
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0522 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (15, 2)]
]

/-- Partial product 522 for generator 9. -/
def ep_Q2_002_partial_09_0522 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (15, 2)],
  term ((2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 9. -/
theorem ep_Q2_002_partial_09_0522_valid :
    mulPoly ep_Q2_002_coefficient_09_0522
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0523 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 523 for generator 9. -/
def ep_Q2_002_partial_09_0523 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-352684980052 : Rat) / 22203951735) [(2, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 9. -/
theorem ep_Q2_002_partial_09_0523_valid :
    mulPoly ep_Q2_002_coefficient_09_0523
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0524 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (11, 1)]
]

/-- Partial product 524 for generator 9. -/
def ep_Q2_002_partial_09_0524 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (11, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 9. -/
theorem ep_Q2_002_partial_09_0524_valid :
    mulPoly ep_Q2_002_coefficient_09_0524
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0525 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (13, 1)]
]

/-- Partial product 525 for generator 9. -/
def ep_Q2_002_partial_09_0525 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (13, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 9. -/
theorem ep_Q2_002_partial_09_0525_valid :
    mulPoly ep_Q2_002_coefficient_09_0525
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0526 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 3), (15, 1)]
]

/-- Partial product 526 for generator 9. -/
def ep_Q2_002_partial_09_0526 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 3), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 9. -/
theorem ep_Q2_002_partial_09_0526_valid :
    mulPoly ep_Q2_002_coefficient_09_0526
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0527 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

/-- Partial product 527 for generator 9. -/
def ep_Q2_002_partial_09_0527 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(2, 2), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 9. -/
theorem ep_Q2_002_partial_09_0527_valid :
    mulPoly ep_Q2_002_coefficient_09_0527
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0528 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 528 for generator 9. -/
def ep_Q2_002_partial_09_0528 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 9. -/
theorem ep_Q2_002_partial_09_0528_valid :
    mulPoly ep_Q2_002_coefficient_09_0528
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0529 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 529 for generator 9. -/
def ep_Q2_002_partial_09_0529 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 9. -/
theorem ep_Q2_002_partial_09_0529_valid :
    mulPoly ep_Q2_002_coefficient_09_0529
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0530 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 530 for generator 9. -/
def ep_Q2_002_partial_09_0530 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (15, 2)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 9. -/
theorem ep_Q2_002_partial_09_0530_valid :
    mulPoly ep_Q2_002_coefficient_09_0530
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0531 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 531 for generator 9. -/
def ep_Q2_002_partial_09_0531 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 9. -/
theorem ep_Q2_002_partial_09_0531_valid :
    mulPoly ep_Q2_002_coefficient_09_0531
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0532 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 532 for generator 9. -/
def ep_Q2_002_partial_09_0532 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 9. -/
theorem ep_Q2_002_partial_09_0532_valid :
    mulPoly ep_Q2_002_coefficient_09_0532
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0533 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 533 for generator 9. -/
def ep_Q2_002_partial_09_0533 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 9. -/
theorem ep_Q2_002_partial_09_0533_valid :
    mulPoly ep_Q2_002_coefficient_09_0533
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0534 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 534 for generator 9. -/
def ep_Q2_002_partial_09_0534 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (15, 3)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 9. -/
theorem ep_Q2_002_partial_09_0534_valid :
    mulPoly ep_Q2_002_coefficient_09_0534
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0535 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 535 for generator 9. -/
def ep_Q2_002_partial_09_0535 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((65009381712 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 9. -/
theorem ep_Q2_002_partial_09_0535_valid :
    mulPoly ep_Q2_002_coefficient_09_0535
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0536 : Poly :=
[
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 536 for generator 9. -/
def ep_Q2_002_partial_09_0536 : Poly :=
[
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 9. -/
theorem ep_Q2_002_partial_09_0536_valid :
    mulPoly ep_Q2_002_coefficient_09_0536
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0537 : Poly :=
[
  term ((76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 537 for generator 9. -/
def ep_Q2_002_partial_09_0537 : Poly :=
[
  term ((-76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 1)],
  term ((152958295560407278554040067358516 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 9. -/
theorem ep_Q2_002_partial_09_0537_valid :
    mulPoly ep_Q2_002_coefficient_09_0537
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0538 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 3)]
]

/-- Partial product 538 for generator 9. -/
def ep_Q2_002_partial_09_0538 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 3)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 9. -/
theorem ep_Q2_002_partial_09_0538_valid :
    mulPoly ep_Q2_002_coefficient_09_0538
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0539 : Poly :=
[
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 539 for generator 9. -/
def ep_Q2_002_partial_09_0539 : Poly :=
[
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 9. -/
theorem ep_Q2_002_partial_09_0539_valid :
    mulPoly ep_Q2_002_coefficient_09_0539
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0540 : Poly :=
[
  term ((105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 540 for generator 9. -/
def ep_Q2_002_partial_09_0540 : Poly :=
[
  term ((-105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (15, 2)],
  term ((210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 9. -/
theorem ep_Q2_002_partial_09_0540_valid :
    mulPoly ep_Q2_002_coefficient_09_0540
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0541 : Poly :=
[
  term ((77504694161 : Rat) / 7401317245) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 541 for generator 9. -/
def ep_Q2_002_partial_09_0541 : Poly :=
[
  term ((-77504694161 : Rat) / 7401317245) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((155009388322 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 9. -/
theorem ep_Q2_002_partial_09_0541_valid :
    mulPoly ep_Q2_002_coefficient_09_0541
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0542 : Poly :=
[
  term ((-144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 542 for generator 9. -/
def ep_Q2_002_partial_09_0542 : Poly :=
[
  term ((144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 1)],
  term ((-288049115315819305901060817611472 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 9. -/
theorem ep_Q2_002_partial_09_0542_valid :
    mulPoly ep_Q2_002_coefficient_09_0542
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0543 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 543 for generator 9. -/
def ep_Q2_002_partial_09_0543 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 3)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 9. -/
theorem ep_Q2_002_partial_09_0543_valid :
    mulPoly ep_Q2_002_coefficient_09_0543
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0544 : Poly :=
[
  term ((610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 2)]
]

/-- Partial product 544 for generator 9. -/
def ep_Q2_002_partial_09_0544 : Poly :=
[
  term ((-610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 2)],
  term ((1220436488521508673073535660306261525679278 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 9. -/
theorem ep_Q2_002_partial_09_0544_valid :
    mulPoly ep_Q2_002_coefficient_09_0544
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0545 : Poly :=
[
  term ((-382953023581 : Rat) / 88815806940) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 545 for generator 9. -/
def ep_Q2_002_partial_09_0545 : Poly :=
[
  term ((382953023581 : Rat) / 88815806940) [(2, 1), (15, 2), (16, 1)],
  term ((-382953023581 : Rat) / 44407903470) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 9. -/
theorem ep_Q2_002_partial_09_0545_valid :
    mulPoly ep_Q2_002_coefficient_09_0545
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0546 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 4)]
]

/-- Partial product 546 for generator 9. -/
def ep_Q2_002_partial_09_0546 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 4)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 9. -/
theorem ep_Q2_002_partial_09_0546_valid :
    mulPoly ep_Q2_002_coefficient_09_0546
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0547 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(2, 1), (15, 4), (16, 1)]
]

/-- Partial product 547 for generator 9. -/
def ep_Q2_002_partial_09_0547 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(2, 1), (15, 4), (16, 1)],
  term ((-316951406728 : Rat) / 22203951735) [(2, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 9. -/
theorem ep_Q2_002_partial_09_0547_valid :
    mulPoly ep_Q2_002_coefficient_09_0547
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0548 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 548 for generator 9. -/
def ep_Q2_002_partial_09_0548 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 9. -/
theorem ep_Q2_002_partial_09_0548_valid :
    mulPoly ep_Q2_002_coefficient_09_0548
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0549 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 549 for generator 9. -/
def ep_Q2_002_partial_09_0549 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 9. -/
theorem ep_Q2_002_partial_09_0549_valid :
    mulPoly ep_Q2_002_coefficient_09_0549
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0550 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 550 for generator 9. -/
def ep_Q2_002_partial_09_0550 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 9. -/
theorem ep_Q2_002_partial_09_0550_valid :
    mulPoly ep_Q2_002_coefficient_09_0550
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0551 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 551 for generator 9. -/
def ep_Q2_002_partial_09_0551 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 9. -/
theorem ep_Q2_002_partial_09_0551_valid :
    mulPoly ep_Q2_002_coefficient_09_0551
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0552 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 552 for generator 9. -/
def ep_Q2_002_partial_09_0552 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 9. -/
theorem ep_Q2_002_partial_09_0552_valid :
    mulPoly ep_Q2_002_coefficient_09_0552
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0553 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 553 for generator 9. -/
def ep_Q2_002_partial_09_0553 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 9. -/
theorem ep_Q2_002_partial_09_0553_valid :
    mulPoly ep_Q2_002_coefficient_09_0553
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0554 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (15, 2)]
]

/-- Partial product 554 for generator 9. -/
def ep_Q2_002_partial_09_0554 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 9. -/
theorem ep_Q2_002_partial_09_0554_valid :
    mulPoly ep_Q2_002_coefficient_09_0554
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0555 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 555 for generator 9. -/
def ep_Q2_002_partial_09_0555 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 9. -/
theorem ep_Q2_002_partial_09_0555_valid :
    mulPoly ep_Q2_002_coefficient_09_0555
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0556 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)]
]

/-- Partial product 556 for generator 9. -/
def ep_Q2_002_partial_09_0556 : Poly :=
[
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 9. -/
theorem ep_Q2_002_partial_09_0556_valid :
    mulPoly ep_Q2_002_coefficient_09_0556
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0557 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 557 for generator 9. -/
def ep_Q2_002_partial_09_0557 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 9. -/
theorem ep_Q2_002_partial_09_0557_valid :
    mulPoly ep_Q2_002_coefficient_09_0557
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0558 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 558 for generator 9. -/
def ep_Q2_002_partial_09_0558 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 9. -/
theorem ep_Q2_002_partial_09_0558_valid :
    mulPoly ep_Q2_002_coefficient_09_0558
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0559 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 559 for generator 9. -/
def ep_Q2_002_partial_09_0559 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 9. -/
theorem ep_Q2_002_partial_09_0559_valid :
    mulPoly ep_Q2_002_coefficient_09_0559
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0560 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 560 for generator 9. -/
def ep_Q2_002_partial_09_0560 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 9. -/
theorem ep_Q2_002_partial_09_0560_valid :
    mulPoly ep_Q2_002_coefficient_09_0560
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0561 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 561 for generator 9. -/
def ep_Q2_002_partial_09_0561 : Poly :=
[
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 9. -/
theorem ep_Q2_002_partial_09_0561_valid :
    mulPoly ep_Q2_002_coefficient_09_0561
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0562 : Poly :=
[
  term ((-938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)]
]

/-- Partial product 562 for generator 9. -/
def ep_Q2_002_partial_09_0562 : Poly :=
[
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 9. -/
theorem ep_Q2_002_partial_09_0562_valid :
    mulPoly ep_Q2_002_coefficient_09_0562
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0563 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 563 for generator 9. -/
def ep_Q2_002_partial_09_0563 : Poly :=
[
  term ((-38126575709 : Rat) / 3171993105) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 9. -/
theorem ep_Q2_002_partial_09_0563_valid :
    mulPoly ep_Q2_002_coefficient_09_0563
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0564 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 564 for generator 9. -/
def ep_Q2_002_partial_09_0564 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (11, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 9. -/
theorem ep_Q2_002_partial_09_0564_valid :
    mulPoly ep_Q2_002_coefficient_09_0564
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0565 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 565 for generator 9. -/
def ep_Q2_002_partial_09_0565 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 9. -/
theorem ep_Q2_002_partial_09_0565_valid :
    mulPoly ep_Q2_002_coefficient_09_0565
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0566 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 566 for generator 9. -/
def ep_Q2_002_partial_09_0566 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 9. -/
theorem ep_Q2_002_partial_09_0566_valid :
    mulPoly ep_Q2_002_coefficient_09_0566
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0567 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 567 for generator 9. -/
def ep_Q2_002_partial_09_0567 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 9. -/
theorem ep_Q2_002_partial_09_0567_valid :
    mulPoly ep_Q2_002_coefficient_09_0567
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0568 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 568 for generator 9. -/
def ep_Q2_002_partial_09_0568 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 9. -/
theorem ep_Q2_002_partial_09_0568_valid :
    mulPoly ep_Q2_002_coefficient_09_0568
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0569 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 569 for generator 9. -/
def ep_Q2_002_partial_09_0569 : Poly :=
[
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 9. -/
theorem ep_Q2_002_partial_09_0569_valid :
    mulPoly ep_Q2_002_coefficient_09_0569
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0570 : Poly :=
[
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (15, 2)]
]

/-- Partial product 570 for generator 9. -/
def ep_Q2_002_partial_09_0570 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 9. -/
theorem ep_Q2_002_partial_09_0570_valid :
    mulPoly ep_Q2_002_coefficient_09_0570
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0571 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 571 for generator 9. -/
def ep_Q2_002_partial_09_0571 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 9. -/
theorem ep_Q2_002_partial_09_0571_valid :
    mulPoly ep_Q2_002_coefficient_09_0571
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0572 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (11, 1)]
]

/-- Partial product 572 for generator 9. -/
def ep_Q2_002_partial_09_0572 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 9. -/
theorem ep_Q2_002_partial_09_0572_valid :
    mulPoly ep_Q2_002_coefficient_09_0572
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0573 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (13, 1)]
]

/-- Partial product 573 for generator 9. -/
def ep_Q2_002_partial_09_0573 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 9. -/
theorem ep_Q2_002_partial_09_0573_valid :
    mulPoly ep_Q2_002_coefficient_09_0573
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0574 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 2), (15, 1)]
]

/-- Partial product 574 for generator 9. -/
def ep_Q2_002_partial_09_0574 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 9. -/
theorem ep_Q2_002_partial_09_0574_valid :
    mulPoly ep_Q2_002_coefficient_09_0574
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0575 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 575 for generator 9. -/
def ep_Q2_002_partial_09_0575 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 9. -/
theorem ep_Q2_002_partial_09_0575_valid :
    mulPoly ep_Q2_002_coefficient_09_0575
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0576 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

/-- Partial product 576 for generator 9. -/
def ep_Q2_002_partial_09_0576 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 9. -/
theorem ep_Q2_002_partial_09_0576_valid :
    mulPoly ep_Q2_002_coefficient_09_0576
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0577 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (13, 1)]
]

/-- Partial product 577 for generator 9. -/
def ep_Q2_002_partial_09_0577 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 9. -/
theorem ep_Q2_002_partial_09_0577_valid :
    mulPoly ep_Q2_002_coefficient_09_0577
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0578 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 578 for generator 9. -/
def ep_Q2_002_partial_09_0578 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 9. -/
theorem ep_Q2_002_partial_09_0578_valid :
    mulPoly ep_Q2_002_coefficient_09_0578
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0579 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 579 for generator 9. -/
def ep_Q2_002_partial_09_0579 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 9. -/
theorem ep_Q2_002_partial_09_0579_valid :
    mulPoly ep_Q2_002_coefficient_09_0579
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0580 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 580 for generator 9. -/
def ep_Q2_002_partial_09_0580 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 9. -/
theorem ep_Q2_002_partial_09_0580_valid :
    mulPoly ep_Q2_002_coefficient_09_0580
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0581 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 581 for generator 9. -/
def ep_Q2_002_partial_09_0581 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 9. -/
theorem ep_Q2_002_partial_09_0581_valid :
    mulPoly ep_Q2_002_coefficient_09_0581
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0582 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (15, 2)]
]

/-- Partial product 582 for generator 9. -/
def ep_Q2_002_partial_09_0582 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 9. -/
theorem ep_Q2_002_partial_09_0582_valid :
    mulPoly ep_Q2_002_coefficient_09_0582
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0583 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 583 for generator 9. -/
def ep_Q2_002_partial_09_0583 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 9. -/
theorem ep_Q2_002_partial_09_0583_valid :
    mulPoly ep_Q2_002_coefficient_09_0583
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0584 : Poly :=
[
  term ((-25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 584 for generator 9. -/
def ep_Q2_002_partial_09_0584 : Poly :=
[
  term ((-50231284607103739475446562361084 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 9. -/
theorem ep_Q2_002_partial_09_0584_valid :
    mulPoly ep_Q2_002_coefficient_09_0584
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0585 : Poly :=
[
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 585 for generator 9. -/
def ep_Q2_002_partial_09_0585 : Poly :=
[
  term ((-11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 9. -/
theorem ep_Q2_002_partial_09_0585_valid :
    mulPoly ep_Q2_002_coefficient_09_0585
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0586 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 586 for generator 9. -/
def ep_Q2_002_partial_09_0586 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 9. -/
theorem ep_Q2_002_partial_09_0586_valid :
    mulPoly ep_Q2_002_coefficient_09_0586
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0587 : Poly :=
[
  term ((10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 587 for generator 9. -/
def ep_Q2_002_partial_09_0587 : Poly :=
[
  term ((20117803134414401579895665468472 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 9. -/
theorem ep_Q2_002_partial_09_0587_valid :
    mulPoly ep_Q2_002_coefficient_09_0587
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0588 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

/-- Partial product 588 for generator 9. -/
def ep_Q2_002_partial_09_0588 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 9. -/
theorem ep_Q2_002_partial_09_0588_valid :
    mulPoly ep_Q2_002_coefficient_09_0588
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0589 : Poly :=
[
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 589 for generator 9. -/
def ep_Q2_002_partial_09_0589 : Poly :=
[
  term ((21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 9. -/
theorem ep_Q2_002_partial_09_0589_valid :
    mulPoly ep_Q2_002_coefficient_09_0589
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0590 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 590 for generator 9. -/
def ep_Q2_002_partial_09_0590 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 9. -/
theorem ep_Q2_002_partial_09_0590_valid :
    mulPoly ep_Q2_002_coefficient_09_0590
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0591 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 591 for generator 9. -/
def ep_Q2_002_partial_09_0591 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 9. -/
theorem ep_Q2_002_partial_09_0591_valid :
    mulPoly ep_Q2_002_coefficient_09_0591
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0592 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 592 for generator 9. -/
def ep_Q2_002_partial_09_0592 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 9. -/
theorem ep_Q2_002_partial_09_0592_valid :
    mulPoly ep_Q2_002_coefficient_09_0592
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0593 : Poly :=
[
  term ((-324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 593 for generator 9. -/
def ep_Q2_002_partial_09_0593 : Poly :=
[
  term ((-649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 9. -/
theorem ep_Q2_002_partial_09_0593_valid :
    mulPoly ep_Q2_002_coefficient_09_0593
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0594 : Poly :=
[
  term ((39643219857 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 594 for generator 9. -/
def ep_Q2_002_partial_09_0594 : Poly :=
[
  term ((79286439714 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39643219857 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 9. -/
theorem ep_Q2_002_partial_09_0594_valid :
    mulPoly ep_Q2_002_coefficient_09_0594
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0595 : Poly :=
[
  term ((47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 595 for generator 9. -/
def ep_Q2_002_partial_09_0595 : Poly :=
[
  term ((94594915818339142505629623391728 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 9. -/
theorem ep_Q2_002_partial_09_0595_valid :
    mulPoly ep_Q2_002_coefficient_09_0595
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0596 : Poly :=
[
  term ((-18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 596 for generator 9. -/
def ep_Q2_002_partial_09_0596 : Poly :=
[
  term ((-37885590799338631515467325875424 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 9. -/
theorem ep_Q2_002_partial_09_0596_valid :
    mulPoly ep_Q2_002_coefficient_09_0596
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0597 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)]
]

/-- Partial product 597 for generator 9. -/
def ep_Q2_002_partial_09_0597 : Poly :=
[
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 9. -/
theorem ep_Q2_002_partial_09_0597_valid :
    mulPoly ep_Q2_002_coefficient_09_0597
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0598 : Poly :=
[
  term ((-87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 598 for generator 9. -/
def ep_Q2_002_partial_09_0598 : Poly :=
[
  term ((-175879254853121922291254489547540296224716 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 9. -/
theorem ep_Q2_002_partial_09_0598_valid :
    mulPoly ep_Q2_002_coefficient_09_0598
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0599 : Poly :=
[
  term ((-220140210347 : Rat) / 44407903470) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 599 for generator 9. -/
def ep_Q2_002_partial_09_0599 : Poly :=
[
  term ((-220140210347 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((220140210347 : Rat) / 44407903470) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 9. -/
theorem ep_Q2_002_partial_09_0599_valid :
    mulPoly ep_Q2_002_coefficient_09_0599
        ep_Q2_002_generator_09_0500_0599 =
      ep_Q2_002_partial_09_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0500_0599 : List Poly :=
[
  ep_Q2_002_partial_09_0500,
  ep_Q2_002_partial_09_0501,
  ep_Q2_002_partial_09_0502,
  ep_Q2_002_partial_09_0503,
  ep_Q2_002_partial_09_0504,
  ep_Q2_002_partial_09_0505,
  ep_Q2_002_partial_09_0506,
  ep_Q2_002_partial_09_0507,
  ep_Q2_002_partial_09_0508,
  ep_Q2_002_partial_09_0509,
  ep_Q2_002_partial_09_0510,
  ep_Q2_002_partial_09_0511,
  ep_Q2_002_partial_09_0512,
  ep_Q2_002_partial_09_0513,
  ep_Q2_002_partial_09_0514,
  ep_Q2_002_partial_09_0515,
  ep_Q2_002_partial_09_0516,
  ep_Q2_002_partial_09_0517,
  ep_Q2_002_partial_09_0518,
  ep_Q2_002_partial_09_0519,
  ep_Q2_002_partial_09_0520,
  ep_Q2_002_partial_09_0521,
  ep_Q2_002_partial_09_0522,
  ep_Q2_002_partial_09_0523,
  ep_Q2_002_partial_09_0524,
  ep_Q2_002_partial_09_0525,
  ep_Q2_002_partial_09_0526,
  ep_Q2_002_partial_09_0527,
  ep_Q2_002_partial_09_0528,
  ep_Q2_002_partial_09_0529,
  ep_Q2_002_partial_09_0530,
  ep_Q2_002_partial_09_0531,
  ep_Q2_002_partial_09_0532,
  ep_Q2_002_partial_09_0533,
  ep_Q2_002_partial_09_0534,
  ep_Q2_002_partial_09_0535,
  ep_Q2_002_partial_09_0536,
  ep_Q2_002_partial_09_0537,
  ep_Q2_002_partial_09_0538,
  ep_Q2_002_partial_09_0539,
  ep_Q2_002_partial_09_0540,
  ep_Q2_002_partial_09_0541,
  ep_Q2_002_partial_09_0542,
  ep_Q2_002_partial_09_0543,
  ep_Q2_002_partial_09_0544,
  ep_Q2_002_partial_09_0545,
  ep_Q2_002_partial_09_0546,
  ep_Q2_002_partial_09_0547,
  ep_Q2_002_partial_09_0548,
  ep_Q2_002_partial_09_0549,
  ep_Q2_002_partial_09_0550,
  ep_Q2_002_partial_09_0551,
  ep_Q2_002_partial_09_0552,
  ep_Q2_002_partial_09_0553,
  ep_Q2_002_partial_09_0554,
  ep_Q2_002_partial_09_0555,
  ep_Q2_002_partial_09_0556,
  ep_Q2_002_partial_09_0557,
  ep_Q2_002_partial_09_0558,
  ep_Q2_002_partial_09_0559,
  ep_Q2_002_partial_09_0560,
  ep_Q2_002_partial_09_0561,
  ep_Q2_002_partial_09_0562,
  ep_Q2_002_partial_09_0563,
  ep_Q2_002_partial_09_0564,
  ep_Q2_002_partial_09_0565,
  ep_Q2_002_partial_09_0566,
  ep_Q2_002_partial_09_0567,
  ep_Q2_002_partial_09_0568,
  ep_Q2_002_partial_09_0569,
  ep_Q2_002_partial_09_0570,
  ep_Q2_002_partial_09_0571,
  ep_Q2_002_partial_09_0572,
  ep_Q2_002_partial_09_0573,
  ep_Q2_002_partial_09_0574,
  ep_Q2_002_partial_09_0575,
  ep_Q2_002_partial_09_0576,
  ep_Q2_002_partial_09_0577,
  ep_Q2_002_partial_09_0578,
  ep_Q2_002_partial_09_0579,
  ep_Q2_002_partial_09_0580,
  ep_Q2_002_partial_09_0581,
  ep_Q2_002_partial_09_0582,
  ep_Q2_002_partial_09_0583,
  ep_Q2_002_partial_09_0584,
  ep_Q2_002_partial_09_0585,
  ep_Q2_002_partial_09_0586,
  ep_Q2_002_partial_09_0587,
  ep_Q2_002_partial_09_0588,
  ep_Q2_002_partial_09_0589,
  ep_Q2_002_partial_09_0590,
  ep_Q2_002_partial_09_0591,
  ep_Q2_002_partial_09_0592,
  ep_Q2_002_partial_09_0593,
  ep_Q2_002_partial_09_0594,
  ep_Q2_002_partial_09_0595,
  ep_Q2_002_partial_09_0596,
  ep_Q2_002_partial_09_0597,
  ep_Q2_002_partial_09_0598,
  ep_Q2_002_partial_09_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0500_0599 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-1876504228983799834197160293342266383511292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-50231284607103739475446562361084 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((20117803134414401579895665468472 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((79286439714 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((94594915818339142505629623391728 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-37885590799338631515467325875424 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-175879254853121922291254489547540296224716 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-220140210347 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((5114369551261288404068161567290 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1)],
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((52820648452390129983471322084968 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-39643219857 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9631315642224689497214658760680 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1)],
  term ((-99471172853845604348228056561056 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((93206467625888256892506957698163613983699 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (7, 1), (15, 1)],
  term ((21311157487 : Rat) / 17763161388) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((36335747591504265591312101067263359641156 : Rat) / 22827427415598686891290631687354680805) [(2, 1), (7, 1), (15, 3)],
  term ((1191600989 : Rat) / 376338165) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 2), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 3), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 3), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (15, 2)],
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (15, 3)],
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-76479147780203639277020033679258 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (15, 3)],
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-105342795193840704218839779959992968533292 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (15, 2)],
  term ((-77504694161 : Rat) / 7401317245) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((144024557657909652950530408805736 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 1), (13, 1), (15, 3)],
  term ((-610218244260754336536767830153130762839639 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 2)],
  term ((382953023581 : Rat) / 88815806940) [(2, 1), (15, 2), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (15, 4)],
  term ((158475703364 : Rat) / 22203951735) [(2, 1), (15, 4), (16, 1)],
  term ((151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-130018763424 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-10228739102522576808136323134580 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)],
  term ((-11472114786262286023172194677648 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-105641296904780259966942644169936 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((21604140546135555230315901527616 : Rat) / 97983883872014706756151952089) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-649072541949630791072467051206583629357672 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((79286439714 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((19262631284449378994429317521360 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((198942345707691208696456113122112 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-186412935251776513785013915396327227967398 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (7, 1), (15, 1)],
  term ((-21311157487 : Rat) / 8881580694) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-72671495183008531182624202134526719282312 : Rat) / 22827427415598686891290631687354680805) [(2, 2), (7, 1), (15, 3)],
  term ((-2383201978 : Rat) / 376338165) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (9, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((-511495655396046832612059942420864 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)],
  term ((-352684980052 : Rat) / 22203951735) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 3), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 3)],
  term ((65009381712 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((152958295560407278554040067358516 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 3)],
  term ((33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((210685590387681408437679559919985937066584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (15, 2)],
  term ((155009388322 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-288049115315819305901060817611472 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 1), (15, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 1), (15, 3)],
  term ((1220436488521508673073535660306261525679278 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)],
  term ((-382953023581 : Rat) / 44407903470) [(2, 2), (15, 2), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 4)],
  term ((-316951406728 : Rat) / 22203951735) [(2, 2), (15, 4), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((938252114491899917098580146671133191755646 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((38126575709 : Rat) / 6343986210) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 2), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((25115642303551869737723281180542 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)],
  term ((5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-39643219857 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)],
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((220140210347 : Rat) / 44407903470) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 500 through 599. -/
theorem ep_Q2_002_block_09_0500_0599_valid :
    checkProductSumEq ep_Q2_002_partials_09_0500_0599
      ep_Q2_002_block_09_0500_0599 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
