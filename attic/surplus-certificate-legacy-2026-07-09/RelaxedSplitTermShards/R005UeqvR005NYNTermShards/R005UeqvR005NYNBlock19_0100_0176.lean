/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 19:100-176

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_19_0100_0176 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0100 : Poly :=
[
  term ((12806592 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0100 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0100_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0100
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0101 : Poly :=
[
  term ((14454016 : Rat) / 158397) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 101 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0101 : Poly :=
[
  term ((-28908032 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((14454016 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((-28908032 : Rat) / 158397) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((14454016 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0101_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0101
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0102 : Poly :=
[
  term ((-4132528 : Rat) / 385571) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0102 : Poly :=
[
  term ((8265056 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4132528 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8265056 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4132528 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0102_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0102
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0103 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 103 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0103 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0103_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0103
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0104 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0104 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0104_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0104
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0105 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 105 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0105 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0105_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0105
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0106 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0106 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0106_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0106
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0107 : Poly :=
[
  term ((-6432640 : Rat) / 158397) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 107 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0107 : Poly :=
[
  term ((12865280 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((12865280 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6432640 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0107_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0107
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0108 : Poly :=
[
  term ((47655232 : Rat) / 385571) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0108 : Poly :=
[
  term ((-95310464 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-95310464 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((47655232 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0108_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0108
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0109 : Poly :=
[
  term ((-12119296 : Rat) / 158397) [(4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 109 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0109 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 2), (10, 1), (15, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0109_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0109
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0110 : Poly :=
[
  term ((1841008 : Rat) / 385571) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0110 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0110_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0110
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0111 : Poly :=
[
  term ((12119296 : Rat) / 158397) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 111 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0111 : Poly :=
[
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 2), (14, 1), (15, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0111_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0111
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0112 : Poly :=
[
  term ((-1841008 : Rat) / 385571) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0112 : Poly :=
[
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0112_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0112
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0113 : Poly :=
[
  term ((6832224 : Rat) / 52799) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 113 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0113 : Poly :=
[
  term ((-13664448 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((6832224 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-13664448 : Rat) / 52799) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((6832224 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0113_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0113
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0114 : Poly :=
[
  term ((-30740436 : Rat) / 385571) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0114 : Poly :=
[
  term ((61480872 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30740436 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((61480872 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((-30740436 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0114_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0114
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0115 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(4, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 115 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0115 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0115_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0115
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0116 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0116 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0116_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0116
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0117 : Poly :=
[
  term ((778240 : Rat) / 52799) [(4, 1), (10, 1), (15, 2)]
]

/-- Partial product 117 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0117 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0117_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0117
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0118 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0118 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0118_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0118
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0119 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 119 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0119 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0119_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0119
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0120 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0120 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0120_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0120
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0121 : Poly :=
[
  term ((-678880 : Rat) / 52799) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 121 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0121 : Poly :=
[
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0121_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0121
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0122 : Poly :=
[
  term ((18332604 : Rat) / 385571) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0122 : Poly :=
[
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0122_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0122
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0123 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 123 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0123 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0123_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0123
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0124 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0124 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0124_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0124
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0125 : Poly :=
[
  term ((13523456 : Rat) / 158397) [(4, 1), (15, 2)]
]

/-- Partial product 125 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0125 : Poly :=
[
  term ((-27046912 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((13523456 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((-27046912 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((13523456 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0125_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0125
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0126 : Poly :=
[
  term ((-22977128 : Rat) / 385571) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0126 : Poly :=
[
  term ((45954256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-22977128 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((45954256 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-22977128 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0126_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0126
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0127 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(5, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 127 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0127 : Poly :=
[
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0127_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0127
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0128 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0128 : Poly :=
[
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0128_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0128
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0129 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 129 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0129 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0129_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0129
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0130 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0130 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0130_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0130
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0131 : Poly :=
[
  term ((-21648416 : Rat) / 158397) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 131 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0131 : Poly :=
[
  term ((43296832 : Rat) / 158397) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-21648416 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((43296832 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-21648416 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0131_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0131
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0132 : Poly :=
[
  term ((37122980 : Rat) / 385571) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0132 : Poly :=
[
  term ((-74245960 : Rat) / 385571) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((37122980 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-74245960 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((37122980 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0132_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0132
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0133 : Poly :=
[
  term ((32076800 : Rat) / 158397) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 133 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0133 : Poly :=
[
  term ((-64153600 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((32076800 : Rat) / 158397) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-64153600 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((32076800 : Rat) / 158397) [(1, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0133_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0133
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0134 : Poly :=
[
  term ((-72499760 : Rat) / 385571) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0134 : Poly :=
[
  term ((144999520 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72499760 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((144999520 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72499760 : Rat) / 385571) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0134_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0134
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0135 : Poly :=
[
  term ((678880 : Rat) / 52799) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 135 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0135 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0135_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0135
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0136 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0136 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0136_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0136
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0137 : Poly :=
[
  term ((-3308992 : Rat) / 158397) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 137 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0137 : Poly :=
[
  term ((6617984 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-3308992 : Rat) / 158397) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0137_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0137
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0138 : Poly :=
[
  term ((17616040 : Rat) / 385571) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0138 : Poly :=
[
  term ((-35232080 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((17616040 : Rat) / 385571) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17616040 : Rat) / 385571) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0138_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0138
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0139 : Poly :=
[
  term ((-6990436 : Rat) / 158397) [(5, 1), (15, 1)]
]

/-- Partial product 139 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0139 : Poly :=
[
  term ((13980872 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-6990436 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((13980872 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-6990436 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0139_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0139
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0140 : Poly :=
[
  term ((40549892 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0140 : Poly :=
[
  term ((-81099784 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((40549892 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-81099784 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((40549892 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0140_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0140
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0141 : Poly :=
[
  term ((1179680 : Rat) / 52799) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 141 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0141 : Poly :=
[
  term ((-2359360 : Rat) / 52799) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((1179680 : Rat) / 52799) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((1179680 : Rat) / 52799) [(1, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0141_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0141
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0142 : Poly :=
[
  term ((-16485036 : Rat) / 385571) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0142 : Poly :=
[
  term ((32970072 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0142_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0142
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0143 : Poly :=
[
  term ((-3216320 : Rat) / 158397) [(6, 1), (15, 2)]
]

/-- Partial product 143 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0143 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(0, 2), (6, 1), (15, 2)],
  term ((6432640 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(1, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0143_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0143
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0144 : Poly :=
[
  term ((23827616 : Rat) / 385571) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0144 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0144_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0144
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0145 : Poly :=
[
  term ((2893600 : Rat) / 158397) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 145 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0145 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((2893600 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((2893600 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0145_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0145
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0146 : Poly :=
[
  term ((-31170196 : Rat) / 385571) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0146 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-31170196 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0146_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0146
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0147 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 147 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0147 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0147_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0147
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0148 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0148 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0148_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0148
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0149 : Poly :=
[
  term ((-428480 : Rat) / 158397) [(7, 1), (15, 1)]
]

/-- Partial product 149 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0149 : Poly :=
[
  term ((856960 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-428480 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((856960 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-428480 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0149_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0149
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0150 : Poly :=
[
  term ((6418796 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 150 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0150 : Poly :=
[
  term ((-12837592 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6418796 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12837592 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((6418796 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0150_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0150
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0151 : Poly :=
[
  term ((778240 : Rat) / 52799) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 151 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0151 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0151_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0151
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0152 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0152 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0152_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0152
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0153 : Poly :=
[
  term ((-2539520 : Rat) / 158397) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 153 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0153 : Poly :=
[
  term ((5079040 : Rat) / 158397) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-2539520 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((5079040 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2539520 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0153_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0153
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0154 : Poly :=
[
  term ((8895104 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0154 : Poly :=
[
  term ((-17790208 : Rat) / 385571) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((8895104 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17790208 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8895104 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0154_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0154
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0155 : Poly :=
[
  term ((16812608 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 155 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0155 : Poly :=
[
  term ((-33625216 : Rat) / 158397) [(0, 1), (8, 2), (15, 2)],
  term ((16812608 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-33625216 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((16812608 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0155_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0155
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0156 : Poly :=
[
  term ((-30544664 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0156 : Poly :=
[
  term ((61089328 : Rat) / 385571) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-30544664 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((61089328 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-30544664 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0156_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0156
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0157 : Poly :=
[
  term ((-2019712 : Rat) / 52799) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 157 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0157 : Poly :=
[
  term ((4039424 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2019712 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((4039424 : Rat) / 52799) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-2019712 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0157_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0157
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0158 : Poly :=
[
  term ((34433472 : Rat) / 385571) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0158 : Poly :=
[
  term ((-68866944 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((34433472 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-68866944 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((34433472 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0158_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0158
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0159 : Poly :=
[
  term ((-11852032 : Rat) / 158397) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 159 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0159 : Poly :=
[
  term ((23704064 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-11852032 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((23704064 : Rat) / 158397) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-11852032 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0159_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0159
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0160 : Poly :=
[
  term ((16184560 : Rat) / 385571) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0160 : Poly :=
[
  term ((-32369120 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16184560 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32369120 : Rat) / 385571) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((16184560 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0160_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0160
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0161 : Poly :=
[
  term ((1316384 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 161 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0161 : Poly :=
[
  term ((-2632768 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((1316384 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((-2632768 : Rat) / 158397) [(1, 1), (9, 2), (15, 1)],
  term ((1316384 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0161_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0161
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0162 : Poly :=
[
  term ((-20268404 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0162 : Poly :=
[
  term ((40536808 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20268404 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((40536808 : Rat) / 385571) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-20268404 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0162_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0162
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0163 : Poly :=
[
  term ((-4157440 : Rat) / 158397) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 163 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0163 : Poly :=
[
  term ((8314880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4157440 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((8314880 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4157440 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0163_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0163
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0164 : Poly :=
[
  term ((-11925920 : Rat) / 385571) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0164 : Poly :=
[
  term ((23851840 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11925920 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23851840 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11925920 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0164_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0164
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0165 : Poly :=
[
  term ((-5120000 : Rat) / 158397) [(10, 1), (15, 2)]
]

/-- Partial product 165 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0165 : Poly :=
[
  term ((10240000 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-5120000 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((10240000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-5120000 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0165_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0165
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0166 : Poly :=
[
  term ((13028480 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 166 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0166 : Poly :=
[
  term ((-26056960 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((13028480 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-26056960 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((13028480 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0166_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0166
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0167 : Poly :=
[
  term ((-102400 : Rat) / 158397) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 167 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0167 : Poly :=
[
  term ((204800 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-102400 : Rat) / 158397) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((204800 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-102400 : Rat) / 158397) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0167_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0167
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0168 : Poly :=
[
  term ((3301792 : Rat) / 385571) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0168 : Poly :=
[
  term ((-6603584 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3301792 : Rat) / 385571) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6603584 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3301792 : Rat) / 385571) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0168_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0168
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0169 : Poly :=
[
  term ((545664 : Rat) / 52799) [(11, 1), (15, 1)]
]

/-- Partial product 169 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0169 : Poly :=
[
  term ((-1091328 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((545664 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((-1091328 : Rat) / 52799) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((545664 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0169_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0169
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0170 : Poly :=
[
  term ((-6550356 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0170 : Poly :=
[
  term ((13100712 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6550356 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((13100712 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6550356 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0170_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0170
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0171 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 171 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0171 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0171_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0171
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0172 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0172 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0172_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0172
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0173 : Poly :=
[
  term ((-1310720 : Rat) / 52799) [(14, 1), (15, 2)]
]

/-- Partial product 173 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0173 : Poly :=
[
  term ((2621440 : Rat) / 52799) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1310720 : Rat) / 52799) [(0, 2), (14, 1), (15, 2)],
  term ((2621440 : Rat) / 52799) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1310720 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0173_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0173
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0174 : Poly :=
[
  term ((-942528 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0174 : Poly :=
[
  term ((1885056 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-942528 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1885056 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-942528 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0174_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0174
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0175 : Poly :=
[
  term ((1209296 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 175 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0175 : Poly :=
[
  term ((-2418592 : Rat) / 52799) [(0, 1), (8, 1), (15, 2)],
  term ((1209296 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-2418592 : Rat) / 52799) [(1, 1), (9, 1), (15, 2)],
  term ((1209296 : Rat) / 52799) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0175_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0175
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 19. -/
def rs_R005_ueqv_R005NYN_coefficient_19_0176 : Poly :=
[
  term ((-1358836 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 176 for generator 19. -/
def rs_R005_ueqv_R005NYN_partial_19_0176 : Poly :=
[
  term ((2717672 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1358836 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((2717672 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1358836 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 19. -/
theorem rs_R005_ueqv_R005NYN_partial_19_0176_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_19_0176
        rs_R005_ueqv_R005NYN_generator_19_0100_0176 =
      rs_R005_ueqv_R005NYN_partial_19_0176 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_19_0100_0176 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_19_0100,
  rs_R005_ueqv_R005NYN_partial_19_0101,
  rs_R005_ueqv_R005NYN_partial_19_0102,
  rs_R005_ueqv_R005NYN_partial_19_0103,
  rs_R005_ueqv_R005NYN_partial_19_0104,
  rs_R005_ueqv_R005NYN_partial_19_0105,
  rs_R005_ueqv_R005NYN_partial_19_0106,
  rs_R005_ueqv_R005NYN_partial_19_0107,
  rs_R005_ueqv_R005NYN_partial_19_0108,
  rs_R005_ueqv_R005NYN_partial_19_0109,
  rs_R005_ueqv_R005NYN_partial_19_0110,
  rs_R005_ueqv_R005NYN_partial_19_0111,
  rs_R005_ueqv_R005NYN_partial_19_0112,
  rs_R005_ueqv_R005NYN_partial_19_0113,
  rs_R005_ueqv_R005NYN_partial_19_0114,
  rs_R005_ueqv_R005NYN_partial_19_0115,
  rs_R005_ueqv_R005NYN_partial_19_0116,
  rs_R005_ueqv_R005NYN_partial_19_0117,
  rs_R005_ueqv_R005NYN_partial_19_0118,
  rs_R005_ueqv_R005NYN_partial_19_0119,
  rs_R005_ueqv_R005NYN_partial_19_0120,
  rs_R005_ueqv_R005NYN_partial_19_0121,
  rs_R005_ueqv_R005NYN_partial_19_0122,
  rs_R005_ueqv_R005NYN_partial_19_0123,
  rs_R005_ueqv_R005NYN_partial_19_0124,
  rs_R005_ueqv_R005NYN_partial_19_0125,
  rs_R005_ueqv_R005NYN_partial_19_0126,
  rs_R005_ueqv_R005NYN_partial_19_0127,
  rs_R005_ueqv_R005NYN_partial_19_0128,
  rs_R005_ueqv_R005NYN_partial_19_0129,
  rs_R005_ueqv_R005NYN_partial_19_0130,
  rs_R005_ueqv_R005NYN_partial_19_0131,
  rs_R005_ueqv_R005NYN_partial_19_0132,
  rs_R005_ueqv_R005NYN_partial_19_0133,
  rs_R005_ueqv_R005NYN_partial_19_0134,
  rs_R005_ueqv_R005NYN_partial_19_0135,
  rs_R005_ueqv_R005NYN_partial_19_0136,
  rs_R005_ueqv_R005NYN_partial_19_0137,
  rs_R005_ueqv_R005NYN_partial_19_0138,
  rs_R005_ueqv_R005NYN_partial_19_0139,
  rs_R005_ueqv_R005NYN_partial_19_0140,
  rs_R005_ueqv_R005NYN_partial_19_0141,
  rs_R005_ueqv_R005NYN_partial_19_0142,
  rs_R005_ueqv_R005NYN_partial_19_0143,
  rs_R005_ueqv_R005NYN_partial_19_0144,
  rs_R005_ueqv_R005NYN_partial_19_0145,
  rs_R005_ueqv_R005NYN_partial_19_0146,
  rs_R005_ueqv_R005NYN_partial_19_0147,
  rs_R005_ueqv_R005NYN_partial_19_0148,
  rs_R005_ueqv_R005NYN_partial_19_0149,
  rs_R005_ueqv_R005NYN_partial_19_0150,
  rs_R005_ueqv_R005NYN_partial_19_0151,
  rs_R005_ueqv_R005NYN_partial_19_0152,
  rs_R005_ueqv_R005NYN_partial_19_0153,
  rs_R005_ueqv_R005NYN_partial_19_0154,
  rs_R005_ueqv_R005NYN_partial_19_0155,
  rs_R005_ueqv_R005NYN_partial_19_0156,
  rs_R005_ueqv_R005NYN_partial_19_0157,
  rs_R005_ueqv_R005NYN_partial_19_0158,
  rs_R005_ueqv_R005NYN_partial_19_0159,
  rs_R005_ueqv_R005NYN_partial_19_0160,
  rs_R005_ueqv_R005NYN_partial_19_0161,
  rs_R005_ueqv_R005NYN_partial_19_0162,
  rs_R005_ueqv_R005NYN_partial_19_0163,
  rs_R005_ueqv_R005NYN_partial_19_0164,
  rs_R005_ueqv_R005NYN_partial_19_0165,
  rs_R005_ueqv_R005NYN_partial_19_0166,
  rs_R005_ueqv_R005NYN_partial_19_0167,
  rs_R005_ueqv_R005NYN_partial_19_0168,
  rs_R005_ueqv_R005NYN_partial_19_0169,
  rs_R005_ueqv_R005NYN_partial_19_0170,
  rs_R005_ueqv_R005NYN_partial_19_0171,
  rs_R005_ueqv_R005NYN_partial_19_0172,
  rs_R005_ueqv_R005NYN_partial_19_0173,
  rs_R005_ueqv_R005NYN_partial_19_0174,
  rs_R005_ueqv_R005NYN_partial_19_0175,
  rs_R005_ueqv_R005NYN_partial_19_0176
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_19_0100_0176 : Poly :=
[
  term ((-25613184 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28908032 : Rat) / 158397) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((8265056 : Rat) / 385571) [(0, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13664448 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((61480872 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (10, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27046912 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (15, 2)],
  term ((45954256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64153600 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1)],
  term ((144999520 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-35232080 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((13980872 : Rat) / 158397) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-81099784 : Rat) / 385571) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((43296832 : Rat) / 158397) [(0, 1), (5, 1), (8, 2), (15, 1)],
  term ((-74245960 : Rat) / 385571) [(0, 1), (5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((856960 : Rat) / 158397) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-12837592 : Rat) / 385571) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((4039424 : Rat) / 52799) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-68866944 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((23704064 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-32369120 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2632768 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((40536808 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8314880 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((23851840 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10240000 : Rat) / 158397) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-26056960 : Rat) / 385571) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((204800 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6603584 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1091328 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((13100712 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2621440 : Rat) / 52799) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((1885056 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2418592 : Rat) / 52799) [(0, 1), (8, 1), (15, 2)],
  term ((2717672 : Rat) / 385571) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((5079040 : Rat) / 158397) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-17790208 : Rat) / 385571) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33625216 : Rat) / 158397) [(0, 1), (8, 2), (15, 2)],
  term ((61089328 : Rat) / 385571) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((14454016 : Rat) / 158397) [(0, 2), (4, 1), (5, 1), (15, 1)],
  term ((-4132528 : Rat) / 385571) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6832224 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (15, 1)],
  term ((-30740436 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (4, 1), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(0, 2), (4, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((13523456 : Rat) / 158397) [(0, 2), (4, 1), (15, 2)],
  term ((-22977128 : Rat) / 385571) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21648416 : Rat) / 158397) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((37122980 : Rat) / 385571) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((32076800 : Rat) / 158397) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-72499760 : Rat) / 385571) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3308992 : Rat) / 158397) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((17616040 : Rat) / 385571) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6990436 : Rat) / 158397) [(0, 2), (5, 1), (15, 1)],
  term ((40549892 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(0, 2), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((2893600 : Rat) / 158397) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-31170196 : Rat) / 385571) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-428480 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((6418796 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2539520 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((8895104 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16812608 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-30544664 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2019712 : Rat) / 52799) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((34433472 : Rat) / 385571) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11852032 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((16184560 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1316384 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((-20268404 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4157440 : Rat) / 158397) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-11925920 : Rat) / 385571) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5120000 : Rat) / 158397) [(0, 2), (10, 1), (15, 2)],
  term ((13028480 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-102400 : Rat) / 158397) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((3301792 : Rat) / 385571) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545664 : Rat) / 52799) [(0, 2), (11, 1), (15, 1)],
  term ((-6550356 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1310720 : Rat) / 52799) [(0, 2), (14, 1), (15, 2)],
  term ((-942528 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1209296 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-1358836 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28908032 : Rat) / 158397) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((8265056 : Rat) / 385571) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((12865280 : Rat) / 158397) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-95310464 : Rat) / 385571) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27046912 : Rat) / 158397) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((45954256 : Rat) / 385571) [(1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 2), (10, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(1, 1), (4, 1), (9, 2), (14, 1), (15, 1)],
  term ((3682016 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13664448 : Rat) / 52799) [(1, 1), (4, 1), (9, 2), (15, 1)],
  term ((61480872 : Rat) / 385571) [(1, 1), (4, 1), (9, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(1, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((43296832 : Rat) / 158397) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-74245960 : Rat) / 385571) [(1, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64153600 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1)],
  term ((144999520 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6617984 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-35232080 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13980872 : Rat) / 158397) [(1, 1), (5, 1), (9, 1), (15, 1)],
  term ((-81099784 : Rat) / 385571) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((856960 : Rat) / 158397) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-12837592 : Rat) / 385571) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((5079040 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-17790208 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33625216 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (15, 2)],
  term ((61089328 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (8, 1), (9, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((8314880 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((23851840 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10240000 : Rat) / 158397) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-26056960 : Rat) / 385571) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((204800 : Rat) / 158397) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6603584 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1091328 : Rat) / 52799) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((13100712 : Rat) / 385571) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2621440 : Rat) / 52799) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((1885056 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2418592 : Rat) / 52799) [(1, 1), (9, 1), (15, 2)],
  term ((2717672 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((4039424 : Rat) / 52799) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-68866944 : Rat) / 385571) [(1, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((23704064 : Rat) / 158397) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((-32369120 : Rat) / 385571) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2632768 : Rat) / 158397) [(1, 1), (9, 2), (15, 1)],
  term ((40536808 : Rat) / 385571) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((14454016 : Rat) / 158397) [(1, 2), (4, 1), (5, 1), (15, 1)],
  term ((-4132528 : Rat) / 385571) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(1, 2), (4, 1), (7, 1), (15, 1)],
  term ((47655232 : Rat) / 385571) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((12119296 : Rat) / 158397) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1841008 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6832224 : Rat) / 52799) [(1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-30740436 : Rat) / 385571) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (4, 1), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(1, 2), (4, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((13523456 : Rat) / 158397) [(1, 2), (4, 1), (15, 2)],
  term ((-22977128 : Rat) / 385571) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21648416 : Rat) / 158397) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((37122980 : Rat) / 385571) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((32076800 : Rat) / 158397) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-72499760 : Rat) / 385571) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3308992 : Rat) / 158397) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((17616040 : Rat) / 385571) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6990436 : Rat) / 158397) [(1, 2), (5, 1), (15, 1)],
  term ((40549892 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((1179680 : Rat) / 52799) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-16485036 : Rat) / 385571) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(1, 2), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((2893600 : Rat) / 158397) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-31170196 : Rat) / 385571) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-428480 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)],
  term ((6418796 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2539520 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((8895104 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16812608 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-30544664 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2019712 : Rat) / 52799) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((34433472 : Rat) / 385571) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11852032 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((16184560 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1316384 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((-20268404 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4157440 : Rat) / 158397) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-11925920 : Rat) / 385571) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5120000 : Rat) / 158397) [(1, 2), (10, 1), (15, 2)],
  term ((13028480 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-102400 : Rat) / 158397) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((3301792 : Rat) / 385571) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((545664 : Rat) / 52799) [(1, 2), (11, 1), (15, 1)],
  term ((-6550356 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1310720 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)],
  term ((-942528 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1209296 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-1358836 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 100 through 176. -/
theorem rs_R005_ueqv_R005NYN_block_19_0100_0176_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_19_0100_0176
      rs_R005_ueqv_R005NYN_block_19_0100_0176 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
