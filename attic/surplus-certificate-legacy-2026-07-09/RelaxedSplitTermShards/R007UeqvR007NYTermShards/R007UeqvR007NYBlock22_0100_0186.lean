/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 22:100-186

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_22_0100_0186 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0100 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 100 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0100 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0100
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0101 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0101 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0101
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0102 : Poly :=
[
  term ((596392830309411519508195 : Rat) / 3779172868318576719228) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 102 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0102 : Poly :=
[
  term ((-596392830309411519508195 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((596392830309411519508195 : Rat) / 3779172868318576719228) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-596392830309411519508195 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((596392830309411519508195 : Rat) / 3779172868318576719228) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0102
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0103 : Poly :=
[
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0103 : Poly :=
[
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0103
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0104 : Poly :=
[
  term ((-778672962267303301725655 : Rat) / 7558345736637153438456) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0104 : Poly :=
[
  term ((778672962267303301725655 : Rat) / 3779172868318576719228) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-778672962267303301725655 : Rat) / 7558345736637153438456) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((778672962267303301725655 : Rat) / 3779172868318576719228) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-778672962267303301725655 : Rat) / 7558345736637153438456) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0104
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0105 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0105 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0105
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0106 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0106 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0106
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0107 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0107 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0107
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0108 : Poly :=
[
  term ((-119278566061882303901639 : Rat) / 1259724289439525573076) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0108 : Poly :=
[
  term ((119278566061882303901639 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119278566061882303901639 : Rat) / 1259724289439525573076) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((119278566061882303901639 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119278566061882303901639 : Rat) / 1259724289439525573076) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0108
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0109 : Poly :=
[
  term ((155734592453460660345131 : Rat) / 2519448578879051146152) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0109 : Poly :=
[
  term ((-155734592453460660345131 : Rat) / 1259724289439525573076) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((155734592453460660345131 : Rat) / 2519448578879051146152) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-155734592453460660345131 : Rat) / 1259724289439525573076) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((155734592453460660345131 : Rat) / 2519448578879051146152) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0109
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0110 : Poly :=
[
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 110 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0110 : Poly :=
[
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(0, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(1, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0110
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0111 : Poly :=
[
  term ((-1620323758431236372288185 : Rat) / 1889586434159288359614) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 111 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0111 : Poly :=
[
  term ((1620323758431236372288185 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1620323758431236372288185 : Rat) / 1889586434159288359614) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((1620323758431236372288185 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-1620323758431236372288185 : Rat) / 1889586434159288359614) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0111
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0112 : Poly :=
[
  term ((324064751686247274457637 : Rat) / 629862144719762786538) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0112 : Poly :=
[
  term ((-324064751686247274457637 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((324064751686247274457637 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-324064751686247274457637 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((324064751686247274457637 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0112
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0113 : Poly :=
[
  term ((-13473847575446572641715 : Rat) / 944793217079644179807) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0113 : Poly :=
[
  term ((26947695150893145283430 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-13473847575446572641715 : Rat) / 944793217079644179807) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((26947695150893145283430 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-13473847575446572641715 : Rat) / 944793217079644179807) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0113
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0114 : Poly :=
[
  term ((2694769515089314528343 : Rat) / 314931072359881393269) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0114 : Poly :=
[
  term ((-5389539030178629056686 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((2694769515089314528343 : Rat) / 314931072359881393269) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-5389539030178629056686 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2694769515089314528343 : Rat) / 314931072359881393269) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0114
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0115 : Poly :=
[
  term ((316127750661179163395 : Rat) / 13594147008340204026) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 115 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0115 : Poly :=
[
  term ((-316127750661179163395 : Rat) / 6797073504170102013) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((316127750661179163395 : Rat) / 13594147008340204026) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-316127750661179163395 : Rat) / 6797073504170102013) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((316127750661179163395 : Rat) / 13594147008340204026) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0115
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0116 : Poly :=
[
  term ((-29567764923764932131245 : Rat) / 629862144719762786538) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0116 : Poly :=
[
  term ((29567764923764932131245 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29567764923764932131245 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((29567764923764932131245 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29567764923764932131245 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0116
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0117 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 117 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0117 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0117
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0118 : Poly :=
[
  term ((-388403875340156001060065 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 118 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0118 : Poly :=
[
  term ((388403875340156001060065 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-388403875340156001060065 : Rat) / 1889586434159288359614) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((388403875340156001060065 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((-388403875340156001060065 : Rat) / 1889586434159288359614) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0118
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0119 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 119 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0119 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0119
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0120 : Poly :=
[
  term ((3100504781297807160824075 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0120 : Poly :=
[
  term ((-3100504781297807160824075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3100504781297807160824075 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3100504781297807160824075 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((3100504781297807160824075 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0120
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0121 : Poly :=
[
  term ((2124503804919069398271361 : Rat) / 944793217079644179807) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0121 : Poly :=
[
  term ((-4249007609838138796542722 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2124503804919069398271361 : Rat) / 944793217079644179807) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-4249007609838138796542722 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((2124503804919069398271361 : Rat) / 944793217079644179807) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0121
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0122 : Poly :=
[
  term ((-63225550132235832679 : Rat) / 4531382336113401342) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0122 : Poly :=
[
  term ((63225550132235832679 : Rat) / 2265691168056700671) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63225550132235832679 : Rat) / 4531382336113401342) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((63225550132235832679 : Rat) / 2265691168056700671) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63225550132235832679 : Rat) / 4531382336113401342) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0122
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0123 : Poly :=
[
  term ((5913552984752986426249 : Rat) / 209954048239920928846) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0123 : Poly :=
[
  term ((-5913552984752986426249 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((5913552984752986426249 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5913552984752986426249 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5913552984752986426249 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0123
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0124 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0124 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0124
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0125 : Poly :=
[
  term ((77680775068031200212013 : Rat) / 629862144719762786538) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0125 : Poly :=
[
  term ((-77680775068031200212013 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((77680775068031200212013 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77680775068031200212013 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((77680775068031200212013 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0125
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0126 : Poly :=
[
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0126 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0126
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0127 : Poly :=
[
  term ((-848982701179492067686045 : Rat) / 629862144719762786538) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0127 : Poly :=
[
  term ((848982701179492067686045 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-848982701179492067686045 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((848982701179492067686045 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-848982701179492067686045 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0127
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0128 : Poly :=
[
  term ((-620100956259561432164815 : Rat) / 1259724289439525573076) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 128 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0128 : Poly :=
[
  term ((620100956259561432164815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-620100956259561432164815 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((620100956259561432164815 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-620100956259561432164815 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0128
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0129 : Poly :=
[
  term ((2 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 129 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0129 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0129
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0130 : Poly :=
[
  term ((5453696960842135389625 : Rat) / 314931072359881393269) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 130 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0130 : Poly :=
[
  term ((-10907393921684270779250 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((5453696960842135389625 : Rat) / 314931072359881393269) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10907393921684270779250 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((5453696960842135389625 : Rat) / 314931072359881393269) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0130
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0131 : Poly :=
[
  term ((-1090739392168427077925 : Rat) / 104977024119960464423) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0131 : Poly :=
[
  term ((2181478784336854155850 : Rat) / 104977024119960464423) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1090739392168427077925 : Rat) / 104977024119960464423) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2181478784336854155850 : Rat) / 104977024119960464423) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1090739392168427077925 : Rat) / 104977024119960464423) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0131
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0132 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 132 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0132 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0132
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0133 : Poly :=
[
  term ((-516862377335422823953526 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0133 : Poly :=
[
  term ((1033724754670845647907052 : Rat) / 944793217079644179807) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-516862377335422823953526 : Rat) / 944793217079644179807) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1033724754670845647907052 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-516862377335422823953526 : Rat) / 944793217079644179807) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0133
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0134 : Poly :=
[
  term ((89078109128599468138655 : Rat) / 209954048239920928846) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 134 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0134 : Poly :=
[
  term ((-89078109128599468138655 : Rat) / 104977024119960464423) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((89078109128599468138655 : Rat) / 209954048239920928846) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-89078109128599468138655 : Rat) / 104977024119960464423) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((89078109128599468138655 : Rat) / 209954048239920928846) [(1, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0134
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0135 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0135 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0135
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0136 : Poly :=
[
  term ((110540593075281703991663 : Rat) / 629862144719762786538) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 136 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0136 : Poly :=
[
  term ((-110540593075281703991663 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((110540593075281703991663 : Rat) / 629862144719762786538) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-110540593075281703991663 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((110540593075281703991663 : Rat) / 629862144719762786538) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0136
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0137 : Poly :=
[
  term ((-5164935536628909196625 : Rat) / 13594147008340204026) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 137 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0137 : Poly :=
[
  term ((5164935536628909196625 : Rat) / 6797073504170102013) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-5164935536628909196625 : Rat) / 13594147008340204026) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((5164935536628909196625 : Rat) / 6797073504170102013) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-5164935536628909196625 : Rat) / 13594147008340204026) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0137
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0138 : Poly :=
[
  term ((1032987107325781839325 : Rat) / 4531382336113401342) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0138 : Poly :=
[
  term ((-1032987107325781839325 : Rat) / 2265691168056700671) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1032987107325781839325 : Rat) / 4531382336113401342) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1032987107325781839325 : Rat) / 2265691168056700671) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1032987107325781839325 : Rat) / 4531382336113401342) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0138
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0139 : Poly :=
[
  term ((423025038821774787608975 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 139 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0139 : Poly :=
[
  term ((-423025038821774787608975 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((423025038821774787608975 : Rat) / 1889586434159288359614) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-423025038821774787608975 : Rat) / 944793217079644179807) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((423025038821774787608975 : Rat) / 1889586434159288359614) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0139
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0140 : Poly :=
[
  term ((514018823677164129811735 : Rat) / 3779172868318576719228) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 140 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0140 : Poly :=
[
  term ((-514018823677164129811735 : Rat) / 1889586434159288359614) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((514018823677164129811735 : Rat) / 3779172868318576719228) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-514018823677164129811735 : Rat) / 1889586434159288359614) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((514018823677164129811735 : Rat) / 3779172868318576719228) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0140
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0141 : Poly :=
[
  term ((-84605007764354957521795 : Rat) / 629862144719762786538) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0141 : Poly :=
[
  term ((84605007764354957521795 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84605007764354957521795 : Rat) / 629862144719762786538) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((84605007764354957521795 : Rat) / 314931072359881393269) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84605007764354957521795 : Rat) / 629862144719762786538) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0141
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0142 : Poly :=
[
  term ((-102803764735432825962347 : Rat) / 1259724289439525573076) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0142 : Poly :=
[
  term ((102803764735432825962347 : Rat) / 629862144719762786538) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-102803764735432825962347 : Rat) / 1259724289439525573076) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((102803764735432825962347 : Rat) / 629862144719762786538) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-102803764735432825962347 : Rat) / 1259724289439525573076) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0142
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0143 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0143 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0143
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0144 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0144 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0144
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0145 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0145 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0145
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0146 : Poly :=
[
  term ((38599698358374204133055 : Rat) / 134970459582806311401) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0146 : Poly :=
[
  term ((-77199396716748408266110 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((38599698358374204133055 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77199396716748408266110 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((38599698358374204133055 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0146
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0147 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0147 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0147
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0148 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0148 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0148
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0149 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 149 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0149 : Poly :=
[
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0149
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0150 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0150 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0150
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0151 : Poly :=
[
  term ((-7719939671674840826611 : Rat) / 44990153194268770467) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0151 : Poly :=
[
  term ((15439879343349681653222 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-7719939671674840826611 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((15439879343349681653222 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7719939671674840826611 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0151
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0152 : Poly :=
[
  term ((-1 : Rat) / 12) [(10, 1), (16, 1)]
]

/-- Partial product 152 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0152 : Poly :=
[
  term ((1 : Rat) / 6) [(0, 1), (10, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (10, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0152
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0153 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 153 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0153 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0153
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0154 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0154 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0154
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0155 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0155 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0155
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0156 : Poly :=
[
  term ((16895336848334470622125 : Rat) / 1889586434159288359614) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0156 : Poly :=
[
  term ((-16895336848334470622125 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16895336848334470622125 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16895336848334470622125 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((16895336848334470622125 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0156
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0157 : Poly :=
[
  term ((146150244154578359199085 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 157 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0157 : Poly :=
[
  term ((-146150244154578359199085 : Rat) / 1889586434159288359614) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((146150244154578359199085 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-146150244154578359199085 : Rat) / 1889586434159288359614) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((146150244154578359199085 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0157
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0158 : Poly :=
[
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 158 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0158 : Poly :=
[
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0158
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0159 : Poly :=
[
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0159 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0159
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0160 : Poly :=
[
  term ((4746449277127599268265 : Rat) / 104977024119960464423) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 160 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0160 : Poly :=
[
  term ((-9492898554255198536530 : Rat) / 104977024119960464423) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4746449277127599268265 : Rat) / 104977024119960464423) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-9492898554255198536530 : Rat) / 104977024119960464423) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((4746449277127599268265 : Rat) / 104977024119960464423) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0160
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0161 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0161 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0161
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0162 : Poly :=
[
  term ((-12184619052328315176139 : Rat) / 31757755195954426212) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0162 : Poly :=
[
  term ((12184619052328315176139 : Rat) / 15878877597977213106) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12184619052328315176139 : Rat) / 31757755195954426212) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12184619052328315176139 : Rat) / 15878877597977213106) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12184619052328315176139 : Rat) / 31757755195954426212) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0162
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0163 : Poly :=
[
  term ((545440083773041091848655 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0163 : Poly :=
[
  term ((-545440083773041091848655 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((545440083773041091848655 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-545440083773041091848655 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((545440083773041091848655 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0163
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0164 : Poly :=
[
  term ((-1204267102444338737954899 : Rat) / 1889586434159288359614) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0164 : Poly :=
[
  term ((1204267102444338737954899 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1204267102444338737954899 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((1204267102444338737954899 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1204267102444338737954899 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0164
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0165 : Poly :=
[
  term ((569030367201285792184415 : Rat) / 1889586434159288359614) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 165 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0165 : Poly :=
[
  term ((-569030367201285792184415 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((569030367201285792184415 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-569030367201285792184415 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((569030367201285792184415 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0165
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0166 : Poly :=
[
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0166 : Poly :=
[
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0166
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0167 : Poly :=
[
  term ((-83513106328360726217195 : Rat) / 314931072359881393269) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 167 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0167 : Poly :=
[
  term ((167026212656721452434390 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83513106328360726217195 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((167026212656721452434390 : Rat) / 314931072359881393269) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((-83513106328360726217195 : Rat) / 314931072359881393269) [(1, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0167
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0168 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 168 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0168 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0168
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0169 : Poly :=
[
  term ((1839087614484454230373445 : Rat) / 1259724289439525573076) [(11, 2), (16, 1)]
]

/-- Partial product 169 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0169 : Poly :=
[
  term ((-1839087614484454230373445 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((1839087614484454230373445 : Rat) / 1259724289439525573076) [(0, 2), (11, 2), (16, 1)],
  term ((-1839087614484454230373445 : Rat) / 629862144719762786538) [(1, 1), (11, 3), (16, 1)],
  term ((1839087614484454230373445 : Rat) / 1259724289439525573076) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0169
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0170 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0170 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0170
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0171 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0171 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0171
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0172 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0172 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0172
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0173 : Poly :=
[
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 173 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0173 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0173
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0174 : Poly :=
[
  term ((-3379067369666894124425 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0174 : Poly :=
[
  term ((3379067369666894124425 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3379067369666894124425 : Rat) / 629862144719762786538) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((3379067369666894124425 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3379067369666894124425 : Rat) / 629862144719762786538) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0174
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0175 : Poly :=
[
  term ((3 : Rat) / 2) [(12, 1), (16, 1)]
]

/-- Partial product 175 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0175 : Poly :=
[
  term (-3 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (12, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0175
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0176 : Poly :=
[
  term ((-29230048830915671839817 : Rat) / 1259724289439525573076) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0176 : Poly :=
[
  term ((29230048830915671839817 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29230048830915671839817 : Rat) / 1259724289439525573076) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((29230048830915671839817 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29230048830915671839817 : Rat) / 1259724289439525573076) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0176
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0177 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0177 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0177
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0178 : Poly :=
[
  term ((-17192194421779317830177 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0178 : Poly :=
[
  term ((17192194421779317830177 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17192194421779317830177 : Rat) / 629862144719762786538) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((17192194421779317830177 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17192194421779317830177 : Rat) / 629862144719762786538) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0178
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0179 : Poly :=
[
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 179 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0179 : Poly :=
[
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(1, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0179_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0179
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0180 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0180 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0180_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0180
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0181 : Poly :=
[
  term ((410252806558253346944869 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 181 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0181 : Poly :=
[
  term ((-410252806558253346944869 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((410252806558253346944869 : Rat) / 1259724289439525573076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-410252806558253346944869 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((410252806558253346944869 : Rat) / 1259724289439525573076) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0181_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0181
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0182 : Poly :=
[
  term ((1 : Rat) / 3) [(14, 1), (16, 1)]
]

/-- Partial product 182 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0182 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(0, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0182_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0182
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0183 : Poly :=
[
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 183 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0183 : Poly :=
[
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(1, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0183_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0183
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0184 : Poly :=
[
  term ((-180868589952443837981711 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)]
]

/-- Partial product 184 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0184 : Poly :=
[
  term ((180868589952443837981711 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-180868589952443837981711 : Rat) / 1259724289439525573076) [(0, 2), (15, 2), (16, 1)],
  term ((180868589952443837981711 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-180868589952443837981711 : Rat) / 1259724289439525573076) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0184_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0184
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0185 : Poly :=
[
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(15, 4), (16, 1)]
]

/-- Partial product 185 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0185 : Poly :=
[
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (15, 4), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(0, 2), (15, 4), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(1, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0185_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0185
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 22. -/
def rs_R007_ueqv_R007NY_coefficient_22_0186 : Poly :=
[
  term ((-1 : Rat) / 6) [(16, 1)]
]

/-- Partial product 186 for generator 22. -/
def rs_R007_ueqv_R007NY_partial_22_0186 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 1), (10, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (11, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 22. -/
theorem rs_R007_ueqv_R007NY_partial_22_0186_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_22_0186
        rs_R007_ueqv_R007NY_generator_22_0100_0186 =
      rs_R007_ueqv_R007NY_partial_22_0186 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_22_0100_0186 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_22_0100,
  rs_R007_ueqv_R007NY_partial_22_0101,
  rs_R007_ueqv_R007NY_partial_22_0102,
  rs_R007_ueqv_R007NY_partial_22_0103,
  rs_R007_ueqv_R007NY_partial_22_0104,
  rs_R007_ueqv_R007NY_partial_22_0105,
  rs_R007_ueqv_R007NY_partial_22_0106,
  rs_R007_ueqv_R007NY_partial_22_0107,
  rs_R007_ueqv_R007NY_partial_22_0108,
  rs_R007_ueqv_R007NY_partial_22_0109,
  rs_R007_ueqv_R007NY_partial_22_0110,
  rs_R007_ueqv_R007NY_partial_22_0111,
  rs_R007_ueqv_R007NY_partial_22_0112,
  rs_R007_ueqv_R007NY_partial_22_0113,
  rs_R007_ueqv_R007NY_partial_22_0114,
  rs_R007_ueqv_R007NY_partial_22_0115,
  rs_R007_ueqv_R007NY_partial_22_0116,
  rs_R007_ueqv_R007NY_partial_22_0117,
  rs_R007_ueqv_R007NY_partial_22_0118,
  rs_R007_ueqv_R007NY_partial_22_0119,
  rs_R007_ueqv_R007NY_partial_22_0120,
  rs_R007_ueqv_R007NY_partial_22_0121,
  rs_R007_ueqv_R007NY_partial_22_0122,
  rs_R007_ueqv_R007NY_partial_22_0123,
  rs_R007_ueqv_R007NY_partial_22_0124,
  rs_R007_ueqv_R007NY_partial_22_0125,
  rs_R007_ueqv_R007NY_partial_22_0126,
  rs_R007_ueqv_R007NY_partial_22_0127,
  rs_R007_ueqv_R007NY_partial_22_0128,
  rs_R007_ueqv_R007NY_partial_22_0129,
  rs_R007_ueqv_R007NY_partial_22_0130,
  rs_R007_ueqv_R007NY_partial_22_0131,
  rs_R007_ueqv_R007NY_partial_22_0132,
  rs_R007_ueqv_R007NY_partial_22_0133,
  rs_R007_ueqv_R007NY_partial_22_0134,
  rs_R007_ueqv_R007NY_partial_22_0135,
  rs_R007_ueqv_R007NY_partial_22_0136,
  rs_R007_ueqv_R007NY_partial_22_0137,
  rs_R007_ueqv_R007NY_partial_22_0138,
  rs_R007_ueqv_R007NY_partial_22_0139,
  rs_R007_ueqv_R007NY_partial_22_0140,
  rs_R007_ueqv_R007NY_partial_22_0141,
  rs_R007_ueqv_R007NY_partial_22_0142,
  rs_R007_ueqv_R007NY_partial_22_0143,
  rs_R007_ueqv_R007NY_partial_22_0144,
  rs_R007_ueqv_R007NY_partial_22_0145,
  rs_R007_ueqv_R007NY_partial_22_0146,
  rs_R007_ueqv_R007NY_partial_22_0147,
  rs_R007_ueqv_R007NY_partial_22_0148,
  rs_R007_ueqv_R007NY_partial_22_0149,
  rs_R007_ueqv_R007NY_partial_22_0150,
  rs_R007_ueqv_R007NY_partial_22_0151,
  rs_R007_ueqv_R007NY_partial_22_0152,
  rs_R007_ueqv_R007NY_partial_22_0153,
  rs_R007_ueqv_R007NY_partial_22_0154,
  rs_R007_ueqv_R007NY_partial_22_0155,
  rs_R007_ueqv_R007NY_partial_22_0156,
  rs_R007_ueqv_R007NY_partial_22_0157,
  rs_R007_ueqv_R007NY_partial_22_0158,
  rs_R007_ueqv_R007NY_partial_22_0159,
  rs_R007_ueqv_R007NY_partial_22_0160,
  rs_R007_ueqv_R007NY_partial_22_0161,
  rs_R007_ueqv_R007NY_partial_22_0162,
  rs_R007_ueqv_R007NY_partial_22_0163,
  rs_R007_ueqv_R007NY_partial_22_0164,
  rs_R007_ueqv_R007NY_partial_22_0165,
  rs_R007_ueqv_R007NY_partial_22_0166,
  rs_R007_ueqv_R007NY_partial_22_0167,
  rs_R007_ueqv_R007NY_partial_22_0168,
  rs_R007_ueqv_R007NY_partial_22_0169,
  rs_R007_ueqv_R007NY_partial_22_0170,
  rs_R007_ueqv_R007NY_partial_22_0171,
  rs_R007_ueqv_R007NY_partial_22_0172,
  rs_R007_ueqv_R007NY_partial_22_0173,
  rs_R007_ueqv_R007NY_partial_22_0174,
  rs_R007_ueqv_R007NY_partial_22_0175,
  rs_R007_ueqv_R007NY_partial_22_0176,
  rs_R007_ueqv_R007NY_partial_22_0177,
  rs_R007_ueqv_R007NY_partial_22_0178,
  rs_R007_ueqv_R007NY_partial_22_0179,
  rs_R007_ueqv_R007NY_partial_22_0180,
  rs_R007_ueqv_R007NY_partial_22_0181,
  rs_R007_ueqv_R007NY_partial_22_0182,
  rs_R007_ueqv_R007NY_partial_22_0183,
  rs_R007_ueqv_R007NY_partial_22_0184,
  rs_R007_ueqv_R007NY_partial_22_0185,
  rs_R007_ueqv_R007NY_partial_22_0186
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_22_0100_0186 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-596392830309411519508195 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(0, 1), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((778672962267303301725655 : Rat) / 3779172868318576719228) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(0, 1), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((119278566061882303901639 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155734592453460660345131 : Rat) / 1259724289439525573076) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(0, 1), (5, 1), (10, 1), (15, 3), (16, 1)],
  term ((1620323758431236372288185 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-324064751686247274457637 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-316127750661179163395 : Rat) / 6797073504170102013) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((29567764923764932131245 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((388403875340156001060065 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3100504781297807160824075 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4249007609838138796542722 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((63225550132235832679 : Rat) / 2265691168056700671) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5913552984752986426249 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77680775068031200212013 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((848982701179492067686045 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((620100956259561432164815 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((26947695150893145283430 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-5389539030178629056686 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-10907393921684270779250 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2181478784336854155850 : Rat) / 104977024119960464423) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1033724754670845647907052 : Rat) / 944793217079644179807) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-89078109128599468138655 : Rat) / 104977024119960464423) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-110540593075281703991663 : Rat) / 314931072359881393269) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-423025038821774787608975 : Rat) / 944793217079644179807) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-514018823677164129811735 : Rat) / 1889586434159288359614) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((84605007764354957521795 : Rat) / 314931072359881393269) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((102803764735432825962347 : Rat) / 629862144719762786538) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5164935536628909196625 : Rat) / 6797073504170102013) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1032987107325781839325 : Rat) / 2265691168056700671) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16895336848334470622125 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-146150244154578359199085 : Rat) / 1889586434159288359614) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9492898554255198536530 : Rat) / 104977024119960464423) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((12184619052328315176139 : Rat) / 15878877597977213106) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545440083773041091848655 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1204267102444338737954899 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-569030367201285792184415 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((167026212656721452434390 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1839087614484454230373445 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3379067369666894124425 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((29230048830915671839817 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17192194421779317830177 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-410252806558253346944869 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((180868589952443837981711 : Rat) / 629862144719762786538) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(0, 1), (10, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (10, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77199396716748408266110 : Rat) / 134970459582806311401) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(0, 1), (10, 2), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((15439879343349681653222 : Rat) / 44990153194268770467) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (10, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596392830309411519508195 : Rat) / 3779172868318576719228) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-778672962267303301725655 : Rat) / 7558345736637153438456) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119278566061882303901639 : Rat) / 1259724289439525573076) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((155734592453460660345131 : Rat) / 2519448578879051146152) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1620323758431236372288185 : Rat) / 1889586434159288359614) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((324064751686247274457637 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13473847575446572641715 : Rat) / 944793217079644179807) [(0, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2694769515089314528343 : Rat) / 314931072359881393269) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((316127750661179163395 : Rat) / 13594147008340204026) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-29567764923764932131245 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-388403875340156001060065 : Rat) / 1889586434159288359614) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((3100504781297807160824075 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2124503804919069398271361 : Rat) / 944793217079644179807) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-63225550132235832679 : Rat) / 4531382336113401342) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5913552984752986426249 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((77680775068031200212013 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-848982701179492067686045 : Rat) / 629862144719762786538) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-620100956259561432164815 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((5453696960842135389625 : Rat) / 314931072359881393269) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1090739392168427077925 : Rat) / 104977024119960464423) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-516862377335422823953526 : Rat) / 944793217079644179807) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((89078109128599468138655 : Rat) / 209954048239920928846) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((110540593075281703991663 : Rat) / 629862144719762786538) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5164935536628909196625 : Rat) / 13594147008340204026) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1032987107325781839325 : Rat) / 4531382336113401342) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((423025038821774787608975 : Rat) / 1889586434159288359614) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((514018823677164129811735 : Rat) / 3779172868318576719228) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-84605007764354957521795 : Rat) / 629862144719762786538) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102803764735432825962347 : Rat) / 1259724289439525573076) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38599698358374204133055 : Rat) / 134970459582806311401) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-7719939671674840826611 : Rat) / 44990153194268770467) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(0, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16895336848334470622125 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((146150244154578359199085 : Rat) / 3779172868318576719228) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4746449277127599268265 : Rat) / 104977024119960464423) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12184619052328315176139 : Rat) / 31757755195954426212) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545440083773041091848655 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1204267102444338737954899 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((569030367201285792184415 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(0, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83513106328360726217195 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((1839087614484454230373445 : Rat) / 1259724289439525573076) [(0, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3379067369666894124425 : Rat) / 629862144719762786538) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (12, 1), (16, 1)],
  term ((-29230048830915671839817 : Rat) / 1259724289439525573076) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17192194421779317830177 : Rat) / 629862144719762786538) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((410252806558253346944869 : Rat) / 1259724289439525573076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 2), (14, 1), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-180868589952443837981711 : Rat) / 1259724289439525573076) [(0, 2), (15, 2), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(0, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 2), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((119278566061882303901639 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155734592453460660345131 : Rat) / 1259724289439525573076) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(1, 1), (5, 1), (11, 1), (15, 3), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 2), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-596392830309411519508195 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(1, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((778672962267303301725655 : Rat) / 3779172868318576719228) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-324064751686247274457637 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1620323758431236372288185 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-5389539030178629056686 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((26947695150893145283430 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((63225550132235832679 : Rat) / 2265691168056700671) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5913552984752986426249 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-77680775068031200212013 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((848982701179492067686045 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((620100956259561432164815 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-316127750661179163395 : Rat) / 6797073504170102013) [(1, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((29567764923764932131245 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (7, 1), (11, 2), (13, 2), (16, 1)],
  term ((388403875340156001060065 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (11, 2), (14, 2), (16, 1)],
  term ((-3100504781297807160824075 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-4249007609838138796542722 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((2181478784336854155850 : Rat) / 104977024119960464423) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10907393921684270779250 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-110540593075281703991663 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((1033724754670845647907052 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-89078109128599468138655 : Rat) / 104977024119960464423) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((-1032987107325781839325 : Rat) / 2265691168056700671) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5164935536628909196625 : Rat) / 6797073504170102013) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((84605007764354957521795 : Rat) / 314931072359881393269) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((102803764735432825962347 : Rat) / 629862144719762786538) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423025038821774787608975 : Rat) / 944793217079644179807) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-514018823677164129811735 : Rat) / 1889586434159288359614) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((15439879343349681653222 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-77199396716748408266110 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3379067369666894124425 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((29230048830915671839817 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((17192194421779317830177 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2130052965156432911040 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-410252806558253346944869 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((180868589952443837981711 : Rat) / 629862144719762786538) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((109088016754608218369731 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (11, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16895336848334470622125 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-146150244154578359199085 : Rat) / 1889586434159288359614) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((17750441376303607592000 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9492898554255198536530 : Rat) / 104977024119960464423) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((12184619052328315176139 : Rat) / 15878877597977213106) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-545440083773041091848655 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((1204267102444338737954899 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-569030367201285792184415 : Rat) / 944793217079644179807) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-35500882752607215184000 : Rat) / 134970459582806311401) [(1, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((167026212656721452434390 : Rat) / 314931072359881393269) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-1839087614484454230373445 : Rat) / 629862144719762786538) [(1, 1), (11, 3), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((596392830309411519508195 : Rat) / 3779172868318576719228) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-778672962267303301725655 : Rat) / 7558345736637153438456) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 104977024119960464423) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-119278566061882303901639 : Rat) / 1259724289439525573076) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((155734592453460660345131 : Rat) / 2519448578879051146152) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1620323758431236372288185 : Rat) / 1889586434159288359614) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((324064751686247274457637 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13473847575446572641715 : Rat) / 944793217079644179807) [(1, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2694769515089314528343 : Rat) / 314931072359881393269) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((316127750661179163395 : Rat) / 13594147008340204026) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-29567764923764932131245 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-388403875340156001060065 : Rat) / 1889586434159288359614) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((3100504781297807160824075 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2124503804919069398271361 : Rat) / 944793217079644179807) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-63225550132235832679 : Rat) / 4531382336113401342) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5913552984752986426249 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((77680775068031200212013 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-848982701179492067686045 : Rat) / 629862144719762786538) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-620100956259561432164815 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((5453696960842135389625 : Rat) / 314931072359881393269) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1090739392168427077925 : Rat) / 104977024119960464423) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-516862377335422823953526 : Rat) / 944793217079644179807) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((89078109128599468138655 : Rat) / 209954048239920928846) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((110540593075281703991663 : Rat) / 629862144719762786538) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5164935536628909196625 : Rat) / 13594147008340204026) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1032987107325781839325 : Rat) / 4531382336113401342) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((423025038821774787608975 : Rat) / 1889586434159288359614) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((514018823677164129811735 : Rat) / 3779172868318576719228) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-84605007764354957521795 : Rat) / 629862144719762786538) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-102803764735432825962347 : Rat) / 1259724289439525573076) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((38599698358374204133055 : Rat) / 134970459582806311401) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-7719939671674840826611 : Rat) / 44990153194268770467) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(1, 2), (10, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16895336848334470622125 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((146150244154578359199085 : Rat) / 3779172868318576719228) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4746449277127599268265 : Rat) / 104977024119960464423) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12184619052328315176139 : Rat) / 31757755195954426212) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545440083773041091848655 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1204267102444338737954899 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((569030367201285792184415 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((17750441376303607592000 : Rat) / 134970459582806311401) [(1, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-83513106328360726217195 : Rat) / 314931072359881393269) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((1839087614484454230373445 : Rat) / 1259724289439525573076) [(1, 2), (11, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3379067369666894124425 : Rat) / 629862144719762786538) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (12, 1), (16, 1)],
  term ((-29230048830915671839817 : Rat) / 1259724289439525573076) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17192194421779317830177 : Rat) / 629862144719762786538) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1065026482578216455520 : Rat) / 14996717731422923489) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((410252806558253346944869 : Rat) / 1259724289439525573076) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (14, 1), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-180868589952443837981711 : Rat) / 1259724289439525573076) [(1, 2), (15, 2), (16, 1)],
  term ((-109088016754608218369731 : Rat) / 629862144719762786538) [(1, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 186. -/
theorem rs_R007_ueqv_R007NY_block_22_0100_0186_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_22_0100_0186
      rs_R007_ueqv_R007NY_block_22_0100_0186 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
