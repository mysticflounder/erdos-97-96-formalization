/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0900 : Poly :=
[
  term ((322551428864 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 900 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0900 : Poly :=
[
  term ((-322551428864 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((645102857728 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0900_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0900
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0901 : Poly :=
[
  term ((5039866076 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 901 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0901 : Poly :=
[
  term ((-5039866076 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((10079732152 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0901_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0901
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0902 : Poly :=
[
  term ((-290872270672 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 902 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0902 : Poly :=
[
  term ((290872270672 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0902_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0902
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0903 : Poly :=
[
  term ((-992547202904 : Rat) / 17452543575) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 903 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0903 : Poly :=
[
  term ((992547202904 : Rat) / 17452543575) [(7, 1), (8, 1), (11, 1)],
  term ((-1985094405808 : Rat) / 17452543575) [(7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0903_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0903
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0904 : Poly :=
[
  term ((-4608126208 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 904 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0904 : Poly :=
[
  term ((4608126208 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-9216252416 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0904_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0904
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0905 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 905 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0905 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-779878400 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0905_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0905
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0906 : Poly :=
[
  term ((-80120320 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 906 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0906 : Poly :=
[
  term ((80120320 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-160240640 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0906_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0906
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0907 : Poly :=
[
  term ((589733600512 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 907 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0907 : Poly :=
[
  term ((-589733600512 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1179467201024 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0907_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0907
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0908 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 908 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0908 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0908_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0908
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0909 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 909 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0909 : Poly :=
[
  term ((103342925728 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0909_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0909
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0910 : Poly :=
[
  term ((3807312160 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 910 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0910 : Poly :=
[
  term ((-3807312160 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((7614624320 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0910_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0910
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0911 : Poly :=
[
  term ((2320 : Rat) / 201) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 911 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0911 : Poly :=
[
  term ((-2320 : Rat) / 201) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0911_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0911
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0912 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 912 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0912 : Poly :=
[
  term ((-202546857628 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0912_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0912
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0913 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 913 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0913 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0913_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0913
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0914 : Poly :=
[
  term ((-216005916 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 914 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0914 : Poly :=
[
  term ((216005916 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-432011832 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0914_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0914
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0915 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 915 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0915 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0915_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0915
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0916 : Poly :=
[
  term ((4096316156 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 916 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0916 : Poly :=
[
  term ((-4096316156 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((8192632312 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0916_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0916
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0917 : Poly :=
[
  term ((-63 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 917 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0917 : Poly :=
[
  term ((63 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0917_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0917
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0918 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 918 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0918 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0918_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0918
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0919 : Poly :=
[
  term ((-239885677773 : Rat) / 11635029050) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 919 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0919 : Poly :=
[
  term ((239885677773 : Rat) / 11635029050) [(7, 1), (8, 1), (13, 1)],
  term ((-239885677773 : Rat) / 5817514525) [(7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0919_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0919
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0920 : Poly :=
[
  term ((9214587508 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 920 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0920 : Poly :=
[
  term ((-9214587508 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((18429175016 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0920_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0920
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0921 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 921 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0921 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0921_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0921
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0922 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 922 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0922 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0922_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0922
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0923 : Poly :=
[
  term ((2677762160 : Rat) / 110226591) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 923 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0923 : Poly :=
[
  term ((-2677762160 : Rat) / 110226591) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((5355524320 : Rat) / 110226591) [(7, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0923_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0923
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0924 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 924 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0924 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0924_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0924
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0925 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 925 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0925 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0925_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0925
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0926 : Poly :=
[
  term ((-386709077576 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 926 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0926 : Poly :=
[
  term ((386709077576 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-773418155152 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0926_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0926
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0927 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0927 : Poly :=
[
  term ((-20641044794 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0927_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0927
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0928 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(7, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 928 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0928 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((35164160 : Rat) / 36742197) [(7, 1), (8, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0928_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0928
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0929 : Poly :=
[
  term ((213203006214 : Rat) / 5817514525) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 929 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0929 : Poly :=
[
  term ((-213203006214 : Rat) / 5817514525) [(7, 1), (8, 1), (15, 1)],
  term ((426406012428 : Rat) / 5817514525) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0929_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0929
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0930 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0930 : Poly :=
[
  term ((-30318188881 : Rat) / 24800982975) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0930_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0930
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0931 : Poly :=
[
  term ((-5648728000 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)]
]

/-- Partial product 931 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0931 : Poly :=
[
  term ((5648728000 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)],
  term ((-11297456000 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0931_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0931
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0932 : Poly :=
[
  term ((-1477 : Rat) / 268) [(7, 1), (9, 1)]
]

/-- Partial product 932 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0932 : Poly :=
[
  term ((-1477 : Rat) / 134) [(7, 1), (8, 1), (9, 1)],
  term ((1477 : Rat) / 268) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0932_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0932
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0933 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 933 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0933 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0933_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0933
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0934 : Poly :=
[
  term ((-1936432870964 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 934 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0934 : Poly :=
[
  term ((-3872865741928 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((1936432870964 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0934_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0934
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0935 : Poly :=
[
  term ((274288457632 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 935 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0935 : Poly :=
[
  term ((548576915264 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-274288457632 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0935_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0935
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0936 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 936 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0936 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0936_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0936
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0937 : Poly :=
[
  term ((-170546070709 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 937 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0937 : Poly :=
[
  term ((-341092141418 : Rat) / 5817514525) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((170546070709 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0937_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0937
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0938 : Poly :=
[
  term ((77143628709 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 938 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0938 : Poly :=
[
  term ((77143628709 : Rat) / 5817514525) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77143628709 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0938_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0938
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0939 : Poly :=
[
  term ((196 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 939 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0939 : Poly :=
[
  term ((392 : Rat) / 67) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0939_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0939
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0940 : Poly :=
[
  term ((10388401760498 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 940 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0940 : Poly :=
[
  term ((20776803520996 : Rat) / 157072892175) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-10388401760498 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0940_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0940
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0941 : Poly :=
[
  term ((-319503958511 : Rat) / 17452543575) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 941 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0941 : Poly :=
[
  term ((-639007917022 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((319503958511 : Rat) / 17452543575) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0941_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0941
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0942 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

/-- Partial product 942 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0942 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0942_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0942
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0943 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 943 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0943 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0943_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0943
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0944 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 944 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0944 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0944_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0944
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0945 : Poly :=
[
  term ((109060652288 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 945 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0945 : Poly :=
[
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-109060652288 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0945_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0945
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0946 : Poly :=
[
  term ((5112218076 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 946 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0946 : Poly :=
[
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-5112218076 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0946_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0946
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0947 : Poly :=
[
  term ((-98349338224 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 947 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0947 : Poly :=
[
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((98349338224 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0947_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0947
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0948 : Poly :=
[
  term ((22816552516622 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

/-- Partial product 948 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0948 : Poly :=
[
  term ((45633105033244 : Rat) / 471218676525) [(7, 1), (8, 1), (11, 1)],
  term ((-22816552516622 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0948_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0948
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0949 : Poly :=
[
  term ((40103295232 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 949 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0949 : Poly :=
[
  term ((80206590464 : Rat) / 330679773) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-40103295232 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0949_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0949
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0950 : Poly :=
[
  term ((194969600 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 950 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0950 : Poly :=
[
  term ((389939200 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-194969600 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0950_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0950
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0951 : Poly :=
[
  term ((1675520 : Rat) / 2079747) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 951 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0951 : Poly :=
[
  term ((3351040 : Rat) / 2079747) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1675520 : Rat) / 2079747) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0951_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0951
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0952 : Poly :=
[
  term ((-236377533056 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 952 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0952 : Poly :=
[
  term ((-472755066112 : Rat) / 8266994325) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((236377533056 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0952_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0952
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0953 : Poly :=
[
  term ((9748480 : Rat) / 12247399) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 953 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0953 : Poly :=
[
  term ((19496960 : Rat) / 12247399) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 12247399) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0953_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0953
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0954 : Poly :=
[
  term ((51671462864 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 954 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0954 : Poly :=
[
  term ((103342925728 : Rat) / 8266994325) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0954_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0954
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0955 : Poly :=
[
  term ((-5574315440 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 955 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0955 : Poly :=
[
  term ((-11148630880 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((5574315440 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0955_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0955
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0956 : Poly :=
[
  term ((-1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 956 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0956 : Poly :=
[
  term ((-2320 : Rat) / 67) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0956_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0956
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0957 : Poly :=
[
  term ((-101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 957 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0957 : Poly :=
[
  term ((-202546857628 : Rat) / 8266994325) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0957_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0957
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0958 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 958 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0958 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0958_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0958
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0959 : Poly :=
[
  term ((626613988 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 959 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0959 : Poly :=
[
  term ((1253227976 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-626613988 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0959_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0959
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0960 : Poly :=
[
  term ((27417600 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 960 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0960 : Poly :=
[
  term ((54835200 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-27417600 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0960_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0960
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0961 : Poly :=
[
  term ((-35009667290 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 961 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0961 : Poly :=
[
  term ((-70019334580 : Rat) / 330679773) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((35009667290 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0961_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0961
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0962 : Poly :=
[
  term ((189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0962 : Poly :=
[
  term ((189 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0962_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0962
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0963 : Poly :=
[
  term ((-175820800 : Rat) / 36742197) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 963 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0963 : Poly :=
[
  term ((-351641600 : Rat) / 36742197) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((175820800 : Rat) / 36742197) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0963_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0963
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0964 : Poly :=
[
  term ((1059433435067 : Rat) / 69810174300) [(7, 1), (13, 1)]
]

/-- Partial product 964 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0964 : Poly :=
[
  term ((1059433435067 : Rat) / 34905087150) [(7, 1), (8, 1), (13, 1)],
  term ((-1059433435067 : Rat) / 69810174300) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0964_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0964
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0965 : Poly :=
[
  term ((-3693398954 : Rat) / 306184975) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 965 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0965 : Poly :=
[
  term ((-7386797908 : Rat) / 306184975) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((3693398954 : Rat) / 306184975) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0965_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0965
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0966 : Poly :=
[
  term ((4112640 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 966 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0966 : Poly :=
[
  term ((8225280 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4112640 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0966_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0966
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0967 : Poly :=
[
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 967 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0967 : Poly :=
[
  term ((3229466429 : Rat) / 612369950) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0967_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0967
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0968 : Poly :=
[
  term ((-4004871080 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 968 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0968 : Poly :=
[
  term ((-8009742160 : Rat) / 110226591) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((4004871080 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0968_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0968
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0969 : Poly :=
[
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 969 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0969 : Poly :=
[
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0969_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0969
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0970 : Poly :=
[
  term ((3198720 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 970 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0970 : Poly :=
[
  term ((6397440 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-3198720 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0970_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0970
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0971 : Poly :=
[
  term ((145051720288 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 971 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0971 : Poly :=
[
  term ((290103440576 : Rat) / 8266994325) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-145051720288 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0971_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0971
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0972 : Poly :=
[
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 972 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0972 : Poly :=
[
  term ((-20641044794 : Rat) / 8266994325) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0972_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0972
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0973 : Poly :=
[
  term ((-8791040 : Rat) / 12247399) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 973 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0973 : Poly :=
[
  term ((-17582080 : Rat) / 12247399) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 12247399) [(7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0973_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0973
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0974 : Poly :=
[
  term ((-10233990355306 : Rat) / 471218676525) [(7, 1), (15, 1)]
]

/-- Partial product 974 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0974 : Poly :=
[
  term ((-20467980710612 : Rat) / 471218676525) [(7, 1), (8, 1), (15, 1)],
  term ((10233990355306 : Rat) / 471218676525) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0974_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0974
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0975 : Poly :=
[
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 975 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0975 : Poly :=
[
  term ((-30318188881 : Rat) / 8266994325) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0975_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0975
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0976 : Poly :=
[
  term ((8429136800 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 976 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0976 : Poly :=
[
  term ((16858273600 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)],
  term ((-8429136800 : Rat) / 110226591) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0976_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0976
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0977 : Poly :=
[
  term ((948 : Rat) / 67) [(7, 2)]
]

/-- Partial product 977 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0977 : Poly :=
[
  term ((-948 : Rat) / 67) [(7, 2)],
  term ((1896 : Rat) / 67) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0977_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0977
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0978 : Poly :=
[
  term ((-632 : Rat) / 67) [(7, 2), (8, 1)]
]

/-- Partial product 978 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0978 : Poly :=
[
  term ((632 : Rat) / 67) [(7, 2), (8, 1)],
  term ((-1264 : Rat) / 67) [(7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0978_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0978
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0979 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(7, 2), (8, 1), (9, 1), (11, 1)]
]

/-- Partial product 979 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0979 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((44102409344 : Rat) / 18848747061) [(7, 2), (8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0979_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0979
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0980 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(7, 2), (8, 1), (9, 1), (13, 1)]
]

/-- Partial product 980 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0980 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((689100146 : Rat) / 698101743) [(7, 2), (8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0980_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0980
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0981 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 981 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0981 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(7, 2), (8, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0981_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0981
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0982 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 982 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0982 : Poly :=
[
  term ((-198921520 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0982_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0982
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0983 : Poly :=
[
  term ((-16876615721876 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 983 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0983 : Poly :=
[
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0983_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0983
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0984 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 984 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0984 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0984_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0984
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0985 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(7, 2), (8, 1), (11, 2)]
]

/-- Partial product 985 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0985 : Poly :=
[
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (8, 1), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(7, 2), (8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0985_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0985
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0986 : Poly :=
[
  term ((-161932318884 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 986 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0986 : Poly :=
[
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0986_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0986
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0987 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 987 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0987 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0987_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0987
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0988 : Poly :=
[
  term ((196 : Rat) / 67) [(7, 2), (8, 1), (14, 1)]
]

/-- Partial product 988 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0988 : Poly :=
[
  term ((-196 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((392 : Rat) / 67) [(7, 2), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0988_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0988
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0989 : Poly :=
[
  term ((1047453296072 : Rat) / 17452543575) [(7, 2), (8, 1), (15, 2)]
]

/-- Partial product 989 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0989 : Poly :=
[
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (8, 1), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0989_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0989
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0990 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 990 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0990 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 2), (8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0990_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0990
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0991 : Poly :=
[
  term ((-274288457632 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 991 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0991 : Poly :=
[
  term ((-548576915264 : Rat) / 17452543575) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((274288457632 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0991_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0991
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0992 : Poly :=
[
  term ((-77143628709 : Rat) / 11635029050) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 992 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0992 : Poly :=
[
  term ((-77143628709 : Rat) / 5817514525) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((77143628709 : Rat) / 11635029050) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0992_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0992
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0993 : Poly :=
[
  term ((319503958511 : Rat) / 17452543575) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 993 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0993 : Poly :=
[
  term ((639007917022 : Rat) / 17452543575) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-319503958511 : Rat) / 17452543575) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0993_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0993
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0994 : Poly :=
[
  term ((-298382280 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 994 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0994 : Poly :=
[
  term ((-596764560 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((298382280 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0994_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0994
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0995 : Poly :=
[
  term ((8438307860938 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 995 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0995 : Poly :=
[
  term ((16876615721876 : Rat) / 52357630725) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-8438307860938 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0995_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0995
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0996 : Poly :=
[
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 996 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0996 : Poly :=
[
  term ((-2192956060288 : Rat) / 52357630725) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0996_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0996
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0997 : Poly :=
[
  term ((-6365488640 : Rat) / 110226591) [(7, 2), (11, 2)]
]

/-- Partial product 997 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0997 : Poly :=
[
  term ((-12730977280 : Rat) / 110226591) [(7, 2), (8, 1), (11, 2)],
  term ((6365488640 : Rat) / 110226591) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0997_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0997
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0998 : Poly :=
[
  term ((242898478326 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 998 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0998 : Poly :=
[
  term ((485796956652 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-242898478326 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0998_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0998
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0999 : Poly :=
[
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 999 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0999 : Poly :=
[
  term ((-102794815326 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0999_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0999
        rs_R009_ueqv_R009NNNYN_generator_19_0900_0999 =
      rs_R009_ueqv_R009NNNYN_partial_19_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0900_0999 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0900,
  rs_R009_ueqv_R009NNNYN_partial_19_0901,
  rs_R009_ueqv_R009NNNYN_partial_19_0902,
  rs_R009_ueqv_R009NNNYN_partial_19_0903,
  rs_R009_ueqv_R009NNNYN_partial_19_0904,
  rs_R009_ueqv_R009NNNYN_partial_19_0905,
  rs_R009_ueqv_R009NNNYN_partial_19_0906,
  rs_R009_ueqv_R009NNNYN_partial_19_0907,
  rs_R009_ueqv_R009NNNYN_partial_19_0908,
  rs_R009_ueqv_R009NNNYN_partial_19_0909,
  rs_R009_ueqv_R009NNNYN_partial_19_0910,
  rs_R009_ueqv_R009NNNYN_partial_19_0911,
  rs_R009_ueqv_R009NNNYN_partial_19_0912,
  rs_R009_ueqv_R009NNNYN_partial_19_0913,
  rs_R009_ueqv_R009NNNYN_partial_19_0914,
  rs_R009_ueqv_R009NNNYN_partial_19_0915,
  rs_R009_ueqv_R009NNNYN_partial_19_0916,
  rs_R009_ueqv_R009NNNYN_partial_19_0917,
  rs_R009_ueqv_R009NNNYN_partial_19_0918,
  rs_R009_ueqv_R009NNNYN_partial_19_0919,
  rs_R009_ueqv_R009NNNYN_partial_19_0920,
  rs_R009_ueqv_R009NNNYN_partial_19_0921,
  rs_R009_ueqv_R009NNNYN_partial_19_0922,
  rs_R009_ueqv_R009NNNYN_partial_19_0923,
  rs_R009_ueqv_R009NNNYN_partial_19_0924,
  rs_R009_ueqv_R009NNNYN_partial_19_0925,
  rs_R009_ueqv_R009NNNYN_partial_19_0926,
  rs_R009_ueqv_R009NNNYN_partial_19_0927,
  rs_R009_ueqv_R009NNNYN_partial_19_0928,
  rs_R009_ueqv_R009NNNYN_partial_19_0929,
  rs_R009_ueqv_R009NNNYN_partial_19_0930,
  rs_R009_ueqv_R009NNNYN_partial_19_0931,
  rs_R009_ueqv_R009NNNYN_partial_19_0932,
  rs_R009_ueqv_R009NNNYN_partial_19_0933,
  rs_R009_ueqv_R009NNNYN_partial_19_0934,
  rs_R009_ueqv_R009NNNYN_partial_19_0935,
  rs_R009_ueqv_R009NNNYN_partial_19_0936,
  rs_R009_ueqv_R009NNNYN_partial_19_0937,
  rs_R009_ueqv_R009NNNYN_partial_19_0938,
  rs_R009_ueqv_R009NNNYN_partial_19_0939,
  rs_R009_ueqv_R009NNNYN_partial_19_0940,
  rs_R009_ueqv_R009NNNYN_partial_19_0941,
  rs_R009_ueqv_R009NNNYN_partial_19_0942,
  rs_R009_ueqv_R009NNNYN_partial_19_0943,
  rs_R009_ueqv_R009NNNYN_partial_19_0944,
  rs_R009_ueqv_R009NNNYN_partial_19_0945,
  rs_R009_ueqv_R009NNNYN_partial_19_0946,
  rs_R009_ueqv_R009NNNYN_partial_19_0947,
  rs_R009_ueqv_R009NNNYN_partial_19_0948,
  rs_R009_ueqv_R009NNNYN_partial_19_0949,
  rs_R009_ueqv_R009NNNYN_partial_19_0950,
  rs_R009_ueqv_R009NNNYN_partial_19_0951,
  rs_R009_ueqv_R009NNNYN_partial_19_0952,
  rs_R009_ueqv_R009NNNYN_partial_19_0953,
  rs_R009_ueqv_R009NNNYN_partial_19_0954,
  rs_R009_ueqv_R009NNNYN_partial_19_0955,
  rs_R009_ueqv_R009NNNYN_partial_19_0956,
  rs_R009_ueqv_R009NNNYN_partial_19_0957,
  rs_R009_ueqv_R009NNNYN_partial_19_0958,
  rs_R009_ueqv_R009NNNYN_partial_19_0959,
  rs_R009_ueqv_R009NNNYN_partial_19_0960,
  rs_R009_ueqv_R009NNNYN_partial_19_0961,
  rs_R009_ueqv_R009NNNYN_partial_19_0962,
  rs_R009_ueqv_R009NNNYN_partial_19_0963,
  rs_R009_ueqv_R009NNNYN_partial_19_0964,
  rs_R009_ueqv_R009NNNYN_partial_19_0965,
  rs_R009_ueqv_R009NNNYN_partial_19_0966,
  rs_R009_ueqv_R009NNNYN_partial_19_0967,
  rs_R009_ueqv_R009NNNYN_partial_19_0968,
  rs_R009_ueqv_R009NNNYN_partial_19_0969,
  rs_R009_ueqv_R009NNNYN_partial_19_0970,
  rs_R009_ueqv_R009NNNYN_partial_19_0971,
  rs_R009_ueqv_R009NNNYN_partial_19_0972,
  rs_R009_ueqv_R009NNNYN_partial_19_0973,
  rs_R009_ueqv_R009NNNYN_partial_19_0974,
  rs_R009_ueqv_R009NNNYN_partial_19_0975,
  rs_R009_ueqv_R009NNNYN_partial_19_0976,
  rs_R009_ueqv_R009NNNYN_partial_19_0977,
  rs_R009_ueqv_R009NNNYN_partial_19_0978,
  rs_R009_ueqv_R009NNNYN_partial_19_0979,
  rs_R009_ueqv_R009NNNYN_partial_19_0980,
  rs_R009_ueqv_R009NNNYN_partial_19_0981,
  rs_R009_ueqv_R009NNNYN_partial_19_0982,
  rs_R009_ueqv_R009NNNYN_partial_19_0983,
  rs_R009_ueqv_R009NNNYN_partial_19_0984,
  rs_R009_ueqv_R009NNNYN_partial_19_0985,
  rs_R009_ueqv_R009NNNYN_partial_19_0986,
  rs_R009_ueqv_R009NNNYN_partial_19_0987,
  rs_R009_ueqv_R009NNNYN_partial_19_0988,
  rs_R009_ueqv_R009NNNYN_partial_19_0989,
  rs_R009_ueqv_R009NNNYN_partial_19_0990,
  rs_R009_ueqv_R009NNNYN_partial_19_0991,
  rs_R009_ueqv_R009NNNYN_partial_19_0992,
  rs_R009_ueqv_R009NNNYN_partial_19_0993,
  rs_R009_ueqv_R009NNNYN_partial_19_0994,
  rs_R009_ueqv_R009NNNYN_partial_19_0995,
  rs_R009_ueqv_R009NNNYN_partial_19_0996,
  rs_R009_ueqv_R009NNNYN_partial_19_0997,
  rs_R009_ueqv_R009NNNYN_partial_19_0998,
  rs_R009_ueqv_R009NNNYN_partial_19_0999
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0900_0999 : Poly :=
[
  term ((-1477 : Rat) / 134) [(7, 1), (8, 1), (9, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3872865741928 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((548576915264 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((-341092141418 : Rat) / 5817514525) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((77143628709 : Rat) / 5817514525) [(7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((20776803520996 : Rat) / 157072892175) [(7, 1), (8, 1), (9, 1), (15, 2)],
  term ((-639007917022 : Rat) / 17452543575) [(7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 698101743) [(7, 1), (8, 1), (9, 2), (13, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(7, 1), (8, 1), (9, 2), (15, 1)],
  term ((331812484864 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((5184570076 : Rat) / 1163502905) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-299223758672 : Rat) / 31414578435) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((72431879511652 : Rat) / 471218676525) [(7, 1), (8, 1), (11, 1)],
  term ((94030969088 : Rat) / 330679773) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((1559756800 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((28636160 : Rat) / 12247399) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2007998798848 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((413371702912 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14955943040 : Rat) / 110226591) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-9280 : Rat) / 201) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-810187430512 : Rat) / 24800982975) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((1469233892 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((73113600 : Rat) / 12247399) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-82308283048 : Rat) / 330679773) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 67) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1406566400 : Rat) / 110226591) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((889545234193 : Rat) / 17452543575) [(7, 1), (8, 1), (13, 1)],
  term ((-31374981232 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((10967040 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1187500480 : Rat) / 12247399) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-6458932858 : Rat) / 918554925) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((8225280 : Rat) / 12247399) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((1257019399304 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-82564179176 : Rat) / 24800982975) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70328320 : Rat) / 36742197) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-37737424213946 : Rat) / 471218676525) [(7, 1), (8, 1), (15, 1)],
  term ((-121272755524 : Rat) / 24800982975) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((22507001600 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)],
  term ((645102857728 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (11, 1)],
  term ((10079732152 : Rat) / 1163502905) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((-581744541344 : Rat) / 31414578435) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((-1985094405808 : Rat) / 17452543575) [(7, 1), (8, 2), (11, 1)],
  term ((-9216252416 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (12, 1), (15, 2)],
  term ((-160240640 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((1179467201024 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((7614624320 : Rat) / 110226591) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(7, 1), (8, 2), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-432011832 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(7, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((8192632312 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(7, 1), (8, 2), (12, 1), (15, 3)],
  term ((-239885677773 : Rat) / 5817514525) [(7, 1), (8, 2), (13, 1)],
  term ((18429175016 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((5355524320 : Rat) / 110226591) [(7, 1), (8, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-3655680 : Rat) / 12247399) [(7, 1), (8, 2), (13, 2), (15, 1)],
  term ((-773418155152 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(7, 1), (8, 2), (14, 1), (15, 3)],
  term ((426406012428 : Rat) / 5817514525) [(7, 1), (8, 2), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-11297456000 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)],
  term ((1477 : Rat) / 268) [(7, 1), (9, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1936432870964 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-274288457632 : Rat) / 17452543575) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)],
  term ((170546070709 : Rat) / 5817514525) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-77143628709 : Rat) / 11635029050) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 1), (9, 1), (14, 1)],
  term ((-10388401760498 : Rat) / 157072892175) [(7, 1), (9, 1), (15, 2)],
  term ((319503958511 : Rat) / 17452543575) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 698101743) [(7, 1), (9, 2), (13, 1)],
  term ((38452883834 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)],
  term ((-109060652288 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)],
  term ((-5112218076 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)],
  term ((98349338224 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)],
  term ((-22816552516622 : Rat) / 471218676525) [(7, 1), (11, 1)],
  term ((-40103295232 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)],
  term ((-194969600 : Rat) / 36742197) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1675520 : Rat) / 2079747) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((236377533056 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 12247399) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((5574315440 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)],
  term ((1160 : Rat) / 67) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 8266994325) [(7, 1), (11, 1), (16, 1)],
  term ((-48742400 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)],
  term ((-626613988 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)],
  term ((-27417600 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((35009667290 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)],
  term ((-189 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((175820800 : Rat) / 36742197) [(7, 1), (12, 1), (15, 3)],
  term ((-1059433435067 : Rat) / 69810174300) [(7, 1), (13, 1)],
  term ((3693398954 : Rat) / 306184975) [(7, 1), (13, 1), (14, 1)],
  term ((-4112640 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((4004871080 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)],
  term ((-3198720 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)],
  term ((-145051720288 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 12247399) [(7, 1), (14, 1), (15, 3)],
  term ((10233990355306 : Rat) / 471218676525) [(7, 1), (15, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)],
  term ((-8429136800 : Rat) / 110226591) [(7, 1), (15, 3)],
  term ((-948 : Rat) / 67) [(7, 2)],
  term ((2528 : Rat) / 67) [(7, 2), (8, 1)],
  term ((-15362856828928 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-240044637952 : Rat) / 17452543575) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((18214535855444 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-795686080 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 330679773) [(7, 2), (8, 1), (11, 2)],
  term ((647729275536 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (8, 1), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1264 : Rat) / 67) [(7, 2), (8, 2)],
  term ((44102409344 : Rat) / 18848747061) [(7, 2), (8, 2), (9, 1), (11, 1)],
  term ((689100146 : Rat) / 698101743) [(7, 2), (8, 2), (9, 1), (13, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(7, 2), (8, 2), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(7, 2), (8, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(7, 2), (8, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (8, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((274288457632 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 1)],
  term ((77143628709 : Rat) / 11635029050) [(7, 2), (9, 1), (13, 1)],
  term ((-319503958511 : Rat) / 17452543575) [(7, 2), (9, 1), (15, 1)],
  term ((298382280 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)],
  term ((-8438307860938 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((6365488640 : Rat) / 110226591) [(7, 2), (11, 2)],
  term ((-242898478326 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 900 through 999. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0900_0999_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0900_0999
      rs_R009_ueqv_R009NNNYN_block_19_0900_0999 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
