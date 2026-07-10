/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYNY, term block 3:300-308

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYNYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R009:u=v:R009NYYNY`. -/
def rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0300 : Poly :=
[
  term ((-9 : Rat) / 2) [(10, 1), (11, 2)]
]

/-- Partial product 300 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0300 : Poly :=
[
  term (9 : Rat) [(4, 1), (10, 1), (11, 2)],
  term ((-9 : Rat) / 2) [(4, 2), (10, 1), (11, 2)],
  term ((-9 : Rat) / 2) [(5, 2), (10, 1), (11, 2)],
  term (-9 : Rat) [(8, 1), (10, 1), (11, 2)],
  term ((9 : Rat) / 2) [(8, 2), (10, 1), (11, 2)],
  term ((9 : Rat) / 2) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0300_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0300
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0301 : Poly :=
[
  term ((-3 : Rat) / 4) [(10, 2)]
]

/-- Partial product 301 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0301 : Poly :=
[
  term ((3 : Rat) / 2) [(4, 1), (10, 2)],
  term ((-3 : Rat) / 4) [(4, 2), (10, 2)],
  term ((-3 : Rat) / 4) [(5, 2), (10, 2)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 2)],
  term ((3 : Rat) / 4) [(8, 2), (10, 2)],
  term ((3 : Rat) / 4) [(9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0301_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0301
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0302 : Poly :=
[
  term ((-9 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 302 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0302 : Poly :=
[
  term (9 : Rat) [(4, 1), (11, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term ((-9 : Rat) / 2) [(5, 2), (11, 1), (13, 1)],
  term (-9 : Rat) [(8, 1), (11, 1), (13, 1)],
  term ((9 : Rat) / 2) [(8, 2), (11, 1), (13, 1)],
  term ((9 : Rat) / 2) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0302_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0302
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0303 : Poly :=
[
  term (-20 : Rat) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 303 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0303 : Poly :=
[
  term (40 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term (-20 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term (-20 : Rat) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term (-40 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term (20 : Rat) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term (20 : Rat) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0303_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0303
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0304 : Poly :=
[
  term ((437 : Rat) / 24) [(11, 1), (15, 1)]
]

/-- Partial product 304 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0304 : Poly :=
[
  term ((-437 : Rat) / 12) [(4, 1), (11, 1), (15, 1)],
  term ((437 : Rat) / 24) [(4, 2), (11, 1), (15, 1)],
  term ((437 : Rat) / 24) [(5, 2), (11, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (11, 1), (15, 1)],
  term ((-437 : Rat) / 24) [(8, 2), (11, 1), (15, 1)],
  term ((-437 : Rat) / 24) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0304_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0304
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0305 : Poly :=
[
  term ((-69 : Rat) / 16) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0305 : Poly :=
[
  term ((69 : Rat) / 8) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 16) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 16) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 16) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 16) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0305_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0305
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0306 : Poly :=
[
  term (21 : Rat) [(11, 2)]
]

/-- Partial product 306 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0306 : Poly :=
[
  term (-42 : Rat) [(4, 1), (11, 2)],
  term (21 : Rat) [(4, 2), (11, 2)],
  term (21 : Rat) [(5, 2), (11, 2)],
  term (42 : Rat) [(8, 1), (11, 2)],
  term (-21 : Rat) [(8, 2), (11, 2)],
  term (-21 : Rat) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0306_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0306
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0307 : Poly :=
[
  term ((4 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 307 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0307 : Poly :=
[
  term ((-8 : Rat) / 3) [(4, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 2), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 2), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0307_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0307
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYNY_coefficient_03_0308 : Poly :=
[
  term ((-2 : Rat) / 3) [(14, 1)]
]

/-- Partial product 308 for generator 3. -/
def rs_R009_ueqv_R009NYYNY_partial_03_0308 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (14, 1)],
  term ((-2 : Rat) / 3) [(4, 2), (14, 1)],
  term ((-2 : Rat) / 3) [(5, 2), (14, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (14, 1)],
  term ((2 : Rat) / 3) [(8, 2), (14, 1)],
  term ((2 : Rat) / 3) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 3. -/
theorem rs_R009_ueqv_R009NYYNY_partial_03_0308_valid :
    mulPoly rs_R009_ueqv_R009NYYNY_coefficient_03_0308
        rs_R009_ueqv_R009NYYNY_generator_03_0300_0308 =
      rs_R009_ueqv_R009NYYNY_partial_03_0308 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_partials_03_0300_0308 : List Poly :=
[
  rs_R009_ueqv_R009NYYNY_partial_03_0300,
  rs_R009_ueqv_R009NYYNY_partial_03_0301,
  rs_R009_ueqv_R009NYYNY_partial_03_0302,
  rs_R009_ueqv_R009NYYNY_partial_03_0303,
  rs_R009_ueqv_R009NYYNY_partial_03_0304,
  rs_R009_ueqv_R009NYYNY_partial_03_0305,
  rs_R009_ueqv_R009NYYNY_partial_03_0306,
  rs_R009_ueqv_R009NYYNY_partial_03_0307,
  rs_R009_ueqv_R009NYYNY_partial_03_0308
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYNY_block_03_0300_0308 : Poly :=
[
  term (9 : Rat) [(4, 1), (10, 1), (11, 2)],
  term ((3 : Rat) / 2) [(4, 1), (10, 2)],
  term (9 : Rat) [(4, 1), (11, 1), (13, 1)],
  term (40 : Rat) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 12) [(4, 1), (11, 1), (15, 1)],
  term ((69 : Rat) / 8) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-42 : Rat) [(4, 1), (11, 2)],
  term ((-8 : Rat) / 3) [(4, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (14, 1)],
  term ((-9 : Rat) / 2) [(4, 2), (10, 1), (11, 2)],
  term ((-3 : Rat) / 4) [(4, 2), (10, 2)],
  term ((-9 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term (-20 : Rat) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 24) [(4, 2), (11, 1), (15, 1)],
  term ((-69 : Rat) / 16) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (21 : Rat) [(4, 2), (11, 2)],
  term ((4 : Rat) / 3) [(4, 2), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(4, 2), (14, 1)],
  term ((-9 : Rat) / 2) [(5, 2), (10, 1), (11, 2)],
  term ((-3 : Rat) / 4) [(5, 2), (10, 2)],
  term ((-9 : Rat) / 2) [(5, 2), (11, 1), (13, 1)],
  term (-20 : Rat) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 24) [(5, 2), (11, 1), (15, 1)],
  term ((-69 : Rat) / 16) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term (21 : Rat) [(5, 2), (11, 2)],
  term ((4 : Rat) / 3) [(5, 2), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 2), (14, 1)],
  term (-9 : Rat) [(8, 1), (10, 1), (11, 2)],
  term ((-3 : Rat) / 2) [(8, 1), (10, 2)],
  term (-9 : Rat) [(8, 1), (11, 1), (13, 1)],
  term (-40 : Rat) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((437 : Rat) / 12) [(8, 1), (11, 1), (15, 1)],
  term ((-69 : Rat) / 8) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(8, 1), (11, 2)],
  term ((8 : Rat) / 3) [(8, 1), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(8, 1), (14, 1)],
  term ((9 : Rat) / 2) [(8, 2), (10, 1), (11, 2)],
  term ((3 : Rat) / 4) [(8, 2), (10, 2)],
  term ((9 : Rat) / 2) [(8, 2), (11, 1), (13, 1)],
  term (20 : Rat) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 24) [(8, 2), (11, 1), (15, 1)],
  term ((69 : Rat) / 16) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(8, 2), (11, 2)],
  term ((-4 : Rat) / 3) [(8, 2), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(8, 2), (14, 1)],
  term ((9 : Rat) / 2) [(9, 2), (10, 1), (11, 2)],
  term ((3 : Rat) / 4) [(9, 2), (10, 2)],
  term ((9 : Rat) / 2) [(9, 2), (11, 1), (13, 1)],
  term (20 : Rat) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-437 : Rat) / 24) [(9, 2), (11, 1), (15, 1)],
  term ((69 : Rat) / 16) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term (-21 : Rat) [(9, 2), (11, 2)],
  term ((-4 : Rat) / 3) [(9, 2), (13, 1), (15, 1)],
  term ((2 : Rat) / 3) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 300 through 308. -/
theorem rs_R009_ueqv_R009NYYNY_block_03_0300_0308_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYNY_partials_03_0300_0308
      rs_R009_ueqv_R009NYYNY_block_03_0300_0308 = true := by
  native_decide

end R009UeqvR009NYYNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
