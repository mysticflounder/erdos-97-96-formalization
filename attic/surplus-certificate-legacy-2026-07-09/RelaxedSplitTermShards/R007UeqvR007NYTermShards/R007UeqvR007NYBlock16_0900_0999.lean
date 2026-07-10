/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0900 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)]
]

/-- Partial product 900 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0900 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0900_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0900
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0901 : Poly :=
[
  term ((1468959997657143970795175 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 901 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0901 : Poly :=
[
  term ((1468959997657143970795175 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-1468959997657143970795175 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0901_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0901
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0902 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

/-- Partial product 902 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0902 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0902_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0902
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0903 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0903 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0903_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0903
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0904 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 904 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0904 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0904_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0904
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0905 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 905 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0905 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0905_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0905
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0906 : Poly :=
[
  term ((-2158504548564525558097 : Rat) / 25708658968153583124) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 906 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0906 : Poly :=
[
  term ((-2158504548564525558097 : Rat) / 12854329484076791562) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2158504548564525558097 : Rat) / 25708658968153583124) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0906_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0906
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0907 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

/-- Partial product 907 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0907 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0907_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0907
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0908 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 908 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0908 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0908_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0908
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0909 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 909 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0909 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0909_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0909
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0910 : Poly :=
[
  term ((-576007300291322992497695 : Rat) / 1889586434159288359614) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 910 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0910 : Poly :=
[
  term ((-576007300291322992497695 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((576007300291322992497695 : Rat) / 1889586434159288359614) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0910_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0910
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0911 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 911 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0911 : Poly :=
[
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0911_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0911
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0912 : Poly :=
[
  term ((-488313504099719255063555 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 912 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0912 : Poly :=
[
  term ((-488313504099719255063555 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((488313504099719255063555 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0912_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0912
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0913 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 913 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0913 : Poly :=
[
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0913_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0913
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0914 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 914 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0914 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0914_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0914
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0915 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 915 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0915 : Poly :=
[
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0915_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0915
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0916 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 916 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0916 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0916_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0916
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0917 : Poly :=
[
  term ((115201460058264598499539 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 917 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0917 : Poly :=
[
  term ((115201460058264598499539 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115201460058264598499539 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0917_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0917
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0918 : Poly :=
[
  term ((97662700819943851012711 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0918 : Poly :=
[
  term ((97662700819943851012711 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-97662700819943851012711 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0918_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0918
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0919 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 919 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0919 : Poly :=
[
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0919_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0919
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0920 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 920 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0920 : Poly :=
[
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0920_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0920
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0921 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 921 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0921 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0921_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0921
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0922 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 922 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0922 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0922_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0922
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0923 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 923 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0923 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0923_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0923
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0924 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 924 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0924 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0924_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0924
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0925 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 925 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0925 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0925_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0925
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0926 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 926 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0926 : Poly :=
[
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0926_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0926
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0927 : Poly :=
[
  term ((-908572291007860828366945 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 927 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0927 : Poly :=
[
  term ((-908572291007860828366945 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((908572291007860828366945 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0927_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0927
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0928 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 928 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0928 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0928_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0928
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0929 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 929 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0929 : Poly :=
[
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0929_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0929
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0930 : Poly :=
[
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 930 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0930 : Poly :=
[
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0930_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0930
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0931 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 931 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0931 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0931_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0931
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0932 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)]
]

/-- Partial product 932 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0932 : Poly :=
[
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0932_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0932
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0933 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 933 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0933 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0933_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0933
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0934 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 934 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0934 : Poly :=
[
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0934_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0934
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0935 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 935 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0935 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0935_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0935
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0936 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 936 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0936 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0936_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0936
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0937 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 937 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0937 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0937_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0937
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0938 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 938 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0938 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0938_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0938
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0939 : Poly :=
[
  term ((181714458201572165673389 : Rat) / 1259724289439525573076) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 939 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0939 : Poly :=
[
  term ((181714458201572165673389 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181714458201572165673389 : Rat) / 1259724289439525573076) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0939_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0939
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0940 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 940 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0940 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0940_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0940
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0941 : Poly :=
[
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 941 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0941 : Poly :=
[
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0941_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0941
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0942 : Poly :=
[
  term ((-132123676910245075524621 : Rat) / 419908096479841857692) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 942 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0942 : Poly :=
[
  term ((-132123676910245075524621 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((132123676910245075524621 : Rat) / 419908096479841857692) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0942_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0942
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0943 : Poly :=
[
  term ((417713974344668359354384 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 943 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0943 : Poly :=
[
  term ((835427948689336718708768 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0943_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0943
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0944 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 944 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0944 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0944_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0944
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0945 : Poly :=
[
  term ((-349547988268443381903557 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 945 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0945 : Poly :=
[
  term ((-699095976536886763807114 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((349547988268443381903557 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0945_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0945
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0946 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 946 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0946 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0946_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0946
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0947 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 947 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0947 : Poly :=
[
  term ((-56801412404171544294400 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0947_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0947
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0948 : Poly :=
[
  term ((-243491357909179750872940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 948 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0948 : Poly :=
[
  term ((-486982715818359501745880 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((243491357909179750872940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0948_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0948
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0949 : Poly :=
[
  term ((77226910018192869286972 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 949 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0949 : Poly :=
[
  term ((154453820036385738573944 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77226910018192869286972 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0949_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0949
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0950 : Poly :=
[
  term ((250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 950 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0950 : Poly :=
[
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0950_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0950
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0951 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 951 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0951 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0951_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0951
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0952 : Poly :=
[
  term ((-11901535727169204051993149 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 952 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0952 : Poly :=
[
  term ((-11901535727169204051993149 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11901535727169204051993149 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0952_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0952
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0953 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 953 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0953 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0953_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0953
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0954 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 954 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0954 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0954_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0954
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0955 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0955 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0955_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0955
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0956 : Poly :=
[
  term ((4434388356162278702222297 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0956 : Poly :=
[
  term ((4434388356162278702222297 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4434388356162278702222297 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0956_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0956
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0957 : Poly :=
[
  term ((17535636948842676856 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 957 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0957 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0957_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0957
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0958 : Poly :=
[
  term ((141886494208219968369385 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 958 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0958 : Poly :=
[
  term ((141886494208219968369385 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-141886494208219968369385 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0958_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0958
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0959 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 959 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0959 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0959_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0959
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0960 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 960 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0960 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0960_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0960
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0961 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 961 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0961 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0961_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0961
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0962 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)]
]

/-- Partial product 962 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0962 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0962_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0962
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0963 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 963 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0963 : Poly :=
[
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0963_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0963
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0964 : Poly :=
[
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0964 : Poly :=
[
  term ((8171781109541227530080 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0964_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0964
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0965 : Poly :=
[
  term ((429081995552027977060655 : Rat) / 1889586434159288359614) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 965 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0965 : Poly :=
[
  term ((429081995552027977060655 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-429081995552027977060655 : Rat) / 1889586434159288359614) [(10, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0965_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0965
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0966 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 966 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0966 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0966_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0966
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0967 : Poly :=
[
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 967 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0967 : Poly :=
[
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0967_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0967
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0968 : Poly :=
[
  term ((-1686157619034258508490 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 968 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0968 : Poly :=
[
  term ((-3372315238068517016980 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((1686157619034258508490 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0968_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0968
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0969 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)]
]

/-- Partial product 969 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0969 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0969_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0969
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0970 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 970 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0970 : Poly :=
[
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0970_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0970
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0971 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 971 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0971 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0971_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0971
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0972 : Poly :=
[
  term ((7749331945109087557846 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 972 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0972 : Poly :=
[
  term ((15498663890218175115692 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7749331945109087557846 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0972_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0972
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0973 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)]
]

/-- Partial product 973 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0973 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0973_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0973
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0974 : Poly :=
[
  term ((48698271581835950174588 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 974 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0974 : Poly :=
[
  term ((97396543163671900349176 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48698271581835950174588 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0974_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0974
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0975 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 975 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0975 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0975_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0975
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0976 : Poly :=
[
  term ((-50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 976 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0976 : Poly :=
[
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0976_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0976
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0977 : Poly :=
[
  term ((-18877530069645889420028 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 977 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0977 : Poly :=
[
  term ((-37755060139291778840056 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((18877530069645889420028 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0977_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0977
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0978 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 978 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0978 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0978_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0978
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0979 : Poly :=
[
  term ((127428561889203201043637 : Rat) / 148202857581120655656) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 979 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0979 : Poly :=
[
  term ((127428561889203201043637 : Rat) / 74101428790560327828) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-127428561889203201043637 : Rat) / 148202857581120655656) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0979_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0979
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0980 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 980 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0980 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0980_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0980
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0981 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (14, 1), (15, 4), (16, 1)]
]

/-- Partial product 981 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0981 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (14, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0981_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0981
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0982 : Poly :=
[
  term ((10 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 982 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0982 : Poly :=
[
  term ((20 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0982_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0982
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0983 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(10, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 983 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0983 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((98331284721143428271651 : Rat) / 209954048239920928846) [(10, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0983_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0983
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0984 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 984 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0984 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0984_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0984
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0985 : Poly :=
[
  term ((-888647824642716589227397 : Rat) / 2519448578879051146152) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 985 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0985 : Poly :=
[
  term ((-888647824642716589227397 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((888647824642716589227397 : Rat) / 2519448578879051146152) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0985_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0985
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0986 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)]
]

/-- Partial product 986 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0986 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0986_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0986
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0987 : Poly :=
[
  term ((-3714738678628970189695 : Rat) / 5674433736214079158) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 987 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0987 : Poly :=
[
  term ((-3714738678628970189695 : Rat) / 2837216868107039579) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((3714738678628970189695 : Rat) / 5674433736214079158) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0987_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0987
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0988 : Poly :=
[
  term ((-17 : Rat) / 24) [(10, 1), (16, 1)]
]

/-- Partial product 988 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0988 : Poly :=
[
  term ((-17 : Rat) / 12) [(6, 1), (10, 1), (16, 1)],
  term ((17 : Rat) / 24) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0988_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0988
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0989 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 989 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0989 : Poly :=
[
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0989_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0989
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0990 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 990 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0990 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0990_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0990
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0991 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 991 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0991 : Poly :=
[
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0991_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0991
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0992 : Poly :=
[
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 992 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0992 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0992_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0992
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0993 : Poly :=
[
  term ((-387849765613844851161115 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 993 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0993 : Poly :=
[
  term ((-775699531227689702322230 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((387849765613844851161115 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0993_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0993
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0994 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 994 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0994 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0994_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0994
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0995 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 995 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0995 : Poly :=
[
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0995_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0995
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0996 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)]
]

/-- Partial product 996 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0996 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0996_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0996
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0997 : Poly :=
[
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 997 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0997 : Poly :=
[
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0997_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0997
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0998 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 998 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0998 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0998_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0998
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0999 : Poly :=
[
  term ((80089401701648021378375 : Rat) / 314931072359881393269) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 999 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0999 : Poly :=
[
  term ((160178803403296042756750 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-80089401701648021378375 : Rat) / 314931072359881393269) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0999_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0999
        rs_R007_ueqv_R007NY_generator_16_0900_0999 =
      rs_R007_ueqv_R007NY_partial_16_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0900_0999 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0900,
  rs_R007_ueqv_R007NY_partial_16_0901,
  rs_R007_ueqv_R007NY_partial_16_0902,
  rs_R007_ueqv_R007NY_partial_16_0903,
  rs_R007_ueqv_R007NY_partial_16_0904,
  rs_R007_ueqv_R007NY_partial_16_0905,
  rs_R007_ueqv_R007NY_partial_16_0906,
  rs_R007_ueqv_R007NY_partial_16_0907,
  rs_R007_ueqv_R007NY_partial_16_0908,
  rs_R007_ueqv_R007NY_partial_16_0909,
  rs_R007_ueqv_R007NY_partial_16_0910,
  rs_R007_ueqv_R007NY_partial_16_0911,
  rs_R007_ueqv_R007NY_partial_16_0912,
  rs_R007_ueqv_R007NY_partial_16_0913,
  rs_R007_ueqv_R007NY_partial_16_0914,
  rs_R007_ueqv_R007NY_partial_16_0915,
  rs_R007_ueqv_R007NY_partial_16_0916,
  rs_R007_ueqv_R007NY_partial_16_0917,
  rs_R007_ueqv_R007NY_partial_16_0918,
  rs_R007_ueqv_R007NY_partial_16_0919,
  rs_R007_ueqv_R007NY_partial_16_0920,
  rs_R007_ueqv_R007NY_partial_16_0921,
  rs_R007_ueqv_R007NY_partial_16_0922,
  rs_R007_ueqv_R007NY_partial_16_0923,
  rs_R007_ueqv_R007NY_partial_16_0924,
  rs_R007_ueqv_R007NY_partial_16_0925,
  rs_R007_ueqv_R007NY_partial_16_0926,
  rs_R007_ueqv_R007NY_partial_16_0927,
  rs_R007_ueqv_R007NY_partial_16_0928,
  rs_R007_ueqv_R007NY_partial_16_0929,
  rs_R007_ueqv_R007NY_partial_16_0930,
  rs_R007_ueqv_R007NY_partial_16_0931,
  rs_R007_ueqv_R007NY_partial_16_0932,
  rs_R007_ueqv_R007NY_partial_16_0933,
  rs_R007_ueqv_R007NY_partial_16_0934,
  rs_R007_ueqv_R007NY_partial_16_0935,
  rs_R007_ueqv_R007NY_partial_16_0936,
  rs_R007_ueqv_R007NY_partial_16_0937,
  rs_R007_ueqv_R007NY_partial_16_0938,
  rs_R007_ueqv_R007NY_partial_16_0939,
  rs_R007_ueqv_R007NY_partial_16_0940,
  rs_R007_ueqv_R007NY_partial_16_0941,
  rs_R007_ueqv_R007NY_partial_16_0942,
  rs_R007_ueqv_R007NY_partial_16_0943,
  rs_R007_ueqv_R007NY_partial_16_0944,
  rs_R007_ueqv_R007NY_partial_16_0945,
  rs_R007_ueqv_R007NY_partial_16_0946,
  rs_R007_ueqv_R007NY_partial_16_0947,
  rs_R007_ueqv_R007NY_partial_16_0948,
  rs_R007_ueqv_R007NY_partial_16_0949,
  rs_R007_ueqv_R007NY_partial_16_0950,
  rs_R007_ueqv_R007NY_partial_16_0951,
  rs_R007_ueqv_R007NY_partial_16_0952,
  rs_R007_ueqv_R007NY_partial_16_0953,
  rs_R007_ueqv_R007NY_partial_16_0954,
  rs_R007_ueqv_R007NY_partial_16_0955,
  rs_R007_ueqv_R007NY_partial_16_0956,
  rs_R007_ueqv_R007NY_partial_16_0957,
  rs_R007_ueqv_R007NY_partial_16_0958,
  rs_R007_ueqv_R007NY_partial_16_0959,
  rs_R007_ueqv_R007NY_partial_16_0960,
  rs_R007_ueqv_R007NY_partial_16_0961,
  rs_R007_ueqv_R007NY_partial_16_0962,
  rs_R007_ueqv_R007NY_partial_16_0963,
  rs_R007_ueqv_R007NY_partial_16_0964,
  rs_R007_ueqv_R007NY_partial_16_0965,
  rs_R007_ueqv_R007NY_partial_16_0966,
  rs_R007_ueqv_R007NY_partial_16_0967,
  rs_R007_ueqv_R007NY_partial_16_0968,
  rs_R007_ueqv_R007NY_partial_16_0969,
  rs_R007_ueqv_R007NY_partial_16_0970,
  rs_R007_ueqv_R007NY_partial_16_0971,
  rs_R007_ueqv_R007NY_partial_16_0972,
  rs_R007_ueqv_R007NY_partial_16_0973,
  rs_R007_ueqv_R007NY_partial_16_0974,
  rs_R007_ueqv_R007NY_partial_16_0975,
  rs_R007_ueqv_R007NY_partial_16_0976,
  rs_R007_ueqv_R007NY_partial_16_0977,
  rs_R007_ueqv_R007NY_partial_16_0978,
  rs_R007_ueqv_R007NY_partial_16_0979,
  rs_R007_ueqv_R007NY_partial_16_0980,
  rs_R007_ueqv_R007NY_partial_16_0981,
  rs_R007_ueqv_R007NY_partial_16_0982,
  rs_R007_ueqv_R007NY_partial_16_0983,
  rs_R007_ueqv_R007NY_partial_16_0984,
  rs_R007_ueqv_R007NY_partial_16_0985,
  rs_R007_ueqv_R007NY_partial_16_0986,
  rs_R007_ueqv_R007NY_partial_16_0987,
  rs_R007_ueqv_R007NY_partial_16_0988,
  rs_R007_ueqv_R007NY_partial_16_0989,
  rs_R007_ueqv_R007NY_partial_16_0990,
  rs_R007_ueqv_R007NY_partial_16_0991,
  rs_R007_ueqv_R007NY_partial_16_0992,
  rs_R007_ueqv_R007NY_partial_16_0993,
  rs_R007_ueqv_R007NY_partial_16_0994,
  rs_R007_ueqv_R007NY_partial_16_0995,
  rs_R007_ueqv_R007NY_partial_16_0996,
  rs_R007_ueqv_R007NY_partial_16_0997,
  rs_R007_ueqv_R007NY_partial_16_0998,
  rs_R007_ueqv_R007NY_partial_16_0999
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0900_0999 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (14, 2), (16, 2)],
  term ((1468959997657143970795175 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-2158504548564525558097 : Rat) / 12854329484076791562) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (15, 2), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-576007300291322992497695 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-488313504099719255063555 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((115201460058264598499539 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((97662700819943851012711 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-908572291007860828366945 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((181714458201572165673389 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-132123676910245075524621 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((835427948689336718708768 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-699095976536886763807114 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-56801412404171544294400 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-486982715818359501745880 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((154453820036385738573944 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((501283332760056649923520 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11901535727169204051993149 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4434388356162278702222297 : Rat) / 3779172868318576719228) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((141886494208219968369385 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8171781109541227530080 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((429081995552027977060655 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (14, 1), (16, 2)],
  term ((1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3372315238068517016980 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((15498663890218175115692 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((97396543163671900349176 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-100256666552011329984704 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37755060139291778840056 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((127428561889203201043637 : Rat) / 74101428790560327828) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (14, 1), (15, 4), (16, 1)],
  term ((20 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-888647824642716589227397 : Rat) / 1259724289439525573076) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((-3714738678628970189695 : Rat) / 2837216868107039579) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-17 : Rat) / 12) [(6, 1), (10, 1), (16, 1)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-775699531227689702322230 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 2)],
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((160178803403296042756750 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-1468959997657143970795175 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)],
  term ((2158504548564525558097 : Rat) / 25708658968153583124) [(8, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((576007300291322992497695 : Rat) / 1889586434159288359614) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((488313504099719255063555 : Rat) / 3779172868318576719228) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-115201460058264598499539 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97662700819943851012711 : Rat) / 1259724289439525573076) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((908572291007860828366945 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-181714458201572165673389 : Rat) / 1259724289439525573076) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 419908096479841857692) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)],
  term ((132123676910245075524621 : Rat) / 419908096479841857692) [(9, 1), (15, 3), (16, 1)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((349547988268443381903557 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((243491357909179750872940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-77226910018192869286972 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-250641666380028324961760 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11901535727169204051993149 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4434388356162278702222297 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-141886494208219968369385 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4085890554770613765040 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-429081995552027977060655 : Rat) / 1889586434159288359614) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (14, 1), (16, 2)],
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((1686157619034258508490 : Rat) / 134970459582806311401) [(10, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-7749331945109087557846 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-48698271581835950174588 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((50128333276005664992352 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((18877530069645889420028 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-127428561889203201043637 : Rat) / 148202857581120655656) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-10 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 209954048239920928846) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((888647824642716589227397 : Rat) / 2519448578879051146152) [(10, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)],
  term ((3714738678628970189695 : Rat) / 5674433736214079158) [(10, 1), (15, 4), (16, 1)],
  term ((17 : Rat) / 24) [(10, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((387849765613844851161115 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-80089401701648021378375 : Rat) / 314931072359881393269) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 900 through 999. -/
theorem rs_R007_ueqv_R007NY_block_16_0900_0999_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0900_0999
      rs_R007_ueqv_R007NY_block_16_0900_0999 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
