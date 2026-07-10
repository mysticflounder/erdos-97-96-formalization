/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 2:100-124

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_02_0100_0124 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0100 : Poly :=
[
  term ((-20 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 100 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0100 : Poly :=
[
  term ((-20 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0100
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0101 : Poly :=
[
  term ((-23 : Rat) / 7) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0101 : Poly :=
[
  term ((-23 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((23 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((23 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0101
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0102 : Poly :=
[
  term ((311 : Rat) / 112) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0102 : Poly :=
[
  term ((311 : Rat) / 112) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((311 : Rat) / 112) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-311 : Rat) / 112) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-311 : Rat) / 112) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0102
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0103 : Poly :=
[
  term ((9 : Rat) / 7) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0103 : Poly :=
[
  term ((9 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0103
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0104 : Poly :=
[
  term ((54 : Rat) / 7) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0104 : Poly :=
[
  term ((54 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0104
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0105 : Poly :=
[
  term ((-38 : Rat) / 7) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0105 : Poly :=
[
  term ((-38 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0105
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0106 : Poly :=
[
  term ((96 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 106 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0106 : Poly :=
[
  term ((96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0106
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0107 : Poly :=
[
  term ((-17 : Rat) / 7) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0107 : Poly :=
[
  term ((-17 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 7) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0107
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0108 : Poly :=
[
  term ((-96 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 108 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0108 : Poly :=
[
  term ((-96 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(9, 2), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0108
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0109 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 2), (16, 1)]
]

/-- Partial product 109 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0109 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 2), (9, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 2), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (10, 2), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0109
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0110 : Poly :=
[
  term ((-33 : Rat) / 56) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0110 : Poly :=
[
  term ((-33 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 56) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 56) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 56) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0110
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0111 : Poly :=
[
  term ((12 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0111 : Poly :=
[
  term ((12 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0111_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0111
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0112 : Poly :=
[
  term ((-16 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 112 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0112 : Poly :=
[
  term ((-16 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((16 : Rat) / 7) [(10, 1), (11, 2), (16, 1)],
  term ((16 : Rat) / 7) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0112_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0112
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0113 : Poly :=
[
  term ((-44 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0113 : Poly :=
[
  term ((-44 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 7) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0113_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0113
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0114 : Poly :=
[
  term ((33 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0114 : Poly :=
[
  term ((33 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((33 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-33 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-33 : Rat) / 7) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0114_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0114
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0115 : Poly :=
[
  term ((-20 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0115 : Poly :=
[
  term ((-20 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0115_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0115
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0116 : Poly :=
[
  term ((75 : Rat) / 28) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0116 : Poly :=
[
  term ((75 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 28) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 28) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0116_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0116
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0117 : Poly :=
[
  term ((10 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0117 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0117_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0117
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0118 : Poly :=
[
  term ((-173 : Rat) / 112) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0118 : Poly :=
[
  term ((-173 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-173 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((173 : Rat) / 112) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((173 : Rat) / 112) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0118_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0118
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0119 : Poly :=
[
  term ((12 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 119 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0119 : Poly :=
[
  term ((12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0119_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0119
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0120 : Poly :=
[
  term ((-123 : Rat) / 112) [(13, 2), (16, 1)]
]

/-- Partial product 120 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0120 : Poly :=
[
  term ((-123 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((-123 : Rat) / 112) [(1, 2), (13, 2), (16, 1)],
  term ((123 : Rat) / 112) [(10, 2), (13, 2), (16, 1)],
  term ((123 : Rat) / 112) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0120_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0120
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0121 : Poly :=
[
  term ((-18 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0121 : Poly :=
[
  term ((-18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0121_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0121
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0122 : Poly :=
[
  term ((19 : Rat) / 28) [(14, 1), (16, 1)]
]

/-- Partial product 122 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0122 : Poly :=
[
  term ((19 : Rat) / 28) [(0, 2), (14, 1), (16, 1)],
  term ((19 : Rat) / 28) [(1, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 28) [(10, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 28) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0122_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0122
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0123 : Poly :=
[
  term ((-31 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 123 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0123 : Poly :=
[
  term ((-31 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((-31 : Rat) / 14) [(1, 2), (15, 2), (16, 1)],
  term ((31 : Rat) / 14) [(10, 2), (15, 2), (16, 1)],
  term ((31 : Rat) / 14) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0123_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0123
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def rs_R011_ueqv_R011NNNY_coefficient_02_0124 : Poly :=
[
  term ((51 : Rat) / 28) [(16, 1)]
]

/-- Partial product 124 for generator 2. -/
def rs_R011_ueqv_R011NNNY_partial_02_0124 : Poly :=
[
  term ((51 : Rat) / 28) [(0, 2), (16, 1)],
  term ((51 : Rat) / 28) [(1, 2), (16, 1)],
  term ((-51 : Rat) / 28) [(10, 2), (16, 1)],
  term ((-51 : Rat) / 28) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem rs_R011_ueqv_R011NNNY_partial_02_0124_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_02_0124
        rs_R011_ueqv_R011NNNY_generator_02_0100_0124 =
      rs_R011_ueqv_R011NNNY_partial_02_0124 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_02_0100_0124 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_02_0100,
  rs_R011_ueqv_R011NNNY_partial_02_0101,
  rs_R011_ueqv_R011NNNY_partial_02_0102,
  rs_R011_ueqv_R011NNNY_partial_02_0103,
  rs_R011_ueqv_R011NNNY_partial_02_0104,
  rs_R011_ueqv_R011NNNY_partial_02_0105,
  rs_R011_ueqv_R011NNNY_partial_02_0106,
  rs_R011_ueqv_R011NNNY_partial_02_0107,
  rs_R011_ueqv_R011NNNY_partial_02_0108,
  rs_R011_ueqv_R011NNNY_partial_02_0109,
  rs_R011_ueqv_R011NNNY_partial_02_0110,
  rs_R011_ueqv_R011NNNY_partial_02_0111,
  rs_R011_ueqv_R011NNNY_partial_02_0112,
  rs_R011_ueqv_R011NNNY_partial_02_0113,
  rs_R011_ueqv_R011NNNY_partial_02_0114,
  rs_R011_ueqv_R011NNNY_partial_02_0115,
  rs_R011_ueqv_R011NNNY_partial_02_0116,
  rs_R011_ueqv_R011NNNY_partial_02_0117,
  rs_R011_ueqv_R011NNNY_partial_02_0118,
  rs_R011_ueqv_R011NNNY_partial_02_0119,
  rs_R011_ueqv_R011NNNY_partial_02_0120,
  rs_R011_ueqv_R011NNNY_partial_02_0121,
  rs_R011_ueqv_R011NNNY_partial_02_0122,
  rs_R011_ueqv_R011NNNY_partial_02_0123,
  rs_R011_ueqv_R011NNNY_partial_02_0124
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_02_0100_0124 : Poly :=
[
  term ((-20 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 112) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 2), (16, 1)],
  term ((-33 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((33 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-173 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 28) [(0, 2), (14, 1), (16, 1)],
  term ((-31 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((51 : Rat) / 28) [(0, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((311 : Rat) / 112) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 2), (16, 1)],
  term ((-33 : Rat) / 56) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((33 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((75 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-173 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 112) [(1, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((19 : Rat) / 28) [(1, 2), (14, 1), (16, 1)],
  term ((-31 : Rat) / 14) [(1, 2), (15, 2), (16, 1)],
  term ((51 : Rat) / 28) [(1, 2), (16, 1)],
  term ((20 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((23 : Rat) / 7) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 112) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((20 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((23 : Rat) / 7) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-311 : Rat) / 112) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-9 : Rat) / 7) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((38 : Rat) / 7) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((17 : Rat) / 7) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(9, 2), (10, 2), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (10, 2), (16, 1)],
  term ((17 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 2), (11, 2), (16, 1)],
  term ((33 : Rat) / 56) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(10, 1), (11, 2), (16, 1)],
  term ((44 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 7) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 28) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((173 : Rat) / 112) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((123 : Rat) / 112) [(10, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 28) [(10, 2), (14, 1), (16, 1)],
  term ((31 : Rat) / 14) [(10, 2), (15, 2), (16, 1)],
  term ((-51 : Rat) / 28) [(10, 2), (16, 1)],
  term ((33 : Rat) / 56) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 3), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(10, 3), (16, 1)],
  term ((-10 : Rat) / 7) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((173 : Rat) / 112) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((123 : Rat) / 112) [(11, 2), (13, 2), (16, 1)],
  term ((18 : Rat) / 7) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 28) [(11, 2), (14, 1), (16, 1)],
  term ((31 : Rat) / 14) [(11, 2), (15, 2), (16, 1)],
  term ((-51 : Rat) / 28) [(11, 2), (16, 1)],
  term ((44 : Rat) / 7) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-33 : Rat) / 7) [(11, 3), (13, 1), (16, 1)],
  term ((20 : Rat) / 7) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-75 : Rat) / 28) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 124. -/
theorem rs_R011_ueqv_R011NNNY_block_02_0100_0124_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_02_0100_0124
      rs_R011_ueqv_R011NNNY_block_02_0100_0124 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
