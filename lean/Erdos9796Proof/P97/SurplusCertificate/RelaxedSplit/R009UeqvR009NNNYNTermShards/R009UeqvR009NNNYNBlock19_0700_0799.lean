/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0700 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 700 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0700 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0700_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0700
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0701 : Poly :=
[
  term ((-33969429193 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 701 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0701 : Poly :=
[
  term ((-67938858386 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((33969429193 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0701_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0701
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0702 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 702 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0702 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0702_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0702
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0703 : Poly :=
[
  term ((147 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 703 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0703 : Poly :=
[
  term ((294 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((-147 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0703_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0703
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0704 : Poly :=
[
  term ((1707891866462 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 704 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0704 : Poly :=
[
  term ((3415783732924 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((-1707891866462 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0704_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0704
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0705 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 705 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0705 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0705_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0705
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0706 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 706 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0706 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0706_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0706
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0707 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 707 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0707 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0707_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0707
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0708 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 708 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0708 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0708_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0708
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0709 : Poly :=
[
  term ((199650750208 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 709 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0709 : Poly :=
[
  term ((399301500416 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((-199650750208 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0709_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0709
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0710 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 710 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0710 : Poly :=
[
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0710_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0710
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0711 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 711 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0711 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0711_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0711
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0712 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 712 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0712 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0712_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0712
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0713 : Poly :=
[
  term ((536166400 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 713 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0713 : Poly :=
[
  term ((1072332800 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-536166400 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0713_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0713
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0714 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (14, 2)]
]

/-- Partial product 714 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0714 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0714_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0714
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0715 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 715 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0715 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0715_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0715
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0716 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 716 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0716 : Poly :=
[
  term ((7311360 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0716_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0716
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0717 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 717 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0717 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0717_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0717
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0718 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 718 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0718 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0718_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0718
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0719 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 719 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0719 : Poly :=
[
  term ((-140656640 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0719_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0719
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0720 : Poly :=
[
  term ((3119542972 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 720 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0720 : Poly :=
[
  term ((6239085944 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((-3119542972 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0720_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0720
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0721 : Poly :=
[
  term ((8377600 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 721 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0721 : Poly :=
[
  term ((16755200 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8377600 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0721_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0721
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0722 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)]
]

/-- Partial product 722 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0722 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0722_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0722
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0723 : Poly :=
[
  term ((21694720 : Rat) / 36742197) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 723 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0723 : Poly :=
[
  term ((43389440 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-21694720 : Rat) / 36742197) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0723_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0723
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0724 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 724 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0724 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0724_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0724
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0725 : Poly :=
[
  term ((-161053292 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 725 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0725 : Poly :=
[
  term ((-322106584 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((161053292 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0725_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0725
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0726 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(5, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 726 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0726 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0726_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0726
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0727 : Poly :=
[
  term ((-210675315644 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 727 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0727 : Poly :=
[
  term ((-421350631288 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((210675315644 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0727_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0727
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0728 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 1), (15, 3)]
]

/-- Partial product 728 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0728 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0728_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0728
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0729 : Poly :=
[
  term ((178697921024 : Rat) / 10471526145) [(5, 1), (10, 2), (11, 1)]
]

/-- Partial product 729 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0729 : Poly :=
[
  term ((357395842048 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0729_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0729
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0730 : Poly :=
[
  term ((8376465048 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1)]
]

/-- Partial product 730 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0730 : Poly :=
[
  term ((16752930096 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0730_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0730
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0731 : Poly :=
[
  term ((-171358272772 : Rat) / 10471526145) [(5, 1), (10, 2), (15, 1)]
]

/-- Partial product 731 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0731 : Poly :=
[
  term ((-342716545544 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((171358272772 : Rat) / 10471526145) [(5, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0731_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0731
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0732 : Poly :=
[
  term ((-1238967620429 : Rat) / 52357630725) [(5, 1), (11, 1)]
]

/-- Partial product 732 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0732 : Poly :=
[
  term ((-2477935240858 : Rat) / 52357630725) [(5, 1), (8, 1), (11, 1)],
  term ((1238967620429 : Rat) / 52357630725) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0732_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0732
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0733 : Poly :=
[
  term ((11855894848 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 733 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0733 : Poly :=
[
  term ((23711789696 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-11855894848 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0733_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0733
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0734 : Poly :=
[
  term ((-48742400 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 734 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0734 : Poly :=
[
  term ((-97484800 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((48742400 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0734_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0734
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0735 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 735 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0735 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0735_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0735
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0736 : Poly :=
[
  term ((-35338240 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 736 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0736 : Poly :=
[
  term ((-70676480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((35338240 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0736_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0736
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0737 : Poly :=
[
  term ((-752819915456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 737 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0737 : Poly :=
[
  term ((-1505639830912 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((752819915456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0737_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0737
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0738 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 738 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0738 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0738_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0738
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0739 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 739 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0739 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0739_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0739
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0740 : Poly :=
[
  term ((-2437120 : Rat) / 12247399) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 740 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0740 : Poly :=
[
  term ((-4874240 : Rat) / 12247399) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((2437120 : Rat) / 12247399) [(5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0740_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0740
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0741 : Poly :=
[
  term ((-1882505360 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 741 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0741 : Poly :=
[
  term ((-3765010720 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((1882505360 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0741_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0741
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0742 : Poly :=
[
  term ((2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 742 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0742 : Poly :=
[
  term ((4640 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0742_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0742
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0743 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 743 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0743 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0743_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0743
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0744 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 744 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0744 : Poly :=
[
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0744_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0744
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0745 : Poly :=
[
  term ((185248357 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 745 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0745 : Poly :=
[
  term ((370496714 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-185248357 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0745_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0745
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0746 : Poly :=
[
  term ((-6854400 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 746 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0746 : Poly :=
[
  term ((-13708800 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((6854400 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0746_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0746
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0747 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 747 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0747 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0747_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0747
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0748 : Poly :=
[
  term ((43955200 : Rat) / 36742197) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 748 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0748 : Poly :=
[
  term ((87910400 : Rat) / 36742197) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-43955200 : Rat) / 36742197) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0748_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0748
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0749 : Poly :=
[
  term ((-10913574959 : Rat) / 330679773) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 749 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0749 : Poly :=
[
  term ((-21827149918 : Rat) / 330679773) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((10913574959 : Rat) / 330679773) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0749_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0749
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0750 : Poly :=
[
  term ((-63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 750 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0750 : Poly :=
[
  term ((-126 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0750_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0750
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0751 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)]
]

/-- Partial product 751 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0751 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0751_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0751
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0752 : Poly :=
[
  term ((-552819836289 : Rat) / 46540116200) [(5, 1), (13, 1)]
]

/-- Partial product 752 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0752 : Poly :=
[
  term ((-552819836289 : Rat) / 23270058100) [(5, 1), (8, 1), (13, 1)],
  term ((552819836289 : Rat) / 46540116200) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0752_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0752
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0753 : Poly :=
[
  term ((-11762811179 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 753 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0753 : Poly :=
[
  term ((-23525622358 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((11762811179 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0753_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0753
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0754 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 754 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0754 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0754_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0754
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0755 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 755 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0755 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0755_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0755
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0756 : Poly :=
[
  term ((-1028160 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 756 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0756 : Poly :=
[
  term ((-2056320 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((1028160 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0756_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0756
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0757 : Poly :=
[
  term ((-1239712600 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 757 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0757 : Poly :=
[
  term ((-2479425200 : Rat) / 110226591) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((1239712600 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0757_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0757
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0758 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 758 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0758 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0758_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0758
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0759 : Poly :=
[
  term ((-3198720 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 759 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0759 : Poly :=
[
  term ((-6397440 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((3198720 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0759_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0759
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0760 : Poly :=
[
  term ((624468148213 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 760 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0760 : Poly :=
[
  term ((1248936296426 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-624468148213 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0760_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0760
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0761 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 761 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0761 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0761_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0761
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0762 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 762 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0762 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0762_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0762
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0763 : Poly :=
[
  term ((2197760 : Rat) / 12247399) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 763 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0763 : Poly :=
[
  term ((4395520 : Rat) / 12247399) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-2197760 : Rat) / 12247399) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0763_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0763
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0764 : Poly :=
[
  term ((5766417234193 : Rat) / 209430522900) [(5, 1), (15, 1)]
]

/-- Partial product 764 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0764 : Poly :=
[
  term ((5766417234193 : Rat) / 104715261450) [(5, 1), (8, 1), (15, 1)],
  term ((-5766417234193 : Rat) / 209430522900) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0764_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0764
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0765 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 765 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0765 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0765_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0765
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0766 : Poly :=
[
  term ((41515040 : Rat) / 1645173) [(5, 1), (15, 3)]
]

/-- Partial product 766 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0766 : Poly :=
[
  term ((83030080 : Rat) / 1645173) [(5, 1), (8, 1), (15, 3)],
  term ((-41515040 : Rat) / 1645173) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0766_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0766
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0767 : Poly :=
[
  term ((1721 : Rat) / 268) [(5, 2)]
]

/-- Partial product 767 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0767 : Poly :=
[
  term ((-1721 : Rat) / 268) [(5, 2)],
  term ((1721 : Rat) / 134) [(5, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0767_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0767
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0768 : Poly :=
[
  term ((-1721 : Rat) / 67) [(5, 2), (6, 1)]
]

/-- Partial product 768 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0768 : Poly :=
[
  term ((1721 : Rat) / 67) [(5, 2), (6, 1)],
  term ((-3442 : Rat) / 67) [(5, 2), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0768_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0768
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0769 : Poly :=
[
  term ((-4385912120576 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 769 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0769 : Poly :=
[
  term ((-8771824241152 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0769_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0769
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0770 : Poly :=
[
  term ((-205589630652 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 770 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0770 : Poly :=
[
  term ((-411179261304 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0770_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0770
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0771 : Poly :=
[
  term ((4789749157348 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 771 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0771 : Poly :=
[
  term ((9579498314696 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0771_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0771
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0772 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 772 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0772 : Poly :=
[
  term ((88204818688 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0772_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0772
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0773 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(5, 2), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 773 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0773 : Poly :=
[
  term ((1378200292 : Rat) / 232700581) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0773_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0773
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0774 : Poly :=
[
  term ((-76905767668 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 774 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0774 : Poly :=
[
  term ((-153811535336 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0774_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0774
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0775 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 775 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0775 : Poly :=
[
  term ((2387058240 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0775_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0775
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0776 : Poly :=
[
  term ((-5843604024 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 776 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0776 : Poly :=
[
  term ((-11687208048 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0776_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0776
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0777 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 2), (6, 1), (11, 2)]
]

/-- Partial product 777 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0777 : Poly :=
[
  term ((50923909120 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (11, 2)],
  term ((-25461954560 : Rat) / 110226591) [(5, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0777_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0777
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0778 : Poly :=
[
  term ((-1179820320 : Rat) / 12247399) [(5, 2), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 778 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0778 : Poly :=
[
  term ((-2359640640 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0778_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0778
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0779 : Poly :=
[
  term ((19525602136 : Rat) / 110226591) [(5, 2), (6, 1), (15, 2)]
]

/-- Partial product 779 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0779 : Poly :=
[
  term ((39051204272 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0779_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0779
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0780 : Poly :=
[
  term ((2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 780 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0780 : Poly :=
[
  term ((-2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0780_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0780
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0781 : Poly :=
[
  term ((102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 781 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0781 : Poly :=
[
  term ((-102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0781_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0781
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0782 : Poly :=
[
  term ((-2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 782 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0782 : Poly :=
[
  term ((2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0782_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0782
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0783 : Poly :=
[
  term ((1096478030144 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)]
]

/-- Partial product 783 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0783 : Poly :=
[
  term ((2192956060288 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0783_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0783
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0784 : Poly :=
[
  term ((51397407663 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)]
]

/-- Partial product 784 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0784 : Poly :=
[
  term ((102794815326 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0784_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0784
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0785 : Poly :=
[
  term ((-1197437289337 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)]
]

/-- Partial product 785 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0785 : Poly :=
[
  term ((-2394874578674 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0785_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0785
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0786 : Poly :=
[
  term ((1721 : Rat) / 134) [(5, 2), (8, 1)]
]

/-- Partial product 786 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0786 : Poly :=
[
  term ((-1721 : Rat) / 134) [(5, 2), (8, 1)],
  term ((1721 : Rat) / 67) [(5, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0786_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0786
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0787 : Poly :=
[
  term ((-22051204672 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 787 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0787 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0787_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0787
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0788 : Poly :=
[
  term ((-344550073 : Rat) / 232700581) [(5, 2), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 788 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0788 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 2), (8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0788_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0788
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0789 : Poly :=
[
  term ((38452883834 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 789 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0789 : Poly :=
[
  term ((-38452883834 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0789_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0789
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0790 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 790 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0790 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0790_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0790
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0791 : Poly :=
[
  term ((2921802012 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 791 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0791 : Poly :=
[
  term ((-2921802012 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0791_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0791
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0792 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(5, 2), (8, 1), (11, 2)]
]

/-- Partial product 792 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0792 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(5, 2), (8, 1), (11, 2)],
  term ((-25461954560 : Rat) / 110226591) [(5, 2), (8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0792_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0792
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0793 : Poly :=
[
  term ((589910160 : Rat) / 12247399) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 793 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0793 : Poly :=
[
  term ((-589910160 : Rat) / 12247399) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((1179820320 : Rat) / 12247399) [(5, 2), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0793_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0793
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0794 : Poly :=
[
  term ((-9762801068 : Rat) / 110226591) [(5, 2), (8, 1), (15, 2)]
]

/-- Partial product 794 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0794 : Poly :=
[
  term ((9762801068 : Rat) / 110226591) [(5, 2), (8, 1), (15, 2)],
  term ((-19525602136 : Rat) / 110226591) [(5, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0794_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0794
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0795 : Poly :=
[
  term ((-11025602336 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)]
]

/-- Partial product 795 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0795 : Poly :=
[
  term ((-22051204672 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((11025602336 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0795_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0795
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0796 : Poly :=
[
  term ((-344550073 : Rat) / 465401162) [(5, 2), (9, 1), (13, 1)]
]

/-- Partial product 796 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0796 : Poly :=
[
  term ((-344550073 : Rat) / 232700581) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((344550073 : Rat) / 465401162) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0796_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0796
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0797 : Poly :=
[
  term ((19226441917 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)]
]

/-- Partial product 797 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0797 : Poly :=
[
  term ((38452883834 : Rat) / 6282915687) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0797_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0797
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0798 : Poly :=
[
  term ((-298382280 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)]
]

/-- Partial product 798 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0798 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((298382280 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0798_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0798
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0799 : Poly :=
[
  term ((1460901006 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 799 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0799 : Poly :=
[
  term ((2921802012 : Rat) / 12247399) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1460901006 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0799_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0799
        rs_R009_ueqv_R009NNNYN_generator_19_0700_0799 =
      rs_R009_ueqv_R009NNNYN_partial_19_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0700_0799 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0700,
  rs_R009_ueqv_R009NNNYN_partial_19_0701,
  rs_R009_ueqv_R009NNNYN_partial_19_0702,
  rs_R009_ueqv_R009NNNYN_partial_19_0703,
  rs_R009_ueqv_R009NNNYN_partial_19_0704,
  rs_R009_ueqv_R009NNNYN_partial_19_0705,
  rs_R009_ueqv_R009NNNYN_partial_19_0706,
  rs_R009_ueqv_R009NNNYN_partial_19_0707,
  rs_R009_ueqv_R009NNNYN_partial_19_0708,
  rs_R009_ueqv_R009NNNYN_partial_19_0709,
  rs_R009_ueqv_R009NNNYN_partial_19_0710,
  rs_R009_ueqv_R009NNNYN_partial_19_0711,
  rs_R009_ueqv_R009NNNYN_partial_19_0712,
  rs_R009_ueqv_R009NNNYN_partial_19_0713,
  rs_R009_ueqv_R009NNNYN_partial_19_0714,
  rs_R009_ueqv_R009NNNYN_partial_19_0715,
  rs_R009_ueqv_R009NNNYN_partial_19_0716,
  rs_R009_ueqv_R009NNNYN_partial_19_0717,
  rs_R009_ueqv_R009NNNYN_partial_19_0718,
  rs_R009_ueqv_R009NNNYN_partial_19_0719,
  rs_R009_ueqv_R009NNNYN_partial_19_0720,
  rs_R009_ueqv_R009NNNYN_partial_19_0721,
  rs_R009_ueqv_R009NNNYN_partial_19_0722,
  rs_R009_ueqv_R009NNNYN_partial_19_0723,
  rs_R009_ueqv_R009NNNYN_partial_19_0724,
  rs_R009_ueqv_R009NNNYN_partial_19_0725,
  rs_R009_ueqv_R009NNNYN_partial_19_0726,
  rs_R009_ueqv_R009NNNYN_partial_19_0727,
  rs_R009_ueqv_R009NNNYN_partial_19_0728,
  rs_R009_ueqv_R009NNNYN_partial_19_0729,
  rs_R009_ueqv_R009NNNYN_partial_19_0730,
  rs_R009_ueqv_R009NNNYN_partial_19_0731,
  rs_R009_ueqv_R009NNNYN_partial_19_0732,
  rs_R009_ueqv_R009NNNYN_partial_19_0733,
  rs_R009_ueqv_R009NNNYN_partial_19_0734,
  rs_R009_ueqv_R009NNNYN_partial_19_0735,
  rs_R009_ueqv_R009NNNYN_partial_19_0736,
  rs_R009_ueqv_R009NNNYN_partial_19_0737,
  rs_R009_ueqv_R009NNNYN_partial_19_0738,
  rs_R009_ueqv_R009NNNYN_partial_19_0739,
  rs_R009_ueqv_R009NNNYN_partial_19_0740,
  rs_R009_ueqv_R009NNNYN_partial_19_0741,
  rs_R009_ueqv_R009NNNYN_partial_19_0742,
  rs_R009_ueqv_R009NNNYN_partial_19_0743,
  rs_R009_ueqv_R009NNNYN_partial_19_0744,
  rs_R009_ueqv_R009NNNYN_partial_19_0745,
  rs_R009_ueqv_R009NNNYN_partial_19_0746,
  rs_R009_ueqv_R009NNNYN_partial_19_0747,
  rs_R009_ueqv_R009NNNYN_partial_19_0748,
  rs_R009_ueqv_R009NNNYN_partial_19_0749,
  rs_R009_ueqv_R009NNNYN_partial_19_0750,
  rs_R009_ueqv_R009NNNYN_partial_19_0751,
  rs_R009_ueqv_R009NNNYN_partial_19_0752,
  rs_R009_ueqv_R009NNNYN_partial_19_0753,
  rs_R009_ueqv_R009NNNYN_partial_19_0754,
  rs_R009_ueqv_R009NNNYN_partial_19_0755,
  rs_R009_ueqv_R009NNNYN_partial_19_0756,
  rs_R009_ueqv_R009NNNYN_partial_19_0757,
  rs_R009_ueqv_R009NNNYN_partial_19_0758,
  rs_R009_ueqv_R009NNNYN_partial_19_0759,
  rs_R009_ueqv_R009NNNYN_partial_19_0760,
  rs_R009_ueqv_R009NNNYN_partial_19_0761,
  rs_R009_ueqv_R009NNNYN_partial_19_0762,
  rs_R009_ueqv_R009NNNYN_partial_19_0763,
  rs_R009_ueqv_R009NNNYN_partial_19_0764,
  rs_R009_ueqv_R009NNNYN_partial_19_0765,
  rs_R009_ueqv_R009NNNYN_partial_19_0766,
  rs_R009_ueqv_R009NNNYN_partial_19_0767,
  rs_R009_ueqv_R009NNNYN_partial_19_0768,
  rs_R009_ueqv_R009NNNYN_partial_19_0769,
  rs_R009_ueqv_R009NNNYN_partial_19_0770,
  rs_R009_ueqv_R009NNNYN_partial_19_0771,
  rs_R009_ueqv_R009NNNYN_partial_19_0772,
  rs_R009_ueqv_R009NNNYN_partial_19_0773,
  rs_R009_ueqv_R009NNNYN_partial_19_0774,
  rs_R009_ueqv_R009NNNYN_partial_19_0775,
  rs_R009_ueqv_R009NNNYN_partial_19_0776,
  rs_R009_ueqv_R009NNNYN_partial_19_0777,
  rs_R009_ueqv_R009NNNYN_partial_19_0778,
  rs_R009_ueqv_R009NNNYN_partial_19_0779,
  rs_R009_ueqv_R009NNNYN_partial_19_0780,
  rs_R009_ueqv_R009NNNYN_partial_19_0781,
  rs_R009_ueqv_R009NNNYN_partial_19_0782,
  rs_R009_ueqv_R009NNNYN_partial_19_0783,
  rs_R009_ueqv_R009NNNYN_partial_19_0784,
  rs_R009_ueqv_R009NNNYN_partial_19_0785,
  rs_R009_ueqv_R009NNNYN_partial_19_0786,
  rs_R009_ueqv_R009NNNYN_partial_19_0787,
  rs_R009_ueqv_R009NNNYN_partial_19_0788,
  rs_R009_ueqv_R009NNNYN_partial_19_0789,
  rs_R009_ueqv_R009NNNYN_partial_19_0790,
  rs_R009_ueqv_R009NNNYN_partial_19_0791,
  rs_R009_ueqv_R009NNNYN_partial_19_0792,
  rs_R009_ueqv_R009NNNYN_partial_19_0793,
  rs_R009_ueqv_R009NNNYN_partial_19_0794,
  rs_R009_ueqv_R009NNNYN_partial_19_0795,
  rs_R009_ueqv_R009NNNYN_partial_19_0796,
  rs_R009_ueqv_R009NNNYN_partial_19_0797,
  rs_R009_ueqv_R009NNNYN_partial_19_0798,
  rs_R009_ueqv_R009NNNYN_partial_19_0799
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0700_0799 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 1), (8, 1), (9, 1), (11, 2)],
  term ((-67938858386 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((294 : Rat) / 67) [(5, 1), (8, 1), (9, 1), (14, 1)],
  term ((3415783732924 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 1), (8, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 6282915687) [(5, 1), (8, 1), (9, 2), (15, 1)],
  term ((399301500416 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (11, 1)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1072332800 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((7311360 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-18278400 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((351641600 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((6239085944 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 1), (13, 1)],
  term ((16755200 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((43389440 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-322106584 : Rat) / 330679773) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-421350631288 : Rat) / 31414578435) [(5, 1), (8, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (10, 1), (15, 3)],
  term ((357395842048 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((16752930096 : Rat) / 1163502905) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-342716545544 : Rat) / 10471526145) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-2477935240858 : Rat) / 52357630725) [(5, 1), (8, 1), (11, 1)],
  term ((23711789696 : Rat) / 330679773) [(5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-97484800 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-70676480 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1505639830912 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4874240 : Rat) / 12247399) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((-3765010720 : Rat) / 110226591) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((155975680 : Rat) / 110226591) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((370496714 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-13708800 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((87910400 : Rat) / 36742197) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21827149918 : Rat) / 330679773) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((-552819836289 : Rat) / 23270058100) [(5, 1), (8, 1), (13, 1)],
  term ((-23525622358 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2056320 : Rat) / 12247399) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-2479425200 : Rat) / 110226591) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6397440 : Rat) / 12247399) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((1248936296426 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (8, 1), (14, 1), (15, 3)],
  term ((4395520 : Rat) / 12247399) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((5766417234193 : Rat) / 104715261450) [(5, 1), (8, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((83030080 : Rat) / 1645173) [(5, 1), (8, 1), (15, 3)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)],
  term ((33969429193 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-147 : Rat) / 67) [(5, 1), (9, 1), (14, 1)],
  term ((-1707891866462 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)],
  term ((-199650750208 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-536166400 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3119542972 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((-8377600 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((-21694720 : Rat) / 36742197) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((161053292 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((210675315644 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (10, 1), (15, 3)],
  term ((-178697921024 : Rat) / 10471526145) [(5, 1), (10, 2), (11, 1)],
  term ((-8376465048 : Rat) / 1163502905) [(5, 1), (10, 2), (13, 1)],
  term ((171358272772 : Rat) / 10471526145) [(5, 1), (10, 2), (15, 1)],
  term ((1238967620429 : Rat) / 52357630725) [(5, 1), (11, 1)],
  term ((-11855894848 : Rat) / 330679773) [(5, 1), (11, 1), (12, 1)],
  term ((48742400 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((35338240 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((752819915456 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2437120 : Rat) / 12247399) [(5, 1), (11, 1), (14, 2)],
  term ((1882505360 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 1), (11, 1), (16, 1)],
  term ((-77987840 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)],
  term ((-185248357 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((6854400 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-43955200 : Rat) / 36742197) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((10913574959 : Rat) / 330679773) [(5, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((552819836289 : Rat) / 46540116200) [(5, 1), (13, 1)],
  term ((11762811179 : Rat) / 918554925) [(5, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (14, 1), (16, 1)],
  term ((1028160 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((1239712600 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 1), (13, 1), (16, 1)],
  term ((3198720 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((-624468148213 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((-2197760 : Rat) / 12247399) [(5, 1), (14, 2), (15, 1)],
  term ((-5766417234193 : Rat) / 209430522900) [(5, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 1), (15, 1), (16, 1)],
  term ((-41515040 : Rat) / 1645173) [(5, 1), (15, 3)],
  term ((-1721 : Rat) / 268) [(5, 2)],
  term ((1721 : Rat) / 67) [(5, 2), (6, 1)],
  term ((-8771824241152 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-411179261304 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((9579498314696 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (11, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 2), (6, 1), (7, 1), (13, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-3442 : Rat) / 67) [(5, 2), (6, 1), (8, 1)],
  term ((88204818688 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((1378200292 : Rat) / 232700581) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-153811535336 : Rat) / 6282915687) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((2387058240 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-11687208048 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((50923909120 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (11, 2)],
  term ((-2359640640 : Rat) / 12247399) [(5, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((39051204272 : Rat) / 110226591) [(5, 2), (6, 1), (8, 1), (15, 2)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 2), (6, 1), (11, 2)],
  term ((1179820320 : Rat) / 12247399) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 2), (6, 1), (15, 2)],
  term ((4385912120576 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (11, 1)],
  term ((205589630652 : Rat) / 5817514525) [(5, 2), (7, 1), (8, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 52357630725) [(5, 2), (7, 1), (8, 2), (15, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(5, 2), (7, 1), (11, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(5, 2), (7, 1), (13, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(5, 2), (7, 1), (15, 1)],
  term ((12730977280 : Rat) / 110226591) [(5, 2), (8, 1), (11, 2)],
  term ((-589910160 : Rat) / 12247399) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((9762801068 : Rat) / 110226591) [(5, 2), (8, 1), (15, 2)],
  term ((1721 : Rat) / 67) [(5, 2), (8, 2)],
  term ((-44102409344 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (11, 1)],
  term ((-689100146 : Rat) / 232700581) [(5, 2), (8, 2), (9, 1), (13, 1)],
  term ((76905767668 : Rat) / 6282915687) [(5, 2), (8, 2), (9, 1), (15, 1)],
  term ((-1193529120 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (13, 1)],
  term ((5843604024 : Rat) / 12247399) [(5, 2), (8, 2), (11, 1), (15, 1)],
  term ((-25461954560 : Rat) / 110226591) [(5, 2), (8, 2), (11, 2)],
  term ((1179820320 : Rat) / 12247399) [(5, 2), (8, 2), (13, 1), (15, 1)],
  term ((-19525602136 : Rat) / 110226591) [(5, 2), (8, 2), (15, 2)],
  term ((11025602336 : Rat) / 6282915687) [(5, 2), (9, 1), (11, 1)],
  term ((344550073 : Rat) / 465401162) [(5, 2), (9, 1), (13, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(5, 2), (9, 1), (15, 1)],
  term ((298382280 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1)],
  term ((-1460901006 : Rat) / 12247399) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 700 through 799. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0700_0799_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0700_0799
      rs_R009_ueqv_R009NNNYN_block_19_0700_0799 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
