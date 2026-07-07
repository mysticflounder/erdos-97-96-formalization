/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 5:600-643

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_05_0600_0643 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0600 : Poly :=
[
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0600 : Poly :=
[
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0600_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0600
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0601 : Poly :=
[
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 601 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0601 : Poly :=
[
  term ((-59177047069555969759 : Rat) / 1579412627218247136) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(6, 2), (9, 2), (11, 2), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((59177047069555969759 : Rat) / 1579412627218247136) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0601_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0601
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0602 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 602 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0602 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0602_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0602
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0603 : Poly :=
[
  term ((70302592550481639 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0603 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 11931351291544832) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 11931351291544832) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0603_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0603
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0604 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 604 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0604 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (9, 2), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 2), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0604_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0604
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0605 : Poly :=
[
  term ((-37052508790115989 : Rat) / 1704478755934976) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0605 : Poly :=
[
  term ((37052508790115989 : Rat) / 852239377967488) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-37052508790115989 : Rat) / 852239377967488) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0605_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0605
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0606 : Poly :=
[
  term ((2100536428160717 : Rat) / 5113436267804928) [(9, 2), (16, 1)]
]

/-- Partial product 606 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0606 : Poly :=
[
  term ((-2100536428160717 : Rat) / 2556718133902464) [(6, 1), (9, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 5113436267804928) [(6, 2), (9, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 5113436267804928) [(7, 2), (9, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)],
  term ((-2100536428160717 : Rat) / 5113436267804928) [(9, 2), (14, 2), (16, 1)],
  term ((-2100536428160717 : Rat) / 5113436267804928) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0606_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0606
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0607 : Poly :=
[
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (16, 1)]
]

/-- Partial product 607 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0607 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 3), (11, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 3), (11, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0607_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0607
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0608 : Poly :=
[
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0608 : Poly :=
[
  term ((-23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 3), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0608_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0608
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0609 : Poly :=
[
  term ((-1021205167329736472971 : Rat) / 12635301017745977088) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 609 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0609 : Poly :=
[
  term ((1021205167329736472971 : Rat) / 6317650508872988544) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 12635301017745977088) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 12635301017745977088) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1021205167329736472971 : Rat) / 12635301017745977088) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1021205167329736472971 : Rat) / 12635301017745977088) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0609_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0609
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0610 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0610 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0610_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0610
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0611 : Poly :=
[
  term ((683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0611 : Poly :=
[
  term ((-683208579787935367 : Rat) / 55417986919938496) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 110835973839876992) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 110835973839876992) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0611_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0611
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0612 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 612 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0612 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0612_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0612
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0613 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 613 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0613 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0613_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0613
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0614 : Poly :=
[
  term ((17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0614 : Poly :=
[
  term ((-17805922420307 : Rat) / 30437120641696) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((17805922420307 : Rat) / 30437120641696) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0614_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0614
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0615 : Poly :=
[
  term ((-645808434510815285 : Rat) / 35794053874634496) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0615 : Poly :=
[
  term ((645808434510815285 : Rat) / 17897026937317248) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-645808434510815285 : Rat) / 35794053874634496) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-645808434510815285 : Rat) / 35794053874634496) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-645808434510815285 : Rat) / 17897026937317248) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((645808434510815285 : Rat) / 35794053874634496) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((645808434510815285 : Rat) / 35794053874634496) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0615_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0615
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0616 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 616 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0616 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0616_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0616
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0617 : Poly :=
[
  term ((-79019449741560323 : Rat) / 10226872535609856) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 617 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0617 : Poly :=
[
  term ((79019449741560323 : Rat) / 5113436267804928) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-79019449741560323 : Rat) / 10226872535609856) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-79019449741560323 : Rat) / 10226872535609856) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((79019449741560323 : Rat) / 10226872535609856) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79019449741560323 : Rat) / 5113436267804928) [(10, 1), (14, 2), (16, 1)],
  term ((79019449741560323 : Rat) / 10226872535609856) [(10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0617_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0617
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0618 : Poly :=
[
  term ((-724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 618 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0618 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(6, 2), (10, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(7, 2), (10, 1), (14, 2), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(10, 1), (14, 3), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0618_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0618
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0619 : Poly :=
[
  term ((-777244792813185 : Rat) / 1255931714899456) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0619 : Poly :=
[
  term ((777244792813185 : Rat) / 627965857449728) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-777244792813185 : Rat) / 1255931714899456) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-777244792813185 : Rat) / 1255931714899456) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-777244792813185 : Rat) / 627965857449728) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((777244792813185 : Rat) / 1255931714899456) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((777244792813185 : Rat) / 1255931714899456) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0619_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0619
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0620 : Poly :=
[
  term ((1361115627662559 : Rat) / 213059844491872) [(10, 1), (16, 1)]
]

/-- Partial product 620 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0620 : Poly :=
[
  term ((-1361115627662559 : Rat) / 106529922245936) [(6, 1), (10, 1), (16, 1)],
  term ((1361115627662559 : Rat) / 213059844491872) [(6, 2), (10, 1), (16, 1)],
  term ((1361115627662559 : Rat) / 213059844491872) [(7, 2), (10, 1), (16, 1)],
  term ((1361115627662559 : Rat) / 106529922245936) [(10, 1), (14, 1), (16, 1)],
  term ((-1361115627662559 : Rat) / 213059844491872) [(10, 1), (14, 2), (16, 1)],
  term ((-1361115627662559 : Rat) / 213059844491872) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0620_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0620
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0621 : Poly :=
[
  term ((14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 621 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0621 : Poly :=
[
  term ((-14849754300339743 : Rat) / 1704478755934976) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(10, 2), (14, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0621_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0621
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0622 : Poly :=
[
  term ((1006238874967181 : Rat) / 358837632828416) [(10, 2), (16, 1)]
]

/-- Partial product 622 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0622 : Poly :=
[
  term ((-1006238874967181 : Rat) / 179418816414208) [(6, 1), (10, 2), (16, 1)],
  term ((1006238874967181 : Rat) / 358837632828416) [(6, 2), (10, 2), (16, 1)],
  term ((1006238874967181 : Rat) / 358837632828416) [(7, 2), (10, 2), (16, 1)],
  term ((1006238874967181 : Rat) / 179418816414208) [(10, 2), (14, 1), (16, 1)],
  term ((-1006238874967181 : Rat) / 358837632828416) [(10, 2), (14, 2), (16, 1)],
  term ((-1006238874967181 : Rat) / 358837632828416) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0622_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0622
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0623 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 3), (16, 1)]
]

/-- Partial product 623 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0623 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 3), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (14, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0623_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0623
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0624 : Poly :=
[
  term ((24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 624 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0624 : Poly :=
[
  term ((-24259046380348383 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((24259046380348383 : Rat) / 5965675645772416) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0624_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0624
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0625 : Poly :=
[
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 625 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0625 : Poly :=
[
  term ((566024211209651632211 : Rat) / 18952951526618965632) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0625_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0625
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0626 : Poly :=
[
  term ((38367577060192186572853 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 626 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0626 : Poly :=
[
  term ((-38367577060192186572853 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38367577060192186572853 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38367577060192186572853 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38367577060192186572853 : Rat) / 151623612212951725056) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38367577060192186572853 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-38367577060192186572853 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0626_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0626
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0627 : Poly :=
[
  term ((914508332195847855763 : Rat) / 75811806106475862528) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 627 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0627 : Poly :=
[
  term ((-914508332195847855763 : Rat) / 37905903053237931264) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((914508332195847855763 : Rat) / 75811806106475862528) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((914508332195847855763 : Rat) / 75811806106475862528) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((914508332195847855763 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-914508332195847855763 : Rat) / 75811806106475862528) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-914508332195847855763 : Rat) / 75811806106475862528) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0627_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0627
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0628 : Poly :=
[
  term ((5626234516085811306355 : Rat) / 86642064121686700032) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 628 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0628 : Poly :=
[
  term ((-5626234516085811306355 : Rat) / 43321032060843350016) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5626234516085811306355 : Rat) / 86642064121686700032) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5626234516085811306355 : Rat) / 86642064121686700032) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5626234516085811306355 : Rat) / 86642064121686700032) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((5626234516085811306355 : Rat) / 43321032060843350016) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5626234516085811306355 : Rat) / 86642064121686700032) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0628_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0628
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0629 : Poly :=
[
  term ((5580020326049153419 : Rat) / 773589858229345536) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 629 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0629 : Poly :=
[
  term ((-5580020326049153419 : Rat) / 386794929114672768) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((5580020326049153419 : Rat) / 773589858229345536) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((5580020326049153419 : Rat) / 773589858229345536) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((5580020326049153419 : Rat) / 386794929114672768) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5580020326049153419 : Rat) / 773589858229345536) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5580020326049153419 : Rat) / 773589858229345536) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0629_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0629
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0630 : Poly :=
[
  term ((-1401837934487064815 : Rat) / 47725405166179328) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 630 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0630 : Poly :=
[
  term ((1401837934487064815 : Rat) / 23862702583089664) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1401837934487064815 : Rat) / 47725405166179328) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1401837934487064815 : Rat) / 47725405166179328) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1401837934487064815 : Rat) / 23862702583089664) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1401837934487064815 : Rat) / 47725405166179328) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((1401837934487064815 : Rat) / 47725405166179328) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0630_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0630
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0631 : Poly :=
[
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 631 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0631 : Poly :=
[
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0631_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0631
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0632 : Poly :=
[
  term ((-1139225920470778172147 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 632 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0632 : Poly :=
[
  term ((1139225920470778172147 : Rat) / 25270602035491954176) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 50541204070983908352) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 50541204070983908352) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 25270602035491954176) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1139225920470778172147 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1139225920470778172147 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0632_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0632
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0633 : Poly :=
[
  term ((-216228335068701851057 : Rat) / 101082408141967816704) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 633 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0633 : Poly :=
[
  term ((216228335068701851057 : Rat) / 50541204070983908352) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-216228335068701851057 : Rat) / 101082408141967816704) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-216228335068701851057 : Rat) / 101082408141967816704) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((216228335068701851057 : Rat) / 101082408141967816704) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-216228335068701851057 : Rat) / 50541204070983908352) [(11, 2), (14, 2), (16, 1)],
  term ((216228335068701851057 : Rat) / 101082408141967816704) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0633_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0633
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0634 : Poly :=
[
  term ((-40287970333432040705659 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 634 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0634 : Poly :=
[
  term ((40287970333432040705659 : Rat) / 151623612212951725056) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-40287970333432040705659 : Rat) / 303247224425903450112) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-40287970333432040705659 : Rat) / 303247224425903450112) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-40287970333432040705659 : Rat) / 151623612212951725056) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((40287970333432040705659 : Rat) / 303247224425903450112) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((40287970333432040705659 : Rat) / 303247224425903450112) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0634_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0634
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0635 : Poly :=
[
  term ((828149585484294080507 : Rat) / 25270602035491954176) [(11, 2), (16, 1)]
]

/-- Partial product 635 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0635 : Poly :=
[
  term ((-828149585484294080507 : Rat) / 12635301017745977088) [(6, 1), (11, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 25270602035491954176) [(6, 2), (11, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 25270602035491954176) [(7, 2), (11, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 12635301017745977088) [(11, 2), (14, 1), (16, 1)],
  term ((-828149585484294080507 : Rat) / 25270602035491954176) [(11, 2), (14, 2), (16, 1)],
  term ((-828149585484294080507 : Rat) / 25270602035491954176) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0635_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0635
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0636 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0636 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0636_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0636
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0637 : Poly :=
[
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 637 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0637 : Poly :=
[
  term ((1098054255679196173 : Rat) / 214764323247806976) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0637_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0637
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0638 : Poly :=
[
  term ((4062560835543402643 : Rat) / 429528646495613952) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0638 : Poly :=
[
  term ((-4062560835543402643 : Rat) / 214764323247806976) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4062560835543402643 : Rat) / 429528646495613952) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((4062560835543402643 : Rat) / 429528646495613952) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((4062560835543402643 : Rat) / 214764323247806976) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4062560835543402643 : Rat) / 429528646495613952) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4062560835543402643 : Rat) / 429528646495613952) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0638_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0638
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0639 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 639 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0639 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0639_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0639
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0640 : Poly :=
[
  term ((1353319841726368049 : Rat) / 95450810332358656) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 640 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0640 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(14, 1), (15, 4), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(14, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0640_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0640
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0641 : Poly :=
[
  term ((-344374309998169547 : Rat) / 122722470427318272) [(14, 1), (16, 1)]
]

/-- Partial product 641 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0641 : Poly :=
[
  term ((344374309998169547 : Rat) / 61361235213659136) [(6, 1), (14, 1), (16, 1)],
  term ((-344374309998169547 : Rat) / 122722470427318272) [(6, 2), (14, 1), (16, 1)],
  term ((-344374309998169547 : Rat) / 122722470427318272) [(7, 2), (14, 1), (16, 1)],
  term ((344374309998169547 : Rat) / 122722470427318272) [(14, 1), (15, 2), (16, 1)],
  term ((-344374309998169547 : Rat) / 61361235213659136) [(14, 2), (16, 1)],
  term ((344374309998169547 : Rat) / 122722470427318272) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0641_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0641
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0642 : Poly :=
[
  term ((1098054255679196173 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 642 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0642 : Poly :=
[
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(6, 1), (15, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 859057292991227904) [(6, 2), (15, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 859057292991227904) [(7, 2), (15, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(14, 1), (15, 2), (16, 1)],
  term ((-1098054255679196173 : Rat) / 859057292991227904) [(14, 2), (15, 2), (16, 1)],
  term ((-1098054255679196173 : Rat) / 859057292991227904) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0642_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0642
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010NYY_coefficient_05_0643 : Poly :=
[
  term ((13887905301186391 : Rat) / 10226872535609856) [(16, 1)]
]

/-- Partial product 643 for generator 5. -/
def rs_R010_ueqv_R010NYY_partial_05_0643 : Poly :=
[
  term ((-13887905301186391 : Rat) / 5113436267804928) [(6, 1), (16, 1)],
  term ((13887905301186391 : Rat) / 10226872535609856) [(6, 2), (16, 1)],
  term ((13887905301186391 : Rat) / 10226872535609856) [(7, 2), (16, 1)],
  term ((13887905301186391 : Rat) / 5113436267804928) [(14, 1), (16, 1)],
  term ((-13887905301186391 : Rat) / 10226872535609856) [(14, 2), (16, 1)],
  term ((-13887905301186391 : Rat) / 10226872535609856) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 5. -/
theorem rs_R010_ueqv_R010NYY_partial_05_0643_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_05_0643
        rs_R010_ueqv_R010NYY_generator_05_0600_0643 =
      rs_R010_ueqv_R010NYY_partial_05_0643 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_05_0600_0643 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_05_0600,
  rs_R010_ueqv_R010NYY_partial_05_0601,
  rs_R010_ueqv_R010NYY_partial_05_0602,
  rs_R010_ueqv_R010NYY_partial_05_0603,
  rs_R010_ueqv_R010NYY_partial_05_0604,
  rs_R010_ueqv_R010NYY_partial_05_0605,
  rs_R010_ueqv_R010NYY_partial_05_0606,
  rs_R010_ueqv_R010NYY_partial_05_0607,
  rs_R010_ueqv_R010NYY_partial_05_0608,
  rs_R010_ueqv_R010NYY_partial_05_0609,
  rs_R010_ueqv_R010NYY_partial_05_0610,
  rs_R010_ueqv_R010NYY_partial_05_0611,
  rs_R010_ueqv_R010NYY_partial_05_0612,
  rs_R010_ueqv_R010NYY_partial_05_0613,
  rs_R010_ueqv_R010NYY_partial_05_0614,
  rs_R010_ueqv_R010NYY_partial_05_0615,
  rs_R010_ueqv_R010NYY_partial_05_0616,
  rs_R010_ueqv_R010NYY_partial_05_0617,
  rs_R010_ueqv_R010NYY_partial_05_0618,
  rs_R010_ueqv_R010NYY_partial_05_0619,
  rs_R010_ueqv_R010NYY_partial_05_0620,
  rs_R010_ueqv_R010NYY_partial_05_0621,
  rs_R010_ueqv_R010NYY_partial_05_0622,
  rs_R010_ueqv_R010NYY_partial_05_0623,
  rs_R010_ueqv_R010NYY_partial_05_0624,
  rs_R010_ueqv_R010NYY_partial_05_0625,
  rs_R010_ueqv_R010NYY_partial_05_0626,
  rs_R010_ueqv_R010NYY_partial_05_0627,
  rs_R010_ueqv_R010NYY_partial_05_0628,
  rs_R010_ueqv_R010NYY_partial_05_0629,
  rs_R010_ueqv_R010NYY_partial_05_0630,
  rs_R010_ueqv_R010NYY_partial_05_0631,
  rs_R010_ueqv_R010NYY_partial_05_0632,
  rs_R010_ueqv_R010NYY_partial_05_0633,
  rs_R010_ueqv_R010NYY_partial_05_0634,
  rs_R010_ueqv_R010NYY_partial_05_0635,
  rs_R010_ueqv_R010NYY_partial_05_0636,
  rs_R010_ueqv_R010NYY_partial_05_0637,
  rs_R010_ueqv_R010NYY_partial_05_0638,
  rs_R010_ueqv_R010NYY_partial_05_0639,
  rs_R010_ueqv_R010NYY_partial_05_0640,
  rs_R010_ueqv_R010NYY_partial_05_0641,
  rs_R010_ueqv_R010NYY_partial_05_0642,
  rs_R010_ueqv_R010NYY_partial_05_0643
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_05_0600_0643 : Poly :=
[
  term ((13135307637040010281 : Rat) / 4211767005915325696) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59177047069555969759 : Rat) / 1579412627218247136) [(6, 1), (9, 2), (11, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (9, 2), (14, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 852239377967488) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2100536428160717 : Rat) / 2556718133902464) [(6, 1), (9, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 3), (11, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((1021205167329736472971 : Rat) / 6317650508872988544) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 55417986919938496) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-17805922420307 : Rat) / 30437120641696) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((645808434510815285 : Rat) / 17897026937317248) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((79019449741560323 : Rat) / 5113436267804928) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((777244792813185 : Rat) / 627965857449728) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1361115627662559 : Rat) / 106529922245936) [(6, 1), (10, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 1704478755934976) [(6, 1), (10, 2), (14, 1), (16, 1)],
  term ((-1006238874967181 : Rat) / 179418816414208) [(6, 1), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 3), (16, 1)],
  term ((-24259046380348383 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 18952951526618965632) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38367577060192186572853 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-914508332195847855763 : Rat) / 37905903053237931264) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5626234516085811306355 : Rat) / 43321032060843350016) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5580020326049153419 : Rat) / 386794929114672768) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1401837934487064815 : Rat) / 23862702583089664) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-70245268919840672953 : Rat) / 4211767005915325696) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1139225920470778172147 : Rat) / 25270602035491954176) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((216228335068701851057 : Rat) / 50541204070983908352) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((40287970333432040705659 : Rat) / 151623612212951725056) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-828149585484294080507 : Rat) / 12635301017745977088) [(6, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 214764323247806976) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4062560835543402643 : Rat) / 214764323247806976) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((344374309998169547 : Rat) / 61361235213659136) [(6, 1), (14, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(6, 1), (15, 2), (16, 1)],
  term ((-13887905301186391 : Rat) / 5113436267804928) [(6, 1), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(6, 2), (9, 2), (11, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 11931351291544832) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 5113436267804928) [(6, 2), (9, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 3), (11, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 12635301017745977088) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 110835973839876992) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(6, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-645808434510815285 : Rat) / 35794053874634496) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79019449741560323 : Rat) / 10226872535609856) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(6, 2), (10, 1), (14, 2), (16, 1)],
  term ((-777244792813185 : Rat) / 1255931714899456) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((1361115627662559 : Rat) / 213059844491872) [(6, 2), (10, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(6, 2), (10, 2), (14, 1), (16, 1)],
  term ((1006238874967181 : Rat) / 358837632828416) [(6, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((38367577060192186572853 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((914508332195847855763 : Rat) / 75811806106475862528) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((5626234516085811306355 : Rat) / 86642064121686700032) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5580020326049153419 : Rat) / 773589858229345536) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1401837934487064815 : Rat) / 47725405166179328) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 50541204070983908352) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-216228335068701851057 : Rat) / 101082408141967816704) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-40287970333432040705659 : Rat) / 303247224425903450112) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 25270602035491954176) [(6, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4062560835543402643 : Rat) / 429528646495613952) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-344374309998169547 : Rat) / 122722470427318272) [(6, 2), (14, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 859057292991227904) [(6, 2), (15, 2), (16, 1)],
  term ((13887905301186391 : Rat) / 10226872535609856) [(6, 2), (16, 1)],
  term ((-13135307637040010281 : Rat) / 8423534011830651392) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((59177047069555969759 : Rat) / 3158825254436494272) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 11931351291544832) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-37052508790115989 : Rat) / 1704478755934976) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 5113436267804928) [(7, 2), (9, 2), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 12635301017745977088) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((683208579787935367 : Rat) / 110835973839876992) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((17805922420307 : Rat) / 60874241283392) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-645808434510815285 : Rat) / 35794053874634496) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79019449741560323 : Rat) / 10226872535609856) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 426119688983744) [(7, 2), (10, 1), (14, 2), (16, 1)],
  term ((-777244792813185 : Rat) / 1255931714899456) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((1361115627662559 : Rat) / 213059844491872) [(7, 2), (10, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 3408957511869952) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((1006238874967181 : Rat) / 358837632828416) [(7, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 3), (16, 1)],
  term ((24259046380348383 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((38367577060192186572853 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((914508332195847855763 : Rat) / 75811806106475862528) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((5626234516085811306355 : Rat) / 86642064121686700032) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5580020326049153419 : Rat) / 773589858229345536) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1401837934487064815 : Rat) / 47725405166179328) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 50541204070983908352) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-216228335068701851057 : Rat) / 101082408141967816704) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-40287970333432040705659 : Rat) / 303247224425903450112) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 25270602035491954176) [(7, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4062560835543402643 : Rat) / 429528646495613952) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-344374309998169547 : Rat) / 122722470427318272) [(7, 2), (14, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 859057292991227904) [(7, 2), (15, 2), (16, 1)],
  term ((13887905301186391 : Rat) / 10226872535609856) [(7, 2), (16, 1)],
  term ((-13135307637040010281 : Rat) / 4211767005915325696) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((13135307637040010281 : Rat) / 8423534011830651392) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((59177047069555969759 : Rat) / 1579412627218247136) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-59177047069555969759 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((299106019653477417 : Rat) / 11931351291544832) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 11931351291544832) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2337653517384357 : Rat) / 53264961122968) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((2100536428160717 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)],
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((2098833428243959 : Rat) / 5113436267804928) [(9, 2), (14, 2), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(9, 2), (14, 3), (16, 1)],
  term ((-2100536428160717 : Rat) / 5113436267804928) [(9, 2), (15, 2), (16, 1)],
  term ((37052508790115989 : Rat) / 1704478755934976) [(9, 2), (15, 4), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 3), (15, 3), (16, 1)],
  term ((-1021205167329736472971 : Rat) / 6317650508872988544) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1021205167329736472971 : Rat) / 12635301017745977088) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1021205167329736472971 : Rat) / 12635301017745977088) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((683208579787935367 : Rat) / 55417986919938496) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39958184830024804174561 : Rat) / 151623612212951725056) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(10, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-683208579787935367 : Rat) / 110835973839876992) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((302315845450349188327 : Rat) / 12635301017745977088) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(10, 1), (11, 2), (14, 3), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-645808434510815285 : Rat) / 17897026937317248) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((666748199277096317 : Rat) / 35794053874634496) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17805922420307 : Rat) / 60874241283392) [(10, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((645808434510815285 : Rat) / 35794053874634496) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((464530241810219171 : Rat) / 71588107749268992) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((1361115627662559 : Rat) / 106529922245936) [(10, 1), (14, 1), (16, 1)],
  term ((-34156650831275281 : Rat) / 627965857449728) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-111686224805461739 : Rat) / 5113436267804928) [(10, 1), (14, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(10, 1), (14, 3), (15, 2), (16, 1)],
  term ((6317130484575125 : Rat) / 1460981790801408) [(10, 1), (14, 3), (16, 1)],
  term ((724990340615301 : Rat) / 426119688983744) [(10, 1), (14, 4), (16, 1)],
  term ((-1361115627662559 : Rat) / 213059844491872) [(10, 1), (15, 2), (16, 1)],
  term ((777244792813185 : Rat) / 1255931714899456) [(10, 1), (15, 4), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((1006238874967181 : Rat) / 179418816414208) [(10, 2), (14, 1), (16, 1)],
  term ((40280478576982533 : Rat) / 6817915023739904) [(10, 2), (14, 2), (16, 1)],
  term ((-14849754300339743 : Rat) / 3408957511869952) [(10, 2), (14, 3), (16, 1)],
  term ((-1006238874967181 : Rat) / 358837632828416) [(10, 2), (15, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(10, 3), (14, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (14, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(10, 3), (15, 2), (16, 1)],
  term ((4514630433892310344633 : Rat) / 16847068023661302784) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 1), (15, 4), (16, 1)],
  term ((914508332195847855763 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-757845739073190154453 : Rat) / 6188718865834764288) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28636082675986075537 : Rat) / 682989244202485248) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24259046380348383 : Rat) / 11931351291544832) [(11, 1), (13, 1), (14, 3), (15, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-914508332195847855763 : Rat) / 75811806106475862528) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38367577060192186572853 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5580020326049153419 : Rat) / 386794929114672768) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75012754555523918482525 : Rat) / 606494448851806900224) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((5313753377827058714891 : Rat) / 43321032060843350016) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1401837934487064815 : Rat) / 47725405166179328) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-5626234516085811306355 : Rat) / 86642064121686700032) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-5580020326049153419 : Rat) / 773589858229345536) [(11, 1), (15, 3), (16, 1)],
  term ((1401837934487064815 : Rat) / 47725405166179328) [(11, 1), (15, 5), (16, 1)],
  term ((-1139225920470778172147 : Rat) / 25270602035491954176) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1982169147508866247583 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1139225920470778172147 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-11418179380236853694021 : Rat) / 43321032060843350016) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((828149585484294080507 : Rat) / 12635301017745977088) [(11, 2), (14, 1), (16, 1)],
  term ((40287970333432040705659 : Rat) / 303247224425903450112) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-89167976477966191051 : Rat) / 2406724003380186112) [(11, 2), (14, 2), (16, 1)],
  term ((216228335068701851057 : Rat) / 101082408141967816704) [(11, 2), (14, 3), (16, 1)],
  term ((-828149585484294080507 : Rat) / 25270602035491954176) [(11, 2), (15, 2), (16, 1)],
  term ((40287970333432040705659 : Rat) / 303247224425903450112) [(11, 2), (15, 4), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 3), (16, 1)],
  term ((4062560835543402643 : Rat) / 214764323247806976) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25457811406753821055 : Rat) / 429528646495613952) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2086223115633931663 : Rat) / 143176215498537984) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-4062560835543402643 : Rat) / 429528646495613952) [(13, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 5), (16, 1)],
  term ((4606728681345579175 : Rat) / 859057292991227904) [(14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(14, 1), (15, 4), (16, 1)],
  term ((13887905301186391 : Rat) / 5113436267804928) [(14, 1), (16, 1)],
  term ((3323100413627918387 : Rat) / 122722470427318272) [(14, 2), (15, 2), (16, 1)],
  term ((-3121910524126189 : Rat) / 447892227836928) [(14, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(14, 3), (15, 2), (16, 1)],
  term ((344374309998169547 : Rat) / 122722470427318272) [(14, 3), (16, 1)],
  term ((-13887905301186391 : Rat) / 10226872535609856) [(15, 2), (16, 1)],
  term ((-1098054255679196173 : Rat) / 859057292991227904) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 600 through 643. -/
theorem rs_R010_ueqv_R010NYY_block_05_0600_0643_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_05_0600_0643
      rs_R010_ueqv_R010NYY_block_05_0600_0643 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
