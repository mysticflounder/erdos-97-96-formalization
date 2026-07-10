/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 4:600-647

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_04_0600_0647 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0600 : Poly :=
[
  term ((-1756747773194754559 : Rat) / 95450810332358656) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 600 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0600 : Poly :=
[
  term ((1756747773194754559 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1756747773194754559 : Rat) / 95450810332358656) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1756747773194754559 : Rat) / 95450810332358656) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-1756747773194754559 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1756747773194754559 : Rat) / 95450810332358656) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1756747773194754559 : Rat) / 95450810332358656) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0600_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0600
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0601 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 601 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0601 : Poly :=
[
  term ((-349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0601_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0601
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0602 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 602 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0602 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0602_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0602
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0603 : Poly :=
[
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 603 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0603 : Poly :=
[
  term ((447111482668512639503 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0603_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0603
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0604 : Poly :=
[
  term ((676639965594754681593 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0604 : Poly :=
[
  term ((-676639965594754681593 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0604_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0604
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0605 : Poly :=
[
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 605 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0605 : Poly :=
[
  term ((59177047069555969759 : Rat) / 1579412627218247136) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(6, 2), (9, 2), (11, 2), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-59177047069555969759 : Rat) / 1579412627218247136) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0605_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0605
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0606 : Poly :=
[
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 606 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0606 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0606_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0606
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0607 : Poly :=
[
  term ((-255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0607 : Poly :=
[
  term ((255006898652461167 : Rat) / 5965675645772416) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0607_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0607
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0608 : Poly :=
[
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 608 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0608 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0608_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0608
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0609 : Poly :=
[
  term ((33093482828145841 : Rat) / 627965857449728) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 609 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0609 : Poly :=
[
  term ((-33093482828145841 : Rat) / 313982928724864) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((33093482828145841 : Rat) / 627965857449728) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((33093482828145841 : Rat) / 627965857449728) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((33093482828145841 : Rat) / 313982928724864) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-33093482828145841 : Rat) / 627965857449728) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-33093482828145841 : Rat) / 627965857449728) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0609_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0609
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0610 : Poly :=
[
  term ((2098833428243959 : Rat) / 5113436267804928) [(9, 2), (16, 1)]
]

/-- Partial product 610 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0610 : Poly :=
[
  term ((-2098833428243959 : Rat) / 2556718133902464) [(6, 1), (9, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 5113436267804928) [(6, 2), (9, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 5113436267804928) [(7, 2), (9, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 2556718133902464) [(9, 2), (12, 1), (16, 1)],
  term ((-2098833428243959 : Rat) / 5113436267804928) [(9, 2), (12, 2), (16, 1)],
  term ((-2098833428243959 : Rat) / 5113436267804928) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0610_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0610
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0611 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (16, 1)]
]

/-- Partial product 611 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0611 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 3), (11, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0611_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0611
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0612 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0612 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0612_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0612
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0613 : Poly :=
[
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 613 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0613 : Poly :=
[
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0613_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0613
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0614 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0614 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0614_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0614
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0615 : Poly :=
[
  term ((212289452128194361969 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0615 : Poly :=
[
  term ((-212289452128194361969 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-212289452128194361969 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-212289452128194361969 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0615_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0615
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0616 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 616 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0616 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0616_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0616
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0617 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 617 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0617 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0617_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0617
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0618 : Poly :=
[
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0618 : Poly :=
[
  term ((17805922420307 : Rat) / 30437120641696) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 30437120641696) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0618_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0618
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0619 : Poly :=
[
  term ((923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 619 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0619 : Poly :=
[
  term ((-923014401522365 : Rat) / 941948786174592) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 941948786174592) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 1883897572349184) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0619_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0619
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0620 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 620 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0620 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0620_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0620
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0621 : Poly :=
[
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 621 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0621 : Poly :=
[
  term ((-6317130484575125 : Rat) / 730490895400704) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((6317130484575125 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6317130484575125 : Rat) / 1460981790801408) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6317130484575125 : Rat) / 1460981790801408) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0621_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0621
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0622 : Poly :=
[
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 622 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0622 : Poly :=
[
  term ((-724990340615301 : Rat) / 213059844491872) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(6, 2), (10, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(7, 2), (10, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0622_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0622
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0623 : Poly :=
[
  term ((275302413258646267 : Rat) / 23862702583089664) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 623 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0623 : Poly :=
[
  term ((-275302413258646267 : Rat) / 11931351291544832) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 23862702583089664) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 23862702583089664) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 11931351291544832) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 23862702583089664) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 23862702583089664) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0623_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0623
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0624 : Poly :=
[
  term ((-1892829473632371 : Rat) / 426119688983744) [(10, 1), (16, 1)]
]

/-- Partial product 624 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0624 : Poly :=
[
  term ((1892829473632371 : Rat) / 213059844491872) [(6, 1), (10, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(6, 2), (10, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(7, 2), (10, 1), (16, 1)],
  term ((-1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (16, 1)],
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (12, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0624_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0624
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0625 : Poly :=
[
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 625 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0625 : Poly :=
[
  term ((14849754300339743 : Rat) / 1704478755934976) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0625_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0625
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0626 : Poly :=
[
  term ((-6118903222396731 : Rat) / 6817915023739904) [(10, 2), (16, 1)]
]

/-- Partial product 626 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0626 : Poly :=
[
  term ((6118903222396731 : Rat) / 3408957511869952) [(6, 1), (10, 2), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(6, 2), (10, 2), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(7, 2), (10, 2), (16, 1)],
  term ((-6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (12, 2), (16, 1)],
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0626_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0626
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0627 : Poly :=
[
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

/-- Partial product 627 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0627 : Poly :=
[
  term ((-3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0627_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0627
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0628 : Poly :=
[
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 628 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0628 : Poly :=
[
  term ((24259046380348383 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0628_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0628
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0629 : Poly :=
[
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 629 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0629 : Poly :=
[
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0629_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0629
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0630 : Poly :=
[
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 630 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0630 : Poly :=
[
  term ((35784179868088744383709 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0630_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0630
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0631 : Poly :=
[
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 631 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0631 : Poly :=
[
  term ((-518893604425934233781 : Rat) / 6317650508872988544) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((518893604425934233781 : Rat) / 6317650508872988544) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0631_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0631
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0632 : Poly :=
[
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0632 : Poly :=
[
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0632_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0632
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0633 : Poly :=
[
  term ((-19850911338266314497243 : Rat) / 67388272094645211136) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 633 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0633 : Poly :=
[
  term ((19850911338266314497243 : Rat) / 33694136047322605568) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 67388272094645211136) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 67388272094645211136) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 33694136047322605568) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 67388272094645211136) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 67388272094645211136) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0633_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0633
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0634 : Poly :=
[
  term ((-169904602033212749 : Rat) / 6817915023739904) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 634 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0634 : Poly :=
[
  term ((169904602033212749 : Rat) / 3408957511869952) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-169904602033212749 : Rat) / 6817915023739904) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-169904602033212749 : Rat) / 6817915023739904) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-169904602033212749 : Rat) / 3408957511869952) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((169904602033212749 : Rat) / 6817915023739904) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((169904602033212749 : Rat) / 6817915023739904) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0634_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0634
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0635 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 635 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0635 : Poly :=
[
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0635_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0635
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0636 : Poly :=
[
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0636 : Poly :=
[
  term ((-2806946967484502872129 : Rat) / 25270602035491954176) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0636_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0636
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0637 : Poly :=
[
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 637 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0637 : Poly :=
[
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0637_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0637
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0638 : Poly :=
[
  term ((-35339303413578220958383 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 638 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0638 : Poly :=
[
  term ((35339303413578220958383 : Rat) / 151623612212951725056) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 303247224425903450112) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 303247224425903450112) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((35339303413578220958383 : Rat) / 303247224425903450112) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((35339303413578220958383 : Rat) / 303247224425903450112) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0638_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0638
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0639 : Poly :=
[
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (16, 1)]
]

/-- Partial product 639 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0639 : Poly :=
[
  term ((-312569147990625553337 : Rat) / 16847068023661302784) [(6, 1), (11, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(6, 2), (11, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(7, 2), (11, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 16847068023661302784) [(11, 2), (12, 1), (16, 1)],
  term ((-312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (12, 2), (16, 1)],
  term ((-312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0639_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0639
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0640 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 640 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0640 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0640_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0640
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0641 : Poly :=
[
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0641 : Poly :=
[
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 214764323247806976) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0641_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0641
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0642 : Poly :=
[
  term ((1286262501909907511 : Rat) / 143176215498537984) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0642 : Poly :=
[
  term ((-1286262501909907511 : Rat) / 71588107749268992) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 71588107749268992) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 143176215498537984) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 143176215498537984) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0642_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0642
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0643 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 643 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0643 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0643_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0643
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0644 : Poly :=
[
  term ((1353319841726368049 : Rat) / 95450810332358656) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 644 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0644 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0644_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0644
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0645 : Poly :=
[
  term ((919731829805977691 : Rat) / 122722470427318272) [(14, 1), (16, 1)]
]

/-- Partial product 645 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0645 : Poly :=
[
  term ((-919731829805977691 : Rat) / 61361235213659136) [(6, 1), (14, 1), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(6, 2), (14, 1), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(7, 2), (14, 1), (16, 1)],
  term ((919731829805977691 : Rat) / 61361235213659136) [(12, 1), (14, 1), (16, 1)],
  term ((-919731829805977691 : Rat) / 122722470427318272) [(12, 2), (14, 1), (16, 1)],
  term ((-919731829805977691 : Rat) / 122722470427318272) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0645_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0645
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0646 : Poly :=
[
  term ((-4021899309353667557 : Rat) / 53691080811951744) [(15, 2), (16, 1)]
]

/-- Partial product 646 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0646 : Poly :=
[
  term ((4021899309353667557 : Rat) / 26845540405975872) [(6, 1), (15, 2), (16, 1)],
  term ((-4021899309353667557 : Rat) / 53691080811951744) [(6, 2), (15, 2), (16, 1)],
  term ((-4021899309353667557 : Rat) / 53691080811951744) [(7, 2), (15, 2), (16, 1)],
  term ((-4021899309353667557 : Rat) / 26845540405975872) [(12, 1), (15, 2), (16, 1)],
  term ((4021899309353667557 : Rat) / 53691080811951744) [(12, 2), (15, 2), (16, 1)],
  term ((4021899309353667557 : Rat) / 53691080811951744) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0646_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0646
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010NYY_coefficient_04_0647 : Poly :=
[
  term ((-682526322749577527 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 647 for generator 4. -/
def rs_R010_ueqv_R010NYY_partial_04_0647 : Poly :=
[
  term ((682526322749577527 : Rat) / 61361235213659136) [(6, 1), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(6, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(7, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 61361235213659136) [(12, 1), (16, 1)],
  term ((682526322749577527 : Rat) / 122722470427318272) [(12, 2), (16, 1)],
  term ((682526322749577527 : Rat) / 122722470427318272) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 4. -/
theorem rs_R010_ueqv_R010NYY_partial_04_0647_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_04_0647
        rs_R010_ueqv_R010NYY_generator_04_0600_0647 =
      rs_R010_ueqv_R010NYY_partial_04_0647 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_04_0600_0647 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_04_0600,
  rs_R010_ueqv_R010NYY_partial_04_0601,
  rs_R010_ueqv_R010NYY_partial_04_0602,
  rs_R010_ueqv_R010NYY_partial_04_0603,
  rs_R010_ueqv_R010NYY_partial_04_0604,
  rs_R010_ueqv_R010NYY_partial_04_0605,
  rs_R010_ueqv_R010NYY_partial_04_0606,
  rs_R010_ueqv_R010NYY_partial_04_0607,
  rs_R010_ueqv_R010NYY_partial_04_0608,
  rs_R010_ueqv_R010NYY_partial_04_0609,
  rs_R010_ueqv_R010NYY_partial_04_0610,
  rs_R010_ueqv_R010NYY_partial_04_0611,
  rs_R010_ueqv_R010NYY_partial_04_0612,
  rs_R010_ueqv_R010NYY_partial_04_0613,
  rs_R010_ueqv_R010NYY_partial_04_0614,
  rs_R010_ueqv_R010NYY_partial_04_0615,
  rs_R010_ueqv_R010NYY_partial_04_0616,
  rs_R010_ueqv_R010NYY_partial_04_0617,
  rs_R010_ueqv_R010NYY_partial_04_0618,
  rs_R010_ueqv_R010NYY_partial_04_0619,
  rs_R010_ueqv_R010NYY_partial_04_0620,
  rs_R010_ueqv_R010NYY_partial_04_0621,
  rs_R010_ueqv_R010NYY_partial_04_0622,
  rs_R010_ueqv_R010NYY_partial_04_0623,
  rs_R010_ueqv_R010NYY_partial_04_0624,
  rs_R010_ueqv_R010NYY_partial_04_0625,
  rs_R010_ueqv_R010NYY_partial_04_0626,
  rs_R010_ueqv_R010NYY_partial_04_0627,
  rs_R010_ueqv_R010NYY_partial_04_0628,
  rs_R010_ueqv_R010NYY_partial_04_0629,
  rs_R010_ueqv_R010NYY_partial_04_0630,
  rs_R010_ueqv_R010NYY_partial_04_0631,
  rs_R010_ueqv_R010NYY_partial_04_0632,
  rs_R010_ueqv_R010NYY_partial_04_0633,
  rs_R010_ueqv_R010NYY_partial_04_0634,
  rs_R010_ueqv_R010NYY_partial_04_0635,
  rs_R010_ueqv_R010NYY_partial_04_0636,
  rs_R010_ueqv_R010NYY_partial_04_0637,
  rs_R010_ueqv_R010NYY_partial_04_0638,
  rs_R010_ueqv_R010NYY_partial_04_0639,
  rs_R010_ueqv_R010NYY_partial_04_0640,
  rs_R010_ueqv_R010NYY_partial_04_0641,
  rs_R010_ueqv_R010NYY_partial_04_0642,
  rs_R010_ueqv_R010NYY_partial_04_0643,
  rs_R010_ueqv_R010NYY_partial_04_0644,
  rs_R010_ueqv_R010NYY_partial_04_0645,
  rs_R010_ueqv_R010NYY_partial_04_0646,
  rs_R010_ueqv_R010NYY_partial_04_0647
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_04_0600_0647 : Poly :=
[
  term ((1756747773194754559 : Rat) / 47725405166179328) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 2), (10, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 1579412627218247136) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 5965675645772416) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 313982928724864) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2098833428243959 : Rat) / 2556718133902464) [(6, 1), (9, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 3), (11, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 4211767005915325696) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212289452128194361969 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((17805922420307 : Rat) / 30437120641696) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 941948786174592) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6317130484575125 : Rat) / 730490895400704) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 11931351291544832) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 213059844491872) [(6, 1), (10, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 3408957511869952) [(6, 1), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35784179868088744383709 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-518893604425934233781 : Rat) / 6317650508872988544) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 33694136047322605568) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((169904602033212749 : Rat) / 3408957511869952) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 25270602035491954176) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((35339303413578220958383 : Rat) / 151623612212951725056) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-312569147990625553337 : Rat) / 16847068023661302784) [(6, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 71588107749268992) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-919731829805977691 : Rat) / 61361235213659136) [(6, 1), (14, 1), (16, 1)],
  term ((4021899309353667557 : Rat) / 26845540405975872) [(6, 1), (15, 2), (16, 1)],
  term ((682526322749577527 : Rat) / 61361235213659136) [(6, 1), (16, 1)],
  term ((-1756747773194754559 : Rat) / 95450810332358656) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(6, 2), (9, 2), (11, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(6, 2), (9, 2), (14, 1), (16, 1)],
  term ((33093482828145841 : Rat) / 627965857449728) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 5113436267804928) [(6, 2), (9, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 3), (11, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 3), (15, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(6, 2), (10, 1), (14, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 23862702583089664) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(6, 2), (10, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(6, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 3), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 67388272094645211136) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-169904602033212749 : Rat) / 6817915023739904) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 303247224425903450112) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(6, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(6, 2), (14, 1), (16, 1)],
  term ((-4021899309353667557 : Rat) / 53691080811951744) [(6, 2), (15, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(6, 2), (16, 1)],
  term ((-1756747773194754559 : Rat) / 95450810332358656) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 11931351291544832) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((33093482828145841 : Rat) / 627965857449728) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 5113436267804928) [(7, 2), (9, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 8423534011830651392) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 1883897572349184) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(7, 2), (10, 1), (14, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 23862702583089664) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 426119688983744) [(7, 2), (10, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 6817915023739904) [(7, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 3), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((518893604425934233781 : Rat) / 12635301017745977088) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 67388272094645211136) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-169904602033212749 : Rat) / 6817915023739904) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 50541204070983908352) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 303247224425903450112) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 33694136047322605568) [(7, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 143176215498537984) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(7, 2), (14, 1), (16, 1)],
  term ((-4021899309353667557 : Rat) / 53691080811951744) [(7, 2), (15, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 122722470427318272) [(7, 2), (16, 1)],
  term ((-1756747773194754559 : Rat) / 47725405166179328) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((1756747773194754559 : Rat) / 95450810332358656) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((1756747773194754559 : Rat) / 95450810332358656) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((349947488033723 : Rat) / 106529922245936) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 2), (10, 1), (13, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-447111482668512639503 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((676639965594754681593 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-676639965594754681593 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((447111482668512639503 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-59177047069555969759 : Rat) / 1579412627218247136) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (12, 2), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (13, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-255006898652461167 : Rat) / 5965675645772416) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((33093482828145841 : Rat) / 313982928724864) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 2556718133902464) [(9, 2), (12, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 627965857449728) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-2098833428243959 : Rat) / 5113436267804928) [(9, 2), (12, 2), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-33093482828145841 : Rat) / 627965857449728) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2098833428243959 : Rat) / 5113436267804928) [(9, 2), (13, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((255006898652461167 : Rat) / 11931351291544832) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (12, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((29843229626409921277 : Rat) / 4211767005915325696) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((212289452128194361969 : Rat) / 3158825254436494272) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-212289452128194361969 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-212289452128194361969 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29843229626409921277 : Rat) / 8423534011830651392) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (12, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (13, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 30437120641696) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((923014401522365 : Rat) / 941948786174592) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 730490895400704) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((275302413258646267 : Rat) / 11931351291544832) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1892829473632371 : Rat) / 213059844491872) [(10, 1), (12, 1), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 1883897572349184) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6317130484575125 : Rat) / 1460981790801408) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 23862702583089664) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (12, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-6317130484575125 : Rat) / 1460981790801408) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-275302413258646267 : Rat) / 23862702583089664) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1892829473632371 : Rat) / 426119688983744) [(10, 1), (13, 2), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-923014401522365 : Rat) / 1883897572349184) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-6118903222396731 : Rat) / 3408957511869952) [(10, 2), (12, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (12, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((6118903222396731 : Rat) / 6817915023739904) [(10, 2), (13, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(10, 3), (12, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (12, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (13, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35784179868088744383709 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((518893604425934233781 : Rat) / 6317650508872988544) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19850911338266314497243 : Rat) / 33694136047322605568) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-169904602033212749 : Rat) / 3408957511869952) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 67388272094645211136) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((169904602033212749 : Rat) / 6817915023739904) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((19850911338266314497243 : Rat) / 67388272094645211136) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((169904602033212749 : Rat) / 6817915023739904) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((35784179868088744383709 : Rat) / 303247224425903450112) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-518893604425934233781 : Rat) / 12635301017745977088) [(11, 1), (13, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2806946967484502872129 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-35339303413578220958383 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((312569147990625553337 : Rat) / 16847068023661302784) [(11, 2), (12, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((35339303413578220958383 : Rat) / 303247224425903450112) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (12, 2), (16, 1)],
  term ((128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((35339303413578220958383 : Rat) / 303247224425903450112) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-312569147990625553337 : Rat) / 33694136047322605568) [(11, 2), (13, 2), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2806946967484502872129 : Rat) / 50541204070983908352) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 214764323247806976) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1286262501909907511 : Rat) / 71588107749268992) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 61361235213659136) [(12, 1), (14, 1), (16, 1)],
  term ((-4021899309353667557 : Rat) / 26845540405975872) [(12, 1), (15, 2), (16, 1)],
  term ((-682526322749577527 : Rat) / 61361235213659136) [(12, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 143176215498537984) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-919731829805977691 : Rat) / 122722470427318272) [(12, 2), (14, 1), (16, 1)],
  term ((4021899309353667557 : Rat) / 53691080811951744) [(12, 2), (15, 2), (16, 1)],
  term ((682526322749577527 : Rat) / 122722470427318272) [(12, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-919731829805977691 : Rat) / 122722470427318272) [(13, 2), (14, 1), (16, 1)],
  term ((4021899309353667557 : Rat) / 53691080811951744) [(13, 2), (15, 2), (16, 1)],
  term ((682526322749577527 : Rat) / 122722470427318272) [(13, 2), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1286262501909907511 : Rat) / 143176215498537984) [(13, 3), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 600 through 647. -/
theorem rs_R010_ueqv_R010NYY_block_04_0600_0647_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_04_0600_0647
      rs_R010_ueqv_R010NYY_block_04_0600_0647 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
