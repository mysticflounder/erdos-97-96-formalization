/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R002:u=v:R002YNYN, term block 12:100-136

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R002UeqvR002YNYNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R002:u=v:R002YNYN`. -/
def rs_R002_ueqv_R002YNYN_generator_12_0100_0136 : Poly :=
[
  term (2 : Rat) [(2, 1), (8, 1)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0100 : Poly :=
[
  term (72 : Rat) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 100 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0100 : Poly :=
[
  term (144 : Rat) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term (144 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term (-72 : Rat) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term (-72 : Rat) [(7, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0100_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0100
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0101 : Poly :=
[
  term (12 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0101 : Poly :=
[
  term (24 : Rat) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0101_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0101
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0102 : Poly :=
[
  term (240 : Rat) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0102 : Poly :=
[
  term (480 : Rat) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term (480 : Rat) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term (-240 : Rat) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term (-240 : Rat) [(7, 1), (9, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0102_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0102
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0103 : Poly :=
[
  term (16 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0103 : Poly :=
[
  term (32 : Rat) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term (32 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (-16 : Rat) [(7, 1), (8, 2), (13, 1)],
  term (-16 : Rat) [(7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0103_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0103
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0104 : Poly :=
[
  term (4 : Rat) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0104 : Poly :=
[
  term (8 : Rat) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0104_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0104
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0105 : Poly :=
[
  term (-8 : Rat) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0105 : Poly :=
[
  term (-16 : Rat) [(2, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0105_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0105
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0106 : Poly :=
[
  term (5 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0106 : Poly :=
[
  term (10 : Rat) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term (10 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term (-5 : Rat) [(7, 1), (8, 2), (15, 1)],
  term (-5 : Rat) [(7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0106_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0106
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0107 : Poly :=
[
  term ((-43 : Rat) / 2) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0107 : Poly :=
[
  term (-43 : Rat) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (-43 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((43 : Rat) / 2) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((43 : Rat) / 2) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0107_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0107
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0108 : Poly :=
[
  term (84 : Rat) [(7, 1), (15, 3)]
]

/-- Partial product 108 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0108 : Poly :=
[
  term (168 : Rat) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term (168 : Rat) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term (-84 : Rat) [(7, 1), (8, 2), (15, 3)],
  term (-84 : Rat) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0108_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0108
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0109 : Poly :=
[
  term (6 : Rat) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0109 : Poly :=
[
  term (12 : Rat) [(2, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term (-6 : Rat) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0109_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0109
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0110 : Poly :=
[
  term (12 : Rat) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0110 : Poly :=
[
  term (24 : Rat) [(2, 1), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (8, 2), (10, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0110_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0110
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0111 : Poly :=
[
  term (24 : Rat) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0111 : Poly :=
[
  term (48 : Rat) [(2, 1), (7, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0111_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0111
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0112 : Poly :=
[
  term (-24 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0112 : Poly :=
[
  term (-48 : Rat) [(2, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0112_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0112
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0113 : Poly :=
[
  term (1 : Rat) [(8, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0113 : Poly :=
[
  term (2 : Rat) [(2, 1), (8, 2)],
  term (2 : Rat) [(3, 1), (8, 1), (9, 1)],
  term (-1 : Rat) [(8, 1), (9, 2)],
  term (-1 : Rat) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0113_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0113
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0114 : Poly :=
[
  term (-8 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0114 : Poly :=
[
  term (-16 : Rat) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 3), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0114_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0114
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0115 : Poly :=
[
  term (-8 : Rat) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 115 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0115 : Poly :=
[
  term (-16 : Rat) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term (-16 : Rat) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term (8 : Rat) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term (8 : Rat) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0115_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0115
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0116 : Poly :=
[
  term (4 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 116 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0116 : Poly :=
[
  term (8 : Rat) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term (8 : Rat) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term (-4 : Rat) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term (-4 : Rat) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0116_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0116
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0117 : Poly :=
[
  term ((-4 : Rat) / 3) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0117 : Poly :=
[
  term ((-8 : Rat) / 3) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0117_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0117
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0118 : Poly :=
[
  term (4 : Rat) [(8, 1), (15, 2)]
]

/-- Partial product 118 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0118 : Poly :=
[
  term (8 : Rat) [(2, 1), (8, 2), (15, 2)],
  term (8 : Rat) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term (-4 : Rat) [(8, 1), (9, 2), (15, 2)],
  term (-4 : Rat) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0118_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0118
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0119 : Poly :=
[
  term (8 : Rat) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 119 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0119 : Poly :=
[
  term (16 : Rat) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term (16 : Rat) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term (-8 : Rat) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term (-8 : Rat) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0119_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0119
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0120 : Poly :=
[
  term (-4 : Rat) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 120 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0120 : Poly :=
[
  term (-8 : Rat) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term (-8 : Rat) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term (4 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term (4 : Rat) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0120_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0120
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0121 : Poly :=
[
  term ((-16 : Rat) / 3) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0121 : Poly :=
[
  term ((-32 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0121_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0121
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0122 : Poly :=
[
  term (8 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0122 : Poly :=
[
  term (16 : Rat) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 3), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0122_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0122
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0123 : Poly :=
[
  term ((-4 : Rat) / 3) [(9, 1), (13, 1)]
]

/-- Partial product 123 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0123 : Poly :=
[
  term ((-8 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (9, 2), (13, 1)],
  term ((4 : Rat) / 3) [(8, 2), (9, 1), (13, 1)],
  term ((4 : Rat) / 3) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0123_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0123
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0124 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0124 : Poly :=
[
  term ((8 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0124_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0124
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0125 : Poly :=
[
  term (5 : Rat) [(10, 1)]
]

/-- Partial product 125 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0125 : Poly :=
[
  term (10 : Rat) [(2, 1), (8, 1), (10, 1)],
  term (10 : Rat) [(3, 1), (9, 1), (10, 1)],
  term (-5 : Rat) [(8, 2), (10, 1)],
  term (-5 : Rat) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0125_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0125
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0126 : Poly :=
[
  term (16 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0126 : Poly :=
[
  term (32 : Rat) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0126_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0126
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0127 : Poly :=
[
  term (8 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0127 : Poly :=
[
  term (16 : Rat) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0127_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0127
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0128 : Poly :=
[
  term (12 : Rat) [(10, 2)]
]

/-- Partial product 128 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0128 : Poly :=
[
  term (24 : Rat) [(2, 1), (8, 1), (10, 2)],
  term (24 : Rat) [(3, 1), (9, 1), (10, 2)],
  term (-12 : Rat) [(8, 2), (10, 2)],
  term (-12 : Rat) [(9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0128_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0128
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0129 : Poly :=
[
  term (12 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 129 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0129 : Poly :=
[
  term (24 : Rat) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term (24 : Rat) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term (-12 : Rat) [(8, 2), (11, 1), (13, 1)],
  term (-12 : Rat) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0129_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0129
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0130 : Poly :=
[
  term (6 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 130 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0130 : Poly :=
[
  term (12 : Rat) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term (12 : Rat) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term (-6 : Rat) [(8, 2), (11, 1), (15, 1)],
  term (-6 : Rat) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0130_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0130
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0131 : Poly :=
[
  term ((8 : Rat) / 3) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0131 : Poly :=
[
  term ((16 : Rat) / 3) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0131_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0131
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0132 : Poly :=
[
  term (36 : Rat) [(11, 2)]
]

/-- Partial product 132 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0132 : Poly :=
[
  term (72 : Rat) [(2, 1), (8, 1), (11, 2)],
  term (72 : Rat) [(3, 1), (9, 1), (11, 2)],
  term (-36 : Rat) [(8, 2), (11, 2)],
  term (-36 : Rat) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0132_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0132
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0133 : Poly :=
[
  term (8 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 133 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0133 : Poly :=
[
  term (16 : Rat) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(8, 2), (13, 1), (15, 1)],
  term (-8 : Rat) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0133_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0133
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0134 : Poly :=
[
  term ((-7 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0134 : Poly :=
[
  term ((-14 : Rat) / 3) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0134_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0134
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0135 : Poly :=
[
  term (14 : Rat) [(15, 2)]
]

/-- Partial product 135 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0135 : Poly :=
[
  term (28 : Rat) [(2, 1), (8, 1), (15, 2)],
  term (28 : Rat) [(3, 1), (9, 1), (15, 2)],
  term (-14 : Rat) [(8, 2), (15, 2)],
  term (-14 : Rat) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0135_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0135
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def rs_R002_ueqv_R002YNYN_coefficient_12_0136 : Poly :=
[
  term ((-5 : Rat) / 3) [(15, 2), (16, 1)]
]

/-- Partial product 136 for generator 12. -/
def rs_R002_ueqv_R002YNYN_partial_12_0136 : Poly :=
[
  term ((-10 : Rat) / 3) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 3) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(8, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem rs_R002_ueqv_R002YNYN_partial_12_0136_valid :
    mulPoly rs_R002_ueqv_R002YNYN_coefficient_12_0136
        rs_R002_ueqv_R002YNYN_generator_12_0100_0136 =
      rs_R002_ueqv_R002YNYN_partial_12_0136 := by
  native_decide

/-- Partial products in this block. -/
def rs_R002_ueqv_R002YNYN_partials_12_0100_0136 : List Poly :=
[
  rs_R002_ueqv_R002YNYN_partial_12_0100,
  rs_R002_ueqv_R002YNYN_partial_12_0101,
  rs_R002_ueqv_R002YNYN_partial_12_0102,
  rs_R002_ueqv_R002YNYN_partial_12_0103,
  rs_R002_ueqv_R002YNYN_partial_12_0104,
  rs_R002_ueqv_R002YNYN_partial_12_0105,
  rs_R002_ueqv_R002YNYN_partial_12_0106,
  rs_R002_ueqv_R002YNYN_partial_12_0107,
  rs_R002_ueqv_R002YNYN_partial_12_0108,
  rs_R002_ueqv_R002YNYN_partial_12_0109,
  rs_R002_ueqv_R002YNYN_partial_12_0110,
  rs_R002_ueqv_R002YNYN_partial_12_0111,
  rs_R002_ueqv_R002YNYN_partial_12_0112,
  rs_R002_ueqv_R002YNYN_partial_12_0113,
  rs_R002_ueqv_R002YNYN_partial_12_0114,
  rs_R002_ueqv_R002YNYN_partial_12_0115,
  rs_R002_ueqv_R002YNYN_partial_12_0116,
  rs_R002_ueqv_R002YNYN_partial_12_0117,
  rs_R002_ueqv_R002YNYN_partial_12_0118,
  rs_R002_ueqv_R002YNYN_partial_12_0119,
  rs_R002_ueqv_R002YNYN_partial_12_0120,
  rs_R002_ueqv_R002YNYN_partial_12_0121,
  rs_R002_ueqv_R002YNYN_partial_12_0122,
  rs_R002_ueqv_R002YNYN_partial_12_0123,
  rs_R002_ueqv_R002YNYN_partial_12_0124,
  rs_R002_ueqv_R002YNYN_partial_12_0125,
  rs_R002_ueqv_R002YNYN_partial_12_0126,
  rs_R002_ueqv_R002YNYN_partial_12_0127,
  rs_R002_ueqv_R002YNYN_partial_12_0128,
  rs_R002_ueqv_R002YNYN_partial_12_0129,
  rs_R002_ueqv_R002YNYN_partial_12_0130,
  rs_R002_ueqv_R002YNYN_partial_12_0131,
  rs_R002_ueqv_R002YNYN_partial_12_0132,
  rs_R002_ueqv_R002YNYN_partial_12_0133,
  rs_R002_ueqv_R002YNYN_partial_12_0134,
  rs_R002_ueqv_R002YNYN_partial_12_0135,
  rs_R002_ueqv_R002YNYN_partial_12_0136
]

/-- Sum of partial products in this block. -/
def rs_R002_ueqv_R002YNYN_block_12_0100_0136 : Poly :=
[
  term (144 : Rat) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term (24 : Rat) [(2, 1), (7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term (480 : Rat) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term (32 : Rat) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term (8 : Rat) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (10 : Rat) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term (-43 : Rat) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term (168 : Rat) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term (12 : Rat) [(2, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(2, 1), (7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(2, 1), (7, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(2, 1), (7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term (-8 : Rat) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (13, 1)],
  term ((8 : Rat) / 3) [(2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(2, 1), (8, 1), (10, 1)],
  term (32 : Rat) [(2, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(2, 1), (8, 1), (10, 2)],
  term (24 : Rat) [(2, 1), (8, 1), (11, 1), (13, 1)],
  term (12 : Rat) [(2, 1), (8, 1), (11, 1), (15, 1)],
  term ((16 : Rat) / 3) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(2, 1), (8, 1), (11, 2)],
  term (16 : Rat) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-14 : Rat) / 3) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(2, 1), (8, 1), (15, 2)],
  term ((-10 : Rat) / 3) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(2, 1), (8, 2)],
  term (-16 : Rat) [(2, 1), (8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term (8 : Rat) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (8, 2), (15, 2)],
  term (144 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term (24 : Rat) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term (480 : Rat) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term (32 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term (8 : Rat) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term (10 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term (-43 : Rat) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (168 : Rat) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term (12 : Rat) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term (24 : Rat) [(3, 1), (7, 2), (9, 1), (10, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(3, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (8, 1), (9, 1)],
  term (-16 : Rat) [(3, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term (8 : Rat) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (8, 1), (9, 1), (15, 2)],
  term (10 : Rat) [(3, 1), (9, 1), (10, 1)],
  term (32 : Rat) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (9, 1), (10, 2)],
  term (24 : Rat) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term (12 : Rat) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (72 : Rat) [(3, 1), (9, 1), (11, 2)],
  term (16 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-14 : Rat) / 3) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(3, 1), (9, 1), (15, 2)],
  term ((-10 : Rat) / 3) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 2), (10, 1), (13, 1)],
  term (-8 : Rat) [(3, 1), (9, 2), (10, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-8 : Rat) / 3) [(3, 1), (9, 2), (13, 1)],
  term ((8 : Rat) / 3) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term (-72 : Rat) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term (-12 : Rat) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term (-240 : Rat) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term (-16 : Rat) [(7, 1), (8, 2), (13, 1)],
  term (-4 : Rat) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term (-5 : Rat) [(7, 1), (8, 2), (15, 1)],
  term ((43 : Rat) / 2) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term (-84 : Rat) [(7, 1), (8, 2), (15, 3)],
  term (-6 : Rat) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term (-72 : Rat) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term (-12 : Rat) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term (-240 : Rat) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term (-16 : Rat) [(7, 1), (9, 2), (13, 1)],
  term (-4 : Rat) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term (-5 : Rat) [(7, 1), (9, 2), (15, 1)],
  term ((43 : Rat) / 2) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term (-84 : Rat) [(7, 1), (9, 2), (15, 3)],
  term (-6 : Rat) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term (-12 : Rat) [(7, 2), (8, 2), (10, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(7, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(8, 1), (9, 2)],
  term (8 : Rat) [(8, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term (-4 : Rat) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (9, 2), (15, 2)],
  term (-8 : Rat) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term (4 : Rat) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((16 : Rat) / 3) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(8, 2), (9, 1), (13, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(8, 2), (10, 1)],
  term (-16 : Rat) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(8, 2), (10, 2)],
  term (-12 : Rat) [(8, 2), (11, 1), (13, 1)],
  term (-6 : Rat) [(8, 2), (11, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(8, 2), (11, 2)],
  term (-8 : Rat) [(8, 2), (13, 1), (15, 1)],
  term ((7 : Rat) / 3) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(8, 2), (15, 2)],
  term ((5 : Rat) / 3) [(8, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(8, 3)],
  term (8 : Rat) [(8, 3), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(8, 3), (11, 1), (13, 1)],
  term (-4 : Rat) [(8, 3), (11, 1), (15, 1)],
  term ((4 : Rat) / 3) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(8, 3), (15, 2)],
  term (-5 : Rat) [(9, 2), (10, 1)],
  term (-16 : Rat) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(9, 2), (10, 2)],
  term (-12 : Rat) [(9, 2), (11, 1), (13, 1)],
  term (-6 : Rat) [(9, 2), (11, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(9, 2), (11, 2)],
  term (-8 : Rat) [(9, 2), (13, 1), (15, 1)],
  term ((7 : Rat) / 3) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(9, 2), (15, 2)],
  term ((5 : Rat) / 3) [(9, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(9, 3), (10, 1), (13, 1)],
  term (4 : Rat) [(9, 3), (10, 1), (15, 1)],
  term ((16 : Rat) / 3) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(9, 3), (10, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(9, 3), (13, 1)],
  term ((-4 : Rat) / 3) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 136. -/
theorem rs_R002_ueqv_R002YNYN_block_12_0100_0136_valid :
    checkProductSumEq rs_R002_ueqv_R002YNYN_partials_12_0100_0136
      rs_R002_ueqv_R002YNYN_block_12_0100_0136 = true := by
  native_decide

end R002UeqvR002YNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
