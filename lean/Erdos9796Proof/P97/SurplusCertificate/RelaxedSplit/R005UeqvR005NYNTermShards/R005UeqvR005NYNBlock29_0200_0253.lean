/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 29:200-253

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_29_0200_0253 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (14, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (15, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0200 : Poly :=
[
  term ((-12806592 : Rat) / 385571) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0200 : Poly :=
[
  term ((25613184 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0200_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0200
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0201 : Poly :=
[
  term ((-2417740 : Rat) / 52799) [(5, 1), (15, 1)]
]

/-- Partial product 201 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0201 : Poly :=
[
  term ((4835480 : Rat) / 52799) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2417740 : Rat) / 52799) [(0, 2), (5, 1), (15, 1)],
  term ((4835480 : Rat) / 52799) [(1, 1), (5, 1), (15, 2)],
  term ((-2417740 : Rat) / 52799) [(1, 2), (5, 1), (15, 1)],
  term ((-4835480 : Rat) / 52799) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((2417740 : Rat) / 52799) [(4, 2), (5, 1), (15, 1)],
  term ((-4835480 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((2417740 : Rat) / 52799) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0201_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0201
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0202 : Poly :=
[
  term ((4234780 : Rat) / 385571) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0202 : Poly :=
[
  term ((-8469560 : Rat) / 385571) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((4234780 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8469560 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((4234780 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((8469560 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4234780 : Rat) / 385571) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((8469560 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((-4234780 : Rat) / 385571) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0202_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0202
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0203 : Poly :=
[
  term ((-3216320 : Rat) / 158397) [(6, 1), (15, 2)]
]

/-- Partial product 203 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0203 : Poly :=
[
  term ((6432640 : Rat) / 158397) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3216320 : Rat) / 158397) [(0, 2), (6, 1), (15, 2)],
  term ((6432640 : Rat) / 158397) [(1, 1), (6, 1), (15, 3)],
  term ((-3216320 : Rat) / 158397) [(1, 2), (6, 1), (15, 2)],
  term ((-6432640 : Rat) / 158397) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((3216320 : Rat) / 158397) [(4, 2), (6, 1), (15, 2)],
  term ((-6432640 : Rat) / 158397) [(5, 1), (6, 1), (15, 3)],
  term ((3216320 : Rat) / 158397) [(5, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0203_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0203
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0204 : Poly :=
[
  term ((23827616 : Rat) / 385571) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0204 : Poly :=
[
  term ((-47655232 : Rat) / 385571) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((23827616 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-47655232 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((23827616 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((47655232 : Rat) / 385571) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23827616 : Rat) / 385571) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((47655232 : Rat) / 385571) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-23827616 : Rat) / 385571) [(5, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0204_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0204
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0205 : Poly :=
[
  term ((-37600 : Rat) / 4281) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0205 : Poly :=
[
  term ((75200 : Rat) / 4281) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-37600 : Rat) / 4281) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((75200 : Rat) / 4281) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-37600 : Rat) / 4281) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-75200 : Rat) / 4281) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((37600 : Rat) / 4281) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-75200 : Rat) / 4281) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((37600 : Rat) / 4281) [(5, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0205_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0205
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0206 : Poly :=
[
  term ((33017764 : Rat) / 385571) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0206 : Poly :=
[
  term ((-66035528 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((33017764 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66035528 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((33017764 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((66035528 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33017764 : Rat) / 385571) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((66035528 : Rat) / 385571) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33017764 : Rat) / 385571) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0206_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0206
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0207 : Poly :=
[
  term ((589840 : Rat) / 158397) [(7, 1), (15, 1)]
]

/-- Partial product 207 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0207 : Poly :=
[
  term ((-1179680 : Rat) / 158397) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((589840 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((-1179680 : Rat) / 158397) [(1, 1), (7, 1), (15, 2)],
  term ((589840 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)],
  term ((1179680 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-589840 : Rat) / 158397) [(4, 2), (7, 1), (15, 1)],
  term ((1179680 : Rat) / 158397) [(5, 1), (7, 1), (15, 2)],
  term ((-589840 : Rat) / 158397) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0207_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0207
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0208 : Poly :=
[
  term ((-2747506 : Rat) / 385571) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0208 : Poly :=
[
  term ((5495012 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2747506 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((5495012 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2747506 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5495012 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2747506 : Rat) / 385571) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5495012 : Rat) / 385571) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2747506 : Rat) / 385571) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0208_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0208
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0209 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 209 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0209 : Poly :=
[
  term ((5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2781440 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5562880 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((2781440 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0209_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0209
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0210 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0210 : Poly :=
[
  term ((148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-148702016 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((74351008 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0210_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0210
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0211 : Poly :=
[
  term ((1390720 : Rat) / 158397) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 211 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0211 : Poly :=
[
  term ((-2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1390720 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1390720 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0211_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0211
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0212 : Poly :=
[
  term ((37175504 : Rat) / 385571) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0212 : Poly :=
[
  term ((-74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-37175504 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0212_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0212
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0213 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 213 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0213 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0213_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0213
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0214 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0214 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0214_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0214
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0215 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0215 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((5181440 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5181440 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0215_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0215
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0216 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0216 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((21092000 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0216_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0216
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0217 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 217 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0217 : Poly :=
[
  term ((3112960 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0217_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0217
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0218 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0218 : Poly :=
[
  term ((-9166080 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0218_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0218
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0219 : Poly :=
[
  term ((778240 : Rat) / 52799) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 219 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0219 : Poly :=
[
  term ((-1556480 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0219_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0219
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0220 : Poly :=
[
  term ((-2291520 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0220 : Poly :=
[
  term ((4583040 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0220_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0220
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0221 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 221 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0221 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0221_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0221
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0222 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0222 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0222_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0222
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0223 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 223 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0223 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((2007040 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0223_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0223
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0224 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0224 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0224_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0224
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0225 : Poly :=
[
  term ((9275968 : Rat) / 158397) [(8, 1), (15, 2)]
]

/-- Partial product 225 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0225 : Poly :=
[
  term ((-18551936 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((9275968 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-18551936 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((9275968 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((18551936 : Rat) / 158397) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-9275968 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((18551936 : Rat) / 158397) [(5, 1), (8, 1), (15, 3)],
  term ((-9275968 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0225_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0225
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0226 : Poly :=
[
  term ((-24748120 : Rat) / 385571) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0226 : Poly :=
[
  term ((49496240 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24748120 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((49496240 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-24748120 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-49496240 : Rat) / 385571) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((24748120 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-49496240 : Rat) / 385571) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((24748120 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0226_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0226
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0227 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0227 : Poly :=
[
  term ((-8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4460800 : Rat) / 158397) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0227_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0227
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0228 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0228 : Poly :=
[
  term ((-113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0228_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0228
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0229 : Poly :=
[
  term ((-2230400 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 229 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0229 : Poly :=
[
  term ((4460800 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-2230400 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2230400 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((2230400 : Rat) / 158397) [(5, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0229_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0229
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0230 : Poly :=
[
  term ((-28348144 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0230 : Poly :=
[
  term ((56696288 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((28348144 : Rat) / 385571) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0230_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0230
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0231 : Poly :=
[
  term ((-33392128 : Rat) / 158397) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 231 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0231 : Poly :=
[
  term ((66784256 : Rat) / 158397) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-33392128 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((66784256 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-33392128 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-66784256 : Rat) / 158397) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((33392128 : Rat) / 158397) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-66784256 : Rat) / 158397) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((33392128 : Rat) / 158397) [(5, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0231_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0231
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0232 : Poly :=
[
  term ((25271248 : Rat) / 385571) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0232 : Poly :=
[
  term ((-50542496 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((25271248 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50542496 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((25271248 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((50542496 : Rat) / 385571) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25271248 : Rat) / 385571) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((50542496 : Rat) / 385571) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25271248 : Rat) / 385571) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0232_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0232
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0233 : Poly :=
[
  term ((20113376 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 233 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0233 : Poly :=
[
  term ((-40226752 : Rat) / 158397) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((20113376 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((-40226752 : Rat) / 158397) [(1, 1), (9, 1), (15, 2)],
  term ((20113376 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((40226752 : Rat) / 158397) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-20113376 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((40226752 : Rat) / 158397) [(5, 1), (9, 1), (15, 2)],
  term ((-20113376 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0233_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0233
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0234 : Poly :=
[
  term ((-20272676 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0234 : Poly :=
[
  term ((40545352 : Rat) / 385571) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20272676 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((40545352 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-20272676 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-40545352 : Rat) / 385571) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20272676 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-40545352 : Rat) / 385571) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((20272676 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0234_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0234
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0235 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(10, 1), (15, 2)]
]

/-- Partial product 235 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0235 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (10, 1), (15, 3)],
  term ((-778240 : Rat) / 52799) [(1, 2), (10, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(4, 2), (10, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(5, 1), (10, 1), (15, 3)],
  term ((778240 : Rat) / 52799) [(5, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0235_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0235
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0236 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0236 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0236_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0236
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0237 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 237 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0237 : Poly :=
[
  term ((-20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-10362880 : Rat) / 158397) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0237_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0237
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0238 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0238 : Poly :=
[
  term ((84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((42184000 : Rat) / 385571) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0238_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0238
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0239 : Poly :=
[
  term ((-5181440 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 239 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0239 : Poly :=
[
  term ((10362880 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((5181440 : Rat) / 158397) [(5, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0239_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0239
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0240 : Poly :=
[
  term ((21092000 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0240 : Poly :=
[
  term ((-42184000 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0240_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0240
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0241 : Poly :=
[
  term ((-4409728 : Rat) / 158397) [(11, 1), (15, 1)]
]

/-- Partial product 241 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0241 : Poly :=
[
  term ((8819456 : Rat) / 158397) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4409728 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((8819456 : Rat) / 158397) [(1, 1), (11, 1), (15, 2)],
  term ((-4409728 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((-8819456 : Rat) / 158397) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((4409728 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((-8819456 : Rat) / 158397) [(5, 1), (11, 1), (15, 2)],
  term ((4409728 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0241_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0241
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0242 : Poly :=
[
  term ((-2416244 : Rat) / 385571) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0242 : Poly :=
[
  term ((4832488 : Rat) / 385571) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2416244 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((4832488 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2416244 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4832488 : Rat) / 385571) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2416244 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4832488 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((2416244 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0242_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0242
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0243 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 243 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0243 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term ((4014080 : Rat) / 158397) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((4014080 : Rat) / 158397) [(5, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0243_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0243
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0244 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0244 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0244_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0244
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0245 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 245 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0245 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (12, 1), (15, 3)],
  term ((2007040 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(4, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 1), (15, 3)],
  term ((-2007040 : Rat) / 158397) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0245_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0245
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0246 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0246 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((9973120 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0246_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0246
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0247 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 247 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0247 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(5, 1), (13, 1), (15, 2)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0247_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0247
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0248 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0248 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0248_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0248
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0249 : Poly :=
[
  term ((-422702 : Rat) / 52799) [(14, 1)]
]

/-- Partial product 249 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0249 : Poly :=
[
  term ((845404 : Rat) / 52799) [(0, 1), (14, 2)],
  term ((-422702 : Rat) / 52799) [(0, 2), (14, 1)],
  term ((845404 : Rat) / 52799) [(1, 1), (14, 1), (15, 1)],
  term ((-422702 : Rat) / 52799) [(1, 2), (14, 1)],
  term ((-845404 : Rat) / 52799) [(4, 1), (14, 2)],
  term ((422702 : Rat) / 52799) [(4, 2), (14, 1)],
  term ((-845404 : Rat) / 52799) [(5, 1), (14, 1), (15, 1)],
  term ((422702 : Rat) / 52799) [(5, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0249_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0249
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0250 : Poly :=
[
  term ((-3399680 : Rat) / 158397) [(14, 1), (15, 2)]
]

/-- Partial product 250 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0250 : Poly :=
[
  term ((6799360 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((-3399680 : Rat) / 158397) [(0, 2), (14, 1), (15, 2)],
  term ((6799360 : Rat) / 158397) [(1, 1), (14, 1), (15, 3)],
  term ((-3399680 : Rat) / 158397) [(1, 2), (14, 1), (15, 2)],
  term ((-6799360 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((3399680 : Rat) / 158397) [(4, 2), (14, 1), (15, 2)],
  term ((-6799360 : Rat) / 158397) [(5, 1), (14, 1), (15, 3)],
  term ((3399680 : Rat) / 158397) [(5, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0250_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0250
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0251 : Poly :=
[
  term ((135488 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0251 : Poly :=
[
  term ((-270976 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((135488 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-270976 : Rat) / 385571) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((135488 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((270976 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-135488 : Rat) / 385571) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((270976 : Rat) / 385571) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-135488 : Rat) / 385571) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0251_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0251
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0252 : Poly :=
[
  term ((-180272 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 252 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0252 : Poly :=
[
  term ((360544 : Rat) / 52799) [(0, 1), (14, 1), (15, 2)],
  term ((-180272 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((360544 : Rat) / 52799) [(1, 1), (15, 3)],
  term ((-180272 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-360544 : Rat) / 52799) [(4, 1), (14, 1), (15, 2)],
  term ((180272 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((-360544 : Rat) / 52799) [(5, 1), (15, 3)],
  term ((180272 : Rat) / 52799) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0252_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0252
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 29. -/
def rs_R005_ueqv_R005NYN_coefficient_29_0253 : Poly :=
[
  term ((14529144 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 253 for generator 29. -/
def rs_R005_ueqv_R005NYN_partial_29_0253 : Poly :=
[
  term ((-29058288 : Rat) / 385571) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((14529144 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((-29058288 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)],
  term ((14529144 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((29058288 : Rat) / 385571) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14529144 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((29058288 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)],
  term ((-14529144 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 29. -/
theorem rs_R005_ueqv_R005NYN_partial_29_0253_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_29_0253
        rs_R005_ueqv_R005NYN_generator_29_0200_0253 =
      rs_R005_ueqv_R005NYN_partial_29_0253 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_29_0200_0253 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_29_0200,
  rs_R005_ueqv_R005NYN_partial_29_0201,
  rs_R005_ueqv_R005NYN_partial_29_0202,
  rs_R005_ueqv_R005NYN_partial_29_0203,
  rs_R005_ueqv_R005NYN_partial_29_0204,
  rs_R005_ueqv_R005NYN_partial_29_0205,
  rs_R005_ueqv_R005NYN_partial_29_0206,
  rs_R005_ueqv_R005NYN_partial_29_0207,
  rs_R005_ueqv_R005NYN_partial_29_0208,
  rs_R005_ueqv_R005NYN_partial_29_0209,
  rs_R005_ueqv_R005NYN_partial_29_0210,
  rs_R005_ueqv_R005NYN_partial_29_0211,
  rs_R005_ueqv_R005NYN_partial_29_0212,
  rs_R005_ueqv_R005NYN_partial_29_0213,
  rs_R005_ueqv_R005NYN_partial_29_0214,
  rs_R005_ueqv_R005NYN_partial_29_0215,
  rs_R005_ueqv_R005NYN_partial_29_0216,
  rs_R005_ueqv_R005NYN_partial_29_0217,
  rs_R005_ueqv_R005NYN_partial_29_0218,
  rs_R005_ueqv_R005NYN_partial_29_0219,
  rs_R005_ueqv_R005NYN_partial_29_0220,
  rs_R005_ueqv_R005NYN_partial_29_0221,
  rs_R005_ueqv_R005NYN_partial_29_0222,
  rs_R005_ueqv_R005NYN_partial_29_0223,
  rs_R005_ueqv_R005NYN_partial_29_0224,
  rs_R005_ueqv_R005NYN_partial_29_0225,
  rs_R005_ueqv_R005NYN_partial_29_0226,
  rs_R005_ueqv_R005NYN_partial_29_0227,
  rs_R005_ueqv_R005NYN_partial_29_0228,
  rs_R005_ueqv_R005NYN_partial_29_0229,
  rs_R005_ueqv_R005NYN_partial_29_0230,
  rs_R005_ueqv_R005NYN_partial_29_0231,
  rs_R005_ueqv_R005NYN_partial_29_0232,
  rs_R005_ueqv_R005NYN_partial_29_0233,
  rs_R005_ueqv_R005NYN_partial_29_0234,
  rs_R005_ueqv_R005NYN_partial_29_0235,
  rs_R005_ueqv_R005NYN_partial_29_0236,
  rs_R005_ueqv_R005NYN_partial_29_0237,
  rs_R005_ueqv_R005NYN_partial_29_0238,
  rs_R005_ueqv_R005NYN_partial_29_0239,
  rs_R005_ueqv_R005NYN_partial_29_0240,
  rs_R005_ueqv_R005NYN_partial_29_0241,
  rs_R005_ueqv_R005NYN_partial_29_0242,
  rs_R005_ueqv_R005NYN_partial_29_0243,
  rs_R005_ueqv_R005NYN_partial_29_0244,
  rs_R005_ueqv_R005NYN_partial_29_0245,
  rs_R005_ueqv_R005NYN_partial_29_0246,
  rs_R005_ueqv_R005NYN_partial_29_0247,
  rs_R005_ueqv_R005NYN_partial_29_0248,
  rs_R005_ueqv_R005NYN_partial_29_0249,
  rs_R005_ueqv_R005NYN_partial_29_0250,
  rs_R005_ueqv_R005NYN_partial_29_0251,
  rs_R005_ueqv_R005NYN_partial_29_0252,
  rs_R005_ueqv_R005NYN_partial_29_0253
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_29_0200_0253 : Poly :=
[
  term ((4835480 : Rat) / 52799) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-8469560 : Rat) / 385571) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((25613184 : Rat) / 385571) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((6432640 : Rat) / 158397) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-47655232 : Rat) / 385571) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1179680 : Rat) / 158397) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((5495012 : Rat) / 385571) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((75200 : Rat) / 4281) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-66035528 : Rat) / 385571) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5562880 : Rat) / 158397) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((148702016 : Rat) / 385571) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3112960 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-9166080 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18551936 : Rat) / 158397) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((49496240 : Rat) / 385571) [(0, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40226752 : Rat) / 158397) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((40545352 : Rat) / 385571) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((66784256 : Rat) / 158397) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-50542496 : Rat) / 385571) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((8819456 : Rat) / 158397) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((4832488 : Rat) / 385571) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((360544 : Rat) / 52799) [(0, 1), (14, 1), (15, 2)],
  term ((-29058288 : Rat) / 385571) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((845404 : Rat) / 52799) [(0, 1), (14, 2)],
  term ((6799360 : Rat) / 158397) [(0, 1), (14, 2), (15, 2)],
  term ((-270976 : Rat) / 385571) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2417740 : Rat) / 52799) [(0, 2), (5, 1), (15, 1)],
  term ((4234780 : Rat) / 385571) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(0, 2), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-37600 : Rat) / 4281) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((33017764 : Rat) / 385571) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((589840 : Rat) / 158397) [(0, 2), (7, 1), (15, 1)],
  term ((-2747506 : Rat) / 385571) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(0, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9275968 : Rat) / 158397) [(0, 2), (8, 1), (15, 2)],
  term ((-24748120 : Rat) / 385571) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33392128 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((25271248 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20113376 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((-20272676 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (10, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4409728 : Rat) / 158397) [(0, 2), (11, 1), (15, 1)],
  term ((-2416244 : Rat) / 385571) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422702 : Rat) / 52799) [(0, 2), (14, 1)],
  term ((-3399680 : Rat) / 158397) [(0, 2), (14, 1), (15, 2)],
  term ((135488 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-180272 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((14529144 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((25613184 : Rat) / 385571) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((4835480 : Rat) / 52799) [(1, 1), (5, 1), (15, 2)],
  term ((-8469560 : Rat) / 385571) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((6432640 : Rat) / 158397) [(1, 1), (6, 1), (15, 3)],
  term ((-47655232 : Rat) / 385571) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((75200 : Rat) / 4281) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-66035528 : Rat) / 385571) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1179680 : Rat) / 158397) [(1, 1), (7, 1), (15, 2)],
  term ((5495012 : Rat) / 385571) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((5562880 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((148702016 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((-74351008 : Rat) / 385571) [(1, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3112960 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-18551936 : Rat) / 158397) [(1, 1), (8, 1), (15, 3)],
  term ((49496240 : Rat) / 385571) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((56696288 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((66784256 : Rat) / 158397) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-50542496 : Rat) / 385571) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40226752 : Rat) / 158397) [(1, 1), (9, 1), (15, 2)],
  term ((40545352 : Rat) / 385571) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (10, 1), (15, 3)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((8819456 : Rat) / 158397) [(1, 1), (11, 1), (15, 2)],
  term ((4832488 : Rat) / 385571) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (12, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((845404 : Rat) / 52799) [(1, 1), (14, 1), (15, 1)],
  term ((6799360 : Rat) / 158397) [(1, 1), (14, 1), (15, 3)],
  term ((-270976 : Rat) / 385571) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((360544 : Rat) / 52799) [(1, 1), (15, 3)],
  term ((-29058288 : Rat) / 385571) [(1, 1), (15, 3), (16, 1)],
  term ((-12806592 : Rat) / 385571) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2417740 : Rat) / 52799) [(1, 2), (5, 1), (15, 1)],
  term ((4234780 : Rat) / 385571) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3216320 : Rat) / 158397) [(1, 2), (6, 1), (15, 2)],
  term ((23827616 : Rat) / 385571) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-37600 : Rat) / 4281) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((33017764 : Rat) / 385571) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((589840 : Rat) / 158397) [(1, 2), (7, 1), (15, 1)],
  term ((-2747506 : Rat) / 385571) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2781440 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-74351008 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1390720 : Rat) / 158397) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((37175504 : Rat) / 385571) [(1, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((9275968 : Rat) / 158397) [(1, 2), (8, 1), (15, 2)],
  term ((-24748120 : Rat) / 385571) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-33392128 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((25271248 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20113376 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((-20272676 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (10, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4409728 : Rat) / 158397) [(1, 2), (11, 1), (15, 1)],
  term ((-2416244 : Rat) / 385571) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-422702 : Rat) / 52799) [(1, 2), (14, 1)],
  term ((-3399680 : Rat) / 158397) [(1, 2), (14, 1), (15, 2)],
  term ((135488 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-180272 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((14529144 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-4835480 : Rat) / 52799) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((8469560 : Rat) / 385571) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25613184 : Rat) / 385571) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((47655232 : Rat) / 385571) [(4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1179680 : Rat) / 158397) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-5495012 : Rat) / 385571) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-75200 : Rat) / 4281) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((66035528 : Rat) / 385571) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148702016 : Rat) / 385571) [(4, 1), (8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((84368000 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((9166080 : Rat) / 385571) [(4, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(4, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(4, 1), (8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((18551936 : Rat) / 158397) [(4, 1), (8, 1), (14, 1), (15, 2)],
  term ((-49496240 : Rat) / 385571) [(4, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((113392576 : Rat) / 385571) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((40226752 : Rat) / 158397) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-40545352 : Rat) / 385571) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66784256 : Rat) / 158397) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((50542496 : Rat) / 385571) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8819456 : Rat) / 158397) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4832488 : Rat) / 385571) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term ((39892480 : Rat) / 385571) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-360544 : Rat) / 52799) [(4, 1), (14, 1), (15, 2)],
  term ((29058288 : Rat) / 385571) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-845404 : Rat) / 52799) [(4, 1), (14, 2)],
  term ((-6799360 : Rat) / 158397) [(4, 1), (14, 2), (15, 2)],
  term ((270976 : Rat) / 385571) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2417740 : Rat) / 52799) [(4, 2), (5, 1), (15, 1)],
  term ((-4234780 : Rat) / 385571) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((3216320 : Rat) / 158397) [(4, 2), (6, 1), (15, 2)],
  term ((-23827616 : Rat) / 385571) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((37600 : Rat) / 4281) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-33017764 : Rat) / 385571) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-589840 : Rat) / 158397) [(4, 2), (7, 1), (15, 1)],
  term ((2747506 : Rat) / 385571) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(4, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(4, 2), (8, 1), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9275968 : Rat) / 158397) [(4, 2), (8, 1), (15, 2)],
  term ((24748120 : Rat) / 385571) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((33392128 : Rat) / 158397) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-25271248 : Rat) / 385571) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20113376 : Rat) / 158397) [(4, 2), (9, 1), (15, 1)],
  term ((20272676 : Rat) / 385571) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(4, 2), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4409728 : Rat) / 158397) [(4, 2), (11, 1), (15, 1)],
  term ((2416244 : Rat) / 385571) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(4, 2), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(4, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((422702 : Rat) / 52799) [(4, 2), (14, 1)],
  term ((3399680 : Rat) / 158397) [(4, 2), (14, 1), (15, 2)],
  term ((-135488 : Rat) / 385571) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((180272 : Rat) / 52799) [(4, 2), (15, 2)],
  term ((-14529144 : Rat) / 385571) [(4, 2), (15, 2), (16, 1)],
  term ((-6432640 : Rat) / 158397) [(5, 1), (6, 1), (15, 3)],
  term ((47655232 : Rat) / 385571) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-75200 : Rat) / 4281) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((66035528 : Rat) / 385571) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((1179680 : Rat) / 158397) [(5, 1), (7, 1), (15, 2)],
  term ((-5495012 : Rat) / 385571) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-5562880 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-148702016 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2781440 : Rat) / 158397) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2)],
  term ((74351008 : Rat) / 385571) [(5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((84368000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10362880 : Rat) / 158397) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42184000 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3112960 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((9166080 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1556480 : Rat) / 52799) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 3)],
  term ((-39892480 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(5, 1), (8, 1), (12, 1), (15, 3)],
  term ((19946240 : Rat) / 385571) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((18551936 : Rat) / 158397) [(5, 1), (8, 1), (15, 3)],
  term ((-49496240 : Rat) / 385571) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((8921600 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((113392576 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-56696288 : Rat) / 385571) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-66784256 : Rat) / 158397) [(5, 1), (9, 1), (14, 1), (15, 2)],
  term ((50542496 : Rat) / 385571) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((40226752 : Rat) / 158397) [(5, 1), (9, 1), (15, 2)],
  term ((-40545352 : Rat) / 385571) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(5, 1), (10, 1), (15, 3)],
  term ((4583040 : Rat) / 385571) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((20725760 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-84368000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((42184000 : Rat) / 385571) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8819456 : Rat) / 158397) [(5, 1), (11, 1), (15, 2)],
  term ((-4832488 : Rat) / 385571) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((39892480 : Rat) / 385571) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4014080 : Rat) / 158397) [(5, 1), (12, 1), (15, 3)],
  term ((-19946240 : Rat) / 385571) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((1357760 : Rat) / 52799) [(5, 1), (13, 1), (15, 2)],
  term ((-36665208 : Rat) / 385571) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-845404 : Rat) / 52799) [(5, 1), (14, 1), (15, 1)],
  term ((-6799360 : Rat) / 158397) [(5, 1), (14, 1), (15, 3)],
  term ((270976 : Rat) / 385571) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-360544 : Rat) / 52799) [(5, 1), (15, 3)],
  term ((29058288 : Rat) / 385571) [(5, 1), (15, 3), (16, 1)],
  term ((3216320 : Rat) / 158397) [(5, 2), (6, 1), (15, 2)],
  term ((-23827616 : Rat) / 385571) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((37600 : Rat) / 4281) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-33017764 : Rat) / 385571) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-589840 : Rat) / 158397) [(5, 2), (7, 1), (15, 1)],
  term ((2747506 : Rat) / 385571) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((2781440 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((74351008 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1390720 : Rat) / 158397) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-37175504 : Rat) / 385571) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(5, 2), (8, 1), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9275968 : Rat) / 158397) [(5, 2), (8, 1), (15, 2)],
  term ((24748120 : Rat) / 385571) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((33392128 : Rat) / 158397) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-25271248 : Rat) / 385571) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20113376 : Rat) / 158397) [(5, 2), (9, 1), (15, 1)],
  term ((20272676 : Rat) / 385571) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(5, 2), (10, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4409728 : Rat) / 158397) [(5, 2), (11, 1), (15, 1)],
  term ((2416244 : Rat) / 385571) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(5, 2), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(5, 2), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((422702 : Rat) / 52799) [(5, 2), (14, 1)],
  term ((3399680 : Rat) / 158397) [(5, 2), (14, 1), (15, 2)],
  term ((-25748672 : Rat) / 385571) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4655208 : Rat) / 52799) [(5, 2), (15, 2)],
  term ((-6059584 : Rat) / 385571) [(5, 2), (15, 2), (16, 1)],
  term ((12806592 : Rat) / 385571) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((2417740 : Rat) / 52799) [(5, 3), (15, 1)],
  term ((-4234780 : Rat) / 385571) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 253. -/
theorem rs_R005_ueqv_R005NYN_block_29_0200_0253_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_29_0200_0253
      rs_R005_ueqv_R005NYN_block_29_0200_0253 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
