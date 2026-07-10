/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 30:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_30_0200_0299 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0200 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0200 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 4), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0200_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0200
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0201 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0201 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0201_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0201
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0202 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0202 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0202_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0202
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0203 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0203 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0203_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0203
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0204 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 204 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0204 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0204_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0204
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0205 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0205 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0205_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0205
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0206 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0206 : Poly :=
[
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0206_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0206
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0207 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0207 : Poly :=
[
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0207_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0207
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0208 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0208 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0208_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0208
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0209 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0209 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0209_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0209
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0210 : Poly :=
[
  term ((5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 210 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0210 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0210_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0210
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0211 : Poly :=
[
  term ((-62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0211 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0211_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0211
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0212 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 212 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0212 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0212_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0212
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0213 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0213 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0213_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0213
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0214 : Poly :=
[
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0214 : Poly :=
[
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 3), (14, 1), (15, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0214_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0214
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0215 : Poly :=
[
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0215 : Poly :=
[
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0215_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0215
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0216 : Poly :=
[
  term ((-5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 216 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0216 : Poly :=
[
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0216_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0216
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0217 : Poly :=
[
  term ((62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0217 : Poly :=
[
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((62340392 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0217_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0217
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0218 : Poly :=
[
  term ((4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0218 : Poly :=
[
  term ((-9437440 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2)],
  term ((4718720 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-9437440 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((4718720 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0218_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0218
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0219 : Poly :=
[
  term ((-21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0219 : Poly :=
[
  term ((43960096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((43960096 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0219_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0219
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0220 : Poly :=
[
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 220 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0220 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0220_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0220
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0221 : Poly :=
[
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0221 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0221_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0221
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0222 : Poly :=
[
  term ((-798720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0222 : Poly :=
[
  term ((1597440 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((-798720 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((798720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((798720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((1597440 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-798720 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0222_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0222
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0223 : Poly :=
[
  term ((-4851072 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0223 : Poly :=
[
  term ((9702144 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9702144 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9702144 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((9702144 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0223_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0223
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0224 : Poly :=
[
  term ((19908608 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 224 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0224 : Poly :=
[
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0224_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0224
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0225 : Poly :=
[
  term ((15273760 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0225 : Poly :=
[
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0225_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0225
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0226 : Poly :=
[
  term ((24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 226 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0226 : Poly :=
[
  term ((-48477184 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((24238592 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((24238592 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0226_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0226
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0227 : Poly :=
[
  term ((-3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0227 : Poly :=
[
  term ((7364032 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((7364032 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0227_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0227
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0228 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 228 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0228 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 4), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0228_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0228
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0229 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0229 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0229_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0229
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0230 : Poly :=
[
  term ((-25037312 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 230 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0230 : Poly :=
[
  term ((50074624 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-25037312 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-50074624 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((25037312 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-50074624 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((25037312 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((50074624 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-25037312 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0230_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0230
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0231 : Poly :=
[
  term ((2064992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0231 : Poly :=
[
  term ((-4129984 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2064992 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4129984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2064992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4129984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2064992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4129984 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2064992 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0231_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0231
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0232 : Poly :=
[
  term ((11719936 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 232 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0232 : Poly :=
[
  term ((-23439872 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((11719936 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((23439872 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11719936 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((23439872 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-11719936 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-23439872 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((11719936 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0232_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0232
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0233 : Poly :=
[
  term ((-2649520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0233 : Poly :=
[
  term ((5299040 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2649520 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5299040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2649520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5299040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2649520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((5299040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2649520 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0233_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0233
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0234 : Poly :=
[
  term ((8519680 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 234 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0234 : Poly :=
[
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0234_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0234
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0235 : Poly :=
[
  term ((17248256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0235 : Poly :=
[
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0235_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0235
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0236 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 236 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0236 : Poly :=
[
  term ((-6225920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0236_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0236
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0237 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0237 : Poly :=
[
  term ((18332160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0237_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0237
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0238 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 238 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0238 : Poly :=
[
  term ((6225920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((6225920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0238_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0238
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0239 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0239 : Poly :=
[
  term ((-18332160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0239_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0239
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0240 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 240 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0240 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0240_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0240
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0241 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0241 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0241_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0241
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0242 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 242 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0242 : Poly :=
[
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 3), (14, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0242_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0242
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0243 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 243 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0243 : Poly :=
[
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0243_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0243
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0244 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 244 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0244 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 3), (15, 2)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0244_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0244
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0245 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0245 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0245_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0245
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0246 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 246 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0246 : Poly :=
[
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (14, 1), (15, 3)],
  term ((1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0246_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0246
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0247 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0247 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0247_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0247
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0248 : Poly :=
[
  term ((-1044480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (15, 2)]
]

/-- Partial product 248 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0248 : Poly :=
[
  term ((2088960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 3)],
  term ((-1044480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (15, 2)],
  term ((-2088960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((1044480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (15, 2)],
  term ((-2088960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((1044480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 2), (15, 2)],
  term ((2088960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1044480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0248_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0248
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0249 : Poly :=
[
  term ((674496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 249 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0249 : Poly :=
[
  term ((-1348992 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 3), (16, 1)],
  term ((674496 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((1348992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-674496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1348992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-674496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1348992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((674496 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0249_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0249
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0250 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 250 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0250 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0250_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0250
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0251 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0251 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0251_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0251
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0252 : Poly :=
[
  term ((798720 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 252 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0252 : Poly :=
[
  term ((-1597440 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((798720 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((1597440 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-798720 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1597440 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-798720 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((798720 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0252_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0252
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0253 : Poly :=
[
  term ((4851072 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0253 : Poly :=
[
  term ((-9702144 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9702144 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((9702144 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9702144 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4851072 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0253_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0253
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0254 : Poly :=
[
  term ((-19908608 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 254 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0254 : Poly :=
[
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((19908608 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0254_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0254
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0255 : Poly :=
[
  term ((-15273760 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0255 : Poly :=
[
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0255_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0255
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0256 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 256 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0256 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 3), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0256_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0256
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0257 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0257 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0257_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0257
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0258 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 258 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0258 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 2), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 4), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0258_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0258
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0259 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0259 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0259_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0259
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0260 : Poly :=
[
  term ((-6528256 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 260 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0260 : Poly :=
[
  term ((13056512 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6528256 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-13056512 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((6528256 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13056512 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((6528256 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((13056512 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6528256 : Rat) / 158397) [(0, 3), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0260_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0260
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0261 : Poly :=
[
  term ((13160176 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 261 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0261 : Poly :=
[
  term ((-26320352 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((13160176 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((26320352 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13160176 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((26320352 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13160176 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26320352 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((13160176 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0261_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0261
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0262 : Poly :=
[
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 262 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0262 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (13, 2), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0262_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0262
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0263 : Poly :=
[
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0263 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0263_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0263
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0264 : Poly :=
[
  term ((-1331200 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (15, 2)]
]

/-- Partial product 264 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0264 : Poly :=
[
  term ((2662400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 3)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (10, 1), (15, 2)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1331200 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (12, 2), (15, 2)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 3)],
  term ((1331200 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (13, 2), (15, 2)],
  term ((2662400 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1331200 : Rat) / 158397) [(0, 3), (4, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0264_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0264
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0265 : Poly :=
[
  term ((-2695040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 265 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0265 : Poly :=
[
  term ((5390080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((2695040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((5390080 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2695040 : Rat) / 385571) [(0, 3), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0265_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0265
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0266 : Poly :=
[
  term ((-8519680 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 266 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0266 : Poly :=
[
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8519680 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0266_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0266
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0267 : Poly :=
[
  term ((-17248256 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0267 : Poly :=
[
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0267_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0267
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0268 : Poly :=
[
  term ((-3338240 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 268 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0268 : Poly :=
[
  term ((6676480 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3338240 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6676480 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3338240 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6676480 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3338240 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((6676480 : Rat) / 158397) [(0, 2), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3338240 : Rat) / 158397) [(0, 3), (4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0268_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0268
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0269 : Poly :=
[
  term ((7278080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0269 : Poly :=
[
  term ((-14556160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7278080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14556160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7278080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((14556160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7278080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14556160 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((7278080 : Rat) / 385571) [(0, 3), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0269_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0269
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0270 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 270 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0270 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 3)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (14, 2), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (12, 3), (14, 1), (15, 2)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 3), (4, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0270_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0270
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0271 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0271 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0271_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0271
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0272 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 272 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0272 : Poly :=
[
  term ((2715520 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (13, 1), (15, 1)],
  term ((-2715520 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2715520 : Rat) / 52799) [(0, 1), (4, 1), (13, 2), (15, 2)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 3), (15, 1)],
  term ((2715520 : Rat) / 52799) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 3), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0272_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0272
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0273 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0273 : Poly :=
[
  term ((-73330416 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((73330416 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((73330416 : Rat) / 385571) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-73330416 : Rat) / 385571) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(0, 3), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0273_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0273
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0274 : Poly :=
[
  term ((778240 : Rat) / 52799) [(0, 1), (4, 1), (14, 1), (15, 2)]
]

/-- Partial product 274 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0274 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(0, 1), (4, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (14, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(0, 3), (4, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0274_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0274
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0275 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(0, 1), (4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 275 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0275 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 3), (4, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0275_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0275
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0276 : Poly :=
[
  term ((2360576 : Rat) / 158397) [(0, 1), (4, 1), (15, 2)]
]

/-- Partial product 276 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0276 : Poly :=
[
  term ((-4721152 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (15, 3)],
  term ((2360576 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((4721152 : Rat) / 158397) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2360576 : Rat) / 158397) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term ((4721152 : Rat) / 158397) [(0, 1), (4, 1), (13, 1), (15, 3)],
  term ((-2360576 : Rat) / 158397) [(0, 1), (4, 1), (13, 2), (15, 2)],
  term ((-4721152 : Rat) / 158397) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((2360576 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0276_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0276
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0277 : Poly :=
[
  term ((334168 : Rat) / 385571) [(0, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0277 : Poly :=
[
  term ((-668336 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (15, 3), (16, 1)],
  term ((334168 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((668336 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-334168 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((668336 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-334168 : Rat) / 385571) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-668336 : Rat) / 385571) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((334168 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0277_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0277
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0278 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 278 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0278 : Poly :=
[
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0278_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0278
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0279 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0279 : Poly :=
[
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0279_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0279
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0280 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 280 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0280 : Poly :=
[
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 2), (14, 2), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 3), (14, 1), (15, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (4, 2), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0280_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0280
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0281 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0281 : Poly :=
[
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (4, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0281_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0281
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0282 : Poly :=
[
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 282 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0282 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0282_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0282
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0283 : Poly :=
[
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0283 : Poly :=
[
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0283_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0283
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0284 : Poly :=
[
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 284 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0284 : Poly :=
[
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 2), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0284_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0284
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0285 : Poly :=
[
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0285 : Poly :=
[
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0285_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0285
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0286 : Poly :=
[
  term ((-266240 : Rat) / 52799) [(0, 1), (4, 2), (15, 2)]
]

/-- Partial product 286 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0286 : Poly :=
[
  term ((532480 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (15, 3)],
  term ((-266240 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 2), (12, 1), (14, 1), (15, 2)],
  term ((266240 : Rat) / 52799) [(0, 1), (4, 2), (12, 2), (15, 2)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 2), (13, 1), (15, 3)],
  term ((266240 : Rat) / 52799) [(0, 1), (4, 2), (13, 2), (15, 2)],
  term ((532480 : Rat) / 52799) [(0, 2), (4, 2), (14, 1), (15, 2)],
  term ((-266240 : Rat) / 52799) [(0, 3), (4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0286_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0286
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0287 : Poly :=
[
  term ((-1617024 : Rat) / 385571) [(0, 1), (4, 2), (15, 2), (16, 1)]
]

/-- Partial product 287 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0287 : Poly :=
[
  term ((3234048 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (15, 3), (16, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (4, 2), (12, 2), (15, 2), (16, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 2), (13, 1), (15, 3), (16, 1)],
  term ((1617024 : Rat) / 385571) [(0, 1), (4, 2), (13, 2), (15, 2), (16, 1)],
  term ((3234048 : Rat) / 385571) [(0, 2), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1617024 : Rat) / 385571) [(0, 3), (4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0287_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0287
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0288 : Poly :=
[
  term ((-42027776 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 288 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0288 : Poly :=
[
  term ((84055552 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-42027776 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-84055552 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((42027776 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-84055552 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((42027776 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (15, 1)],
  term ((84055552 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42027776 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0288_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0288
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0289 : Poly :=
[
  term ((18490976 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0289 : Poly :=
[
  term ((-36981952 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((18490976 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((36981952 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18490976 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((36981952 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18490976 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-36981952 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18490976 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0289_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0289
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0290 : Poly :=
[
  term ((56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 290 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0290 : Poly :=
[
  term ((-112367872 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((56183936 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 4), (15, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((56183936 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0290_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0290
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0291 : Poly :=
[
  term ((-84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0291 : Poly :=
[
  term ((168862240 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 4), (15, 1), (16, 1)],
  term ((168862240 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0291_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0291
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0292 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 292 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0292 : Poly :=
[
  term ((9437440 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((9437440 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 3), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0292_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0292
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0293 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0293 : Poly :=
[
  term ((-131880288 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-131880288 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0293_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0293
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0294 : Poly :=
[
  term ((2359360 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 294 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0294 : Poly :=
[
  term ((-4718720 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((2359360 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2359360 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((2359360 : Rat) / 52799) [(0, 3), (5, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0294_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0294
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0295 : Poly :=
[
  term ((-32970072 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0295 : Poly :=
[
  term ((65940144 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32970072 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((32970072 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0295_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0295
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0296 : Poly :=
[
  term ((59378816 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 296 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0296 : Poly :=
[
  term ((-118757632 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((59378816 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((118757632 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-59378816 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((118757632 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-59378816 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 3), (15, 1)],
  term ((-118757632 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((59378816 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0296_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0296
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0297 : Poly :=
[
  term ((-77963024 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0297 : Poly :=
[
  term ((155926048 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77963024 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-155926048 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((77963024 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-155926048 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((77963024 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((155926048 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77963024 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0297_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0297
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0298 : Poly :=
[
  term ((-56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1)]
]

/-- Partial product 298 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0298 : Poly :=
[
  term ((112367872 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (15, 2)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1), (15, 2)],
  term ((56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 2), (15, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 3), (14, 1), (15, 1)],
  term ((56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 4), (15, 1)],
  term ((112367872 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0298_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0298
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 30. -/
def rs_R005_ueqv_R005NYN_coefficient_30_0299 : Poly :=
[
  term ((84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 30. -/
def rs_R005_ueqv_R005NYN_partial_30_0299 : Poly :=
[
  term ((-168862240 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 4), (15, 1), (16, 1)],
  term ((-168862240 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((84431120 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 30. -/
theorem rs_R005_ueqv_R005NYN_partial_30_0299_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_30_0299
        rs_R005_ueqv_R005NYN_generator_30_0200_0299 =
      rs_R005_ueqv_R005NYN_partial_30_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_30_0200_0299 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_30_0200,
  rs_R005_ueqv_R005NYN_partial_30_0201,
  rs_R005_ueqv_R005NYN_partial_30_0202,
  rs_R005_ueqv_R005NYN_partial_30_0203,
  rs_R005_ueqv_R005NYN_partial_30_0204,
  rs_R005_ueqv_R005NYN_partial_30_0205,
  rs_R005_ueqv_R005NYN_partial_30_0206,
  rs_R005_ueqv_R005NYN_partial_30_0207,
  rs_R005_ueqv_R005NYN_partial_30_0208,
  rs_R005_ueqv_R005NYN_partial_30_0209,
  rs_R005_ueqv_R005NYN_partial_30_0210,
  rs_R005_ueqv_R005NYN_partial_30_0211,
  rs_R005_ueqv_R005NYN_partial_30_0212,
  rs_R005_ueqv_R005NYN_partial_30_0213,
  rs_R005_ueqv_R005NYN_partial_30_0214,
  rs_R005_ueqv_R005NYN_partial_30_0215,
  rs_R005_ueqv_R005NYN_partial_30_0216,
  rs_R005_ueqv_R005NYN_partial_30_0217,
  rs_R005_ueqv_R005NYN_partial_30_0218,
  rs_R005_ueqv_R005NYN_partial_30_0219,
  rs_R005_ueqv_R005NYN_partial_30_0220,
  rs_R005_ueqv_R005NYN_partial_30_0221,
  rs_R005_ueqv_R005NYN_partial_30_0222,
  rs_R005_ueqv_R005NYN_partial_30_0223,
  rs_R005_ueqv_R005NYN_partial_30_0224,
  rs_R005_ueqv_R005NYN_partial_30_0225,
  rs_R005_ueqv_R005NYN_partial_30_0226,
  rs_R005_ueqv_R005NYN_partial_30_0227,
  rs_R005_ueqv_R005NYN_partial_30_0228,
  rs_R005_ueqv_R005NYN_partial_30_0229,
  rs_R005_ueqv_R005NYN_partial_30_0230,
  rs_R005_ueqv_R005NYN_partial_30_0231,
  rs_R005_ueqv_R005NYN_partial_30_0232,
  rs_R005_ueqv_R005NYN_partial_30_0233,
  rs_R005_ueqv_R005NYN_partial_30_0234,
  rs_R005_ueqv_R005NYN_partial_30_0235,
  rs_R005_ueqv_R005NYN_partial_30_0236,
  rs_R005_ueqv_R005NYN_partial_30_0237,
  rs_R005_ueqv_R005NYN_partial_30_0238,
  rs_R005_ueqv_R005NYN_partial_30_0239,
  rs_R005_ueqv_R005NYN_partial_30_0240,
  rs_R005_ueqv_R005NYN_partial_30_0241,
  rs_R005_ueqv_R005NYN_partial_30_0242,
  rs_R005_ueqv_R005NYN_partial_30_0243,
  rs_R005_ueqv_R005NYN_partial_30_0244,
  rs_R005_ueqv_R005NYN_partial_30_0245,
  rs_R005_ueqv_R005NYN_partial_30_0246,
  rs_R005_ueqv_R005NYN_partial_30_0247,
  rs_R005_ueqv_R005NYN_partial_30_0248,
  rs_R005_ueqv_R005NYN_partial_30_0249,
  rs_R005_ueqv_R005NYN_partial_30_0250,
  rs_R005_ueqv_R005NYN_partial_30_0251,
  rs_R005_ueqv_R005NYN_partial_30_0252,
  rs_R005_ueqv_R005NYN_partial_30_0253,
  rs_R005_ueqv_R005NYN_partial_30_0254,
  rs_R005_ueqv_R005NYN_partial_30_0255,
  rs_R005_ueqv_R005NYN_partial_30_0256,
  rs_R005_ueqv_R005NYN_partial_30_0257,
  rs_R005_ueqv_R005NYN_partial_30_0258,
  rs_R005_ueqv_R005NYN_partial_30_0259,
  rs_R005_ueqv_R005NYN_partial_30_0260,
  rs_R005_ueqv_R005NYN_partial_30_0261,
  rs_R005_ueqv_R005NYN_partial_30_0262,
  rs_R005_ueqv_R005NYN_partial_30_0263,
  rs_R005_ueqv_R005NYN_partial_30_0264,
  rs_R005_ueqv_R005NYN_partial_30_0265,
  rs_R005_ueqv_R005NYN_partial_30_0266,
  rs_R005_ueqv_R005NYN_partial_30_0267,
  rs_R005_ueqv_R005NYN_partial_30_0268,
  rs_R005_ueqv_R005NYN_partial_30_0269,
  rs_R005_ueqv_R005NYN_partial_30_0270,
  rs_R005_ueqv_R005NYN_partial_30_0271,
  rs_R005_ueqv_R005NYN_partial_30_0272,
  rs_R005_ueqv_R005NYN_partial_30_0273,
  rs_R005_ueqv_R005NYN_partial_30_0274,
  rs_R005_ueqv_R005NYN_partial_30_0275,
  rs_R005_ueqv_R005NYN_partial_30_0276,
  rs_R005_ueqv_R005NYN_partial_30_0277,
  rs_R005_ueqv_R005NYN_partial_30_0278,
  rs_R005_ueqv_R005NYN_partial_30_0279,
  rs_R005_ueqv_R005NYN_partial_30_0280,
  rs_R005_ueqv_R005NYN_partial_30_0281,
  rs_R005_ueqv_R005NYN_partial_30_0282,
  rs_R005_ueqv_R005NYN_partial_30_0283,
  rs_R005_ueqv_R005NYN_partial_30_0284,
  rs_R005_ueqv_R005NYN_partial_30_0285,
  rs_R005_ueqv_R005NYN_partial_30_0286,
  rs_R005_ueqv_R005NYN_partial_30_0287,
  rs_R005_ueqv_R005NYN_partial_30_0288,
  rs_R005_ueqv_R005NYN_partial_30_0289,
  rs_R005_ueqv_R005NYN_partial_30_0290,
  rs_R005_ueqv_R005NYN_partial_30_0291,
  rs_R005_ueqv_R005NYN_partial_30_0292,
  rs_R005_ueqv_R005NYN_partial_30_0293,
  rs_R005_ueqv_R005NYN_partial_30_0294,
  rs_R005_ueqv_R005NYN_partial_30_0295,
  rs_R005_ueqv_R005NYN_partial_30_0296,
  rs_R005_ueqv_R005NYN_partial_30_0297,
  rs_R005_ueqv_R005NYN_partial_30_0298,
  rs_R005_ueqv_R005NYN_partial_30_0299
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_30_0200_0299 : Poly :=
[
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2)],
  term ((43960096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1597440 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2)],
  term ((9702144 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((7364032 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((50074624 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4129984 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23439872 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (15, 2)],
  term ((5299040 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (14, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((2088960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 3)],
  term ((-1348992 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (8, 1), (15, 3), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (15, 2)],
  term ((-9702144 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((30547520 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((13056512 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-26320352 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 3)],
  term ((5390080 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (10, 1), (15, 3), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((34496512 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6676480 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((-14556160 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 3)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2715520 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-73330416 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4721152 : Rat) / 158397) [(0, 1), (1, 1), (4, 1), (15, 3)],
  term ((-668336 : Rat) / 385571) [(0, 1), (1, 1), (4, 1), (15, 3), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (5, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (1, 1), (4, 2), (15, 3)],
  term ((3234048 : Rat) / 385571) [(0, 1), (1, 1), (4, 2), (15, 3), (16, 1)],
  term ((84055552 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2)],
  term ((-36981952 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 2)],
  term ((168862240 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-131880288 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((65940144 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-118757632 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((155926048 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((112367872 : Rat) / 158397) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (15, 2)],
  term ((-168862240 : Rat) / 385571) [(0, 1), (1, 1), (5, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25037312 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2064992 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11719936 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2649520 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1044480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (8, 1), (15, 2)],
  term ((674496 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6528256 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((13160176 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (9, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (10, 1), (15, 2)],
  term ((-2695040 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3338240 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((7278080 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 1), (1, 2), (4, 1), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((2360576 : Rat) / 158397) [(0, 1), (1, 2), (4, 1), (15, 2)],
  term ((334168 : Rat) / 385571) [(0, 1), (1, 2), (4, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-266240 : Rat) / 52799) [(0, 1), (1, 2), (4, 2), (15, 2)],
  term ((-1617024 : Rat) / 385571) [(0, 1), (1, 2), (4, 2), (15, 2), (16, 1)],
  term ((-42027776 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((18490976 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((56183936 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((59378816 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-77963024 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (1, 2), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 4), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (6, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-374042352 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 3), (13, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (9, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (12, 3), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((124680784 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((9437440 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-43960096 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 158397) [(0, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((21980048 : Rat) / 385571) [(0, 1), (4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9702144 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-9702144 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((4851072 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((30547520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((48477184 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7364032 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23439872 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5299040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50074624 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((4129984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((24504832 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9429024 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11719936 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((2649520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-26298368 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-28209952 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-24238592 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (15, 1)],
  term ((3682016 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 4), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((-50074624 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((4129984 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((23439872 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5299040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((25037312 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2064992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11719936 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((2649520 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((34496512 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((9338880 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-27498240 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((18332160 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2088960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((1348992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4669440 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((13749120 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 2), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((1044480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 2), (15, 2)],
  term ((-674496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 3), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (12, 3), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (12, 3), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2088960 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 3)],
  term ((1348992 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1044480 : Rat) / 52799) [(0, 1), (4, 1), (8, 1), (13, 2), (15, 2)],
  term ((-674496 : Rat) / 385571) [(0, 1), (4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((1597440 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((9702144 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1597440 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((9702144 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13056512 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((26320352 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((138496 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-26096368 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((26298368 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((28209952 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 3), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (12, 4), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (12, 4), (15, 1), (16, 1)],
  term ((-13056512 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((26320352 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((6528256 : Rat) / 158397) [(0, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-13160176 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 1), (4, 1), (9, 1), (13, 2), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 1), (4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (12, 2), (15, 2)],
  term ((2695040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2662400 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 3)],
  term ((-5390080 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1331200 : Rat) / 158397) [(0, 1), (4, 1), (10, 1), (13, 2), (15, 2)],
  term ((2695040 : Rat) / 385571) [(0, 1), (4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6676480 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((14556160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3338240 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-7278080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (12, 3), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-6676480 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((14556160 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3338240 : Rat) / 158397) [(0, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-7278080 : Rat) / 385571) [(0, 1), (4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2715520 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((73330416 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4721152 : Rat) / 158397) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((668336 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 1), (12, 2), (14, 2), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2360576 : Rat) / 158397) [(0, 1), (4, 1), (12, 2), (15, 2)],
  term ((-334168 : Rat) / 385571) [(0, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 1), (12, 3), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 1), (12, 3), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((4721152 : Rat) / 158397) [(0, 1), (4, 1), (13, 1), (15, 3)],
  term ((668336 : Rat) / 385571) [(0, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 1), (4, 1), (13, 2), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 1), (4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10507136 : Rat) / 158397) [(0, 1), (4, 1), (13, 2), (15, 2)],
  term ((72996248 : Rat) / 385571) [(0, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(0, 1), (4, 1), (13, 3), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(0, 1), (4, 1), (13, 3), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1)],
  term ((25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (5, 1), (12, 3), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 1), (4, 2), (8, 1), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 2), (14, 2), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 1), (4, 2), (9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 1), (4, 2), (9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (4, 2), (12, 2), (15, 2)],
  term ((1617024 : Rat) / 385571) [(0, 1), (4, 2), (12, 2), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 1), (4, 2), (13, 1), (15, 3)],
  term ((-3234048 : Rat) / 385571) [(0, 1), (4, 2), (13, 1), (15, 3), (16, 1)],
  term ((266240 : Rat) / 52799) [(0, 1), (4, 2), (13, 2), (15, 2)],
  term ((1617024 : Rat) / 385571) [(0, 1), (4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-84055552 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((36981952 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((42027776 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-18490976 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-69899392 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-28958192 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (14, 1), (15, 1)],
  term ((-168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((42027776 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (15, 1)],
  term ((-18490976 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 3), (15, 1), (16, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 4), (15, 1)],
  term ((84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (12, 4), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((131880288 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((4718720 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-65940144 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2359360 : Rat) / 52799) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((32970072 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((118757632 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-155926048 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-59378816 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((77963024 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1), (15, 2)],
  term ((168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 2), (15, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((118757632 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-155926048 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 3), (14, 1), (15, 1)],
  term ((168862240 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-59378816 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 3), (15, 1)],
  term ((77963024 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 3), (15, 1), (16, 1)],
  term ((56183936 : Rat) / 158397) [(0, 1), (5, 1), (6, 1), (12, 4), (15, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 1), (5, 1), (6, 1), (12, 4), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23148800 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-249361568 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9437440 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((43960096 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 2), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 2), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1597440 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((9702144 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48477184 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((7364032 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39817216 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-30547520 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23439872 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((5299040 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((50074624 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-4129984 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6225920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18332160 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17039360 : Rat) / 158397) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-34496512 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6225920 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-18332160 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((25872384 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2088960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1348992 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 2), (4, 1), (8, 1), (14, 2), (15, 2)],
  term ((9166080 : Rat) / 385571) [(0, 2), (4, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1597440 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-9702144 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((39817216 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((30547520 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13056512 : Rat) / 158397) [(0, 2), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-26320352 : Rat) / 385571) [(0, 2), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2662400 : Rat) / 158397) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2)],
  term ((5390080 : Rat) / 385571) [(0, 2), (4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((17039360 : Rat) / 158397) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((34496512 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6676480 : Rat) / 158397) [(0, 2), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-14556160 : Rat) / 385571) [(0, 2), (4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2715520 : Rat) / 52799) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-73330416 : Rat) / 385571) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4721152 : Rat) / 158397) [(0, 2), (4, 1), (14, 1), (15, 2)],
  term ((-668336 : Rat) / 385571) [(0, 2), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (4, 1), (14, 2), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 2), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4259840 : Rat) / 52799) [(0, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-25872384 : Rat) / 385571) [(0, 2), (4, 2), (5, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4259840 : Rat) / 52799) [(0, 2), (4, 2), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((25872384 : Rat) / 385571) [(0, 2), (4, 2), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 2), (4, 2), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 2), (4, 2), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 2), (4, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 2), (4, 2), (14, 1), (15, 2)],
  term ((3234048 : Rat) / 385571) [(0, 2), (4, 2), (14, 1), (15, 2), (16, 1)],
  term ((84055552 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-36981952 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112367872 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((168862240 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((9437440 : Rat) / 52799) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-131880288 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-118757632 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((155926048 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((112367872 : Rat) / 158397) [(0, 2), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-168862240 : Rat) / 385571) [(0, 2), (5, 1), (6, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((5787200 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-62340392 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11574400 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((124680784 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5787200 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((62340392 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4718720 : Rat) / 158397) [(0, 3), (4, 1), (7, 1), (15, 1)],
  term ((-21980048 : Rat) / 385571) [(0, 3), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((532480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((3234048 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-798720 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4851072 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((19908608 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((15273760 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24238592 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3682016 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-25037312 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2064992 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11719936 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2649520 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((8519680 : Rat) / 158397) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17248256 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((9166080 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (12, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1044480 : Rat) / 52799) [(0, 3), (4, 1), (8, 1), (15, 2)],
  term ((674496 : Rat) / 385571) [(0, 3), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((798720 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((4851072 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-19908608 : Rat) / 158397) [(0, 3), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15273760 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (12, 2), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6528256 : Rat) / 158397) [(0, 3), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((13160176 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-532480 : Rat) / 52799) [(0, 3), (4, 1), (9, 1), (15, 1)],
  term ((-3234048 : Rat) / 385571) [(0, 3), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1331200 : Rat) / 158397) [(0, 3), (4, 1), (10, 1), (15, 2)],
  term ((-2695040 : Rat) / 385571) [(0, 3), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8519680 : Rat) / 158397) [(0, 3), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17248256 : Rat) / 385571) [(0, 3), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3338240 : Rat) / 158397) [(0, 3), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((7278080 : Rat) / 385571) [(0, 3), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((12936192 : Rat) / 385571) [(0, 3), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 3), (4, 1), (13, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 3), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 3), (4, 1), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(0, 3), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((2360576 : Rat) / 158397) [(0, 3), (4, 1), (15, 2)],
  term ((334168 : Rat) / 385571) [(0, 3), (4, 1), (15, 2), (16, 1)],
  term ((2129920 : Rat) / 52799) [(0, 3), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((12936192 : Rat) / 385571) [(0, 3), (4, 2), (5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2129920 : Rat) / 52799) [(0, 3), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12936192 : Rat) / 385571) [(0, 3), (4, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1064960 : Rat) / 52799) [(0, 3), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6468096 : Rat) / 385571) [(0, 3), (4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1064960 : Rat) / 52799) [(0, 3), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((6468096 : Rat) / 385571) [(0, 3), (4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-266240 : Rat) / 52799) [(0, 3), (4, 2), (15, 2)],
  term ((-1617024 : Rat) / 385571) [(0, 3), (4, 2), (15, 2), (16, 1)],
  term ((-42027776 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((18490976 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((56183936 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1)],
  term ((-84431120 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4718720 : Rat) / 52799) [(0, 3), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((65940144 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2359360 : Rat) / 52799) [(0, 3), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-32970072 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((59378816 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-77963024 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56183936 : Rat) / 158397) [(0, 3), (5, 1), (6, 1), (12, 2), (15, 1)],
  term ((84431120 : Rat) / 385571) [(0, 3), (5, 1), (6, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 299. -/
theorem rs_R005_ueqv_R005NYN_block_30_0200_0299_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_30_0200_0299
      rs_R005_ueqv_R005NYN_block_30_0200_0299 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
