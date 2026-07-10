/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 26:200-231

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_26_0200_0231 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0200 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0200 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0200_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0200
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0201 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 201 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0201 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((778240 : Rat) / 52799) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0201_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0201
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0202 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0202 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0202_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0202
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0203 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 203 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0203 : Poly :=
[
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(7, 2), (8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0203_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0203
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0204 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0204 : Poly :=
[
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0204_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0204
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0205 : Poly :=
[
  term ((2007040 : Rat) / 158397) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 205 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0205 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(6, 2), (8, 1), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0205_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0205
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0206 : Poly :=
[
  term ((-9973120 : Rat) / 385571) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0206 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(6, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0206_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0206
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0207 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 207 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0207 : Poly :=
[
  term ((8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0207_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0207
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0208 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0208 : Poly :=
[
  term ((113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0208_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0208
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0209 : Poly :=
[
  term ((2230400 : Rat) / 158397) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 209 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0209 : Poly :=
[
  term ((-4460800 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2230400 : Rat) / 158397) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0209_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0209
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0210 : Poly :=
[
  term ((28348144 : Rat) / 385571) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0210 : Poly :=
[
  term ((-56696288 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28348144 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28348144 : Rat) / 385571) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0210_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0210
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0211 : Poly :=
[
  term ((21458176 : Rat) / 158397) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 211 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0211 : Poly :=
[
  term ((-42916352 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((42916352 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0211_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0211
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0212 : Poly :=
[
  term ((-11007088 : Rat) / 385571) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0212 : Poly :=
[
  term ((22014176 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((22014176 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22014176 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0212_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0212
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0213 : Poly :=
[
  term ((-10729088 : Rat) / 158397) [(9, 1), (15, 1)]
]

/-- Partial product 213 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0213 : Poly :=
[
  term ((21458176 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10729088 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((21458176 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-10729088 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((10729088 : Rat) / 158397) [(6, 2), (9, 1), (15, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((10729088 : Rat) / 158397) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0213_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0213
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0214 : Poly :=
[
  term ((5503544 : Rat) / 385571) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0214 : Poly :=
[
  term ((-11007088 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5503544 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((5503544 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5503544 : Rat) / 385571) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5503544 : Rat) / 385571) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0214_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0214
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0215 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 215 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0215 : Poly :=
[
  term ((20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0215_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0215
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0216 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0216 : Poly :=
[
  term ((-84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0216_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0216
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0217 : Poly :=
[
  term ((5181440 : Rat) / 158397) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 217 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0217 : Poly :=
[
  term ((-10362880 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5181440 : Rat) / 158397) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0217_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0217
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0218 : Poly :=
[
  term ((-21092000 : Rat) / 385571) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0218 : Poly :=
[
  term ((42184000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((21092000 : Rat) / 385571) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0218_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0218
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0219 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 219 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0219 : Poly :=
[
  term ((-8028160 : Rat) / 158397) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((8028160 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(7, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0219_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0219
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0220 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0220 : Poly :=
[
  term ((39892480 : Rat) / 385571) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((39892480 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0220_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0220
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0221 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(12, 1), (15, 2)]
]

/-- Partial product 221 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0221 : Poly :=
[
  term ((4014080 : Rat) / 158397) [(0, 1), (12, 2), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((4014080 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)],
  term ((2007040 : Rat) / 158397) [(6, 2), (12, 1), (15, 2)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((2007040 : Rat) / 158397) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0221_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0221
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0222 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0222 : Poly :=
[
  term ((-19946240 : Rat) / 385571) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((9973120 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0222_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0222
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0223 : Poly :=
[
  term ((678880 : Rat) / 52799) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0223 : Poly :=
[
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((1357760 : Rat) / 52799) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0223_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0223
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0224 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0224 : Poly :=
[
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36665208 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0224_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0224
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0225 : Poly :=
[
  term ((-339440 : Rat) / 52799) [(13, 1), (15, 1)]
]

/-- Partial product 225 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0225 : Poly :=
[
  term ((678880 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-339440 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((678880 : Rat) / 52799) [(1, 1), (13, 2), (15, 1)],
  term ((-339440 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((339440 : Rat) / 52799) [(6, 2), (13, 1), (15, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)],
  term ((339440 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0225_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0225
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0226 : Poly :=
[
  term ((9166302 : Rat) / 385571) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0226 : Poly :=
[
  term ((-18332604 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9166302 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((9166302 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-9166302 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0226_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0226
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0227 : Poly :=
[
  term ((2958914 : Rat) / 158397) [(14, 1)]
]

/-- Partial product 227 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0227 : Poly :=
[
  term ((-5917828 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((2958914 : Rat) / 158397) [(0, 2), (14, 1)],
  term ((-5917828 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((2958914 : Rat) / 158397) [(1, 2), (14, 1)],
  term ((5917828 : Rat) / 158397) [(6, 1), (12, 1), (14, 1)],
  term ((-2958914 : Rat) / 158397) [(6, 2), (14, 1)],
  term ((5917828 : Rat) / 158397) [(7, 1), (13, 1), (14, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0227_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0227
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0228 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(14, 1), (15, 2)]
]

/-- Partial product 228 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0228 : Poly :=
[
  term ((1556480 : Rat) / 52799) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(0, 2), (14, 1), (15, 2)],
  term ((1556480 : Rat) / 52799) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-778240 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(6, 2), (14, 1), (15, 2)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((778240 : Rat) / 52799) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0228_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0228
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0229 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0229 : Poly :=
[
  term ((-4583040 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0229_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0229
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0230 : Poly :=
[
  term ((389120 : Rat) / 52799) [(15, 2)]
]

/-- Partial product 230 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0230 : Poly :=
[
  term ((-778240 : Rat) / 52799) [(0, 1), (12, 1), (15, 2)],
  term ((389120 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-778240 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((389120 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(6, 1), (12, 1), (15, 2)],
  term ((-389120 : Rat) / 52799) [(6, 2), (15, 2)],
  term ((778240 : Rat) / 52799) [(7, 1), (13, 1), (15, 2)],
  term ((-389120 : Rat) / 52799) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0230_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0230
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 26. -/
def rs_R005_ueqv_R005NYN_coefficient_26_0231 : Poly :=
[
  term ((-1145760 : Rat) / 385571) [(15, 2), (16, 1)]
]

/-- Partial product 231 for generator 26. -/
def rs_R005_ueqv_R005NYN_partial_26_0231 : Poly :=
[
  term ((2291520 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1145760 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((2291520 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1145760 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1145760 : Rat) / 385571) [(6, 2), (15, 2), (16, 1)],
  term ((-2291520 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1145760 : Rat) / 385571) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 26. -/
theorem rs_R005_ueqv_R005NYN_partial_26_0231_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_26_0231
        rs_R005_ueqv_R005NYN_generator_26_0200_0231 =
      rs_R005_ueqv_R005NYN_partial_26_0231 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_26_0200_0231 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_26_0200,
  rs_R005_ueqv_R005NYN_partial_26_0201,
  rs_R005_ueqv_R005NYN_partial_26_0202,
  rs_R005_ueqv_R005NYN_partial_26_0203,
  rs_R005_ueqv_R005NYN_partial_26_0204,
  rs_R005_ueqv_R005NYN_partial_26_0205,
  rs_R005_ueqv_R005NYN_partial_26_0206,
  rs_R005_ueqv_R005NYN_partial_26_0207,
  rs_R005_ueqv_R005NYN_partial_26_0208,
  rs_R005_ueqv_R005NYN_partial_26_0209,
  rs_R005_ueqv_R005NYN_partial_26_0210,
  rs_R005_ueqv_R005NYN_partial_26_0211,
  rs_R005_ueqv_R005NYN_partial_26_0212,
  rs_R005_ueqv_R005NYN_partial_26_0213,
  rs_R005_ueqv_R005NYN_partial_26_0214,
  rs_R005_ueqv_R005NYN_partial_26_0215,
  rs_R005_ueqv_R005NYN_partial_26_0216,
  rs_R005_ueqv_R005NYN_partial_26_0217,
  rs_R005_ueqv_R005NYN_partial_26_0218,
  rs_R005_ueqv_R005NYN_partial_26_0219,
  rs_R005_ueqv_R005NYN_partial_26_0220,
  rs_R005_ueqv_R005NYN_partial_26_0221,
  rs_R005_ueqv_R005NYN_partial_26_0222,
  rs_R005_ueqv_R005NYN_partial_26_0223,
  rs_R005_ueqv_R005NYN_partial_26_0224,
  rs_R005_ueqv_R005NYN_partial_26_0225,
  rs_R005_ueqv_R005NYN_partial_26_0226,
  rs_R005_ueqv_R005NYN_partial_26_0227,
  rs_R005_ueqv_R005NYN_partial_26_0228,
  rs_R005_ueqv_R005NYN_partial_26_0229,
  rs_R005_ueqv_R005NYN_partial_26_0230,
  rs_R005_ueqv_R005NYN_partial_26_0231
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_26_0200_0231 : Poly :=
[
  term ((9166080 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8921600 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(0, 1), (12, 1), (14, 1)],
  term ((1556480 : Rat) / 52799) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 1), (12, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(0, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(0, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10729088 : Rat) / 158397) [(0, 2), (9, 1), (15, 1)],
  term ((5503544 : Rat) / 385571) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(0, 2), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-339440 : Rat) / 52799) [(0, 2), (13, 1), (15, 1)],
  term ((9166302 : Rat) / 385571) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(0, 2), (14, 1)],
  term ((-778240 : Rat) / 52799) [(0, 2), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((389120 : Rat) / 52799) [(0, 2), (15, 2)],
  term ((-1145760 : Rat) / 385571) [(0, 2), (15, 2), (16, 1)],
  term ((9166080 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8921600 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((113392576 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42916352 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((22014176 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20725760 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-84368000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5917828 : Rat) / 158397) [(1, 1), (13, 1), (14, 1)],
  term ((1556480 : Rat) / 52799) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4583040 : Rat) / 385571) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 1), (13, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1357760 : Rat) / 52799) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((36665208 : Rat) / 385571) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 1), (13, 2), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4583040 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((2291520 : Rat) / 385571) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(1, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4460800 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56696288 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2230400 : Rat) / 158397) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((28348144 : Rat) / 385571) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((21458176 : Rat) / 158397) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-11007088 : Rat) / 385571) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10729088 : Rat) / 158397) [(1, 2), (9, 1), (15, 1)],
  term ((5503544 : Rat) / 385571) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10362880 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((42184000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5181440 : Rat) / 158397) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-21092000 : Rat) / 385571) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(1, 2), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((678880 : Rat) / 52799) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-18332604 : Rat) / 385571) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-339440 : Rat) / 52799) [(1, 2), (13, 1), (15, 1)],
  term ((9166302 : Rat) / 385571) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((2958914 : Rat) / 158397) [(1, 2), (14, 1)],
  term ((-778240 : Rat) / 52799) [(1, 2), (14, 1), (15, 2)],
  term ((2291520 : Rat) / 385571) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((389120 : Rat) / 52799) [(1, 2), (15, 2)],
  term ((-1145760 : Rat) / 385571) [(1, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((42916352 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((56696288 : Rat) / 385571) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1357760 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5917828 : Rat) / 158397) [(6, 1), (12, 1), (14, 1)],
  term ((-1556480 : Rat) / 52799) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(6, 1), (12, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((8028160 : Rat) / 158397) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 1), (12, 2), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((4583040 : Rat) / 385571) [(6, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(6, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(6, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(6, 2), (8, 1), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(6, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(6, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10729088 : Rat) / 158397) [(6, 2), (9, 1), (15, 1)],
  term ((-5503544 : Rat) / 385571) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(6, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(6, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(6, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(6, 2), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(6, 2), (13, 1), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(6, 2), (14, 1)],
  term ((778240 : Rat) / 52799) [(6, 2), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-389120 : Rat) / 52799) [(6, 2), (15, 2)],
  term ((1145760 : Rat) / 385571) [(6, 2), (15, 2), (16, 1)],
  term ((-9166080 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((4583040 : Rat) / 385571) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8028160 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((39892480 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8921600 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-113392576 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4460800 : Rat) / 158397) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42916352 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-22014176 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20725760 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((84368000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8028160 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-39892480 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5917828 : Rat) / 158397) [(7, 1), (13, 1), (14, 1)],
  term ((-1556480 : Rat) / 52799) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((4583040 : Rat) / 385571) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((778240 : Rat) / 52799) [(7, 1), (13, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1357760 : Rat) / 52799) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-36665208 : Rat) / 385571) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-678880 : Rat) / 52799) [(7, 1), (13, 2), (15, 1)],
  term ((18332604 : Rat) / 385571) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((4583040 : Rat) / 385571) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((778240 : Rat) / 52799) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-2291520 : Rat) / 385571) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4014080 : Rat) / 158397) [(7, 2), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-19946240 : Rat) / 385571) [(7, 2), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2007040 : Rat) / 158397) [(7, 2), (8, 1), (12, 1), (15, 2)],
  term ((9973120 : Rat) / 385571) [(7, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4460800 : Rat) / 158397) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((56696288 : Rat) / 385571) [(7, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2230400 : Rat) / 158397) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-28348144 : Rat) / 385571) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21458176 : Rat) / 158397) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((11007088 : Rat) / 385571) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10729088 : Rat) / 158397) [(7, 2), (9, 1), (15, 1)],
  term ((-5503544 : Rat) / 385571) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((10362880 : Rat) / 158397) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-42184000 : Rat) / 385571) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5181440 : Rat) / 158397) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((21092000 : Rat) / 385571) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4014080 : Rat) / 158397) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((19946240 : Rat) / 385571) [(7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2007040 : Rat) / 158397) [(7, 2), (12, 1), (15, 2)],
  term ((-9973120 : Rat) / 385571) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-678880 : Rat) / 52799) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((18332604 : Rat) / 385571) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((339440 : Rat) / 52799) [(7, 2), (13, 1), (15, 1)],
  term ((-9166302 : Rat) / 385571) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2958914 : Rat) / 158397) [(7, 2), (14, 1)],
  term ((778240 : Rat) / 52799) [(7, 2), (14, 1), (15, 2)],
  term ((-2291520 : Rat) / 385571) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-389120 : Rat) / 52799) [(7, 2), (15, 2)],
  term ((1145760 : Rat) / 385571) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 200 through 231. -/
theorem rs_R005_ueqv_R005NYN_block_26_0200_0231_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_26_0200_0231
      rs_R005_ueqv_R005NYN_block_26_0200_0231 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
