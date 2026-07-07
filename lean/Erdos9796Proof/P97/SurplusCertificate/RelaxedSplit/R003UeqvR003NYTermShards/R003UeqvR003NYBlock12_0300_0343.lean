/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 12:300-343

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_12_0300_0343 : Poly :=
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

/-- Coefficient term 300 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0300 : Poly :=
[
  term ((1868 : Rat) / 299) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0300 : Poly :=
[
  term ((-3736 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((1868 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3736 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((1868 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((3736 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1868 : Rat) / 299) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1868 : Rat) / 299) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((3736 : Rat) / 299) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0300_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0300
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0301 : Poly :=
[
  term ((-2190 : Rat) / 299) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 301 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0301 : Poly :=
[
  term ((4380 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-2190 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((4380 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-2190 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-4380 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((2190 : Rat) / 299) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((2190 : Rat) / 299) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4380 : Rat) / 299) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0301_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0301
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0302 : Poly :=
[
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 302 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0302 : Poly :=
[
  term ((-144 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0302_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0302
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0303 : Poly :=
[
  term ((2512 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0303 : Poly :=
[
  term ((-5024 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0303_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0303
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0304 : Poly :=
[
  term ((-1256 : Rat) / 299) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 304 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0304 : Poly :=
[
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0304_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0304
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0305 : Poly :=
[
  term ((-24 : Rat) / 13) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0305 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0305_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0305
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0306 : Poly :=
[
  term ((48 : Rat) / 13) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 306 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0306 : Poly :=
[
  term ((-96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0306_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0306
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0307 : Poly :=
[
  term ((-60 : Rat) / 13) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 307 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0307 : Poly :=
[
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0307_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0307
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0308 : Poly :=
[
  term ((-24 : Rat) / 13) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0308 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (15, 3), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0308_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0308
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0309 : Poly :=
[
  term ((-60 : Rat) / 13) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 309 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0309 : Poly :=
[
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (3, 2), (14, 2), (16, 1)],
  term ((60 : Rat) / 13) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 13) [(3, 2), (14, 3), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0309_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0309
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0310 : Poly :=
[
  term ((-36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 310 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0310 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0310_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0310
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0311 : Poly :=
[
  term ((36 : Rat) / 13) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0311 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0311_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0311
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0312 : Poly :=
[
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 312 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0312 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0312_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0312
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0313 : Poly :=
[
  term ((24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0313 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0313_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0313
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0314 : Poly :=
[
  term ((-24 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 314 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0314 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0314_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0314
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0315 : Poly :=
[
  term ((12 : Rat) / 13) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 315 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0315 : Poly :=
[
  term ((-24 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0315_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0315
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0316 : Poly :=
[
  term ((34 : Rat) / 13) [(6, 1), (16, 1)]
]

/-- Partial product 316 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0316 : Poly :=
[
  term ((-68 : Rat) / 13) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((34 : Rat) / 13) [(0, 2), (6, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((34 : Rat) / 13) [(1, 2), (6, 1), (16, 1)],
  term ((68 : Rat) / 13) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((68 : Rat) / 13) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0316_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0316
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0317 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 317 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0317 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0317_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0317
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0318 : Poly :=
[
  term ((12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 318 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0318 : Poly :=
[
  term ((-24 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0318_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0318
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0319 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 319 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0319 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0319_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0319
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0320 : Poly :=
[
  term ((1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 320 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0320 : Poly :=
[
  term ((-2328 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2328 : Rat) / 299) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2328 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2328 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0320_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0320
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0321 : Poly :=
[
  term ((-60 : Rat) / 13) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0321 : Poly :=
[
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0321_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0321
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0322 : Poly :=
[
  term ((96 : Rat) / 13) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 322 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0322 : Poly :=
[
  term ((-192 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(2, 1), (8, 1), (13, 2), (14, 2), (16, 1)],
  term ((192 : Rat) / 13) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0322_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0322
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0323 : Poly :=
[
  term ((-24 : Rat) / 13) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 323 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0323 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0323_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0323
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0324 : Poly :=
[
  term ((36 : Rat) / 13) [(8, 1), (16, 1)]
]

/-- Partial product 324 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0324 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (8, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (8, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (14, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0324_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0324
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0325 : Poly :=
[
  term ((400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 325 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0325 : Poly :=
[
  term ((-800 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((800 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((800 : Rat) / 299) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0325_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0325
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0326 : Poly :=
[
  term ((40 : Rat) / 13) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 326 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0326 : Poly :=
[
  term ((-80 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((40 : Rat) / 13) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-80 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((40 : Rat) / 13) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((80 : Rat) / 13) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((80 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-40 : Rat) / 13) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-40 : Rat) / 13) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0326_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0326
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0327 : Poly :=
[
  term ((-96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 327 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0327 : Poly :=
[
  term ((192 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0327_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0327
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0328 : Poly :=
[
  term ((24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 328 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0328 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0328_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0328
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0329 : Poly :=
[
  term ((60 : Rat) / 13) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0329 : Poly :=
[
  term ((-120 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0329_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0329
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0330 : Poly :=
[
  term ((-46 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 330 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0330 : Poly :=
[
  term ((92 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-46 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((92 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-46 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-92 : Rat) / 13) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-92 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 13) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((46 : Rat) / 13) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0330_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0330
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0331 : Poly :=
[
  term ((-48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 331 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0331 : Poly :=
[
  term ((96 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0331_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0331
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0332 : Poly :=
[
  term ((36 : Rat) / 13) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0332 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0332_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0332
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0333 : Poly :=
[
  term ((36 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 333 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0333 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0333_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0333
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0334 : Poly :=
[
  term ((-16 : Rat) / 299) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 334 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0334 : Poly :=
[
  term ((32 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 299) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((32 : Rat) / 299) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 299) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-32 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 299) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 299) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((16 : Rat) / 299) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0334_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0334
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0335 : Poly :=
[
  term ((-1256 : Rat) / 299) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 335 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0335 : Poly :=
[
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0335_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0335
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0336 : Poly :=
[
  term ((-58 : Rat) / 13) [(12, 1), (16, 1)]
]

/-- Partial product 336 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0336 : Poly :=
[
  term ((116 : Rat) / 13) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(0, 2), (12, 1), (16, 1)],
  term ((116 : Rat) / 13) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(1, 2), (12, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 13) [(12, 1), (14, 2), (16, 1)],
  term ((58 : Rat) / 13) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0336_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0336
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0337 : Poly :=
[
  term ((34 : Rat) / 13) [(12, 2), (16, 1)]
]

/-- Partial product 337 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0337 : Poly :=
[
  term ((-68 : Rat) / 13) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((34 : Rat) / 13) [(0, 2), (12, 2), (16, 1)],
  term ((-68 : Rat) / 13) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((34 : Rat) / 13) [(1, 2), (12, 2), (16, 1)],
  term ((68 : Rat) / 13) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((68 : Rat) / 13) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(12, 2), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0337_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0337
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0338 : Poly :=
[
  term ((-24 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0338 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0338_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0338
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0339 : Poly :=
[
  term ((58 : Rat) / 13) [(13, 2), (16, 1)]
]

/-- Partial product 339 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0339 : Poly :=
[
  term ((-116 : Rat) / 13) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((58 : Rat) / 13) [(0, 2), (13, 2), (16, 1)],
  term ((-116 : Rat) / 13) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((58 : Rat) / 13) [(1, 2), (13, 2), (16, 1)],
  term ((116 : Rat) / 13) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((116 : Rat) / 13) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(13, 2), (14, 2), (16, 1)],
  term ((-58 : Rat) / 13) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0339_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0339
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0340 : Poly :=
[
  term ((64 : Rat) / 13) [(14, 1), (16, 1)]
]

/-- Partial product 340 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0340 : Poly :=
[
  term ((-128 : Rat) / 13) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 13) [(0, 2), (14, 1), (16, 1)],
  term ((-128 : Rat) / 13) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((64 : Rat) / 13) [(1, 2), (14, 1), (16, 1)],
  term ((128 : Rat) / 13) [(2, 1), (14, 2), (16, 1)],
  term ((128 : Rat) / 13) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 13) [(14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 13) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0340_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0340
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0341 : Poly :=
[
  term ((-17 : Rat) / 13) [(14, 2), (16, 1)]
]

/-- Partial product 341 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0341 : Poly :=
[
  term ((34 : Rat) / 13) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(0, 2), (14, 2), (16, 1)],
  term ((34 : Rat) / 13) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(1, 2), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(2, 1), (14, 3), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((17 : Rat) / 13) [(14, 2), (15, 2), (16, 1)],
  term ((17 : Rat) / 13) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0341_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0341
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0342 : Poly :=
[
  term ((-17 : Rat) / 13) [(15, 2), (16, 1)]
]

/-- Partial product 342 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0342 : Poly :=
[
  term ((34 : Rat) / 13) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(0, 2), (15, 2), (16, 1)],
  term ((34 : Rat) / 13) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(1, 2), (15, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(3, 1), (15, 3), (16, 1)],
  term ((17 : Rat) / 13) [(14, 2), (15, 2), (16, 1)],
  term ((17 : Rat) / 13) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0342_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0342
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 12. -/
def rs_R003_ueqv_R003NY_coefficient_12_0343 : Poly :=
[
  term ((-32 : Rat) / 13) [(16, 1)]
]

/-- Partial product 343 for generator 12. -/
def rs_R003_ueqv_R003NY_partial_12_0343 : Poly :=
[
  term ((64 : Rat) / 13) [(0, 1), (2, 1), (16, 1)],
  term ((-32 : Rat) / 13) [(0, 2), (16, 1)],
  term ((64 : Rat) / 13) [(1, 1), (3, 1), (16, 1)],
  term ((-32 : Rat) / 13) [(1, 2), (16, 1)],
  term ((-64 : Rat) / 13) [(2, 1), (14, 1), (16, 1)],
  term ((-64 : Rat) / 13) [(3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 13) [(14, 2), (16, 1)],
  term ((32 : Rat) / 13) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 12. -/
theorem rs_R003_ueqv_R003NY_partial_12_0343_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_12_0343
        rs_R003_ueqv_R003NY_generator_12_0300_0343 =
      rs_R003_ueqv_R003NY_partial_12_0343 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_12_0300_0343 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_12_0300,
  rs_R003_ueqv_R003NY_partial_12_0301,
  rs_R003_ueqv_R003NY_partial_12_0302,
  rs_R003_ueqv_R003NY_partial_12_0303,
  rs_R003_ueqv_R003NY_partial_12_0304,
  rs_R003_ueqv_R003NY_partial_12_0305,
  rs_R003_ueqv_R003NY_partial_12_0306,
  rs_R003_ueqv_R003NY_partial_12_0307,
  rs_R003_ueqv_R003NY_partial_12_0308,
  rs_R003_ueqv_R003NY_partial_12_0309,
  rs_R003_ueqv_R003NY_partial_12_0310,
  rs_R003_ueqv_R003NY_partial_12_0311,
  rs_R003_ueqv_R003NY_partial_12_0312,
  rs_R003_ueqv_R003NY_partial_12_0313,
  rs_R003_ueqv_R003NY_partial_12_0314,
  rs_R003_ueqv_R003NY_partial_12_0315,
  rs_R003_ueqv_R003NY_partial_12_0316,
  rs_R003_ueqv_R003NY_partial_12_0317,
  rs_R003_ueqv_R003NY_partial_12_0318,
  rs_R003_ueqv_R003NY_partial_12_0319,
  rs_R003_ueqv_R003NY_partial_12_0320,
  rs_R003_ueqv_R003NY_partial_12_0321,
  rs_R003_ueqv_R003NY_partial_12_0322,
  rs_R003_ueqv_R003NY_partial_12_0323,
  rs_R003_ueqv_R003NY_partial_12_0324,
  rs_R003_ueqv_R003NY_partial_12_0325,
  rs_R003_ueqv_R003NY_partial_12_0326,
  rs_R003_ueqv_R003NY_partial_12_0327,
  rs_R003_ueqv_R003NY_partial_12_0328,
  rs_R003_ueqv_R003NY_partial_12_0329,
  rs_R003_ueqv_R003NY_partial_12_0330,
  rs_R003_ueqv_R003NY_partial_12_0331,
  rs_R003_ueqv_R003NY_partial_12_0332,
  rs_R003_ueqv_R003NY_partial_12_0333,
  rs_R003_ueqv_R003NY_partial_12_0334,
  rs_R003_ueqv_R003NY_partial_12_0335,
  rs_R003_ueqv_R003NY_partial_12_0336,
  rs_R003_ueqv_R003NY_partial_12_0337,
  rs_R003_ueqv_R003NY_partial_12_0338,
  rs_R003_ueqv_R003NY_partial_12_0339,
  rs_R003_ueqv_R003NY_partial_12_0340,
  rs_R003_ueqv_R003NY_partial_12_0341,
  rs_R003_ueqv_R003NY_partial_12_0342,
  rs_R003_ueqv_R003NY_partial_12_0343
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_12_0300_0343 : Poly :=
[
  term ((-3736 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((4380 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (3, 2), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2328 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-80 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 13) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 1), (2, 1), (11, 2), (12, 1), (16, 1)],
  term ((116 : Rat) / 13) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((-128 : Rat) / 13) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((34 : Rat) / 13) [(0, 1), (2, 1), (14, 2), (16, 1)],
  term ((34 : Rat) / 13) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 13) [(0, 1), (2, 1), (16, 1)],
  term ((1868 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2190 : Rat) / 299) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((34 : Rat) / 13) [(0, 2), (6, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (8, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (8, 1), (16, 1)],
  term ((400 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((40 : Rat) / 13) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 299) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(0, 2), (12, 1), (16, 1)],
  term ((34 : Rat) / 13) [(0, 2), (12, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 13) [(0, 2), (13, 2), (16, 1)],
  term ((64 : Rat) / 13) [(0, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 13) [(0, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(0, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 13) [(0, 2), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2328 : Rat) / 299) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (13, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-80 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((192 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((32 : Rat) / 299) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 1), (11, 2), (12, 1), (16, 1)],
  term ((116 : Rat) / 13) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-68 : Rat) / 13) [(1, 1), (3, 1), (12, 2), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-128 : Rat) / 13) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((34 : Rat) / 13) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((34 : Rat) / 13) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 13) [(1, 1), (3, 1), (16, 1)],
  term ((-3736 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((4380 : Rat) / 299) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 2), (11, 1), (12, 1), (16, 1)],
  term ((-5024 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (14, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (3, 3), (14, 1), (16, 1)],
  term ((1868 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2190 : Rat) / 299) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((34 : Rat) / 13) [(1, 2), (6, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(1, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1164 : Rat) / 299) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 2), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (8, 1), (13, 2), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (8, 1), (16, 1)],
  term ((400 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((40 : Rat) / 13) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 299) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-58 : Rat) / 13) [(1, 2), (12, 1), (16, 1)],
  term ((34 : Rat) / 13) [(1, 2), (12, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((58 : Rat) / 13) [(1, 2), (13, 2), (16, 1)],
  term ((64 : Rat) / 13) [(1, 2), (14, 1), (16, 1)],
  term ((-17 : Rat) / 13) [(1, 2), (14, 2), (16, 1)],
  term ((-17 : Rat) / 13) [(1, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 13) [(1, 2), (16, 1)],
  term ((-4380 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((3736 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((144 : Rat) / 13) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(2, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (3, 2), (14, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((68 : Rat) / 13) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2328 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-120 : Rat) / 13) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(2, 1), (8, 1), (13, 2), (14, 2), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((800 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((80 : Rat) / 13) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((120 : Rat) / 13) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 13) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72 : Rat) / 13) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((68 : Rat) / 13) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((116 : Rat) / 13) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-34 : Rat) / 13) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 13) [(2, 1), (14, 1), (16, 1)],
  term ((128 : Rat) / 13) [(2, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(2, 1), (14, 3), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 13) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2328 : Rat) / 299) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((192 : Rat) / 13) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((800 : Rat) / 299) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1868 : Rat) / 299) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2190 : Rat) / 299) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-1868 : Rat) / 299) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((2190 : Rat) / 299) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 299) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((1256 : Rat) / 299) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-116 : Rat) / 13) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((68 : Rat) / 13) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 13) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((12 : Rat) / 13) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((116 : Rat) / 13) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 13) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 13) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 13) [(3, 1), (15, 1), (16, 1)],
  term ((-10 : Rat) / 13) [(3, 1), (15, 3), (16, 1)],
  term ((3736 : Rat) / 299) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4380 : Rat) / 299) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5024 : Rat) / 299) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 13) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 13) [(3, 2), (14, 3), (16, 1)],
  term ((-48 : Rat) / 13) [(3, 2), (15, 2), (16, 1)],
  term ((-120 : Rat) / 13) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((36 : Rat) / 13) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (14, 3), (16, 1)],
  term ((-24 : Rat) / 13) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 13) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-12 : Rat) / 13) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(6, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-12 : Rat) / 13) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1164 : Rat) / 299) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((-96 : Rat) / 13) [(8, 1), (13, 2), (14, 3), (16, 1)],
  term ((24 : Rat) / 13) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (14, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(8, 1), (15, 2), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-400 : Rat) / 299) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 13) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-40 : Rat) / 13) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-24 : Rat) / 13) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((46 : Rat) / 13) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((46 : Rat) / 13) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 299) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((16 : Rat) / 299) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((58 : Rat) / 13) [(12, 1), (14, 2), (16, 1)],
  term ((58 : Rat) / 13) [(12, 1), (15, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(12, 2), (14, 2), (16, 1)],
  term ((-34 : Rat) / 13) [(12, 2), (15, 2), (16, 1)],
  term ((24 : Rat) / 13) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(13, 1), (15, 3), (16, 1)],
  term ((-58 : Rat) / 13) [(13, 2), (14, 2), (16, 1)],
  term ((-58 : Rat) / 13) [(13, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 13) [(14, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 13) [(14, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 13) [(14, 2), (16, 1)],
  term ((-64 : Rat) / 13) [(14, 3), (16, 1)],
  term ((17 : Rat) / 13) [(14, 4), (16, 1)],
  term ((32 : Rat) / 13) [(15, 2), (16, 1)],
  term ((17 : Rat) / 13) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 300 through 343. -/
theorem rs_R003_ueqv_R003NY_block_12_0300_0343_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_12_0300_0343
      rs_R003_ueqv_R003NY_block_12_0300_0343 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
