/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 18:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_18_0100_0199 : Poly :=
[
  term (2 : Rat) [(6, 1), (10, 1)],
  term (2 : Rat) [(7, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0100 : Poly :=
[
  term ((10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0100 : Poly :=
[
  term ((20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0100
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0101 : Poly :=
[
  term ((12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0101 : Poly :=
[
  term ((24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 3), (16, 1)],
  term ((-12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0101
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0102 : Poly :=
[
  term ((-2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0102 : Poly :=
[
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0102
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0103 : Poly :=
[
  term ((-78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0103 : Poly :=
[
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0103
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0104 : Poly :=
[
  term ((-4225848088861059004625 : Rat) / 7295700517989530346) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0104 : Poly :=
[
  term ((-4225848088861059004625 : Rat) / 3647850258994765173) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4225848088861059004625 : Rat) / 3647850258994765173) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((4225848088861059004625 : Rat) / 7295700517989530346) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((4225848088861059004625 : Rat) / 7295700517989530346) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0104
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0105 : Poly :=
[
  term ((417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0105 : Poly :=
[
  term ((835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0105
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0106 : Poly :=
[
  term ((975132398934881056801945 : Rat) / 1259724289439525573076) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 106 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0106 : Poly :=
[
  term ((975132398934881056801945 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((975132398934881056801945 : Rat) / 629862144719762786538) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-975132398934881056801945 : Rat) / 1259724289439525573076) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-975132398934881056801945 : Rat) / 1259724289439525573076) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0106
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0107 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0107 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0107
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0108 : Poly :=
[
  term ((845169617772211800925 : Rat) / 2431900172663176782) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0108 : Poly :=
[
  term ((845169617772211800925 : Rat) / 1215950086331588391) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((845169617772211800925 : Rat) / 1215950086331588391) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-845169617772211800925 : Rat) / 2431900172663176782) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-845169617772211800925 : Rat) / 2431900172663176782) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0108
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0109 : Poly :=
[
  term ((15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 109 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0109 : Poly :=
[
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0109
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0110 : Poly :=
[
  term ((-195026479786976211360389 : Rat) / 419908096479841857692) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0110 : Poly :=
[
  term ((-195026479786976211360389 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-195026479786976211360389 : Rat) / 209954048239920928846) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((195026479786976211360389 : Rat) / 419908096479841857692) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((195026479786976211360389 : Rat) / 419908096479841857692) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0110
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0111 : Poly :=
[
  term ((-83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 111 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0111 : Poly :=
[
  term ((-166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term ((83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0111
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0112 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 112 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0112 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 3), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 3), (11, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0112
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0113 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 113 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0113 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0113
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0114 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 114 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0114 : Poly :=
[
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 3), (14, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0114
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0115 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 115 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0115 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 2), (11, 1), (14, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 3), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0115
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0116 : Poly :=
[
  term ((531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 116 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0116 : Poly :=
[
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0116
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0117 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0117 : Poly :=
[
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0117
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0118 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 118 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0118 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0118
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0119 : Poly :=
[
  term ((-106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0119 : Poly :=
[
  term ((-212735596171439970453248 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-212735596171439970453248 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0119
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0120 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 2)]
]

/-- Partial product 120 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0120 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0120
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0121 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 121 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0121 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0121
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0122 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 2)]
]

/-- Partial product 122 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0122 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0122
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0123 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0123 : Poly :=
[
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0123
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0124 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 124 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0124 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0124
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0125 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0125 : Poly :=
[
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0125
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0126 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 126 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0126 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 3), (12, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 3), (11, 1), (12, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0126
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0127 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (12, 1), (16, 2)]
]

/-- Partial product 127 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0127 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 3), (12, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 3), (11, 1), (12, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0127
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0128 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0128 : Poly :=
[
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0128
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0129 : Poly :=
[
  term ((-61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0129 : Poly :=
[
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 3), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0129
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0130 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 1), (16, 2)]
]

/-- Partial product 130 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0130 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 3), (16, 2)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 3), (11, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0130
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0131 : Poly :=
[
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0131 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0131
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0132 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 132 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0132 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 3), (12, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0132
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0133 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0133 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0133
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0134 : Poly :=
[
  term ((37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0134 : Poly :=
[
  term ((37787711010423328050529 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((37787711010423328050529 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0134
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0135 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (15, 1), (16, 2)]
]

/-- Partial product 135 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0135 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 3), (15, 1), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0135
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0136 : Poly :=
[
  term ((130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 136 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0136 : Poly :=
[
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0136
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0137 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 137 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0137 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0137
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0138 : Poly :=
[
  term ((-33890332367480180923155 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 138 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0138 : Poly :=
[
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0138
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0139 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0139 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0139
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0140 : Poly :=
[
  term ((15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0140 : Poly :=
[
  term ((30670205936977030479708 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((30670205936977030479708 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0140
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0141 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 141 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0141 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0141
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0142 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0142 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (14, 1), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0142
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0143 : Poly :=
[
  term ((447838849983708083881256 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0143 : Poly :=
[
  term ((895677699967416167762512 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((895677699967416167762512 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0143
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0144 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 1), (14, 1), (16, 2)]
]

/-- Partial product 144 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0144 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0144
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0145 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 145 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0145 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (10, 2), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (11, 3), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0145
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0146 : Poly :=
[
  term ((-1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 146 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0146 : Poly :=
[
  term ((-1457930566764680866908895 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((-1457930566764680866908895 : Rat) / 314931072359881393269) [(7, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0146
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0147 : Poly :=
[
  term ((-925375973099013186532681 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 147 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0147 : Poly :=
[
  term ((-925375973099013186532681 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(7, 1), (11, 3), (16, 1)],
  term ((-925375973099013186532681 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0147
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0148 : Poly :=
[
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0148 : Poly :=
[
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 4), (13, 1), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0148
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0149 : Poly :=
[
  term ((115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0149 : Poly :=
[
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 4), (15, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(7, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0149
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0150 : Poly :=
[
  term ((-26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0150 : Poly :=
[
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0150
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0151 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 151 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0151 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0151
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0152 : Poly :=
[
  term ((20334199420488108553893 : Rat) / 104977024119960464423) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0152 : Poly :=
[
  term ((40668398840976217107786 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20334199420488108553893 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20334199420488108553893 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((40668398840976217107786 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0152
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0153 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0153 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0153
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0154 : Poly :=
[
  term ((-9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0154 : Poly :=
[
  term ((-19546172917521990142036 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-19546172917521990142036 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0154
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0155 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0155 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0155
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0156 : Poly :=
[
  term ((-29282048933724755053238 : Rat) / 104977024119960464423) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0156 : Poly :=
[
  term ((-58564097867449510106476 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((29282048933724755053238 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((29282048933724755053238 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58564097867449510106476 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0156
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0157 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 157 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0157 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0157
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0158 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 158 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0158 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0158
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0159 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0159 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0159
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0160 : Poly :=
[
  term ((179154490459436867113079 : Rat) / 629862144719762786538) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0160 : Poly :=
[
  term ((179154490459436867113079 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-179154490459436867113079 : Rat) / 629862144719762786538) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-179154490459436867113079 : Rat) / 629862144719762786538) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((179154490459436867113079 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0160
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0161 : Poly :=
[
  term ((263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 161 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0161 : Poly :=
[
  term ((263856710498883235360853 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((263856710498883235360853 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0161
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0162 : Poly :=
[
  term (-2 : Rat) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 162 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0162 : Poly :=
[
  term (-4 : Rat) [(6, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0162
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0163 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 163 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0163 : Poly :=
[
  term ((4 : Rat) / 3) [(6, 1), (7, 2), (10, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (11, 2), (16, 1)],
  term ((4 : Rat) / 3) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0163
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0164 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 164 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0164 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 3), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 3), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0164
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0165 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (15, 2), (16, 2)]
]

/-- Partial product 165 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0165 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 2), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 3), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0165
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0166 : Poly :=
[
  term ((-536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0166 : Poly :=
[
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0166
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0167 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 167 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0167 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0167
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0168 : Poly :=
[
  term ((-262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0168 : Poly :=
[
  term ((-262955591432127197107685 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-262955591432127197107685 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0168
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0169 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 169 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0169 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 3), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0169
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0170 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 2), (16, 2)]
]

/-- Partial product 170 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0170 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 3), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 2), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 4), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0170
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0171 : Poly :=
[
  term ((107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 171 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0171 : Poly :=
[
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0171
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0172 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 172 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0172 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0172
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0173 : Poly :=
[
  term ((52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 173 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0173 : Poly :=
[
  term ((52591118286425439421537 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((52591118286425439421537 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0173
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0174 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (15, 2), (16, 2)]
]

/-- Partial product 174 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0174 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (10, 2), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (11, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0174
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0175 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 175 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0175 : Poly :=
[
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 3), (13, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 3), (11, 1), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0175
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0176 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 176 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0176 : Poly :=
[
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 3), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0176
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0177 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 177 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0177 : Poly :=
[
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0177
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0178 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 2)]
]

/-- Partial product 178 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0178 : Poly :=
[
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0178
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0179 : Poly :=
[
  term ((491396216031420607372285 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 179 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0179 : Poly :=
[
  term ((491396216031420607372285 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((491396216031420607372285 : Rat) / 1889586434159288359614) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-491396216031420607372285 : Rat) / 3779172868318576719228) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-491396216031420607372285 : Rat) / 3779172868318576719228) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0179_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0179
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0180 : Poly :=
[
  term ((-220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0180 : Poly :=
[
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0180_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0180
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0181 : Poly :=
[
  term ((287232972162736158171665 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 181 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0181 : Poly :=
[
  term ((574465944325472316343330 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((574465944325472316343330 : Rat) / 944793217079644179807) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-287232972162736158171665 : Rat) / 944793217079644179807) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-287232972162736158171665 : Rat) / 944793217079644179807) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0181_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0181
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0182 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 2), (13, 1), (16, 2)]
]

/-- Partial product 182 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0182 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 4), (13, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0182_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0182
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0183 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 183 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0183 : Poly :=
[
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0183_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0183
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0184 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (13, 1), (15, 2), (16, 2)]
]

/-- Partial product 184 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0184 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0184_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0184
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0185 : Poly :=
[
  term ((-98279243206284121474457 : Rat) / 1259724289439525573076) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0185 : Poly :=
[
  term ((-98279243206284121474457 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98279243206284121474457 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((98279243206284121474457 : Rat) / 1259724289439525573076) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((98279243206284121474457 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0185_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0185
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0186 : Poly :=
[
  term ((-57446594432547231634333 : Rat) / 314931072359881393269) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0186 : Poly :=
[
  term ((-114893188865094463268666 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-114893188865094463268666 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((57446594432547231634333 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((57446594432547231634333 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0186_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0186
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0187 : Poly :=
[
  term ((44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 187 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0187 : Poly :=
[
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0187_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0187
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0188 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0188 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0188_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0188
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0189 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 189 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0189 : Poly :=
[
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0189_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0189
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0190 : Poly :=
[
  term ((71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 190 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0190 : Poly :=
[
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0190_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0190
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0191 : Poly :=
[
  term ((1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 191 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0191 : Poly :=
[
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0191_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0191
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0192 : Poly :=
[
  term ((387849765613844851161115 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0192 : Poly :=
[
  term ((775699531227689702322230 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((775699531227689702322230 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-387849765613844851161115 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-387849765613844851161115 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0192_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0192
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0193 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 1), (15, 1), (16, 2)]
]

/-- Partial product 193 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0193 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (15, 1), (16, 2)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0193_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0193
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0194 : Poly :=
[
  term ((52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 194 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0194 : Poly :=
[
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 3), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0194_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0194
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0195 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (12, 1), (15, 2), (16, 2)]
]

/-- Partial product 195 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0195 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 3), (12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0195_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0195
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0196 : Poly :=
[
  term ((-204294527738530688252 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0196 : Poly :=
[
  term ((-408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-408589055477061376504 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0196_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0196
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0197 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 197 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0197 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0197_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0197
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0198 : Poly :=
[
  term ((-80089401701648021378375 : Rat) / 314931072359881393269) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 198 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0198 : Poly :=
[
  term ((-160178803403296042756750 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-160178803403296042756750 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((80089401701648021378375 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((80089401701648021378375 : Rat) / 314931072359881393269) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0198_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0198
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 18. -/
def rs_R007_ueqv_R007NY_coefficient_18_0199 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (15, 2), (16, 2)]
]

/-- Partial product 199 for generator 18. -/
def rs_R007_ueqv_R007NY_partial_18_0199 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 2), (15, 2), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 2), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 3), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 18. -/
theorem rs_R007_ueqv_R007NY_partial_18_0199_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_18_0199
        rs_R007_ueqv_R007NY_generator_18_0100_0199 =
      rs_R007_ueqv_R007NY_partial_18_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_18_0100_0199 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_18_0100,
  rs_R007_ueqv_R007NY_partial_18_0101,
  rs_R007_ueqv_R007NY_partial_18_0102,
  rs_R007_ueqv_R007NY_partial_18_0103,
  rs_R007_ueqv_R007NY_partial_18_0104,
  rs_R007_ueqv_R007NY_partial_18_0105,
  rs_R007_ueqv_R007NY_partial_18_0106,
  rs_R007_ueqv_R007NY_partial_18_0107,
  rs_R007_ueqv_R007NY_partial_18_0108,
  rs_R007_ueqv_R007NY_partial_18_0109,
  rs_R007_ueqv_R007NY_partial_18_0110,
  rs_R007_ueqv_R007NY_partial_18_0111,
  rs_R007_ueqv_R007NY_partial_18_0112,
  rs_R007_ueqv_R007NY_partial_18_0113,
  rs_R007_ueqv_R007NY_partial_18_0114,
  rs_R007_ueqv_R007NY_partial_18_0115,
  rs_R007_ueqv_R007NY_partial_18_0116,
  rs_R007_ueqv_R007NY_partial_18_0117,
  rs_R007_ueqv_R007NY_partial_18_0118,
  rs_R007_ueqv_R007NY_partial_18_0119,
  rs_R007_ueqv_R007NY_partial_18_0120,
  rs_R007_ueqv_R007NY_partial_18_0121,
  rs_R007_ueqv_R007NY_partial_18_0122,
  rs_R007_ueqv_R007NY_partial_18_0123,
  rs_R007_ueqv_R007NY_partial_18_0124,
  rs_R007_ueqv_R007NY_partial_18_0125,
  rs_R007_ueqv_R007NY_partial_18_0126,
  rs_R007_ueqv_R007NY_partial_18_0127,
  rs_R007_ueqv_R007NY_partial_18_0128,
  rs_R007_ueqv_R007NY_partial_18_0129,
  rs_R007_ueqv_R007NY_partial_18_0130,
  rs_R007_ueqv_R007NY_partial_18_0131,
  rs_R007_ueqv_R007NY_partial_18_0132,
  rs_R007_ueqv_R007NY_partial_18_0133,
  rs_R007_ueqv_R007NY_partial_18_0134,
  rs_R007_ueqv_R007NY_partial_18_0135,
  rs_R007_ueqv_R007NY_partial_18_0136,
  rs_R007_ueqv_R007NY_partial_18_0137,
  rs_R007_ueqv_R007NY_partial_18_0138,
  rs_R007_ueqv_R007NY_partial_18_0139,
  rs_R007_ueqv_R007NY_partial_18_0140,
  rs_R007_ueqv_R007NY_partial_18_0141,
  rs_R007_ueqv_R007NY_partial_18_0142,
  rs_R007_ueqv_R007NY_partial_18_0143,
  rs_R007_ueqv_R007NY_partial_18_0144,
  rs_R007_ueqv_R007NY_partial_18_0145,
  rs_R007_ueqv_R007NY_partial_18_0146,
  rs_R007_ueqv_R007NY_partial_18_0147,
  rs_R007_ueqv_R007NY_partial_18_0148,
  rs_R007_ueqv_R007NY_partial_18_0149,
  rs_R007_ueqv_R007NY_partial_18_0150,
  rs_R007_ueqv_R007NY_partial_18_0151,
  rs_R007_ueqv_R007NY_partial_18_0152,
  rs_R007_ueqv_R007NY_partial_18_0153,
  rs_R007_ueqv_R007NY_partial_18_0154,
  rs_R007_ueqv_R007NY_partial_18_0155,
  rs_R007_ueqv_R007NY_partial_18_0156,
  rs_R007_ueqv_R007NY_partial_18_0157,
  rs_R007_ueqv_R007NY_partial_18_0158,
  rs_R007_ueqv_R007NY_partial_18_0159,
  rs_R007_ueqv_R007NY_partial_18_0160,
  rs_R007_ueqv_R007NY_partial_18_0161,
  rs_R007_ueqv_R007NY_partial_18_0162,
  rs_R007_ueqv_R007NY_partial_18_0163,
  rs_R007_ueqv_R007NY_partial_18_0164,
  rs_R007_ueqv_R007NY_partial_18_0165,
  rs_R007_ueqv_R007NY_partial_18_0166,
  rs_R007_ueqv_R007NY_partial_18_0167,
  rs_R007_ueqv_R007NY_partial_18_0168,
  rs_R007_ueqv_R007NY_partial_18_0169,
  rs_R007_ueqv_R007NY_partial_18_0170,
  rs_R007_ueqv_R007NY_partial_18_0171,
  rs_R007_ueqv_R007NY_partial_18_0172,
  rs_R007_ueqv_R007NY_partial_18_0173,
  rs_R007_ueqv_R007NY_partial_18_0174,
  rs_R007_ueqv_R007NY_partial_18_0175,
  rs_R007_ueqv_R007NY_partial_18_0176,
  rs_R007_ueqv_R007NY_partial_18_0177,
  rs_R007_ueqv_R007NY_partial_18_0178,
  rs_R007_ueqv_R007NY_partial_18_0179,
  rs_R007_ueqv_R007NY_partial_18_0180,
  rs_R007_ueqv_R007NY_partial_18_0181,
  rs_R007_ueqv_R007NY_partial_18_0182,
  rs_R007_ueqv_R007NY_partial_18_0183,
  rs_R007_ueqv_R007NY_partial_18_0184,
  rs_R007_ueqv_R007NY_partial_18_0185,
  rs_R007_ueqv_R007NY_partial_18_0186,
  rs_R007_ueqv_R007NY_partial_18_0187,
  rs_R007_ueqv_R007NY_partial_18_0188,
  rs_R007_ueqv_R007NY_partial_18_0189,
  rs_R007_ueqv_R007NY_partial_18_0190,
  rs_R007_ueqv_R007NY_partial_18_0191,
  rs_R007_ueqv_R007NY_partial_18_0192,
  rs_R007_ueqv_R007NY_partial_18_0193,
  rs_R007_ueqv_R007NY_partial_18_0194,
  rs_R007_ueqv_R007NY_partial_18_0195,
  rs_R007_ueqv_R007NY_partial_18_0196,
  rs_R007_ueqv_R007NY_partial_18_0197,
  rs_R007_ueqv_R007NY_partial_18_0198,
  rs_R007_ueqv_R007NY_partial_18_0199
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_18_0100_0199 : Poly :=
[
  term ((20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4225848088861059004625 : Rat) / 3647850258994765173) [(5, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((975132398934881056801945 : Rat) / 629862144719762786538) [(5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((845169617772211800925 : Rat) / 1215950086331588391) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-195026479786976211360389 : Rat) / 209954048239920928846) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((20902827069725311082476 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4914642380884312569950 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((24573211904421562849750 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((845169617772211800925 : Rat) / 1215950086331588391) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((31453711237659600447680 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-195026479786976211360389 : Rat) / 209954048239920928846) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-166263244036350275896796 : Rat) / 104977024119960464423) [(5, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-157268556188298002238400 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4225848088861059004625 : Rat) / 3647850258994765173) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((835247934086458829539940 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((975132398934881056801945 : Rat) / 629862144719762786538) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10451413534862655541238 : Rat) / 314931072359881393269) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 3), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4225848088861059004625 : Rat) / 7295700517989530346) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-975132398934881056801945 : Rat) / 1259724289439525573076) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-845169617772211800925 : Rat) / 2431900172663176782) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((195026479786976211360389 : Rat) / 419908096479841857692) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (10, 2), (15, 3), (16, 1)],
  term ((-12286605952210781424875 : Rat) / 944793217079644179807) [(5, 1), (10, 3), (11, 1), (16, 1)],
  term ((2457321190442156284975 : Rat) / 314931072359881393269) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((-845169617772211800925 : Rat) / 2431900172663176782) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15726855618829800223840 : Rat) / 314931072359881393269) [(5, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((195026479786976211360389 : Rat) / 419908096479841857692) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((83131622018175137948398 : Rat) / 104977024119960464423) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((78634278094149001119200 : Rat) / 944793217079644179807) [(5, 1), (11, 3), (14, 1), (15, 2), (16, 1)],
  term ((4225848088861059004625 : Rat) / 7295700517989530346) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-417623967043229414769970 : Rat) / 314931072359881393269) [(5, 1), (11, 3), (15, 2), (16, 1)],
  term ((-975132398934881056801945 : Rat) / 1259724289439525573076) [(5, 1), (11, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 4), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((-212735596171439970453248 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (8, 1), (10, 2), (11, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (8, 1), (10, 2), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (7, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30670205936977030479708 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((895677699967416167762512 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 2)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1457930566764680866908895 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-925375973099013186532681 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((40668398840976217107786 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19546172917521990142036 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58564097867449510106476 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(6, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((179154490459436867113079 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((263856710498883235360853 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (12, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(6, 1), (7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (7, 1), (10, 2), (11, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((37787711010423328050529 : Rat) / 104977024119960464423) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (7, 1), (10, 2), (15, 1), (16, 2)],
  term (-4 : Rat) [(6, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(6, 1), (7, 2), (10, 1), (16, 1)],
  term ((-1073282862645815304502370 : Rat) / 944793217079644179807) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-262955591432127197107685 : Rat) / 1889586434159288359614) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 2)],
  term ((52591118286425439421537 : Rat) / 629862144719762786538) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (8, 1), (10, 2), (15, 2), (16, 2)],
  term ((701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((491396216031420607372285 : Rat) / 1889586434159288359614) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-440412256367483585082070 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((574465944325472316343330 : Rat) / 944793217079644179807) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 2)],
  term ((-98279243206284121474457 : Rat) / 629862144719762786538) [(6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114893188865094463268666 : Rat) / 314931072359881393269) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(6, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-701425477953707074240 : Rat) / 1336341183988181301) [(6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(6, 1), (9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((142003531010428860736000 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((775699531227689702322230 : Rat) / 944793217079644179807) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (10, 2), (12, 1), (15, 2), (16, 2)],
  term ((-408589055477061376504 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(6, 1), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-160178803403296042756750 : Rat) / 314931072359881393269) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 2), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((-17535636948842676856 : Rat) / 78608304940481253) [(7, 1), (8, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 1), (11, 3), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 2), (11, 1), (14, 1), (16, 2)],
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((107328286264581530450237 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1), (16, 2)],
  term ((106367798085719985226624 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (10, 3), (11, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (10, 3), (15, 1), (16, 2)],
  term ((214656572529163060900474 : Rat) / 314931072359881393269) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 2)],
  term ((52591118286425439421537 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 111152143185840491742) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 78608304940481253) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((375251197082192714252059 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 2)],
  term ((-536641431322907652251185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 3), (14, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 3), (14, 1), (16, 2)],
  term ((-531838990428599926133120 : Rat) / 944793217079644179807) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (8, 1), (11, 3), (16, 2)],
  term ((140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 78608304940481253) [(7, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((44041225636748358508207 : Rat) / 209954048239920928846) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 2)],
  term ((-98279243206284121474457 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114893188865094463268666 : Rat) / 314931072359881393269) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88082451273496717016414 : Rat) / 104977024119960464423) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((35071273897685353712 : Rat) / 78608304940481253) [(7, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((280570191181482829696 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 2)],
  term ((491396216031420607372285 : Rat) / 1889586434159288359614) [(7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 37050714395280163914) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((574465944325472316343330 : Rat) / 944793217079644179807) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 2)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 1), (9, 1), (11, 3), (13, 1), (16, 2)],
  term ((-220206128183741792541035 : Rat) / 629862144719762786538) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((104428493586167089838596 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 2)],
  term ((-408589055477061376504 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 44990153194268770467) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-160178803403296042756750 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 2)],
  term ((-26107123396541772459649 : Rat) / 55576071592920245871) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 78608304940481253) [(7, 1), (10, 1), (11, 2), (12, 1), (15, 1), (16, 2)],
  term ((7100176550521443036800 : Rat) / 7939438798988606553) [(7, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1211309663361569452189699 : Rat) / 1889586434159288359614) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 78608304940481253) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 3), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 3), (12, 1), (16, 2)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 1), (11, 3), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 1), (11, 3), (16, 2)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 2)],
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 2), (11, 1), (14, 1), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (10, 2), (11, 1), (14, 2), (16, 1)],
  term ((1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (10, 2), (11, 2), (13, 1), (16, 1)],
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-20334199420488108553893 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((29282048933724755053238 : Rat) / 104977024119960464423) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 2)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (10, 2), (14, 1), (15, 3), (16, 1)],
  term ((98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-179154490459436867113079 : Rat) / 629862144719762786538) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (10, 3), (11, 1), (12, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (10, 3), (11, 1), (12, 1), (16, 2)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(7, 1), (10, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((61579824695772740558575 : Rat) / 209954048239920928846) [(7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (10, 3), (11, 1), (16, 2)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (10, 3), (12, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (10, 3), (12, 1), (15, 1), (16, 2)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(7, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((-37787711010423328050529 : Rat) / 209954048239920928846) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (10, 3), (15, 1), (16, 2)],
  term ((26107123396541772459649 : Rat) / 314931072359881393269) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-20334199420488108553893 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9773086458760995071018 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((29282048933724755053238 : Rat) / 104977024119960464423) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 2)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (11, 2), (14, 1), (15, 3), (16, 1)],
  term ((98331284721143428271651 : Rat) / 419908096479841857692) [(7, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-179154490459436867113079 : Rat) / 629862144719762786538) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-263856710498883235360853 : Rat) / 209954048239920928846) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-130535616982708862298245 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (12, 1), (14, 1), (16, 2)],
  term ((33890332367480180923155 : Rat) / 104977024119960464423) [(7, 1), (11, 3), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15335102968488515239854 : Rat) / 104977024119960464423) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 3), (14, 1), (15, 2), (16, 1)],
  term ((-447838849983708083881256 : Rat) / 944793217079644179807) [(7, 1), (11, 3), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(7, 1), (11, 3), (14, 1), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 1259724289439525573076) [(7, 1), (11, 3), (14, 2), (16, 1)],
  term ((1457930566764680866908895 : Rat) / 629862144719762786538) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((925375973099013186532681 : Rat) / 1889586434159288359614) [(7, 1), (11, 3), (16, 1)],
  term ((-2042945277385306882520 : Rat) / 134970459582806311401) [(7, 1), (11, 4), (13, 1), (16, 1)],
  term ((-115539178558553908420525 : Rat) / 314931072359881393269) [(7, 1), (11, 4), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-212735596171439970453248 : Rat) / 314931072359881393269) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (8, 1), (11, 2), (14, 1), (16, 2)],
  term ((1063677980857199852266240 : Rat) / 944793217079644179807) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(7, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 2)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(7, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((37787711010423328050529 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (12, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(7, 2), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-61579824695772740558575 : Rat) / 104977024119960464423) [(7, 2), (10, 1), (11, 2), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (10, 1), (11, 2), (16, 2)],
  term (2 : Rat) [(7, 2), (10, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (10, 2), (16, 1)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((40668398840976217107786 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19546172917521990142036 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58564097867449510106476 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(7, 2), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 209954048239920928846) [(7, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((179154490459436867113079 : Rat) / 314931072359881393269) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((263856710498883235360853 : Rat) / 104977024119960464423) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-67780664734960361846310 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30670205936977030479708 : Rat) / 104977024119960464423) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(7, 2), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((897567286401575456122126 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(7, 2), (11, 2), (14, 1), (16, 2)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(7, 2), (11, 2), (14, 2), (16, 1)],
  term ((-1457930566764680866908895 : Rat) / 314931072359881393269) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-926005835243732949319219 : Rat) / 944793217079644179807) [(7, 2), (11, 2), (16, 1)],
  term ((4085890554770613765040 : Rat) / 134970459582806311401) [(7, 2), (11, 3), (13, 1), (16, 1)],
  term ((231078357117107816841050 : Rat) / 314931072359881393269) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 3), (11, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(7, 3), (11, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 1), (11, 3), (15, 1), (16, 2)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (10, 2), (11, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 2), (14, 1), (15, 2), (16, 2)],
  term ((-52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (10, 2), (15, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (10, 3), (11, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (10, 3), (15, 2), (16, 2)],
  term ((-107328286264581530450237 : Rat) / 314931072359881393269) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(8, 1), (11, 2), (14, 1), (15, 2), (16, 2)],
  term ((-52591118286425439421537 : Rat) / 1259724289439525573076) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(8, 1), (11, 2), (15, 2), (16, 2)],
  term ((536641431322907652251185 : Rat) / 944793217079644179807) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(8, 1), (11, 3), (14, 1), (15, 1), (16, 2)],
  term ((262955591432127197107685 : Rat) / 3779172868318576719228) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(8, 1), (11, 3), (15, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(8, 1), (11, 4), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 2)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 1), (11, 3), (13, 1), (15, 1), (16, 2)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-491396216031420607372285 : Rat) / 3779172868318576719228) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-287232972162736158171665 : Rat) / 944793217079644179807) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (10, 2), (11, 2), (13, 1), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 2)],
  term ((98279243206284121474457 : Rat) / 1259724289439525573076) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((57446594432547231634333 : Rat) / 314931072359881393269) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (10, 3), (11, 1), (13, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (10, 3), (13, 1), (15, 2), (16, 2)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 2)],
  term ((98279243206284121474457 : Rat) / 1259724289439525573076) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((57446594432547231634333 : Rat) / 314931072359881393269) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-44041225636748358508207 : Rat) / 104977024119960464423) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1), (16, 2)],
  term ((-140285095590741414848 : Rat) / 1336341183988181301) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 2)],
  term ((-491396216031420607372285 : Rat) / 3779172868318576719228) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((220206128183741792541035 : Rat) / 314931072359881393269) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-287232972162736158171665 : Rat) / 944793217079644179807) [(9, 1), (11, 3), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(9, 1), (11, 4), (13, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 1), (11, 2), (12, 1), (15, 2), (16, 2)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((80089401701648021378375 : Rat) / 314931072359881393269) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 1), (11, 2), (15, 2), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (12, 1), (15, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 1), (11, 3), (13, 1), (16, 1)],
  term ((-387849765613844851161115 : Rat) / 944793217079644179807) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 1), (11, 3), (15, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-71001765505214430368000 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1021472638692653441260 : Rat) / 134970459582806311401) [(10, 3), (11, 1), (13, 1), (16, 1)],
  term ((-387849765613844851161115 : Rat) / 944793217079644179807) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(10, 3), (11, 1), (15, 1), (16, 2)],
  term ((-52214246793083544919298 : Rat) / 314931072359881393269) [(10, 3), (12, 1), (15, 2), (16, 1)],
  term ((35071273897685353712 : Rat) / 445447061329393767) [(10, 3), (12, 1), (15, 2), (16, 2)],
  term ((204294527738530688252 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 44990153194268770467) [(10, 3), (13, 1), (15, 3), (16, 1)],
  term ((80089401701648021378375 : Rat) / 314931072359881393269) [(10, 3), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 3), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 100 through 199. -/
theorem rs_R007_ueqv_R007NY_block_18_0100_0199_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_18_0100_0199
      rs_R007_ueqv_R007NY_block_18_0100_0199 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
