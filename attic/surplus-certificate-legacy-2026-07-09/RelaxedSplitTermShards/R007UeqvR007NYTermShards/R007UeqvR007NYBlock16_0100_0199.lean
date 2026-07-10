/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0100 : Poly :=
[
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0100 : Poly :=
[
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0100
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0101 : Poly :=
[
  term ((-733633947466648966281695 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0101 : Poly :=
[
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0101
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0102 : Poly :=
[
  term ((234968104683902940993565 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0102 : Poly :=
[
  term ((234968104683902940993565 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-234968104683902940993565 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0102
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0103 : Poly :=
[
  term ((146726789493329793256339 : Rat) / 419908096479841857692) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0103 : Poly :=
[
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 419908096479841857692) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0103
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0104 : Poly :=
[
  term ((-46993620936780588198713 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0104 : Poly :=
[
  term ((-46993620936780588198713 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((46993620936780588198713 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0104
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0105 : Poly :=
[
  term ((-3179145811872181200340 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0105 : Poly :=
[
  term ((-6358291623744362400680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((3179145811872181200340 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0105
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0106 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0106 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(0, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0106
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0107 : Poly :=
[
  term ((-590010788616397287600691 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0107 : Poly :=
[
  term ((-590010788616397287600691 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((590010788616397287600691 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0107
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0108 : Poly :=
[
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0108 : Poly :=
[
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0108
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0109 : Poly :=
[
  term ((3368443601865445134370505 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0109 : Poly :=
[
  term ((6736887203730890268741010 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3368443601865445134370505 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0109
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0110 : Poly :=
[
  term ((-9915279858577881779720039 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0110 : Poly :=
[
  term ((-9915279858577881779720039 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((9915279858577881779720039 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0110
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0111 : Poly :=
[
  term ((2975124801156907417507375 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0111 : Poly :=
[
  term ((2975124801156907417507375 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2975124801156907417507375 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0111
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0112 : Poly :=
[
  term ((635829162374436240068 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0112 : Poly :=
[
  term ((1271658324748872480136 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-635829162374436240068 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0112
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0113 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0113 : Poly :=
[
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0113
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0114 : Poly :=
[
  term ((119009937154831077978599 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0114 : Poly :=
[
  term ((119009937154831077978599 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119009937154831077978599 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0114
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0115 : Poly :=
[
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0115 : Poly :=
[
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0115
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0116 : Poly :=
[
  term ((1979528743705145684339395 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0116 : Poly :=
[
  term ((1979528743705145684339395 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1979528743705145684339395 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0116
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0117 : Poly :=
[
  term ((-3765799809908842777799059 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 117 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0117 : Poly :=
[
  term ((-3765799809908842777799059 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0117
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0118 : Poly :=
[
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0118 : Poly :=
[
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0118
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0119 : Poly :=
[
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0119 : Poly :=
[
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0119
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0120 : Poly :=
[
  term ((260802386272684573964246 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0120 : Poly :=
[
  term ((521604772545369147928492 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-260802386272684573964246 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0120
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0121 : Poly :=
[
  term ((-1304011931363422869821230 : Rat) / 944793217079644179807) [(0, 1), (8, 1), (11, 2), (16, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0121 : Poly :=
[
  term ((-2608023862726845739642460 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((1304011931363422869821230 : Rat) / 944793217079644179807) [(0, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0121
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0122 : Poly :=
[
  term ((-2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 122 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0122 : Poly :=
[
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0122
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0123 : Poly :=
[
  term ((1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0123 : Poly :=
[
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0123
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0124 : Poly :=
[
  term ((733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0124 : Poly :=
[
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0124
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0125 : Poly :=
[
  term ((-6427360456734188542886185 : Rat) / 3779172868318576719228) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0125 : Poly :=
[
  term ((-6427360456734188542886185 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6427360456734188542886185 : Rat) / 3779172868318576719228) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0125
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0126 : Poly :=
[
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0126 : Poly :=
[
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0126
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0127 : Poly :=
[
  term ((-146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0127 : Poly :=
[
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0127
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0128 : Poly :=
[
  term ((1256241306172714549744769 : Rat) / 1259724289439525573076) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0128 : Poly :=
[
  term ((1256241306172714549744769 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1256241306172714549744769 : Rat) / 1259724289439525573076) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0128
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0129 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 129 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0129 : Poly :=
[
  term (1 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0129
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0130 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 130 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0130 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0130
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0131 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0131 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0131
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0132 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0132 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0132
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0133 : Poly :=
[
  term ((545312281406961578686475 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0133 : Poly :=
[
  term ((545312281406961578686475 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-545312281406961578686475 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0133
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0134 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 134 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0134 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0134
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0135 : Poly :=
[
  term ((-1589572905936090600170 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0135 : Poly :=
[
  term ((-3179145811872181200340 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1589572905936090600170 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0135
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0136 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0136 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0136
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0137 : Poly :=
[
  term ((-372576495626557322248315 : Rat) / 77125976904460749372) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0137 : Poly :=
[
  term ((-372576495626557322248315 : Rat) / 38562988452230374686) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((372576495626557322248315 : Rat) / 77125976904460749372) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0137
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0138 : Poly :=
[
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0138 : Poly :=
[
  term ((146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0138
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0139 : Poly :=
[
  term ((28799299696440555825229369 : Rat) / 7558345736637153438456) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0139 : Poly :=
[
  term ((28799299696440555825229369 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28799299696440555825229369 : Rat) / 7558345736637153438456) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0139
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0140 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0140 : Poly :=
[
  term ((-164853778495950791738438 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0140
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0141 : Poly :=
[
  term ((181036038079003902936475 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0141 : Poly :=
[
  term ((181036038079003902936475 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-181036038079003902936475 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0141
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0142 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0142 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0142
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0143 : Poly :=
[
  term ((147163359636690146409565 : Rat) / 269940919165612622802) [(0, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0143 : Poly :=
[
  term ((147163359636690146409565 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-147163359636690146409565 : Rat) / 269940919165612622802) [(0, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0143
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0144 : Poly :=
[
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0144 : Poly :=
[
  term ((-733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0144
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0145 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0145 : Poly :=
[
  term ((824268892479753958692190 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0145
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0146 : Poly :=
[
  term ((-54374195502821292325459 : Rat) / 25708658968153583124) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0146 : Poly :=
[
  term ((-54374195502821292325459 : Rat) / 12854329484076791562) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((54374195502821292325459 : Rat) / 25708658968153583124) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0146
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0147 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0147 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0147
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0148 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0148 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0148
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0149 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0149 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0149
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0150 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0150 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0150
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0151 : Poly :=
[
  term ((-152511105420353252442049 : Rat) / 1259724289439525573076) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0151 : Poly :=
[
  term ((-152511105420353252442049 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((152511105420353252442049 : Rat) / 1259724289439525573076) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0151
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0152 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 152 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0152 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0152
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0153 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0153 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0153
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0154 : Poly :=
[
  term ((317914581187218120034 : Rat) / 14996717731422923489) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0154 : Poly :=
[
  term ((635829162374436240068 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-317914581187218120034 : Rat) / 14996717731422923489) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0154
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0155 : Poly :=
[
  term ((486863761525261256271323 : Rat) / 179960612777075081868) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0155 : Poly :=
[
  term ((486863761525261256271323 : Rat) / 89980306388537540934) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-486863761525261256271323 : Rat) / 179960612777075081868) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0155
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0156 : Poly :=
[
  term (-1 : Rat) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 156 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0156 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(0, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0156
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0157 : Poly :=
[
  term ((-3844964772015851481362447 : Rat) / 2519448578879051146152) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0157 : Poly :=
[
  term ((-3844964772015851481362447 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((3844964772015851481362447 : Rat) / 2519448578879051146152) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0157
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0158 : Poly :=
[
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0158 : Poly :=
[
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0158
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0159 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0159 : Poly :=
[
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0159
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0160 : Poly :=
[
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0160 : Poly :=
[
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0160
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0161 : Poly :=
[
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 161 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0161 : Poly :=
[
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0161
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0162 : Poly :=
[
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 162 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0162 : Poly :=
[
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0162
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0163 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0163 : Poly :=
[
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0163
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0164 : Poly :=
[
  term ((-11912160946067319116583 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 164 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0164 : Poly :=
[
  term ((-11912160946067319116583 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((11912160946067319116583 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0164
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0165 : Poly :=
[
  term ((6979333329048454726873 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0165 : Poly :=
[
  term ((6979333329048454726873 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6979333329048454726873 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0165
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0166 : Poly :=
[
  term ((-28050889364142949076709 : Rat) / 104977024119960464423) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0166 : Poly :=
[
  term ((-56101778728285898153418 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((28050889364142949076709 : Rat) / 104977024119960464423) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0166
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0167 : Poly :=
[
  term ((138154906338315536095085 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (16, 1)]
]

/-- Partial product 167 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0167 : Poly :=
[
  term ((276309812676631072190170 : Rat) / 314931072359881393269) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term ((-138154906338315536095085 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0167
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0168 : Poly :=
[
  term (4 : Rat) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0168 : Poly :=
[
  term (8 : Rat) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0168
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0169 : Poly :=
[
  term ((264971629702448529070345 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 169 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0169 : Poly :=
[
  term ((529943259404897058140690 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-264971629702448529070345 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0169
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0170 : Poly :=
[
  term ((-52994325940489705814069 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0170 : Poly :=
[
  term ((-105988651880979411628138 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((52994325940489705814069 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0170
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0171 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 171 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0171 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0171
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0172 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0172 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0172
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0173 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0173 : Poly :=
[
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0173
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0174 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0174 : Poly :=
[
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0174
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0175 : Poly :=
[
  term ((-4 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0175 : Poly :=
[
  term ((4 : Rat) / 3) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0175
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0176 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 176 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0176 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0176
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0177 : Poly :=
[
  term ((3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0177 : Poly :=
[
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0177
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0178 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0178 : Poly :=
[
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0178
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0179 : Poly :=
[
  term ((-606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0179 : Poly :=
[
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0179_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0179
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0180 : Poly :=
[
  term ((-6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0180 : Poly :=
[
  term ((-12008172463543456807190 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0180_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0180
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0181 : Poly :=
[
  term ((3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0181 : Poly :=
[
  term ((7204903478126074084314 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0181_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0181
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0182 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 182 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0182 : Poly :=
[
  term ((538346970828846777922250 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0182_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0182
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0183 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0183 : Poly :=
[
  term ((-107669394165769355584450 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0183_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0183
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0184 : Poly :=
[
  term ((1016443875676087725501545 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 184 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0184 : Poly :=
[
  term ((1016443875676087725501545 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1016443875676087725501545 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0184_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0184
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0185 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 185 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0185 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0185_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0185
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0186 : Poly :=
[
  term ((-2438075270795769227418515 : Rat) / 7558345736637153438456) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 186 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0186 : Poly :=
[
  term ((-2438075270795769227418515 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2438075270795769227418515 : Rat) / 7558345736637153438456) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0186_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0186
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0187 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 187 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0187 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0187_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0187
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0188 : Poly :=
[
  term ((235939553833493263953415 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 188 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0188 : Poly :=
[
  term ((235939553833493263953415 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-235939553833493263953415 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0188_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0188
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0189 : Poly :=
[
  term ((-203288775135217545100309 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0189 : Poly :=
[
  term ((-203288775135217545100309 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((203288775135217545100309 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0189_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0189
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0190 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 190 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0190 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0190_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0190
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0191 : Poly :=
[
  term ((501052113246508784929847 : Rat) / 2519448578879051146152) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0191 : Poly :=
[
  term ((501052113246508784929847 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-501052113246508784929847 : Rat) / 2519448578879051146152) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0191_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0191
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0192 : Poly :=
[
  term ((-143243364686015325802817 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0192 : Poly :=
[
  term ((-143243364686015325802817 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((143243364686015325802817 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0192_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0192
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0193 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

/-- Partial product 193 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0193 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (15, 3), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0193_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0193
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0194 : Poly :=
[
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 194 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0194 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0194_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0194
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0195 : Poly :=
[
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0195 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0195_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0195
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0196 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 196 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0196 : Poly :=
[
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0196_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0196
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0197 : Poly :=
[
  term ((52912335608355421280935 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 197 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0197 : Poly :=
[
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-52912335608355421280935 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0197_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0197
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0198 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0198 : Poly :=
[
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0198_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0198
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0199 : Poly :=
[
  term ((-10582467121671084256187 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0199 : Poly :=
[
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((10582467121671084256187 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0199_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0199
        rs_R007_ueqv_R007NY_generator_16_0100_0199 =
      rs_R007_ueqv_R007NY_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0100_0199 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0100,
  rs_R007_ueqv_R007NY_partial_16_0101,
  rs_R007_ueqv_R007NY_partial_16_0102,
  rs_R007_ueqv_R007NY_partial_16_0103,
  rs_R007_ueqv_R007NY_partial_16_0104,
  rs_R007_ueqv_R007NY_partial_16_0105,
  rs_R007_ueqv_R007NY_partial_16_0106,
  rs_R007_ueqv_R007NY_partial_16_0107,
  rs_R007_ueqv_R007NY_partial_16_0108,
  rs_R007_ueqv_R007NY_partial_16_0109,
  rs_R007_ueqv_R007NY_partial_16_0110,
  rs_R007_ueqv_R007NY_partial_16_0111,
  rs_R007_ueqv_R007NY_partial_16_0112,
  rs_R007_ueqv_R007NY_partial_16_0113,
  rs_R007_ueqv_R007NY_partial_16_0114,
  rs_R007_ueqv_R007NY_partial_16_0115,
  rs_R007_ueqv_R007NY_partial_16_0116,
  rs_R007_ueqv_R007NY_partial_16_0117,
  rs_R007_ueqv_R007NY_partial_16_0118,
  rs_R007_ueqv_R007NY_partial_16_0119,
  rs_R007_ueqv_R007NY_partial_16_0120,
  rs_R007_ueqv_R007NY_partial_16_0121,
  rs_R007_ueqv_R007NY_partial_16_0122,
  rs_R007_ueqv_R007NY_partial_16_0123,
  rs_R007_ueqv_R007NY_partial_16_0124,
  rs_R007_ueqv_R007NY_partial_16_0125,
  rs_R007_ueqv_R007NY_partial_16_0126,
  rs_R007_ueqv_R007NY_partial_16_0127,
  rs_R007_ueqv_R007NY_partial_16_0128,
  rs_R007_ueqv_R007NY_partial_16_0129,
  rs_R007_ueqv_R007NY_partial_16_0130,
  rs_R007_ueqv_R007NY_partial_16_0131,
  rs_R007_ueqv_R007NY_partial_16_0132,
  rs_R007_ueqv_R007NY_partial_16_0133,
  rs_R007_ueqv_R007NY_partial_16_0134,
  rs_R007_ueqv_R007NY_partial_16_0135,
  rs_R007_ueqv_R007NY_partial_16_0136,
  rs_R007_ueqv_R007NY_partial_16_0137,
  rs_R007_ueqv_R007NY_partial_16_0138,
  rs_R007_ueqv_R007NY_partial_16_0139,
  rs_R007_ueqv_R007NY_partial_16_0140,
  rs_R007_ueqv_R007NY_partial_16_0141,
  rs_R007_ueqv_R007NY_partial_16_0142,
  rs_R007_ueqv_R007NY_partial_16_0143,
  rs_R007_ueqv_R007NY_partial_16_0144,
  rs_R007_ueqv_R007NY_partial_16_0145,
  rs_R007_ueqv_R007NY_partial_16_0146,
  rs_R007_ueqv_R007NY_partial_16_0147,
  rs_R007_ueqv_R007NY_partial_16_0148,
  rs_R007_ueqv_R007NY_partial_16_0149,
  rs_R007_ueqv_R007NY_partial_16_0150,
  rs_R007_ueqv_R007NY_partial_16_0151,
  rs_R007_ueqv_R007NY_partial_16_0152,
  rs_R007_ueqv_R007NY_partial_16_0153,
  rs_R007_ueqv_R007NY_partial_16_0154,
  rs_R007_ueqv_R007NY_partial_16_0155,
  rs_R007_ueqv_R007NY_partial_16_0156,
  rs_R007_ueqv_R007NY_partial_16_0157,
  rs_R007_ueqv_R007NY_partial_16_0158,
  rs_R007_ueqv_R007NY_partial_16_0159,
  rs_R007_ueqv_R007NY_partial_16_0160,
  rs_R007_ueqv_R007NY_partial_16_0161,
  rs_R007_ueqv_R007NY_partial_16_0162,
  rs_R007_ueqv_R007NY_partial_16_0163,
  rs_R007_ueqv_R007NY_partial_16_0164,
  rs_R007_ueqv_R007NY_partial_16_0165,
  rs_R007_ueqv_R007NY_partial_16_0166,
  rs_R007_ueqv_R007NY_partial_16_0167,
  rs_R007_ueqv_R007NY_partial_16_0168,
  rs_R007_ueqv_R007NY_partial_16_0169,
  rs_R007_ueqv_R007NY_partial_16_0170,
  rs_R007_ueqv_R007NY_partial_16_0171,
  rs_R007_ueqv_R007NY_partial_16_0172,
  rs_R007_ueqv_R007NY_partial_16_0173,
  rs_R007_ueqv_R007NY_partial_16_0174,
  rs_R007_ueqv_R007NY_partial_16_0175,
  rs_R007_ueqv_R007NY_partial_16_0176,
  rs_R007_ueqv_R007NY_partial_16_0177,
  rs_R007_ueqv_R007NY_partial_16_0178,
  rs_R007_ueqv_R007NY_partial_16_0179,
  rs_R007_ueqv_R007NY_partial_16_0180,
  rs_R007_ueqv_R007NY_partial_16_0181,
  rs_R007_ueqv_R007NY_partial_16_0182,
  rs_R007_ueqv_R007NY_partial_16_0183,
  rs_R007_ueqv_R007NY_partial_16_0184,
  rs_R007_ueqv_R007NY_partial_16_0185,
  rs_R007_ueqv_R007NY_partial_16_0186,
  rs_R007_ueqv_R007NY_partial_16_0187,
  rs_R007_ueqv_R007NY_partial_16_0188,
  rs_R007_ueqv_R007NY_partial_16_0189,
  rs_R007_ueqv_R007NY_partial_16_0190,
  rs_R007_ueqv_R007NY_partial_16_0191,
  rs_R007_ueqv_R007NY_partial_16_0192,
  rs_R007_ueqv_R007NY_partial_16_0193,
  rs_R007_ueqv_R007NY_partial_16_0194,
  rs_R007_ueqv_R007NY_partial_16_0195,
  rs_R007_ueqv_R007NY_partial_16_0196,
  rs_R007_ueqv_R007NY_partial_16_0197,
  rs_R007_ueqv_R007NY_partial_16_0198,
  rs_R007_ueqv_R007NY_partial_16_0199
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0100_0199 : Poly :=
[
  term ((6931507131812590506744 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((234968104683902940993565 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46993620936780588198713 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6358291623744362400680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(0, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-590010788616397287600691 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((6736887203730890268741010 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-9915279858577881779720039 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((2975124801156907417507375 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1271658324748872480136 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((119009937154831077978599 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1979528743705145684339395 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3765799809908842777799059 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-2094632070679343008483340 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((418926414135868601696668 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((521604772545369147928492 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2608023862726845739642460 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6427360456734188542886185 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((40598312741837720600650 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1256241306172714549744769 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((545312281406961578686475 : Rat) / 1889586434159288359614) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3179145811872181200340 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-372576495626557322248315 : Rat) / 38562988452230374686) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((28799299696440555825229369 : Rat) / 3779172868318576719228) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-164853778495950791738438 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((181036038079003902936475 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 2), (13, 2), (16, 1)],
  term ((147163359636690146409565 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((824268892479753958692190 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-54374195502821292325459 : Rat) / 12854329484076791562) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-152511105420353252442049 : Rat) / 629862144719762786538) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((635829162374436240068 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((486863761525261256271323 : Rat) / 89980306388537540934) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3844964772015851481362447 : Rat) / 1259724289439525573076) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-234968104683902940993565 : Rat) / 3779172868318576719228) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 419908096479841857692) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((46993620936780588198713 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3179145811872181200340 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((590010788616397287600691 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3368443601865445134370505 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((9915279858577881779720039 : Rat) / 7558345736637153438456) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2975124801156907417507375 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-635829162374436240068 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119009937154831077978599 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1979528743705145684339395 : Rat) / 2519448578879051146152) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((3765799809908842777799059 : Rat) / 1259724289439525573076) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-260802386272684573964246 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1304011931363422869821230 : Rat) / 944793217079644179807) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((2888127971588579377810 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1732876782953147626686 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6427360456734188542886185 : Rat) / 3779172868318576719228) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1256241306172714549744769 : Rat) / 1259724289439525573076) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(0, 1), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545312281406961578686475 : Rat) / 3779172868318576719228) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1589572905936090600170 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((372576495626557322248315 : Rat) / 77125976904460749372) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28799299696440555825229369 : Rat) / 7558345736637153438456) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-181036038079003902936475 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-147163359636690146409565 : Rat) / 269940919165612622802) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((54374195502821292325459 : Rat) / 25708658968153583124) [(0, 1), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((152511105420353252442049 : Rat) / 1259724289439525573076) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-317914581187218120034 : Rat) / 14996717731422923489) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-486863761525261256271323 : Rat) / 179960612777075081868) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 1), (14, 1), (16, 1)],
  term ((3844964772015851481362447 : Rat) / 2519448578879051146152) [(0, 1), (15, 2), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-11912160946067319116583 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((6979333329048454726873 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-56101778728285898153418 : Rat) / 104977024119960464423) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((276309812676631072190170 : Rat) / 314931072359881393269) [(0, 2), (6, 1), (11, 2), (16, 1)],
  term (8 : Rat) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((11912160946067319116583 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-6979333329048454726873 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((28050889364142949076709 : Rat) / 104977024119960464423) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-138154906338315536095085 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (16, 1)],
  term (-4 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((529943259404897058140690 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-105988651880979411628138 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-264971629702448529070345 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((52994325940489705814069 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-12008172463543456807190 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((7204903478126074084314 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((538346970828846777922250 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-107669394165769355584450 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1016443875676087725501545 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2438075270795769227418515 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((235939553833493263953415 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-203288775135217545100309 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((501052113246508784929847 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47607818863178494648375 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (6, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 3) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((6004086231771728403595 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3602451739063037042157 : Rat) / 6175119065880027319) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1016443875676087725501545 : Rat) / 3779172868318576719228) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((2438075270795769227418515 : Rat) / 7558345736637153438456) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-235939553833493263953415 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((203288775135217545100309 : Rat) / 1259724289439525573076) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-501052113246508784929847 : Rat) / 2519448578879051146152) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((143243364686015325802817 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-52912335608355421280935 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((10582467121671084256187 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem rs_R007_ueqv_R007NY_block_16_0100_0199_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0100_0199
      rs_R007_ueqv_R007NY_block_16_0100_0199 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
