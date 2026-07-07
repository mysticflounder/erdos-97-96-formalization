/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 27:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_27_0200_0299 : Poly :=
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

/-- Coefficient term 200 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0200 : Poly :=
[
  term (108 : Rat) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 200 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0200 : Poly :=
[
  term (-216 : Rat) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term (108 : Rat) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term (-216 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (108 : Rat) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term (216 : Rat) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-108 : Rat) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term (-108 : Rat) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term (216 : Rat) [(3, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0200_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0200
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0201 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 201 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0201 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0201_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0201
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0202 : Poly :=
[
  term ((-284 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 202 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0202 : Poly :=
[
  term ((568 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-284 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((568 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-284 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-568 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((284 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((284 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-568 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0202_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0202
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0203 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0203 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0203_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0203
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0204 : Poly :=
[
  term ((-144 : Rat) / 35) [(3, 1), (11, 1), (13, 2)]
]

/-- Partial product 204 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0204 : Poly :=
[
  term ((288 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-144 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (13, 2)],
  term ((288 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 3)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (13, 2)],
  term ((-288 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((144 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-288 : Rat) / 35) [(3, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0204_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0204
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0205 : Poly :=
[
  term ((-66 : Rat) / 5) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 205 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0205 : Poly :=
[
  term ((132 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-66 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((132 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-66 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-132 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-132 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((66 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((66 : Rat) / 5) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0205_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0205
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0206 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0206 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0206_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0206
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0207 : Poly :=
[
  term ((-78 : Rat) / 5) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 207 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0207 : Poly :=
[
  term ((156 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((156 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((78 : Rat) / 5) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((78 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0207_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0207
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0208 : Poly :=
[
  term ((72 : Rat) / 35) [(3, 1), (11, 2), (13, 1)]
]

/-- Partial product 208 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0208 : Poly :=
[
  term ((-144 : Rat) / 35) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((72 : Rat) / 35) [(0, 2), (3, 1), (11, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (3, 1), (11, 2), (13, 2)],
  term ((72 : Rat) / 35) [(1, 2), (3, 1), (11, 2), (13, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 2)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0208_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0208
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0209 : Poly :=
[
  term ((24 : Rat) / 5) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0209 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(1, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0209_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0209
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0210 : Poly :=
[
  term ((-3468 : Rat) / 35) [(3, 1), (13, 1)]
]

/-- Partial product 210 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0210 : Poly :=
[
  term ((6936 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-3468 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((6936 : Rat) / 35) [(1, 1), (3, 1), (13, 2)],
  term ((-3468 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((-6936 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((3468 : Rat) / 35) [(3, 1), (13, 1), (14, 2)],
  term ((3468 : Rat) / 35) [(3, 1), (13, 1), (15, 2)],
  term ((-6936 : Rat) / 35) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0210_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0210
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0211 : Poly :=
[
  term ((-162 : Rat) / 5) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 211 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0211 : Poly :=
[
  term ((324 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-162 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((324 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-162 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((162 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((162 : Rat) / 5) [(3, 1), (13, 1), (14, 3)],
  term ((-324 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0211_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0211
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0212 : Poly :=
[
  term ((72 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0212 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0212_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0212
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0213 : Poly :=
[
  term ((146 : Rat) / 5) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0213 : Poly :=
[
  term ((-292 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((146 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-292 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((146 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((292 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-146 : Rat) / 5) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-146 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((292 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0213_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0213
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0214 : Poly :=
[
  term ((-48 : Rat) / 25) [(3, 1), (15, 1)]
]

/-- Partial product 214 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0214 : Poly :=
[
  term ((96 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(0, 2), (3, 1), (15, 1)],
  term ((96 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-48 : Rat) / 25) [(1, 2), (3, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 25) [(3, 1), (13, 1), (15, 2)],
  term ((48 : Rat) / 25) [(3, 1), (14, 2), (15, 1)],
  term ((48 : Rat) / 25) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0214_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0214
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0215 : Poly :=
[
  term ((6 : Rat) / 25) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0215 : Poly :=
[
  term ((-12 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 25) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 25) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 25) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 25) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6 : Rat) / 25) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6 : Rat) / 25) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0215_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0215
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0216 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1)]
]

/-- Partial product 216 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0216 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0216_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0216
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0217 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 217 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0217 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0217_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0217
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0218 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 218 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0218 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0218_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0218
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0219 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 219 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0219 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0219_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0219
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0220 : Poly :=
[
  term ((-864 : Rat) / 5) [(3, 2), (9, 1), (11, 1)]
]

/-- Partial product 220 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0220 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 2)],
  term ((864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0220_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0220
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0221 : Poly :=
[
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 221 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0221 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2)],
  term ((576 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((576 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0221_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0221
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0222 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 222 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0222 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 3)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0222_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0222
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0223 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0223 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0223_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0223
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0224 : Poly :=
[
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 224 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0224 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((384 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0224_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0224
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0225 : Poly :=
[
  term ((-432 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 225 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0225 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((432 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((432 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0225_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0225
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0226 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 226 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0226 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0226_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0226
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0227 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 227 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0227 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0227_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0227
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0228 : Poly :=
[
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 228 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0228 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0228_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0228
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0229 : Poly :=
[
  term ((144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 229 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0229 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (14, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 3)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0229_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0229
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0230 : Poly :=
[
  term ((-48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 230 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0230 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0230_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0230
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0231 : Poly :=
[
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 231 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0231 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0231_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0231
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0232 : Poly :=
[
  term ((216 : Rat) / 35) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 232 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0232 : Poly :=
[
  term ((-432 : Rat) / 35) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((216 : Rat) / 35) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-432 : Rat) / 35) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((216 : Rat) / 35) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((432 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-216 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((432 : Rat) / 35) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0232_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0232
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0233 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (7, 1)]
]

/-- Partial product 233 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0233 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (7, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (5, 1), (7, 1)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (5, 1), (7, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (14, 2)],
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0233_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0233
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0234 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 234 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0234 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (7, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (7, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0234_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0234
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0235 : Poly :=
[
  term ((-72 : Rat) / 7) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 235 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0235 : Poly :=
[
  term ((144 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((-72 : Rat) / 7) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 7) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((72 : Rat) / 7) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 7) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0235_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0235
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0236 : Poly :=
[
  term ((-144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 236 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0236 : Poly :=
[
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-144 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-288 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-288 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0236_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0236
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0237 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (11, 1)]
]

/-- Partial product 237 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0237 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (11, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (11, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (14, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0237_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0237
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0238 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 238 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0238 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((48 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((48 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0238_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0238
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0239 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 239 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0239 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((-48 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0239_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0239
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0240 : Poly :=
[
  term ((-1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2)]
]

/-- Partial product 240 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0240 : Poly :=
[
  term ((3456 : Rat) / 35) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1728 : Rat) / 35) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((3456 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((-1728 : Rat) / 35) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((-3456 : Rat) / 35) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-3456 : Rat) / 35) [(5, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0240_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0240
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0241 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 241 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0241 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0241_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0241
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0242 : Poly :=
[
  term ((1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1)]
]

/-- Partial product 242 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0242 : Poly :=
[
  term ((-2496 : Rat) / 35) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1)],
  term ((1248 : Rat) / 35) [(0, 2), (5, 1), (11, 2), (13, 1)],
  term ((-2496 : Rat) / 35) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((1248 : Rat) / 35) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((2496 : Rat) / 35) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((2496 : Rat) / 35) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0242_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0242
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0243 : Poly :=
[
  term ((-276 : Rat) / 35) [(5, 1), (13, 1)]
]

/-- Partial product 243 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0243 : Poly :=
[
  term ((552 : Rat) / 35) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-276 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term ((552 : Rat) / 35) [(1, 1), (5, 1), (13, 2)],
  term ((-276 : Rat) / 35) [(1, 2), (5, 1), (13, 1)],
  term ((-552 : Rat) / 35) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((276 : Rat) / 35) [(5, 1), (13, 1), (14, 2)],
  term ((276 : Rat) / 35) [(5, 1), (13, 1), (15, 2)],
  term ((-552 : Rat) / 35) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0243_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0243
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0244 : Poly :=
[
  term (12 : Rat) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 244 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0244 : Poly :=
[
  term (-24 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term (12 : Rat) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term (-24 : Rat) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term (12 : Rat) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term (-12 : Rat) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term (-12 : Rat) [(5, 1), (13, 1), (14, 3)],
  term (24 : Rat) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0244_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0244
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0245 : Poly :=
[
  term ((-24 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0245 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((24 : Rat) / 5) [(5, 1), (14, 1), (15, 3)],
  term ((24 : Rat) / 5) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0245_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0245
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0246 : Poly :=
[
  term ((24 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 246 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0246 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (13, 1), (15, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (14, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0246_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0246
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0247 : Poly :=
[
  term ((-36 : Rat) / 35) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 247 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0247 : Poly :=
[
  term ((72 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-36 : Rat) / 35) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((-36 : Rat) / 35) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((36 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((36 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-72 : Rat) / 35) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0247_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0247
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0248 : Poly :=
[
  term ((-72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 248 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0248 : Poly :=
[
  term ((144 : Rat) / 35) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0248_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0248
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0249 : Poly :=
[
  term ((36 : Rat) / 5) [(7, 1), (11, 1)]
]

/-- Partial product 249 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0249 : Poly :=
[
  term ((-72 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((36 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((-72 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(1, 2), (7, 1), (11, 1)],
  term ((72 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((72 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (14, 2)],
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0249_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0249
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0250 : Poly :=
[
  term ((-48 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 250 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0250 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0250_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0250
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0251 : Poly :=
[
  term ((-1362 : Rat) / 35) [(7, 1), (13, 1)]
]

/-- Partial product 251 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0251 : Poly :=
[
  term ((2724 : Rat) / 35) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1362 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((2724 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((-1362 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((-2724 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1362 : Rat) / 35) [(7, 1), (13, 1), (14, 2)],
  term ((1362 : Rat) / 35) [(7, 1), (13, 1), (15, 2)],
  term ((-2724 : Rat) / 35) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0251_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0251
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0252 : Poly :=
[
  term ((408 : Rat) / 5) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 252 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0252 : Poly :=
[
  term ((-816 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((408 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-816 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((408 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((816 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-408 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-408 : Rat) / 5) [(7, 1), (13, 1), (14, 3)],
  term ((816 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0252_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0252
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0253 : Poly :=
[
  term ((-144 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 253 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0253 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0253_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0253
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0254 : Poly :=
[
  term ((72 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 254 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0254 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0254_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0254
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0255 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 255 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0255 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((24 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(7, 1), (14, 1), (15, 3)],
  term ((-12 : Rat) / 5) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0255_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0255
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0256 : Poly :=
[
  term ((-2379 : Rat) / 25) [(7, 1), (15, 1)]
]

/-- Partial product 256 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0256 : Poly :=
[
  term ((4758 : Rat) / 25) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-2379 : Rat) / 25) [(0, 2), (7, 1), (15, 1)],
  term ((4758 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2379 : Rat) / 25) [(1, 2), (7, 1), (15, 1)],
  term ((-4758 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4758 : Rat) / 25) [(7, 1), (13, 1), (15, 2)],
  term ((2379 : Rat) / 25) [(7, 1), (14, 2), (15, 1)],
  term ((2379 : Rat) / 25) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0256_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0256
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0257 : Poly :=
[
  term ((738 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0257 : Poly :=
[
  term ((-1476 : Rat) / 25) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1476 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((738 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((1476 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1476 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-738 : Rat) / 25) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-738 : Rat) / 25) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0257_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0257
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0258 : Poly :=
[
  term ((276 : Rat) / 5) [(8, 1)]
]

/-- Partial product 258 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0258 : Poly :=
[
  term ((-552 : Rat) / 5) [(0, 1), (8, 1), (12, 1)],
  term ((276 : Rat) / 5) [(0, 2), (8, 1)],
  term ((-552 : Rat) / 5) [(1, 1), (8, 1), (13, 1)],
  term ((276 : Rat) / 5) [(1, 2), (8, 1)],
  term ((552 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((552 : Rat) / 5) [(8, 1), (13, 1), (15, 1)],
  term ((-276 : Rat) / 5) [(8, 1), (14, 2)],
  term ((-276 : Rat) / 5) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0258_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0258
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0259 : Poly :=
[
  term ((-1728 : Rat) / 7) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 259 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0259 : Poly :=
[
  term ((3456 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1728 : Rat) / 7) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((3456 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-1728 : Rat) / 7) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((-3456 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 7) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((1728 : Rat) / 7) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3456 : Rat) / 7) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0259_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0259
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0260 : Poly :=
[
  term ((2592 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 260 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0260 : Poly :=
[
  term ((-5184 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((2592 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1)],
  term ((2592 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((5184 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2592 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2592 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 3)],
  term ((5184 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0260_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0260
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0261 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0261 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0261_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0261
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0262 : Poly :=
[
  term ((432 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 262 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0262 : Poly :=
[
  term ((-864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((432 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((432 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0262_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0262
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0263 : Poly :=
[
  term ((-2592 : Rat) / 5) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 263 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0263 : Poly :=
[
  term ((5184 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2592 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((5184 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2592 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-5184 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5184 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((2592 : Rat) / 5) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((2592 : Rat) / 5) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0263_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0263
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0264 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0264 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0264_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0264
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0265 : Poly :=
[
  term ((612 : Rat) / 7) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 265 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0265 : Poly :=
[
  term ((-1224 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((612 : Rat) / 7) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1224 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((612 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((1224 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1224 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0265_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0265
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0266 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 266 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0266 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0266_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0266
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0267 : Poly :=
[
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 267 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0267 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0267_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0267
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0268 : Poly :=
[
  term ((-144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 268 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0268 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0268_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0268
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0269 : Poly :=
[
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 269 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0269 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0269_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0269
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0270 : Poly :=
[
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0270 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0270_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0270
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0271 : Poly :=
[
  term ((-216 : Rat) / 5) [(8, 1), (14, 1)]
]

/-- Partial product 271 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0271 : Poly :=
[
  term ((432 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (8, 1), (14, 1)],
  term ((432 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (8, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (12, 1), (14, 2)],
  term ((-432 : Rat) / 5) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((216 : Rat) / 5) [(8, 1), (14, 1), (15, 2)],
  term ((216 : Rat) / 5) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0271_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0271
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0272 : Poly :=
[
  term ((552 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 272 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0272 : Poly :=
[
  term ((-1104 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((552 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((-1104 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((552 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (14, 2)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0272_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0272
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0273 : Poly :=
[
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 273 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0273 : Poly :=
[
  term ((20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20736 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-20736 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0273_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0273
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0274 : Poly :=
[
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0274 : Poly :=
[
  term ((-6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((6912 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0274_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0274
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0275 : Poly :=
[
  term ((-6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 275 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0275 : Poly :=
[
  term ((13824 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-6912 : Rat) / 7) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((13824 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((-6912 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((-13824 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-13824 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0275_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0275
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0276 : Poly :=
[
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 276 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0276 : Poly :=
[
  term ((-20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 2)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0276_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0276
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0277 : Poly :=
[
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 277 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0277 : Poly :=
[
  term ((6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3), (16, 1)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0277_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0277
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0278 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 278 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0278 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0278_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0278
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0279 : Poly :=
[
  term ((-432 : Rat) / 5) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 279 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0279 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0279_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0279
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0280 : Poly :=
[
  term ((22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 280 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0280 : Poly :=
[
  term ((-44304 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((22152 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-44304 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((22152 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((44304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((44304 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0280_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0280
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0281 : Poly :=
[
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 281 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0281 : Poly :=
[
  term ((13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0281_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0281
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0282 : Poly :=
[
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 282 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0282 : Poly :=
[
  term ((-4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0282_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0282
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0283 : Poly :=
[
  term ((-1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 283 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0283 : Poly :=
[
  term ((2208 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1104 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0283_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0283
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0284 : Poly :=
[
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 284 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0284 : Poly :=
[
  term ((-13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0284_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0284
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0285 : Poly :=
[
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0285 : Poly :=
[
  term ((4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0285_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0285
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0286 : Poly :=
[
  term ((2952 : Rat) / 35) [(9, 1), (13, 1)]
]

/-- Partial product 286 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0286 : Poly :=
[
  term ((-5904 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((2952 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-5904 : Rat) / 35) [(1, 1), (9, 1), (13, 2)],
  term ((2952 : Rat) / 35) [(1, 2), (9, 1), (13, 1)],
  term ((5904 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2952 : Rat) / 35) [(9, 1), (13, 1), (14, 2)],
  term ((-2952 : Rat) / 35) [(9, 1), (13, 1), (15, 2)],
  term ((5904 : Rat) / 35) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0286_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0286
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0287 : Poly :=
[
  term ((-864 : Rat) / 5) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 287 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0287 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((864 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((864 : Rat) / 5) [(9, 1), (13, 1), (14, 3)],
  term ((-1728 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0287_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0287
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0288 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 288 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0288 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((576 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0288_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0288
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0289 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 289 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0289 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0289_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0289
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0290 : Poly :=
[
  term ((864 : Rat) / 5) [(9, 1), (15, 1)]
]

/-- Partial product 290 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0290 : Poly :=
[
  term ((-1728 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((864 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((864 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (13, 1), (15, 2)],
  term ((-864 : Rat) / 5) [(9, 1), (14, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0290_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0290
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0291 : Poly :=
[
  term ((-288 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0291 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0291_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0291
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0292 : Poly :=
[
  term ((-1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 292 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0292 : Poly :=
[
  term ((2304 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1152 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((-1152 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((-2304 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2304 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0292_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0292
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0293 : Poly :=
[
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 293 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0293 : Poly :=
[
  term ((-3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0293_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0293
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0294 : Poly :=
[
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 294 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0294 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0294_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0294
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0295 : Poly :=
[
  term ((288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 295 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0295 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0295_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0295
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0296 : Poly :=
[
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 296 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0296 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0296_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0296
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0297 : Poly :=
[
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0297 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0297_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0297
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0298 : Poly :=
[
  term ((2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 298 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0298 : Poly :=
[
  term ((-5976 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((2988 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5976 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((2988 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5976 : Rat) / 35) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((5976 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0298_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0298
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 27. -/
def rs_R006_ueqv_R006_coefficient_27_0299 : Poly :=
[
  term ((-864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 299 for generator 27. -/
def rs_R006_ueqv_R006_partial_27_0299 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-1728 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 27. -/
theorem rs_R006_ueqv_R006_partial_27_0299_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_27_0299
        rs_R006_ueqv_R006_generator_27_0200_0299 =
      rs_R006_ueqv_R006_partial_27_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_27_0200_0299 : List Poly :=
[
  rs_R006_ueqv_R006_partial_27_0200,
  rs_R006_ueqv_R006_partial_27_0201,
  rs_R006_ueqv_R006_partial_27_0202,
  rs_R006_ueqv_R006_partial_27_0203,
  rs_R006_ueqv_R006_partial_27_0204,
  rs_R006_ueqv_R006_partial_27_0205,
  rs_R006_ueqv_R006_partial_27_0206,
  rs_R006_ueqv_R006_partial_27_0207,
  rs_R006_ueqv_R006_partial_27_0208,
  rs_R006_ueqv_R006_partial_27_0209,
  rs_R006_ueqv_R006_partial_27_0210,
  rs_R006_ueqv_R006_partial_27_0211,
  rs_R006_ueqv_R006_partial_27_0212,
  rs_R006_ueqv_R006_partial_27_0213,
  rs_R006_ueqv_R006_partial_27_0214,
  rs_R006_ueqv_R006_partial_27_0215,
  rs_R006_ueqv_R006_partial_27_0216,
  rs_R006_ueqv_R006_partial_27_0217,
  rs_R006_ueqv_R006_partial_27_0218,
  rs_R006_ueqv_R006_partial_27_0219,
  rs_R006_ueqv_R006_partial_27_0220,
  rs_R006_ueqv_R006_partial_27_0221,
  rs_R006_ueqv_R006_partial_27_0222,
  rs_R006_ueqv_R006_partial_27_0223,
  rs_R006_ueqv_R006_partial_27_0224,
  rs_R006_ueqv_R006_partial_27_0225,
  rs_R006_ueqv_R006_partial_27_0226,
  rs_R006_ueqv_R006_partial_27_0227,
  rs_R006_ueqv_R006_partial_27_0228,
  rs_R006_ueqv_R006_partial_27_0229,
  rs_R006_ueqv_R006_partial_27_0230,
  rs_R006_ueqv_R006_partial_27_0231,
  rs_R006_ueqv_R006_partial_27_0232,
  rs_R006_ueqv_R006_partial_27_0233,
  rs_R006_ueqv_R006_partial_27_0234,
  rs_R006_ueqv_R006_partial_27_0235,
  rs_R006_ueqv_R006_partial_27_0236,
  rs_R006_ueqv_R006_partial_27_0237,
  rs_R006_ueqv_R006_partial_27_0238,
  rs_R006_ueqv_R006_partial_27_0239,
  rs_R006_ueqv_R006_partial_27_0240,
  rs_R006_ueqv_R006_partial_27_0241,
  rs_R006_ueqv_R006_partial_27_0242,
  rs_R006_ueqv_R006_partial_27_0243,
  rs_R006_ueqv_R006_partial_27_0244,
  rs_R006_ueqv_R006_partial_27_0245,
  rs_R006_ueqv_R006_partial_27_0246,
  rs_R006_ueqv_R006_partial_27_0247,
  rs_R006_ueqv_R006_partial_27_0248,
  rs_R006_ueqv_R006_partial_27_0249,
  rs_R006_ueqv_R006_partial_27_0250,
  rs_R006_ueqv_R006_partial_27_0251,
  rs_R006_ueqv_R006_partial_27_0252,
  rs_R006_ueqv_R006_partial_27_0253,
  rs_R006_ueqv_R006_partial_27_0254,
  rs_R006_ueqv_R006_partial_27_0255,
  rs_R006_ueqv_R006_partial_27_0256,
  rs_R006_ueqv_R006_partial_27_0257,
  rs_R006_ueqv_R006_partial_27_0258,
  rs_R006_ueqv_R006_partial_27_0259,
  rs_R006_ueqv_R006_partial_27_0260,
  rs_R006_ueqv_R006_partial_27_0261,
  rs_R006_ueqv_R006_partial_27_0262,
  rs_R006_ueqv_R006_partial_27_0263,
  rs_R006_ueqv_R006_partial_27_0264,
  rs_R006_ueqv_R006_partial_27_0265,
  rs_R006_ueqv_R006_partial_27_0266,
  rs_R006_ueqv_R006_partial_27_0267,
  rs_R006_ueqv_R006_partial_27_0268,
  rs_R006_ueqv_R006_partial_27_0269,
  rs_R006_ueqv_R006_partial_27_0270,
  rs_R006_ueqv_R006_partial_27_0271,
  rs_R006_ueqv_R006_partial_27_0272,
  rs_R006_ueqv_R006_partial_27_0273,
  rs_R006_ueqv_R006_partial_27_0274,
  rs_R006_ueqv_R006_partial_27_0275,
  rs_R006_ueqv_R006_partial_27_0276,
  rs_R006_ueqv_R006_partial_27_0277,
  rs_R006_ueqv_R006_partial_27_0278,
  rs_R006_ueqv_R006_partial_27_0279,
  rs_R006_ueqv_R006_partial_27_0280,
  rs_R006_ueqv_R006_partial_27_0281,
  rs_R006_ueqv_R006_partial_27_0282,
  rs_R006_ueqv_R006_partial_27_0283,
  rs_R006_ueqv_R006_partial_27_0284,
  rs_R006_ueqv_R006_partial_27_0285,
  rs_R006_ueqv_R006_partial_27_0286,
  rs_R006_ueqv_R006_partial_27_0287,
  rs_R006_ueqv_R006_partial_27_0288,
  rs_R006_ueqv_R006_partial_27_0289,
  rs_R006_ueqv_R006_partial_27_0290,
  rs_R006_ueqv_R006_partial_27_0291,
  rs_R006_ueqv_R006_partial_27_0292,
  rs_R006_ueqv_R006_partial_27_0293,
  rs_R006_ueqv_R006_partial_27_0294,
  rs_R006_ueqv_R006_partial_27_0295,
  rs_R006_ueqv_R006_partial_27_0296,
  rs_R006_ueqv_R006_partial_27_0297,
  rs_R006_ueqv_R006_partial_27_0298,
  rs_R006_ueqv_R006_partial_27_0299
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_27_0200_0299 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(0, 1), (3, 1), (11, 1), (12, 1), (13, 2)],
  term ((132 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((156 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term (-216 : Rat) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((568 : Rat) / 5) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((6936 : Rat) / 35) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((324 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-292 : Rat) / 5) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-12 : Rat) / 25) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((96 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((864 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-432 : Rat) / 35) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (7, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (5, 1), (7, 1), (12, 1), (14, 1)],
  term ((144 : Rat) / 7) [(0, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((288 : Rat) / 7) [(0, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((3456 : Rat) / 35) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 2)],
  term ((24 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2496 : Rat) / 35) [(0, 1), (5, 1), (11, 2), (12, 1), (13, 1)],
  term ((552 : Rat) / 35) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term (-24 : Rat) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((72 : Rat) / 35) [(0, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((144 : Rat) / 35) [(0, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-72 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((96 : Rat) / 5) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((2724 : Rat) / 35) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-816 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4758 : Rat) / 25) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1476 : Rat) / 25) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 7) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-5184 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((5184 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-552 : Rat) / 5) [(0, 1), (8, 1), (12, 1)],
  term ((432 : Rat) / 5) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((-1104 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13824 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((6912 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((864 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-44304 : Rat) / 35) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5904 : Rat) / 35) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5976 : Rat) / 35) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term (108 : Rat) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-284 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(0, 2), (3, 1), (11, 1), (13, 2)],
  term ((-66 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 35) [(0, 2), (3, 1), (11, 2), (13, 1)],
  term ((24 : Rat) / 5) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3468 : Rat) / 35) [(0, 2), (3, 1), (13, 1)],
  term ((-162 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((146 : Rat) / 5) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(0, 2), (3, 1), (15, 1)],
  term ((6 : Rat) / 25) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1)],
  term ((576 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1)],
  term ((144 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 35) [(0, 2), (4, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (5, 1), (7, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (7, 1), (14, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(0, 2), (5, 1), (11, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(0, 2), (5, 1), (11, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((1248 : Rat) / 35) [(0, 2), (5, 1), (11, 2), (13, 1)],
  term ((-276 : Rat) / 35) [(0, 2), (5, 1), (13, 1)],
  term (12 : Rat) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(0, 2), (5, 1), (15, 1)],
  term ((-36 : Rat) / 35) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(0, 2), (7, 1), (11, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1362 : Rat) / 35) [(0, 2), (7, 1), (13, 1)],
  term ((408 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2379 : Rat) / 25) [(0, 2), (7, 1), (15, 1)],
  term ((738 : Rat) / 25) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(0, 2), (8, 1)],
  term ((-1728 : Rat) / 7) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((2592 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2592 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 7) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(0, 2), (8, 1), (14, 1)],
  term ((552 : Rat) / 5) [(0, 2), (9, 1), (11, 1)],
  term ((-10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 7) [(0, 2), (9, 1), (11, 1), (13, 2)],
  term ((10368 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((22152 : Rat) / 35) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2952 : Rat) / 35) [(0, 2), (9, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(0, 2), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(0, 2), (9, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2988 : Rat) / 35) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (-216 : Rat) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((568 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((132 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((156 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 35) [(1, 1), (3, 1), (11, 1), (13, 3)],
  term ((-48 : Rat) / 5) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (3, 1), (11, 2), (13, 2)],
  term ((96 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 25) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((6936 : Rat) / 35) [(1, 1), (3, 1), (13, 2)],
  term ((324 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-292 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2)],
  term ((-288 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 5) [(1, 1), (3, 2), (9, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 35) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 7) [(1, 1), (5, 1), (8, 1), (13, 2)],
  term ((288 : Rat) / 7) [(1, 1), (5, 1), (9, 1), (11, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((24 : Rat) / 5) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((3456 : Rat) / 35) [(1, 1), (5, 1), (11, 1), (13, 3)],
  term ((-2496 : Rat) / 35) [(1, 1), (5, 1), (11, 2), (13, 2)],
  term ((48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((552 : Rat) / 35) [(1, 1), (5, 1), (13, 2)],
  term (-24 : Rat) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((72 : Rat) / 35) [(1, 1), (7, 1), (8, 1), (13, 2)],
  term ((144 : Rat) / 35) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 2)],
  term ((-72 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((96 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((4758 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1476 : Rat) / 25) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2724 : Rat) / 35) [(1, 1), (7, 1), (13, 2)],
  term ((-816 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((5184 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 7) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-5184 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1224 : Rat) / 7) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-552 : Rat) / 5) [(1, 1), (8, 1), (13, 1)],
  term ((432 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1104 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((13824 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 3)],
  term ((-20736 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1)],
  term ((6912 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44304 : Rat) / 35) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((13248 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term ((-4416 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5904 : Rat) / 35) [(1, 1), (9, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 7) [(1, 1), (9, 2), (11, 1), (13, 2)],
  term ((-3456 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-5976 : Rat) / 35) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((1728 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term (108 : Rat) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-284 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(1, 2), (3, 1), (11, 1), (13, 2)],
  term ((-66 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-78 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((72 : Rat) / 35) [(1, 2), (3, 1), (11, 2), (13, 1)],
  term ((24 : Rat) / 5) [(1, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3468 : Rat) / 35) [(1, 2), (3, 1), (13, 1)],
  term ((-162 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((146 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 25) [(1, 2), (3, 1), (15, 1)],
  term ((6 : Rat) / 25) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (7, 1), (9, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1)],
  term ((576 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (11, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((216 : Rat) / 35) [(1, 2), (4, 1), (11, 1), (13, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (5, 1), (7, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (7, 1), (14, 1)],
  term ((-72 : Rat) / 7) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 7) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1)],
  term ((12 : Rat) / 5) [(1, 2), (5, 1), (11, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1728 : Rat) / 35) [(1, 2), (5, 1), (11, 1), (13, 2)],
  term ((-12 : Rat) / 5) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((1248 : Rat) / 35) [(1, 2), (5, 1), (11, 2), (13, 1)],
  term ((-276 : Rat) / 35) [(1, 2), (5, 1), (13, 1)],
  term (12 : Rat) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((-24 : Rat) / 5) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(1, 2), (5, 1), (15, 1)],
  term ((-36 : Rat) / 35) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((36 : Rat) / 5) [(1, 2), (7, 1), (11, 1)],
  term ((-48 : Rat) / 5) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1362 : Rat) / 35) [(1, 2), (7, 1), (13, 1)],
  term ((408 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2379 : Rat) / 25) [(1, 2), (7, 1), (15, 1)],
  term ((738 : Rat) / 25) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(1, 2), (8, 1)],
  term ((-1728 : Rat) / 7) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((2592 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((432 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2592 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 7) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-216 : Rat) / 5) [(1, 2), (8, 1), (14, 1)],
  term ((552 : Rat) / 5) [(1, 2), (9, 1), (11, 1)],
  term ((-10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 7) [(1, 2), (9, 1), (11, 1), (13, 2)],
  term ((10368 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3456 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-432 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((22152 : Rat) / 35) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(1, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2952 : Rat) / 35) [(1, 2), (9, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((864 : Rat) / 5) [(1, 2), (9, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 7) [(1, 2), (9, 2), (11, 1), (13, 1)],
  term ((1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2988 : Rat) / 35) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term (216 : Rat) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-568 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term (-108 : Rat) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((144 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-156 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-132 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((236 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term (-108 : Rat) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((144 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((284 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-568 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term (216 : Rat) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((-288 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-132 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-156 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((144 : Rat) / 35) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-96 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-288 : Rat) / 35) [(3, 1), (11, 1), (13, 3), (15, 1)],
  term ((66 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((78 : Rat) / 5) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((66 : Rat) / 5) [(3, 1), (11, 1), (14, 3)],
  term ((24 : Rat) / 5) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((78 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((48 : Rat) / 5) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (14, 2)],
  term ((-72 : Rat) / 35) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((48 : Rat) / 5) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 35) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-6936 : Rat) / 35) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((292 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((144 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 25) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((12 : Rat) / 25) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((162 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-72 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3468 : Rat) / 35) [(3, 1), (13, 1), (14, 2)],
  term ((-146 : Rat) / 5) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((162 : Rat) / 5) [(3, 1), (13, 1), (14, 3)],
  term ((-72 : Rat) / 5) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((16668 : Rat) / 175) [(3, 1), (13, 1), (15, 2)],
  term ((-718 : Rat) / 25) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-324 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((144 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6936 : Rat) / 35) [(3, 1), (13, 2), (15, 1)],
  term ((292 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 25) [(3, 1), (14, 2), (15, 1)],
  term ((-6 : Rat) / 25) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 25) [(3, 1), (15, 3)],
  term ((-6 : Rat) / 25) [(3, 1), (15, 3), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 3)],
  term ((48 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((96 : Rat) / 5) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term (-288 : Rat) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2)],
  term (96 : Rat) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 3)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-384 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 2)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((432 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 3)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((864 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 3)],
  term ((48 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-288 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((96 : Rat) / 5) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((288 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-192 : Rat) / 5) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((432 : Rat) / 35) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-216 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-216 : Rat) / 35) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((432 : Rat) / 35) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (12, 1), (14, 2)],
  term ((24 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (14, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (7, 1), (14, 3)],
  term ((12 : Rat) / 5) [(5, 1), (7, 1), (15, 2)],
  term ((-144 : Rat) / 7) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 7) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((72 : Rat) / 7) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 7) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((-288 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((144 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-288 : Rat) / 7) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 35) [(5, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-48 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (14, 3)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((48 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (11, 1), (12, 2), (14, 2)],
  term ((-24 : Rat) / 5) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2), (14, 2)],
  term ((1728 : Rat) / 35) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-3456 : Rat) / 35) [(5, 1), (11, 1), (13, 3), (15, 1)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (14, 2)],
  term ((12 : Rat) / 5) [(5, 1), (11, 1), (14, 3)],
  term ((-12 : Rat) / 5) [(5, 1), (11, 1), (15, 2)],
  term ((2496 : Rat) / 35) [(5, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1), (14, 2)],
  term ((-1248 : Rat) / 35) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((2496 : Rat) / 35) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-552 : Rat) / 35) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term (24 : Rat) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((48 : Rat) / 5) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-108 : Rat) / 5) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((276 : Rat) / 35) [(5, 1), (13, 1), (14, 2)],
  term (-12 : Rat) [(5, 1), (13, 1), (14, 3)],
  term ((612 : Rat) / 35) [(5, 1), (13, 1), (15, 2)],
  term (24 : Rat) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-552 : Rat) / 35) [(5, 1), (13, 2), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (14, 1), (15, 3)],
  term ((-24 : Rat) / 5) [(5, 1), (14, 2), (15, 1)],
  term ((24 : Rat) / 5) [(5, 1), (14, 3), (15, 1)],
  term ((-24 : Rat) / 5) [(5, 1), (15, 3)],
  term ((-72 : Rat) / 35) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((36 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((36 : Rat) / 35) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-72 : Rat) / 35) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((72 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 35) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((72 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-96 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((72 : Rat) / 5) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (14, 2)],
  term ((48 : Rat) / 5) [(7, 1), (11, 1), (14, 3)],
  term ((-36 : Rat) / 5) [(7, 1), (11, 1), (15, 2)],
  term ((-2724 : Rat) / 35) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((816 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-288 : Rat) / 5) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4758 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1476 : Rat) / 25) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-384 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((144 : Rat) / 5) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1362 : Rat) / 35) [(7, 1), (13, 1), (14, 2)],
  term ((-72 : Rat) / 5) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-408 : Rat) / 5) [(7, 1), (13, 1), (14, 3)],
  term ((144 : Rat) / 5) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-26496 : Rat) / 175) [(7, 1), (13, 1), (15, 2)],
  term ((1116 : Rat) / 25) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((816 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2724 : Rat) / 35) [(7, 1), (13, 2), (15, 1)],
  term ((144 : Rat) / 5) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (14, 1), (15, 3)],
  term ((2379 : Rat) / 25) [(7, 1), (14, 2), (15, 1)],
  term ((-738 : Rat) / 25) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (14, 3), (15, 1)],
  term ((2379 : Rat) / 25) [(7, 1), (15, 3)],
  term ((-738 : Rat) / 25) [(7, 1), (15, 3), (16, 1)],
  term ((-3456 : Rat) / 7) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5184 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1728 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5184 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2592 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1728 : Rat) / 7) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((-432 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2592 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 3)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-27648 : Rat) / 35) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((1296 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5184 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 7) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((2592 : Rat) / 5) [(8, 1), (9, 1), (15, 3)],
  term ((-864 : Rat) / 5) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1224 : Rat) / 7) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-612 : Rat) / 7) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((144 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((9036 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-432 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((576 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1224 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 3)],
  term ((288 : Rat) / 5) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((552 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(8, 1), (12, 1), (14, 2)],
  term ((-432 : Rat) / 5) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((552 : Rat) / 5) [(8, 1), (13, 1), (15, 1)],
  term ((216 : Rat) / 5) [(8, 1), (14, 1), (15, 2)],
  term ((-276 : Rat) / 5) [(8, 1), (14, 2)],
  term ((216 : Rat) / 5) [(8, 1), (14, 3)],
  term ((-276 : Rat) / 5) [(8, 1), (15, 2)],
  term ((-20736 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 2)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-864 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10368 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3456 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((6912 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-1728 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-10368 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 3), (16, 1)],
  term ((-110592 : Rat) / 35) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((5184 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((20736 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-6912 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 7) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((3456 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (14, 2)],
  term ((432 : Rat) / 5) [(9, 1), (11, 1), (14, 3)],
  term ((-552 : Rat) / 5) [(9, 1), (11, 1), (15, 2)],
  term ((44304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((13248 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4416 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22152 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((1104 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((6624 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (14, 3), (16, 1)],
  term ((70584 : Rat) / 35) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3312 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-13248 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((44304 : Rat) / 35) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6624 : Rat) / 5) [(9, 1), (11, 2), (15, 3)],
  term ((2208 : Rat) / 5) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((5904 : Rat) / 35) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((576 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2952 : Rat) / 35) [(9, 1), (13, 1), (14, 2)],
  term ((144 : Rat) / 5) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((864 : Rat) / 5) [(9, 1), (13, 1), (14, 3)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((9144 : Rat) / 35) [(9, 1), (13, 1), (15, 2)],
  term ((-432 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((576 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5904 : Rat) / 35) [(9, 1), (13, 2), (15, 1)],
  term ((-288 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (14, 2), (15, 1)],
  term ((288 : Rat) / 5) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(9, 1), (15, 3)],
  term ((288 : Rat) / 5) [(9, 1), (15, 3), (16, 1)],
  term ((-2304 : Rat) / 7) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1152 : Rat) / 7) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((-288 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1728 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-18432 : Rat) / 35) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((864 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 7) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((576 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(9, 2), (11, 1), (15, 3)],
  term ((-576 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((864 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-2988 : Rat) / 35) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1728 : Rat) / 5) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((5976 : Rat) / 35) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((5976 : Rat) / 35) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1728 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 299. -/
theorem rs_R006_ueqv_R006_block_27_0200_0299_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_27_0200_0299
      rs_R006_ueqv_R006_block_27_0200_0299 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
