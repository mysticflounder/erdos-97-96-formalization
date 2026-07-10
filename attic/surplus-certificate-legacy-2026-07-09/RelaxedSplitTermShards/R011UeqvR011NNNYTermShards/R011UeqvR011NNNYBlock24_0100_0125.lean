/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 24:100-125

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_24_0100_0125 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0100 : Poly :=
[
  term ((-100 : Rat) / 7) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0100 : Poly :=
[
  term ((200 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((200 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-200 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-200 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0100
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0101 : Poly :=
[
  term ((-215 : Rat) / 28) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0101 : Poly :=
[
  term ((215 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-215 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((215 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-215 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-215 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-215 : Rat) / 14) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((215 : Rat) / 28) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((215 : Rat) / 28) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0101
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0102 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0102 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0102
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0103 : Poly :=
[
  term ((-72 : Rat) / 7) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0103 : Poly :=
[
  term ((144 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 7) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0103
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0104 : Poly :=
[
  term ((647 : Rat) / 56) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0104 : Poly :=
[
  term ((-647 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 56) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 56) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 28) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 28) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 56) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-647 : Rat) / 56) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0104
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0105 : Poly :=
[
  term ((-24 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0105 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0105
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0106 : Poly :=
[
  term ((64 : Rat) / 7) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0106 : Poly :=
[
  term ((-128 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0106
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0107 : Poly :=
[
  term ((68 : Rat) / 7) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0107 : Poly :=
[
  term ((-136 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0107
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0108 : Poly :=
[
  term ((384 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 108 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0108 : Poly :=
[
  term ((-768 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(9, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0108
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0109 : Poly :=
[
  term ((172 : Rat) / 7) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0109 : Poly :=
[
  term ((-344 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((172 : Rat) / 7) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-344 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((172 : Rat) / 7) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((344 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-172 : Rat) / 7) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-172 : Rat) / 7) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0109
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0110 : Poly :=
[
  term ((-57 : Rat) / 28) [(9, 2), (16, 1)]
]

/-- Partial product 110 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0110 : Poly :=
[
  term ((57 : Rat) / 14) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((-57 : Rat) / 28) [(0, 2), (9, 2), (16, 1)],
  term ((57 : Rat) / 14) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-57 : Rat) / 28) [(1, 2), (9, 2), (16, 1)],
  term ((-57 : Rat) / 14) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-57 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((57 : Rat) / 28) [(9, 2), (12, 2), (16, 1)],
  term ((57 : Rat) / 28) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0110
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0111 : Poly :=
[
  term ((-68 : Rat) / 7) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0111 : Poly :=
[
  term ((136 : Rat) / 7) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(0, 2), (9, 3), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 2), (9, 3), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0111_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0111
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0112 : Poly :=
[
  term ((-384 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

/-- Partial product 112 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0112 : Poly :=
[
  term ((768 : Rat) / 7) [(0, 1), (9, 3), (10, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 2), (9, 3), (15, 3), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (9, 3), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(9, 3), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (12, 2), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0112_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0112
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0113 : Poly :=
[
  term ((5 : Rat) / 7) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0113 : Poly :=
[
  term ((-10 : Rat) / 7) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0113_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0113
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0114 : Poly :=
[
  term ((-64 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0114 : Poly :=
[
  term ((128 : Rat) / 7) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128 : Rat) / 7) [(10, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0114_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0114
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0115 : Poly :=
[
  term ((34 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 115 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0115 : Poly :=
[
  term ((-68 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((34 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((34 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((68 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34 : Rat) / 7) [(10, 1), (12, 2), (16, 1)],
  term ((-34 : Rat) / 7) [(10, 1), (13, 2), (16, 1)],
  term ((68 : Rat) / 7) [(10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0115_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0115
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0116 : Poly :=
[
  term ((80 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0116 : Poly :=
[
  term ((-160 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0116_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0116
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0117 : Poly :=
[
  term ((-8 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0117 : Poly :=
[
  term ((16 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((8 : Rat) / 7) [(11, 1), (13, 3), (16, 1)],
  term ((-16 : Rat) / 7) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0117_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0117
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0118 : Poly :=
[
  term ((-6 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0118 : Poly :=
[
  term ((12 : Rat) / 7) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0118_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0118
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0119 : Poly :=
[
  term ((-185 : Rat) / 28) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0119 : Poly :=
[
  term ((185 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 14) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((185 : Rat) / 28) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 28) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0119_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0119
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0120 : Poly :=
[
  term ((24 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 120 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0120 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0120_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0120
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0121 : Poly :=
[
  term ((53 : Rat) / 14) [(13, 2), (16, 1)]
]

/-- Partial product 121 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0121 : Poly :=
[
  term ((-53 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((53 : Rat) / 14) [(0, 2), (13, 2), (16, 1)],
  term ((-53 : Rat) / 7) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((53 : Rat) / 14) [(1, 2), (13, 2), (16, 1)],
  term ((53 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((53 : Rat) / 7) [(11, 1), (13, 3), (16, 1)],
  term ((-53 : Rat) / 14) [(12, 2), (13, 2), (16, 1)],
  term ((-53 : Rat) / 14) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0121_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0121
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0122 : Poly :=
[
  term ((12 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0122 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0122_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0122
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0123 : Poly :=
[
  term ((3 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 123 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0123 : Poly :=
[
  term (-3 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term (3 : Rat) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(12, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0123_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0123
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0124 : Poly :=
[
  term ((46 : Rat) / 7) [(15, 2), (16, 1)]
]

/-- Partial product 124 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0124 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((46 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((46 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((92 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((92 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46 : Rat) / 7) [(12, 2), (15, 2), (16, 1)],
  term ((-46 : Rat) / 7) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0124_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0124
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 24. -/
def rs_R011_ueqv_R011NNNY_coefficient_24_0125 : Poly :=
[
  term ((-207 : Rat) / 56) [(16, 1)]
]

/-- Partial product 125 for generator 24. -/
def rs_R011_ueqv_R011NNNY_partial_24_0125 : Poly :=
[
  term ((207 : Rat) / 28) [(0, 1), (10, 1), (16, 1)],
  term ((-207 : Rat) / 56) [(0, 2), (16, 1)],
  term ((207 : Rat) / 28) [(1, 1), (11, 1), (16, 1)],
  term ((-207 : Rat) / 56) [(1, 2), (16, 1)],
  term ((-207 : Rat) / 28) [(10, 1), (12, 1), (16, 1)],
  term ((-207 : Rat) / 28) [(11, 1), (13, 1), (16, 1)],
  term ((207 : Rat) / 56) [(12, 2), (16, 1)],
  term ((207 : Rat) / 56) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 24. -/
theorem rs_R011_ueqv_R011NNNY_partial_24_0125_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_24_0125
        rs_R011_ueqv_R011NNNY_generator_24_0100_0125 =
      rs_R011_ueqv_R011NNNY_partial_24_0125 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_24_0100_0125 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_24_0100,
  rs_R011_ueqv_R011NNNY_partial_24_0101,
  rs_R011_ueqv_R011NNNY_partial_24_0102,
  rs_R011_ueqv_R011NNNY_partial_24_0103,
  rs_R011_ueqv_R011NNNY_partial_24_0104,
  rs_R011_ueqv_R011NNNY_partial_24_0105,
  rs_R011_ueqv_R011NNNY_partial_24_0106,
  rs_R011_ueqv_R011NNNY_partial_24_0107,
  rs_R011_ueqv_R011NNNY_partial_24_0108,
  rs_R011_ueqv_R011NNNY_partial_24_0109,
  rs_R011_ueqv_R011NNNY_partial_24_0110,
  rs_R011_ueqv_R011NNNY_partial_24_0111,
  rs_R011_ueqv_R011NNNY_partial_24_0112,
  rs_R011_ueqv_R011NNNY_partial_24_0113,
  rs_R011_ueqv_R011NNNY_partial_24_0114,
  rs_R011_ueqv_R011NNNY_partial_24_0115,
  rs_R011_ueqv_R011NNNY_partial_24_0116,
  rs_R011_ueqv_R011NNNY_partial_24_0117,
  rs_R011_ueqv_R011NNNY_partial_24_0118,
  rs_R011_ueqv_R011NNNY_partial_24_0119,
  rs_R011_ueqv_R011NNNY_partial_24_0120,
  rs_R011_ueqv_R011NNNY_partial_24_0121,
  rs_R011_ueqv_R011NNNY_partial_24_0122,
  rs_R011_ueqv_R011NNNY_partial_24_0123,
  rs_R011_ueqv_R011NNNY_partial_24_0124,
  rs_R011_ueqv_R011NNNY_partial_24_0125
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_24_0100_0125 : Poly :=
[
  term ((200 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((215 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 28) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-128 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-136 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-344 : Rat) / 7) [(0, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((57 : Rat) / 14) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term ((136 : Rat) / 7) [(0, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(0, 1), (9, 3), (10, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 14) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-53 : Rat) / 7) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((207 : Rat) / 28) [(0, 1), (10, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(0, 1), (10, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 56) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((172 : Rat) / 7) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-57 : Rat) / 28) [(0, 2), (9, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(0, 2), (9, 3), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(0, 2), (9, 3), (15, 3), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((80 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((53 : Rat) / 14) [(0, 2), (13, 2), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((-207 : Rat) / 56) [(0, 2), (16, 1)],
  term ((200 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((215 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 28) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-136 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-344 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((57 : Rat) / 14) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(1, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(1, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(1, 1), (9, 3), (11, 1), (15, 3), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 14) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-53 : Rat) / 7) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((207 : Rat) / 28) [(1, 1), (11, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-100 : Rat) / 7) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 56) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((172 : Rat) / 7) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((-57 : Rat) / 28) [(1, 2), (9, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(1, 2), (9, 3), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 2), (9, 3), (15, 3), (16, 1)],
  term ((5 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((80 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 28) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((53 : Rat) / 14) [(1, 2), (13, 2), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((46 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((-207 : Rat) / 56) [(1, 2), (16, 1)],
  term ((-200 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 28) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-144 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((647 : Rat) / 28) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-200 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-215 : Rat) / 14) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((215 : Rat) / 28) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 56) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((72 : Rat) / 7) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-647 : Rat) / 56) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((100 : Rat) / 7) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((215 : Rat) / 28) [(9, 1), (13, 3), (16, 1)],
  term ((24 : Rat) / 7) [(9, 1), (13, 4), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((136 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((344 : Rat) / 7) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-57 : Rat) / 14) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((344 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((128 : Rat) / 7) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-68 : Rat) / 7) [(9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-172 : Rat) / 7) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((57 : Rat) / 28) [(9, 2), (12, 2), (16, 1)],
  term ((-172 : Rat) / 7) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((57 : Rat) / 28) [(9, 2), (13, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(9, 2), (13, 3), (15, 3), (16, 1)],
  term ((-136 : Rat) / 7) [(9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(9, 3), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-136 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (12, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (12, 2), (15, 3), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (13, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (13, 2), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((68 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 14) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((53 : Rat) / 7) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 7) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((92 : Rat) / 7) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-207 : Rat) / 28) [(10, 1), (12, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-34 : Rat) / 7) [(10, 1), (12, 2), (16, 1)],
  term ((64 : Rat) / 7) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-34 : Rat) / 7) [(10, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((68 : Rat) / 7) [(10, 2), (12, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((92 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-207 : Rat) / 28) [(11, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-185 : Rat) / 14) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((61 : Rat) / 7) [(11, 1), (13, 3), (16, 1)],
  term ((160 : Rat) / 7) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(11, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 28) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-53 : Rat) / 14) [(12, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(12, 2), (14, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(12, 2), (15, 2), (16, 1)],
  term ((207 : Rat) / 56) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(13, 2), (14, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(13, 2), (15, 2), (16, 1)],
  term ((207 : Rat) / 56) [(13, 2), (16, 1)],
  term ((6 : Rat) / 7) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((185 : Rat) / 28) [(13, 3), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(13, 3), (15, 3), (16, 1)],
  term ((-53 : Rat) / 14) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 100 through 125. -/
theorem rs_R011_ueqv_R011NNNY_block_24_0100_0125_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_24_0100_0125
      rs_R011_ueqv_R011NNNY_block_24_0100_0125 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
