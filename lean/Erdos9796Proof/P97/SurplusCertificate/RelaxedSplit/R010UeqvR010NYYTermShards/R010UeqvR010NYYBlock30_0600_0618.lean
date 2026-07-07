/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 30:600-618

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_30_0600_0618 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0600 : Poly :=
[
  term ((-566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 600 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0600 : Poly :=
[
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0600_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0600
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0601 : Poly :=
[
  term ((39062966002754696109829 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 601 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0601 : Poly :=
[
  term ((39062966002754696109829 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39062966002754696109829 : Rat) / 303247224425903450112) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((39062966002754696109829 : Rat) / 151623612212951725056) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-39062966002754696109829 : Rat) / 303247224425903450112) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0601_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0601
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0602 : Poly :=
[
  term ((1272164270312604729 : Rat) / 443343895359507968) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 602 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0602 : Poly :=
[
  term ((1272164270312604729 : Rat) / 221671947679753984) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1272164270312604729 : Rat) / 443343895359507968) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1272164270312604729 : Rat) / 221671947679753984) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1272164270312604729 : Rat) / 443343895359507968) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0602_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0602
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0603 : Poly :=
[
  term ((-38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 603 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0603 : Poly :=
[
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0603_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0603
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0604 : Poly :=
[
  term ((8241145244788289053951 : Rat) / 202164816283935633408) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0604 : Poly :=
[
  term ((8241145244788289053951 : Rat) / 101082408141967816704) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8241145244788289053951 : Rat) / 202164816283935633408) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((8241145244788289053951 : Rat) / 101082408141967816704) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8241145244788289053951 : Rat) / 202164816283935633408) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0604_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0604
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0605 : Poly :=
[
  term ((-9524100357413659 : Rat) / 348360621650944) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 605 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0605 : Poly :=
[
  term ((-9524100357413659 : Rat) / 174180310825472) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((9524100357413659 : Rat) / 348360621650944) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-9524100357413659 : Rat) / 174180310825472) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((9524100357413659 : Rat) / 348360621650944) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0605_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0605
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0606 : Poly :=
[
  term ((70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 606 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0606 : Poly :=
[
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0606_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0606
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0607 : Poly :=
[
  term ((-395142777614787043475 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 607 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0607 : Poly :=
[
  term ((-395142777614787043475 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((395142777614787043475 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-395142777614787043475 : Rat) / 25270602035491954176) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((395142777614787043475 : Rat) / 50541204070983908352) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0607_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0607
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0608 : Poly :=
[
  term ((128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 608 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0608 : Poly :=
[
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0608_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0608
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0609 : Poly :=
[
  term ((-37759140652317776479351 : Rat) / 303247224425903450112) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 609 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0609 : Poly :=
[
  term ((-37759140652317776479351 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((37759140652317776479351 : Rat) / 303247224425903450112) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-37759140652317776479351 : Rat) / 151623612212951725056) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((37759140652317776479351 : Rat) / 303247224425903450112) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0609_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0609
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0610 : Poly :=
[
  term ((-3286720407658567889371 : Rat) / 101082408141967816704) [(11, 2), (16, 1)]
]

/-- Partial product 610 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0610 : Poly :=
[
  term ((-3286720407658567889371 : Rat) / 50541204070983908352) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((3286720407658567889371 : Rat) / 101082408141967816704) [(11, 2), (12, 2), (16, 1)],
  term ((-3286720407658567889371 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3286720407658567889371 : Rat) / 101082408141967816704) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0610_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0610
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0611 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 611 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0611 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0611_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0611
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0612 : Poly :=
[
  term ((-1098054255679196173 : Rat) / 429528646495613952) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0612 : Poly :=
[
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0612_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0612
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0613 : Poly :=
[
  term ((177166009798408423 : Rat) / 71588107749268992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 613 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0613 : Poly :=
[
  term ((177166009798408423 : Rat) / 35794053874634496) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-177166009798408423 : Rat) / 71588107749268992) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((177166009798408423 : Rat) / 35794053874634496) [(13, 2), (15, 2), (16, 1)],
  term ((-177166009798408423 : Rat) / 71588107749268992) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0613_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0613
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0614 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 614 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0614 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(13, 2), (15, 4), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0614_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0614
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0615 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 95450810332358656) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 615 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0615 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0615_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0615
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0616 : Poly :=
[
  term ((-919731829805977691 : Rat) / 122722470427318272) [(14, 1), (16, 1)]
]

/-- Partial product 616 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0616 : Poly :=
[
  term ((-919731829805977691 : Rat) / 61361235213659136) [(12, 1), (14, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(12, 2), (14, 1), (16, 1)],
  term ((-919731829805977691 : Rat) / 61361235213659136) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0616_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0616
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0617 : Poly :=
[
  term ((2770456079964529067 : Rat) / 214764323247806976) [(15, 2), (16, 1)]
]

/-- Partial product 617 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0617 : Poly :=
[
  term ((2770456079964529067 : Rat) / 107382161623903488) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2770456079964529067 : Rat) / 214764323247806976) [(12, 2), (15, 2), (16, 1)],
  term ((2770456079964529067 : Rat) / 107382161623903488) [(13, 1), (15, 3), (16, 1)],
  term ((-2770456079964529067 : Rat) / 214764323247806976) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0617_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0617
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYY_coefficient_30_0618 : Poly :=
[
  term ((750418244191298519 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 618 for generator 30. -/
def rs_R010_ueqv_R010NYY_partial_30_0618 : Poly :=
[
  term ((750418244191298519 : Rat) / 61361235213659136) [(12, 1), (14, 1), (16, 1)],
  term ((-750418244191298519 : Rat) / 122722470427318272) [(12, 2), (16, 1)],
  term ((750418244191298519 : Rat) / 61361235213659136) [(13, 1), (15, 1), (16, 1)],
  term ((-750418244191298519 : Rat) / 122722470427318272) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 30. -/
theorem rs_R010_ueqv_R010NYY_partial_30_0618_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_30_0618
        rs_R010_ueqv_R010NYY_generator_30_0600_0618 =
      rs_R010_ueqv_R010NYY_partial_30_0618 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_30_0600_0618 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_30_0600,
  rs_R010_ueqv_R010NYY_partial_30_0601,
  rs_R010_ueqv_R010NYY_partial_30_0602,
  rs_R010_ueqv_R010NYY_partial_30_0603,
  rs_R010_ueqv_R010NYY_partial_30_0604,
  rs_R010_ueqv_R010NYY_partial_30_0605,
  rs_R010_ueqv_R010NYY_partial_30_0606,
  rs_R010_ueqv_R010NYY_partial_30_0607,
  rs_R010_ueqv_R010NYY_partial_30_0608,
  rs_R010_ueqv_R010NYY_partial_30_0609,
  rs_R010_ueqv_R010NYY_partial_30_0610,
  rs_R010_ueqv_R010NYY_partial_30_0611,
  rs_R010_ueqv_R010NYY_partial_30_0612,
  rs_R010_ueqv_R010NYY_partial_30_0613,
  rs_R010_ueqv_R010NYY_partial_30_0614,
  rs_R010_ueqv_R010NYY_partial_30_0615,
  rs_R010_ueqv_R010NYY_partial_30_0616,
  rs_R010_ueqv_R010NYY_partial_30_0617,
  rs_R010_ueqv_R010NYY_partial_30_0618
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_30_0600_0618 : Poly :=
[
  term ((39062966002754696109829 : Rat) / 151623612212951725056) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1272164270312604729 : Rat) / 221671947679753984) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-566024211209651632211 : Rat) / 18952951526618965632) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((8241145244788289053951 : Rat) / 101082408141967816704) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9524100357413659 : Rat) / 174180310825472) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-39062966002754696109829 : Rat) / 303247224425903450112) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1272164270312604729 : Rat) / 443343895359507968) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((38663469373149138040525 : Rat) / 606494448851806900224) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8241145244788289053951 : Rat) / 202164816283935633408) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9524100357413659 : Rat) / 348360621650944) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-38663469373149138040525 : Rat) / 303247224425903450112) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8241145244788289053951 : Rat) / 101082408141967816704) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9524100357413659 : Rat) / 174180310825472) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((326201501816512473171 : Rat) / 9626896013520744448) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7080931430263193541103 : Rat) / 202164816283935633408) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2700520072451164610995 : Rat) / 9476475763309482816) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((566024211209651632211 : Rat) / 37905903053237931264) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-39062966002754696109829 : Rat) / 303247224425903450112) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1272164270312604729 : Rat) / 443343895359507968) [(11, 1), (13, 3), (16, 1)],
  term ((-395142777614787043475 : Rat) / 25270602035491954176) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37759140652317776479351 : Rat) / 151623612212951725056) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3286720407658567889371 : Rat) / 50541204070983908352) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((395142777614787043475 : Rat) / 50541204070983908352) [(11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((37759140652317776479351 : Rat) / 303247224425903450112) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((3286720407658567889371 : Rat) / 101082408141967816704) [(11, 2), (12, 2), (16, 1)],
  term ((128095535642545618121 : Rat) / 7220172010140558336) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3286720407658567889371 : Rat) / 50541204070983908352) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37759140652317776479351 : Rat) / 151623612212951725056) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((70245268919840672953 : Rat) / 4211767005915325696) [(11, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-128095535642545618121 : Rat) / 14440344020281116672) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((33017427320940331957651 : Rat) / 303247224425903450112) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((3286720407658567889371 : Rat) / 101082408141967816704) [(11, 2), (13, 2), (16, 1)],
  term ((-70245268919840672953 : Rat) / 8423534011830651392) [(11, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((395142777614787043475 : Rat) / 50541204070983908352) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (12, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((177166009798408423 : Rat) / 35794053874634496) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1098054255679196173 : Rat) / 214764323247806976) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2770456079964529067 : Rat) / 107382161623903488) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((750418244191298519 : Rat) / 61361235213659136) [(12, 1), (14, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-919731829805977691 : Rat) / 61361235213659136) [(12, 1), (14, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-177166009798408423 : Rat) / 71588107749268992) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1353319841726368049 : Rat) / 95450810332358656) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(12, 2), (14, 1), (16, 1)],
  term ((-2770456079964529067 : Rat) / 214764323247806976) [(12, 2), (15, 2), (16, 1)],
  term ((-750418244191298519 : Rat) / 122722470427318272) [(12, 2), (16, 1)],
  term ((-919731829805977691 : Rat) / 61361235213659136) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((750418244191298519 : Rat) / 61361235213659136) [(13, 1), (15, 1), (16, 1)],
  term ((2770456079964529067 : Rat) / 107382161623903488) [(13, 1), (15, 3), (16, 1)],
  term ((1112523078974361107 : Rat) / 122722470427318272) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((919731829805977691 : Rat) / 122722470427318272) [(13, 2), (14, 1), (16, 1)],
  term ((-1707460021174078529 : Rat) / 214764323247806976) [(13, 2), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(13, 2), (15, 4), (16, 1)],
  term ((-750418244191298519 : Rat) / 122722470427318272) [(13, 2), (16, 1)],
  term ((1098054255679196173 : Rat) / 429528646495613952) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-177166009798408423 : Rat) / 71588107749268992) [(13, 3), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 600 through 618. -/
theorem rs_R010_ueqv_R010NYY_block_30_0600_0618_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_30_0600_0618
      rs_R010_ueqv_R010NYY_block_30_0600_0618 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
