/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 10:100-167

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_10_0100_0167 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0100 : Poly :=
[
  term ((48 : Rat) / 5) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0100 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0100_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0100
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0101 : Poly :=
[
  term (3 : Rat) [(2, 1), (14, 1)]
]

/-- Partial product 101 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0101 : Poly :=
[
  term (-6 : Rat) [(0, 1), (2, 2), (14, 1)],
  term (3 : Rat) [(0, 2), (2, 1), (14, 1)],
  term (-6 : Rat) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term (3 : Rat) [(1, 2), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0101_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0101
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0102 : Poly :=
[
  term ((-2 : Rat) / 5) [(2, 1), (16, 1)]
]

/-- Partial product 102 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0102 : Poly :=
[
  term ((4 : Rat) / 5) [(0, 1), (2, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(0, 2), (2, 1), (16, 1)],
  term ((4 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0102_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0102
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0103 : Poly :=
[
  term ((-288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)]
]

/-- Partial product 103 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0103 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (2, 3), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (2, 2), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0103_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0103
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0104 : Poly :=
[
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0104 : Poly :=
[
  term ((-192 : Rat) / 5) [(0, 1), (2, 3), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0104_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0104
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0105 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 105 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0105 : Poly :=
[
  term ((-96 : Rat) / 35) [(0, 1), (2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((48 : Rat) / 35) [(0, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term ((48 : Rat) / 35) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0105_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0105
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0106 : Poly :=
[
  term (-12 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 106 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0106 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (7, 1)],
  term (24 : Rat) [(1, 1), (3, 2), (7, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0106_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0106
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0107 : Poly :=
[
  term ((1032 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 107 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0107 : Poly :=
[
  term ((-2064 : Rat) / 35) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1032 : Rat) / 35) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2064 : Rat) / 35) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((1032 : Rat) / 35) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0107_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0107
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0108 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 108 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0108 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0108_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0108
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0109 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 109 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0109 : Poly :=
[
  term ((-192 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0109_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0109
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0110 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 110 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0110 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0110_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0110
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0111 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 111 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0111 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0111_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0111
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0112 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0112 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0112_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0112
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0113 : Poly :=
[
  term (6 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 113 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0113 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term (6 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term (-12 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0113_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0113
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0114 : Poly :=
[
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 114 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0114 : Poly :=
[
  term ((8 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0114_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0114
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0115 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (9, 1)]
]

/-- Partial product 115 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0115 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0115_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0115
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0116 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 116 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0116 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0116_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0116
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0117 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 117 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0117 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0117_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0117
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0118 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 118 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0118 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0118_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0118
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0119 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 119 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0119 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0119_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0119
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0120 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 120 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0120 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0120_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0120
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0121 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 121 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0121 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0121_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0121
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0122 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 122 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0122 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0122_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0122
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0123 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1)]
]

/-- Partial product 123 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0123 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0123_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0123
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0124 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 124 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0124 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (14, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0124_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0124
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0125 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 125 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0125 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0125_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0125
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0126 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 126 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0126 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0126_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0126
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0127 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (14, 1)]
]

/-- Partial product 127 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0127 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (4, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0127_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0127
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0128 : Poly :=
[
  term ((24 : Rat) / 35) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 128 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0128 : Poly :=
[
  term ((-48 : Rat) / 35) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 35) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 35) [(1, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0128_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0128
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0129 : Poly :=
[
  term ((24 : Rat) / 35) [(5, 1), (13, 1)]
]

/-- Partial product 129 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0129 : Poly :=
[
  term ((-48 : Rat) / 35) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((24 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((24 : Rat) / 35) [(1, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0129_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0129
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0130 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 130 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0130 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0130_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0130
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0131 : Poly :=
[
  term ((-72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 131 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0131 : Poly :=
[
  term ((144 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0131_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0131
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0132 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 1), (11, 1)]
]

/-- Partial product 132 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0132 : Poly :=
[
  term ((-12 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((6 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((6 : Rat) / 5) [(1, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0132_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0132
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0133 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 133 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0133 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0133_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0133
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0134 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 134 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0134 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0134_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0134
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0135 : Poly :=
[
  term ((144 : Rat) / 25) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 135 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0135 : Poly :=
[
  term ((-288 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((144 : Rat) / 25) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-288 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((144 : Rat) / 25) [(1, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0135_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0135
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0136 : Poly :=
[
  term ((-48 : Rat) / 25) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0136 : Poly :=
[
  term ((96 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0136_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0136
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0137 : Poly :=
[
  term ((3006 : Rat) / 35) [(7, 1), (13, 1)]
]

/-- Partial product 137 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0137 : Poly :=
[
  term ((-6012 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((3006 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((-6012 : Rat) / 35) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((3006 : Rat) / 35) [(1, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0137_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0137
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0138 : Poly :=
[
  term ((-432 : Rat) / 5) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 138 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0138 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0138_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0138
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0139 : Poly :=
[
  term ((-252 : Rat) / 25) [(7, 1), (15, 1)]
]

/-- Partial product 139 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0139 : Poly :=
[
  term ((504 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-252 : Rat) / 25) [(0, 2), (7, 1), (15, 1)],
  term ((504 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-252 : Rat) / 25) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0139_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0139
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0140 : Poly :=
[
  term ((54 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0140 : Poly :=
[
  term ((-108 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0140_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0140
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0141 : Poly :=
[
  term ((-216 : Rat) / 5) [(7, 2)]
]

/-- Partial product 141 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0141 : Poly :=
[
  term ((432 : Rat) / 5) [(0, 1), (2, 1), (7, 2)],
  term ((-216 : Rat) / 5) [(0, 2), (7, 2)],
  term ((432 : Rat) / 5) [(1, 1), (3, 1), (7, 2)],
  term ((-216 : Rat) / 5) [(1, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0141_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0141
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0142 : Poly :=
[
  term ((216 : Rat) / 5) [(7, 2), (14, 1)]
]

/-- Partial product 142 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0142 : Poly :=
[
  term ((-432 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((216 : Rat) / 5) [(0, 2), (7, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((216 : Rat) / 5) [(1, 2), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0142_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0142
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0143 : Poly :=
[
  term ((144 : Rat) / 35) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 143 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0143 : Poly :=
[
  term ((-288 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2)],
  term ((144 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2)],
  term ((144 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0143_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0143
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0144 : Poly :=
[
  term ((408 : Rat) / 35) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 144 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0144 : Poly :=
[
  term ((-816 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((408 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-816 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((408 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0144_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0144
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0145 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 145 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0145 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0145_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0145
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0146 : Poly :=
[
  term ((48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 146 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0146 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0146_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0146
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0147 : Poly :=
[
  term ((-24 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0147 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0147_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0147
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0148 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 148 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0148 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((144 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0148_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0148
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0149 : Poly :=
[
  term ((-48 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0149 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0149_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0149
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0150 : Poly :=
[
  term ((426 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 150 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0150 : Poly :=
[
  term ((-852 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((426 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-852 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((426 : Rat) / 35) [(1, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0150_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0150
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0151 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 151 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0151 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0151_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0151
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0152 : Poly :=
[
  term ((48 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 152 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0152 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0152_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0152
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0153 : Poly :=
[
  term ((-24 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0153 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0153_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0153
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0154 : Poly :=
[
  term ((144 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 154 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0154 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((144 : Rat) / 5) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0154_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0154
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0155 : Poly :=
[
  term ((-48 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0155 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0155_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0155
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0156 : Poly :=
[
  term ((-102 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 156 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0156 : Poly :=
[
  term ((204 : Rat) / 35) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-102 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((204 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-102 : Rat) / 35) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0156_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0156
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0157 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 157 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0157 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0157_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0157
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0158 : Poly :=
[
  term ((12 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 158 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0158 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0158_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0158
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0159 : Poly :=
[
  term ((-144 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 159 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0159 : Poly :=
[
  term ((288 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((288 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-144 : Rat) / 25) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0159_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0159
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0160 : Poly :=
[
  term ((18 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0160 : Poly :=
[
  term ((-36 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0160_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0160
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0161 : Poly :=
[
  term ((-231 : Rat) / 5) [(12, 1)]
]

/-- Partial product 161 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0161 : Poly :=
[
  term ((462 : Rat) / 5) [(0, 1), (2, 1), (12, 1)],
  term ((-231 : Rat) / 5) [(0, 2), (12, 1)],
  term ((462 : Rat) / 5) [(1, 1), (3, 1), (12, 1)],
  term ((-231 : Rat) / 5) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0161_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0161
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0162 : Poly :=
[
  term ((219 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 162 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0162 : Poly :=
[
  term ((-438 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((219 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term ((-438 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((219 : Rat) / 5) [(1, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0162_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0162
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0163 : Poly :=
[
  term (-1 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 163 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0163 : Poly :=
[
  term (2 : Rat) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-1 : Rat) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0163_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0163
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0164 : Poly :=
[
  term ((48 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 164 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0164 : Poly :=
[
  term ((-96 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((48 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((48 : Rat) / 25) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0164_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0164
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0165 : Poly :=
[
  term ((24 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0165 : Poly :=
[
  term ((-48 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0165_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0165
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0166 : Poly :=
[
  term ((-111 : Rat) / 5) [(14, 1)]
]

/-- Partial product 166 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0166 : Poly :=
[
  term ((222 : Rat) / 5) [(0, 1), (2, 1), (14, 1)],
  term ((-111 : Rat) / 5) [(0, 2), (14, 1)],
  term ((222 : Rat) / 5) [(1, 1), (3, 1), (14, 1)],
  term ((-111 : Rat) / 5) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0166_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0166
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 10. -/
def rs_R006_ueqv_R006_coefficient_10_0167 : Poly :=
[
  term ((11 : Rat) / 10) [(16, 1)]
]

/-- Partial product 167 for generator 10. -/
def rs_R006_ueqv_R006_partial_10_0167 : Poly :=
[
  term ((-11 : Rat) / 5) [(0, 1), (2, 1), (16, 1)],
  term ((11 : Rat) / 10) [(0, 2), (16, 1)],
  term ((-11 : Rat) / 5) [(1, 1), (3, 1), (16, 1)],
  term ((11 : Rat) / 10) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 10. -/
theorem rs_R006_ueqv_R006_partial_10_0167_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_10_0167
        rs_R006_ueqv_R006_generator_10_0100_0167 =
      rs_R006_ueqv_R006_partial_10_0167 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_10_0100_0167 : List Poly :=
[
  rs_R006_ueqv_R006_partial_10_0100,
  rs_R006_ueqv_R006_partial_10_0101,
  rs_R006_ueqv_R006_partial_10_0102,
  rs_R006_ueqv_R006_partial_10_0103,
  rs_R006_ueqv_R006_partial_10_0104,
  rs_R006_ueqv_R006_partial_10_0105,
  rs_R006_ueqv_R006_partial_10_0106,
  rs_R006_ueqv_R006_partial_10_0107,
  rs_R006_ueqv_R006_partial_10_0108,
  rs_R006_ueqv_R006_partial_10_0109,
  rs_R006_ueqv_R006_partial_10_0110,
  rs_R006_ueqv_R006_partial_10_0111,
  rs_R006_ueqv_R006_partial_10_0112,
  rs_R006_ueqv_R006_partial_10_0113,
  rs_R006_ueqv_R006_partial_10_0114,
  rs_R006_ueqv_R006_partial_10_0115,
  rs_R006_ueqv_R006_partial_10_0116,
  rs_R006_ueqv_R006_partial_10_0117,
  rs_R006_ueqv_R006_partial_10_0118,
  rs_R006_ueqv_R006_partial_10_0119,
  rs_R006_ueqv_R006_partial_10_0120,
  rs_R006_ueqv_R006_partial_10_0121,
  rs_R006_ueqv_R006_partial_10_0122,
  rs_R006_ueqv_R006_partial_10_0123,
  rs_R006_ueqv_R006_partial_10_0124,
  rs_R006_ueqv_R006_partial_10_0125,
  rs_R006_ueqv_R006_partial_10_0126,
  rs_R006_ueqv_R006_partial_10_0127,
  rs_R006_ueqv_R006_partial_10_0128,
  rs_R006_ueqv_R006_partial_10_0129,
  rs_R006_ueqv_R006_partial_10_0130,
  rs_R006_ueqv_R006_partial_10_0131,
  rs_R006_ueqv_R006_partial_10_0132,
  rs_R006_ueqv_R006_partial_10_0133,
  rs_R006_ueqv_R006_partial_10_0134,
  rs_R006_ueqv_R006_partial_10_0135,
  rs_R006_ueqv_R006_partial_10_0136,
  rs_R006_ueqv_R006_partial_10_0137,
  rs_R006_ueqv_R006_partial_10_0138,
  rs_R006_ueqv_R006_partial_10_0139,
  rs_R006_ueqv_R006_partial_10_0140,
  rs_R006_ueqv_R006_partial_10_0141,
  rs_R006_ueqv_R006_partial_10_0142,
  rs_R006_ueqv_R006_partial_10_0143,
  rs_R006_ueqv_R006_partial_10_0144,
  rs_R006_ueqv_R006_partial_10_0145,
  rs_R006_ueqv_R006_partial_10_0146,
  rs_R006_ueqv_R006_partial_10_0147,
  rs_R006_ueqv_R006_partial_10_0148,
  rs_R006_ueqv_R006_partial_10_0149,
  rs_R006_ueqv_R006_partial_10_0150,
  rs_R006_ueqv_R006_partial_10_0151,
  rs_R006_ueqv_R006_partial_10_0152,
  rs_R006_ueqv_R006_partial_10_0153,
  rs_R006_ueqv_R006_partial_10_0154,
  rs_R006_ueqv_R006_partial_10_0155,
  rs_R006_ueqv_R006_partial_10_0156,
  rs_R006_ueqv_R006_partial_10_0157,
  rs_R006_ueqv_R006_partial_10_0158,
  rs_R006_ueqv_R006_partial_10_0159,
  rs_R006_ueqv_R006_partial_10_0160,
  rs_R006_ueqv_R006_partial_10_0161,
  rs_R006_ueqv_R006_partial_10_0162,
  rs_R006_ueqv_R006_partial_10_0163,
  rs_R006_ueqv_R006_partial_10_0164,
  rs_R006_ueqv_R006_partial_10_0165,
  rs_R006_ueqv_R006_partial_10_0166,
  rs_R006_ueqv_R006_partial_10_0167
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_10_0100_0167 : Poly :=
[
  term ((-96 : Rat) / 35) [(0, 1), (2, 1), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((-2064 : Rat) / 35) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((576 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((192 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((8 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(0, 1), (2, 1), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 1), (2, 1), (4, 1), (14, 1)],
  term ((-48 : Rat) / 35) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((144 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6012 : Rat) / 35) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((864 : Rat) / 5) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((504 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-108 : Rat) / 25) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(0, 1), (2, 1), (7, 2)],
  term ((-432 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((-288 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-816 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-852 : Rat) / 35) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((204 : Rat) / 35) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-36 : Rat) / 25) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((462 : Rat) / 5) [(0, 1), (2, 1), (12, 1)],
  term ((-438 : Rat) / 5) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term (2 : Rat) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((222 : Rat) / 5) [(0, 1), (2, 1), (14, 1)],
  term ((-11 : Rat) / 5) [(0, 1), (2, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (2, 2), (14, 1)],
  term ((4 : Rat) / 5) [(0, 1), (2, 2), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (2, 3), (9, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(0, 1), (2, 3), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (2, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(0, 2), (2, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (2, 2), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 35) [(0, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (7, 1)],
  term ((1032 : Rat) / 35) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (4, 1), (14, 1)],
  term ((24 : Rat) / 35) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((6 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 25) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3006 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-252 : Rat) / 25) [(0, 2), (7, 1), (15, 1)],
  term ((54 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (7, 2)],
  term ((216 : Rat) / 5) [(0, 2), (7, 2), (14, 1)],
  term ((144 : Rat) / 35) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((408 : Rat) / 35) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((426 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-102 : Rat) / 35) [(0, 2), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 25) [(0, 2), (11, 1), (15, 1)],
  term ((18 : Rat) / 25) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-231 : Rat) / 5) [(0, 2), (12, 1)],
  term ((219 : Rat) / 5) [(0, 2), (12, 1), (14, 1)],
  term (-1 : Rat) [(0, 2), (12, 1), (16, 1)],
  term ((48 : Rat) / 25) [(0, 2), (13, 1), (15, 1)],
  term ((24 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 5) [(0, 2), (14, 1)],
  term ((11 : Rat) / 10) [(0, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((4 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((-48 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((-48 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((144 : Rat) / 35) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6012 : Rat) / 35) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((504 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-108 : Rat) / 25) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(1, 1), (3, 1), (7, 2)],
  term ((-432 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 2)],
  term ((-816 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-852 : Rat) / 35) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((204 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-36 : Rat) / 25) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((462 : Rat) / 5) [(1, 1), (3, 1), (12, 1)],
  term ((-438 : Rat) / 5) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((222 : Rat) / 5) [(1, 1), (3, 1), (14, 1)],
  term ((-11 : Rat) / 5) [(1, 1), (3, 1), (16, 1)],
  term ((-96 : Rat) / 35) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1)],
  term (24 : Rat) [(1, 1), (3, 2), (7, 1)],
  term ((-2064 : Rat) / 35) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (3, 2), (7, 1), (14, 1)],
  term ((8 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 3), (7, 1), (9, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (2, 1), (14, 1)],
  term ((-2 : Rat) / 5) [(1, 2), (2, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(1, 2), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 35) [(1, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (7, 1)],
  term ((1032 : Rat) / 35) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (9, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (4, 1), (14, 1)],
  term ((24 : Rat) / 35) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 35) [(1, 2), (5, 1), (13, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((6 : Rat) / 5) [(1, 2), (7, 1), (11, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 25) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3006 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-252 : Rat) / 25) [(1, 2), (7, 1), (15, 1)],
  term ((54 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (7, 2)],
  term ((216 : Rat) / 5) [(1, 2), (7, 2), (14, 1)],
  term ((144 : Rat) / 35) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((408 : Rat) / 35) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((426 : Rat) / 35) [(1, 2), (9, 1), (13, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-102 : Rat) / 35) [(1, 2), (11, 1), (13, 1)],
  term ((48 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 25) [(1, 2), (11, 1), (15, 1)],
  term ((18 : Rat) / 25) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-231 : Rat) / 5) [(1, 2), (12, 1)],
  term ((219 : Rat) / 5) [(1, 2), (12, 1), (14, 1)],
  term (-1 : Rat) [(1, 2), (12, 1), (16, 1)],
  term ((48 : Rat) / 25) [(1, 2), (13, 1), (15, 1)],
  term ((24 : Rat) / 25) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 5) [(1, 2), (14, 1)],
  term ((11 : Rat) / 10) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 100 through 167. -/
theorem rs_R006_ueqv_R006_block_10_0100_0167_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_10_0100_0167
      rs_R006_ueqv_R006_block_10_0100_0167 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
