/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 3:200-271

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_03_0200_0271 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(10, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0200 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 200 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0200 : Poly :=
[
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0200_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0200
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0201 : Poly :=
[
  term ((-77624851076961995007805 : Rat) / 629862144719762786538) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0201 : Poly :=
[
  term ((77624851076961995007805 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 629862144719762786538) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 629862144719762786538) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((77624851076961995007805 : Rat) / 629862144719762786538) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((77624851076961995007805 : Rat) / 629862144719762786538) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0201_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0201
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0202 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 202 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0202 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 4), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0202_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0202
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0203 : Poly :=
[
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0203 : Poly :=
[
  term ((10331129566226114205377 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10331129566226114205377 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0203_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0203
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0204 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 204 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0204 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0204_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0204
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0205 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 205 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0205 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0205_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0205
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0206 : Poly :=
[
  term ((-852862751213748265253 : Rat) / 3528639466217158468) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0206 : Poly :=
[
  term ((852862751213748265253 : Rat) / 1764319733108579234) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-852862751213748265253 : Rat) / 3528639466217158468) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-852862751213748265253 : Rat) / 3528639466217158468) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-852862751213748265253 : Rat) / 1764319733108579234) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((852862751213748265253 : Rat) / 3528639466217158468) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((852862751213748265253 : Rat) / 3528639466217158468) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0206_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0206
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0207 : Poly :=
[
  term ((15524970215392399001561 : Rat) / 209954048239920928846) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0207 : Poly :=
[
  term ((-15524970215392399001561 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15524970215392399001561 : Rat) / 209954048239920928846) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15524970215392399001561 : Rat) / 209954048239920928846) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0207_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0207
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0208 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 208 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0208 : Poly :=
[
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0208_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0208
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0209 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0209 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((522142467930835449192980 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0209_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0209
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0210 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 210 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0210 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0210_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0210
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0211 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0211 : Poly :=
[
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-142003531010428860736000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0211_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0211
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0212 : Poly :=
[
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0212 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0212_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0212
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0213 : Poly :=
[
  term ((-5385802306754996318761075 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0213 : Poly :=
[
  term ((5385802306754996318761075 : Rat) / 1889586434159288359614) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5385802306754996318761075 : Rat) / 3779172868318576719228) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5385802306754996318761075 : Rat) / 3779172868318576719228) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5385802306754996318761075 : Rat) / 3779172868318576719228) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5385802306754996318761075 : Rat) / 1889586434159288359614) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((5385802306754996318761075 : Rat) / 3779172868318576719228) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0213_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0213
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0214 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 214 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0214 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0214_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0214
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0215 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 215 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0215 : Poly :=
[
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-104428493586167089838596 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0215_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0215
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0216 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)]
]

/-- Partial product 216 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0216 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 3), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0216_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0216
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0217 : Poly :=
[
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0217 : Poly :=
[
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-408589055477061376504 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0217_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0217
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0218 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0218 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((28400706202085772147200 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0218_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0218
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0219 : Poly :=
[
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0219 : Poly :=
[
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0219_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0219
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0220 : Poly :=
[
  term ((1087238255666515468336823 : Rat) / 1259724289439525573076) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0220 : Poly :=
[
  term ((-1087238255666515468336823 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1087238255666515468336823 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((1087238255666515468336823 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1087238255666515468336823 : Rat) / 1259724289439525573076) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((1087238255666515468336823 : Rat) / 629862144719762786538) [(10, 2), (15, 2), (16, 1)],
  term ((-1087238255666515468336823 : Rat) / 1259724289439525573076) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0220_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0220
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0221 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)]
]

/-- Partial product 221 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0221 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 2), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 3), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0221_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0221
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0222 : Poly :=
[
  term ((-3 : Rat) / 8) [(10, 1), (16, 1)]
]

/-- Partial product 222 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0222 : Poly :=
[
  term ((3 : Rat) / 4) [(6, 1), (10, 1), (16, 1)],
  term ((-3 : Rat) / 8) [(6, 2), (10, 1), (16, 1)],
  term ((-3 : Rat) / 8) [(7, 2), (10, 1), (16, 1)],
  term ((3 : Rat) / 8) [(10, 1), (11, 2), (16, 1)],
  term ((-3 : Rat) / 4) [(10, 2), (16, 1)],
  term ((3 : Rat) / 8) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0222_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0222
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0223 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0223 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0223_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0223
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0224 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 224 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0224 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0224_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0224
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0225 : Poly :=
[
  term ((248645925002005199282090 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0225 : Poly :=
[
  term ((-497291850004010398564180 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((248645925002005199282090 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((248645925002005199282090 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((497291850004010398564180 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248645925002005199282090 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-248645925002005199282090 : Rat) / 944793217079644179807) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0225_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0225
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0226 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 226 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0226 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0226_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0226
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0227 : Poly :=
[
  term ((-8603498964787048499123 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0227 : Poly :=
[
  term ((8603498964787048499123 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8603498964787048499123 : Rat) / 539881838331225245604) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8603498964787048499123 : Rat) / 539881838331225245604) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8603498964787048499123 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8603498964787048499123 : Rat) / 539881838331225245604) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8603498964787048499123 : Rat) / 539881838331225245604) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0227_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0227
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0228 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 228 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0228 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0228_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0228
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0229 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0229 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0229_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0229
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0230 : Poly :=
[
  term ((-7949234228252697834215 : Rat) / 38562988452230374686) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0230 : Poly :=
[
  term ((7949234228252697834215 : Rat) / 19281494226115187343) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 38562988452230374686) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 38562988452230374686) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 19281494226115187343) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7949234228252697834215 : Rat) / 38562988452230374686) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7949234228252697834215 : Rat) / 38562988452230374686) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0230_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0230
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0231 : Poly :=
[
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 231 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0231 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0231_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0231
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0232 : Poly :=
[
  term ((102077527945017919915772 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0232 : Poly :=
[
  term ((-204155055890035839831544 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((102077527945017919915772 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((102077527945017919915772 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((204155055890035839831544 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-102077527945017919915772 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-102077527945017919915772 : Rat) / 944793217079644179807) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0232_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0232
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0233 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 233 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0233 : Poly :=
[
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 3779172868318576719228) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 3779172868318576719228) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0233_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0233
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0234 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0234 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 14996717731422923489) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 14996717731422923489) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0234_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0234
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0235 : Poly :=
[
  term ((-18978883451836250506535359 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0235 : Poly :=
[
  term ((18978883451836250506535359 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 7558345736637153438456) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 7558345736637153438456) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18978883451836250506535359 : Rat) / 7558345736637153438456) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18978883451836250506535359 : Rat) / 7558345736637153438456) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0235_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0235
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0236 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 236 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0236 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 3), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0236_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0236
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0237 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 237 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0237 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0237_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0237
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0238 : Poly :=
[
  term ((70607492543908720218965 : Rat) / 134970459582806311401) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0238 : Poly :=
[
  term ((-141214985087817440437930 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((70607492543908720218965 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((70607492543908720218965 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((141214985087817440437930 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70607492543908720218965 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-70607492543908720218965 : Rat) / 134970459582806311401) [(11, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0238_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0238
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0239 : Poly :=
[
  term ((5399278034697356332774639 : Rat) / 15116691473274306876912) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0239 : Poly :=
[
  term ((-5399278034697356332774639 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 15116691473274306876912) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 15116691473274306876912) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5399278034697356332774639 : Rat) / 15116691473274306876912) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5399278034697356332774639 : Rat) / 15116691473274306876912) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0239_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0239
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0240 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

/-- Partial product 240 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0240 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 3), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0240_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0240
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0241 : Poly :=
[
  term ((282648378006805885004645 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 241 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0241 : Poly :=
[
  term ((-565296756013611770009290 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((282648378006805885004645 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((282648378006805885004645 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((565296756013611770009290 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-282648378006805885004645 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-282648378006805885004645 : Rat) / 944793217079644179807) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0241_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0241
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0242 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 242 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0242 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0242_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0242
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0243 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

/-- Partial product 243 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0243 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (12, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 4), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0243_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0243
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0244 : Poly :=
[
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0244 : Poly :=
[
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14557554620716147571360 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7278777310358073785680 : Rat) / 44990153194268770467) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7278777310358073785680 : Rat) / 44990153194268770467) [(11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0244_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0244
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0245 : Poly :=
[
  term ((586536223644218204682775 : Rat) / 539881838331225245604) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 245 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0245 : Poly :=
[
  term ((-586536223644218204682775 : Rat) / 269940919165612622802) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((586536223644218204682775 : Rat) / 539881838331225245604) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((586536223644218204682775 : Rat) / 539881838331225245604) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((586536223644218204682775 : Rat) / 269940919165612622802) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-586536223644218204682775 : Rat) / 539881838331225245604) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((-586536223644218204682775 : Rat) / 539881838331225245604) [(11, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0245_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0245
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0246 : Poly :=
[
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0246 : Poly :=
[
  term ((-462156714234215633682100 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((462156714234215633682100 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0246_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0246
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0247 : Poly :=
[
  term ((18617513510241294538660 : Rat) / 104977024119960464423) [(11, 2), (16, 1)]
]

/-- Partial product 247 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0247 : Poly :=
[
  term ((-37235027020482589077320 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (16, 1)],
  term ((18617513510241294538660 : Rat) / 104977024119960464423) [(6, 2), (11, 2), (16, 1)],
  term ((18617513510241294538660 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (16, 1)],
  term ((37235027020482589077320 : Rat) / 104977024119960464423) [(10, 1), (11, 2), (16, 1)],
  term ((-18617513510241294538660 : Rat) / 104977024119960464423) [(10, 2), (11, 2), (16, 1)],
  term ((-18617513510241294538660 : Rat) / 104977024119960464423) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0247_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0247
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0248 : Poly :=
[
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

/-- Partial product 248 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0248 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (16, 2)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0248_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0248
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0249 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0249 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0249_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0249
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0250 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0250 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0250_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0250
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0251 : Poly :=
[
  term ((-49729185000401039856418 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0251 : Poly :=
[
  term ((99458370000802079712836 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49729185000401039856418 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-49729185000401039856418 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-99458370000802079712836 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((49729185000401039856418 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((49729185000401039856418 : Rat) / 314931072359881393269) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0251_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0251
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0252 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 252 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0252 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0252_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0252
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0253 : Poly :=
[
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 253 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0253 : Poly :=
[
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0253_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0253
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0254 : Poly :=
[
  term ((43373446626551994850351 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0254 : Poly :=
[
  term ((-43373446626551994850351 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((43373446626551994850351 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((43373446626551994850351 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((43373446626551994850351 : Rat) / 629862144719762786538) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-43373446626551994850351 : Rat) / 1259724289439525573076) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-43373446626551994850351 : Rat) / 1259724289439525573076) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0254_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0254
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0255 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

/-- Partial product 255 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0255 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(11, 2), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0255_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0255
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0256 : Poly :=
[
  term ((-5 : Rat) / 6) [(12, 1), (16, 1)]
]

/-- Partial product 256 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0256 : Poly :=
[
  term ((5 : Rat) / 3) [(6, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(6, 2), (12, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(7, 2), (12, 1), (16, 1)],
  term ((-5 : Rat) / 3) [(10, 1), (12, 1), (16, 1)],
  term ((5 : Rat) / 6) [(10, 2), (12, 1), (16, 1)],
  term ((5 : Rat) / 6) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0256_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0256
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0257 : Poly :=
[
  term ((1589846845650539566843 : Rat) / 12854329484076791562) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0257 : Poly :=
[
  term ((-1589846845650539566843 : Rat) / 6427164742038395781) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 12854329484076791562) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 12854329484076791562) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 6427164742038395781) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1589846845650539566843 : Rat) / 12854329484076791562) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1589846845650539566843 : Rat) / 12854329484076791562) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0257_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0257
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0258 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 258 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0258 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0258_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0258
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0259 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0259 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0259_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0259
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0260 : Poly :=
[
  term ((-11333911041112807127353 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 260 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0260 : Poly :=
[
  term ((11333911041112807127353 : Rat) / 629862144719762786538) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 1259724289439525573076) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 1259724289439525573076) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 629862144719762786538) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((11333911041112807127353 : Rat) / 1259724289439525573076) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((11333911041112807127353 : Rat) / 1259724289439525573076) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0260_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0260
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0261 : Poly :=
[
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 261 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0261 : Poly :=
[
  term ((2095028346546266482328 : Rat) / 8511650604321118737) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2095028346546266482328 : Rat) / 8511650604321118737) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1047514173273133241164 : Rat) / 8511650604321118737) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((1047514173273133241164 : Rat) / 8511650604321118737) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0261_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0261
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0262 : Poly :=
[
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0262 : Poly :=
[
  term ((4260105930312865822080 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4260105930312865822080 : Rat) / 14996717731422923489) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0262_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0262
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0263 : Poly :=
[
  term ((2814426952371169999273853 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0263 : Poly :=
[
  term ((-2814426952371169999273853 : Rat) / 1259724289439525573076) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 2519448578879051146152) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 2519448578879051146152) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 1259724289439525573076) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2814426952371169999273853 : Rat) / 2519448578879051146152) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2814426952371169999273853 : Rat) / 2519448578879051146152) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0263_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0263
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0264 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)]
]

/-- Partial product 264 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0264 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(11, 2), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0264_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0264
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0265 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(14, 1), (15, 4), (16, 1)]
]

/-- Partial product 265 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0265 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (14, 1), (15, 4), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (14, 1), (15, 4), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (14, 1), (15, 4), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (14, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0265_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0265
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0266 : Poly :=
[
  term ((5 : Rat) / 8) [(14, 1), (16, 1)]
]

/-- Partial product 266 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0266 : Poly :=
[
  term ((-5 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 8) [(6, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 8) [(7, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 4) [(10, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 8) [(10, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 8) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0266_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0266
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0267 : Poly :=
[
  term ((-14121498508781744043793 : Rat) / 44990153194268770467) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0267 : Poly :=
[
  term ((28242997017563488087586 : Rat) / 44990153194268770467) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-14121498508781744043793 : Rat) / 44990153194268770467) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-14121498508781744043793 : Rat) / 44990153194268770467) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-28242997017563488087586 : Rat) / 44990153194268770467) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((14121498508781744043793 : Rat) / 44990153194268770467) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((14121498508781744043793 : Rat) / 44990153194268770467) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0267_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0267
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0268 : Poly :=
[
  term ((-1426424799708047474158339 : Rat) / 5038897157758102292304) [(15, 2), (16, 1)]
]

/-- Partial product 268 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0268 : Poly :=
[
  term ((1426424799708047474158339 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 5038897157758102292304) [(6, 2), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 5038897157758102292304) [(7, 2), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 2519448578879051146152) [(10, 1), (15, 2), (16, 1)],
  term ((1426424799708047474158339 : Rat) / 5038897157758102292304) [(10, 2), (15, 2), (16, 1)],
  term ((1426424799708047474158339 : Rat) / 5038897157758102292304) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0268_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0268
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0269 : Poly :=
[
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

/-- Partial product 269 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0269 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(11, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0269_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0269
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0270 : Poly :=
[
  term ((-19959697737645713009101 : Rat) / 44990153194268770467) [(15, 4), (16, 1)]
]

/-- Partial product 270 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0270 : Poly :=
[
  term ((39919395475291426018202 : Rat) / 44990153194268770467) [(6, 1), (15, 4), (16, 1)],
  term ((-19959697737645713009101 : Rat) / 44990153194268770467) [(6, 2), (15, 4), (16, 1)],
  term ((-19959697737645713009101 : Rat) / 44990153194268770467) [(7, 2), (15, 4), (16, 1)],
  term ((-39919395475291426018202 : Rat) / 44990153194268770467) [(10, 1), (15, 4), (16, 1)],
  term ((19959697737645713009101 : Rat) / 44990153194268770467) [(10, 2), (15, 4), (16, 1)],
  term ((19959697737645713009101 : Rat) / 44990153194268770467) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0270_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0270
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 3. -/
def rs_R007_ueqv_R007NY_coefficient_03_0271 : Poly :=
[
  term ((-1 : Rat) / 24) [(16, 1)]
]

/-- Partial product 271 for generator 3. -/
def rs_R007_ueqv_R007NY_partial_03_0271 : Poly :=
[
  term ((1 : Rat) / 12) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 24) [(6, 2), (16, 1)],
  term ((-1 : Rat) / 24) [(7, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(10, 1), (16, 1)],
  term ((1 : Rat) / 24) [(10, 2), (16, 1)],
  term ((1 : Rat) / 24) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 3. -/
theorem rs_R007_ueqv_R007NY_partial_03_0271_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_03_0271
        rs_R007_ueqv_R007NY_generator_03_0200_0271 =
      rs_R007_ueqv_R007NY_partial_03_0271 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_03_0200_0271 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_03_0200,
  rs_R007_ueqv_R007NY_partial_03_0201,
  rs_R007_ueqv_R007NY_partial_03_0202,
  rs_R007_ueqv_R007NY_partial_03_0203,
  rs_R007_ueqv_R007NY_partial_03_0204,
  rs_R007_ueqv_R007NY_partial_03_0205,
  rs_R007_ueqv_R007NY_partial_03_0206,
  rs_R007_ueqv_R007NY_partial_03_0207,
  rs_R007_ueqv_R007NY_partial_03_0208,
  rs_R007_ueqv_R007NY_partial_03_0209,
  rs_R007_ueqv_R007NY_partial_03_0210,
  rs_R007_ueqv_R007NY_partial_03_0211,
  rs_R007_ueqv_R007NY_partial_03_0212,
  rs_R007_ueqv_R007NY_partial_03_0213,
  rs_R007_ueqv_R007NY_partial_03_0214,
  rs_R007_ueqv_R007NY_partial_03_0215,
  rs_R007_ueqv_R007NY_partial_03_0216,
  rs_R007_ueqv_R007NY_partial_03_0217,
  rs_R007_ueqv_R007NY_partial_03_0218,
  rs_R007_ueqv_R007NY_partial_03_0219,
  rs_R007_ueqv_R007NY_partial_03_0220,
  rs_R007_ueqv_R007NY_partial_03_0221,
  rs_R007_ueqv_R007NY_partial_03_0222,
  rs_R007_ueqv_R007NY_partial_03_0223,
  rs_R007_ueqv_R007NY_partial_03_0224,
  rs_R007_ueqv_R007NY_partial_03_0225,
  rs_R007_ueqv_R007NY_partial_03_0226,
  rs_R007_ueqv_R007NY_partial_03_0227,
  rs_R007_ueqv_R007NY_partial_03_0228,
  rs_R007_ueqv_R007NY_partial_03_0229,
  rs_R007_ueqv_R007NY_partial_03_0230,
  rs_R007_ueqv_R007NY_partial_03_0231,
  rs_R007_ueqv_R007NY_partial_03_0232,
  rs_R007_ueqv_R007NY_partial_03_0233,
  rs_R007_ueqv_R007NY_partial_03_0234,
  rs_R007_ueqv_R007NY_partial_03_0235,
  rs_R007_ueqv_R007NY_partial_03_0236,
  rs_R007_ueqv_R007NY_partial_03_0237,
  rs_R007_ueqv_R007NY_partial_03_0238,
  rs_R007_ueqv_R007NY_partial_03_0239,
  rs_R007_ueqv_R007NY_partial_03_0240,
  rs_R007_ueqv_R007NY_partial_03_0241,
  rs_R007_ueqv_R007NY_partial_03_0242,
  rs_R007_ueqv_R007NY_partial_03_0243,
  rs_R007_ueqv_R007NY_partial_03_0244,
  rs_R007_ueqv_R007NY_partial_03_0245,
  rs_R007_ueqv_R007NY_partial_03_0246,
  rs_R007_ueqv_R007NY_partial_03_0247,
  rs_R007_ueqv_R007NY_partial_03_0248,
  rs_R007_ueqv_R007NY_partial_03_0249,
  rs_R007_ueqv_R007NY_partial_03_0250,
  rs_R007_ueqv_R007NY_partial_03_0251,
  rs_R007_ueqv_R007NY_partial_03_0252,
  rs_R007_ueqv_R007NY_partial_03_0253,
  rs_R007_ueqv_R007NY_partial_03_0254,
  rs_R007_ueqv_R007NY_partial_03_0255,
  rs_R007_ueqv_R007NY_partial_03_0256,
  rs_R007_ueqv_R007NY_partial_03_0257,
  rs_R007_ueqv_R007NY_partial_03_0258,
  rs_R007_ueqv_R007NY_partial_03_0259,
  rs_R007_ueqv_R007NY_partial_03_0260,
  rs_R007_ueqv_R007NY_partial_03_0261,
  rs_R007_ueqv_R007NY_partial_03_0262,
  rs_R007_ueqv_R007NY_partial_03_0263,
  rs_R007_ueqv_R007NY_partial_03_0264,
  rs_R007_ueqv_R007NY_partial_03_0265,
  rs_R007_ueqv_R007NY_partial_03_0266,
  rs_R007_ueqv_R007NY_partial_03_0267,
  rs_R007_ueqv_R007NY_partial_03_0268,
  rs_R007_ueqv_R007NY_partial_03_0269,
  rs_R007_ueqv_R007NY_partial_03_0270,
  rs_R007_ueqv_R007NY_partial_03_0271
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_03_0200_0271 : Poly :=
[
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((77624851076961995007805 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((10331129566226114205377 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((852862751213748265253 : Rat) / 1764319733108579234) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15524970215392399001561 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5385802306754996318761075 : Rat) / 1889586434159288359614) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1087238255666515468336823 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((3 : Rat) / 4) [(6, 1), (10, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-497291850004010398564180 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((8603498964787048499123 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7949234228252697834215 : Rat) / 19281494226115187343) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-204155055890035839831544 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 14996717731422923489) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((18978883451836250506535359 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-141214985087817440437930 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5399278034697356332774639 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((-565296756013611770009290 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((-14557554620716147571360 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-586536223644218204682775 : Rat) / 269940919165612622802) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-462156714234215633682100 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-37235027020482589077320 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99458370000802079712836 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-43373446626551994850351 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((5 : Rat) / 3) [(6, 1), (12, 1), (16, 1)],
  term ((-1589846845650539566843 : Rat) / 6427164742038395781) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11333911041112807127353 : Rat) / 629862144719762786538) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2095028346546266482328 : Rat) / 8511650604321118737) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((4260105930312865822080 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2814426952371169999273853 : Rat) / 1259724289439525573076) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 4) [(6, 1), (14, 1), (16, 1)],
  term ((28242997017563488087586 : Rat) / 44990153194268770467) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1426424799708047474158339 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((39919395475291426018202 : Rat) / 44990153194268770467) [(6, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 12) [(6, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 629862144719762786538) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-852862751213748265253 : Rat) / 3528639466217158468) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5385802306754996318761075 : Rat) / 3779172868318576719228) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((1087238255666515468336823 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (15, 2), (16, 2)],
  term ((-3 : Rat) / 8) [(6, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((248645925002005199282090 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8603498964787048499123 : Rat) / 539881838331225245604) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 38562988452230374686) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((102077527945017919915772 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 7558345736637153438456) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((70607492543908720218965 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 15116691473274306876912) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((282648378006805885004645 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((586536223644218204682775 : Rat) / 539881838331225245604) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((18617513510241294538660 : Rat) / 104977024119960464423) [(6, 2), (11, 2), (16, 1)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49729185000401039856418 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((43373446626551994850351 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((-5 : Rat) / 6) [(6, 2), (12, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 12854329484076791562) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 1259724289439525573076) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 2519448578879051146152) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (14, 1), (15, 2), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (14, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 8) [(6, 2), (14, 1), (16, 1)],
  term ((-14121498508781744043793 : Rat) / 44990153194268770467) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 5038897157758102292304) [(6, 2), (15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((-19959697737645713009101 : Rat) / 44990153194268770467) [(6, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 24) [(6, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 629862144719762786538) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-10331129566226114205377 : Rat) / 1259724289439525573076) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-852862751213748265253 : Rat) / 3528639466217158468) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5385802306754996318761075 : Rat) / 3779172868318576719228) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((1087238255666515468336823 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (15, 2), (16, 2)],
  term ((-3 : Rat) / 8) [(7, 2), (10, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((248645925002005199282090 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8603498964787048499123 : Rat) / 539881838331225245604) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 38562988452230374686) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((102077527945017919915772 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 14996717731422923489) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 7558345736637153438456) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((70607492543908720218965 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 15116691473274306876912) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((282648378006805885004645 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 1889586434159288359614) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((7278777310358073785680 : Rat) / 44990153194268770467) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((586536223644218204682775 : Rat) / 539881838331225245604) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((18617513510241294538660 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (16, 1)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49729185000401039856418 : Rat) / 314931072359881393269) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((43373446626551994850351 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((-5 : Rat) / 6) [(7, 2), (12, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 12854329484076791562) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 1259724289439525573076) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1047514173273133241164 : Rat) / 8511650604321118737) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 2519448578879051146152) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (14, 1), (15, 2), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (14, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 8) [(7, 2), (14, 1), (16, 1)],
  term ((-14121498508781744043793 : Rat) / 44990153194268770467) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 5038897157758102292304) [(7, 2), (15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((-19959697737645713009101 : Rat) / 44990153194268770467) [(7, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 24) [(7, 2), (16, 1)],
  term ((440412256367483585082070 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-77624851076961995007805 : Rat) / 314931072359881393269) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-10331129566226114205377 : Rat) / 629862144719762786538) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-852862751213748265253 : Rat) / 1764319733108579234) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((15524970215392399001561 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-88082451273496717016414 : Rat) / 104977024119960464423) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((77624851076961995007805 : Rat) / 629862144719762786538) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 2)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((852862751213748265253 : Rat) / 3528639466217158468) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15524970215392399001561 : Rat) / 209954048239920928846) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((10331129566226114205377 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)],
  term ((852862751213748265253 : Rat) / 3528639466217158468) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15524970215392399001561 : Rat) / 209954048239920928846) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((77624851076961995007805 : Rat) / 629862144719762786538) [(9, 1), (11, 3), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 4), (13, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((497291850004010398564180 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8603498964787048499123 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7949234228252697834215 : Rat) / 19281494226115187343) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((204155055890035839831544 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 14996717731422923489) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18978883451836250506535359 : Rat) / 3779172868318576719228) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((141214985087817440437930 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5399278034697356332774639 : Rat) / 7558345736637153438456) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)],
  term ((565296756013611770009290 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (12, 1), (16, 2)],
  term ((2108835592636382608516 : Rat) / 6427164742038395781) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((586356263031441129600907 : Rat) / 269940919165612622802) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((761388601270347066391577 : Rat) / 1259724289439525573076) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 2), (15, 2), (16, 2)],
  term ((298195147236220594011829 : Rat) / 839816192959683715384) [(10, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 1), (11, 2), (16, 2)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((5385802306754996318761075 : Rat) / 3779172868318576719228) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (15, 1), (16, 2)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99458370000802079712836 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((1 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((43373446626551994850351 : Rat) / 629862144719762786538) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-5 : Rat) / 3) [(10, 1), (12, 1), (16, 1)],
  term ((1589846845650539566843 : Rat) / 6427164742038395781) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11333911041112807127353 : Rat) / 629862144719762786538) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2095028346546266482328 : Rat) / 8511650604321118737) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4260105930312865822080 : Rat) / 14996717731422923489) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2814426952371169999273853 : Rat) / 1259724289439525573076) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (14, 1), (15, 2), (16, 2)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(10, 1), (14, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 4) [(10, 1), (14, 1), (16, 1)],
  term ((-28242997017563488087586 : Rat) / 44990153194268770467) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1426424799708047474158339 : Rat) / 2519448578879051146152) [(10, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)],
  term ((-39919395475291426018202 : Rat) / 44990153194268770467) [(10, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 12) [(10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-248645925002005199282090 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((2148794364476851136265781 : Rat) / 3779172868318576719228) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7949234228252697834215 : Rat) / 38562988452230374686) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-365367415006006648355924 : Rat) / 314931072359881393269) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-516857679975047570435 : Rat) / 3779172868318576719228) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((18978883451836250506535359 : Rat) / 7558345736637153438456) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-70607492543908720218965 : Rat) / 134970459582806311401) [(10, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16161898829579108960954413 : Rat) / 5038897157758102292304) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-282648378006805885004645 : Rat) / 944793217079644179807) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(10, 2), (11, 2), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (12, 1), (16, 2)],
  term ((-7278777310358073785680 : Rat) / 44990153194268770467) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-586536223644218204682775 : Rat) / 539881838331225245604) [(10, 2), (11, 2), (14, 1), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-18617513510241294538660 : Rat) / 104977024119960464423) [(10, 2), (11, 2), (16, 1)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(10, 2), (11, 2), (16, 2)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49729185000401039856418 : Rat) / 314931072359881393269) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-1 : Rat) / 6) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-461087420971220354204735 : Rat) / 1259724289439525573076) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 63635294475627681) [(10, 2), (12, 1), (15, 2), (16, 2)],
  term ((5 : Rat) / 6) [(10, 2), (12, 1), (16, 1)],
  term ((-1589846845650539566843 : Rat) / 12854329484076791562) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(10, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35527504081637138253 : Rat) / 419908096479841857692) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((79187655941902111651156 : Rat) / 104977024119960464423) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2814426952371169999273853 : Rat) / 2519448578879051146152) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (14, 1), (15, 2), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(10, 2), (14, 1), (15, 4), (16, 1)],
  term ((17 : Rat) / 24) [(10, 2), (14, 1), (16, 1)],
  term ((14121498508781744043793 : Rat) / 44990153194268770467) [(10, 2), (14, 2), (15, 2), (16, 1)],
  term ((39090080482780583864297 : Rat) / 19455201381305414256) [(10, 2), (15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 63635294475627681) [(10, 2), (15, 2), (16, 2)],
  term ((19959697737645713009101 : Rat) / 44990153194268770467) [(10, 2), (15, 4), (16, 1)],
  term ((-17 : Rat) / 24) [(10, 2), (16, 1)],
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (16, 1)],
  term ((5385802306754996318761075 : Rat) / 3779172868318576719228) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (15, 1), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 3), (12, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 3), (12, 1), (15, 2), (16, 2)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 3), (14, 1), (16, 1)],
  term ((-1087238255666515468336823 : Rat) / 1259724289439525573076) [(10, 3), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 3), (15, 2), (16, 2)],
  term ((3 : Rat) / 8) [(10, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49729185000401039856418 : Rat) / 314931072359881393269) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-1 : Rat) / 6) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-43373446626551994850351 : Rat) / 1259724289439525573076) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(11, 2), (12, 1), (15, 2), (16, 2)],
  term ((5 : Rat) / 6) [(11, 2), (12, 1), (16, 1)],
  term ((-1589846845650539566843 : Rat) / 12854329484076791562) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11333911041112807127353 : Rat) / 1259724289439525573076) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1047514173273133241164 : Rat) / 8511650604321118737) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2814426952371169999273853 : Rat) / 2519448578879051146152) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(11, 2), (14, 1), (15, 2), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 2), (14, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 8) [(11, 2), (14, 1), (16, 1)],
  term ((14121498508781744043793 : Rat) / 44990153194268770467) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((1426424799708047474158339 : Rat) / 5038897157758102292304) [(11, 2), (15, 2), (16, 1)],
  term ((4383909237210669214 : Rat) / 445447061329393767) [(11, 2), (15, 2), (16, 2)],
  term ((19959697737645713009101 : Rat) / 44990153194268770467) [(11, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 24) [(11, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-248645925002005199282090 : Rat) / 944793217079644179807) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((8603498964787048499123 : Rat) / 539881838331225245604) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 3), (12, 1), (15, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((7949234228252697834215 : Rat) / 38562988452230374686) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-102077527945017919915772 : Rat) / 944793217079644179807) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 3779172868318576719228) [(11, 3), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 14996717731422923489) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((18978883451836250506535359 : Rat) / 7558345736637153438456) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 3), (14, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 3), (14, 1), (15, 3), (16, 1)],
  term ((-70607492543908720218965 : Rat) / 134970459582806311401) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((-5399278034697356332774639 : Rat) / 15116691473274306876912) [(11, 3), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 3), (15, 1), (16, 2)],
  term ((-282648378006805885004645 : Rat) / 944793217079644179807) [(11, 3), (15, 3), (16, 1)],
  term ((130535616982708862298245 : Rat) / 1889586434159288359614) [(11, 4), (12, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 4), (12, 1), (16, 2)],
  term ((-7278777310358073785680 : Rat) / 44990153194268770467) [(11, 4), (13, 1), (15, 1), (16, 1)],
  term ((-586536223644218204682775 : Rat) / 539881838331225245604) [(11, 4), (14, 1), (16, 1)],
  term ((-231078357117107816841050 : Rat) / 314931072359881393269) [(11, 4), (15, 2), (16, 1)],
  term ((-18617513510241294538660 : Rat) / 104977024119960464423) [(11, 4), (16, 1)],
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 271. -/
theorem rs_R007_ueqv_R007NY_block_03_0200_0271_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_03_0200_0271
      rs_R007_ueqv_R007NY_block_03_0200_0271 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
