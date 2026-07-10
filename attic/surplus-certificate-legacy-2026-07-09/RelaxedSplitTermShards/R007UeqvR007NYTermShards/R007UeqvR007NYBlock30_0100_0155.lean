/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 30:100-155

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_30_0100_0155 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0100 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0100 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0100
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0101 : Poly :=
[
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0101 : Poly :=
[
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0101
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0102 : Poly :=
[
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0102 : Poly :=
[
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0102
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0103 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 103 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0103 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0103
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0104 : Poly :=
[
  term ((408713545799640164341625 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0104 : Poly :=
[
  term ((408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-408713545799640164341625 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408713545799640164341625 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((408713545799640164341625 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0104
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0105 : Poly :=
[
  term ((-46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0105 : Poly :=
[
  term ((-46568772619070350486375 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-46568772619070350486375 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((46568772619070350486375 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0105
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0106 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0106 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0106
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0107 : Poly :=
[
  term ((-81742709159928032868325 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0107 : Poly :=
[
  term ((-81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((81742709159928032868325 : Rat) / 629862144719762786538) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((81742709159928032868325 : Rat) / 629862144719762786538) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81742709159928032868325 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0107
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0108 : Poly :=
[
  term ((9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0108 : Poly :=
[
  term ((9313754523814070097275 : Rat) / 209954048239920928846) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((9313754523814070097275 : Rat) / 209954048239920928846) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9313754523814070097275 : Rat) / 209954048239920928846) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0108
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0109 : Poly :=
[
  term ((166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0109 : Poly :=
[
  term ((332700849775959576627260 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-332700849775959576627260 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((332700849775959576627260 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0109
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0110 : Poly :=
[
  term ((-26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0110 : Poly :=
[
  term ((-52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0110
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0111 : Poly :=
[
  term ((289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 111 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0111 : Poly :=
[
  term ((578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0111
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0112 : Poly :=
[
  term ((-33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0112 : Poly :=
[
  term ((-66540169955191915325452 : Rat) / 314931072359881393269) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((66540169955191915325452 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66540169955191915325452 : Rat) / 314931072359881393269) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0112
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0113 : Poly :=
[
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0113 : Poly :=
[
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0113
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0114 : Poly :=
[
  term ((-1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 114 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0114 : Poly :=
[
  term ((-2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0114
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0115 : Poly :=
[
  term ((293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0115 : Poly :=
[
  term ((587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0115
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0116 : Poly :=
[
  term ((-219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 116 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0116 : Poly :=
[
  term ((-439765537511643597957470 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((439765537511643597957470 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-439765537511643597957470 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0116
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0117 : Poly :=
[
  term ((21313476948436195105105 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0117 : Poly :=
[
  term ((42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-21313476948436195105105 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21313476948436195105105 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((21313476948436195105105 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0117
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0118 : Poly :=
[
  term ((17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 118 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0118 : Poly :=
[
  term ((35607697880115620363290 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((35607697880115620363290 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-35607697880115620363290 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0118
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0119 : Poly :=
[
  term ((43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0119 : Poly :=
[
  term ((87953107502328719591494 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87953107502328719591494 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((87953107502328719591494 : Rat) / 314931072359881393269) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0119
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0120 : Poly :=
[
  term ((-4262695389687239021021 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0120 : Poly :=
[
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4262695389687239021021 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0120
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0121 : Poly :=
[
  term ((-3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0121 : Poly :=
[
  term ((-7121539576023124072658 : Rat) / 104977024119960464423) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7121539576023124072658 : Rat) / 104977024119960464423) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7121539576023124072658 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0121
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0122 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0122 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0122
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0123 : Poly :=
[
  term ((-67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0123 : Poly :=
[
  term ((-67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0123
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0124 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0124 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0124
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0125 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 125 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0125 : Poly :=
[
  term ((-4 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0125
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0126 : Poly :=
[
  term ((13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0126 : Poly :=
[
  term ((13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0126
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0127 : Poly :=
[
  term ((-5 : Rat) / 6) [(10, 1), (16, 1)]
]

/-- Partial product 127 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0127 : Poly :=
[
  term ((-5 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (12, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 3) [(10, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0127
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0128 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 128 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0128 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0128
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0129 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0129 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0129
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0130 : Poly :=
[
  term ((734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0130 : Poly :=
[
  term ((734848564036769390635775 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-734848564036769390635775 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((734848564036769390635775 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0130
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0131 : Poly :=
[
  term ((-277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0131 : Poly :=
[
  term ((-277597194183188459065855 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((277597194183188459065855 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-277597194183188459065855 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0131
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0132 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0132 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0132
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0133 : Poly :=
[
  term ((-440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0133 : Poly :=
[
  term ((-440532392662356026995 : Rat) / 1100516269166737542) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((440532392662356026995 : Rat) / 1100516269166737542) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (13, 1), (16, 1)],
  term ((-440532392662356026995 : Rat) / 1100516269166737542) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0133
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0134 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0134 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0134
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0135 : Poly :=
[
  term ((350378522495360535450259 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0135 : Poly :=
[
  term ((350378522495360535450259 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-350378522495360535450259 : Rat) / 3779172868318576719228) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((350378522495360535450259 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-350378522495360535450259 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((350378522495360535450259 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-350378522495360535450259 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0135
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0136 : Poly :=
[
  term ((32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0136 : Poly :=
[
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0136
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0137 : Poly :=
[
  term ((135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0137 : Poly :=
[
  term ((135340269533131555225451 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((135340269533131555225451 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-135340269533131555225451 : Rat) / 1889586434159288359614) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0137
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0138 : Poly :=
[
  term ((32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 138 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0138 : Poly :=
[
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0138
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0139 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 139 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0139 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0139
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0140 : Poly :=
[
  term ((-221909395797004003982365 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 140 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0140 : Poly :=
[
  term ((-221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((221909395797004003982365 : Rat) / 3779172868318576719228) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((221909395797004003982365 : Rat) / 3779172868318576719228) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-221909395797004003982365 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)],
  term ((221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0140
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0141 : Poly :=
[
  term ((-694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (16, 1)]
]

/-- Partial product 141 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0141 : Poly :=
[
  term ((-694851765259813359559115 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (12, 2), (16, 1)],
  term ((-694851765259813359559115 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (13, 2), (16, 1)],
  term ((694851765259813359559115 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (16, 1)],
  term ((-694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0141
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0142 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0142 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0142
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0143 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0143 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0143
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0144 : Poly :=
[
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 144 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0144 : Poly :=
[
  term ((-1 : Rat) / 3) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(12, 1), (14, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (14, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0144
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0145 : Poly :=
[
  term ((-135041416202477853825331 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 145 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0145 : Poly :=
[
  term ((-135041416202477853825331 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((135041416202477853825331 : Rat) / 629862144719762786538) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((135041416202477853825331 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-135041416202477853825331 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)],
  term ((-135041416202477853825331 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((135041416202477853825331 : Rat) / 629862144719762786538) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0145
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0146 : Poly :=
[
  term ((55519438836637691813171 : Rat) / 629862144719762786538) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0146 : Poly :=
[
  term ((55519438836637691813171 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 629862144719762786538) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55519438836637691813171 : Rat) / 629862144719762786538) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((55519438836637691813171 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 629862144719762786538) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0146
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0147 : Poly :=
[
  term ((87984198947008234561 : Rat) / 733677512777825028) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0147 : Poly :=
[
  term ((87984198947008234561 : Rat) / 366838756388912514) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-87984198947008234561 : Rat) / 733677512777825028) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-87984198947008234561 : Rat) / 366838756388912514) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((87984198947008234561 : Rat) / 733677512777825028) [(13, 1), (15, 1), (16, 1)],
  term ((87984198947008234561 : Rat) / 366838756388912514) [(13, 2), (15, 2), (16, 1)],
  term ((-87984198947008234561 : Rat) / 733677512777825028) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0147
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0148 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 148 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0148 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0148
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0149 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0149 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 3), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0149
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0150 : Poly :=
[
  term ((-1551663464408272379006 : Rat) / 44990153194268770467) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0150 : Poly :=
[
  term ((-3103326928816544758012 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1551663464408272379006 : Rat) / 44990153194268770467) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3103326928816544758012 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1551663464408272379006 : Rat) / 44990153194268770467) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1551663464408272379006 : Rat) / 44990153194268770467) [(14, 1), (15, 2), (16, 1)],
  term ((3103326928816544758012 : Rat) / 44990153194268770467) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0150
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0151 : Poly :=
[
  term ((1 : Rat) / 6) [(14, 1), (16, 1)]
]

/-- Partial product 151 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0151 : Poly :=
[
  term ((1 : Rat) / 3) [(12, 1), (14, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(13, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0151
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0152 : Poly :=
[
  term ((-6416775697389955118840 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0152 : Poly :=
[
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-6416775697389955118840 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)],
  term ((12833551394779910237680 : Rat) / 314931072359881393269) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0152
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0153 : Poly :=
[
  term ((139192480039953085019867 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)]
]

/-- Partial product 153 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0153 : Poly :=
[
  term ((139192480039953085019867 : Rat) / 629862144719762786538) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-139192480039953085019867 : Rat) / 1259724289439525573076) [(12, 2), (15, 2), (16, 1)],
  term ((139192480039953085019867 : Rat) / 629862144719762786538) [(13, 1), (15, 3), (16, 1)],
  term ((-139192480039953085019867 : Rat) / 1259724289439525573076) [(13, 2), (15, 2), (16, 1)],
  term ((-139192480039953085019867 : Rat) / 629862144719762786538) [(14, 1), (15, 2), (16, 1)],
  term ((139192480039953085019867 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0153
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0154 : Poly :=
[
  term ((-6416775697389955118840 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

/-- Partial product 154 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0154 : Poly :=
[
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(12, 2), (15, 4), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(13, 1), (15, 5), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(13, 2), (15, 4), (16, 1)],
  term ((12833551394779910237680 : Rat) / 314931072359881393269) [(14, 1), (15, 4), (16, 1)],
  term ((-6416775697389955118840 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0154
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 30. -/
def rs_R007_ueqv_R007NY_coefficient_30_0155 : Poly :=
[
  term ((1 : Rat) / 3) [(16, 1)]
]

/-- Partial product 155 for generator 30. -/
def rs_R007_ueqv_R007NY_partial_30_0155 : Poly :=
[
  term ((2 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (16, 1)],
  term ((2 : Rat) / 3) [(13, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 30. -/
theorem rs_R007_ueqv_R007NY_partial_30_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_30_0155
        rs_R007_ueqv_R007NY_generator_30_0100_0155 =
      rs_R007_ueqv_R007NY_partial_30_0155 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_30_0100_0155 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_30_0100,
  rs_R007_ueqv_R007NY_partial_30_0101,
  rs_R007_ueqv_R007NY_partial_30_0102,
  rs_R007_ueqv_R007NY_partial_30_0103,
  rs_R007_ueqv_R007NY_partial_30_0104,
  rs_R007_ueqv_R007NY_partial_30_0105,
  rs_R007_ueqv_R007NY_partial_30_0106,
  rs_R007_ueqv_R007NY_partial_30_0107,
  rs_R007_ueqv_R007NY_partial_30_0108,
  rs_R007_ueqv_R007NY_partial_30_0109,
  rs_R007_ueqv_R007NY_partial_30_0110,
  rs_R007_ueqv_R007NY_partial_30_0111,
  rs_R007_ueqv_R007NY_partial_30_0112,
  rs_R007_ueqv_R007NY_partial_30_0113,
  rs_R007_ueqv_R007NY_partial_30_0114,
  rs_R007_ueqv_R007NY_partial_30_0115,
  rs_R007_ueqv_R007NY_partial_30_0116,
  rs_R007_ueqv_R007NY_partial_30_0117,
  rs_R007_ueqv_R007NY_partial_30_0118,
  rs_R007_ueqv_R007NY_partial_30_0119,
  rs_R007_ueqv_R007NY_partial_30_0120,
  rs_R007_ueqv_R007NY_partial_30_0121,
  rs_R007_ueqv_R007NY_partial_30_0122,
  rs_R007_ueqv_R007NY_partial_30_0123,
  rs_R007_ueqv_R007NY_partial_30_0124,
  rs_R007_ueqv_R007NY_partial_30_0125,
  rs_R007_ueqv_R007NY_partial_30_0126,
  rs_R007_ueqv_R007NY_partial_30_0127,
  rs_R007_ueqv_R007NY_partial_30_0128,
  rs_R007_ueqv_R007NY_partial_30_0129,
  rs_R007_ueqv_R007NY_partial_30_0130,
  rs_R007_ueqv_R007NY_partial_30_0131,
  rs_R007_ueqv_R007NY_partial_30_0132,
  rs_R007_ueqv_R007NY_partial_30_0133,
  rs_R007_ueqv_R007NY_partial_30_0134,
  rs_R007_ueqv_R007NY_partial_30_0135,
  rs_R007_ueqv_R007NY_partial_30_0136,
  rs_R007_ueqv_R007NY_partial_30_0137,
  rs_R007_ueqv_R007NY_partial_30_0138,
  rs_R007_ueqv_R007NY_partial_30_0139,
  rs_R007_ueqv_R007NY_partial_30_0140,
  rs_R007_ueqv_R007NY_partial_30_0141,
  rs_R007_ueqv_R007NY_partial_30_0142,
  rs_R007_ueqv_R007NY_partial_30_0143,
  rs_R007_ueqv_R007NY_partial_30_0144,
  rs_R007_ueqv_R007NY_partial_30_0145,
  rs_R007_ueqv_R007NY_partial_30_0146,
  rs_R007_ueqv_R007NY_partial_30_0147,
  rs_R007_ueqv_R007NY_partial_30_0148,
  rs_R007_ueqv_R007NY_partial_30_0149,
  rs_R007_ueqv_R007NY_partial_30_0150,
  rs_R007_ueqv_R007NY_partial_30_0151,
  rs_R007_ueqv_R007NY_partial_30_0152,
  rs_R007_ueqv_R007NY_partial_30_0153,
  rs_R007_ueqv_R007NY_partial_30_0154,
  rs_R007_ueqv_R007NY_partial_30_0155
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_30_0100_0155 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((134796090577430608371950 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-67398045288715304185975 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-26959218115486121674390 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13479609057743060837195 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-239108789564511253974325 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-309311074092339961826425 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 3), (16, 1)],
  term ((408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46568772619070350486375 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-408713545799640164341625 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((39172847404060801128625 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-408713545799640164341625 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-46568772619070350486375 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((47821757912902250794865 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((61862214818467992365285 : Rat) / 629862144719762786538) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9313754523814070097275 : Rat) / 209954048239920928846) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((81742709159928032868325 : Rat) / 629862144719762786538) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7834569480812160225725 : Rat) / 44990153194268770467) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((81742709159928032868325 : Rat) / 314931072359881393269) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((9313754523814070097275 : Rat) / 419908096479841857692) [(7, 1), (15, 1), (16, 1)],
  term ((332700849775959576627260 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-332700849775959576627260 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((570152236457599690423187 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-166350424887979788313630 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((52766974818142247510206 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26383487409071123755103 : Rat) / 104977024119960464423) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-578369852787771761602040 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((289184926393885880801020 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (16, 1)],
  term ((-66540169955191915325452 : Rat) / 314931072359881393269) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((66540169955191915325452 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11332608017750518912645 : Rat) / 44990153194268770467) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((33270084977595957662726 : Rat) / 314931072359881393269) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(8, 1), (15, 2), (16, 1)],
  term ((-2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((2938292915235144494500 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1469146457617572247250 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-587658583047028898900 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((293829291523514449450 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-439765537511643597957470 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((546588631151990459047340 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-503705968356952183272785 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((219882768755821798978735 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 3), (16, 1)],
  term ((42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35607697880115620363290 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21313476948436195105105 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-4764740310559808419395 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42626953896872390210210 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((17803848940057810181645 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (16, 1)],
  term ((87953107502328719591494 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-109317726230398091809468 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((100741193671390436654557 : Rat) / 314931072359881393269) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43976553751164359795747 : Rat) / 314931072359881393269) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7121539576023124072658 : Rat) / 104977024119960464423) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4262695389687239021021 : Rat) / 104977024119960464423) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2858844186335885051637 : Rat) / 104977024119960464423) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8525390779374478042042 : Rat) / 104977024119960464423) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3560769788011562036329 : Rat) / 104977024119960464423) [(9, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-74864667880684549608395 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((67138863129744311127605 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67138863129744311127605 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (12, 2), (16, 1)],
  term ((-7160163421447134730756 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1158368228867868966985 : Rat) / 14996717731422923489) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((14972933576136909921679 : Rat) / 179960612777075081868) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 6) [(10, 1), (13, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13427772625948862225521 : Rat) / 89980306388537540934) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((13427772625948862225521 : Rat) / 179960612777075081868) [(10, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(10, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24472914209789610868195 : Rat) / 51069903625926712422) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-128493486622238155293055 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((734848564036769390635775 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5325132412891082277600 : Rat) / 14996717731422923489) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1259805004759932074159699 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((201274814934410231677459 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((215410244916525253939 : Rat) / 314433219761925012) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42467975293525376292200 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-734848564036769390635775 : Rat) / 1889586434159288359614) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((44453306483223404078651 : Rat) / 209954048239920928846) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((79799487336346139880760 : Rat) / 314931072359881393269) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((277597194183188459065855 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((110489651606306504596651 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (13, 1), (16, 1)],
  term ((-864352468984313156622479 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1946335921057562759471881 : Rat) / 3779172868318576719228) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-56934496413774826223000 : Rat) / 944793217079644179807) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((277597194183188459065855 : Rat) / 1889586434159288359614) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-19525485513933968351200 : Rat) / 134970459582806311401) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((440532392662356026995 : Rat) / 2201032538333475084) [(11, 1), (13, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((26565994476365808333119 : Rat) / 1259724289439525573076) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-286210765521460984261859 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64167756973899551188400 : Rat) / 944793217079644179807) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((135340269533131555225451 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)],
  term ((32083878486949775594200 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-595449293552513157043915 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 1), (16, 1)],
  term ((-58566830344065602026145 : Rat) / 1259724289439525573076) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (12, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (12, 3), (16, 1)],
  term ((-221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-694851765259813359559115 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((221909395797004003982365 : Rat) / 3779172868318576719228) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (13, 2), (16, 1)],
  term ((52193829902903049678655 : Rat) / 77125976904460749372) [(11, 2), (14, 1), (16, 1)],
  term ((221909395797004003982365 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)],
  term ((-694851765259813359559115 : Rat) / 1889586434159288359614) [(11, 2), (16, 1)],
  term ((1627744658161831338441 : Rat) / 5674433736214079158) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((25698697324447631058611 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-135041416202477853825331 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3195079447734649366560 : Rat) / 14996717731422923489) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((135041416202477853825331 : Rat) / 629862144719762786538) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((8048264116098240046801 : Rat) / 12854329484076791562) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 2) [(12, 1), (14, 1), (16, 1)],
  term ((-973273963660111846972 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(12, 1), (14, 2), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((-135041416202477853825331 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 629862144719762786538) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-87984198947008234561 : Rat) / 733677512777825028) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-124179771951619947172289 : Rat) / 314931072359881393269) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 2), (14, 1), (16, 1)],
  term ((-8493595058705075258440 : Rat) / 314931072359881393269) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (14, 2), (16, 1)],
  term ((-139192480039953085019867 : Rat) / 1259724289439525573076) [(12, 2), (15, 2), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(12, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 3), (14, 1), (16, 1)],
  term ((135041416202477853825331 : Rat) / 629862144719762786538) [(12, 3), (15, 2), (16, 1)],
  term ((-47669738353567762999610 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1271114861289563020564 : Rat) / 14996717731422923489) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((88473317288860117913 : Rat) / 733677512777825028) [(13, 1), (15, 1), (16, 1)],
  term ((144162603625318095145627 : Rat) / 629862144719762786538) [(13, 1), (15, 3), (16, 1)],
  term ((-12833551394779910237680 : Rat) / 314931072359881393269) [(13, 1), (15, 5), (16, 1)],
  term ((36560341575305537711653 : Rat) / 314931072359881393269) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(13, 2), (14, 1), (16, 1)],
  term ((6416775697389955118840 : Rat) / 314931072359881393269) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((74195580722817771323909 : Rat) / 419908096479841857692) [(13, 2), (15, 2), (16, 1)],
  term ((11386899282754965244600 : Rat) / 314931072359881393269) [(13, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 3) [(13, 2), (16, 1)],
  term ((-55519438836637691813171 : Rat) / 629862144719762786538) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-87984198947008234561 : Rat) / 733677512777825028) [(13, 3), (15, 1), (16, 1)],
  term ((3905097102786793670240 : Rat) / 44990153194268770467) [(13, 3), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 4), (15, 2), (16, 1)],
  term ((-53638589513889632775317 : Rat) / 209954048239920928846) [(14, 1), (15, 2), (16, 1)],
  term ((12833551394779910237680 : Rat) / 314931072359881393269) [(14, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((110118797153423440196 : Rat) / 2265691168056700671) [(14, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(14, 2), (16, 1)],
  term ((12833551394779910237680 : Rat) / 314931072359881393269) [(14, 3), (15, 2), (16, 1)],
  term ((139192480039953085019867 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)],
  term ((-6416775697389955118840 : Rat) / 314931072359881393269) [(15, 4), (16, 1)],
  term ((1 : Rat) / 3) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 100 through 155. -/
theorem rs_R007_ueqv_R007NY_block_30_0100_0155_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_30_0100_0155
      rs_R007_ueqv_R007NY_block_30_0100_0155 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
