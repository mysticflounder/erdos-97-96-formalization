/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 17:100-125

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_17_0100_0125 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0100 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0100 : Poly :=
[
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0100
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0101 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0101 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0101
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0102 : Poly :=
[
  term ((1023327600147910917594923 : Rat) / 3779172868318576719228) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0102 : Poly :=
[
  term ((1023327600147910917594923 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1023327600147910917594923 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1023327600147910917594923 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1023327600147910917594923 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0102
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0103 : Poly :=
[
  term ((13763860505205078505880 : Rat) / 104977024119960464423) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0103 : Poly :=
[
  term ((27527721010410157011760 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13763860505205078505880 : Rat) / 104977024119960464423) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27527721010410157011760 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13763860505205078505880 : Rat) / 104977024119960464423) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0103
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0104 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 19281494226115187343) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0104 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0104
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0105 : Poly :=
[
  term ((-159538688676902891480395 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0105 : Poly :=
[
  term ((-159538688676902891480395 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((159538688676902891480395 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-159538688676902891480395 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((159538688676902891480395 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0105
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0106 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0106 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0106
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0107 : Poly :=
[
  term ((-1007751992673666941265941 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0107 : Poly :=
[
  term ((-1007751992673666941265941 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1007751992673666941265941 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1007751992673666941265941 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1007751992673666941265941 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0107
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0108 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0108 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0108
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0109 : Poly :=
[
  term ((491262638506867878643019 : Rat) / 7558345736637153438456) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0109 : Poly :=
[
  term ((491262638506867878643019 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-491262638506867878643019 : Rat) / 7558345736637153438456) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((491262638506867878643019 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-491262638506867878643019 : Rat) / 7558345736637153438456) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0109
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0110 : Poly :=
[
  term ((716873740263655745664175 : Rat) / 1889586434159288359614) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 110 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0110 : Poly :=
[
  term ((716873740263655745664175 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-716873740263655745664175 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((716873740263655745664175 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-716873740263655745664175 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0110
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0111 : Poly :=
[
  term ((-57719325446763640280995 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 111 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0111 : Poly :=
[
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0111
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0112 : Poly :=
[
  term ((94671466916875506190790 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0112 : Poly :=
[
  term ((189342933833751012381580 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-94671466916875506190790 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((189342933833751012381580 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-94671466916875506190790 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0112
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0113 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0113 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0113
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0114 : Poly :=
[
  term ((331583284630078049562305 : Rat) / 3779172868318576719228) [(11, 2), (16, 1)]
]

/-- Partial product 114 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0114 : Poly :=
[
  term ((331583284630078049562305 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-331583284630078049562305 : Rat) / 3779172868318576719228) [(2, 2), (11, 2), (16, 1)],
  term ((331583284630078049562305 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-331583284630078049562305 : Rat) / 3779172868318576719228) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0114
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0115 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0115 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0115
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0116 : Poly :=
[
  term ((-4782709292300963140111 : Rat) / 34046602417284474948) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0116 : Poly :=
[
  term ((-4782709292300963140111 : Rat) / 17023301208642237474) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((4782709292300963140111 : Rat) / 34046602417284474948) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4782709292300963140111 : Rat) / 17023301208642237474) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((4782709292300963140111 : Rat) / 34046602417284474948) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0116
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0117 : Poly :=
[
  term ((-8258316303123047103528 : Rat) / 104977024119960464423) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0117 : Poly :=
[
  term ((-16516632606246094207056 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8258316303123047103528 : Rat) / 104977024119960464423) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16516632606246094207056 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8258316303123047103528 : Rat) / 104977024119960464423) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0117
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0118 : Poly :=
[
  term ((31907737735380578296079 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0118 : Poly :=
[
  term ((31907737735380578296079 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31907737735380578296079 : Rat) / 1259724289439525573076) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((31907737735380578296079 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31907737735380578296079 : Rat) / 1259724289439525573076) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0118
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0119 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 119 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0119 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0119
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0120 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0120 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0120
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0121 : Poly :=
[
  term ((22301156344947592183087 : Rat) / 179960612777075081868) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0121 : Poly :=
[
  term ((22301156344947592183087 : Rat) / 89980306388537540934) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22301156344947592183087 : Rat) / 179960612777075081868) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((22301156344947592183087 : Rat) / 89980306388537540934) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22301156344947592183087 : Rat) / 179960612777075081868) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0121
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0122 : Poly :=
[
  term ((1 : Rat) / 6) [(14, 1), (16, 1)]
]

/-- Partial product 122 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0122 : Poly :=
[
  term ((1 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(2, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0122
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0123 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0123 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0123
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0124 : Poly :=
[
  term ((-177832516012592307623557 : Rat) / 2519448578879051146152) [(15, 2), (16, 1)]
]

/-- Partial product 124 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0124 : Poly :=
[
  term ((-177832516012592307623557 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((177832516012592307623557 : Rat) / 2519448578879051146152) [(2, 2), (15, 2), (16, 1)],
  term ((-177832516012592307623557 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((177832516012592307623557 : Rat) / 2519448578879051146152) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0124
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def rs_R007_ueqv_R007NY_coefficient_17_0125 : Poly :=
[
  term ((-133938634681433268998531 : Rat) / 629862144719762786538) [(15, 4), (16, 1)]
]

/-- Partial product 125 for generator 17. -/
def rs_R007_ueqv_R007NY_partial_17_0125 : Poly :=
[
  term ((-133938634681433268998531 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((133938634681433268998531 : Rat) / 629862144719762786538) [(2, 2), (15, 4), (16, 1)],
  term ((-133938634681433268998531 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((133938634681433268998531 : Rat) / 629862144719762786538) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem rs_R007_ueqv_R007NY_partial_17_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_17_0125
        rs_R007_ueqv_R007NY_generator_17_0100_0125 =
      rs_R007_ueqv_R007NY_partial_17_0125 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_17_0100_0125 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_17_0100,
  rs_R007_ueqv_R007NY_partial_17_0101,
  rs_R007_ueqv_R007NY_partial_17_0102,
  rs_R007_ueqv_R007NY_partial_17_0103,
  rs_R007_ueqv_R007NY_partial_17_0104,
  rs_R007_ueqv_R007NY_partial_17_0105,
  rs_R007_ueqv_R007NY_partial_17_0106,
  rs_R007_ueqv_R007NY_partial_17_0107,
  rs_R007_ueqv_R007NY_partial_17_0108,
  rs_R007_ueqv_R007NY_partial_17_0109,
  rs_R007_ueqv_R007NY_partial_17_0110,
  rs_R007_ueqv_R007NY_partial_17_0111,
  rs_R007_ueqv_R007NY_partial_17_0112,
  rs_R007_ueqv_R007NY_partial_17_0113,
  rs_R007_ueqv_R007NY_partial_17_0114,
  rs_R007_ueqv_R007NY_partial_17_0115,
  rs_R007_ueqv_R007NY_partial_17_0116,
  rs_R007_ueqv_R007NY_partial_17_0117,
  rs_R007_ueqv_R007NY_partial_17_0118,
  rs_R007_ueqv_R007NY_partial_17_0119,
  rs_R007_ueqv_R007NY_partial_17_0120,
  rs_R007_ueqv_R007NY_partial_17_0121,
  rs_R007_ueqv_R007NY_partial_17_0122,
  rs_R007_ueqv_R007NY_partial_17_0123,
  rs_R007_ueqv_R007NY_partial_17_0124,
  rs_R007_ueqv_R007NY_partial_17_0125
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_17_0100_0125 : Poly :=
[
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1023327600147910917594923 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27527721010410157011760 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-159538688676902891480395 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007751992673666941265941 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491262638506867878643019 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((716873740263655745664175 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((189342933833751012381580 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((331583284630078049562305 : Rat) / 1889586434159288359614) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4782709292300963140111 : Rat) / 17023301208642237474) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16516632606246094207056 : Rat) / 104977024119960464423) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31907737735380578296079 : Rat) / 629862144719762786538) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((22301156344947592183087 : Rat) / 89980306388537540934) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-177832516012592307623557 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-133938634681433268998531 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1023327600147910917594923 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13763860505205078505880 : Rat) / 104977024119960464423) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((159538688676902891480395 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1007751992673666941265941 : Rat) / 3779172868318576719228) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491262638506867878643019 : Rat) / 7558345736637153438456) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-716873740263655745664175 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-94671466916875506190790 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-331583284630078049562305 : Rat) / 3779172868318576719228) [(2, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4782709292300963140111 : Rat) / 34046602417284474948) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((8258316303123047103528 : Rat) / 104977024119960464423) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31907737735380578296079 : Rat) / 1259724289439525573076) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-22301156344947592183087 : Rat) / 179960612777075081868) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(2, 2), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((177832516012592307623557 : Rat) / 2519448578879051146152) [(2, 2), (15, 2), (16, 1)],
  term ((133938634681433268998531 : Rat) / 629862144719762786538) [(2, 2), (15, 4), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1023327600147910917594923 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27527721010410157011760 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 19281494226115187343) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-159538688676902891480395 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1007751992673666941265941 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((491262638506867878643019 : Rat) / 3779172868318576719228) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((716873740263655745664175 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-115438650893527280561990 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((189342933833751012381580 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((331583284630078049562305 : Rat) / 1889586434159288359614) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4782709292300963140111 : Rat) / 17023301208642237474) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16516632606246094207056 : Rat) / 104977024119960464423) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((31907737735380578296079 : Rat) / 629862144719762786538) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((22301156344947592183087 : Rat) / 89980306388537540934) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-177832516012592307623557 : Rat) / 1259724289439525573076) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-133938634681433268998531 : Rat) / 314931072359881393269) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1023327600147910917594923 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13763860505205078505880 : Rat) / 104977024119960464423) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 19281494226115187343) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((159538688676902891480395 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1007751992673666941265941 : Rat) / 3779172868318576719228) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-491262638506867878643019 : Rat) / 7558345736637153438456) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-716873740263655745664175 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((57719325446763640280995 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((-94671466916875506190790 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-331583284630078049562305 : Rat) / 3779172868318576719228) [(3, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4782709292300963140111 : Rat) / 34046602417284474948) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((8258316303123047103528 : Rat) / 104977024119960464423) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31907737735380578296079 : Rat) / 1259724289439525573076) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-22301156344947592183087 : Rat) / 179960612777075081868) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(3, 2), (14, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 629862144719762786538) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((177832516012592307623557 : Rat) / 2519448578879051146152) [(3, 2), (15, 2), (16, 1)],
  term ((133938634681433268998531 : Rat) / 629862144719762786538) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 125. -/
theorem rs_R007_ueqv_R007NY_block_17_0100_0125_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_17_0100_0125
      rs_R007_ueqv_R007NY_block_17_0100_0125 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
