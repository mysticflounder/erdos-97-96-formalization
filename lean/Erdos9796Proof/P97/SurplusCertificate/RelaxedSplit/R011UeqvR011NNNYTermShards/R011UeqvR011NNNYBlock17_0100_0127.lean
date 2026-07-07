/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 17:100-127

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_17_0100_0127 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0100 : Poly :=
[
  term ((64 : Rat) / 7) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0100 : Poly :=
[
  term ((128 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0100
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0101 : Poly :=
[
  term ((12 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 101 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0101 : Poly :=
[
  term ((24 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0101
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0102 : Poly :=
[
  term ((-244 : Rat) / 7) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0102 : Poly :=
[
  term ((-488 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((244 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-488 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((244 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0102
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0103 : Poly :=
[
  term ((25 : Rat) / 7) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0103 : Poly :=
[
  term ((50 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-25 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((50 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-25 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0103
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0104 : Poly :=
[
  term ((-12 : Rat) / 7) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0104 : Poly :=
[
  term ((-24 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0104
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0105 : Poly :=
[
  term ((-247 : Rat) / 56) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0105 : Poly :=
[
  term ((-247 : Rat) / 28) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 56) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 28) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 56) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0105
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0106 : Poly :=
[
  term ((24 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 106 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0106 : Poly :=
[
  term ((48 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0106
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0107 : Poly :=
[
  term ((8 : Rat) / 7) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 107 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0107 : Poly :=
[
  term ((16 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(2, 2), (9, 2), (10, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0107
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0108 : Poly :=
[
  term ((-68 : Rat) / 7) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0108 : Poly :=
[
  term ((-136 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0108
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0109 : Poly :=
[
  term ((-384 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 109 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0109 : Poly :=
[
  term ((-768 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(2, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(3, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0109
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0110 : Poly :=
[
  term ((80 : Rat) / 7) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0110 : Poly :=
[
  term ((160 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0110
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0111 : Poly :=
[
  term ((384 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 111 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0111 : Poly :=
[
  term ((768 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(2, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 2), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0111_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0111
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0112 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0112 : Poly :=
[
  term ((-48 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0112_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0112
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0113 : Poly :=
[
  term ((72 : Rat) / 7) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0113 : Poly :=
[
  term ((144 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0113_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0113
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0114 : Poly :=
[
  term ((10 : Rat) / 7) [(9, 2), (16, 1)]
]

/-- Partial product 114 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0114 : Poly :=
[
  term ((20 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(2, 2), (9, 2), (16, 1)],
  term ((20 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(3, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0114_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0114
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0115 : Poly :=
[
  term ((-30 : Rat) / 7) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0115 : Poly :=
[
  term ((-60 : Rat) / 7) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0115_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0115
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0116 : Poly :=
[
  term (1 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0116 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0116_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0116
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0117 : Poly :=
[
  term ((32 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 117 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0117 : Poly :=
[
  term ((64 : Rat) / 7) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(2, 2), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0117_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0117
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0118 : Poly :=
[
  term ((104 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0118 : Poly :=
[
  term ((208 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0118_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0118
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0119 : Poly :=
[
  term ((-15 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0119 : Poly :=
[
  term ((-30 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((15 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((15 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0119_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0119
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0120 : Poly :=
[
  term ((225 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0120 : Poly :=
[
  term ((225 : Rat) / 28) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-225 : Rat) / 56) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((225 : Rat) / 28) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-225 : Rat) / 56) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0120_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0120
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0121 : Poly :=
[
  term ((-24 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 121 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0121 : Poly :=
[
  term ((-48 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0121_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0121
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0122 : Poly :=
[
  term ((-80 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0122 : Poly :=
[
  term ((-160 : Rat) / 7) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0122_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0122
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0123 : Poly :=
[
  term ((8 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 123 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0123 : Poly :=
[
  term ((16 : Rat) / 7) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(2, 2), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0123_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0123
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0124 : Poly :=
[
  term ((53 : Rat) / 28) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0124 : Poly :=
[
  term ((53 : Rat) / 14) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53 : Rat) / 28) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((53 : Rat) / 14) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53 : Rat) / 28) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0124_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0124
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0125 : Poly :=
[
  term ((41 : Rat) / 28) [(13, 2), (16, 1)]
]

/-- Partial product 125 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0125 : Poly :=
[
  term ((41 : Rat) / 14) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 28) [(2, 2), (13, 2), (16, 1)],
  term ((41 : Rat) / 14) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-41 : Rat) / 28) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0125_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0125
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0126 : Poly :=
[
  term ((-6 : Rat) / 7) [(14, 1), (16, 1)]
]

/-- Partial product 126 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0126 : Poly :=
[
  term ((-12 : Rat) / 7) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(2, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((6 : Rat) / 7) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0126_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0126
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 17. -/
def rs_R011_ueqv_R011NNNY_coefficient_17_0127 : Poly :=
[
  term ((-5 : Rat) / 2) [(16, 1)]
]

/-- Partial product 127 for generator 17. -/
def rs_R011_ueqv_R011NNNY_partial_17_0127 : Poly :=
[
  term (-5 : Rat) [(2, 1), (6, 1), (16, 1)],
  term ((5 : Rat) / 2) [(2, 2), (16, 1)],
  term (-5 : Rat) [(3, 1), (7, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 17. -/
theorem rs_R011_ueqv_R011NNNY_partial_17_0127_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_17_0127
        rs_R011_ueqv_R011NNNY_generator_17_0100_0127 =
      rs_R011_ueqv_R011NNNY_partial_17_0127 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_17_0100_0127 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_17_0100,
  rs_R011_ueqv_R011NNNY_partial_17_0101,
  rs_R011_ueqv_R011NNNY_partial_17_0102,
  rs_R011_ueqv_R011NNNY_partial_17_0103,
  rs_R011_ueqv_R011NNNY_partial_17_0104,
  rs_R011_ueqv_R011NNNY_partial_17_0105,
  rs_R011_ueqv_R011NNNY_partial_17_0106,
  rs_R011_ueqv_R011NNNY_partial_17_0107,
  rs_R011_ueqv_R011NNNY_partial_17_0108,
  rs_R011_ueqv_R011NNNY_partial_17_0109,
  rs_R011_ueqv_R011NNNY_partial_17_0110,
  rs_R011_ueqv_R011NNNY_partial_17_0111,
  rs_R011_ueqv_R011NNNY_partial_17_0112,
  rs_R011_ueqv_R011NNNY_partial_17_0113,
  rs_R011_ueqv_R011NNNY_partial_17_0114,
  rs_R011_ueqv_R011NNNY_partial_17_0115,
  rs_R011_ueqv_R011NNNY_partial_17_0116,
  rs_R011_ueqv_R011NNNY_partial_17_0117,
  rs_R011_ueqv_R011NNNY_partial_17_0118,
  rs_R011_ueqv_R011NNNY_partial_17_0119,
  rs_R011_ueqv_R011NNNY_partial_17_0120,
  rs_R011_ueqv_R011NNNY_partial_17_0121,
  rs_R011_ueqv_R011NNNY_partial_17_0122,
  rs_R011_ueqv_R011NNNY_partial_17_0123,
  rs_R011_ueqv_R011NNNY_partial_17_0124,
  rs_R011_ueqv_R011NNNY_partial_17_0125,
  rs_R011_ueqv_R011NNNY_partial_17_0126,
  rs_R011_ueqv_R011NNNY_partial_17_0127
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_17_0100_0127 : Poly :=
[
  term ((128 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-488 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((50 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247 : Rat) / 28) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(2, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(2, 1), (6, 1), (10, 1), (16, 1)],
  term ((208 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((225 : Rat) / 28) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(2, 1), (6, 1), (11, 2), (16, 1)],
  term ((53 : Rat) / 14) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(2, 1), (6, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(2, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((244 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25 : Rat) / 7) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 56) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 7) [(2, 2), (9, 2), (10, 1), (16, 1)],
  term ((68 : Rat) / 7) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(2, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(2, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (9, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(2, 2), (9, 2), (16, 1)],
  term ((30 : Rat) / 7) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(2, 2), (10, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15 : Rat) / 7) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-225 : Rat) / 56) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(2, 2), (11, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 28) [(2, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(2, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(2, 2), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-488 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((50 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247 : Rat) / 28) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(3, 1), (7, 1), (9, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((208 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((225 : Rat) / 28) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((53 : Rat) / 14) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 14) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(3, 1), (7, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((244 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25 : Rat) / 7) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 56) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 2), (9, 2), (10, 1), (16, 1)],
  term ((68 : Rat) / 7) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(3, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (9, 2), (14, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(3, 2), (9, 2), (16, 1)],
  term ((30 : Rat) / 7) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 2), (10, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((15 : Rat) / 7) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-225 : Rat) / 56) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 2), (11, 2), (16, 1)],
  term ((-53 : Rat) / 28) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 28) [(3, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(3, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 2) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 127. -/
theorem rs_R011_ueqv_R011NNNY_block_17_0100_0127_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_17_0100_0127
      rs_R011_ueqv_R011NNNY_block_17_0100_0127 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
