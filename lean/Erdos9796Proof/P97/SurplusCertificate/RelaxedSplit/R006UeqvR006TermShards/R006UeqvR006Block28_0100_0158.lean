/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 28:100-158

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_28_0100_0158 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0100 : Poly :=
[
  term (-3 : Rat) [(2, 1), (14, 1)]
]

/-- Partial product 100 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0100 : Poly :=
[
  term (-6 : Rat) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term (3 : Rat) [(2, 1), (3, 2), (14, 1)],
  term (-3 : Rat) [(2, 1), (14, 1)],
  term (6 : Rat) [(2, 1), (14, 2)],
  term (-6 : Rat) [(2, 2), (14, 2)],
  term (3 : Rat) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0100_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0100
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0101 : Poly :=
[
  term ((2 : Rat) / 5) [(2, 1), (16, 1)]
]

/-- Partial product 101 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0101 : Poly :=
[
  term ((4 : Rat) / 5) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(2, 1), (3, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(2, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 5) [(2, 1), (16, 1)],
  term ((4 : Rat) / 5) [(2, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 5) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0101_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0101
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0102 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)]
]

/-- Partial product 102 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0102 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 2), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(2, 3), (9, 1), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 4), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0102_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0102
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0103 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0103 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0103_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0103
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0104 : Poly :=
[
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 104 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0104 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 35) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 35) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 35) [(3, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0104_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0104
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0105 : Poly :=
[
  term (-12 : Rat) [(3, 1), (7, 1)]
]

/-- Partial product 105 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0105 : Poly :=
[
  term (-24 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term (12 : Rat) [(2, 2), (3, 1), (7, 1)],
  term (-12 : Rat) [(3, 1), (7, 1)],
  term (24 : Rat) [(3, 1), (7, 1), (14, 1)],
  term (-24 : Rat) [(3, 2), (7, 1), (15, 1)],
  term (12 : Rat) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0105_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0105
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0106 : Poly :=
[
  term ((1032 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 106 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0106 : Poly :=
[
  term ((2064 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1032 : Rat) / 35) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((1032 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-2064 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((2064 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1032 : Rat) / 35) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0106_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0106
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0107 : Poly :=
[
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 107 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0107 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((288 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0107_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0107
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0108 : Poly :=
[
  term ((96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 108 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0108 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0108_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0108
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0109 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0109 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0109_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0109
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0110 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 110 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0110 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0110_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0110
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0111 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0111 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0111_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0111
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0112 : Poly :=
[
  term (6 : Rat) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 112 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0112 : Poly :=
[
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term (-6 : Rat) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term (6 : Rat) [(3, 1), (7, 1), (14, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (14, 2)],
  term (12 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term (-6 : Rat) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0112_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0112
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0113 : Poly :=
[
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 113 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0113 : Poly :=
[
  term ((-8 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0113_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0113
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0114 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 114 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0114 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(3, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0114_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0114
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0115 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 115 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0115 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-144 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0115_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0115
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0116 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 116 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0116 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0116_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0116
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0117 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 117 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0117 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0117_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0117
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0118 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1)]
]

/-- Partial product 118 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0118 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(3, 4), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0118_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0118
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0119 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 119 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0119 : Poly :=
[
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 2)],
  term ((-144 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2)],
  term ((288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0119_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0119
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0120 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0120 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0120_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0120
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0121 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 121 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0121 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0121_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0121
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0122 : Poly :=
[
  term ((6 : Rat) / 5) [(4, 1)]
]

/-- Partial product 122 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0122 : Poly :=
[
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(2, 2), (4, 1)],
  term ((12 : Rat) / 5) [(3, 1), (4, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (4, 1)],
  term ((6 : Rat) / 5) [(4, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0122_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0122
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0123 : Poly :=
[
  term ((-12 : Rat) / 5) [(4, 1), (14, 1)]
]

/-- Partial product 123 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0123 : Poly :=
[
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (14, 2)],
  term ((12 : Rat) / 5) [(2, 2), (4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 2), (4, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(4, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0123_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0123
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0124 : Poly :=
[
  term ((48 : Rat) / 35) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 124 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0124 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 35) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 35) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 35) [(5, 1), (12, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0124_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0124
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0125 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 125 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0125 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (5, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(3, 2), (5, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0125_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0125
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0126 : Poly :=
[
  term ((-72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 126 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0126 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((72 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0126_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0126
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0127 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 1), (11, 1)]
]

/-- Partial product 127 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0127 : Poly :=
[
  term ((12 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(2, 2), (7, 1), (11, 1)],
  term ((12 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (7, 1), (11, 1)],
  term ((6 : Rat) / 5) [(7, 1), (11, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0127_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0127
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0128 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 128 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0128 : Poly :=
[
  term ((-48 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((24 : Rat) / 5) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(7, 1), (11, 1), (14, 1)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0128_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0128
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0129 : Poly :=
[
  term ((-6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0129 : Poly :=
[
  term ((-12 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 5) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 5) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0129_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0129
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0130 : Poly :=
[
  term ((144 : Rat) / 25) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 130 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0130 : Poly :=
[
  term ((288 : Rat) / 25) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 25) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((288 : Rat) / 25) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-144 : Rat) / 25) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-288 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((144 : Rat) / 25) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0130_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0130
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0131 : Poly :=
[
  term ((-48 : Rat) / 25) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0131 : Poly :=
[
  term ((-96 : Rat) / 25) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 25) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 25) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0131_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0131
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0132 : Poly :=
[
  term ((3006 : Rat) / 35) [(7, 1), (13, 1)]
]

/-- Partial product 132 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0132 : Poly :=
[
  term ((6012 : Rat) / 35) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-3006 : Rat) / 35) [(2, 2), (7, 1), (13, 1)],
  term ((6012 : Rat) / 35) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3006 : Rat) / 35) [(3, 2), (7, 1), (13, 1)],
  term ((3006 : Rat) / 35) [(7, 1), (13, 1)],
  term ((-6012 : Rat) / 35) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0132_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0132
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0133 : Poly :=
[
  term ((-432 : Rat) / 5) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 133 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0133 : Poly :=
[
  term ((-864 : Rat) / 5) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((432 : Rat) / 5) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((432 : Rat) / 5) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0133_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0133
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0134 : Poly :=
[
  term ((-252 : Rat) / 25) [(7, 1), (15, 1)]
]

/-- Partial product 134 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0134 : Poly :=
[
  term ((-504 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((252 : Rat) / 25) [(2, 2), (7, 1), (15, 1)],
  term ((-504 : Rat) / 25) [(3, 1), (7, 1), (15, 2)],
  term ((252 : Rat) / 25) [(3, 2), (7, 1), (15, 1)],
  term ((504 : Rat) / 25) [(7, 1), (14, 1), (15, 1)],
  term ((-252 : Rat) / 25) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0134_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0134
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0135 : Poly :=
[
  term ((54 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0135 : Poly :=
[
  term ((108 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 25) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-54 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 25) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0135_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0135
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0136 : Poly :=
[
  term ((-216 : Rat) / 5) [(7, 2)]
]

/-- Partial product 136 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0136 : Poly :=
[
  term ((-432 : Rat) / 5) [(2, 1), (7, 2), (14, 1)],
  term ((216 : Rat) / 5) [(2, 2), (7, 2)],
  term ((-432 : Rat) / 5) [(3, 1), (7, 2), (15, 1)],
  term ((216 : Rat) / 5) [(3, 2), (7, 2)],
  term ((-216 : Rat) / 5) [(7, 2)],
  term ((432 : Rat) / 5) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0136_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0136
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0137 : Poly :=
[
  term ((216 : Rat) / 5) [(7, 2), (14, 1)]
]

/-- Partial product 137 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0137 : Poly :=
[
  term ((432 : Rat) / 5) [(2, 1), (7, 2), (14, 2)],
  term ((-216 : Rat) / 5) [(2, 2), (7, 2), (14, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-216 : Rat) / 5) [(3, 2), (7, 2), (14, 1)],
  term ((216 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0137_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0137
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0138 : Poly :=
[
  term ((144 : Rat) / 35) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 138 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0138 : Poly :=
[
  term ((288 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-144 : Rat) / 35) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((144 : Rat) / 35) [(9, 1), (11, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0138_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0138
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0139 : Poly :=
[
  term ((888 : Rat) / 35) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 139 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0139 : Poly :=
[
  term ((1776 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-888 : Rat) / 35) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((1776 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-888 : Rat) / 35) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((888 : Rat) / 35) [(9, 1), (12, 1), (13, 1)],
  term ((-1776 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0139_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0139
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0140 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 140 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0140 : Poly :=
[
  term ((-576 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0140_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0140
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0141 : Poly :=
[
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0141 : Poly :=
[
  term ((192 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0141_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0141
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0142 : Poly :=
[
  term ((-48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0142 : Poly :=
[
  term ((-96 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0142_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0142
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0143 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 143 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0143 : Poly :=
[
  term ((576 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0143_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0143
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0144 : Poly :=
[
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0144 : Poly :=
[
  term ((-192 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0144_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0144
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0145 : Poly :=
[
  term ((54 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 145 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0145 : Poly :=
[
  term ((108 : Rat) / 35) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-54 : Rat) / 35) [(2, 2), (9, 1), (13, 1)],
  term ((108 : Rat) / 35) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-54 : Rat) / 35) [(3, 2), (9, 1), (13, 1)],
  term ((54 : Rat) / 35) [(9, 1), (13, 1)],
  term ((-108 : Rat) / 35) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0145_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0145
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0146 : Poly :=
[
  term ((6 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 146 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0146 : Poly :=
[
  term ((12 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((12 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6 : Rat) / 35) [(3, 2), (11, 1), (13, 1)],
  term ((6 : Rat) / 35) [(11, 1), (13, 1)],
  term ((-12 : Rat) / 35) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0146_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0146
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0147 : Poly :=
[
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 147 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0147 : Poly :=
[
  term ((96 : Rat) / 5) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-48 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(11, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0147_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0147
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0148 : Poly :=
[
  term ((12 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0148 : Poly :=
[
  term ((24 : Rat) / 5) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 5) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0148_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0148
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0149 : Poly :=
[
  term ((396 : Rat) / 25) [(11, 1), (15, 1)]
]

/-- Partial product 149 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0149 : Poly :=
[
  term ((792 : Rat) / 25) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-396 : Rat) / 25) [(2, 2), (11, 1), (15, 1)],
  term ((792 : Rat) / 25) [(3, 1), (11, 1), (15, 2)],
  term ((-396 : Rat) / 25) [(3, 2), (11, 1), (15, 1)],
  term ((-792 : Rat) / 25) [(11, 1), (14, 1), (15, 1)],
  term ((396 : Rat) / 25) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0149_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0149
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0150 : Poly :=
[
  term ((-42 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0150 : Poly :=
[
  term ((-84 : Rat) / 25) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((42 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 25) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((42 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((84 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0150_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0150
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0151 : Poly :=
[
  term ((-252 : Rat) / 5) [(12, 1)]
]

/-- Partial product 151 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0151 : Poly :=
[
  term ((-504 : Rat) / 5) [(2, 1), (12, 1), (14, 1)],
  term ((252 : Rat) / 5) [(2, 2), (12, 1)],
  term ((-504 : Rat) / 5) [(3, 1), (12, 1), (15, 1)],
  term ((252 : Rat) / 5) [(3, 2), (12, 1)],
  term ((-252 : Rat) / 5) [(12, 1)],
  term ((504 : Rat) / 5) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0151_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0151
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0152 : Poly :=
[
  term ((246 : Rat) / 5) [(12, 1), (14, 1)]
]

/-- Partial product 152 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0152 : Poly :=
[
  term ((492 : Rat) / 5) [(2, 1), (12, 1), (14, 2)],
  term ((-246 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((492 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-246 : Rat) / 5) [(3, 2), (12, 1), (14, 1)],
  term ((246 : Rat) / 5) [(12, 1), (14, 1)],
  term ((-492 : Rat) / 5) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0152_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0152
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0153 : Poly :=
[
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)]
]

/-- Partial product 153 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0153 : Poly :=
[
  term ((-8 : Rat) / 5) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 5) [(2, 2), (12, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(3, 2), (12, 1), (16, 1)],
  term ((8 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0153_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0153
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0154 : Poly :=
[
  term ((-96 : Rat) / 25) [(13, 1), (15, 1)]
]

/-- Partial product 154 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0154 : Poly :=
[
  term ((-192 : Rat) / 25) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((96 : Rat) / 25) [(2, 2), (13, 1), (15, 1)],
  term ((-192 : Rat) / 25) [(3, 1), (13, 1), (15, 2)],
  term ((96 : Rat) / 25) [(3, 2), (13, 1), (15, 1)],
  term ((192 : Rat) / 25) [(13, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0154_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0154
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0155 : Poly :=
[
  term ((12 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0155 : Poly :=
[
  term ((24 : Rat) / 25) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 25) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 25) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 25) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 25) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0155_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0155
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0156 : Poly :=
[
  term ((-36 : Rat) / 35) [(13, 2)]
]

/-- Partial product 156 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0156 : Poly :=
[
  term ((-72 : Rat) / 35) [(2, 1), (13, 2), (14, 1)],
  term ((36 : Rat) / 35) [(2, 2), (13, 2)],
  term ((-72 : Rat) / 35) [(3, 1), (13, 2), (15, 1)],
  term ((36 : Rat) / 35) [(3, 2), (13, 2)],
  term ((-36 : Rat) / 35) [(13, 2)],
  term ((72 : Rat) / 35) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0156_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0156
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0157 : Poly :=
[
  term (-30 : Rat) [(14, 1)]
]

/-- Partial product 157 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0157 : Poly :=
[
  term (-60 : Rat) [(2, 1), (14, 2)],
  term (30 : Rat) [(2, 2), (14, 1)],
  term (-60 : Rat) [(3, 1), (14, 1), (15, 1)],
  term (30 : Rat) [(3, 2), (14, 1)],
  term (-30 : Rat) [(14, 1)],
  term (60 : Rat) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0157_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0157
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 28. -/
def rs_R006_ueqv_R006_coefficient_28_0158 : Poly :=
[
  term ((3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 158 for generator 28. -/
def rs_R006_ueqv_R006_partial_28_0158 : Poly :=
[
  term ((3 : Rat) / 5) [(2, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(2, 2), (16, 1)],
  term ((3 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(3, 2), (16, 1)],
  term ((-3 : Rat) / 5) [(14, 1), (16, 1)],
  term ((3 : Rat) / 10) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 28. -/
theorem rs_R006_ueqv_R006_partial_28_0158_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_28_0158
        rs_R006_ueqv_R006_generator_28_0100_0158 =
      rs_R006_ueqv_R006_partial_28_0158 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_28_0100_0158 : List Poly :=
[
  rs_R006_ueqv_R006_partial_28_0100,
  rs_R006_ueqv_R006_partial_28_0101,
  rs_R006_ueqv_R006_partial_28_0102,
  rs_R006_ueqv_R006_partial_28_0103,
  rs_R006_ueqv_R006_partial_28_0104,
  rs_R006_ueqv_R006_partial_28_0105,
  rs_R006_ueqv_R006_partial_28_0106,
  rs_R006_ueqv_R006_partial_28_0107,
  rs_R006_ueqv_R006_partial_28_0108,
  rs_R006_ueqv_R006_partial_28_0109,
  rs_R006_ueqv_R006_partial_28_0110,
  rs_R006_ueqv_R006_partial_28_0111,
  rs_R006_ueqv_R006_partial_28_0112,
  rs_R006_ueqv_R006_partial_28_0113,
  rs_R006_ueqv_R006_partial_28_0114,
  rs_R006_ueqv_R006_partial_28_0115,
  rs_R006_ueqv_R006_partial_28_0116,
  rs_R006_ueqv_R006_partial_28_0117,
  rs_R006_ueqv_R006_partial_28_0118,
  rs_R006_ueqv_R006_partial_28_0119,
  rs_R006_ueqv_R006_partial_28_0120,
  rs_R006_ueqv_R006_partial_28_0121,
  rs_R006_ueqv_R006_partial_28_0122,
  rs_R006_ueqv_R006_partial_28_0123,
  rs_R006_ueqv_R006_partial_28_0124,
  rs_R006_ueqv_R006_partial_28_0125,
  rs_R006_ueqv_R006_partial_28_0126,
  rs_R006_ueqv_R006_partial_28_0127,
  rs_R006_ueqv_R006_partial_28_0128,
  rs_R006_ueqv_R006_partial_28_0129,
  rs_R006_ueqv_R006_partial_28_0130,
  rs_R006_ueqv_R006_partial_28_0131,
  rs_R006_ueqv_R006_partial_28_0132,
  rs_R006_ueqv_R006_partial_28_0133,
  rs_R006_ueqv_R006_partial_28_0134,
  rs_R006_ueqv_R006_partial_28_0135,
  rs_R006_ueqv_R006_partial_28_0136,
  rs_R006_ueqv_R006_partial_28_0137,
  rs_R006_ueqv_R006_partial_28_0138,
  rs_R006_ueqv_R006_partial_28_0139,
  rs_R006_ueqv_R006_partial_28_0140,
  rs_R006_ueqv_R006_partial_28_0141,
  rs_R006_ueqv_R006_partial_28_0142,
  rs_R006_ueqv_R006_partial_28_0143,
  rs_R006_ueqv_R006_partial_28_0144,
  rs_R006_ueqv_R006_partial_28_0145,
  rs_R006_ueqv_R006_partial_28_0146,
  rs_R006_ueqv_R006_partial_28_0147,
  rs_R006_ueqv_R006_partial_28_0148,
  rs_R006_ueqv_R006_partial_28_0149,
  rs_R006_ueqv_R006_partial_28_0150,
  rs_R006_ueqv_R006_partial_28_0151,
  rs_R006_ueqv_R006_partial_28_0152,
  rs_R006_ueqv_R006_partial_28_0153,
  rs_R006_ueqv_R006_partial_28_0154,
  rs_R006_ueqv_R006_partial_28_0155,
  rs_R006_ueqv_R006_partial_28_0156,
  rs_R006_ueqv_R006_partial_28_0157,
  rs_R006_ueqv_R006_partial_28_0158
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_28_0100_0158 : Poly :=
[
  term ((96 : Rat) / 35) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((2064 : Rat) / 35) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((192 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((576 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 5) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(2, 1), (3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term (3 : Rat) [(2, 1), (3, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(2, 1), (3, 2), (16, 1)],
  term ((12 : Rat) / 5) [(2, 1), (4, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(2, 1), (4, 1), (14, 2)],
  term ((96 : Rat) / 35) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((288 : Rat) / 25) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6012 : Rat) / 35) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-504 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((108 : Rat) / 25) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(2, 1), (7, 2), (14, 1)],
  term ((432 : Rat) / 5) [(2, 1), (7, 2), (14, 2)],
  term ((288 : Rat) / 35) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1776 : Rat) / 35) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((192 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((108 : Rat) / 35) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 35) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((792 : Rat) / 25) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-84 : Rat) / 25) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-504 : Rat) / 5) [(2, 1), (12, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((492 : Rat) / 5) [(2, 1), (12, 1), (14, 2)],
  term ((-192 : Rat) / 25) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 25) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(2, 1), (13, 2), (14, 1)],
  term (-3 : Rat) [(2, 1), (14, 1)],
  term ((-1 : Rat) / 5) [(2, 1), (14, 1), (16, 1)],
  term (-54 : Rat) [(2, 1), (14, 2)],
  term ((2 : Rat) / 5) [(2, 1), (16, 1)],
  term ((-48 : Rat) / 35) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term (12 : Rat) [(2, 2), (3, 1), (7, 1)],
  term ((-1032 : Rat) / 35) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((4 : Rat) / 5) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((-144 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((576 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-192 : Rat) / 5) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1)],
  term ((-144 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (3, 2), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(2, 2), (4, 1)],
  term ((12 : Rat) / 5) [(2, 2), (4, 1), (14, 1)],
  term ((-48 : Rat) / 35) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (5, 1), (15, 1)],
  term ((72 : Rat) / 35) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-6 : Rat) / 5) [(2, 2), (7, 1), (11, 1)],
  term ((24 : Rat) / 5) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((6 : Rat) / 5) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 25) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((48 : Rat) / 25) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3006 : Rat) / 35) [(2, 2), (7, 1), (13, 1)],
  term ((432 : Rat) / 5) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((252 : Rat) / 25) [(2, 2), (7, 1), (15, 1)],
  term ((-54 : Rat) / 25) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(2, 2), (7, 2)],
  term ((-216 : Rat) / 5) [(2, 2), (7, 2), (14, 1)],
  term ((-144 : Rat) / 35) [(2, 2), (9, 1), (11, 1), (13, 2)],
  term ((-888 : Rat) / 35) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 35) [(2, 2), (9, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((192 : Rat) / 5) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(2, 2), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-396 : Rat) / 25) [(2, 2), (11, 1), (15, 1)],
  term ((42 : Rat) / 25) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 5) [(2, 2), (12, 1)],
  term ((-246 : Rat) / 5) [(2, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(2, 2), (12, 1), (16, 1)],
  term ((96 : Rat) / 25) [(2, 2), (13, 1), (15, 1)],
  term ((-12 : Rat) / 25) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 35) [(2, 2), (13, 2)],
  term (30 : Rat) [(2, 2), (14, 1)],
  term ((4 : Rat) / 5) [(2, 2), (14, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (14, 2)],
  term ((-3 : Rat) / 10) [(2, 2), (16, 1)],
  term ((576 : Rat) / 5) [(2, 3), (9, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(2, 3), (14, 1)],
  term ((-2 : Rat) / 5) [(2, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(2, 4), (9, 1), (15, 1)],
  term ((96 : Rat) / 5) [(2, 4), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 1), (4, 1), (15, 1)],
  term ((48 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 35) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (5, 1), (15, 2)],
  term (-12 : Rat) [(3, 1), (7, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1032 : Rat) / 35) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-816 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-192 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((192 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 25) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-96 : Rat) / 25) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((6012 : Rat) / 35) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term (30 : Rat) [(3, 1), (7, 1), (14, 1)],
  term ((8 : Rat) / 5) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (7, 1), (14, 2)],
  term ((-504 : Rat) / 25) [(3, 1), (7, 1), (15, 2)],
  term ((108 : Rat) / 25) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(3, 1), (7, 1), (16, 1)],
  term ((432 : Rat) / 5) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (7, 2), (15, 1)],
  term ((288 : Rat) / 35) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((288 : Rat) / 5) [(3, 1), (9, 1), (12, 1)],
  term ((-576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1776 : Rat) / 35) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-192 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((108 : Rat) / 35) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 35) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((792 : Rat) / 25) [(3, 1), (11, 1), (15, 2)],
  term ((-84 : Rat) / 25) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((492 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-504 : Rat) / 5) [(3, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 5) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 25) [(3, 1), (13, 1), (15, 2)],
  term ((24 : Rat) / 25) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (13, 2), (15, 1)],
  term (-60 : Rat) [(3, 1), (14, 1), (15, 1)],
  term ((3 : Rat) / 5) [(3, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (4, 1)],
  term ((12 : Rat) / 5) [(3, 2), (4, 1), (14, 1)],
  term ((96 : Rat) / 35) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 35) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (5, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1)],
  term ((72 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2064 : Rat) / 35) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)],
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(3, 2), (7, 1), (11, 1)],
  term ((24 : Rat) / 5) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((6 : Rat) / 5) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 25) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((48 : Rat) / 25) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3006 : Rat) / 35) [(3, 2), (7, 1), (13, 1)],
  term ((432 : Rat) / 5) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term (12 : Rat) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-348 : Rat) / 25) [(3, 2), (7, 1), (15, 1)],
  term ((-94 : Rat) / 25) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(3, 2), (7, 2)],
  term ((-216 : Rat) / 5) [(3, 2), (7, 2), (14, 1)],
  term ((-144 : Rat) / 35) [(3, 2), (9, 1), (11, 1), (13, 2)],
  term ((-888 : Rat) / 35) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 35) [(3, 2), (9, 1), (13, 1)],
  term ((-6 : Rat) / 35) [(3, 2), (11, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-396 : Rat) / 25) [(3, 2), (11, 1), (15, 1)],
  term ((42 : Rat) / 25) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((252 : Rat) / 5) [(3, 2), (12, 1)],
  term ((-246 : Rat) / 5) [(3, 2), (12, 1), (14, 1)],
  term ((4 : Rat) / 5) [(3, 2), (12, 1), (16, 1)],
  term ((96 : Rat) / 25) [(3, 2), (13, 1), (15, 1)],
  term ((-12 : Rat) / 25) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 35) [(3, 2), (13, 2)],
  term (30 : Rat) [(3, 2), (14, 1)],
  term ((-3 : Rat) / 10) [(3, 2), (16, 1)],
  term ((-48 : Rat) / 35) [(3, 3), (5, 1), (7, 1), (13, 1)],
  term (12 : Rat) [(3, 3), (7, 1)],
  term ((-1032 : Rat) / 35) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 3), (7, 1), (14, 1)],
  term ((4 : Rat) / 5) [(3, 3), (7, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 3), (9, 1), (12, 1)],
  term ((-144 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 3), (9, 1), (12, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 4), (7, 1), (9, 1)],
  term ((-144 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 4), (7, 1), (9, 1), (16, 1)],
  term ((6 : Rat) / 5) [(4, 1)],
  term ((-24 : Rat) / 5) [(4, 1), (14, 1)],
  term ((24 : Rat) / 5) [(4, 1), (14, 2)],
  term ((48 : Rat) / 35) [(5, 1), (12, 1), (13, 1)],
  term ((-96 : Rat) / 35) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (15, 1)],
  term ((-72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((6 : Rat) / 5) [(7, 1), (11, 1)],
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (14, 1)],
  term ((12 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 2)],
  term ((-6 : Rat) / 5) [(7, 1), (11, 1), (16, 1)],
  term ((-288 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((96 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 25) [(7, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3006 : Rat) / 35) [(7, 1), (13, 1)],
  term ((-9036 : Rat) / 35) [(7, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(7, 1), (13, 1), (14, 2)],
  term ((504 : Rat) / 25) [(7, 1), (14, 1), (15, 1)],
  term ((-108 : Rat) / 25) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 25) [(7, 1), (15, 1)],
  term ((54 : Rat) / 25) [(7, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(7, 2)],
  term ((648 : Rat) / 5) [(7, 2), (14, 1)],
  term ((-432 : Rat) / 5) [(7, 2), (14, 2)],
  term ((144 : Rat) / 35) [(9, 1), (11, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((888 : Rat) / 35) [(9, 1), (12, 1), (13, 1)],
  term ((-3792 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-192 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((192 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (12, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 35) [(9, 1), (13, 1)],
  term ((-108 : Rat) / 35) [(9, 1), (13, 1), (14, 1)],
  term ((6 : Rat) / 35) [(11, 1), (13, 1)],
  term ((324 : Rat) / 35) [(11, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(11, 1), (13, 1), (14, 2)],
  term ((12 : Rat) / 5) [(11, 1), (13, 1), (16, 1)],
  term ((-792 : Rat) / 25) [(11, 1), (14, 1), (15, 1)],
  term ((84 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((396 : Rat) / 25) [(11, 1), (15, 1)],
  term ((-42 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((-252 : Rat) / 5) [(12, 1)],
  term (150 : Rat) [(12, 1), (14, 1)],
  term ((8 : Rat) / 5) [(12, 1), (14, 1), (16, 1)],
  term ((-492 : Rat) / 5) [(12, 1), (14, 2)],
  term ((-4 : Rat) / 5) [(12, 1), (16, 1)],
  term ((192 : Rat) / 25) [(13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 25) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(13, 1), (15, 1)],
  term ((12 : Rat) / 25) [(13, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 35) [(13, 2)],
  term ((72 : Rat) / 35) [(13, 2), (14, 1)],
  term (-30 : Rat) [(14, 1)],
  term ((-3 : Rat) / 5) [(14, 1), (16, 1)],
  term (60 : Rat) [(14, 2)],
  term ((3 : Rat) / 10) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 100 through 158. -/
theorem rs_R006_ueqv_R006_block_28_0100_0158_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_28_0100_0158
      rs_R006_ueqv_R006_block_28_0100_0158 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
