/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 25:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_25_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0900 : Poly :=
[
  term ((64813826878183053207 : Rat) / 67388272094645211136) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 900 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0900 : Poly :=
[
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 67388272094645211136) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0900_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0900
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0901 : Poly :=
[
  term ((32775332453897373 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 901 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0901 : Poly :=
[
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 18802531276407704) [(3, 2), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0901_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0901
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0902 : Poly :=
[
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 902 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0902 : Poly :=
[
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0902_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0902
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0903 : Poly :=
[
  term ((32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0903 : Poly :=
[
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0903_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0903
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0904 : Poly :=
[
  term ((-3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 904 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0904 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0904_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0904
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0905 : Poly :=
[
  term ((3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 905 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0905 : Poly :=
[
  term ((3957604484499008181 : Rat) / 300840500422523264) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0905_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0905
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0906 : Poly :=
[
  term ((3957604484499008181 : Rat) / 2406724003380186112) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 906 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0906 : Poly :=
[
  term ((3957604484499008181 : Rat) / 1203362001690093056) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0906_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0906
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0907 : Poly :=
[
  term ((-10925110817965791 : Rat) / 21488607173037376) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 907 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0907 : Poly :=
[
  term ((10925110817965791 : Rat) / 21488607173037376) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 10744303586518688) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0907_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0907
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0908 : Poly :=
[
  term ((3641703605988597 : Rat) / 15833710548553856) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0908 : Poly :=
[
  term ((3641703605988597 : Rat) / 7916855274276928) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 15833710548553856) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0908_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0908
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0909 : Poly :=
[
  term ((-445605421004027789823 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 909 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0909 : Poly :=
[
  term ((-445605421004027789823 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((445605421004027789823 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0909_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0909
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0910 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 910 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0910 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0910_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0910
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0911 : Poly :=
[
  term ((-363534495967615059 : Rat) / 75210125105630816) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 911 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0911 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0911_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0911
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0912 : Poly :=
[
  term ((333796423576923 : Rat) / 852239377967488) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 912 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0912 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0912_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0912
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0913 : Poly :=
[
  term ((189249266256953440737 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 913 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0913 : Poly :=
[
  term ((-189249266256953440737 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((189249266256953440737 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0913_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0913
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0914 : Poly :=
[
  term ((-202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 914 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0914 : Poly :=
[
  term ((-202821220773077736273 : Rat) / 4211767005915325696) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0914_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0914
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0915 : Poly :=
[
  term ((-216393175289202031809 : Rat) / 33694136047322605568) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 915 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0915 : Poly :=
[
  term ((-216393175289202031809 : Rat) / 16847068023661302784) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 33694136047322605568) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0915_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0915
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0916 : Poly :=
[
  term ((117517146838215837 : Rat) / 23862702583089664) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0916 : Poly :=
[
  term ((-117517146838215837 : Rat) / 23862702583089664) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((117517146838215837 : Rat) / 11931351291544832) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0916_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0916
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0917 : Poly :=
[
  term ((-115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 917 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0917 : Poly :=
[
  term ((-115959430194856863 : Rat) / 5965675645772416) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0917_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0917
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0918 : Poly :=
[
  term ((-9950570892537 : Rat) / 4151118132224) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0918 : Poly :=
[
  term ((-9950570892537 : Rat) / 2075559066112) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 4151118132224) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0918_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0918
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0919 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0919 : Poly :=
[
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 18802531276407704) [(3, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0919_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0919
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0920 : Poly :=
[
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 920 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0920 : Poly :=
[
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0920_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0920
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0921 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0921 : Poly :=
[
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0921_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0921
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0922 : Poly :=
[
  term ((1001389270730769 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 922 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0922 : Poly :=
[
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 213059844491872) [(3, 2), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0922_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0922
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0923 : Poly :=
[
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 923 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0923 : Poly :=
[
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0923_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0923
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0924 : Poly :=
[
  term ((1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 924 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0924 : Poly :=
[
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0924_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0924
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0925 : Poly :=
[
  term ((229065469986269019 : Rat) / 9401265638203852) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0925 : Poly :=
[
  term ((-229065469986269019 : Rat) / 9401265638203852) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((229065469986269019 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0925_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0925
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0926 : Poly :=
[
  term ((-6783609333156224271 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 926 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0926 : Poly :=
[
  term ((-6783609333156224271 : Rat) / 150420250211261632) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6783609333156224271 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0926_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0926
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0927 : Poly :=
[
  term ((2581590417798103325053 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0927 : Poly :=
[
  term ((2581590417798103325053 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2581590417798103325053 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0927_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0927
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0928 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 928 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0928 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0928_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0928
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0929 : Poly :=
[
  term ((18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 929 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0929 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0929_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0929
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0930 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 930 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0930 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 150420250211261632) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0930_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0930
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0931 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 1203362001690093056) [(3, 2), (11, 2), (16, 1)]
]

/-- Partial product 931 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0931 : Poly :=
[
  term ((-18310457117411443123 : Rat) / 601681000845046528) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0931_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0931
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0932 : Poly :=
[
  term ((-333796423576923 : Rat) / 243496965133568) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 932 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0932 : Poly :=
[
  term ((333796423576923 : Rat) / 243496965133568) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 121748482566784) [(3, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0932_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0932
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0933 : Poly :=
[
  term ((-9184513182051 : Rat) / 15218560320848) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 933 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0933 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0933_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0933
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0934 : Poly :=
[
  term ((111265474525641 : Rat) / 179418816414208) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 934 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0934 : Poly :=
[
  term ((111265474525641 : Rat) / 89709408207104) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 179418816414208) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0934_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0934
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0935 : Poly :=
[
  term ((9184513182051 : Rat) / 7609280160424) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 935 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0935 : Poly :=
[
  term ((9184513182051 : Rat) / 3804640080212) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0935_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0935
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0936 : Poly :=
[
  term ((1843255146058948737 : Rat) / 47725405166179328) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 936 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0936 : Poly :=
[
  term ((1843255146058948737 : Rat) / 23862702583089664) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1843255146058948737 : Rat) / 47725405166179328) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0936_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0936
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0937 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 4), (16, 1)]
]

/-- Partial product 937 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0937 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (12, 1), (15, 4), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0937_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0937
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0938 : Poly :=
[
  term ((9184513182051 : Rat) / 30437120641696) [(3, 2), (16, 1)]
]

/-- Partial product 938 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0938 : Poly :=
[
  term ((9184513182051 : Rat) / 15218560320848) [(3, 2), (12, 1), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0938_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0938
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0939 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 939 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0939 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0939_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0939
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0940 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 940 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0940 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0940_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0940
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0941 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 941 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0941 : Poly :=
[
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0941_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0941
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0942 : Poly :=
[
  term ((1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 942 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0942 : Poly :=
[
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0942_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0942
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0943 : Poly :=
[
  term ((-4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 943 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0943 : Poly :=
[
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0943_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0943
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0944 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 944 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0944 : Poly :=
[
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0944_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0944
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0945 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 945 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0945 : Poly :=
[
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0945_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0945
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0946 : Poly :=
[
  term ((349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 946 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0946 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0946_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0946
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0947 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 947 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0947 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0947_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0947
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0948 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 948 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0948 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0948_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0948
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0949 : Poly :=
[
  term ((19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 949 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0949 : Poly :=
[
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0949_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0949
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0950 : Poly :=
[
  term ((-14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 950 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0950 : Poly :=
[
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0950_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0950
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0951 : Poly :=
[
  term ((-5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 951 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0951 : Poly :=
[
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0951_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0951
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0952 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)]
]

/-- Partial product 952 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0952 : Poly :=
[
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (12, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0952_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0952
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0953 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 953 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0953 : Poly :=
[
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0953_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0953
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0954 : Poly :=
[
  term ((19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 954 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0954 : Poly :=
[
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0954_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0954
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0955 : Poly :=
[
  term ((1107235993498623 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 955 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0955 : Poly :=
[
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0955_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0955
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0956 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)]
]

/-- Partial product 956 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0956 : Poly :=
[
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0956_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0956
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0957 : Poly :=
[
  term ((-687416978686223 : Rat) / 852239377967488) [(4, 1), (16, 1)]
]

/-- Partial product 957 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0957 : Poly :=
[
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (12, 1), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0957_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0957
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0958 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 958 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0958 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0958_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0958
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0959 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 959 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0959 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0959_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0959
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0960 : Poly :=
[
  term ((1131981620148025515 : Rat) / 253339368776861696) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0960 : Poly :=
[
  term ((1131981620148025515 : Rat) / 126669684388430848) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1131981620148025515 : Rat) / 253339368776861696) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0960_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0960
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0961 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 961 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0961 : Poly :=
[
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0961_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0961
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0962 : Poly :=
[
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 962 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0962 : Poly :=
[
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0962_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0962
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0963 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 963 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0963 : Poly :=
[
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0963_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0963
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0964 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0964 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0964_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0964
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0965 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 965 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0965 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0965_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0965
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0966 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 966 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0966 : Poly :=
[
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0966_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0966
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0967 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 967 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0967 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0967_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0967
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0968 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 968 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0968 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0968_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0968
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0969 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 969 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0969 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0969_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0969
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0970 : Poly :=
[
  term ((-88350020071216760397 : Rat) / 3546751162876063744) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0970 : Poly :=
[
  term ((-88350020071216760397 : Rat) / 1773375581438031872) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((88350020071216760397 : Rat) / 3546751162876063744) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0970_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0970
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0971 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 971 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0971 : Poly :=
[
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0971_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0971
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0972 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 972 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0972 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0972_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0972
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0973 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 973 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0973 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0973_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0973
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0974 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 974 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0974 : Poly :=
[
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0974_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0974
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0975 : Poly :=
[
  term ((38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 975 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0975 : Poly :=
[
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0975_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0975
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0976 : Poly :=
[
  term ((-25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 976 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0976 : Poly :=
[
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0976_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0976
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0977 : Poly :=
[
  term ((72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 977 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0977 : Poly :=
[
  term ((72827507826175085451 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0977_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0977
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0978 : Poly :=
[
  term ((67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 978 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0978 : Poly :=
[
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0978_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0978
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0979 : Poly :=
[
  term ((203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 979 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0979 : Poly :=
[
  term ((203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0979_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0979
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0980 : Poly :=
[
  term ((-2160372413405955622791 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 980 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0980 : Poly :=
[
  term ((-2160372413405955622791 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((2160372413405955622791 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0980_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0980
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0981 : Poly :=
[
  term ((-178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 981 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0981 : Poly :=
[
  term ((-178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0981_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0981
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0982 : Poly :=
[
  term ((-299589886819264479531 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 982 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0982 : Poly :=
[
  term ((-299589886819264479531 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((299589886819264479531 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0982_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0982
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0983 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 983 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0983 : Poly :=
[
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0983_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0983
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0984 : Poly :=
[
  term ((12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 984 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0984 : Poly :=
[
  term ((12853999827937751211 : Rat) / 263235437869707856) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0984_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0984
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0985 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 985 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0985 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0985_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0985
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0986 : Poly :=
[
  term ((-100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 986 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0986 : Poly :=
[
  term ((-100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0986_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0986
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0987 : Poly :=
[
  term ((-775441778766081882075 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 987 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0987 : Poly :=
[
  term ((-775441778766081882075 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((775441778766081882075 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0987_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0987
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0988 : Poly :=
[
  term ((20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 988 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0988 : Poly :=
[
  term ((20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0988_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0988
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0989 : Poly :=
[
  term ((-1673937723461147019 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 989 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0989 : Poly :=
[
  term ((-1673937723461147019 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1673937723461147019 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0989_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0989
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0990 : Poly :=
[
  term ((-874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 990 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0990 : Poly :=
[
  term ((-874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0990_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0990
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0991 : Poly :=
[
  term ((4243949762484177073 : Rat) / 526470875739415712) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 991 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0991 : Poly :=
[
  term ((4243949762484177073 : Rat) / 263235437869707856) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4243949762484177073 : Rat) / 526470875739415712) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0991_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0991
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0992 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 992 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0992 : Poly :=
[
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0992_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0992
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0993 : Poly :=
[
  term ((-60610506476765628627 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 993 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0993 : Poly :=
[
  term ((60610506476765628627 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60610506476765628627 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0993_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0993
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0994 : Poly :=
[
  term ((59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 994 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0994 : Poly :=
[
  term ((59854582444141895889 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0994_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0994
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0995 : Poly :=
[
  term ((134878587531268410503 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 995 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0995 : Poly :=
[
  term ((134878587531268410503 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-134878587531268410503 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0995_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0995
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0996 : Poly :=
[
  term ((61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 996 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0996 : Poly :=
[
  term ((61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0996_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0996
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0997 : Poly :=
[
  term ((-1983764228028597216829 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 997 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0997 : Poly :=
[
  term ((-1983764228028597216829 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1983764228028597216829 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0997_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0997
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0998 : Poly :=
[
  term ((4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (11, 1), (16, 1)]
]

/-- Partial product 998 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0998 : Poly :=
[
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0998_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0998
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYY_coefficient_25_0999 : Poly :=
[
  term ((-67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

/-- Partial product 999 for generator 25. -/
def rs_R010_ueqv_R010NYY_partial_25_0999 : Poly :=
[
  term ((-67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 25. -/
theorem rs_R010_ueqv_R010NYY_partial_25_0999_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_25_0999
        rs_R010_ueqv_R010NYY_generator_25_0900_0999 =
      rs_R010_ueqv_R010NYY_partial_25_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_25_0900_0999 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_25_0900,
  rs_R010_ueqv_R010NYY_partial_25_0901,
  rs_R010_ueqv_R010NYY_partial_25_0902,
  rs_R010_ueqv_R010NYY_partial_25_0903,
  rs_R010_ueqv_R010NYY_partial_25_0904,
  rs_R010_ueqv_R010NYY_partial_25_0905,
  rs_R010_ueqv_R010NYY_partial_25_0906,
  rs_R010_ueqv_R010NYY_partial_25_0907,
  rs_R010_ueqv_R010NYY_partial_25_0908,
  rs_R010_ueqv_R010NYY_partial_25_0909,
  rs_R010_ueqv_R010NYY_partial_25_0910,
  rs_R010_ueqv_R010NYY_partial_25_0911,
  rs_R010_ueqv_R010NYY_partial_25_0912,
  rs_R010_ueqv_R010NYY_partial_25_0913,
  rs_R010_ueqv_R010NYY_partial_25_0914,
  rs_R010_ueqv_R010NYY_partial_25_0915,
  rs_R010_ueqv_R010NYY_partial_25_0916,
  rs_R010_ueqv_R010NYY_partial_25_0917,
  rs_R010_ueqv_R010NYY_partial_25_0918,
  rs_R010_ueqv_R010NYY_partial_25_0919,
  rs_R010_ueqv_R010NYY_partial_25_0920,
  rs_R010_ueqv_R010NYY_partial_25_0921,
  rs_R010_ueqv_R010NYY_partial_25_0922,
  rs_R010_ueqv_R010NYY_partial_25_0923,
  rs_R010_ueqv_R010NYY_partial_25_0924,
  rs_R010_ueqv_R010NYY_partial_25_0925,
  rs_R010_ueqv_R010NYY_partial_25_0926,
  rs_R010_ueqv_R010NYY_partial_25_0927,
  rs_R010_ueqv_R010NYY_partial_25_0928,
  rs_R010_ueqv_R010NYY_partial_25_0929,
  rs_R010_ueqv_R010NYY_partial_25_0930,
  rs_R010_ueqv_R010NYY_partial_25_0931,
  rs_R010_ueqv_R010NYY_partial_25_0932,
  rs_R010_ueqv_R010NYY_partial_25_0933,
  rs_R010_ueqv_R010NYY_partial_25_0934,
  rs_R010_ueqv_R010NYY_partial_25_0935,
  rs_R010_ueqv_R010NYY_partial_25_0936,
  rs_R010_ueqv_R010NYY_partial_25_0937,
  rs_R010_ueqv_R010NYY_partial_25_0938,
  rs_R010_ueqv_R010NYY_partial_25_0939,
  rs_R010_ueqv_R010NYY_partial_25_0940,
  rs_R010_ueqv_R010NYY_partial_25_0941,
  rs_R010_ueqv_R010NYY_partial_25_0942,
  rs_R010_ueqv_R010NYY_partial_25_0943,
  rs_R010_ueqv_R010NYY_partial_25_0944,
  rs_R010_ueqv_R010NYY_partial_25_0945,
  rs_R010_ueqv_R010NYY_partial_25_0946,
  rs_R010_ueqv_R010NYY_partial_25_0947,
  rs_R010_ueqv_R010NYY_partial_25_0948,
  rs_R010_ueqv_R010NYY_partial_25_0949,
  rs_R010_ueqv_R010NYY_partial_25_0950,
  rs_R010_ueqv_R010NYY_partial_25_0951,
  rs_R010_ueqv_R010NYY_partial_25_0952,
  rs_R010_ueqv_R010NYY_partial_25_0953,
  rs_R010_ueqv_R010NYY_partial_25_0954,
  rs_R010_ueqv_R010NYY_partial_25_0955,
  rs_R010_ueqv_R010NYY_partial_25_0956,
  rs_R010_ueqv_R010NYY_partial_25_0957,
  rs_R010_ueqv_R010NYY_partial_25_0958,
  rs_R010_ueqv_R010NYY_partial_25_0959,
  rs_R010_ueqv_R010NYY_partial_25_0960,
  rs_R010_ueqv_R010NYY_partial_25_0961,
  rs_R010_ueqv_R010NYY_partial_25_0962,
  rs_R010_ueqv_R010NYY_partial_25_0963,
  rs_R010_ueqv_R010NYY_partial_25_0964,
  rs_R010_ueqv_R010NYY_partial_25_0965,
  rs_R010_ueqv_R010NYY_partial_25_0966,
  rs_R010_ueqv_R010NYY_partial_25_0967,
  rs_R010_ueqv_R010NYY_partial_25_0968,
  rs_R010_ueqv_R010NYY_partial_25_0969,
  rs_R010_ueqv_R010NYY_partial_25_0970,
  rs_R010_ueqv_R010NYY_partial_25_0971,
  rs_R010_ueqv_R010NYY_partial_25_0972,
  rs_R010_ueqv_R010NYY_partial_25_0973,
  rs_R010_ueqv_R010NYY_partial_25_0974,
  rs_R010_ueqv_R010NYY_partial_25_0975,
  rs_R010_ueqv_R010NYY_partial_25_0976,
  rs_R010_ueqv_R010NYY_partial_25_0977,
  rs_R010_ueqv_R010NYY_partial_25_0978,
  rs_R010_ueqv_R010NYY_partial_25_0979,
  rs_R010_ueqv_R010NYY_partial_25_0980,
  rs_R010_ueqv_R010NYY_partial_25_0981,
  rs_R010_ueqv_R010NYY_partial_25_0982,
  rs_R010_ueqv_R010NYY_partial_25_0983,
  rs_R010_ueqv_R010NYY_partial_25_0984,
  rs_R010_ueqv_R010NYY_partial_25_0985,
  rs_R010_ueqv_R010NYY_partial_25_0986,
  rs_R010_ueqv_R010NYY_partial_25_0987,
  rs_R010_ueqv_R010NYY_partial_25_0988,
  rs_R010_ueqv_R010NYY_partial_25_0989,
  rs_R010_ueqv_R010NYY_partial_25_0990,
  rs_R010_ueqv_R010NYY_partial_25_0991,
  rs_R010_ueqv_R010NYY_partial_25_0992,
  rs_R010_ueqv_R010NYY_partial_25_0993,
  rs_R010_ueqv_R010NYY_partial_25_0994,
  rs_R010_ueqv_R010NYY_partial_25_0995,
  rs_R010_ueqv_R010NYY_partial_25_0996,
  rs_R010_ueqv_R010NYY_partial_25_0997,
  rs_R010_ueqv_R010NYY_partial_25_0998,
  rs_R010_ueqv_R010NYY_partial_25_0999
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_25_0900_0999 : Poly :=
[
  term ((64813826878183053207 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-64813826878183053207 : Rat) / 67388272094645211136) [(3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 37605062552815408) [(3, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 18802531276407704) [(3, 2), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((32775332453897373 : Rat) / 75210125105630816) [(3, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32775332453897373 : Rat) / 150420250211261632) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 300840500422523264) [(3, 2), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3957604484499008181 : Rat) / 601681000845046528) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3957604484499008181 : Rat) / 2406724003380186112) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((3641703605988597 : Rat) / 7916855274276928) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-437040134122742609679 : Rat) / 16847068023661302784) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 2), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10925110817965791 : Rat) / 10744303586518688) [(3, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3641703605988597 : Rat) / 15833710548553856) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((445605421004027789823 : Rat) / 33694136047322605568) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 75210125105630816) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(3, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 852239377967488) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-202821220773077736273 : Rat) / 4211767005915325696) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((189249266256953440737 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((202821220773077736273 : Rat) / 8423534011830651392) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((216393175289202031809 : Rat) / 33694136047322605568) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 5965675645772416) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((117517146838215837 : Rat) / 11931351291544832) [(3, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((115959430194856863 : Rat) / 11931351291544832) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9950570892537 : Rat) / 4151118132224) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 37605062552815408) [(3, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 18802531276407704) [(3, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1090603487902845177 : Rat) / 75210125105630816) [(3, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1090603487902845177 : Rat) / 150420250211261632) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1001389270730769 : Rat) / 426119688983744) [(3, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 213059844491872) [(3, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1001389270730769 : Rat) / 852239377967488) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1001389270730769 : Rat) / 1704478755934976) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6783609333156224271 : Rat) / 150420250211261632) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2376347756690406284029 : Rat) / 8423534011830651392) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((229065469986269019 : Rat) / 4700632819101926) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6783609333156224271 : Rat) / 300840500422523264) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2581590417798103325053 : Rat) / 16847068023661302784) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-18310457117411443123 : Rat) / 150420250211261632) [(3, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (12, 2), (16, 1)],
  term ((18310457117411443123 : Rat) / 300840500422523264) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((18310457117411443123 : Rat) / 1203362001690093056) [(3, 2), (11, 2), (16, 1)],
  term ((111265474525641 : Rat) / 89709408207104) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9184513182051 : Rat) / 3804640080212) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((1875967195569487191 : Rat) / 23862702583089664) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 2), (12, 1), (15, 4), (16, 1)],
  term ((9184513182051 : Rat) / 7609280160424) [(3, 2), (12, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 121748482566784) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (12, 2), (16, 1)],
  term ((-111265474525641 : Rat) / 179418816414208) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9184513182051 : Rat) / 7609280160424) [(3, 2), (14, 1), (16, 1)],
  term ((-1843255146058948737 : Rat) / 47725405166179328) [(3, 2), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 2), (15, 4), (16, 1)],
  term ((-9184513182051 : Rat) / 30437120641696) [(3, 2), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 4813448006760372224) [(4, 1), (5, 1), (9, 1), (16, 1)],
  term ((1380205666669678263 : Rat) / 601681000845046528) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4140617000009034789 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1380205666669678263 : Rat) / 1203362001690093056) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((4140617000009034789 : Rat) / 2406724003380186112) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(4, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(4, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(4, 1), (8, 1), (14, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 1704478755934976) [(4, 1), (8, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 3610086005070279168) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 7220172010140558336) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14849754300339743 : Rat) / 852239377967488) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5087188770349899 : Rat) / 1704478755934976) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((14849754300339743 : Rat) / 1704478755934976) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((5087188770349899 : Rat) / 3408957511869952) [(4, 1), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 426119688983744) [(4, 1), (10, 2), (12, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(4, 1), (10, 2), (16, 1)],
  term ((-19399593724902554291 : Rat) / 902521501267569792) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 601681000845046528) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((19399593724902554291 : Rat) / 1805043002535139584) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19399593724902554291 : Rat) / 1203362001690093056) [(4, 1), (11, 2), (16, 1)],
  term ((1107235993498623 : Rat) / 213059844491872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-687416978686223 : Rat) / 426119688983744) [(4, 1), (12, 1), (16, 1)],
  term ((-1107235993498623 : Rat) / 426119688983744) [(4, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(4, 1), (14, 2), (16, 1)],
  term ((687416978686223 : Rat) / 852239377967488) [(4, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (6, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1131981620148025515 : Rat) / 126669684388430848) [(5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1131981620148025515 : Rat) / 253339368776861696) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-614669487801636391401 : Rat) / 33694136047322605568) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((614669487801636391401 : Rat) / 67388272094645211136) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88350020071216760397 : Rat) / 1773375581438031872) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((88350020071216760397 : Rat) / 3546751162876063744) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 16847068023661302784) [(5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((38018171745318956481 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-38018171745318956481 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-25147896414168381129 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((72827507826175085451 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25147896414168381129 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-72827507826175085451 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((203492515558960879305 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160372413405955622791 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-178872171380073971187 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-840145341599554350867 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-203492515558960879305 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160372413405955622791 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((178872171380073971187 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((299589886819264479531 : Rat) / 134776544189290422272) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 263235437869707856) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((12853999827937751211 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-12853999827937751211 : Rat) / 526470875739415712) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-100963211346141388395 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-775441778766081882075 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((100963211346141388395 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((775441778766081882075 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((20734671327282335259 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1673937723461147019 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-874307256106446507873 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4243949762484177073 : Rat) / 263235437869707856) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-20734671327282335259 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1673937723461147019 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((874307256106446507873 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4243949762484177073 : Rat) / 526470875739415712) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 1052941751478831424) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((59854582444141895889 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((134878587531268410503 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((61366430509389361365 : Rat) / 8423534011830651392) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1741322202121534702321 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60610506476765628627 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-59854582444141895889 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-134878587531268410503 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-61366430509389361365 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((1983764228028597216829 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((4249056461351911479 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (12, 1), (16, 1)],
  term ((-4249056461351911479 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-67569431847536233917 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((67569431847536233917 : Rat) / 8423534011830651392) [(5, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 900 through 999. -/
theorem rs_R010_ueqv_R010NYY_block_25_0900_0999_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_25_0900_0999
      rs_R010_ueqv_R010NYY_block_25_0900_0999 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
