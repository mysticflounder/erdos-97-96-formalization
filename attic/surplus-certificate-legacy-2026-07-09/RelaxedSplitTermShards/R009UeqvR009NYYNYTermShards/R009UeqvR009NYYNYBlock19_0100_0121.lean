/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 19:100-121

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0100 : Poly :=
[
  term (-160 : Rat) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 100 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0100 : Poly :=
[
  term (-320 : Rat) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (-320 : Rat) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0100
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0101 : Poly :=
[
  term ((268 : Rat) / 3) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 101 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0101 : Poly :=
[
  term ((536 : Rat) / 3) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-268 : Rat) / 3) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((536 : Rat) / 3) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-268 : Rat) / 3) [(5, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0101
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0102 : Poly :=
[
  term (-3 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0102 : Poly :=
[
  term (-6 : Rat) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0102
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0103 : Poly :=
[
  term (177 : Rat) [(10, 1), (11, 2)]
]

/-- Partial product 103 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0103 : Poly :=
[
  term (354 : Rat) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term (-177 : Rat) [(4, 2), (10, 1), (11, 2)],
  term (354 : Rat) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term (-177 : Rat) [(5, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0103
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0104 : Poly :=
[
  term (80 : Rat) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 104 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0104 : Poly :=
[
  term (160 : Rat) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (160 : Rat) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-80 : Rat) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0104
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0105 : Poly :=
[
  term ((-170 : Rat) / 3) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 105 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0105 : Poly :=
[
  term ((-340 : Rat) / 3) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 3) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 3) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 3) [(5, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0105
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0106 : Poly :=
[
  term (6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0106 : Poly :=
[
  term (12 : Rat) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0106
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0107 : Poly :=
[
  term (45 : Rat) [(10, 1), (13, 2)]
]

/-- Partial product 107 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0107 : Poly :=
[
  term (90 : Rat) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term (-45 : Rat) [(4, 2), (10, 1), (13, 2)],
  term (90 : Rat) [(5, 1), (9, 1), (10, 1), (13, 2)],
  term (-45 : Rat) [(5, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0107
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0108 : Poly :=
[
  term (42 : Rat) [(10, 2), (11, 1), (13, 1)]
]

/-- Partial product 108 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0108 : Poly :=
[
  term (84 : Rat) [(4, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term (-42 : Rat) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term (84 : Rat) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term (-42 : Rat) [(5, 2), (10, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0108
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0109 : Poly :=
[
  term (-24 : Rat) [(10, 2), (11, 1), (15, 1)]
]

/-- Partial product 109 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0109 : Poly :=
[
  term (-48 : Rat) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term (24 : Rat) [(4, 2), (10, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term (24 : Rat) [(5, 2), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0109
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0110 : Poly :=
[
  term (-36 : Rat) [(10, 2), (11, 2)]
]

/-- Partial product 110 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0110 : Poly :=
[
  term (-72 : Rat) [(4, 1), (8, 1), (10, 2), (11, 2)],
  term (36 : Rat) [(4, 2), (10, 2), (11, 2)],
  term (-72 : Rat) [(5, 1), (9, 1), (10, 2), (11, 2)],
  term (36 : Rat) [(5, 2), (10, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0110
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0111 : Poly :=
[
  term (12 : Rat) [(10, 2), (13, 1), (15, 1)]
]

/-- Partial product 111 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0111 : Poly :=
[
  term (24 : Rat) [(4, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(4, 2), (10, 2), (13, 1), (15, 1)],
  term (24 : Rat) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(5, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0111
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0112 : Poly :=
[
  term (-12 : Rat) [(10, 2), (13, 2)]
]

/-- Partial product 112 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0112 : Poly :=
[
  term (-24 : Rat) [(4, 1), (8, 1), (10, 2), (13, 2)],
  term (12 : Rat) [(4, 2), (10, 2), (13, 2)],
  term (-24 : Rat) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term (12 : Rat) [(5, 2), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0112
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0113 : Poly :=
[
  term (27 : Rat) [(11, 1), (13, 1)]
]

/-- Partial product 113 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0113 : Poly :=
[
  term (54 : Rat) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term (-27 : Rat) [(4, 2), (11, 1), (13, 1)],
  term (54 : Rat) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term (-27 : Rat) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0113
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0114 : Poly :=
[
  term (40 : Rat) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 114 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0114 : Poly :=
[
  term (80 : Rat) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term (80 : Rat) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(5, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0114
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0115 : Poly :=
[
  term ((-89 : Rat) / 6) [(11, 1), (15, 1)]
]

/-- Partial product 115 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0115 : Poly :=
[
  term ((-89 : Rat) / 3) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((89 : Rat) / 6) [(4, 2), (11, 1), (15, 1)],
  term ((-89 : Rat) / 3) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((89 : Rat) / 6) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0115
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0116 : Poly :=
[
  term ((-3 : Rat) / 4) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0116 : Poly :=
[
  term ((-3 : Rat) / 2) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 4) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0116
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0117 : Poly :=
[
  term (-42 : Rat) [(11, 2)]
]

/-- Partial product 117 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0117 : Poly :=
[
  term (-84 : Rat) [(4, 1), (8, 1), (11, 2)],
  term (42 : Rat) [(4, 2), (11, 2)],
  term (-84 : Rat) [(5, 1), (9, 1), (11, 2)],
  term (42 : Rat) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0117
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0118 : Poly :=
[
  term ((-1 : Rat) / 12) [(13, 1), (15, 1)]
]

/-- Partial product 118 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0118 : Poly :=
[
  term ((-1 : Rat) / 6) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 12) [(4, 2), (13, 1), (15, 1)],
  term ((-1 : Rat) / 6) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((1 : Rat) / 12) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0118
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0119 : Poly :=
[
  term ((-57 : Rat) / 8) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0119 : Poly :=
[
  term ((-57 : Rat) / 4) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-57 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((57 : Rat) / 8) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0119
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0120 : Poly :=
[
  term ((43 : Rat) / 3) [(13, 2)]
]

/-- Partial product 120 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0120 : Poly :=
[
  term ((86 : Rat) / 3) [(4, 1), (8, 1), (13, 2)],
  term ((-43 : Rat) / 3) [(4, 2), (13, 2)],
  term ((86 : Rat) / 3) [(5, 1), (9, 1), (13, 2)],
  term ((-43 : Rat) / 3) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0120
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYYNY_coefficient_19_0121 : Poly :=
[
  term ((-16 : Rat) / 3) [(15, 2)]
]

/-- Partial product 121 for generator 19. -/
def rs_R009_ueqv_R009NYYNY_partial_19_0121 : Poly :=
[
  term ((-32 : Rat) / 3) [(4, 1), (8, 1), (15, 2)],
  term ((16 : Rat) / 3) [(4, 2), (15, 2)],
  term ((-32 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term ((16 : Rat) / 3) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 19. -/
theorem rs_R009_ueqv_R009NYYNY_partial_19_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_19_0121
        rs_R009_ueqv_R009NYYNY_generator_19_0100_0121 =
      rs_R009_ueqv_R009NYYNY_partial_19_0121 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_19_0100_0121 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_19_0100,
  rs_R009_ueqv_R009NYYNY_partial_19_0101,
  rs_R009_ueqv_R009NYYNY_partial_19_0102,
  rs_R009_ueqv_R009NYYNY_partial_19_0103,
  rs_R009_ueqv_R009NYYNY_partial_19_0104,
  rs_R009_ueqv_R009NYYNY_partial_19_0105,
  rs_R009_ueqv_R009NYYNY_partial_19_0106,
  rs_R009_ueqv_R009NYYNY_partial_19_0107,
  rs_R009_ueqv_R009NYYNY_partial_19_0108,
  rs_R009_ueqv_R009NYYNY_partial_19_0109,
  rs_R009_ueqv_R009NYYNY_partial_19_0110,
  rs_R009_ueqv_R009NYYNY_partial_19_0111,
  rs_R009_ueqv_R009NYYNY_partial_19_0112,
  rs_R009_ueqv_R009NYYNY_partial_19_0113,
  rs_R009_ueqv_R009NYYNY_partial_19_0114,
  rs_R009_ueqv_R009NYYNY_partial_19_0115,
  rs_R009_ueqv_R009NYYNY_partial_19_0116,
  rs_R009_ueqv_R009NYYNY_partial_19_0117,
  rs_R009_ueqv_R009NYYNY_partial_19_0118,
  rs_R009_ueqv_R009NYYNY_partial_19_0119,
  rs_R009_ueqv_R009NYYNY_partial_19_0120,
  rs_R009_ueqv_R009NYYNY_partial_19_0121
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_19_0100_0121 : Poly :=
[
  term (-320 : Rat) [(4, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((536 : Rat) / 3) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term (-6 : Rat) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (354 : Rat) [(4, 1), (8, 1), (10, 1), (11, 2)],
  term (160 : Rat) [(4, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-340 : Rat) / 3) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term (12 : Rat) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (90 : Rat) [(4, 1), (8, 1), (10, 1), (13, 2)],
  term (84 : Rat) [(4, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term (-48 : Rat) [(4, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term (-72 : Rat) [(4, 1), (8, 1), (10, 2), (11, 2)],
  term (24 : Rat) [(4, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term (-24 : Rat) [(4, 1), (8, 1), (10, 2), (13, 2)],
  term (54 : Rat) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term (80 : Rat) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 3) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(4, 1), (8, 1), (11, 2)],
  term ((-1 : Rat) / 6) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-57 : Rat) / 4) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((86 : Rat) / 3) [(4, 1), (8, 1), (13, 2)],
  term ((-32 : Rat) / 3) [(4, 1), (8, 1), (15, 2)],
  term (160 : Rat) [(4, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-268 : Rat) / 3) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term (3 : Rat) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-177 : Rat) [(4, 2), (10, 1), (11, 2)],
  term (-80 : Rat) [(4, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((170 : Rat) / 3) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-45 : Rat) [(4, 2), (10, 1), (13, 2)],
  term (-42 : Rat) [(4, 2), (10, 2), (11, 1), (13, 1)],
  term (24 : Rat) [(4, 2), (10, 2), (11, 1), (15, 1)],
  term (36 : Rat) [(4, 2), (10, 2), (11, 2)],
  term (-12 : Rat) [(4, 2), (10, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(4, 2), (10, 2), (13, 2)],
  term (-27 : Rat) [(4, 2), (11, 1), (13, 1)],
  term (-40 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((89 : Rat) / 6) [(4, 2), (11, 1), (15, 1)],
  term ((3 : Rat) / 4) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(4, 2), (11, 2)],
  term ((1 : Rat) / 12) [(4, 2), (13, 1), (15, 1)],
  term ((57 : Rat) / 8) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43 : Rat) / 3) [(4, 2), (13, 2)],
  term ((16 : Rat) / 3) [(4, 2), (15, 2)],
  term (-320 : Rat) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((536 : Rat) / 3) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (-6 : Rat) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (354 : Rat) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term (160 : Rat) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-340 : Rat) / 3) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term (12 : Rat) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (90 : Rat) [(5, 1), (9, 1), (10, 1), (13, 2)],
  term (84 : Rat) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term (-48 : Rat) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term (-72 : Rat) [(5, 1), (9, 1), (10, 2), (11, 2)],
  term (24 : Rat) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term (-24 : Rat) [(5, 1), (9, 1), (10, 2), (13, 2)],
  term (54 : Rat) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term (80 : Rat) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-89 : Rat) / 3) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3 : Rat) / 2) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(5, 1), (9, 1), (11, 2)],
  term ((-1 : Rat) / 6) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-57 : Rat) / 4) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((86 : Rat) / 3) [(5, 1), (9, 1), (13, 2)],
  term ((-32 : Rat) / 3) [(5, 1), (9, 1), (15, 2)],
  term (160 : Rat) [(5, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-268 : Rat) / 3) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term (3 : Rat) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-177 : Rat) [(5, 2), (10, 1), (11, 2)],
  term (-80 : Rat) [(5, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((170 : Rat) / 3) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term (-6 : Rat) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-45 : Rat) [(5, 2), (10, 1), (13, 2)],
  term (-42 : Rat) [(5, 2), (10, 2), (11, 1), (13, 1)],
  term (24 : Rat) [(5, 2), (10, 2), (11, 1), (15, 1)],
  term (36 : Rat) [(5, 2), (10, 2), (11, 2)],
  term (-12 : Rat) [(5, 2), (10, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(5, 2), (10, 2), (13, 2)],
  term (-27 : Rat) [(5, 2), (11, 1), (13, 1)],
  term (-40 : Rat) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((89 : Rat) / 6) [(5, 2), (11, 1), (15, 1)],
  term ((3 : Rat) / 4) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(5, 2), (11, 2)],
  term ((1 : Rat) / 12) [(5, 2), (13, 1), (15, 1)],
  term ((57 : Rat) / 8) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43 : Rat) / 3) [(5, 2), (13, 2)],
  term ((16 : Rat) / 3) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 100 through 121. -/
theorem rs_R009_ueqv_R009NYYNY_block_19_0100_0121_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_19_0100_0121
      rs_R009_ueqv_R009NYYNY_block_19_0100_0121 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
