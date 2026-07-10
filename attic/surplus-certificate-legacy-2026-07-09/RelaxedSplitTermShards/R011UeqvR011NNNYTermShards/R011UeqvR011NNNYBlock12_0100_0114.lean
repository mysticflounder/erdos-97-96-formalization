/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 12:100-114

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_12_0100_0114 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0100 : Poly :=
[
  term ((-20 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0100 : Poly :=
[
  term ((40 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-40 : Rat) / 7) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 7) [(10, 1), (14, 2), (16, 1)],
  term ((20 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0100
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0101 : Poly :=
[
  term ((24 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0101 : Poly :=
[
  term ((-48 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0101
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0102 : Poly :=
[
  term ((5 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0102 : Poly :=
[
  term ((-10 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((10 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0102
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0103 : Poly :=
[
  term ((261 : Rat) / 56) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0103 : Poly :=
[
  term ((-261 : Rat) / 28) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((261 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-261 : Rat) / 28) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((261 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((261 : Rat) / 28) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((261 : Rat) / 28) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-261 : Rat) / 56) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-261 : Rat) / 56) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0103
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0104 : Poly :=
[
  term ((-24 : Rat) / 7) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0104 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0104
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0105 : Poly :=
[
  term ((-80 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0105 : Poly :=
[
  term ((160 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0105
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0106 : Poly :=
[
  term ((-16 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0106 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(11, 2), (14, 2), (16, 1)],
  term ((16 : Rat) / 7) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0106
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0107 : Poly :=
[
  term ((6 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0107 : Poly :=
[
  term ((-12 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6 : Rat) / 7) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0107
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0108 : Poly :=
[
  term ((107 : Rat) / 14) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0108 : Poly :=
[
  term ((-107 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 14) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-107 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 14) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 7) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-107 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-107 : Rat) / 14) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0108
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0109 : Poly :=
[
  term ((-24 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0109 : Poly :=
[
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((24 : Rat) / 7) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0109
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0110 : Poly :=
[
  term ((-65 : Rat) / 28) [(13, 2), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0110 : Poly :=
[
  term ((65 : Rat) / 14) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-65 : Rat) / 28) [(0, 2), (13, 2), (16, 1)],
  term ((65 : Rat) / 14) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-65 : Rat) / 28) [(1, 2), (13, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 28) [(13, 2), (14, 2), (16, 1)],
  term ((65 : Rat) / 28) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0110
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0111 : Poly :=
[
  term ((-12 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0111 : Poly :=
[
  term ((24 : Rat) / 7) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(14, 1), (15, 4), (16, 1)],
  term ((12 : Rat) / 7) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0111_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0111
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0112 : Poly :=
[
  term ((-29 : Rat) / 7) [(14, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0112 : Poly :=
[
  term ((58 : Rat) / 7) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-29 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((58 : Rat) / 7) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-29 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((-58 : Rat) / 7) [(2, 1), (14, 2), (16, 1)],
  term ((-58 : Rat) / 7) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((29 : Rat) / 7) [(14, 1), (15, 2), (16, 1)],
  term ((29 : Rat) / 7) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0112_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0112
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0113 : Poly :=
[
  term ((-65 : Rat) / 7) [(15, 2), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0113 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-130 : Rat) / 7) [(3, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(14, 2), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0113_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0113
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R011_ueqv_R011NNNY_coefficient_12_0114 : Poly :=
[
  term ((615 : Rat) / 112) [(16, 1)]
]

/-- Partial product 114 for generator 12. -/
def rs_R011_ueqv_R011NNNY_partial_12_0114 : Poly :=
[
  term ((-615 : Rat) / 56) [(0, 1), (2, 1), (16, 1)],
  term ((615 : Rat) / 112) [(0, 2), (16, 1)],
  term ((-615 : Rat) / 56) [(1, 1), (3, 1), (16, 1)],
  term ((615 : Rat) / 112) [(1, 2), (16, 1)],
  term ((615 : Rat) / 56) [(2, 1), (14, 1), (16, 1)],
  term ((615 : Rat) / 56) [(3, 1), (15, 1), (16, 1)],
  term ((-615 : Rat) / 112) [(14, 2), (16, 1)],
  term ((-615 : Rat) / 112) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R011_ueqv_R011NNNY_partial_12_0114_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_12_0114
        rs_R011_ueqv_R011NNNY_generator_12_0100_0114 =
      rs_R011_ueqv_R011NNNY_partial_12_0114 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_12_0100_0114 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_12_0100,
  rs_R011_ueqv_R011NNNY_partial_12_0101,
  rs_R011_ueqv_R011NNNY_partial_12_0102,
  rs_R011_ueqv_R011NNNY_partial_12_0103,
  rs_R011_ueqv_R011NNNY_partial_12_0104,
  rs_R011_ueqv_R011NNNY_partial_12_0105,
  rs_R011_ueqv_R011NNNY_partial_12_0106,
  rs_R011_ueqv_R011NNNY_partial_12_0107,
  rs_R011_ueqv_R011NNNY_partial_12_0108,
  rs_R011_ueqv_R011NNNY_partial_12_0109,
  rs_R011_ueqv_R011NNNY_partial_12_0110,
  rs_R011_ueqv_R011NNNY_partial_12_0111,
  rs_R011_ueqv_R011NNNY_partial_12_0112,
  rs_R011_ueqv_R011NNNY_partial_12_0113,
  rs_R011_ueqv_R011NNNY_partial_12_0114
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_12_0100_0114 : Poly :=
[
  term ((40 : Rat) / 7) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-261 : Rat) / 28) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(0, 1), (2, 1), (13, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 7) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 7) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((130 : Rat) / 7) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-615 : Rat) / 56) [(0, 1), (2, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((261 : Rat) / 56) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((6 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 14) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 28) [(0, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-29 : Rat) / 7) [(0, 2), (14, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(0, 2), (15, 2), (16, 1)],
  term ((615 : Rat) / 112) [(0, 2), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-261 : Rat) / 28) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((160 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 7) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 7) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((130 : Rat) / 7) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-615 : Rat) / 56) [(1, 1), (3, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((24 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((261 : Rat) / 56) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-80 : Rat) / 7) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)],
  term ((6 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((107 : Rat) / 14) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 28) [(1, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-29 : Rat) / 7) [(1, 2), (14, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 2), (15, 2), (16, 1)],
  term ((615 : Rat) / 112) [(1, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((261 : Rat) / 28) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((107 : Rat) / 7) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-130 : Rat) / 7) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 56) [(2, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-58 : Rat) / 7) [(2, 1), (14, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((261 : Rat) / 28) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((107 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-65 : Rat) / 14) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 7) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((615 : Rat) / 56) [(3, 1), (15, 1), (16, 1)],
  term ((-130 : Rat) / 7) [(3, 1), (15, 3), (16, 1)],
  term ((20 : Rat) / 7) [(10, 1), (14, 2), (16, 1)],
  term ((20 : Rat) / 7) [(10, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 7) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-261 : Rat) / 56) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-261 : Rat) / 56) [(11, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(11, 1), (15, 5), (16, 1)],
  term ((80 : Rat) / 7) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 7) [(11, 2), (14, 2), (16, 1)],
  term ((16 : Rat) / 7) [(11, 2), (15, 2), (16, 1)],
  term ((80 : Rat) / 7) [(11, 2), (15, 4), (16, 1)],
  term ((-6 : Rat) / 7) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-107 : Rat) / 14) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 7) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((-6 : Rat) / 7) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-107 : Rat) / 14) [(13, 1), (15, 3), (16, 1)],
  term ((24 : Rat) / 7) [(13, 1), (15, 5), (16, 1)],
  term ((65 : Rat) / 28) [(13, 2), (14, 2), (16, 1)],
  term ((65 : Rat) / 28) [(13, 2), (15, 2), (16, 1)],
  term ((29 : Rat) / 7) [(14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 7) [(14, 1), (15, 4), (16, 1)],
  term ((65 : Rat) / 7) [(14, 2), (15, 2), (16, 1)],
  term ((-615 : Rat) / 112) [(14, 2), (16, 1)],
  term ((12 : Rat) / 7) [(14, 3), (15, 2), (16, 1)],
  term ((29 : Rat) / 7) [(14, 3), (16, 1)],
  term ((-615 : Rat) / 112) [(15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 114. -/
theorem rs_R011_ueqv_R011NNNY_block_12_0100_0114_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_12_0100_0114
      rs_R011_ueqv_R011NNNY_block_12_0100_0114 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
