/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 30:200-235

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_30_0200_0235 : Poly :=
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
def rs_R011_ueqv_R011YYY_coefficient_30_0200 : Poly :=
[
  term (4 : Rat) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0200 : Poly :=
[
  term (-8 : Rat) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0200_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0200
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0201 : Poly :=
[
  term ((1752 : Rat) / 227) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0201 : Poly :=
[
  term ((-3504 : Rat) / 227) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((-3504 : Rat) / 227) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((3504 : Rat) / 227) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((3504 : Rat) / 227) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0201_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0201
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0202 : Poly :=
[
  term ((10857 : Rat) / 1135) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0202 : Poly :=
[
  term ((-21714 : Rat) / 1135) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((10857 : Rat) / 1135) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-21714 : Rat) / 1135) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10857 : Rat) / 1135) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((21714 : Rat) / 1135) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-10857 : Rat) / 1135) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((21714 : Rat) / 1135) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10857 : Rat) / 1135) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0202_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0202
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0203 : Poly :=
[
  term ((48 : Rat) / 227) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 203 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0203 : Poly :=
[
  term ((-96 : Rat) / 227) [(0, 1), (10, 1), (14, 3), (16, 1)],
  term ((48 : Rat) / 227) [(0, 2), (10, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 227) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 227) [(1, 2), (10, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0203_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0203
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0204 : Poly :=
[
  term ((-1084 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0204 : Poly :=
[
  term ((2168 : Rat) / 1135) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((2168 : Rat) / 1135) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1084 : Rat) / 1135) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0204_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0204
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0205 : Poly :=
[
  term ((27719 : Rat) / 2270) [(10, 1), (16, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0205 : Poly :=
[
  term ((-27719 : Rat) / 1135) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((27719 : Rat) / 2270) [(0, 2), (10, 1), (16, 1)],
  term ((-27719 : Rat) / 1135) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((27719 : Rat) / 2270) [(1, 2), (10, 1), (16, 1)],
  term ((27719 : Rat) / 1135) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27719 : Rat) / 2270) [(10, 1), (12, 2), (16, 1)],
  term ((27719 : Rat) / 1135) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27719 : Rat) / 2270) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0205_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0205
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0206 : Poly :=
[
  term ((-7184 : Rat) / 1135) [(10, 2), (16, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0206 : Poly :=
[
  term ((14368 : Rat) / 1135) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(0, 2), (10, 2), (16, 1)],
  term ((14368 : Rat) / 1135) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(1, 2), (10, 2), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (12, 2), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0206_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0206
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0207 : Poly :=
[
  term (-16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 207 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0207 : Poly :=
[
  term (32 : Rat) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (-16 : Rat) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0207_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0207
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0208 : Poly :=
[
  term (48 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 208 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0208 : Poly :=
[
  term (-96 : Rat) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (96 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term (96 : Rat) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0208_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0208
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0209 : Poly :=
[
  term (4 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0209 : Poly :=
[
  term (-8 : Rat) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0209_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0209
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0210 : Poly :=
[
  term ((-2158 : Rat) / 227) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0210 : Poly :=
[
  term ((4316 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2158 : Rat) / 227) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4316 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2158 : Rat) / 227) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4316 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2158 : Rat) / 227) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4316 : Rat) / 227) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2158 : Rat) / 227) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0210_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0210
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0211 : Poly :=
[
  term ((4428 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0211 : Poly :=
[
  term ((-8856 : Rat) / 227) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((4428 : Rat) / 227) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8856 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8856 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((8856 : Rat) / 227) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0211_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0211
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0212 : Poly :=
[
  term ((-6247 : Rat) / 454) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0212 : Poly :=
[
  term ((6247 : Rat) / 227) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6247 : Rat) / 454) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((6247 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6247 : Rat) / 454) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6247 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6247 : Rat) / 454) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-6247 : Rat) / 227) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6247 : Rat) / 454) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0212_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0212
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0213 : Poly :=
[
  term (-4 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0213 : Poly :=
[
  term (8 : Rat) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0213_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0213
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0214 : Poly :=
[
  term (16 : Rat) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0214 : Poly :=
[
  term (-32 : Rat) [(0, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term (16 : Rat) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 2), (11, 1), (13, 3), (16, 1)],
  term (32 : Rat) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term (32 : Rat) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0214_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0214
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0215 : Poly :=
[
  term ((1324 : Rat) / 1135) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0215 : Poly :=
[
  term ((-2648 : Rat) / 1135) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2648 : Rat) / 1135) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1324 : Rat) / 1135) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0215_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0215
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0216 : Poly :=
[
  term ((11768 : Rat) / 3405) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0216 : Poly :=
[
  term ((-23536 : Rat) / 3405) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11768 : Rat) / 3405) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23536 : Rat) / 3405) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((11768 : Rat) / 3405) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((23536 : Rat) / 3405) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11768 : Rat) / 3405) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((23536 : Rat) / 3405) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11768 : Rat) / 3405) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0216_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0216
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0217 : Poly :=
[
  term ((-272 : Rat) / 681) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0217 : Poly :=
[
  term ((544 : Rat) / 681) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-272 : Rat) / 681) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((544 : Rat) / 681) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-544 : Rat) / 681) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-544 : Rat) / 681) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0217_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0217
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0218 : Poly :=
[
  term ((26632 : Rat) / 3405) [(11, 2), (16, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0218 : Poly :=
[
  term ((-53264 : Rat) / 3405) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((26632 : Rat) / 3405) [(0, 2), (11, 2), (16, 1)],
  term ((-53264 : Rat) / 3405) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((26632 : Rat) / 3405) [(1, 2), (11, 2), (16, 1)],
  term ((53264 : Rat) / 3405) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-26632 : Rat) / 3405) [(11, 2), (12, 2), (16, 1)],
  term ((53264 : Rat) / 3405) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26632 : Rat) / 3405) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0218_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0218
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0219 : Poly :=
[
  term (-88 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0219 : Poly :=
[
  term (176 : Rat) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-88 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (176 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-88 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-176 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (88 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (-176 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (88 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0219_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0219
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0220 : Poly :=
[
  term (-56 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 220 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0220 : Poly :=
[
  term (112 : Rat) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term (-56 : Rat) [(0, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (112 : Rat) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-112 : Rat) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term (-112 : Rat) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term (56 : Rat) [(12, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0220_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0220
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0221 : Poly :=
[
  term (146 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0221 : Poly :=
[
  term (-292 : Rat) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (146 : Rat) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term (-292 : Rat) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (146 : Rat) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term (292 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (-146 : Rat) [(12, 1), (13, 4), (16, 1)],
  term (292 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (-146 : Rat) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0221_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0221
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0222 : Poly :=
[
  term ((-3873 : Rat) / 2270) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0222 : Poly :=
[
  term ((3873 : Rat) / 1135) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3873 : Rat) / 2270) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((3873 : Rat) / 1135) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3873 : Rat) / 2270) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3873 : Rat) / 1135) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3873 : Rat) / 2270) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3873 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((3873 : Rat) / 2270) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0222_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0222
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0223 : Poly :=
[
  term ((2895 : Rat) / 227) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0223 : Poly :=
[
  term ((-5790 : Rat) / 227) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2895 : Rat) / 227) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5790 : Rat) / 227) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((2895 : Rat) / 227) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((5790 : Rat) / 227) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2895 : Rat) / 227) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((5790 : Rat) / 227) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2895 : Rat) / 227) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0223_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0223
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0224 : Poly :=
[
  term ((9257 : Rat) / 2270) [(12, 1), (16, 1)]
]

/-- Partial product 224 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0224 : Poly :=
[
  term ((-9257 : Rat) / 1135) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((9257 : Rat) / 2270) [(0, 2), (12, 1), (16, 1)],
  term ((-9257 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((9257 : Rat) / 2270) [(1, 2), (12, 1), (16, 1)],
  term ((9257 : Rat) / 1135) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9257 : Rat) / 2270) [(12, 1), (13, 2), (16, 1)],
  term ((9257 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((-9257 : Rat) / 2270) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0224_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0224
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0225 : Poly :=
[
  term (56 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0225 : Poly :=
[
  term (-112 : Rat) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(0, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-112 : Rat) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (56 : Rat) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term (112 : Rat) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0225_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0225
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0226 : Poly :=
[
  term (2 : Rat) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 226 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0226 : Poly :=
[
  term (-4 : Rat) [(0, 1), (12, 2), (14, 2), (16, 1)],
  term (2 : Rat) [(0, 2), (12, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (12, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 3), (14, 2), (16, 1)],
  term (-2 : Rat) [(12, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0226_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0226
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0227 : Poly :=
[
  term ((-1202 : Rat) / 1135) [(12, 2), (16, 1)]
]

/-- Partial product 227 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0227 : Poly :=
[
  term ((2404 : Rat) / 1135) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1202 : Rat) / 1135) [(0, 2), (12, 2), (16, 1)],
  term ((2404 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1202 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((-2404 : Rat) / 1135) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1202 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term ((-2404 : Rat) / 1135) [(12, 3), (14, 1), (16, 1)],
  term ((1202 : Rat) / 1135) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0227_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0227
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0228 : Poly :=
[
  term ((-1987 : Rat) / 227) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0228 : Poly :=
[
  term ((3974 : Rat) / 227) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3974 : Rat) / 227) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3974 : Rat) / 227) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3974 : Rat) / 227) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0228_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0228
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0229 : Poly :=
[
  term ((77241 : Rat) / 1135) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0229 : Poly :=
[
  term ((-154482 : Rat) / 1135) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77241 : Rat) / 1135) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-154482 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((77241 : Rat) / 1135) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((154482 : Rat) / 1135) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77241 : Rat) / 1135) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((154482 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)],
  term ((-77241 : Rat) / 1135) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0229_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0229
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0230 : Poly :=
[
  term (8 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 230 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0230 : Poly :=
[
  term (-16 : Rat) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term (8 : Rat) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (-8 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (16 : Rat) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0230_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0230
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0231 : Poly :=
[
  term ((-67847 : Rat) / 1135) [(13, 2), (16, 1)]
]

/-- Partial product 231 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0231 : Poly :=
[
  term ((135694 : Rat) / 1135) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-67847 : Rat) / 1135) [(0, 2), (13, 2), (16, 1)],
  term ((135694 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67847 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)],
  term ((-135694 : Rat) / 1135) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((67847 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term ((-135694 : Rat) / 1135) [(13, 3), (15, 1), (16, 1)],
  term ((67847 : Rat) / 1135) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0231_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0231
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0232 : Poly :=
[
  term ((-15782 : Rat) / 1135) [(14, 1), (16, 1)]
]

/-- Partial product 232 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0232 : Poly :=
[
  term ((31564 : Rat) / 1135) [(0, 1), (14, 2), (16, 1)],
  term ((-15782 : Rat) / 1135) [(0, 2), (14, 1), (16, 1)],
  term ((31564 : Rat) / 1135) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15782 : Rat) / 1135) [(1, 2), (14, 1), (16, 1)],
  term ((-31564 : Rat) / 1135) [(12, 1), (14, 2), (16, 1)],
  term ((15782 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((-31564 : Rat) / 1135) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15782 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0232_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0232
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0233 : Poly :=
[
  term ((5609 : Rat) / 1135) [(14, 2), (16, 1)]
]

/-- Partial product 233 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0233 : Poly :=
[
  term ((-11218 : Rat) / 1135) [(0, 1), (14, 3), (16, 1)],
  term ((5609 : Rat) / 1135) [(0, 2), (14, 2), (16, 1)],
  term ((-11218 : Rat) / 1135) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(1, 2), (14, 2), (16, 1)],
  term ((11218 : Rat) / 1135) [(12, 1), (14, 3), (16, 1)],
  term ((-5609 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((11218 : Rat) / 1135) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5609 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0233_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0233
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0234 : Poly :=
[
  term ((-4652 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 234 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0234 : Poly :=
[
  term ((9304 : Rat) / 1135) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4652 : Rat) / 1135) [(0, 2), (15, 2), (16, 1)],
  term ((9304 : Rat) / 1135) [(1, 1), (15, 3), (16, 1)],
  term ((-4652 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)],
  term ((-9304 : Rat) / 1135) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4652 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((-9304 : Rat) / 1135) [(13, 1), (15, 3), (16, 1)],
  term ((4652 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0234_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0234
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 30. -/
def rs_R011_ueqv_R011YYY_coefficient_30_0235 : Poly :=
[
  term ((-16203 : Rat) / 4540) [(16, 1)]
]

/-- Partial product 235 for generator 30. -/
def rs_R011_ueqv_R011YYY_partial_30_0235 : Poly :=
[
  term ((16203 : Rat) / 2270) [(0, 1), (14, 1), (16, 1)],
  term ((-16203 : Rat) / 4540) [(0, 2), (16, 1)],
  term ((16203 : Rat) / 2270) [(1, 1), (15, 1), (16, 1)],
  term ((-16203 : Rat) / 4540) [(1, 2), (16, 1)],
  term ((-16203 : Rat) / 2270) [(12, 1), (14, 1), (16, 1)],
  term ((16203 : Rat) / 4540) [(12, 2), (16, 1)],
  term ((-16203 : Rat) / 2270) [(13, 1), (15, 1), (16, 1)],
  term ((16203 : Rat) / 4540) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 30. -/
theorem rs_R011_ueqv_R011YYY_partial_30_0235_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_30_0235
        rs_R011_ueqv_R011YYY_generator_30_0200_0235 =
      rs_R011_ueqv_R011YYY_partial_30_0235 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_30_0200_0235 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_30_0200,
  rs_R011_ueqv_R011YYY_partial_30_0201,
  rs_R011_ueqv_R011YYY_partial_30_0202,
  rs_R011_ueqv_R011YYY_partial_30_0203,
  rs_R011_ueqv_R011YYY_partial_30_0204,
  rs_R011_ueqv_R011YYY_partial_30_0205,
  rs_R011_ueqv_R011YYY_partial_30_0206,
  rs_R011_ueqv_R011YYY_partial_30_0207,
  rs_R011_ueqv_R011YYY_partial_30_0208,
  rs_R011_ueqv_R011YYY_partial_30_0209,
  rs_R011_ueqv_R011YYY_partial_30_0210,
  rs_R011_ueqv_R011YYY_partial_30_0211,
  rs_R011_ueqv_R011YYY_partial_30_0212,
  rs_R011_ueqv_R011YYY_partial_30_0213,
  rs_R011_ueqv_R011YYY_partial_30_0214,
  rs_R011_ueqv_R011YYY_partial_30_0215,
  rs_R011_ueqv_R011YYY_partial_30_0216,
  rs_R011_ueqv_R011YYY_partial_30_0217,
  rs_R011_ueqv_R011YYY_partial_30_0218,
  rs_R011_ueqv_R011YYY_partial_30_0219,
  rs_R011_ueqv_R011YYY_partial_30_0220,
  rs_R011_ueqv_R011YYY_partial_30_0221,
  rs_R011_ueqv_R011YYY_partial_30_0222,
  rs_R011_ueqv_R011YYY_partial_30_0223,
  rs_R011_ueqv_R011YYY_partial_30_0224,
  rs_R011_ueqv_R011YYY_partial_30_0225,
  rs_R011_ueqv_R011YYY_partial_30_0226,
  rs_R011_ueqv_R011YYY_partial_30_0227,
  rs_R011_ueqv_R011YYY_partial_30_0228,
  rs_R011_ueqv_R011YYY_partial_30_0229,
  rs_R011_ueqv_R011YYY_partial_30_0230,
  rs_R011_ueqv_R011YYY_partial_30_0231,
  rs_R011_ueqv_R011YYY_partial_30_0232,
  rs_R011_ueqv_R011YYY_partial_30_0233,
  rs_R011_ueqv_R011YYY_partial_30_0234,
  rs_R011_ueqv_R011YYY_partial_30_0235
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_30_0200_0235 : Poly :=
[
  term ((-3504 : Rat) / 227) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((2168 : Rat) / 1135) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27719 : Rat) / 1135) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-21714 : Rat) / 1135) [(0, 1), (10, 1), (14, 2), (16, 1)],
  term ((-96 : Rat) / 227) [(0, 1), (10, 1), (14, 3), (16, 1)],
  term ((14368 : Rat) / 1135) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term (-96 : Rat) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((4316 : Rat) / 227) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((6247 : Rat) / 227) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8856 : Rat) / 227) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-23536 : Rat) / 3405) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2648 : Rat) / 1135) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53264 : Rat) / 3405) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((544 : Rat) / 681) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term (176 : Rat) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-292 : Rat) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (112 : Rat) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-5790 : Rat) / 227) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9257 : Rat) / 1135) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((3873 : Rat) / 1135) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term (-112 : Rat) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2404 : Rat) / 1135) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (12, 2), (14, 2), (16, 1)],
  term ((-154482 : Rat) / 1135) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3974 : Rat) / 227) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((135694 : Rat) / 1135) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term (-16 : Rat) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((9304 : Rat) / 1135) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((16203 : Rat) / 2270) [(0, 1), (14, 1), (16, 1)],
  term ((31564 : Rat) / 1135) [(0, 1), (14, 2), (16, 1)],
  term ((-11218 : Rat) / 1135) [(0, 1), (14, 3), (16, 1)],
  term (4 : Rat) [(0, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(0, 2), (10, 1), (13, 2), (16, 1)],
  term ((10857 : Rat) / 1135) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 227) [(0, 2), (10, 1), (14, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((27719 : Rat) / 2270) [(0, 2), (10, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(0, 2), (10, 2), (16, 1)],
  term (-16 : Rat) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2158 : Rat) / 227) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6247 : Rat) / 454) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 2), (11, 1), (13, 3), (16, 1)],
  term ((1324 : Rat) / 1135) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11768 : Rat) / 3405) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((26632 : Rat) / 3405) [(0, 2), (11, 2), (16, 1)],
  term (-88 : Rat) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(0, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (146 : Rat) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3873 : Rat) / 2270) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((2895 : Rat) / 227) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((9257 : Rat) / 2270) [(0, 2), (12, 1), (16, 1)],
  term (56 : Rat) [(0, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1202 : Rat) / 1135) [(0, 2), (12, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77241 : Rat) / 1135) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-67847 : Rat) / 1135) [(0, 2), (13, 2), (16, 1)],
  term ((-15782 : Rat) / 1135) [(0, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(0, 2), (14, 2), (16, 1)],
  term ((-4652 : Rat) / 1135) [(0, 2), (15, 2), (16, 1)],
  term ((-16203 : Rat) / 4540) [(0, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3504 : Rat) / 227) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-21714 : Rat) / 1135) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 227) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27719 : Rat) / 1135) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((2168 : Rat) / 1135) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((14368 : Rat) / 1135) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4316 : Rat) / 227) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8856 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6247 : Rat) / 227) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2648 : Rat) / 1135) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23536 : Rat) / 3405) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((544 : Rat) / 681) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-53264 : Rat) / 3405) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (176 : Rat) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (112 : Rat) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-292 : Rat) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3873 : Rat) / 1135) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9257 : Rat) / 1135) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5790 : Rat) / 227) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term (-112 : Rat) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2404 : Rat) / 1135) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((3974 : Rat) / 227) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-154482 : Rat) / 1135) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((135694 : Rat) / 1135) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((31564 : Rat) / 1135) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11218 : Rat) / 1135) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((16203 : Rat) / 2270) [(1, 1), (15, 1), (16, 1)],
  term ((9304 : Rat) / 1135) [(1, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1752 : Rat) / 227) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((10857 : Rat) / 1135) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 227) [(1, 2), (10, 1), (14, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((27719 : Rat) / 2270) [(1, 2), (10, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(1, 2), (10, 2), (16, 1)],
  term (-16 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (48 : Rat) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2158 : Rat) / 227) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6247 : Rat) / 454) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 2), (11, 1), (13, 3), (16, 1)],
  term ((1324 : Rat) / 1135) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11768 : Rat) / 3405) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((26632 : Rat) / 3405) [(1, 2), (11, 2), (16, 1)],
  term (-88 : Rat) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (146 : Rat) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3873 : Rat) / 2270) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((2895 : Rat) / 227) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((9257 : Rat) / 2270) [(1, 2), (12, 1), (16, 1)],
  term (56 : Rat) [(1, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1202 : Rat) / 1135) [(1, 2), (12, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77241 : Rat) / 1135) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-67847 : Rat) / 1135) [(1, 2), (13, 2), (16, 1)],
  term ((-15782 : Rat) / 1135) [(1, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(1, 2), (14, 2), (16, 1)],
  term ((-4652 : Rat) / 1135) [(1, 2), (15, 2), (16, 1)],
  term ((-16203 : Rat) / 4540) [(1, 2), (16, 1)],
  term ((3504 : Rat) / 227) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((27719 : Rat) / 1135) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((21714 : Rat) / 1135) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term (-4 : Rat) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-10857 : Rat) / 1135) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-27719 : Rat) / 2270) [(10, 1), (12, 2), (16, 1)],
  term ((21714 : Rat) / 1135) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((27719 : Rat) / 1135) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10857 : Rat) / 1135) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-27719 : Rat) / 2270) [(10, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3504 : Rat) / 227) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term (-4 : Rat) [(10, 1), (13, 4), (14, 1), (16, 1)],
  term ((-1752 : Rat) / 227) [(10, 1), (13, 4), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (12, 2), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (13, 2), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6247 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8856 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4316 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-44 : Rat) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((23950 : Rat) / 227) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((23536 : Rat) / 3405) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((17364 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((6247 : Rat) / 454) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((-22904 : Rat) / 1135) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11768 : Rat) / 3405) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((2158 : Rat) / 227) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((23536 : Rat) / 3405) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((42956 : Rat) / 1135) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-105473 : Rat) / 3405) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((6247 : Rat) / 454) [(11, 1), (13, 3), (16, 1)],
  term (36 : Rat) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 5), (16, 1)],
  term ((53264 : Rat) / 3405) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-544 : Rat) / 681) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-26632 : Rat) / 3405) [(11, 2), (12, 2), (16, 1)],
  term ((-544 : Rat) / 681) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53264 : Rat) / 3405) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-26632 : Rat) / 3405) [(11, 2), (13, 2), (16, 1)],
  term ((150609 : Rat) / 1135) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3974 : Rat) / 227) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9257 : Rat) / 1135) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5790 : Rat) / 227) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-53503 : Rat) / 454) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-42847 : Rat) / 227) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9257 : Rat) / 2270) [(12, 1), (13, 2), (16, 1)],
  term (-112 : Rat) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term (380 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term (-146 : Rat) [(12, 1), (13, 4), (16, 1)],
  term ((-9304 : Rat) / 1135) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16203 : Rat) / 2270) [(12, 1), (14, 1), (16, 1)],
  term ((-31564 : Rat) / 1135) [(12, 1), (14, 2), (16, 1)],
  term ((11218 : Rat) / 1135) [(12, 1), (14, 3), (16, 1)],
  term ((-37057 : Rat) / 227) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15929 : Rat) / 227) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (282 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (-112 : Rat) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term (112 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((69049 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((5790 : Rat) / 227) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((25039 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((-9482 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((4652 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((16203 : Rat) / 4540) [(12, 2), (16, 1)],
  term (112 : Rat) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (88 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(12, 3), (13, 2), (14, 1), (16, 1)],
  term (-146 : Rat) [(12, 3), (13, 2), (16, 1)],
  term ((-187 : Rat) / 454) [(12, 3), (14, 1), (16, 1)],
  term (4 : Rat) [(12, 3), (14, 2), (16, 1)],
  term ((-2895 : Rat) / 227) [(12, 3), (15, 2), (16, 1)],
  term ((-9257 : Rat) / 2270) [(12, 3), (16, 1)],
  term (-56 : Rat) [(12, 4), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(12, 4), (14, 1), (16, 1)],
  term ((1202 : Rat) / 1135) [(12, 4), (16, 1)],
  term ((-31564 : Rat) / 1135) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11218 : Rat) / 1135) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16203 : Rat) / 2270) [(13, 1), (15, 1), (16, 1)],
  term ((-9304 : Rat) / 1135) [(13, 1), (15, 3), (16, 1)],
  term ((-3974 : Rat) / 227) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((15782 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)],
  term ((-5609 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)],
  term ((159134 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)],
  term ((16203 : Rat) / 4540) [(13, 2), (16, 1)],
  term ((5619 : Rat) / 227) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42587 : Rat) / 227) [(13, 3), (15, 1), (16, 1)],
  term (-8 : Rat) [(13, 4), (14, 1), (16, 1)],
  term ((67847 : Rat) / 1135) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 235. -/
theorem rs_R011_ueqv_R011YYY_block_30_0200_0235_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_30_0200_0235
      rs_R011_ueqv_R011YYY_block_30_0200_0235 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
