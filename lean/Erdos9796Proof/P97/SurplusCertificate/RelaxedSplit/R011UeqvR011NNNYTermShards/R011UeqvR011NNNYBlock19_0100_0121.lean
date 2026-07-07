/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 19:100-121

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_19_0100_0121 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0100 : Poly :=
[
  term ((17 : Rat) / 16) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0100 : Poly :=
[
  term ((-17 : Rat) / 8) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((17 : Rat) / 16) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17 : Rat) / 8) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((17 : Rat) / 16) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0100_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0100
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0101 : Poly :=
[
  term ((9 : Rat) / 7) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0101 : Poly :=
[
  term ((-18 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((9 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0101_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0101
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0102 : Poly :=
[
  term ((54 : Rat) / 7) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0102 : Poly :=
[
  term ((-108 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 7) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0102_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0102
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0103 : Poly :=
[
  term ((-38 : Rat) / 7) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0103 : Poly :=
[
  term ((76 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 7) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0103_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0103
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0104 : Poly :=
[
  term ((96 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0104 : Poly :=
[
  term ((-192 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0104_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0104
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0105 : Poly :=
[
  term ((-17 : Rat) / 7) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0105 : Poly :=
[
  term ((34 : Rat) / 7) [(0, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((34 : Rat) / 7) [(1, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0105_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0105
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0106 : Poly :=
[
  term ((-96 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 106 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0106 : Poly :=
[
  term ((192 : Rat) / 7) [(0, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0106_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0106
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0107 : Poly :=
[
  term ((-33 : Rat) / 56) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0107 : Poly :=
[
  term ((33 : Rat) / 28) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((33 : Rat) / 28) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33 : Rat) / 56) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0107_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0107
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0108 : Poly :=
[
  term ((-20 : Rat) / 7) [(10, 1), (16, 1)]
]

/-- Partial product 108 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0108 : Poly :=
[
  term ((40 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0108_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0108
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0109 : Poly :=
[
  term ((-44 : Rat) / 7) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0109 : Poly :=
[
  term ((88 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((88 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0109_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0109
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0110 : Poly :=
[
  term (3 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 110 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0110 : Poly :=
[
  term (-6 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0110_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0110
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0111 : Poly :=
[
  term ((-20 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0111 : Poly :=
[
  term ((40 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0111_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0111
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0112 : Poly :=
[
  term ((139 : Rat) / 28) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0112 : Poly :=
[
  term ((-139 : Rat) / 14) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-139 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0112_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0112
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0113 : Poly :=
[
  term ((-16 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 113 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0113 : Poly :=
[
  term ((32 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0113_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0113
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0114 : Poly :=
[
  term ((10 : Rat) / 7) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0114 : Poly :=
[
  term ((-20 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0114_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0114
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0115 : Poly :=
[
  term ((-45 : Rat) / 112) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0115 : Poly :=
[
  term ((45 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0115_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0115
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0116 : Poly :=
[
  term ((12 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 116 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0116 : Poly :=
[
  term ((-24 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0116_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0116
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0117 : Poly :=
[
  term ((-123 : Rat) / 112) [(13, 2), (16, 1)]
]

/-- Partial product 117 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0117 : Poly :=
[
  term ((123 : Rat) / 56) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((-123 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((123 : Rat) / 56) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-123 : Rat) / 112) [(1, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0117_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0117
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0118 : Poly :=
[
  term ((-18 : Rat) / 7) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0118 : Poly :=
[
  term ((36 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0118_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0118
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0119 : Poly :=
[
  term ((3 : Rat) / 28) [(14, 1), (16, 1)]
]

/-- Partial product 119 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0119 : Poly :=
[
  term ((-3 : Rat) / 14) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 28) [(0, 2), (14, 1), (16, 1)],
  term ((-3 : Rat) / 14) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 28) [(1, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0119_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0119
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0120 : Poly :=
[
  term ((-19 : Rat) / 14) [(15, 2), (16, 1)]
]

/-- Partial product 120 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0120 : Poly :=
[
  term ((19 : Rat) / 7) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((19 : Rat) / 7) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-19 : Rat) / 14) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0120_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0120
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 19. -/
def rs_R011_ueqv_R011NNNY_coefficient_19_0121 : Poly :=
[
  term ((43 : Rat) / 28) [(16, 1)]
]

/-- Partial product 121 for generator 19. -/
def rs_R011_ueqv_R011NNNY_partial_19_0121 : Poly :=
[
  term ((-43 : Rat) / 14) [(0, 1), (8, 1), (16, 1)],
  term ((43 : Rat) / 28) [(0, 2), (16, 1)],
  term ((-43 : Rat) / 14) [(1, 1), (9, 1), (16, 1)],
  term ((43 : Rat) / 28) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 19. -/
theorem rs_R011_ueqv_R011NNNY_partial_19_0121_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_19_0121
        rs_R011_ueqv_R011NNNY_generator_19_0100_0121 =
      rs_R011_ueqv_R011NNNY_partial_19_0121 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_19_0100_0121 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_19_0100,
  rs_R011_ueqv_R011NNNY_partial_19_0101,
  rs_R011_ueqv_R011NNNY_partial_19_0102,
  rs_R011_ueqv_R011NNNY_partial_19_0103,
  rs_R011_ueqv_R011NNNY_partial_19_0104,
  rs_R011_ueqv_R011NNNY_partial_19_0105,
  rs_R011_ueqv_R011NNNY_partial_19_0106,
  rs_R011_ueqv_R011NNNY_partial_19_0107,
  rs_R011_ueqv_R011NNNY_partial_19_0108,
  rs_R011_ueqv_R011NNNY_partial_19_0109,
  rs_R011_ueqv_R011NNNY_partial_19_0110,
  rs_R011_ueqv_R011NNNY_partial_19_0111,
  rs_R011_ueqv_R011NNNY_partial_19_0112,
  rs_R011_ueqv_R011NNNY_partial_19_0113,
  rs_R011_ueqv_R011NNNY_partial_19_0114,
  rs_R011_ueqv_R011NNNY_partial_19_0115,
  rs_R011_ueqv_R011NNNY_partial_19_0116,
  rs_R011_ueqv_R011NNNY_partial_19_0117,
  rs_R011_ueqv_R011NNNY_partial_19_0118,
  rs_R011_ueqv_R011NNNY_partial_19_0119,
  rs_R011_ueqv_R011NNNY_partial_19_0120,
  rs_R011_ueqv_R011NNNY_partial_19_0121
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_19_0100_0121 : Poly :=
[
  term ((-17 : Rat) / 8) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-108 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((34 : Rat) / 7) [(0, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(0, 1), (8, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((33 : Rat) / 28) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((88 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-139 : Rat) / 14) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(0, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((123 : Rat) / 56) [(0, 1), (8, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 7) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 14) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-43 : Rat) / 14) [(0, 1), (8, 1), (16, 1)],
  term ((17 : Rat) / 16) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 7) [(0, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(0, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-33 : Rat) / 56) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (10, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 28) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (11, 2), (16, 1)],
  term ((10 : Rat) / 7) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 112) [(0, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 28) [(0, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(0, 2), (15, 2), (16, 1)],
  term ((43 : Rat) / 28) [(0, 2), (16, 1)],
  term ((33 : Rat) / 28) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((88 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((40 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-139 : Rat) / 14) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45 : Rat) / 56) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 7) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((123 : Rat) / 56) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 7) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3 : Rat) / 14) [(1, 1), (9, 1), (14, 1), (16, 1)],
  term ((19 : Rat) / 7) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-43 : Rat) / 14) [(1, 1), (9, 1), (16, 1)],
  term ((-17 : Rat) / 8) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-108 : Rat) / 7) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((76 : Rat) / 7) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((34 : Rat) / 7) [(1, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((17 : Rat) / 16) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 7) [(1, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 7) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(1, 2), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-33 : Rat) / 56) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (10, 1), (16, 1)],
  term ((-44 : Rat) / 7) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 28) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(1, 2), (11, 2), (16, 1)],
  term ((10 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45 : Rat) / 112) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-123 : Rat) / 112) [(1, 2), (13, 2), (16, 1)],
  term ((-18 : Rat) / 7) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((3 : Rat) / 28) [(1, 2), (14, 1), (16, 1)],
  term ((-19 : Rat) / 14) [(1, 2), (15, 2), (16, 1)],
  term ((43 : Rat) / 28) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 100 through 121. -/
theorem rs_R011_ueqv_R011NNNY_block_19_0100_0121_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_19_0100_0121
      rs_R011_ueqv_R011NNNY_block_19_0100_0121 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
