/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 5:100-188

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_05_0100_0188 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0100 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0100 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0100
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0101 : Poly :=
[
  term ((19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0101 : Poly :=
[
  term ((-38052518190511161859234 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((38052518190511161859234 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0101
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0102 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0102 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0102
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0103 : Poly :=
[
  term ((554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0103 : Poly :=
[
  term ((-1109958272812281033344 : Rat) / 2142388247346131927) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((1109958272812281033344 : Rat) / 2142388247346131927) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0103
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0104 : Poly :=
[
  term ((-26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0104 : Poly :=
[
  term ((26066831810256060103837 : Rat) / 419908096479841857692) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 419908096479841857692) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0104
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0105 : Poly :=
[
  term ((135288257051189486591645 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 105 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0105 : Poly :=
[
  term ((-270576514102378973183290 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((135288257051189486591645 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((270576514102378973183290 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-135288257051189486591645 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-135288257051189486591645 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((135288257051189486591645 : Rat) / 944793217079644179807) [(7, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0105
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0106 : Poly :=
[
  term ((-27057651410237897318329 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0106 : Poly :=
[
  term ((54115302820475794636658 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27057651410237897318329 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-54115302820475794636658 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((27057651410237897318329 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((27057651410237897318329 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-27057651410237897318329 : Rat) / 314931072359881393269) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0106
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0107 : Poly :=
[
  term ((-55527089800015574983105 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 107 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0107 : Poly :=
[
  term ((55527089800015574983105 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((55527089800015574983105 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((55527089800015574983105 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 629862144719762786538) [(7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0107
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0108 : Poly :=
[
  term ((11105417960003114996621 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0108 : Poly :=
[
  term ((-11105417960003114996621 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((11105417960003114996621 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((11105417960003114996621 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11105417960003114996621 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11105417960003114996621 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((11105417960003114996621 : Rat) / 209954048239920928846) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0108
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0109 : Poly :=
[
  term ((87669125489017202027095 : Rat) / 269940919165612622802) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 109 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0109 : Poly :=
[
  term ((-87669125489017202027095 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((87669125489017202027095 : Rat) / 269940919165612622802) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((87669125489017202027095 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-87669125489017202027095 : Rat) / 269940919165612622802) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-87669125489017202027095 : Rat) / 269940919165612622802) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((87669125489017202027095 : Rat) / 269940919165612622802) [(7, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0109
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0110 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0110 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0110
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0111 : Poly :=
[
  term ((286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 111 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0111 : Poly :=
[
  term ((-286762777601360253371075 : Rat) / 1259724289439525573076) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((286762777601360253371075 : Rat) / 2519448578879051146152) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((286762777601360253371075 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0111
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0112 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0112 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0112
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0113 : Poly :=
[
  term ((10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0113 : Poly :=
[
  term ((-10540339390805179643510575 : Rat) / 3779172868318576719228) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 7558345736637153438456) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0113
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0114 : Poly :=
[
  term ((-17533825097803440405419 : Rat) / 89980306388537540934) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0114 : Poly :=
[
  term ((17533825097803440405419 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 89980306388537540934) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17533825097803440405419 : Rat) / 89980306388537540934) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17533825097803440405419 : Rat) / 89980306388537540934) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 89980306388537540934) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0114
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0115 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0115 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0115
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0116 : Poly :=
[
  term ((-57352555520272050674215 : Rat) / 839816192959683715384) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0116 : Poly :=
[
  term ((57352555520272050674215 : Rat) / 419908096479841857692) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57352555520272050674215 : Rat) / 839816192959683715384) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((57352555520272050674215 : Rat) / 839816192959683715384) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-57352555520272050674215 : Rat) / 419908096479841857692) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((57352555520272050674215 : Rat) / 839816192959683715384) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-57352555520272050674215 : Rat) / 839816192959683715384) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0116
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0117 : Poly :=
[
  term ((-698350242390053610371221 : Rat) / 839816192959683715384) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0117 : Poly :=
[
  term ((698350242390053610371221 : Rat) / 419908096479841857692) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 839816192959683715384) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 419908096479841857692) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((698350242390053610371221 : Rat) / 839816192959683715384) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((698350242390053610371221 : Rat) / 839816192959683715384) [(7, 1), (15, 3), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 839816192959683715384) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0117
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0118 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 118 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0118 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 1), (15, 5), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0118
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0119 : Poly :=
[
  term (-1 : Rat) [(7, 2), (16, 1)]
]

/-- Partial product 119 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0119 : Poly :=
[
  term (2 : Rat) [(6, 1), (7, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (7, 2), (16, 1)],
  term (-2 : Rat) [(7, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(7, 2), (14, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0119
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0120 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0120 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0120
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0121 : Poly :=
[
  term ((84592538989558104870410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0121 : Poly :=
[
  term ((-169185077979116209740820 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((84592538989558104870410 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((84592538989558104870410 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((169185077979116209740820 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84592538989558104870410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-84592538989558104870410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0121
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0122 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 122 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0122 : Poly :=
[
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 3), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0122
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0123 : Poly :=
[
  term ((399292486088623786466225 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 123 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0123 : Poly :=
[
  term ((-399292486088623786466225 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((399292486088623786466225 : Rat) / 1889586434159288359614) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((399292486088623786466225 : Rat) / 1889586434159288359614) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((399292486088623786466225 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-399292486088623786466225 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-399292486088623786466225 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0123
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0124 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

/-- Partial product 124 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0124 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0124
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0125 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0125 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0125
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0126 : Poly :=
[
  term ((-81752113926458096324111 : Rat) / 629862144719762786538) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0126 : Poly :=
[
  term ((81752113926458096324111 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 629862144719762786538) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 629862144719762786538) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 314931072359881393269) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((81752113926458096324111 : Rat) / 629862144719762786538) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((81752113926458096324111 : Rat) / 629862144719762786538) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0126
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0127 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

/-- Partial product 127 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0127 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (8, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (8, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 2), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0127
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0128 : Poly :=
[
  term ((16305695392190064240955 : Rat) / 51069903625926712422) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 128 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0128 : Poly :=
[
  term ((-16305695392190064240955 : Rat) / 25534951812963356211) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((16305695392190064240955 : Rat) / 51069903625926712422) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((16305695392190064240955 : Rat) / 51069903625926712422) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((16305695392190064240955 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16305695392190064240955 : Rat) / 51069903625926712422) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-16305695392190064240955 : Rat) / 51069903625926712422) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0128
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0129 : Poly :=
[
  term ((-3261139078438012848191 : Rat) / 17023301208642237474) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0129 : Poly :=
[
  term ((3261139078438012848191 : Rat) / 8511650604321118737) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 17023301208642237474) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 17023301208642237474) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3261139078438012848191 : Rat) / 17023301208642237474) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3261139078438012848191 : Rat) / 17023301208642237474) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0129
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0130 : Poly :=
[
  term ((-33546643923147958236110 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 130 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0130 : Poly :=
[
  term ((67093287846295916472220 : Rat) / 134970459582806311401) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33546643923147958236110 : Rat) / 134970459582806311401) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-33546643923147958236110 : Rat) / 134970459582806311401) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-67093287846295916472220 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((33546643923147958236110 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((33546643923147958236110 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0130
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0131 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 131 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0131 : Poly :=
[
  term ((561140382362965659392 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-561140382362965659392 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0131
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0132 : Poly :=
[
  term ((-59193058095623134110275 : Rat) / 209954048239920928846) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 132 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0132 : Poly :=
[
  term ((59193058095623134110275 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-59193058095623134110275 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-59193058095623134110275 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((59193058095623134110275 : Rat) / 209954048239920928846) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-59193058095623134110275 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((59193058095623134110275 : Rat) / 209954048239920928846) [(9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0132
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0133 : Poly :=
[
  term ((-73942603970873019200695 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 133 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0133 : Poly :=
[
  term ((73942603970873019200695 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 1889586434159288359614) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 1889586434159288359614) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((73942603970873019200695 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((73942603970873019200695 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0133
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0134 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 134 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0134 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0134
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0135 : Poly :=
[
  term ((6709328784629591647222 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0135 : Poly :=
[
  term ((-13418657569259183294444 : Rat) / 44990153194268770467) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6709328784629591647222 : Rat) / 44990153194268770467) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6709328784629591647222 : Rat) / 44990153194268770467) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((13418657569259183294444 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6709328784629591647222 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6709328784629591647222 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0135
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0136 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 136 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0136 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0136
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0137 : Poly :=
[
  term ((35515834857373880466165 : Rat) / 209954048239920928846) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0137 : Poly :=
[
  term ((-35515834857373880466165 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35515834857373880466165 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35515834857373880466165 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35515834857373880466165 : Rat) / 209954048239920928846) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((35515834857373880466165 : Rat) / 104977024119960464423) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35515834857373880466165 : Rat) / 209954048239920928846) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0137
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0138 : Poly :=
[
  term ((14788520794174603840139 : Rat) / 629862144719762786538) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0138 : Poly :=
[
  term ((-14788520794174603840139 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14788520794174603840139 : Rat) / 629862144719762786538) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((14788520794174603840139 : Rat) / 629862144719762786538) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((14788520794174603840139 : Rat) / 314931072359881393269) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14788520794174603840139 : Rat) / 629862144719762786538) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14788520794174603840139 : Rat) / 629862144719762786538) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0138
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0139 : Poly :=
[
  term ((119238268275054497728940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 139 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0139 : Poly :=
[
  term ((-238476536550108995457880 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119238268275054497728940 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((119238268275054497728940 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((238476536550108995457880 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-119238268275054497728940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-119238268275054497728940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0139
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0140 : Poly :=
[
  term ((141634564998196059626887 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0140 : Poly :=
[
  term ((-141634564998196059626887 : Rat) / 269940919165612622802) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((141634564998196059626887 : Rat) / 539881838331225245604) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((141634564998196059626887 : Rat) / 539881838331225245604) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((141634564998196059626887 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141634564998196059626887 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-141634564998196059626887 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0140
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0141 : Poly :=
[
  term ((146402606631614972870890 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 141 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0141 : Poly :=
[
  term ((-292805213263229945741780 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((146402606631614972870890 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((146402606631614972870890 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((292805213263229945741780 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-146402606631614972870890 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-146402606631614972870890 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0141
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0142 : Poly :=
[
  term ((-23847653655010899545788 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0142 : Poly :=
[
  term ((47695307310021799091576 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23847653655010899545788 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23847653655010899545788 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47695307310021799091576 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23847653655010899545788 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23847653655010899545788 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0142
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0143 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0143 : Poly :=
[
  term ((4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(10, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0143
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0144 : Poly :=
[
  term ((-268561642180649670455669 : Rat) / 1259724289439525573076) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0144 : Poly :=
[
  term ((268561642180649670455669 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-268561642180649670455669 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-268561642180649670455669 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-268561642180649670455669 : Rat) / 629862144719762786538) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((268561642180649670455669 : Rat) / 1259724289439525573076) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((268561642180649670455669 : Rat) / 1259724289439525573076) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0144
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0145 : Poly :=
[
  term ((-11 : Rat) / 12) [(10, 1), (16, 1)]
]

/-- Partial product 145 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0145 : Poly :=
[
  term ((11 : Rat) / 6) [(6, 1), (10, 1), (16, 1)],
  term ((-11 : Rat) / 12) [(6, 2), (10, 1), (16, 1)],
  term ((-11 : Rat) / 12) [(7, 2), (10, 1), (16, 1)],
  term ((-11 : Rat) / 6) [(10, 1), (14, 1), (16, 1)],
  term ((11 : Rat) / 12) [(10, 1), (14, 2), (16, 1)],
  term ((11 : Rat) / 12) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0145
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0146 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0146 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0146
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0147 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0147 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0147
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0148 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0148 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0148
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0149 : Poly :=
[
  term ((318601086989403574874359 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0149 : Poly :=
[
  term ((-318601086989403574874359 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((318601086989403574874359 : Rat) / 539881838331225245604) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((318601086989403574874359 : Rat) / 539881838331225245604) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((318601086989403574874359 : Rat) / 269940919165612622802) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-318601086989403574874359 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-318601086989403574874359 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0149
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0150 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 150 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0150 : Poly :=
[
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 3), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0150
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0151 : Poly :=
[
  term ((-83349039484561705577365 : Rat) / 222304286371680983484) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 151 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0151 : Poly :=
[
  term ((83349039484561705577365 : Rat) / 111152143185840491742) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83349039484561705577365 : Rat) / 222304286371680983484) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-83349039484561705577365 : Rat) / 222304286371680983484) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((83349039484561705577365 : Rat) / 222304286371680983484) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-83349039484561705577365 : Rat) / 111152143185840491742) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((83349039484561705577365 : Rat) / 222304286371680983484) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0151
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0152 : Poly :=
[
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 152 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0152 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0152
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0153 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0153 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 6427164742038395781) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0153
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0154 : Poly :=
[
  term ((-7693283232052040807705 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0154 : Poly :=
[
  term ((7693283232052040807705 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((7693283232052040807705 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((7693283232052040807705 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0154
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0155 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0155 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0155
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0156 : Poly :=
[
  term ((28323920609494039575047 : Rat) / 222304286371680983484) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0156 : Poly :=
[
  term ((-28323920609494039575047 : Rat) / 111152143185840491742) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((28323920609494039575047 : Rat) / 222304286371680983484) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((28323920609494039575047 : Rat) / 222304286371680983484) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28323920609494039575047 : Rat) / 222304286371680983484) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((28323920609494039575047 : Rat) / 111152143185840491742) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28323920609494039575047 : Rat) / 222304286371680983484) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0156
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0157 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0157 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((19658569523537250279800 : Rat) / 314931072359881393269) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(11, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0157
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0158 : Poly :=
[
  term ((-25654216504072994545094059 : Rat) / 15116691473274306876912) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0158 : Poly :=
[
  term ((25654216504072994545094059 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 15116691473274306876912) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 15116691473274306876912) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((25654216504072994545094059 : Rat) / 15116691473274306876912) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((25654216504072994545094059 : Rat) / 15116691473274306876912) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0158
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0159 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

/-- Partial product 159 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0159 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (14, 2), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (15, 3), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0159
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0160 : Poly :=
[
  term ((-103445148020969047682780 : Rat) / 944793217079644179807) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 160 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0160 : Poly :=
[
  term ((206890296041938095365560 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-103445148020969047682780 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-103445148020969047682780 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-206890296041938095365560 : Rat) / 944793217079644179807) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((103445148020969047682780 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((103445148020969047682780 : Rat) / 944793217079644179807) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0160
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0161 : Poly :=
[
  term ((-253053144372304185573095 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 161 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0161 : Poly :=
[
  term ((506106288744608371146190 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-253053144372304185573095 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((-253053144372304185573095 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-506106288744608371146190 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((253053144372304185573095 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((253053144372304185573095 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0161
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0162 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

/-- Partial product 162 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0162 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0162
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0163 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0163 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0163
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0164 : Poly :=
[
  term ((-949104692239573859230865 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 164 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0164 : Poly :=
[
  term ((949104692239573859230865 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-949104692239573859230865 : Rat) / 3779172868318576719228) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((-949104692239573859230865 : Rat) / 3779172868318576719228) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((949104692239573859230865 : Rat) / 3779172868318576719228) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-949104692239573859230865 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)],
  term ((949104692239573859230865 : Rat) / 3779172868318576719228) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0164
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0165 : Poly :=
[
  term ((162309894182619403410560 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0165 : Poly :=
[
  term ((-324619788365238806821120 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((162309894182619403410560 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((162309894182619403410560 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((324619788365238806821120 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-162309894182619403410560 : Rat) / 944793217079644179807) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-162309894182619403410560 : Rat) / 944793217079644179807) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0165
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0166 : Poly :=
[
  term ((1207170577489170430064317 : Rat) / 629862144719762786538) [(11, 2), (16, 1)]
]

/-- Partial product 166 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0166 : Poly :=
[
  term ((-1207170577489170430064317 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 314931072359881393269) [(11, 2), (14, 1), (16, 1)],
  term ((-1207170577489170430064317 : Rat) / 629862144719762786538) [(11, 2), (14, 2), (16, 1)],
  term ((-1207170577489170430064317 : Rat) / 629862144719762786538) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0166
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0167 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

/-- Partial product 167 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0167 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0167
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0168 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)]
]

/-- Partial product 168 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0168 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0168
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0169 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0169 : Poly :=
[
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0169
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0170 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0170 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0170
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0171 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0171 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0171
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0172 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0172 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0172
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0173 : Poly :=
[
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 173 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0173 : Poly :=
[
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(12, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0173
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0174 : Poly :=
[
  term ((-324576012486458995749017 : Rat) / 1259724289439525573076) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0174 : Poly :=
[
  term ((324576012486458995749017 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-324576012486458995749017 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-324576012486458995749017 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-324576012486458995749017 : Rat) / 629862144719762786538) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((324576012486458995749017 : Rat) / 1259724289439525573076) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((324576012486458995749017 : Rat) / 1259724289439525573076) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0174
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0175 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

/-- Partial product 175 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0175 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 2), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0175
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0176 : Poly :=
[
  term ((5 : Rat) / 6) [(12, 1), (16, 1)]
]

/-- Partial product 176 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0176 : Poly :=
[
  term ((-5 : Rat) / 3) [(6, 1), (12, 1), (16, 1)],
  term ((5 : Rat) / 6) [(6, 2), (12, 1), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (12, 1), (16, 1)],
  term ((5 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(12, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0176
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0177 : Poly :=
[
  term ((16669807896912341115473 : Rat) / 74101428790560327828) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0177 : Poly :=
[
  term ((-16669807896912341115473 : Rat) / 37050714395280163914) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16669807896912341115473 : Rat) / 74101428790560327828) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16669807896912341115473 : Rat) / 74101428790560327828) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16669807896912341115473 : Rat) / 74101428790560327828) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((16669807896912341115473 : Rat) / 37050714395280163914) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16669807896912341115473 : Rat) / 74101428790560327828) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0177
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0178 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0178 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0178
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0179 : Poly :=
[
  term ((442900866056829077565 : Rat) / 419908096479841857692) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0179 : Poly :=
[
  term ((-442900866056829077565 : Rat) / 209954048239920928846) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((442900866056829077565 : Rat) / 419908096479841857692) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((442900866056829077565 : Rat) / 419908096479841857692) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((442900866056829077565 : Rat) / 209954048239920928846) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-442900866056829077565 : Rat) / 419908096479841857692) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-442900866056829077565 : Rat) / 419908096479841857692) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0179_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0179
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0180 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 180 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0180 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0180_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0180
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0181 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0181 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0181_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0181
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0182 : Poly :=
[
  term ((4397808249117282138136 : Rat) / 314931072359881393269) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 182 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0182 : Poly :=
[
  term ((-8795616498234564276272 : Rat) / 314931072359881393269) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((4397808249117282138136 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((4397808249117282138136 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4397808249117282138136 : Rat) / 314931072359881393269) [(14, 1), (15, 4), (16, 1)],
  term ((8795616498234564276272 : Rat) / 314931072359881393269) [(14, 2), (15, 2), (16, 1)],
  term ((-4397808249117282138136 : Rat) / 314931072359881393269) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0182_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0182
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0183 : Poly :=
[
  term ((5 : Rat) / 6) [(14, 1), (16, 1)]
]

/-- Partial product 183 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0183 : Poly :=
[
  term ((-5 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(6, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(7, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(14, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0183_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0183
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0184 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0184 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(14, 2), (15, 4), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(14, 3), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0184_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0184
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0185 : Poly :=
[
  term ((1639276902058824087648359 : Rat) / 5038897157758102292304) [(15, 2), (16, 1)]
]

/-- Partial product 185 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0185 : Poly :=
[
  term ((-1639276902058824087648359 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((1639276902058824087648359 : Rat) / 5038897157758102292304) [(6, 2), (15, 2), (16, 1)],
  term ((1639276902058824087648359 : Rat) / 5038897157758102292304) [(7, 2), (15, 2), (16, 1)],
  term ((1639276902058824087648359 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)],
  term ((-1639276902058824087648359 : Rat) / 5038897157758102292304) [(14, 2), (15, 2), (16, 1)],
  term ((-1639276902058824087648359 : Rat) / 5038897157758102292304) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0185_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0185
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0186 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

/-- Partial product 186 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0186 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 2), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(15, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0186_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0186
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0187 : Poly :=
[
  term ((4042676313668845167580 : Rat) / 314931072359881393269) [(15, 4), (16, 1)]
]

/-- Partial product 187 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0187 : Poly :=
[
  term ((-8085352627337690335160 : Rat) / 314931072359881393269) [(6, 1), (15, 4), (16, 1)],
  term ((4042676313668845167580 : Rat) / 314931072359881393269) [(6, 2), (15, 4), (16, 1)],
  term ((4042676313668845167580 : Rat) / 314931072359881393269) [(7, 2), (15, 4), (16, 1)],
  term ((8085352627337690335160 : Rat) / 314931072359881393269) [(14, 1), (15, 4), (16, 1)],
  term ((-4042676313668845167580 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((-4042676313668845167580 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0187_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0187
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def rs_R007_ueqv_R007NY_coefficient_05_0188 : Poly :=
[
  term ((31 : Rat) / 24) [(16, 1)]
]

/-- Partial product 188 for generator 5. -/
def rs_R007_ueqv_R007NY_partial_05_0188 : Poly :=
[
  term ((-31 : Rat) / 12) [(6, 1), (16, 1)],
  term ((31 : Rat) / 24) [(6, 2), (16, 1)],
  term ((31 : Rat) / 24) [(7, 2), (16, 1)],
  term ((31 : Rat) / 12) [(14, 1), (16, 1)],
  term ((-31 : Rat) / 24) [(14, 2), (16, 1)],
  term ((-31 : Rat) / 24) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem rs_R007_ueqv_R007NY_partial_05_0188_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_05_0188
        rs_R007_ueqv_R007NY_generator_05_0100_0188 =
      rs_R007_ueqv_R007NY_partial_05_0188 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_05_0100_0188 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_05_0100,
  rs_R007_ueqv_R007NY_partial_05_0101,
  rs_R007_ueqv_R007NY_partial_05_0102,
  rs_R007_ueqv_R007NY_partial_05_0103,
  rs_R007_ueqv_R007NY_partial_05_0104,
  rs_R007_ueqv_R007NY_partial_05_0105,
  rs_R007_ueqv_R007NY_partial_05_0106,
  rs_R007_ueqv_R007NY_partial_05_0107,
  rs_R007_ueqv_R007NY_partial_05_0108,
  rs_R007_ueqv_R007NY_partial_05_0109,
  rs_R007_ueqv_R007NY_partial_05_0110,
  rs_R007_ueqv_R007NY_partial_05_0111,
  rs_R007_ueqv_R007NY_partial_05_0112,
  rs_R007_ueqv_R007NY_partial_05_0113,
  rs_R007_ueqv_R007NY_partial_05_0114,
  rs_R007_ueqv_R007NY_partial_05_0115,
  rs_R007_ueqv_R007NY_partial_05_0116,
  rs_R007_ueqv_R007NY_partial_05_0117,
  rs_R007_ueqv_R007NY_partial_05_0118,
  rs_R007_ueqv_R007NY_partial_05_0119,
  rs_R007_ueqv_R007NY_partial_05_0120,
  rs_R007_ueqv_R007NY_partial_05_0121,
  rs_R007_ueqv_R007NY_partial_05_0122,
  rs_R007_ueqv_R007NY_partial_05_0123,
  rs_R007_ueqv_R007NY_partial_05_0124,
  rs_R007_ueqv_R007NY_partial_05_0125,
  rs_R007_ueqv_R007NY_partial_05_0126,
  rs_R007_ueqv_R007NY_partial_05_0127,
  rs_R007_ueqv_R007NY_partial_05_0128,
  rs_R007_ueqv_R007NY_partial_05_0129,
  rs_R007_ueqv_R007NY_partial_05_0130,
  rs_R007_ueqv_R007NY_partial_05_0131,
  rs_R007_ueqv_R007NY_partial_05_0132,
  rs_R007_ueqv_R007NY_partial_05_0133,
  rs_R007_ueqv_R007NY_partial_05_0134,
  rs_R007_ueqv_R007NY_partial_05_0135,
  rs_R007_ueqv_R007NY_partial_05_0136,
  rs_R007_ueqv_R007NY_partial_05_0137,
  rs_R007_ueqv_R007NY_partial_05_0138,
  rs_R007_ueqv_R007NY_partial_05_0139,
  rs_R007_ueqv_R007NY_partial_05_0140,
  rs_R007_ueqv_R007NY_partial_05_0141,
  rs_R007_ueqv_R007NY_partial_05_0142,
  rs_R007_ueqv_R007NY_partial_05_0143,
  rs_R007_ueqv_R007NY_partial_05_0144,
  rs_R007_ueqv_R007NY_partial_05_0145,
  rs_R007_ueqv_R007NY_partial_05_0146,
  rs_R007_ueqv_R007NY_partial_05_0147,
  rs_R007_ueqv_R007NY_partial_05_0148,
  rs_R007_ueqv_R007NY_partial_05_0149,
  rs_R007_ueqv_R007NY_partial_05_0150,
  rs_R007_ueqv_R007NY_partial_05_0151,
  rs_R007_ueqv_R007NY_partial_05_0152,
  rs_R007_ueqv_R007NY_partial_05_0153,
  rs_R007_ueqv_R007NY_partial_05_0154,
  rs_R007_ueqv_R007NY_partial_05_0155,
  rs_R007_ueqv_R007NY_partial_05_0156,
  rs_R007_ueqv_R007NY_partial_05_0157,
  rs_R007_ueqv_R007NY_partial_05_0158,
  rs_R007_ueqv_R007NY_partial_05_0159,
  rs_R007_ueqv_R007NY_partial_05_0160,
  rs_R007_ueqv_R007NY_partial_05_0161,
  rs_R007_ueqv_R007NY_partial_05_0162,
  rs_R007_ueqv_R007NY_partial_05_0163,
  rs_R007_ueqv_R007NY_partial_05_0164,
  rs_R007_ueqv_R007NY_partial_05_0165,
  rs_R007_ueqv_R007NY_partial_05_0166,
  rs_R007_ueqv_R007NY_partial_05_0167,
  rs_R007_ueqv_R007NY_partial_05_0168,
  rs_R007_ueqv_R007NY_partial_05_0169,
  rs_R007_ueqv_R007NY_partial_05_0170,
  rs_R007_ueqv_R007NY_partial_05_0171,
  rs_R007_ueqv_R007NY_partial_05_0172,
  rs_R007_ueqv_R007NY_partial_05_0173,
  rs_R007_ueqv_R007NY_partial_05_0174,
  rs_R007_ueqv_R007NY_partial_05_0175,
  rs_R007_ueqv_R007NY_partial_05_0176,
  rs_R007_ueqv_R007NY_partial_05_0177,
  rs_R007_ueqv_R007NY_partial_05_0178,
  rs_R007_ueqv_R007NY_partial_05_0179,
  rs_R007_ueqv_R007NY_partial_05_0180,
  rs_R007_ueqv_R007NY_partial_05_0181,
  rs_R007_ueqv_R007NY_partial_05_0182,
  rs_R007_ueqv_R007NY_partial_05_0183,
  rs_R007_ueqv_R007NY_partial_05_0184,
  rs_R007_ueqv_R007NY_partial_05_0185,
  rs_R007_ueqv_R007NY_partial_05_0186,
  rs_R007_ueqv_R007NY_partial_05_0187,
  rs_R007_ueqv_R007NY_partial_05_0188
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_05_0100_0188 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38052518190511161859234 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1109958272812281033344 : Rat) / 2142388247346131927) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((26066831810256060103837 : Rat) / 419908096479841857692) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((38052518190511161859234 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-53147063381059292732891 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-19026259095255580929617 : Rat) / 104977024119960464423) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((-26066831810256060103837 : Rat) / 419908096479841857692) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((461170474752670225174685 : Rat) / 839816192959683715384) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-554979136406140516672 : Rat) / 2142388247346131927) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((26066831810256060103837 : Rat) / 839816192959683715384) [(5, 1), (15, 3), (16, 1)],
  term ((-270576514102378973183290 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((54115302820475794636658 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((55527089800015574983105 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11105417960003114996621 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-87669125489017202027095 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-286762777601360253371075 : Rat) / 1259724289439525573076) [(6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10540339390805179643510575 : Rat) / 3779172868318576719228) [(6, 1), (7, 1), (11, 1), (16, 1)],
  term ((17533825097803440405419 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((57352555520272050674215 : Rat) / 419908096479841857692) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((698350242390053610371221 : Rat) / 419908096479841857692) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term (2 : Rat) [(6, 1), (7, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-169185077979116209740820 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((-399292486088623786466225 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (11, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((81752113926458096324111 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (8, 1), (15, 2), (16, 2)],
  term ((-16305695392190064240955 : Rat) / 25534951812963356211) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((3261139078438012848191 : Rat) / 8511650604321118737) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((67093287846295916472220 : Rat) / 134970459582806311401) [(6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((561140382362965659392 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((59193058095623134110275 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((73942603970873019200695 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((-13418657569259183294444 : Rat) / 44990153194268770467) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35515834857373880466165 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14788520794174603840139 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-238476536550108995457880 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-141634564998196059626887 : Rat) / 269940919165612622802) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-292805213263229945741780 : Rat) / 944793217079644179807) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((47695307310021799091576 : Rat) / 314931072359881393269) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((268561642180649670455669 : Rat) / 629862144719762786538) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 6) [(6, 1), (10, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-318601086989403574874359 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((83349039484561705577365 : Rat) / 111152143185840491742) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 6427164742038395781) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7693283232052040807705 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28323920609494039575047 : Rat) / 111152143185840491742) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((25654216504072994545094059 : Rat) / 7558345736637153438456) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((206890296041938095365560 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((506106288744608371146190 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((949104692239573859230865 : Rat) / 1889586434159288359614) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-324619788365238806821120 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1207170577489170430064317 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((324576012486458995749017 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((-5 : Rat) / 3) [(6, 1), (12, 1), (16, 1)],
  term ((-16669807896912341115473 : Rat) / 37050714395280163914) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-442900866056829077565 : Rat) / 209954048239920928846) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8795616498234564276272 : Rat) / 314931072359881393269) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 3) [(6, 1), (14, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1639276902058824087648359 : Rat) / 2519448578879051146152) [(6, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((-8085352627337690335160 : Rat) / 314931072359881393269) [(6, 1), (15, 4), (16, 1)],
  term ((-31 : Rat) / 12) [(6, 1), (16, 1)],
  term ((135288257051189486591645 : Rat) / 944793217079644179807) [(6, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-27057651410237897318329 : Rat) / 314931072359881393269) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 629862144719762786538) [(6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((11105417960003114996621 : Rat) / 209954048239920928846) [(6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((87669125489017202027095 : Rat) / 269940919165612622802) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((286762777601360253371075 : Rat) / 2519448578879051146152) [(6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 7558345736637153438456) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 89980306388537540934) [(6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57352555520272050674215 : Rat) / 839816192959683715384) [(6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 839816192959683715384) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term (-1 : Rat) [(6, 2), (7, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((84592538989558104870410 : Rat) / 944793217079644179807) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((399292486088623786466225 : Rat) / 1889586434159288359614) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (8, 1), (11, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 629862144719762786538) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (8, 1), (15, 2), (16, 2)],
  term ((16305695392190064240955 : Rat) / 51069903625926712422) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 17023301208642237474) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33546643923147958236110 : Rat) / 134970459582806311401) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-59193058095623134110275 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 1889586434159288359614) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((6709328784629591647222 : Rat) / 44990153194268770467) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35515834857373880466165 : Rat) / 209954048239920928846) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14788520794174603840139 : Rat) / 629862144719762786538) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((119238268275054497728940 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((141634564998196059626887 : Rat) / 539881838331225245604) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((146402606631614972870890 : Rat) / 944793217079644179807) [(6, 2), (10, 1), (11, 2), (16, 1)],
  term ((-23847653655010899545788 : Rat) / 314931072359881393269) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-268561642180649670455669 : Rat) / 1259724289439525573076) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 12) [(6, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((318601086989403574874359 : Rat) / 539881838331225245604) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-83349039484561705577365 : Rat) / 222304286371680983484) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 3779172868318576719228) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28323920609494039575047 : Rat) / 222304286371680983484) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(6, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 15116691473274306876912) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 2), (11, 1), (15, 1), (16, 2)],
  term ((-103445148020969047682780 : Rat) / 944793217079644179807) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-253053144372304185573095 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (12, 1), (16, 2)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-949104692239573859230865 : Rat) / 3779172868318576719228) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((162309894182619403410560 : Rat) / 944793217079644179807) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 629862144719762786538) [(6, 2), (11, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 2), (11, 2), (16, 2)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(6, 2), (11, 3), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-324576012486458995749017 : Rat) / 1259724289439525573076) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 2), (12, 1), (15, 2), (16, 2)],
  term ((5 : Rat) / 6) [(6, 2), (12, 1), (16, 1)],
  term ((16669807896912341115473 : Rat) / 74101428790560327828) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(6, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((442900866056829077565 : Rat) / 419908096479841857692) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((4397808249117282138136 : Rat) / 314931072359881393269) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 6) [(6, 2), (14, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(6, 2), (14, 2), (15, 2), (16, 1)],
  term ((1639276902058824087648359 : Rat) / 5038897157758102292304) [(6, 2), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 2), (15, 2), (16, 2)],
  term ((4042676313668845167580 : Rat) / 314931072359881393269) [(6, 2), (15, 4), (16, 1)],
  term ((31 : Rat) / 24) [(6, 2), (16, 1)],
  term ((270576514102378973183290 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-135288257051189486591645 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-135288257051189486591645 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-54115302820475794636658 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((27057651410237897318329 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((27057651410237897318329 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((55527089800015574983105 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((55527089800015574983105 : Rat) / 629862144719762786538) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((11105417960003114996621 : Rat) / 104977024119960464423) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11105417960003114996621 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11105417960003114996621 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((87669125489017202027095 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-87669125489017202027095 : Rat) / 269940919165612622802) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-87669125489017202027095 : Rat) / 269940919165612622802) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-661483389389480355082825 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8819762725197018123284125 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 44990153194268770467) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17533825097803440405419 : Rat) / 89980306388537540934) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17533825097803440405419 : Rat) / 89980306388537540934) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 419908096479841857692) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((132296677877896071016565 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((583645131349509509022791 : Rat) / 839816192959683715384) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 1), (14, 2), (15, 3), (16, 1)],
  term ((57352555520272050674215 : Rat) / 839816192959683715384) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((698350242390053610371221 : Rat) / 839816192959683715384) [(7, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(7, 1), (15, 5), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((84592538989558104870410 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 2)],
  term ((399292486088623786466225 : Rat) / 1889586434159288359614) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 629862144719762786538) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (8, 1), (15, 2), (16, 2)],
  term ((16305695392190064240955 : Rat) / 51069903625926712422) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 17023301208642237474) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-33546643923147958236110 : Rat) / 134970459582806311401) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-59193058095623134110275 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 1889586434159288359614) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 2)],
  term ((6709328784629591647222 : Rat) / 44990153194268770467) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 2)],
  term ((35515834857373880466165 : Rat) / 209954048239920928846) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((14788520794174603840139 : Rat) / 629862144719762786538) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((119238268275054497728940 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((141634564998196059626887 : Rat) / 539881838331225245604) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((146402606631614972870890 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-23847653655010899545788 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-268561642180649670455669 : Rat) / 1259724289439525573076) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 12) [(7, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((318601086989403574874359 : Rat) / 539881838331225245604) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-83349039484561705577365 : Rat) / 222304286371680983484) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 6427164742038395781) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 3779172868318576719228) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28323920609494039575047 : Rat) / 222304286371680983484) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 15116691473274306876912) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(7, 2), (11, 1), (15, 1), (16, 2)],
  term ((-103445148020969047682780 : Rat) / 944793217079644179807) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-253053144372304185573095 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (16, 2)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-949104692239573859230865 : Rat) / 3779172868318576719228) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((162309894182619403410560 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (16, 2)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 14996717731422923489) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((-324576012486458995749017 : Rat) / 1259724289439525573076) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (12, 1), (15, 2), (16, 2)],
  term ((5 : Rat) / 6) [(7, 2), (12, 1), (16, 1)],
  term ((16669807896912341115473 : Rat) / 74101428790560327828) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((442900866056829077565 : Rat) / 419908096479841857692) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((4397808249117282138136 : Rat) / 314931072359881393269) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 6) [(7, 2), (14, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(7, 2), (14, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(7, 2), (14, 2), (16, 1)],
  term ((1644315799216582189940663 : Rat) / 5038897157758102292304) [(7, 2), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 2), (15, 2), (16, 2)],
  term ((4042676313668845167580 : Rat) / 314931072359881393269) [(7, 2), (15, 4), (16, 1)],
  term ((31 : Rat) / 24) [(7, 2), (16, 1)],
  term ((135288257051189486591645 : Rat) / 944793217079644179807) [(7, 3), (8, 1), (11, 1), (16, 1)],
  term ((-27057651410237897318329 : Rat) / 314931072359881393269) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((-55527089800015574983105 : Rat) / 629862144719762786538) [(7, 3), (10, 1), (11, 1), (16, 1)],
  term ((11105417960003114996621 : Rat) / 209954048239920928846) [(7, 3), (10, 1), (15, 1), (16, 1)],
  term ((87669125489017202027095 : Rat) / 269940919165612622802) [(7, 3), (11, 1), (12, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((286762777601360253371075 : Rat) / 2519448578879051146152) [(7, 3), (11, 1), (14, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(7, 3), (11, 1), (15, 2), (16, 1)],
  term ((10540339390805179643510575 : Rat) / 7558345736637153438456) [(7, 3), (11, 1), (16, 1)],
  term ((-17533825097803440405419 : Rat) / 89980306388537540934) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((-57352555520272050674215 : Rat) / 839816192959683715384) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-698350242390053610371221 : Rat) / 839816192959683715384) [(7, 3), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(7, 3), (15, 3), (16, 1)],
  term (-1 : Rat) [(7, 4), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((169185077979116209740820 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-280570191181482829696 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-84592538989558104870410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-84592538989558104870410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 3), (16, 2)],
  term ((399292486088623786466225 : Rat) / 944793217079644179807) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 1), (16, 2)],
  term ((-399292486088623786466225 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (14, 2), (16, 2)],
  term ((-399292486088623786466225 : Rat) / 1889586434159288359614) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-81752113926458096324111 : Rat) / 314931072359881393269) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)],
  term ((81752113926458096324111 : Rat) / 629862144719762786538) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (14, 2), (15, 2), (16, 2)],
  term ((81752113926458096324111 : Rat) / 629862144719762786538) [(8, 1), (15, 4), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (15, 4), (16, 2)],
  term ((16305695392190064240955 : Rat) / 25534951812963356211) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16305695392190064240955 : Rat) / 51069903625926712422) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-16305695392190064240955 : Rat) / 51069903625926712422) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3261139078438012848191 : Rat) / 8511650604321118737) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3261139078438012848191 : Rat) / 17023301208642237474) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3261139078438012848191 : Rat) / 17023301208642237474) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-67093287846295916472220 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((33546643923147958236110 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((33546643923147958236110 : Rat) / 134970459582806311401) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-561140382362965659392 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 2)],
  term ((59193058095623134110275 : Rat) / 209954048239920928846) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-73942603970873019200695 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-991532441750343394784255 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((59193058095623134110275 : Rat) / 209954048239920928846) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((73942603970873019200695 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)],
  term ((13418657569259183294444 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6709328784629591647222 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6709328784629591647222 : Rat) / 44990153194268770467) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 4), (16, 2)],
  term ((14788520794174603840139 : Rat) / 314931072359881393269) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35515834857373880466165 : Rat) / 209954048239920928846) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((198306488350068678956851 : Rat) / 629862144719762786538) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35515834857373880466165 : Rat) / 209954048239920928846) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-14788520794174603840139 : Rat) / 629862144719762786538) [(9, 1), (15, 3), (16, 1)],
  term ((238476536550108995457880 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-119238268275054497728940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-119238268275054497728940 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((141634564998196059626887 : Rat) / 269940919165612622802) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-141634564998196059626887 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-141634564998196059626887 : Rat) / 539881838331225245604) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((292805213263229945741780 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-146402606631614972870890 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (14, 2), (16, 1)],
  term ((-146402606631614972870890 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-47695307310021799091576 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23847653655010899545788 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((23847653655010899545788 : Rat) / 314931072359881393269) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-89380578028056609532659 : Rat) / 209954048239920928846) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 6) [(10, 1), (14, 1), (16, 1)],
  term ((268561642180649670455669 : Rat) / 1259724289439525573076) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 12) [(10, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(10, 1), (14, 3), (16, 1)],
  term ((11 : Rat) / 12) [(10, 1), (15, 2), (16, 1)],
  term ((268561642180649670455669 : Rat) / 1259724289439525573076) [(10, 1), (15, 4), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((318601086989403574874359 : Rat) / 269940919165612622802) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-39428575383753559521937 : Rat) / 77125976904460749372) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-318601086989403574874359 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 3), (16, 2)],
  term ((3086895195920192397070565 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7693283232052040807705 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-38695962200341864550560 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2826174059243045948822705 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((1913946029774050007391205 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 4), (16, 1)],
  term ((7693283232052040807705 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 6427164742038395781) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-25654216504072994545094059 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-1309067834529151054238039 : Rat) / 3779172868318576719228) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1405060462236389710823831 : Rat) / 719842451108300327472) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (14, 2), (15, 1), (16, 2)],
  term ((73957293735663172263080 : Rat) / 944793217079644179807) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-245603816078951669418199 : Rat) / 3779172868318576719228) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 314931072359881393269) [(11, 1), (14, 4), (15, 1), (16, 1)],
  term ((25654216504072994545094059 : Rat) / 15116691473274306876912) [(11, 1), (15, 3), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (15, 3), (16, 2)],
  term ((103445148020969047682780 : Rat) / 944793217079644179807) [(11, 1), (15, 5), (16, 1)],
  term ((-506106288744608371146190 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((253053144372304185573095 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)],
  term ((253053144372304185573095 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (15, 2), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((2098584356396385701695 : Rat) / 3528639466217158468) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1207170577489170430064317 : Rat) / 314931072359881393269) [(11, 2), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)],
  term ((-162309894182619403410560 : Rat) / 944793217079644179807) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2285308212353542574711908 : Rat) / 944793217079644179807) [(11, 2), (14, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)],
  term ((949104692239573859230865 : Rat) / 3779172868318576719228) [(11, 2), (14, 3), (16, 1)],
  term ((-1207170577489170430064317 : Rat) / 629862144719762786538) [(11, 2), (15, 2), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (15, 2), (16, 2)],
  term ((-162309894182619403410560 : Rat) / 944793217079644179807) [(11, 2), (15, 4), (16, 1)],
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 2), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 3), (14, 2), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 3), (15, 3), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-54078505910389839214099 : Rat) / 104977024119960464423) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 3) [(12, 1), (14, 1), (16, 1)],
  term ((264934529462078874239897 : Rat) / 1259724289439525573076) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 2), (15, 2), (16, 2)],
  term ((-7 : Rat) / 6) [(12, 1), (14, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 14996717731422923489) [(12, 1), (14, 3), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 3), (16, 1)],
  term ((-5 : Rat) / 6) [(12, 1), (15, 2), (16, 1)],
  term ((324576012486458995749017 : Rat) / 1259724289439525573076) [(12, 1), (15, 4), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (15, 4), (16, 2)],
  term ((442900866056829077565 : Rat) / 209954048239920928846) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-521952666345030284999521 : Rat) / 1259724289439525573076) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((565444765896849110693387 : Rat) / 1259724289439525573076) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 2646479599662868851) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-382789205954810001478241 : Rat) / 1259724289439525573076) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 4), (15, 1), (16, 1)],
  term ((-442900866056829077565 : Rat) / 419908096479841857692) [(13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 1), (15, 5), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(13, 2), (15, 4), (16, 1)],
  term ((1637177361576424878359899 : Rat) / 2519448578879051146152) [(14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)],
  term ((3687544378220408197024 : Rat) / 314931072359881393269) [(14, 1), (15, 4), (16, 1)],
  term ((31 : Rat) / 12) [(14, 1), (16, 1)],
  term ((-499515679362357019742669 : Rat) / 1679632385919367430768) [(14, 2), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 2), (15, 2), (16, 2)],
  term ((1854894543392329916360 : Rat) / 314931072359881393269) [(14, 2), (15, 4), (16, 1)],
  term ((3 : Rat) / 8) [(14, 2), (16, 1)],
  term ((-16192949963239632306016 : Rat) / 314931072359881393269) [(14, 3), (15, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(14, 3), (16, 1)],
  term ((1965856952353725027980 : Rat) / 104977024119960464423) [(14, 4), (15, 2), (16, 1)],
  term ((-31 : Rat) / 24) [(15, 2), (16, 1)],
  term ((-1639276902058824087648359 : Rat) / 5038897157758102292304) [(15, 4), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(15, 4), (16, 2)],
  term ((-4042676313668845167580 : Rat) / 314931072359881393269) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 188. -/
theorem rs_R007_ueqv_R007NY_block_05_0100_0188_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_05_0100_0188
      rs_R007_ueqv_R007NY_block_05_0100_0188 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
