/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:600-699

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0600_0699 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 600 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0600 : Poly :=
[
  term ((-106436421497267651592055 : Rat) / 51069903625926712422) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 600 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0600 : Poly :=
[
  term ((-106436421497267651592055 : Rat) / 25534951812963356211) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((106436421497267651592055 : Rat) / 51069903625926712422) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0600_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0600
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0601 : Poly :=
[
  term ((1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 601 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0601 : Poly :=
[
  term ((2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0601_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0601
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0602 : Poly :=
[
  term ((2466592977154333392065 : Rat) / 2646479599662868851) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 602 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0602 : Poly :=
[
  term ((4933185954308666784130 : Rat) / 2646479599662868851) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-2466592977154333392065 : Rat) / 2646479599662868851) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0602_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0602
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0603 : Poly :=
[
  term ((68899403296742124320773 : Rat) / 629862144719762786538) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 603 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0603 : Poly :=
[
  term ((68899403296742124320773 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-68899403296742124320773 : Rat) / 629862144719762786538) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0603_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0603
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0604 : Poly :=
[
  term ((-120118887365840363075275 : Rat) / 629862144719762786538) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 604 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0604 : Poly :=
[
  term ((-120118887365840363075275 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((120118887365840363075275 : Rat) / 629862144719762786538) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0604_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0604
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0605 : Poly :=
[
  term ((35609718811881339351468 : Rat) / 104977024119960464423) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 605 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0605 : Poly :=
[
  term ((71219437623762678702936 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35609718811881339351468 : Rat) / 104977024119960464423) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0605_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0605
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0606 : Poly :=
[
  term ((9078347149419780519099 : Rat) / 419908096479841857692) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 606 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0606 : Poly :=
[
  term ((9078347149419780519099 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-9078347149419780519099 : Rat) / 419908096479841857692) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0606_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0606
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0607 : Poly :=
[
  term ((-34010450733643947758025 : Rat) / 209954048239920928846) [(4, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 607 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0607 : Poly :=
[
  term ((-34010450733643947758025 : Rat) / 104977024119960464423) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((34010450733643947758025 : Rat) / 209954048239920928846) [(4, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0607_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0607
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0608 : Poly :=
[
  term ((44681062481013498721145 : Rat) / 222304286371680983484) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 608 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0608 : Poly :=
[
  term ((44681062481013498721145 : Rat) / 111152143185840491742) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44681062481013498721145 : Rat) / 222304286371680983484) [(4, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0608_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0608
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0609 : Poly :=
[
  term ((20406270440186368654815 : Rat) / 209954048239920928846) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 609 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0609 : Poly :=
[
  term ((20406270440186368654815 : Rat) / 104977024119960464423) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 209954048239920928846) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0609_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0609
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0610 : Poly :=
[
  term ((-8936212496202699744229 : Rat) / 74101428790560327828) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 610 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0610 : Poly :=
[
  term ((-8936212496202699744229 : Rat) / 37050714395280163914) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((8936212496202699744229 : Rat) / 74101428790560327828) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0610_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0610
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0611 : Poly :=
[
  term ((-62907422475319200895360 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 611 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0611 : Poly :=
[
  term ((62907422475319200895360 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125814844950638401790720 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0611_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0611
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0612 : Poly :=
[
  term ((89781390509020603035586 : Rat) / 134970459582806311401) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 612 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0612 : Poly :=
[
  term ((-89781390509020603035586 : Rat) / 134970459582806311401) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((179562781018041206071172 : Rat) / 134970459582806311401) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0612_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0612
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0613 : Poly :=
[
  term ((19068984128172067069255 : Rat) / 1889586434159288359614) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 613 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0613 : Poly :=
[
  term ((-19068984128172067069255 : Rat) / 1889586434159288359614) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((19068984128172067069255 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0613_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0613
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0614 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 614 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0614 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0614_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0614
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0615 : Poly :=
[
  term ((-55744770889571553454495 : Rat) / 134970459582806311401) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0615 : Poly :=
[
  term ((55744770889571553454495 : Rat) / 134970459582806311401) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-111489541779143106908990 : Rat) / 134970459582806311401) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0615_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0615
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0616 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (16, 1)]
]

/-- Partial product 616 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0616 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0616_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0616
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0617 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 617 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0617 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0617_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0617
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0618 : Poly :=
[
  term ((-3813796825634413413851 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 618 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0618 : Poly :=
[
  term ((3813796825634413413851 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3813796825634413413851 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0618_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0618
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0619 : Poly :=
[
  term ((-79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 619 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0619 : Poly :=
[
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0619_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0619
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0620 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 620 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0620 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0620_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0620
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0621 : Poly :=
[
  term ((375469469084347936471615 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 621 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0621 : Poly :=
[
  term ((750938938168695872943230 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-375469469084347936471615 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0621_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0621
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0622 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 622 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0622 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0622_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0622
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0623 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 623 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0623 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0623_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0623
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0624 : Poly :=
[
  term ((-74504136731163469785929 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 624 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0624 : Poly :=
[
  term ((-149008273462326939571858 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((74504136731163469785929 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0624_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0624
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0625 : Poly :=
[
  term ((-444274462416728312450915 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 625 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0625 : Poly :=
[
  term ((-888548924833456624901830 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((444274462416728312450915 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0625_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0625
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0626 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 626 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0626 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0626_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0626
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0627 : Poly :=
[
  term ((404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 627 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0627 : Poly :=
[
  term ((809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0627_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0627
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0628 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 628 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0628 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0628_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0628
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0629 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

/-- Partial product 629 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0629 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0629_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0629
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0630 : Poly :=
[
  term ((87085621226227309965001 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 630 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0630 : Poly :=
[
  term ((174171242452454619930002 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-87085621226227309965001 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0630_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0630
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0631 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 631 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0631 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0631_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0631
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0632 : Poly :=
[
  term ((-79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 632 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0632 : Poly :=
[
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0632_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0632
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0633 : Poly :=
[
  term ((52257067674313277706190 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 633 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0633 : Poly :=
[
  term ((104514135348626555412380 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-52257067674313277706190 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0633_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0633
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0634 : Poly :=
[
  term ((-10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0634 : Poly :=
[
  term ((-20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0634_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0634
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0635 : Poly :=
[
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 635 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0635 : Poly :=
[
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0635_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0635
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0636 : Poly :=
[
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 636 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0636 : Poly :=
[
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0636_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0636
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0637 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 637 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0637 : Poly :=
[
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0637_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0637
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0638 : Poly :=
[
  term ((325490914330929185298595 : Rat) / 629862144719762786538) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 638 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0638 : Poly :=
[
  term ((325490914330929185298595 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-325490914330929185298595 : Rat) / 629862144719762786538) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0638_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0638
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0639 : Poly :=
[
  term ((-417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 639 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0639 : Poly :=
[
  term ((-835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0639_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0639
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0640 : Poly :=
[
  term ((-13488246471920242072395 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 640 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0640 : Poly :=
[
  term ((-13488246471920242072395 : Rat) / 12350238131760054638) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((13488246471920242072395 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0640_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0640
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0641 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 641 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0641 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0641_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0641
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0642 : Poly :=
[
  term ((-65098182866185837059719 : Rat) / 209954048239920928846) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 642 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0642 : Poly :=
[
  term ((-65098182866185837059719 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((65098182866185837059719 : Rat) / 209954048239920928846) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0642_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0642
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0643 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 643 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0643 : Poly :=
[
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0643_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0643
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0644 : Poly :=
[
  term ((8092947883152145243437 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 644 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0644 : Poly :=
[
  term ((8092947883152145243437 : Rat) / 12350238131760054638) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8092947883152145243437 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0644_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0644
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0645 : Poly :=
[
  term ((83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 645 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0645 : Poly :=
[
  term ((166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0645_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0645
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0646 : Poly :=
[
  term ((-12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 646 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0646 : Poly :=
[
  term ((-24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0646_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0646
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0647 : Poly :=
[
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 647 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0647 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0647_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0647
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0648 : Poly :=
[
  term ((-118219425410976971746355 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 648 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0648 : Poly :=
[
  term ((-236438850821953943492710 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((118219425410976971746355 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0648_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0648
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0649 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 649 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0649 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0649_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0649
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0650 : Poly :=
[
  term ((-24765435236162753298715 : Rat) / 629862144719762786538) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 650 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0650 : Poly :=
[
  term ((-24765435236162753298715 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((24765435236162753298715 : Rat) / 629862144719762786538) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0650_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0650
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0651 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 651 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0651 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0651_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0651
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0652 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 652 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0652 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0652_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0652
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0653 : Poly :=
[
  term ((-732457742544746441311742 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 653 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0653 : Poly :=
[
  term ((-1464915485089492882623484 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((732457742544746441311742 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0653_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0653
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0654 : Poly :=
[
  term ((1528171369642193831607295 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 654 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0654 : Poly :=
[
  term ((1528171369642193831607295 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1528171369642193831607295 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0654_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0654
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0655 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 655 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0655 : Poly :=
[
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0655_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0655
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0656 : Poly :=
[
  term ((-129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 656 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0656 : Poly :=
[
  term ((-129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0656_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0656
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0657 : Poly :=
[
  term ((-417045501863586512038879 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 657 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0657 : Poly :=
[
  term ((-834091003727173024077758 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((417045501863586512038879 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0657_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0657
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0658 : Poly :=
[
  term ((-825801423161268605342705 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 658 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0658 : Poly :=
[
  term ((-825801423161268605342705 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((825801423161268605342705 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0658_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0658
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0659 : Poly :=
[
  term ((26371204901566586629990 : Rat) / 19281494226115187343) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0659 : Poly :=
[
  term ((52742409803133173259980 : Rat) / 19281494226115187343) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26371204901566586629990 : Rat) / 19281494226115187343) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0659_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0659
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0660 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 660 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0660 : Poly :=
[
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0660_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0660
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0661 : Poly :=
[
  term ((-25134446804369601244765 : Rat) / 89980306388537540934) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0661 : Poly :=
[
  term ((-25134446804369601244765 : Rat) / 44990153194268770467) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((25134446804369601244765 : Rat) / 89980306388537540934) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0661_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0661
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0662 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

/-- Partial product 662 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0662 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0662_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0662
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0663 : Poly :=
[
  term ((2457321190442156284975 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)]
]

/-- Partial product 663 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0663 : Poly :=
[
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0663_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0663
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0664 : Poly :=
[
  term ((23643885082195394349271 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0664 : Poly :=
[
  term ((47287770164390788698542 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23643885082195394349271 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0664_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0664
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0665 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 665 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0665 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0665_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0665
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0666 : Poly :=
[
  term ((4953087047232550659743 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 666 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0666 : Poly :=
[
  term ((4953087047232550659743 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4953087047232550659743 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0666_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0666
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0667 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 667 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0667 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0667_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0667
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0668 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0668 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0668_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0668
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0669 : Poly :=
[
  term ((-305634273928438766321459 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 669 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0669 : Poly :=
[
  term ((-305634273928438766321459 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((305634273928438766321459 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0669_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0669
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0670 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 670 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0670 : Poly :=
[
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0670_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0670
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0671 : Poly :=
[
  term ((25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0671 : Poly :=
[
  term ((25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0671_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0671
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0672 : Poly :=
[
  term ((165160284632253721068541 : Rat) / 629862144719762786538) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 672 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0672 : Poly :=
[
  term ((165160284632253721068541 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-165160284632253721068541 : Rat) / 629862144719762786538) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0672_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0672
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0673 : Poly :=
[
  term ((229803152441022329447323 : Rat) / 629862144719762786538) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 673 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0673 : Poly :=
[
  term ((229803152441022329447323 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-229803152441022329447323 : Rat) / 629862144719762786538) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0673_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0673
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0674 : Poly :=
[
  term (-2 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 674 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0674 : Poly :=
[
  term (2 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0674_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0674
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0675 : Poly :=
[
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 675 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0675 : Poly :=
[
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0675_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0675
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0676 : Poly :=
[
  term ((2 : Rat) / 3) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 676 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0676 : Poly :=
[
  term ((-2 : Rat) / 3) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0676_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0676
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0677 : Poly :=
[
  term ((4 : Rat) / 3) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0677 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0677_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0677
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0678 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 678 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0678 : Poly :=
[
  term ((4 : Rat) / 3) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0678_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0678
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0679 : Poly :=
[
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 679 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0679 : Poly :=
[
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0679_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0679
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0680 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 680 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0680 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0680_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0680
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0681 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)]
]

/-- Partial product 681 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0681 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0681_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0681
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0682 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)]
]

/-- Partial product 682 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0682 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (10, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0682_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0682
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0683 : Poly :=
[
  term ((-429313145058326121800948 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 683 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0683 : Poly :=
[
  term ((429313145058326121800948 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-858626290116652243601896 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0683_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0683
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0684 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 684 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0684 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0684_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0684
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0685 : Poly :=
[
  term ((-276476440360287565469662 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 685 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0685 : Poly :=
[
  term ((276476440360287565469662 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-552952880720575130939324 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0685_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0685
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0686 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 686 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0686 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0686_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0686
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0687 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 687 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0687 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0687_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0687
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0688 : Poly :=
[
  term ((531838990428599926133120 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 688 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0688 : Poly :=
[
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0688_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0688
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0689 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 689 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0689 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0689_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0689
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0690 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 690 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0690 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0690_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0690
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0691 : Poly :=
[
  term ((-8525390779374478042042 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 691 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0691 : Poly :=
[
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0691_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0691
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0692 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 692 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0692 : Poly :=
[
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-561140382362965659392 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0692_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0692
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0693 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 693 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0693 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0693_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0693
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0694 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 694 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0694 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0694_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0694
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0695 : Poly :=
[
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 695 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0695 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((561140382362965659392 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0695_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0695
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0696 : Poly :=
[
  term ((-176164902546993434032828 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 696 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0696 : Poly :=
[
  term ((176164902546993434032828 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-352329805093986868065656 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0696_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0696
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0697 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 697 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0697 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0697_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0697
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0698 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 698 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0698 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0698_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0698
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0699 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 699 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0699 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0699_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0699
        rs_R007_ueqv_R007NY_generator_16_0600_0699 =
      rs_R007_ueqv_R007NY_partial_16_0699 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0600_0699 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0600,
  rs_R007_ueqv_R007NY_partial_16_0601,
  rs_R007_ueqv_R007NY_partial_16_0602,
  rs_R007_ueqv_R007NY_partial_16_0603,
  rs_R007_ueqv_R007NY_partial_16_0604,
  rs_R007_ueqv_R007NY_partial_16_0605,
  rs_R007_ueqv_R007NY_partial_16_0606,
  rs_R007_ueqv_R007NY_partial_16_0607,
  rs_R007_ueqv_R007NY_partial_16_0608,
  rs_R007_ueqv_R007NY_partial_16_0609,
  rs_R007_ueqv_R007NY_partial_16_0610,
  rs_R007_ueqv_R007NY_partial_16_0611,
  rs_R007_ueqv_R007NY_partial_16_0612,
  rs_R007_ueqv_R007NY_partial_16_0613,
  rs_R007_ueqv_R007NY_partial_16_0614,
  rs_R007_ueqv_R007NY_partial_16_0615,
  rs_R007_ueqv_R007NY_partial_16_0616,
  rs_R007_ueqv_R007NY_partial_16_0617,
  rs_R007_ueqv_R007NY_partial_16_0618,
  rs_R007_ueqv_R007NY_partial_16_0619,
  rs_R007_ueqv_R007NY_partial_16_0620,
  rs_R007_ueqv_R007NY_partial_16_0621,
  rs_R007_ueqv_R007NY_partial_16_0622,
  rs_R007_ueqv_R007NY_partial_16_0623,
  rs_R007_ueqv_R007NY_partial_16_0624,
  rs_R007_ueqv_R007NY_partial_16_0625,
  rs_R007_ueqv_R007NY_partial_16_0626,
  rs_R007_ueqv_R007NY_partial_16_0627,
  rs_R007_ueqv_R007NY_partial_16_0628,
  rs_R007_ueqv_R007NY_partial_16_0629,
  rs_R007_ueqv_R007NY_partial_16_0630,
  rs_R007_ueqv_R007NY_partial_16_0631,
  rs_R007_ueqv_R007NY_partial_16_0632,
  rs_R007_ueqv_R007NY_partial_16_0633,
  rs_R007_ueqv_R007NY_partial_16_0634,
  rs_R007_ueqv_R007NY_partial_16_0635,
  rs_R007_ueqv_R007NY_partial_16_0636,
  rs_R007_ueqv_R007NY_partial_16_0637,
  rs_R007_ueqv_R007NY_partial_16_0638,
  rs_R007_ueqv_R007NY_partial_16_0639,
  rs_R007_ueqv_R007NY_partial_16_0640,
  rs_R007_ueqv_R007NY_partial_16_0641,
  rs_R007_ueqv_R007NY_partial_16_0642,
  rs_R007_ueqv_R007NY_partial_16_0643,
  rs_R007_ueqv_R007NY_partial_16_0644,
  rs_R007_ueqv_R007NY_partial_16_0645,
  rs_R007_ueqv_R007NY_partial_16_0646,
  rs_R007_ueqv_R007NY_partial_16_0647,
  rs_R007_ueqv_R007NY_partial_16_0648,
  rs_R007_ueqv_R007NY_partial_16_0649,
  rs_R007_ueqv_R007NY_partial_16_0650,
  rs_R007_ueqv_R007NY_partial_16_0651,
  rs_R007_ueqv_R007NY_partial_16_0652,
  rs_R007_ueqv_R007NY_partial_16_0653,
  rs_R007_ueqv_R007NY_partial_16_0654,
  rs_R007_ueqv_R007NY_partial_16_0655,
  rs_R007_ueqv_R007NY_partial_16_0656,
  rs_R007_ueqv_R007NY_partial_16_0657,
  rs_R007_ueqv_R007NY_partial_16_0658,
  rs_R007_ueqv_R007NY_partial_16_0659,
  rs_R007_ueqv_R007NY_partial_16_0660,
  rs_R007_ueqv_R007NY_partial_16_0661,
  rs_R007_ueqv_R007NY_partial_16_0662,
  rs_R007_ueqv_R007NY_partial_16_0663,
  rs_R007_ueqv_R007NY_partial_16_0664,
  rs_R007_ueqv_R007NY_partial_16_0665,
  rs_R007_ueqv_R007NY_partial_16_0666,
  rs_R007_ueqv_R007NY_partial_16_0667,
  rs_R007_ueqv_R007NY_partial_16_0668,
  rs_R007_ueqv_R007NY_partial_16_0669,
  rs_R007_ueqv_R007NY_partial_16_0670,
  rs_R007_ueqv_R007NY_partial_16_0671,
  rs_R007_ueqv_R007NY_partial_16_0672,
  rs_R007_ueqv_R007NY_partial_16_0673,
  rs_R007_ueqv_R007NY_partial_16_0674,
  rs_R007_ueqv_R007NY_partial_16_0675,
  rs_R007_ueqv_R007NY_partial_16_0676,
  rs_R007_ueqv_R007NY_partial_16_0677,
  rs_R007_ueqv_R007NY_partial_16_0678,
  rs_R007_ueqv_R007NY_partial_16_0679,
  rs_R007_ueqv_R007NY_partial_16_0680,
  rs_R007_ueqv_R007NY_partial_16_0681,
  rs_R007_ueqv_R007NY_partial_16_0682,
  rs_R007_ueqv_R007NY_partial_16_0683,
  rs_R007_ueqv_R007NY_partial_16_0684,
  rs_R007_ueqv_R007NY_partial_16_0685,
  rs_R007_ueqv_R007NY_partial_16_0686,
  rs_R007_ueqv_R007NY_partial_16_0687,
  rs_R007_ueqv_R007NY_partial_16_0688,
  rs_R007_ueqv_R007NY_partial_16_0689,
  rs_R007_ueqv_R007NY_partial_16_0690,
  rs_R007_ueqv_R007NY_partial_16_0691,
  rs_R007_ueqv_R007NY_partial_16_0692,
  rs_R007_ueqv_R007NY_partial_16_0693,
  rs_R007_ueqv_R007NY_partial_16_0694,
  rs_R007_ueqv_R007NY_partial_16_0695,
  rs_R007_ueqv_R007NY_partial_16_0696,
  rs_R007_ueqv_R007NY_partial_16_0697,
  rs_R007_ueqv_R007NY_partial_16_0698,
  rs_R007_ueqv_R007NY_partial_16_0699
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0600_0699 : Poly :=
[
  term ((-106436421497267651592055 : Rat) / 25534951812963356211) [(4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((2590904389962257072212360 : Rat) / 944793217079644179807) [(4, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((4933185954308666784130 : Rat) / 2646479599662868851) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((68899403296742124320773 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-120118887365840363075275 : Rat) / 314931072359881393269) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71219437623762678702936 : Rat) / 104977024119960464423) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((9078347149419780519099 : Rat) / 209954048239920928846) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((106436421497267651592055 : Rat) / 51069903625926712422) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1295452194981128536106180 : Rat) / 944793217079644179807) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((-2466592977154333392065 : Rat) / 2646479599662868851) [(4, 1), (11, 2), (16, 1)],
  term ((-68899403296742124320773 : Rat) / 629862144719762786538) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((120118887365840363075275 : Rat) / 629862144719762786538) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35609718811881339351468 : Rat) / 104977024119960464423) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9078347149419780519099 : Rat) / 419908096479841857692) [(4, 1), (15, 2), (16, 1)],
  term ((-34010450733643947758025 : Rat) / 104977024119960464423) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((44681062481013498721145 : Rat) / 111152143185840491742) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((20406270440186368654815 : Rat) / 104977024119960464423) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8936212496202699744229 : Rat) / 37050714395280163914) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((34010450733643947758025 : Rat) / 209954048239920928846) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-44681062481013498721145 : Rat) / 222304286371680983484) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20406270440186368654815 : Rat) / 209954048239920928846) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((8936212496202699744229 : Rat) / 74101428790560327828) [(4, 2), (15, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((750938938168695872943230 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-149008273462326939571858 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-888548924833456624901830 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((809914646739307623782630 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (11, 2), (16, 1)],
  term ((174171242452454619930002 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((104514135348626555412380 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((325490914330929185298595 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13488246471920242072395 : Rat) / 12350238131760054638) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-65098182866185837059719 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((8092947883152145243437 : Rat) / 12350238131760054638) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-236438850821953943492710 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-24765435236162753298715 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66762288695913032463244 : Rat) / 44990153194268770467) [(5, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1528171369642193831607295 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-129202062557172933572785 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-162506748587813027258540 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1670671830450709277754665 : Rat) / 1889586434159288359614) [(5, 1), (6, 1), (11, 1), (16, 1)],
  term ((2545060941306450989179420 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 134970459582806311401) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (11, 3), (14, 1), (16, 1)],
  term ((47287770164390788698542 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4953087047232550659743 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305634273928438766321459 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((25840412511434586714557 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((334134366090141855550933 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((103008448619278246433468 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-125814844950638401790720 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((179562781018041206071172 : Rat) / 134970459582806311401) [(5, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((19068984128172067069255 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-111489541779143106908990 : Rat) / 134970459582806311401) [(5, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (6, 2), (11, 3), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (14, 1), (15, 3), (16, 1)],
  term ((-3813796825634413413851 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-158444386833624819706162 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-375469469084347936471615 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((74504136731163469785929 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((444274462416728312450915 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-404957323369653811891315 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-87085621226227309965001 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((79222193416812409853081 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-52257067674313277706190 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-325490914330929185298595 : Rat) / 629862144719762786538) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((13488246471920242072395 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((65098182866185837059719 : Rat) / 209954048239920928846) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8092947883152145243437 : Rat) / 24700476263520109276) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((118219425410976971746355 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((24765435236162753298715 : Rat) / 629862144719762786538) [(5, 1), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((732457742544746441311742 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1528171369642193831607295 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((129202062557172933572785 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((417045501863586512038879 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((825801423161268605342705 : Rat) / 1889586434159288359614) [(5, 1), (11, 1), (16, 1)],
  term ((-26371204901566586629990 : Rat) / 19281494226115187343) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((25134446804369601244765 : Rat) / 89980306388537540934) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-2457321190442156284975 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (16, 1)],
  term ((-23643885082195394349271 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4953087047232550659743 : Rat) / 209954048239920928846) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((305634273928438766321459 : Rat) / 629862144719762786538) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25840412511434586714557 : Rat) / 629862144719762786538) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-165160284632253721068541 : Rat) / 629862144719762786538) [(5, 1), (15, 1), (16, 1)],
  term ((-229803152441022329447323 : Rat) / 629862144719762786538) [(5, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((429313145058326121800948 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((276476440360287565469662 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((8525390779374478042042 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((176164902546993434032828 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term (-4 : Rat) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-858626290116652243601896 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-552952880720575130939324 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17050781558748956084084 : Rat) / 314931072359881393269) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-561140382362965659392 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((561140382362965659392 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-352329805093986868065656 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 600 through 699. -/
theorem rs_R007_ueqv_R007NY_block_16_0600_0699_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0600_0699
      rs_R007_ueqv_R007NY_block_16_0600_0699 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
