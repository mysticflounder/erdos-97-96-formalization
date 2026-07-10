/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 28:100-110

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_28_0100_0110 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0100 : Poly :=
[
  term ((-1008988082513635047974 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0100 : Poly :=
[
  term ((-2017976165027270095948 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1008988082513635047974 : Rat) / 314931072359881393269) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2017976165027270095948 : Rat) / 314931072359881393269) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1008988082513635047974 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1008988082513635047974 : Rat) / 314931072359881393269) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2017976165027270095948 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0100
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0101 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0101 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0101
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0102 : Poly :=
[
  term ((-97900043414017695457543 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0102 : Poly :=
[
  term ((-97900043414017695457543 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((97900043414017695457543 : Rat) / 1259724289439525573076) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-97900043414017695457543 : Rat) / 629862144719762786538) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((97900043414017695457543 : Rat) / 1259724289439525573076) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((97900043414017695457543 : Rat) / 629862144719762786538) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97900043414017695457543 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0102
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0103 : Poly :=
[
  term ((-1065026482578216455520 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 103 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0103 : Poly :=
[
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1065026482578216455520 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0103
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0104 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0104 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0104
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0105 : Poly :=
[
  term ((3523471473340065132680 : Rat) / 314931072359881393269) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0105 : Poly :=
[
  term ((7046942946680130265360 : Rat) / 314931072359881393269) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3523471473340065132680 : Rat) / 314931072359881393269) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((7046942946680130265360 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3523471473340065132680 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((3523471473340065132680 : Rat) / 314931072359881393269) [(14, 1), (15, 2), (16, 1)],
  term ((-7046942946680130265360 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0105
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0106 : Poly :=
[
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)]
]

/-- Partial product 106 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0106 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0106
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0107 : Poly :=
[
  term ((1483639581678743363620 : Rat) / 104977024119960464423) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0107 : Poly :=
[
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 3), (15, 2), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((1483639581678743363620 : Rat) / 104977024119960464423) [(14, 2), (15, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0107
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0108 : Poly :=
[
  term ((-574642030730223247582613 : Rat) / 5038897157758102292304) [(15, 2), (16, 1)]
]

/-- Partial product 108 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0108 : Poly :=
[
  term ((-574642030730223247582613 : Rat) / 2519448578879051146152) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((574642030730223247582613 : Rat) / 5038897157758102292304) [(2, 2), (15, 2), (16, 1)],
  term ((-574642030730223247582613 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)],
  term ((574642030730223247582613 : Rat) / 5038897157758102292304) [(3, 2), (15, 2), (16, 1)],
  term ((574642030730223247582613 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)],
  term ((-574642030730223247582613 : Rat) / 5038897157758102292304) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0108
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0109 : Poly :=
[
  term ((1483639581678743363620 : Rat) / 104977024119960464423) [(15, 4), (16, 1)]
]

/-- Partial product 109 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0109 : Poly :=
[
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(2, 2), (15, 4), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(3, 1), (15, 5), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(3, 2), (15, 4), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(14, 1), (15, 4), (16, 1)],
  term ((1483639581678743363620 : Rat) / 104977024119960464423) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0109
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def rs_R007_ueqv_R007NY_coefficient_28_0110 : Poly :=
[
  term ((-1 : Rat) / 12) [(16, 1)]
]

/-- Partial product 110 for generator 28. -/
def rs_R007_ueqv_R007NY_partial_28_0110 : Poly :=
[
  term ((-1 : Rat) / 6) [(2, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 12) [(2, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(3, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 12) [(3, 2), (16, 1)],
  term ((1 : Rat) / 6) [(14, 1), (16, 1)],
  term ((-1 : Rat) / 12) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem rs_R007_ueqv_R007NY_partial_28_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_28_0110
        rs_R007_ueqv_R007NY_generator_28_0100_0110 =
      rs_R007_ueqv_R007NY_partial_28_0110 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_28_0100_0110 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_28_0100,
  rs_R007_ueqv_R007NY_partial_28_0101,
  rs_R007_ueqv_R007NY_partial_28_0102,
  rs_R007_ueqv_R007NY_partial_28_0103,
  rs_R007_ueqv_R007NY_partial_28_0104,
  rs_R007_ueqv_R007NY_partial_28_0105,
  rs_R007_ueqv_R007NY_partial_28_0106,
  rs_R007_ueqv_R007NY_partial_28_0107,
  rs_R007_ueqv_R007NY_partial_28_0108,
  rs_R007_ueqv_R007NY_partial_28_0109,
  rs_R007_ueqv_R007NY_partial_28_0110
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_28_0100_0110 : Poly :=
[
  term ((-97900043414017695457543 : Rat) / 629862144719762786538) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2017976165027270095948 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-574642030730223247582613 : Rat) / 2519448578879051146152) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 6) [(2, 1), (14, 1), (16, 1)],
  term ((7046942946680130265360 : Rat) / 314931072359881393269) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(2, 1), (14, 3), (15, 2), (16, 1)],
  term ((1008988082513635047974 : Rat) / 314931072359881393269) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((97900043414017695457543 : Rat) / 1259724289439525573076) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3523471473340065132680 : Rat) / 314931072359881393269) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (14, 1), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((574642030730223247582613 : Rat) / 5038897157758102292304) [(2, 2), (15, 2), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(2, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 12) [(2, 2), (16, 1)],
  term ((-2017976165027270095948 : Rat) / 314931072359881393269) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-97900043414017695457543 : Rat) / 629862144719762786538) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-4 : Rat) / 3) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((7046942946680130265360 : Rat) / 314931072359881393269) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1 : Rat) / 6) [(3, 1), (15, 1), (16, 1)],
  term ((-574642030730223247582613 : Rat) / 2519448578879051146152) [(3, 1), (15, 3), (16, 1)],
  term ((2967279163357486727240 : Rat) / 104977024119960464423) [(3, 1), (15, 5), (16, 1)],
  term ((1008988082513635047974 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((97900043414017695457543 : Rat) / 1259724289439525573076) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3523471473340065132680 : Rat) / 314931072359881393269) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (14, 1), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((574642030730223247582613 : Rat) / 5038897157758102292304) [(3, 2), (15, 2), (16, 1)],
  term ((-1483639581678743363620 : Rat) / 104977024119960464423) [(3, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 12) [(3, 2), (16, 1)],
  term ((123400343949794627235 : Rat) / 810633390887725594) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2130052965156432911040 : Rat) / 14996717731422923489) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-10407332798385255218452 : Rat) / 314931072359881393269) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-97900043414017695457543 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)],
  term ((-1065026482578216455520 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(13, 2), (15, 2), (16, 1)],
  term ((11820192206214583698903 : Rat) / 49400952527040218552) [(14, 1), (15, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(14, 1), (15, 4), (16, 1)],
  term ((-1 : Rat) / 2) [(14, 1), (16, 1)],
  term ((-2596024201643900174500 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-2967279163357486727240 : Rat) / 104977024119960464423) [(14, 3), (15, 2), (16, 1)],
  term ((-574642030730223247582613 : Rat) / 5038897157758102292304) [(15, 2), (16, 1)],
  term ((1483639581678743363620 : Rat) / 104977024119960464423) [(15, 4), (16, 1)],
  term ((-1 : Rat) / 12) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 110. -/
theorem rs_R007_ueqv_R007NY_block_28_0100_0110_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_28_0100_0110
      rs_R007_ueqv_R007NY_block_28_0100_0110 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
