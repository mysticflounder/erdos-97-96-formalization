/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 27:100-137

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_27_0100_0137 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0100 : Poly :=
[
  term ((-627816 : Rat) / 3749) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0100 : Poly :=
[
  term ((1255632 : Rat) / 3749) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-627816 : Rat) / 3749) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1255632 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-627816 : Rat) / 3749) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((627816 : Rat) / 3749) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0100_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0100
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0101 : Poly :=
[
  term ((-448440 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0101 : Poly :=
[
  term ((896880 : Rat) / 3749) [(0, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-448440 : Rat) / 3749) [(0, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((896880 : Rat) / 3749) [(1, 1), (8, 1), (12, 1), (13, 3), (16, 1)],
  term ((-448440 : Rat) / 3749) [(1, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-896880 : Rat) / 3749) [(8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(8, 1), (12, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0101_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0101
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0102 : Poly :=
[
  term ((103416 : Rat) / 3749) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0102 : Poly :=
[
  term ((-206832 : Rat) / 3749) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((103416 : Rat) / 3749) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-206832 : Rat) / 3749) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((103416 : Rat) / 3749) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((206832 : Rat) / 3749) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103416 : Rat) / 3749) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-103416 : Rat) / 3749) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((206832 : Rat) / 3749) [(8, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0102_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0102
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0103 : Poly :=
[
  term ((941724 : Rat) / 3749) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0103 : Poly :=
[
  term ((-1883448 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((941724 : Rat) / 3749) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1883448 : Rat) / 3749) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((941724 : Rat) / 3749) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1883448 : Rat) / 3749) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-941724 : Rat) / 3749) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-941724 : Rat) / 3749) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1883448 : Rat) / 3749) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0103_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0103
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0104 : Poly :=
[
  term ((-336330 : Rat) / 3749) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 104 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0104 : Poly :=
[
  term ((672660 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-336330 : Rat) / 3749) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((672660 : Rat) / 3749) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((-336330 : Rat) / 3749) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((-672660 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((336330 : Rat) / 3749) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((336330 : Rat) / 3749) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-672660 : Rat) / 3749) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0104_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0104
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0105 : Poly :=
[
  term ((-118158 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0105 : Poly :=
[
  term ((236316 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-118158 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((236316 : Rat) / 3749) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-118158 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((-236316 : Rat) / 3749) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-236316 : Rat) / 3749) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((118158 : Rat) / 3749) [(8, 1), (14, 2), (16, 1)],
  term ((118158 : Rat) / 3749) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0105_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0105
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0106 : Poly :=
[
  term ((85659 : Rat) / 3749) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 106 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0106 : Poly :=
[
  term ((-171318 : Rat) / 3749) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-85659 : Rat) / 3749) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0106_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0106
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0107 : Poly :=
[
  term ((-112110 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0107 : Poly :=
[
  term ((224220 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-112110 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((224220 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-112110 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((112110 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((112110 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-224220 : Rat) / 3749) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0107_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0107
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0108 : Poly :=
[
  term ((-85659 : Rat) / 3749) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0108 : Poly :=
[
  term ((171318 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((85659 : Rat) / 3749) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-171318 : Rat) / 3749) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0108_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0108
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0109 : Poly :=
[
  term ((2397679 : Rat) / 52486) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0109 : Poly :=
[
  term ((-2397679 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2397679 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2397679 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((2397679 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((2397679 : Rat) / 26243) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2397679 : Rat) / 52486) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2397679 : Rat) / 52486) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2397679 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0109_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0109
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0110 : Poly :=
[
  term ((448440 : Rat) / 3749) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 110 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0110 : Poly :=
[
  term ((-896880 : Rat) / 3749) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((448440 : Rat) / 3749) [(0, 2), (9, 1), (13, 3), (16, 1)],
  term ((-896880 : Rat) / 3749) [(1, 1), (9, 1), (13, 4), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 2), (9, 1), (13, 3), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 3), (14, 2), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0110_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0110
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0111 : Poly :=
[
  term ((1853937 : Rat) / 26243) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0111 : Poly :=
[
  term ((-3707874 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1853937 : Rat) / 26243) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3707874 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1853937 : Rat) / 26243) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((3707874 : Rat) / 26243) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3707874 : Rat) / 26243) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1853937 : Rat) / 26243) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1853937 : Rat) / 26243) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0111_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0111
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0112 : Poly :=
[
  term ((-256977 : Rat) / 3749) [(9, 2), (16, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0112 : Poly :=
[
  term ((513954 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)],
  term ((-513954 : Rat) / 3749) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (14, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0112_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0112
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0113 : Poly :=
[
  term ((156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0113 : Poly :=
[
  term ((-156561 : Rat) / 1141) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((156561 : Rat) / 2282) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((156561 : Rat) / 2282) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((156561 : Rat) / 1141) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((156561 : Rat) / 1141) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0113_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0113
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0114 : Poly :=
[
  term ((3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 114 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0114 : Poly :=
[
  term ((-3083749 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 52486) [(0, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((3083749 : Rat) / 52486) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3083749 : Rat) / 26243) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0114_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0114
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0115 : Poly :=
[
  term ((-2567561 : Rat) / 26243) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 115 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0115 : Poly :=
[
  term ((5135122 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((5135122 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(10, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0115_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0115
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0116 : Poly :=
[
  term ((-469683 : Rat) / 4564) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0116 : Poly :=
[
  term ((469683 : Rat) / 2282) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-469683 : Rat) / 4564) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((469683 : Rat) / 2282) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-469683 : Rat) / 4564) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-469683 : Rat) / 2282) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((469683 : Rat) / 4564) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((469683 : Rat) / 4564) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-469683 : Rat) / 2282) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0116_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0116
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0117 : Poly :=
[
  term ((-5114015 : Rat) / 209944) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0117 : Poly :=
[
  term ((5114015 : Rat) / 104972) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-5114015 : Rat) / 209944) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((5114015 : Rat) / 104972) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-5114015 : Rat) / 209944) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((-5114015 : Rat) / 104972) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((5114015 : Rat) / 209944) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((5114015 : Rat) / 209944) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5114015 : Rat) / 104972) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0117_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0117
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0118 : Poly :=
[
  term ((1089649 : Rat) / 14996) [(10, 1), (16, 1)]
]

/-- Partial product 118 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0118 : Poly :=
[
  term ((-1089649 : Rat) / 7498) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((1089649 : Rat) / 14996) [(0, 2), (10, 1), (16, 1)],
  term ((-1089649 : Rat) / 7498) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((1089649 : Rat) / 14996) [(1, 2), (10, 1), (16, 1)],
  term ((1089649 : Rat) / 7498) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1089649 : Rat) / 7498) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1089649 : Rat) / 14996) [(10, 1), (14, 2), (16, 1)],
  term ((-1089649 : Rat) / 14996) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0118_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0118
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0119 : Poly :=
[
  term ((3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0119 : Poly :=
[
  term ((-3083749 : Rat) / 104972) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((3083749 : Rat) / 209944) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3083749 : Rat) / 104972) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0119_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0119
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0120 : Poly :=
[
  term ((5226672 : Rat) / 26243) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0120 : Poly :=
[
  term ((-10453344 : Rat) / 26243) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10453344 : Rat) / 26243) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((10453344 : Rat) / 26243) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10453344 : Rat) / 26243) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0120_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0120
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0121 : Poly :=
[
  term ((18846635 : Rat) / 419888) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0121 : Poly :=
[
  term ((-18846635 : Rat) / 209944) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((18846635 : Rat) / 419888) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-18846635 : Rat) / 209944) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((18846635 : Rat) / 419888) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((18846635 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18846635 : Rat) / 419888) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18846635 : Rat) / 419888) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18846635 : Rat) / 209944) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0121_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0121
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0122 : Poly :=
[
  term ((5484351 : Rat) / 104972) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0122 : Poly :=
[
  term ((-5484351 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5484351 : Rat) / 104972) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5484351 : Rat) / 52486) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((5484351 : Rat) / 104972) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5484351 : Rat) / 52486) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5484351 : Rat) / 104972) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-5484351 : Rat) / 104972) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5484351 : Rat) / 52486) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0122_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0122
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0123 : Poly :=
[
  term ((-4450043 : Rat) / 52486) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0123 : Poly :=
[
  term ((4450043 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4450043 : Rat) / 52486) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term ((4450043 : Rat) / 26243) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((-4450043 : Rat) / 52486) [(1, 2), (11, 1), (13, 3), (16, 1)],
  term ((-4450043 : Rat) / 26243) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((4450043 : Rat) / 52486) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((4450043 : Rat) / 52486) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4450043 : Rat) / 26243) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0123_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0123
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0124 : Poly :=
[
  term ((-5657707 : Rat) / 26243) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0124 : Poly :=
[
  term ((11315414 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5657707 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((11315414 : Rat) / 26243) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5657707 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11315414 : Rat) / 26243) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11315414 : Rat) / 26243) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5657707 : Rat) / 26243) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5657707 : Rat) / 26243) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0124_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0124
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0125 : Poly :=
[
  term ((-538128 : Rat) / 3749) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0125 : Poly :=
[
  term ((1076256 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-538128 : Rat) / 3749) [(0, 2), (11, 2), (13, 2), (16, 1)],
  term ((1076256 : Rat) / 3749) [(1, 1), (11, 2), (13, 3), (16, 1)],
  term ((-538128 : Rat) / 3749) [(1, 2), (11, 2), (13, 2), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0125_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0125
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0126 : Poly :=
[
  term ((296568 : Rat) / 3749) [(11, 2), (16, 1)]
]

/-- Partial product 126 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0126 : Poly :=
[
  term ((-593136 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((296568 : Rat) / 3749) [(0, 2), (11, 2), (16, 1)],
  term ((-593136 : Rat) / 3749) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((296568 : Rat) / 3749) [(1, 2), (11, 2), (16, 1)],
  term ((593136 : Rat) / 3749) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((593136 : Rat) / 3749) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-296568 : Rat) / 3749) [(11, 2), (14, 2), (16, 1)],
  term ((-296568 : Rat) / 3749) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0126_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0126
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0127 : Poly :=
[
  term ((1298911 : Rat) / 104972) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0127 : Poly :=
[
  term ((-1298911 : Rat) / 52486) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 104972) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 52486) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1298911 : Rat) / 104972) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1298911 : Rat) / 52486) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1298911 : Rat) / 52486) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0127_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0127
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0128 : Poly :=
[
  term ((2049441 : Rat) / 104972) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0128 : Poly :=
[
  term ((-2049441 : Rat) / 52486) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 2), (15, 4), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 1), (13, 3), (15, 3), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0128_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0128
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0129 : Poly :=
[
  term ((9583233 : Rat) / 209944) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0129 : Poly :=
[
  term ((-9583233 : Rat) / 104972) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-9583233 : Rat) / 104972) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((9583233 : Rat) / 209944) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((9583233 : Rat) / 104972) [(12, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0129_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0129
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0130 : Poly :=
[
  term ((227404 : Rat) / 26243) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0130 : Poly :=
[
  term ((-454808 : Rat) / 26243) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-454808 : Rat) / 26243) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((454808 : Rat) / 26243) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (15, 4), (16, 1)],
  term ((454808 : Rat) / 26243) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0130_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0130
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0131 : Poly :=
[
  term ((20859 : Rat) / 1141) [(12, 1), (16, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0131 : Poly :=
[
  term ((-41718 : Rat) / 1141) [(0, 1), (12, 2), (16, 1)],
  term ((20859 : Rat) / 1141) [(0, 2), (12, 1), (16, 1)],
  term ((-41718 : Rat) / 1141) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((20859 : Rat) / 1141) [(1, 2), (12, 1), (16, 1)],
  term ((41718 : Rat) / 1141) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 1), (14, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 1), (15, 2), (16, 1)],
  term ((41718 : Rat) / 1141) [(12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0131_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0131
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0132 : Poly :=
[
  term ((-70710309 : Rat) / 209944) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0132 : Poly :=
[
  term ((70710309 : Rat) / 104972) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70710309 : Rat) / 209944) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((70710309 : Rat) / 104972) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-70710309 : Rat) / 209944) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-70710309 : Rat) / 104972) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((70710309 : Rat) / 209944) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((70710309 : Rat) / 209944) [(13, 1), (15, 3), (16, 1)],
  term ((-70710309 : Rat) / 104972) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0132_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0132
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0133 : Poly :=
[
  term ((2656373 : Rat) / 119968) [(13, 2), (16, 1)]
]

/-- Partial product 133 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0133 : Poly :=
[
  term ((-2656373 : Rat) / 59984) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((2656373 : Rat) / 119968) [(0, 2), (13, 2), (16, 1)],
  term ((-2656373 : Rat) / 59984) [(1, 1), (13, 3), (16, 1)],
  term ((2656373 : Rat) / 119968) [(1, 2), (13, 2), (16, 1)],
  term ((2656373 : Rat) / 59984) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2656373 : Rat) / 119968) [(13, 2), (14, 2), (16, 1)],
  term ((-2656373 : Rat) / 119968) [(13, 2), (15, 2), (16, 1)],
  term ((2656373 : Rat) / 59984) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0133_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0133
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0134 : Poly :=
[
  term ((-403596 : Rat) / 3749) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0134 : Poly :=
[
  term ((807192 : Rat) / 3749) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-403596 : Rat) / 3749) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((807192 : Rat) / 3749) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-403596 : Rat) / 3749) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((-807192 : Rat) / 3749) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((403596 : Rat) / 3749) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((403596 : Rat) / 3749) [(13, 3), (15, 3), (16, 1)],
  term ((-807192 : Rat) / 3749) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0134_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0134
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0135 : Poly :=
[
  term ((3083749 : Rat) / 26243) [(13, 4), (16, 1)]
]

/-- Partial product 135 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0135 : Poly :=
[
  term ((-6167498 : Rat) / 26243) [(0, 1), (12, 1), (13, 4), (16, 1)],
  term ((3083749 : Rat) / 26243) [(0, 2), (13, 4), (16, 1)],
  term ((-6167498 : Rat) / 26243) [(1, 1), (13, 5), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 2), (13, 4), (16, 1)],
  term ((6167498 : Rat) / 26243) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(13, 4), (14, 2), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(13, 4), (15, 2), (16, 1)],
  term ((6167498 : Rat) / 26243) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0135_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0135
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0136 : Poly :=
[
  term ((20924951 : Rat) / 104972) [(15, 2), (16, 1)]
]

/-- Partial product 136 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0136 : Poly :=
[
  term ((-20924951 : Rat) / 52486) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((20924951 : Rat) / 104972) [(0, 2), (15, 2), (16, 1)],
  term ((-20924951 : Rat) / 52486) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((20924951 : Rat) / 104972) [(1, 2), (15, 2), (16, 1)],
  term ((20924951 : Rat) / 52486) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20924951 : Rat) / 52486) [(13, 1), (15, 3), (16, 1)],
  term ((-20924951 : Rat) / 104972) [(14, 2), (15, 2), (16, 1)],
  term ((-20924951 : Rat) / 104972) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0136_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0136
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 27. -/
def rs_R005_ueqv_R005YNY_coefficient_27_0137 : Poly :=
[
  term ((6509443 : Rat) / 419888) [(16, 1)]
]

/-- Partial product 137 for generator 27. -/
def rs_R005_ueqv_R005YNY_partial_27_0137 : Poly :=
[
  term ((-6509443 : Rat) / 209944) [(0, 1), (12, 1), (16, 1)],
  term ((6509443 : Rat) / 419888) [(0, 2), (16, 1)],
  term ((-6509443 : Rat) / 209944) [(1, 1), (13, 1), (16, 1)],
  term ((6509443 : Rat) / 419888) [(1, 2), (16, 1)],
  term ((6509443 : Rat) / 209944) [(12, 1), (14, 1), (16, 1)],
  term ((6509443 : Rat) / 209944) [(13, 1), (15, 1), (16, 1)],
  term ((-6509443 : Rat) / 419888) [(14, 2), (16, 1)],
  term ((-6509443 : Rat) / 419888) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 27. -/
theorem rs_R005_ueqv_R005YNY_partial_27_0137_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_27_0137
        rs_R005_ueqv_R005YNY_generator_27_0100_0137 =
      rs_R005_ueqv_R005YNY_partial_27_0137 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_27_0100_0137 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_27_0100,
  rs_R005_ueqv_R005YNY_partial_27_0101,
  rs_R005_ueqv_R005YNY_partial_27_0102,
  rs_R005_ueqv_R005YNY_partial_27_0103,
  rs_R005_ueqv_R005YNY_partial_27_0104,
  rs_R005_ueqv_R005YNY_partial_27_0105,
  rs_R005_ueqv_R005YNY_partial_27_0106,
  rs_R005_ueqv_R005YNY_partial_27_0107,
  rs_R005_ueqv_R005YNY_partial_27_0108,
  rs_R005_ueqv_R005YNY_partial_27_0109,
  rs_R005_ueqv_R005YNY_partial_27_0110,
  rs_R005_ueqv_R005YNY_partial_27_0111,
  rs_R005_ueqv_R005YNY_partial_27_0112,
  rs_R005_ueqv_R005YNY_partial_27_0113,
  rs_R005_ueqv_R005YNY_partial_27_0114,
  rs_R005_ueqv_R005YNY_partial_27_0115,
  rs_R005_ueqv_R005YNY_partial_27_0116,
  rs_R005_ueqv_R005YNY_partial_27_0117,
  rs_R005_ueqv_R005YNY_partial_27_0118,
  rs_R005_ueqv_R005YNY_partial_27_0119,
  rs_R005_ueqv_R005YNY_partial_27_0120,
  rs_R005_ueqv_R005YNY_partial_27_0121,
  rs_R005_ueqv_R005YNY_partial_27_0122,
  rs_R005_ueqv_R005YNY_partial_27_0123,
  rs_R005_ueqv_R005YNY_partial_27_0124,
  rs_R005_ueqv_R005YNY_partial_27_0125,
  rs_R005_ueqv_R005YNY_partial_27_0126,
  rs_R005_ueqv_R005YNY_partial_27_0127,
  rs_R005_ueqv_R005YNY_partial_27_0128,
  rs_R005_ueqv_R005YNY_partial_27_0129,
  rs_R005_ueqv_R005YNY_partial_27_0130,
  rs_R005_ueqv_R005YNY_partial_27_0131,
  rs_R005_ueqv_R005YNY_partial_27_0132,
  rs_R005_ueqv_R005YNY_partial_27_0133,
  rs_R005_ueqv_R005YNY_partial_27_0134,
  rs_R005_ueqv_R005YNY_partial_27_0135,
  rs_R005_ueqv_R005YNY_partial_27_0136,
  rs_R005_ueqv_R005YNY_partial_27_0137
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_27_0100_0137 : Poly :=
[
  term ((1255632 : Rat) / 3749) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1883448 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((672660 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((236316 : Rat) / 3749) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((896880 : Rat) / 3749) [(0, 1), (8, 1), (12, 2), (13, 2), (16, 1)],
  term ((-206832 : Rat) / 3749) [(0, 1), (8, 1), (12, 2), (16, 1)],
  term ((-171318 : Rat) / 3749) [(0, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2397679 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-896880 : Rat) / 3749) [(0, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-3707874 : Rat) / 26243) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((224220 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((513954 : Rat) / 3749) [(0, 1), (9, 2), (12, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((469683 : Rat) / 2282) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5114015 : Rat) / 104972) [(0, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1089649 : Rat) / 7498) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((5135122 : Rat) / 26243) [(0, 1), (10, 1), (12, 2), (16, 1)],
  term ((-18846635 : Rat) / 209944) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5484351 : Rat) / 52486) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4450043 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((11315414 : Rat) / 26243) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-10453344 : Rat) / 26243) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1076256 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-593136 : Rat) / 3749) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((70710309 : Rat) / 104972) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2656373 : Rat) / 59984) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((807192 : Rat) / 3749) [(0, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6167498 : Rat) / 26243) [(0, 1), (12, 1), (13, 4), (16, 1)],
  term ((-20924951 : Rat) / 52486) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6509443 : Rat) / 209944) [(0, 1), (12, 1), (16, 1)],
  term ((-1298911 : Rat) / 52486) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(0, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 104972) [(0, 1), (12, 2), (13, 2), (16, 1)],
  term ((-454808 : Rat) / 26243) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-41718 : Rat) / 1141) [(0, 1), (12, 2), (16, 1)],
  term ((-627816 : Rat) / 3749) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(0, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((103416 : Rat) / 3749) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((941724 : Rat) / 3749) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-336330 : Rat) / 3749) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((-118158 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-112110 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2397679 : Rat) / 52486) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(0, 2), (9, 1), (13, 3), (16, 1)],
  term ((1853937 : Rat) / 26243) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(0, 2), (9, 2), (16, 1)],
  term ((156561 : Rat) / 2282) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(0, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((-469683 : Rat) / 4564) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5114015 : Rat) / 209944) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((1089649 : Rat) / 14996) [(0, 2), (10, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18846635 : Rat) / 419888) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((5484351 : Rat) / 104972) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4450043 : Rat) / 52486) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term ((-5657707 : Rat) / 26243) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(0, 2), (11, 2), (13, 2), (16, 1)],
  term ((296568 : Rat) / 3749) [(0, 2), (11, 2), (16, 1)],
  term ((1298911 : Rat) / 104972) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(0, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((20859 : Rat) / 1141) [(0, 2), (12, 1), (16, 1)],
  term ((-70710309 : Rat) / 209944) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2656373 : Rat) / 119968) [(0, 2), (13, 2), (16, 1)],
  term ((-403596 : Rat) / 3749) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(0, 2), (13, 4), (16, 1)],
  term ((20924951 : Rat) / 104972) [(0, 2), (15, 2), (16, 1)],
  term ((6509443 : Rat) / 419888) [(0, 2), (16, 1)],
  term ((1255632 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-206832 : Rat) / 3749) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((896880 : Rat) / 3749) [(1, 1), (8, 1), (12, 1), (13, 3), (16, 1)],
  term ((236316 : Rat) / 3749) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1883448 : Rat) / 3749) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((672660 : Rat) / 3749) [(1, 1), (8, 1), (13, 3), (16, 1)],
  term ((-171318 : Rat) / 3749) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((224220 : Rat) / 3749) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3707874 : Rat) / 26243) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2397679 : Rat) / 26243) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-896880 : Rat) / 3749) [(1, 1), (9, 1), (13, 4), (16, 1)],
  term ((513954 : Rat) / 3749) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-156561 : Rat) / 1141) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((5135122 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(1, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1089649 : Rat) / 7498) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((469683 : Rat) / 2282) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5114015 : Rat) / 104972) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((-10453344 : Rat) / 26243) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3083749 : Rat) / 104972) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((11315414 : Rat) / 26243) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18846635 : Rat) / 209944) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-5484351 : Rat) / 52486) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((4450043 : Rat) / 26243) [(1, 1), (11, 1), (13, 4), (16, 1)],
  term ((-593136 : Rat) / 3749) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((1076256 : Rat) / 3749) [(1, 1), (11, 2), (13, 3), (16, 1)],
  term ((-454808 : Rat) / 26243) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-41718 : Rat) / 1141) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1298911 : Rat) / 52486) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2049441 : Rat) / 52486) [(1, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 104972) [(1, 1), (12, 1), (13, 3), (16, 1)],
  term ((-20924951 : Rat) / 52486) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6509443 : Rat) / 209944) [(1, 1), (13, 1), (16, 1)],
  term ((70710309 : Rat) / 104972) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2656373 : Rat) / 59984) [(1, 1), (13, 3), (16, 1)],
  term ((807192 : Rat) / 3749) [(1, 1), (13, 4), (15, 1), (16, 1)],
  term ((-6167498 : Rat) / 26243) [(1, 1), (13, 5), (16, 1)],
  term ((-627816 : Rat) / 3749) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(1, 2), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((103416 : Rat) / 3749) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((941724 : Rat) / 3749) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-336330 : Rat) / 3749) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((-118158 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-112110 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2397679 : Rat) / 52486) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(1, 2), (9, 1), (13, 3), (16, 1)],
  term ((1853937 : Rat) / 26243) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-256977 : Rat) / 3749) [(1, 2), (9, 2), (16, 1)],
  term ((156561 : Rat) / 2282) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3083749 : Rat) / 52486) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2567561 : Rat) / 26243) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-469683 : Rat) / 4564) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5114015 : Rat) / 209944) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((1089649 : Rat) / 14996) [(1, 2), (10, 1), (16, 1)],
  term ((3083749 : Rat) / 209944) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5226672 : Rat) / 26243) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18846635 : Rat) / 419888) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((5484351 : Rat) / 104972) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4450043 : Rat) / 52486) [(1, 2), (11, 1), (13, 3), (16, 1)],
  term ((-5657707 : Rat) / 26243) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-538128 : Rat) / 3749) [(1, 2), (11, 2), (13, 2), (16, 1)],
  term ((296568 : Rat) / 3749) [(1, 2), (11, 2), (16, 1)],
  term ((1298911 : Rat) / 104972) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 104972) [(1, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 209944) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((227404 : Rat) / 26243) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((20859 : Rat) / 1141) [(1, 2), (12, 1), (16, 1)],
  term ((-70710309 : Rat) / 209944) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2656373 : Rat) / 119968) [(1, 2), (13, 2), (16, 1)],
  term ((-403596 : Rat) / 3749) [(1, 2), (13, 3), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 26243) [(1, 2), (13, 4), (16, 1)],
  term ((20924951 : Rat) / 104972) [(1, 2), (15, 2), (16, 1)],
  term ((6509443 : Rat) / 419888) [(1, 2), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((627816 : Rat) / 3749) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((627816 : Rat) / 3749) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1255632 : Rat) / 3749) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1883448 : Rat) / 3749) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((206832 : Rat) / 3749) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-672660 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((448440 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((448440 : Rat) / 3749) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-896880 : Rat) / 3749) [(8, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-236316 : Rat) / 3749) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-103416 : Rat) / 3749) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-103416 : Rat) / 3749) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-896880 : Rat) / 3749) [(8, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((206832 : Rat) / 3749) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((-941724 : Rat) / 3749) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-236316 : Rat) / 3749) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941724 : Rat) / 3749) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((336330 : Rat) / 3749) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((2219778 : Rat) / 3749) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-672660 : Rat) / 3749) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((118158 : Rat) / 3749) [(8, 1), (14, 2), (16, 1)],
  term ((118158 : Rat) / 3749) [(8, 1), (15, 2), (16, 1)],
  term ((171318 : Rat) / 3749) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((171318 : Rat) / 3749) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85659 : Rat) / 3749) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-85659 : Rat) / 3749) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2397679 : Rat) / 26243) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((112110 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-59208 : Rat) / 3749) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-224220 : Rat) / 3749) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((3707874 : Rat) / 26243) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((85659 : Rat) / 3749) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-224220 : Rat) / 3749) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-171318 : Rat) / 3749) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2397679 : Rat) / 52486) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((716867 : Rat) / 7498) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2397679 : Rat) / 26243) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 3), (14, 2), (16, 1)],
  term ((-448440 : Rat) / 3749) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((896880 : Rat) / 3749) [(9, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1853937 : Rat) / 26243) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1853937 : Rat) / 26243) [(9, 1), (15, 3), (16, 1)],
  term ((-513954 : Rat) / 3749) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-513954 : Rat) / 3749) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (14, 2), (16, 1)],
  term ((256977 : Rat) / 3749) [(9, 2), (15, 2), (16, 1)],
  term ((156561 : Rat) / 1141) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-156561 : Rat) / 2282) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((156561 : Rat) / 1141) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-469683 : Rat) / 2282) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5114015 : Rat) / 104972) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-3083749 : Rat) / 52486) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3083749 : Rat) / 26243) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1089649 : Rat) / 7498) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((2567561 : Rat) / 26243) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((3083749 : Rat) / 26243) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-5135122 : Rat) / 26243) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((469683 : Rat) / 4564) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1089649 : Rat) / 7498) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((469683 : Rat) / 4564) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((5114015 : Rat) / 209944) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-5442403 : Rat) / 29992) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5114015 : Rat) / 104972) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1089649 : Rat) / 14996) [(10, 1), (14, 2), (16, 1)],
  term ((-1089649 : Rat) / 14996) [(10, 1), (15, 2), (16, 1)],
  term ((18846635 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3083749 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((80543003 : Rat) / 209944) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5484351 : Rat) / 52486) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3083749 : Rat) / 104972) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4450043 : Rat) / 26243) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-11315414 : Rat) / 26243) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5226672 : Rat) / 26243) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((3083749 : Rat) / 104972) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((10453344 : Rat) / 26243) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18846635 : Rat) / 419888) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-199893259 : Rat) / 419888) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5484351 : Rat) / 104972) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((18846635 : Rat) / 209944) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5484351 : Rat) / 104972) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((4450043 : Rat) / 52486) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term ((4967197 : Rat) / 26243) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4450043 : Rat) / 26243) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((5657707 : Rat) / 26243) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5657707 : Rat) / 26243) [(11, 1), (15, 3), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(11, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((593136 : Rat) / 3749) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((593136 : Rat) / 3749) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (13, 2), (14, 2), (16, 1)],
  term ((538128 : Rat) / 3749) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1076256 : Rat) / 3749) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-296568 : Rat) / 3749) [(11, 2), (14, 2), (16, 1)],
  term ((-296568 : Rat) / 3749) [(11, 2), (15, 2), (16, 1)],
  term ((-70710309 : Rat) / 104972) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1298911 : Rat) / 104972) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((41718 : Rat) / 1141) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((520321 : Rat) / 104972) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2656373 : Rat) / 59984) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-9583233 : Rat) / 209944) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-4387589 : Rat) / 209944) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2049441 : Rat) / 104972) [(12, 1), (13, 2), (15, 4), (16, 1)],
  term ((-807192 : Rat) / 3749) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((9583233 : Rat) / 104972) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 1), (13, 3), (15, 3), (16, 1)],
  term ((6167498 : Rat) / 26243) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term ((20924951 : Rat) / 52486) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6509443 : Rat) / 209944) [(12, 1), (14, 1), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 1), (14, 2), (16, 1)],
  term ((-20859 : Rat) / 1141) [(12, 1), (15, 2), (16, 1)],
  term ((-227404 : Rat) / 26243) [(12, 1), (15, 4), (16, 1)],
  term ((1298911 : Rat) / 52486) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2049441 : Rat) / 52486) [(12, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((9583233 : Rat) / 104972) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((454808 : Rat) / 26243) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((41718 : Rat) / 1141) [(12, 2), (14, 1), (16, 1)],
  term ((70710309 : Rat) / 209944) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6509443 : Rat) / 209944) [(13, 1), (15, 1), (16, 1)],
  term ((154410113 : Rat) / 209944) [(13, 1), (15, 3), (16, 1)],
  term ((-2656373 : Rat) / 119968) [(13, 2), (14, 2), (16, 1)],
  term ((-584277083 : Rat) / 839776) [(13, 2), (15, 2), (16, 1)],
  term ((403596 : Rat) / 3749) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((2656373 : Rat) / 59984) [(13, 3), (15, 1), (16, 1)],
  term ((403596 : Rat) / 3749) [(13, 3), (15, 3), (16, 1)],
  term ((-3083749 : Rat) / 26243) [(13, 4), (14, 2), (16, 1)],
  term ((-8734093 : Rat) / 26243) [(13, 4), (15, 2), (16, 1)],
  term ((6167498 : Rat) / 26243) [(13, 5), (15, 1), (16, 1)],
  term ((-20924951 : Rat) / 104972) [(14, 2), (15, 2), (16, 1)],
  term ((-6509443 : Rat) / 419888) [(14, 2), (16, 1)],
  term ((-6509443 : Rat) / 419888) [(15, 2), (16, 1)],
  term ((-20924951 : Rat) / 104972) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 137. -/
theorem rs_R005_ueqv_R005YNY_block_27_0100_0137_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_27_0100_0137
      rs_R005_ueqv_R005YNY_block_27_0100_0137 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
