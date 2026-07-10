/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 5:800-899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_05_0800_0899 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 800 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0800 : Poly :=
[
  term ((3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 800 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0800 : Poly :=
[
  term ((-6078442204923599744 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((6078442204923599744 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0800_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0800
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0801 : Poly :=
[
  term ((8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 801 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0801 : Poly :=
[
  term ((-17600495691394580480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((17600495691394580480 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0801_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0801
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0801 := by
  native_decide

/-- Coefficient term 802 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0802 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 802 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0802 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 802 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0802_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0802
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0802 := by
  native_decide

/-- Coefficient term 803 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0803 : Poly :=
[
  term ((-17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 803 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0803 : Poly :=
[
  term ((34431553249633662848 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34431553249633662848 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 803 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0803_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0803
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0803 := by
  native_decide

/-- Coefficient term 804 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0804 : Poly :=
[
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 804 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0804 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 804 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0804_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0804
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0804 := by
  native_decide

/-- Coefficient term 805 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0805 : Poly :=
[
  term ((1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 805 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0805 : Poly :=
[
  term ((-2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 805 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0805_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0805
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0805 := by
  native_decide

/-- Coefficient term 806 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0806 : Poly :=
[
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 806 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0806 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 806 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0806_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0806
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0806 := by
  native_decide

/-- Coefficient term 807 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0807 : Poly :=
[
  term ((42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 807 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0807 : Poly :=
[
  term ((-85748108566614828224 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((85748108566614828224 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 807 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0807_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0807
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0807 := by
  native_decide

/-- Coefficient term 808 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0808 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 808 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0808 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (6, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 808 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0808_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0808
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0808 := by
  native_decide

/-- Coefficient term 809 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0809 : Poly :=
[
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 809 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0809 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 809 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0809_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0809
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0809 := by
  native_decide

/-- Coefficient term 810 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0810 : Poly :=
[
  term ((950536156124751104 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 810 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0810 : Poly :=
[
  term ((-1901072312249502208 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((950536156124751104 : Rat) / 29943480525392195) [(5, 2), (6, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((950536156124751104 : Rat) / 29943480525392195) [(5, 2), (7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-950536156124751104 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((1901072312249502208 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-950536156124751104 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 810 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0810_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0810
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0810 := by
  native_decide

/-- Coefficient term 811 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0811 : Poly :=
[
  term ((25499691510809600 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 811 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0811 : Poly :=
[
  term ((-50999383021619200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((25499691510809600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((25499691510809600 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((50999383021619200 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-25499691510809600 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-25499691510809600 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 811 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0811_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0811
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0811 := by
  native_decide

/-- Coefficient term 812 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0812 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 812 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0812 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 812 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0812_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0812
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0812 := by
  native_decide

/-- Coefficient term 813 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0813 : Poly :=
[
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 813 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0813 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 813 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0813_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0813
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0813 := by
  native_decide

/-- Coefficient term 814 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0814 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 814 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0814 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 814 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0814_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0814
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0814 := by
  native_decide

/-- Coefficient term 815 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0815 : Poly :=
[
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 815 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0815 : Poly :=
[
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((203610247244591632456 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 815 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0815_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0815
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0815 := by
  native_decide

/-- Coefficient term 816 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0816 : Poly :=
[
  term ((141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 816 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0816 : Poly :=
[
  term ((-283472117351742674392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((283472117351742674392 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((-141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 816 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0816_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0816
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0816 := by
  native_decide

/-- Coefficient term 817 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0817 : Poly :=
[
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 817 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0817 : Poly :=
[
  term ((26714448232729600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 817 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0817_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0817
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0817 := by
  native_decide

/-- Coefficient term 818 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0818 : Poly :=
[
  term ((-25482555927123968 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 818 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0818 : Poly :=
[
  term ((50965111854247936 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-25482555927123968 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-25482555927123968 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-50965111854247936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((25482555927123968 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((25482555927123968 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 818 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0818_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0818
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0818 := by
  native_decide

/-- Coefficient term 819 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0819 : Poly :=
[
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 819 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0819 : Poly :=
[
  term ((261021856840832384 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-261021856840832384 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 819 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0819_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0819
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0819 := by
  native_decide

/-- Coefficient term 820 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0820 : Poly :=
[
  term ((-530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 820 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0820 : Poly :=
[
  term ((1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 820 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0820_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0820
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0820 := by
  native_decide

/-- Coefficient term 821 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0821 : Poly :=
[
  term ((65255464210208096 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 821 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0821 : Poly :=
[
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((65255464210208096 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((65255464210208096 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65255464210208096 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65255464210208096 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 821 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0821_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0821
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0821 := by
  native_decide

/-- Coefficient term 822 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0822 : Poly :=
[
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 822 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0822 : Poly :=
[
  term ((14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 822 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0822_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0822
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0822 := by
  native_decide

/-- Coefficient term 823 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0823 : Poly :=
[
  term ((-2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 823 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0823 : Poly :=
[
  term ((4874376886636166528 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4874376886636166528 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 823 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0823_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0823
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0823 := by
  native_decide

/-- Coefficient term 824 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0824 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 824 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0824 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 824 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0824_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0824
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0824 := by
  native_decide

/-- Coefficient term 825 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0825 : Poly :=
[
  term ((-375293460128204096 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 825 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0825 : Poly :=
[
  term ((750586920256408192 : Rat) / 5901269884566345) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-375293460128204096 : Rat) / 5901269884566345) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-375293460128204096 : Rat) / 5901269884566345) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-750586920256408192 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((375293460128204096 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((375293460128204096 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 825 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0825_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0825
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0825 := by
  native_decide

/-- Coefficient term 826 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0826 : Poly :=
[
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 826 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0826 : Poly :=
[
  term ((-4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 826 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0826_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0826
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0826 := by
  native_decide

/-- Coefficient term 827 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0827 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 827 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0827 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 827 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0827_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0827
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0827 := by
  native_decide

/-- Coefficient term 828 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0828 : Poly :=
[
  term ((15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 828 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0828 : Poly :=
[
  term ((-30495661694170859696 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((30495661694170859696 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 828 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0828_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0828
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0828 := by
  native_decide

/-- Coefficient term 829 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0829 : Poly :=
[
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 829 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0829 : Poly :=
[
  term ((-100669242223361146336 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((100669242223361146336 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 829 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0829_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0829
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0829 := by
  native_decide

/-- Coefficient term 830 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0830 : Poly :=
[
  term ((29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 830 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0830 : Poly :=
[
  term ((-59669583821656835936 : Rat) / 449152207880882925) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((59669583821656835936 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 830 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0830_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0830
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0830 := by
  native_decide

/-- Coefficient term 831 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0831 : Poly :=
[
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 831 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0831 : Poly :=
[
  term ((-4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 831 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0831_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0831
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0831 := by
  native_decide

/-- Coefficient term 832 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0832 : Poly :=
[
  term ((-9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 832 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0832 : Poly :=
[
  term ((19176118216531757904 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19176118216531757904 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 832 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0832_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0832
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0832 := by
  native_decide

/-- Coefficient term 833 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0833 : Poly :=
[
  term ((1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 833 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0833 : Poly :=
[
  term ((-2562792743764314223832 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((2562792743764314223832 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 833 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0833_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0833
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0833 := by
  native_decide

/-- Coefficient term 834 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0834 : Poly :=
[
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 834 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0834 : Poly :=
[
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 834 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0834_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0834
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0834 := by
  native_decide

/-- Coefficient term 835 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0835 : Poly :=
[
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 835 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0835 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 835 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0835_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0835
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0835 := by
  native_decide

/-- Coefficient term 836 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0836 : Poly :=
[
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 836 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0836 : Poly :=
[
  term ((6602966398784643200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6602966398784643200 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 836 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0836_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0836
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0836 := by
  native_decide

/-- Coefficient term 837 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0837 : Poly :=
[
  term ((73235167112038400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 837 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0837 : Poly :=
[
  term ((-146470334224076800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((73235167112038400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((73235167112038400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-73235167112038400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-73235167112038400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 837 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0837_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0837
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0837 := by
  native_decide

/-- Coefficient term 838 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0838 : Poly :=
[
  term ((-118930458309376000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 838 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0838 : Poly :=
[
  term ((237860916618752000 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 838 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0838_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0838
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0838 := by
  native_decide

/-- Coefficient term 839 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0839 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 839 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0839 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 839 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0839_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0839
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0839 := by
  native_decide

/-- Coefficient term 840 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0840 : Poly :=
[
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 840 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0840 : Poly :=
[
  term ((-12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 840 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0840_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0840
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0840 := by
  native_decide

/-- Coefficient term 841 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0841 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 841 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0841 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 841 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0841_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0841
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0841 := by
  native_decide

/-- Coefficient term 842 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0842 : Poly :=
[
  term ((-764427438846202880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 842 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0842 : Poly :=
[
  term ((1528854877692405760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-764427438846202880 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-764427438846202880 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1528854877692405760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((764427438846202880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((764427438846202880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 842 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0842_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0842
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0842 := by
  native_decide

/-- Coefficient term 843 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0843 : Poly :=
[
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 843 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0843 : Poly :=
[
  term ((-664569498969241600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 2), (16, 1)],
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((664569498969241600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 843 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0843_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0843
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0843 := by
  native_decide

/-- Coefficient term 844 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0844 : Poly :=
[
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 844 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0844 : Poly :=
[
  term ((7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 844 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0844_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0844
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0844 := by
  native_decide

/-- Coefficient term 845 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0845 : Poly :=
[
  term ((-3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 845 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0845 : Poly :=
[
  term ((7825796445209372032 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((-3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7825796445209372032 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 845 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0845_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0845
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0845 := by
  native_decide

/-- Coefficient term 846 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0846 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 846 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0846 : Poly :=
[
  term ((-4750053127536640 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 2), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 2), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 846 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0846_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0846
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0846 := by
  native_decide

/-- Coefficient term 847 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0847 : Poly :=
[
  term ((-145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 847 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0847 : Poly :=
[
  term ((290789849806858752112 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-290789849806858752112 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 847 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0847_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0847
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0847 := by
  native_decide

/-- Coefficient term 848 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0848 : Poly :=
[
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 848 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0848 : Poly :=
[
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 848 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0848_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0848
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0848 := by
  native_decide

/-- Coefficient term 849 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0849 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 849 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0849 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 849 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0849_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0849
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0849 := by
  native_decide

/-- Coefficient term 850 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0850 : Poly :=
[
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 850 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0850 : Poly :=
[
  term ((-198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (11, 1), (16, 1)],
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (11, 1), (16, 1)],
  term ((198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 850 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0850_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0850
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0850 := by
  native_decide

/-- Coefficient term 851 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0851 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 851 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0851 : Poly :=
[
  term ((136292076269537487872 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 851 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0851_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0851
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0851 := by
  native_decide

/-- Coefficient term 852 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0852 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 852 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0852 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 852 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0852_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0852
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0852 := by
  native_decide

/-- Coefficient term 853 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0853 : Poly :=
[
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 853 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0853 : Poly :=
[
  term ((-95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (13, 1), (16, 1)],
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (13, 1), (16, 1)],
  term ((95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((-47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 853 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0853_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0853
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0853 := by
  native_decide

/-- Coefficient term 854 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0854 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 854 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0854 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 3), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 854 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0854_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0854
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0854 := by
  native_decide

/-- Coefficient term 855 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0855 : Poly :=
[
  term ((13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 855 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0855 : Poly :=
[
  term ((-27939120647563776512 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((27939120647563776512 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 855 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0855_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0855
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0855 := by
  native_decide

/-- Coefficient term 856 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0856 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 856 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0856 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 856 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0856_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0856
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0856 := by
  native_decide

/-- Coefficient term 857 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0857 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)]
]

/-- Partial product 857 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0857 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 4), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 4), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 857 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0857_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0857
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0857 := by
  native_decide

/-- Coefficient term 858 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0858 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 858 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0858 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 858 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0858_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0858
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0858 := by
  native_decide

/-- Coefficient term 859 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0859 : Poly :=
[
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 859 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0859 : Poly :=
[
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 859 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0859_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0859
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0859 := by
  native_decide

/-- Coefficient term 860 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0860 : Poly :=
[
  term ((-25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 860 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0860 : Poly :=
[
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((-25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((-25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 860 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0860_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0860
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0860 := by
  native_decide

/-- Coefficient term 861 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0861 : Poly :=
[
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 861 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0861 : Poly :=
[
  term ((169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 861 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0861_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0861
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0861 := by
  native_decide

/-- Coefficient term 862 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0862 : Poly :=
[
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 862 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0862 : Poly :=
[
  term ((36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 862 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0862_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0862
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0862 := by
  native_decide

/-- Coefficient term 863 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0863 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (16, 1)]
]

/-- Partial product 863 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0863 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (6, 2), (11, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 2), (11, 2), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 863 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0863_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0863
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0863 := by
  native_decide

/-- Coefficient term 864 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0864 : Poly :=
[
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 864 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0864 : Poly :=
[
  term ((3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 864 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0864_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0864
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0864 := by
  native_decide

/-- Coefficient term 865 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0865 : Poly :=
[
  term ((-26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 865 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0865 : Poly :=
[
  term ((52519833143095844168 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((-26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-52519833143095844168 : Rat) / 449152207880882925) [(5, 2), (14, 2), (16, 1)],
  term ((26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 865 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0865_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0865
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0865 := by
  native_decide

/-- Coefficient term 866 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0866 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 866 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0866 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (15, 2), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 866 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0866_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0866
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0866 := by
  native_decide

/-- Coefficient term 867 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0867 : Poly :=
[
  term ((3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (16, 1)]
]

/-- Partial product 867 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0867 : Poly :=
[
  term ((-6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (6, 1), (16, 1)],
  term ((3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (6, 2), (16, 1)],
  term ((3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (7, 2), (16, 1)],
  term ((6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (14, 1), (16, 1)],
  term ((-3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (14, 2), (16, 1)],
  term ((-3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 867 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0867_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0867
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0867 := by
  native_decide

/-- Coefficient term 868 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0868 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 868 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0868 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 868 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0868_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0868
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0868 := by
  native_decide

/-- Coefficient term 869 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0869 : Poly :=
[
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 869 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0869 : Poly :=
[
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 869 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0869_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0869
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0869 := by
  native_decide

/-- Coefficient term 870 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0870 : Poly :=
[
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 870 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0870 : Poly :=
[
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 3), (16, 1)],
  term ((-18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 870 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0870_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0870
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0870 := by
  native_decide

/-- Coefficient term 871 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0871 : Poly :=
[
  term ((-21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 871 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0871 : Poly :=
[
  term ((-21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-43083160598042816768 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((43083160598042816768 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 871 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0871_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0871
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0871 := by
  native_decide

/-- Coefficient term 872 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0872 : Poly :=
[
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 872 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0872 : Poly :=
[
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 872 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0872_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0872
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0872 := by
  native_decide

/-- Coefficient term 873 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0873 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 873 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0873 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (6, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 3), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 873 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0873_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0873
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0873 := by
  native_decide

/-- Coefficient term 874 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0874 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 874 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0874 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 874 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0874_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0874
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0874 := by
  native_decide

/-- Coefficient term 875 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0875 : Poly :=
[
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 875 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0875 : Poly :=
[
  term ((-18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 875 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0875_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0875
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0875 := by
  native_decide

/-- Coefficient term 876 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0876 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 876 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0876 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (6, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 876 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0876_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0876
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0876 := by
  native_decide

/-- Coefficient term 877 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0877 : Poly :=
[
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 877 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0877 : Poly :=
[
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 877 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0877_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0877
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0877 := by
  native_decide

/-- Coefficient term 878 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0878 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 878 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0878 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 878 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0878_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0878
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0878 := by
  native_decide

/-- Coefficient term 879 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0879 : Poly :=
[
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 879 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0879 : Poly :=
[
  term ((-2093483068203983104 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2093483068203983104 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 879 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0879_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0879
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0879 := by
  native_decide

/-- Coefficient term 880 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0880 : Poly :=
[
  term ((-449515476594436736 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 880 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0880 : Poly :=
[
  term ((899030953188873472 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-449515476594436736 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-449515476594436736 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-899030953188873472 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((449515476594436736 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((449515476594436736 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 880 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0880_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0880
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0880 := by
  native_decide

/-- Coefficient term 881 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0881 : Poly :=
[
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 881 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0881 : Poly :=
[
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 881 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0881_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0881
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0881 := by
  native_decide

/-- Coefficient term 882 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0882 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 882 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0882 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 882 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0882_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0882
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0882 := by
  native_decide

/-- Coefficient term 883 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0883 : Poly :=
[
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 883 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0883 : Poly :=
[
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 883 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0883_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0883
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0883 := by
  native_decide

/-- Coefficient term 884 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0884 : Poly :=
[
  term ((2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 884 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0884 : Poly :=
[
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 884 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0884_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0884
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0884 := by
  native_decide

/-- Coefficient term 885 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0885 : Poly :=
[
  term ((-3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 885 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0885 : Poly :=
[
  term ((6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 885 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0885_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0885
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0885 := by
  native_decide

/-- Coefficient term 886 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0886 : Poly :=
[
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 886 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0886 : Poly :=
[
  term ((6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 886 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0886_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0886
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0886 := by
  native_decide

/-- Coefficient term 887 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0887 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 887 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0887 : Poly :=
[
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 887 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0887_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0887
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0887 := by
  native_decide

/-- Coefficient term 888 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0888 : Poly :=
[
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 888 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0888 : Poly :=
[
  term ((425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 888 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0888_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0888
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0888 := by
  native_decide

/-- Coefficient term 889 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0889 : Poly :=
[
  term ((-1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 889 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0889 : Poly :=
[
  term ((2878543555556193536 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2878543555556193536 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 889 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0889_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0889
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0889 := by
  native_decide

/-- Coefficient term 890 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0890 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 890 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0890 : Poly :=
[
  term ((9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 890 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0890_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0890
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0890 := by
  native_decide

/-- Coefficient term 891 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0891 : Poly :=
[
  term ((18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 891 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0891 : Poly :=
[
  term ((-36683178455635998152 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((36683178455635998152 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 891 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0891_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0891
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0891 := by
  native_decide

/-- Coefficient term 892 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0892 : Poly :=
[
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 892 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0892 : Poly :=
[
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 892 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0892_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0892
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0892 := by
  native_decide

/-- Coefficient term 893 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0893 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 893 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0893 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 893 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0893_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0893
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0893 := by
  native_decide

/-- Coefficient term 894 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0894 : Poly :=
[
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 894 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0894 : Poly :=
[
  term ((11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 894 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0894_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0894
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0894 := by
  native_decide

/-- Coefficient term 895 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0895 : Poly :=
[
  term ((2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 895 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0895 : Poly :=
[
  term ((-4706269007836633600 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 895 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0895_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0895
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0895 := by
  native_decide

/-- Coefficient term 896 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0896 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 896 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0896 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 896 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0896_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0896
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0896 := by
  native_decide

/-- Coefficient term 897 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0897 : Poly :=
[
  term ((-6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 897 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0897 : Poly :=
[
  term ((13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 897 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0897_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0897
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0897 := by
  native_decide

/-- Coefficient term 898 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0898 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 898 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0898 : Poly :=
[
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 898 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0898_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0898
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0898 := by
  native_decide

/-- Coefficient term 899 from coefficient polynomial 5. -/
def rs_R010_ueqv_R010YNN_coefficient_05_0899 : Poly :=
[
  term ((49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 899 for generator 5. -/
def rs_R010_ueqv_R010YNN_partial_05_0899 : Poly :=
[
  term ((-99950510261895025408 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((99950510261895025408 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 899 for generator 5. -/
theorem rs_R010_ueqv_R010YNN_partial_05_0899_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_05_0899
        rs_R010_ueqv_R010YNN_generator_05_0800_0899 =
      rs_R010_ueqv_R010YNN_partial_05_0899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_05_0800_0899 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_05_0800,
  rs_R010_ueqv_R010YNN_partial_05_0801,
  rs_R010_ueqv_R010YNN_partial_05_0802,
  rs_R010_ueqv_R010YNN_partial_05_0803,
  rs_R010_ueqv_R010YNN_partial_05_0804,
  rs_R010_ueqv_R010YNN_partial_05_0805,
  rs_R010_ueqv_R010YNN_partial_05_0806,
  rs_R010_ueqv_R010YNN_partial_05_0807,
  rs_R010_ueqv_R010YNN_partial_05_0808,
  rs_R010_ueqv_R010YNN_partial_05_0809,
  rs_R010_ueqv_R010YNN_partial_05_0810,
  rs_R010_ueqv_R010YNN_partial_05_0811,
  rs_R010_ueqv_R010YNN_partial_05_0812,
  rs_R010_ueqv_R010YNN_partial_05_0813,
  rs_R010_ueqv_R010YNN_partial_05_0814,
  rs_R010_ueqv_R010YNN_partial_05_0815,
  rs_R010_ueqv_R010YNN_partial_05_0816,
  rs_R010_ueqv_R010YNN_partial_05_0817,
  rs_R010_ueqv_R010YNN_partial_05_0818,
  rs_R010_ueqv_R010YNN_partial_05_0819,
  rs_R010_ueqv_R010YNN_partial_05_0820,
  rs_R010_ueqv_R010YNN_partial_05_0821,
  rs_R010_ueqv_R010YNN_partial_05_0822,
  rs_R010_ueqv_R010YNN_partial_05_0823,
  rs_R010_ueqv_R010YNN_partial_05_0824,
  rs_R010_ueqv_R010YNN_partial_05_0825,
  rs_R010_ueqv_R010YNN_partial_05_0826,
  rs_R010_ueqv_R010YNN_partial_05_0827,
  rs_R010_ueqv_R010YNN_partial_05_0828,
  rs_R010_ueqv_R010YNN_partial_05_0829,
  rs_R010_ueqv_R010YNN_partial_05_0830,
  rs_R010_ueqv_R010YNN_partial_05_0831,
  rs_R010_ueqv_R010YNN_partial_05_0832,
  rs_R010_ueqv_R010YNN_partial_05_0833,
  rs_R010_ueqv_R010YNN_partial_05_0834,
  rs_R010_ueqv_R010YNN_partial_05_0835,
  rs_R010_ueqv_R010YNN_partial_05_0836,
  rs_R010_ueqv_R010YNN_partial_05_0837,
  rs_R010_ueqv_R010YNN_partial_05_0838,
  rs_R010_ueqv_R010YNN_partial_05_0839,
  rs_R010_ueqv_R010YNN_partial_05_0840,
  rs_R010_ueqv_R010YNN_partial_05_0841,
  rs_R010_ueqv_R010YNN_partial_05_0842,
  rs_R010_ueqv_R010YNN_partial_05_0843,
  rs_R010_ueqv_R010YNN_partial_05_0844,
  rs_R010_ueqv_R010YNN_partial_05_0845,
  rs_R010_ueqv_R010YNN_partial_05_0846,
  rs_R010_ueqv_R010YNN_partial_05_0847,
  rs_R010_ueqv_R010YNN_partial_05_0848,
  rs_R010_ueqv_R010YNN_partial_05_0849,
  rs_R010_ueqv_R010YNN_partial_05_0850,
  rs_R010_ueqv_R010YNN_partial_05_0851,
  rs_R010_ueqv_R010YNN_partial_05_0852,
  rs_R010_ueqv_R010YNN_partial_05_0853,
  rs_R010_ueqv_R010YNN_partial_05_0854,
  rs_R010_ueqv_R010YNN_partial_05_0855,
  rs_R010_ueqv_R010YNN_partial_05_0856,
  rs_R010_ueqv_R010YNN_partial_05_0857,
  rs_R010_ueqv_R010YNN_partial_05_0858,
  rs_R010_ueqv_R010YNN_partial_05_0859,
  rs_R010_ueqv_R010YNN_partial_05_0860,
  rs_R010_ueqv_R010YNN_partial_05_0861,
  rs_R010_ueqv_R010YNN_partial_05_0862,
  rs_R010_ueqv_R010YNN_partial_05_0863,
  rs_R010_ueqv_R010YNN_partial_05_0864,
  rs_R010_ueqv_R010YNN_partial_05_0865,
  rs_R010_ueqv_R010YNN_partial_05_0866,
  rs_R010_ueqv_R010YNN_partial_05_0867,
  rs_R010_ueqv_R010YNN_partial_05_0868,
  rs_R010_ueqv_R010YNN_partial_05_0869,
  rs_R010_ueqv_R010YNN_partial_05_0870,
  rs_R010_ueqv_R010YNN_partial_05_0871,
  rs_R010_ueqv_R010YNN_partial_05_0872,
  rs_R010_ueqv_R010YNN_partial_05_0873,
  rs_R010_ueqv_R010YNN_partial_05_0874,
  rs_R010_ueqv_R010YNN_partial_05_0875,
  rs_R010_ueqv_R010YNN_partial_05_0876,
  rs_R010_ueqv_R010YNN_partial_05_0877,
  rs_R010_ueqv_R010YNN_partial_05_0878,
  rs_R010_ueqv_R010YNN_partial_05_0879,
  rs_R010_ueqv_R010YNN_partial_05_0880,
  rs_R010_ueqv_R010YNN_partial_05_0881,
  rs_R010_ueqv_R010YNN_partial_05_0882,
  rs_R010_ueqv_R010YNN_partial_05_0883,
  rs_R010_ueqv_R010YNN_partial_05_0884,
  rs_R010_ueqv_R010YNN_partial_05_0885,
  rs_R010_ueqv_R010YNN_partial_05_0886,
  rs_R010_ueqv_R010YNN_partial_05_0887,
  rs_R010_ueqv_R010YNN_partial_05_0888,
  rs_R010_ueqv_R010YNN_partial_05_0889,
  rs_R010_ueqv_R010YNN_partial_05_0890,
  rs_R010_ueqv_R010YNN_partial_05_0891,
  rs_R010_ueqv_R010YNN_partial_05_0892,
  rs_R010_ueqv_R010YNN_partial_05_0893,
  rs_R010_ueqv_R010YNN_partial_05_0894,
  rs_R010_ueqv_R010YNN_partial_05_0895,
  rs_R010_ueqv_R010YNN_partial_05_0896,
  rs_R010_ueqv_R010YNN_partial_05_0897,
  rs_R010_ueqv_R010YNN_partial_05_0898,
  rs_R010_ueqv_R010YNN_partial_05_0899
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_05_0800_0899 : Poly :=
[
  term ((-6078442204923599744 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17600495691394580480 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((34431553249633662848 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85748108566614828224 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1901072312249502208 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-50999383021619200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-203610247244591632456 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-283472117351742674392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((50965111854247936 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((261021856840832384 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4874376886636166528 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((750586920256408192 : Rat) / 5901269884566345) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-30495661694170859696 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-100669242223361146336 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-59669583821656835936 : Rat) / 449152207880882925) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((19176118216531757904 : Rat) / 29943480525392195) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2562792743764314223832 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6602966398784643200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-146470334224076800 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1528854877692405760 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-664569498969241600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((7825796445209372032 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((290789849806858752112 : Rat) / 4042369870927946325) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-27939120647563776512 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (10, 1), (16, 1)],
  term ((169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (6, 1), (11, 2), (16, 1)],
  term ((3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((52519833143095844168 : Rat) / 449152207880882925) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (6, 1), (16, 1)],
  term ((3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (6, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (6, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((950536156124751104 : Rat) / 29943480525392195) [(5, 2), (6, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((25499691510809600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (14, 1), (16, 1)],
  term ((141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (8, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25482555927123968 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((65255464210208096 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-375293460128204096 : Rat) / 5901269884566345) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((73235167112038400 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-764427438846202880 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 2), (11, 2), (16, 1)],
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 2), (14, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 2), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (11, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 3), (13, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 4), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (10, 1), (16, 1)],
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (6, 2), (11, 2), (16, 1)],
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (6, 2), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (6, 2), (15, 2), (16, 1)],
  term ((3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (6, 2), (16, 1)],
  term ((3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (7, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (7, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (7, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((950536156124751104 : Rat) / 29943480525392195) [(5, 2), (7, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((25499691510809600 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (7, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (14, 1), (16, 1)],
  term ((141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (8, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-25482555927123968 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((65255464210208096 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-375293460128204096 : Rat) / 5901269884566345) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((73235167112038400 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-764427438846202880 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 2), (14, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 2), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 3), (13, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 4), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (10, 1), (16, 1)],
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 2), (11, 2), (16, 1)],
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (7, 2), (14, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (7, 2), (16, 1)],
  term ((-3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((17600495691394580480 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12640932341187617152 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3039221102461799872 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-8800247845697290240 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1039639739224590332224 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3722628956351046043088 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((17215776624816831424 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1140262462628521329488 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((85748108566614828224 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((106602409660369994272 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-42874054283307414112 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-950536156124751104 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((50999383021619200 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((16982152352691471872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-950536156124751104 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 2), (14, 3), (16, 1)],
  term ((-25499691510809600 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((283472117351742674392 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((12374837713744059052 : Rat) / 269491324728529755) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-101805123622295816228 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 3), (16, 1)],
  term ((-141736058675871337196 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50965111854247936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-375234167563820032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 3), (16, 1)],
  term ((25482555927123968 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((522991249980274666604 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((530038840114977140972 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65255464210208096 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65255464210208096 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2443636814439644864 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-750586920256408192 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21700449261978536768 : Rat) / 808473974185589265) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2437188443318083264 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((375293460128204096 : Rat) / 5901269884566345) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (15, 3), (16, 1)],
  term ((57351979164599601832 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59669583821656835936 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((62973932738369044576 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15247830847085429848 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-29834791910828417968 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((2562792743764314223832 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3870172331113944428956 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((9588059108265878952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1281396371882157111916 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((146470334224076800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-6676201565896681600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 3), (16, 1)],
  term ((-73235167112038400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1308235041403136000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-20431856583367555456 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1528854877692405760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1478010188702458880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((764427438846202880 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((664569498969241600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (14, 2), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((4126650613343834816 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-290789849806858752112 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 2), (9, 2), (14, 2), (15, 2), (16, 1)],
  term ((28007978225288795576 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((3912898222604686016 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)],
  term ((145394924903429376056 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 2), (9, 2), (15, 4), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-749606419482456183296 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12261110181957683456 : Rat) / 17966088315235317) [(5, 2), (9, 3), (13, 1), (14, 2), (16, 1)],
  term ((68146038134768743936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 3), (16, 1)],
  term ((-47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 4), (16, 1)],
  term ((27939120647563776512 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 1), (15, 3), (16, 1)],
  term ((122322515945755599616 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (14, 3), (15, 1), (16, 1)],
  term ((-13969560323781888256 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 3), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (15, 2), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-25155393004197197482 : Rat) / 449152207880882925) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 3), (16, 1)],
  term ((25155393004197197482 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((18219578671687551034 : Rat) / 269491324728529755) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (14, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((129728004041588464684 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (14, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((-22568738679134327641 : Rat) / 149717402626960975) [(5, 2), (14, 2), (16, 1)],
  term ((26259916571547922084 : Rat) / 449152207880882925) [(5, 2), (14, 3), (16, 1)],
  term ((-3037276578861427751 : Rat) / 89830441576176585) [(5, 2), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 2), (15, 4), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (6, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7933992397004119424 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((899030953188873472 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6889505986274847232 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((13463051840928845056 : Rat) / 89830441576176585) [(5, 3), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 3), (16, 1)],
  term ((696538221421542016 : Rat) / 5988696105078439) [(5, 3), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-36683178455635998152 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-531168289789744640 : Rat) / 5988696105078439) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-28200491246884267520 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-99950510261895025408 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (6, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (6, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (6, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (6, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-10476990941802539264 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (6, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-8935770240474660352 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23165390557099417088 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((20474916608620271948 : Rat) / 89830441576176585) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-58697322582900058112 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 3), (8, 1), (9, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 3), (9, 1), (14, 1), (16, 1)],
  term ((-21541580299021408384 : Rat) / 269491324728529755) [(5, 3), (6, 3), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 3), (9, 2), (13, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (7, 2), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (7, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-449515476594436736 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (7, 2), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 1), (16, 1)],
  term ((-13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 3), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 3), (9, 1), (13, 1), (16, 1)],
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18219332546331247232 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-113315924951282679296 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-899030953188873472 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((169533236319894656 : Rat) / 5988696105078439) [(5, 3), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1046741534101991552 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (14, 3), (16, 1)],
  term ((449515476594436736 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-5767772926478503424 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((2055402032620518080 : Rat) / 53898264945705951) [(5, 3), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((2118089933620924736 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (14, 3), (16, 1)],
  term ((-2118089933620924736 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6823378830145568768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((3411689415072784384 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6161580727866699136 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3080790363933349568 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-425807632509172689184 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((212903816254586344592 : Rat) / 269491324728529755) [(5, 3), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5484824331613692032 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((36683178455635998152 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-26977219894486579684 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((1439271777778096768 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 3), (16, 1)],
  term ((-18341589227817999076 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 4), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((13955310578987747200 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11147594596347129856 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((5573797298173564928 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((25884479543101484800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13126344574278977536 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((82599895623438566912 : Rat) / 269491324728529755) [(5, 3), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((6563172287139488768 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4706269007836633600 : Rat) / 17966088315235317) [(5, 3), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((99950510261895025408 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-120569290248497016704 : Rat) / 269491324728529755) [(5, 3), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((-49975255130947512704 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 800 through 899. -/
theorem rs_R010_ueqv_R010YNN_block_05_0800_0899_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_05_0800_0899
      rs_R010_ueqv_R010YNN_block_05_0800_0899 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
