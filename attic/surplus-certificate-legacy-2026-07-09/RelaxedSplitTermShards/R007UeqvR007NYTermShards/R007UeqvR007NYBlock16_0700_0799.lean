/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:700-799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0700 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 700 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0700 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0700_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0700
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0701 : Poly :=
[
  term ((-208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 701 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0701 : Poly :=
[
  term ((208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0701_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0701
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0702 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 702 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0702 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0702_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0702
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0703 : Poly :=
[
  term ((56801412404171544294400 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 703 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0703 : Poly :=
[
  term ((-56801412404171544294400 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((113602824808343088588800 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0703_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0703
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0704 : Poly :=
[
  term ((49683767853098034304552 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 704 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0704 : Poly :=
[
  term ((-49683767853098034304552 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((99367535706196068609104 : Rat) / 104977024119960464423) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0704_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0704
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0705 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 705 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0705 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0705_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0705
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0706 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 706 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0706 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0706_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0706
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0707 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)]
]

/-- Partial product 707 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0707 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0707_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0707
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0708 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 708 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0708 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0708_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0708
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0709 : Poly :=
[
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 709 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0709 : Poly :=
[
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(6, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0709_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0709
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0710 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)]
]

/-- Partial product 710 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0710 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0710_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0710
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0711 : Poly :=
[
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 711 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0711 : Poly :=
[
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0711_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0711
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0712 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)]
]

/-- Partial product 712 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0712 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0712_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0712
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0713 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 713 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0713 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0713_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0713
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0714 : Poly :=
[
  term ((-114202949224229667866971 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 714 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0714 : Poly :=
[
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0714_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0714
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0715 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)]
]

/-- Partial product 715 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0715 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0715_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0715
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0716 : Poly :=
[
  term ((-208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 716 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0716 : Poly :=
[
  term ((208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0716_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0716
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0717 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 717 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0717 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0717_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0717
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0718 : Poly :=
[
  term ((373400031734152280469002 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 718 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0718 : Poly :=
[
  term ((-373400031734152280469002 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((746800063468304560938004 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0718_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0718
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0719 : Poly :=
[
  term ((-11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 719 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0719 : Poly :=
[
  term ((11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22720564961668617717760 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0719_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0719
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0720 : Poly :=
[
  term ((-25108189427249510310872 : Rat) / 104977024119960464423) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 720 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0720 : Poly :=
[
  term ((25108189427249510310872 : Rat) / 104977024119960464423) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50216378854499020621744 : Rat) / 104977024119960464423) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0720_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0720
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0721 : Poly :=
[
  term ((-15620388411147174680960 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 721 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0721 : Poly :=
[
  term ((15620388411147174680960 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-31240776822294349361920 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0721_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0721
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0722 : Poly :=
[
  term ((3393586370048458804014845 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 722 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0722 : Poly :=
[
  term ((-3393586370048458804014845 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3393586370048458804014845 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0722_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0722
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0723 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 723 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0723 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0723_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0723
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0724 : Poly :=
[
  term ((11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 724 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0724 : Poly :=
[
  term ((-11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((22720564961668617717760 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0724_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0724
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0725 : Poly :=
[
  term ((-1868294409701725137161369 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 725 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0725 : Poly :=
[
  term ((1868294409701725137161369 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1868294409701725137161369 : Rat) / 1889586434159288359614) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0725_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0725
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0726 : Poly :=
[
  term ((3515139514795022312629007 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 726 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0726 : Poly :=
[
  term ((-3515139514795022312629007 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3515139514795022312629007 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0726_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0726
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0727 : Poly :=
[
  term ((-21886418134494293792561 : Rat) / 74101428790560327828) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 727 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0727 : Poly :=
[
  term ((21886418134494293792561 : Rat) / 74101428790560327828) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-21886418134494293792561 : Rat) / 37050714395280163914) [(6, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0727_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0727
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0728 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 728 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0728 : Poly :=
[
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0728_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0728
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0729 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 729 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0729 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0729_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0729
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0730 : Poly :=
[
  term ((-33890332367480180923155 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 730 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0730 : Poly :=
[
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(6, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0730_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0730
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0731 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 731 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0731 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0731_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0731
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0732 : Poly :=
[
  term ((123715309774699488981046 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 732 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0732 : Poly :=
[
  term ((-123715309774699488981046 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((247430619549398977962092 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0732_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0732
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0733 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 733 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0733 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0733_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0733
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0734 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 734 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0734 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0734_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0734
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0735 : Poly :=
[
  term ((447838849983708083881256 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 735 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0735 : Poly :=
[
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((895677699967416167762512 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0735_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0735
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0736 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)]
]

/-- Partial product 736 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0736 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0736_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0736
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0737 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1259724289439525573076) [(6, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 737 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0737 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0737_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0737
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0738 : Poly :=
[
  term ((-57556149515238564284645 : Rat) / 179960612777075081868) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 738 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0738 : Poly :=
[
  term ((57556149515238564284645 : Rat) / 179960612777075081868) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-57556149515238564284645 : Rat) / 89980306388537540934) [(6, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0738_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0738
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0739 : Poly :=
[
  term ((-925375973099013186532681 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 739 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0739 : Poly :=
[
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (16, 1)],
  term ((-925375973099013186532681 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0739_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0739
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0740 : Poly :=
[
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 740 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0740 : Poly :=
[
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0740_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0740
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0741 : Poly :=
[
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 741 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0741 : Poly :=
[
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0741_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0741
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0742 : Poly :=
[
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 742 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0742 : Poly :=
[
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0742_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0742
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0743 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 743 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0743 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0743_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0743
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0744 : Poly :=
[
  term ((-38078447389951860696793 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 744 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0744 : Poly :=
[
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0744_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0744
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0745 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 745 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0745 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0745_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0745
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0746 : Poly :=
[
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 746 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0746 : Poly :=
[
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(6, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0746_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0746
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0747 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 747 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0747 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0747_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0747
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0748 : Poly :=
[
  term ((-786904043607867835255393 : Rat) / 629862144719762786538) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 748 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0748 : Poly :=
[
  term ((786904043607867835255393 : Rat) / 629862144719762786538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-786904043607867835255393 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0748_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0748
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0749 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 749 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0749 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0749_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0749
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0750 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 1), (15, 4), (16, 1)]
]

/-- Partial product 750 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0750 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (14, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0750_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0750
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0751 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 751 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0751 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(6, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0751_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0751
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0752 : Poly :=
[
  term ((-255253022565610686688271 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 752 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0752 : Poly :=
[
  term ((255253022565610686688271 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((-255253022565610686688271 : Rat) / 1259724289439525573076) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0752_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0752
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0753 : Poly :=
[
  term ((44742851912608733634349 : Rat) / 209954048239920928846) [(6, 1), (15, 4), (16, 1)]
]

/-- Partial product 753 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0753 : Poly :=
[
  term ((-44742851912608733634349 : Rat) / 209954048239920928846) [(6, 1), (15, 4), (16, 1)],
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(6, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0753_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0753
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0754 : Poly :=
[
  term ((-1 : Rat) / 6) [(6, 1), (16, 1)]
]

/-- Partial product 754 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0754 : Poly :=
[
  term ((1 : Rat) / 6) [(6, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0754_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0754
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0755 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 755 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0755 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0755_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0755
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0756 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 756 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0756 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0756_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0756
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0757 : Poly :=
[
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 757 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0757 : Poly :=
[
  term ((-1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0757_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0757
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0758 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 758 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0758 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0758_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0758
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0759 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 759 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0759 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0759_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0759
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0760 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 760 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0760 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0760_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0760
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0761 : Poly :=
[
  term ((106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 761 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0761 : Poly :=
[
  term ((212735596171439970453248 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0761_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0761
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0762 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 762 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0762 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0762_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0762
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0763 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 2)]
]

/-- Partial product 763 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0763 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0763_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0763
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0764 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 2)]
]

/-- Partial product 764 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0764 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0764_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0764
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0765 : Poly :=
[
  term ((-621895339116652432671605 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 765 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0765 : Poly :=
[
  term ((-621895339116652432671605 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((621895339116652432671605 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0765_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0765
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0766 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 766 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0766 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0766_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0766
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0767 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 767 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0767 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0767_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0767
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0768 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 2)]
]

/-- Partial product 768 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0768 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0768_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0768
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0769 : Poly :=
[
  term ((94613257385466819010790 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 769 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0769 : Poly :=
[
  term ((189226514770933638021580 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-94613257385466819010790 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0769_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0769
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0770 : Poly :=
[
  term ((124379067823330486534321 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 770 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0770 : Poly :=
[
  term ((124379067823330486534321 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124379067823330486534321 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0770_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0770
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0771 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 771 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0771 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0771_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0771
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0772 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 772 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0772 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0772_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0772
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0773 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 773 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0773 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0773_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0773
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0774 : Poly :=
[
  term ((-18922651477093363802158 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 774 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0774 : Poly :=
[
  term ((-37845302954186727604316 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((18922651477093363802158 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0774_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0774
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0775 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 775 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0775 : Poly :=
[
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0775_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0775
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0776 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)]
]

/-- Partial product 776 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0776 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0776_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0776
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0777 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 777 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0777 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0777_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0777
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0778 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 778 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0778 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0778_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0778
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0779 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 779 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0779 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0779_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0779
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0780 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 780 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0780 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0780_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0780
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0781 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)]
]

/-- Partial product 781 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0781 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0781_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0781
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0782 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 782 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0782 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0782_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0782
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0783 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 783 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0783 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0783_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0783
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0784 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)]
]

/-- Partial product 784 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0784 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0784_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0784
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0785 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 785 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0785 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0785_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0785
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0786 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 786 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0786 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0786_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0786
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0787 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 787 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0787 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0787_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0787
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0788 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 788 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0788 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0788_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0788
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0789 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 789 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0789 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0789_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0789
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0790 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 790 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0790 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0790_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0790
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0791 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 791 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0791 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0791_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0791
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0792 : Poly :=
[
  term ((174477374324612766010150 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 792 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0792 : Poly :=
[
  term ((348954748649225532020300 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-174477374324612766010150 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0792_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0792
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0793 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)]
]

/-- Partial product 793 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0793 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0793_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0793
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0794 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0794 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0794_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0794
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0795 : Poly :=
[
  term ((110490252551853869129314 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 795 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0795 : Poly :=
[
  term ((220980505103707738258628 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-110490252551853869129314 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0795_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0795
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0796 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 796 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0796 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0796_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0796
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0797 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 797 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0797 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0797_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0797
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0798 : Poly :=
[
  term ((-1449896122229370832789687 : Rat) / 1889586434159288359614) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 798 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0798 : Poly :=
[
  term ((-1449896122229370832789687 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1449896122229370832789687 : Rat) / 1889586434159288359614) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0798_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0798
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0799 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 799 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0799 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0799_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0799
        rs_R007_ueqv_R007NY_generator_16_0700_0799 =
      rs_R007_ueqv_R007NY_partial_16_0799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0700_0799 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0700,
  rs_R007_ueqv_R007NY_partial_16_0701,
  rs_R007_ueqv_R007NY_partial_16_0702,
  rs_R007_ueqv_R007NY_partial_16_0703,
  rs_R007_ueqv_R007NY_partial_16_0704,
  rs_R007_ueqv_R007NY_partial_16_0705,
  rs_R007_ueqv_R007NY_partial_16_0706,
  rs_R007_ueqv_R007NY_partial_16_0707,
  rs_R007_ueqv_R007NY_partial_16_0708,
  rs_R007_ueqv_R007NY_partial_16_0709,
  rs_R007_ueqv_R007NY_partial_16_0710,
  rs_R007_ueqv_R007NY_partial_16_0711,
  rs_R007_ueqv_R007NY_partial_16_0712,
  rs_R007_ueqv_R007NY_partial_16_0713,
  rs_R007_ueqv_R007NY_partial_16_0714,
  rs_R007_ueqv_R007NY_partial_16_0715,
  rs_R007_ueqv_R007NY_partial_16_0716,
  rs_R007_ueqv_R007NY_partial_16_0717,
  rs_R007_ueqv_R007NY_partial_16_0718,
  rs_R007_ueqv_R007NY_partial_16_0719,
  rs_R007_ueqv_R007NY_partial_16_0720,
  rs_R007_ueqv_R007NY_partial_16_0721,
  rs_R007_ueqv_R007NY_partial_16_0722,
  rs_R007_ueqv_R007NY_partial_16_0723,
  rs_R007_ueqv_R007NY_partial_16_0724,
  rs_R007_ueqv_R007NY_partial_16_0725,
  rs_R007_ueqv_R007NY_partial_16_0726,
  rs_R007_ueqv_R007NY_partial_16_0727,
  rs_R007_ueqv_R007NY_partial_16_0728,
  rs_R007_ueqv_R007NY_partial_16_0729,
  rs_R007_ueqv_R007NY_partial_16_0730,
  rs_R007_ueqv_R007NY_partial_16_0731,
  rs_R007_ueqv_R007NY_partial_16_0732,
  rs_R007_ueqv_R007NY_partial_16_0733,
  rs_R007_ueqv_R007NY_partial_16_0734,
  rs_R007_ueqv_R007NY_partial_16_0735,
  rs_R007_ueqv_R007NY_partial_16_0736,
  rs_R007_ueqv_R007NY_partial_16_0737,
  rs_R007_ueqv_R007NY_partial_16_0738,
  rs_R007_ueqv_R007NY_partial_16_0739,
  rs_R007_ueqv_R007NY_partial_16_0740,
  rs_R007_ueqv_R007NY_partial_16_0741,
  rs_R007_ueqv_R007NY_partial_16_0742,
  rs_R007_ueqv_R007NY_partial_16_0743,
  rs_R007_ueqv_R007NY_partial_16_0744,
  rs_R007_ueqv_R007NY_partial_16_0745,
  rs_R007_ueqv_R007NY_partial_16_0746,
  rs_R007_ueqv_R007NY_partial_16_0747,
  rs_R007_ueqv_R007NY_partial_16_0748,
  rs_R007_ueqv_R007NY_partial_16_0749,
  rs_R007_ueqv_R007NY_partial_16_0750,
  rs_R007_ueqv_R007NY_partial_16_0751,
  rs_R007_ueqv_R007NY_partial_16_0752,
  rs_R007_ueqv_R007NY_partial_16_0753,
  rs_R007_ueqv_R007NY_partial_16_0754,
  rs_R007_ueqv_R007NY_partial_16_0755,
  rs_R007_ueqv_R007NY_partial_16_0756,
  rs_R007_ueqv_R007NY_partial_16_0757,
  rs_R007_ueqv_R007NY_partial_16_0758,
  rs_R007_ueqv_R007NY_partial_16_0759,
  rs_R007_ueqv_R007NY_partial_16_0760,
  rs_R007_ueqv_R007NY_partial_16_0761,
  rs_R007_ueqv_R007NY_partial_16_0762,
  rs_R007_ueqv_R007NY_partial_16_0763,
  rs_R007_ueqv_R007NY_partial_16_0764,
  rs_R007_ueqv_R007NY_partial_16_0765,
  rs_R007_ueqv_R007NY_partial_16_0766,
  rs_R007_ueqv_R007NY_partial_16_0767,
  rs_R007_ueqv_R007NY_partial_16_0768,
  rs_R007_ueqv_R007NY_partial_16_0769,
  rs_R007_ueqv_R007NY_partial_16_0770,
  rs_R007_ueqv_R007NY_partial_16_0771,
  rs_R007_ueqv_R007NY_partial_16_0772,
  rs_R007_ueqv_R007NY_partial_16_0773,
  rs_R007_ueqv_R007NY_partial_16_0774,
  rs_R007_ueqv_R007NY_partial_16_0775,
  rs_R007_ueqv_R007NY_partial_16_0776,
  rs_R007_ueqv_R007NY_partial_16_0777,
  rs_R007_ueqv_R007NY_partial_16_0778,
  rs_R007_ueqv_R007NY_partial_16_0779,
  rs_R007_ueqv_R007NY_partial_16_0780,
  rs_R007_ueqv_R007NY_partial_16_0781,
  rs_R007_ueqv_R007NY_partial_16_0782,
  rs_R007_ueqv_R007NY_partial_16_0783,
  rs_R007_ueqv_R007NY_partial_16_0784,
  rs_R007_ueqv_R007NY_partial_16_0785,
  rs_R007_ueqv_R007NY_partial_16_0786,
  rs_R007_ueqv_R007NY_partial_16_0787,
  rs_R007_ueqv_R007NY_partial_16_0788,
  rs_R007_ueqv_R007NY_partial_16_0789,
  rs_R007_ueqv_R007NY_partial_16_0790,
  rs_R007_ueqv_R007NY_partial_16_0791,
  rs_R007_ueqv_R007NY_partial_16_0792,
  rs_R007_ueqv_R007NY_partial_16_0793,
  rs_R007_ueqv_R007NY_partial_16_0794,
  rs_R007_ueqv_R007NY_partial_16_0795,
  rs_R007_ueqv_R007NY_partial_16_0796,
  rs_R007_ueqv_R007NY_partial_16_0797,
  rs_R007_ueqv_R007NY_partial_16_0798,
  rs_R007_ueqv_R007NY_partial_16_0799
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0700_0799 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((212735596171439970453248 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 2)],
  term ((-621895339116652432671605 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((189226514770933638021580 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((124379067823330486534321 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((-37845302954186727604316 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((348954748649225532020300 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((220980505103707738258628 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1449896122229370832789687 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-56801412404171544294400 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49683767853098034304552 : Rat) / 104977024119960464423) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (10, 1), (11, 2), (16, 2)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((114202949224229667866971 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (10, 1), (15, 2), (16, 2)],
  term ((208856987172334179677192 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-373400031734152280469002 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((25108189427249510310872 : Rat) / 104977024119960464423) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15620388411147174680960 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3393586370048458804014845 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-11360282480834308858880 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1868294409701725137161369 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3515139514795022312629007 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((21886418134494293792561 : Rat) / 74101428790560327828) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-123715309774699488981046 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((57556149515238564284645 : Rat) / 179960612777075081868) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((38078447389951860696793 : Rat) / 314931072359881393269) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((786904043607867835255393 : Rat) / 629862144719762786538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((255253022565610686688271 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((-44742851912608733634349 : Rat) / 209954048239920928846) [(6, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 6) [(6, 1), (16, 1)],
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((113602824808343088588800 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((99367535706196068609104 : Rat) / 104977024119960464423) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (10, 1), (11, 2), (16, 2)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-114202949224229667866971 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (10, 1), (15, 2), (16, 2)],
  term ((-417713974344668359354384 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((746800063468304560938004 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-22720564961668617717760 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50216378854499020621744 : Rat) / 104977024119960464423) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31240776822294349361920 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3393586370048458804014845 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((22720564961668617717760 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1868294409701725137161369 : Rat) / 1889586434159288359614) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3515139514795022312629007 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-21886418134494293792561 : Rat) / 37050714395280163914) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247430619549398977962092 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((895677699967416167762512 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (14, 1), (16, 2)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (14, 2), (16, 1)],
  term ((-57556149515238564284645 : Rat) / 89980306388537540934) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-925375973099013186532681 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-76156894779903721393586 : Rat) / 314931072359881393269) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((19546172917521990142036 : Rat) / 104977024119960464423) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-786904043607867835255393 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (14, 1), (15, 2), (16, 2)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (14, 1), (15, 4), (16, 1)],
  term ((98331284721143428271651 : Rat) / 314931072359881393269) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-255253022565610686688271 : Rat) / 1259724289439525573076) [(6, 2), (15, 2), (16, 1)],
  term ((44742851912608733634349 : Rat) / 104977024119960464423) [(6, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 2), (16, 1)],
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 2)],
  term ((621895339116652432671605 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 2)],
  term ((-94613257385466819010790 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-124379067823330486534321 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 2)],
  term ((18922651477093363802158 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-174477374324612766010150 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-110490252551853869129314 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1449896122229370832789687 : Rat) / 1889586434159288359614) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 700 through 799. -/
theorem rs_R007_ueqv_R007NY_block_16_0700_0799_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0700_0799
      rs_R007_ueqv_R007NY_block_16_0700_0799 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
