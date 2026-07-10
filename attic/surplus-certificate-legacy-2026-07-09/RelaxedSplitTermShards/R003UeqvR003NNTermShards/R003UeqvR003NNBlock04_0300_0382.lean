/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 4:300-382

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_04_0300_0382 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0300 : Poly :=
[
  term ((1452832 : Rat) / 402111) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0300 : Poly :=
[
  term ((-2905664 : Rat) / 402111) [(4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1452832 : Rat) / 402111) [(4, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((1452832 : Rat) / 402111) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((2905664 : Rat) / 402111) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0300_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0300
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0301 : Poly :=
[
  term ((257614 : Rat) / 44679) [(8, 1), (9, 1), (15, 5), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0301 : Poly :=
[
  term ((-515228 : Rat) / 44679) [(4, 1), (8, 1), (9, 1), (15, 5), (16, 1)],
  term ((257614 : Rat) / 44679) [(4, 2), (8, 1), (9, 1), (15, 5), (16, 1)],
  term ((257614 : Rat) / 44679) [(5, 2), (8, 1), (9, 1), (15, 5), (16, 1)],
  term ((515228 : Rat) / 44679) [(8, 1), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (12, 2), (15, 5), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0301_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0301
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0302 : Poly :=
[
  term (42 : Rat) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 302 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0302 : Poly :=
[
  term (-84 : Rat) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term (42 : Rat) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term (42 : Rat) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term (84 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term (-42 : Rat) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term (-42 : Rat) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0302_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0302
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0303 : Poly :=
[
  term ((-1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0303 : Poly :=
[
  term ((1180595 : Rat) / 402111) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(4, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(5, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 402111) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0303_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0303
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0304 : Poly :=
[
  term (-57 : Rat) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 304 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0304 : Poly :=
[
  term (114 : Rat) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term (-57 : Rat) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term (-57 : Rat) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term (-114 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term (57 : Rat) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term (57 : Rat) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0304_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0304
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0305 : Poly :=
[
  term ((-410243 : Rat) / 714864) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0305 : Poly :=
[
  term ((410243 : Rat) / 357432) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410243 : Rat) / 714864) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410243 : Rat) / 714864) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-410243 : Rat) / 357432) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((410243 : Rat) / 714864) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((410243 : Rat) / 714864) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0305_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0305
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0306 : Poly :=
[
  term ((1201927 : Rat) / 804222) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0306 : Poly :=
[
  term ((-1201927 : Rat) / 402111) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((1201927 : Rat) / 804222) [(4, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((1201927 : Rat) / 804222) [(5, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((1201927 : Rat) / 402111) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1201927 : Rat) / 804222) [(8, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1201927 : Rat) / 804222) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0306_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0306
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0307 : Poly :=
[
  term (-21 : Rat) [(8, 1), (12, 1)]
]

/-- Partial product 307 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0307 : Poly :=
[
  term (42 : Rat) [(4, 1), (8, 1), (12, 1)],
  term (-21 : Rat) [(4, 2), (8, 1), (12, 1)],
  term (-21 : Rat) [(5, 2), (8, 1), (12, 1)],
  term (21 : Rat) [(8, 1), (12, 1), (13, 2)],
  term (-42 : Rat) [(8, 1), (12, 2)],
  term (21 : Rat) [(8, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0307_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0307
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0308 : Poly :=
[
  term ((22771511 : Rat) / 3216888) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0308 : Poly :=
[
  term ((-22771511 : Rat) / 1608444) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((22771511 : Rat) / 3216888) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((22771511 : Rat) / 3216888) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22771511 : Rat) / 3216888) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((22771511 : Rat) / 1608444) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-22771511 : Rat) / 3216888) [(8, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0308_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0308
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0309 : Poly :=
[
  term (-439 : Rat) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 309 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0309 : Poly :=
[
  term (878 : Rat) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term (-439 : Rat) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term (-439 : Rat) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term (-878 : Rat) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term (439 : Rat) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term (439 : Rat) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0309_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0309
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0310 : Poly :=
[
  term ((-18365503 : Rat) / 6433776) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0310 : Poly :=
[
  term ((18365503 : Rat) / 3216888) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18365503 : Rat) / 6433776) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18365503 : Rat) / 6433776) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18365503 : Rat) / 3216888) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18365503 : Rat) / 6433776) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((18365503 : Rat) / 6433776) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0310_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0310
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0311 : Poly :=
[
  term (-96 : Rat) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 311 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0311 : Poly :=
[
  term (192 : Rat) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term (-96 : Rat) [(4, 2), (8, 1), (13, 1), (15, 3)],
  term (-96 : Rat) [(5, 2), (8, 1), (13, 1), (15, 3)],
  term (-192 : Rat) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term (96 : Rat) [(8, 1), (12, 2), (13, 1), (15, 3)],
  term (96 : Rat) [(8, 1), (13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0311_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0311
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0312 : Poly :=
[
  term ((1498201 : Rat) / 536148) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 312 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0312 : Poly :=
[
  term ((-1498201 : Rat) / 268074) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1498201 : Rat) / 536148) [(4, 2), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1498201 : Rat) / 536148) [(5, 2), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1498201 : Rat) / 268074) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1498201 : Rat) / 536148) [(8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1498201 : Rat) / 536148) [(8, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0312_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0312
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0313 : Poly :=
[
  term ((128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)]
]

/-- Partial product 313 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0313 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(4, 1), (8, 1), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (8, 1), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (8, 1), (13, 1), (15, 5), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (12, 1), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (12, 2), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0313_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0313
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0314 : Poly :=
[
  term (216 : Rat) [(8, 1), (13, 2)]
]

/-- Partial product 314 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0314 : Poly :=
[
  term (-432 : Rat) [(4, 1), (8, 1), (13, 2)],
  term (216 : Rat) [(4, 2), (8, 1), (13, 2)],
  term (216 : Rat) [(5, 2), (8, 1), (13, 2)],
  term (432 : Rat) [(8, 1), (12, 1), (13, 2)],
  term (-216 : Rat) [(8, 1), (12, 2), (13, 2)],
  term (-216 : Rat) [(8, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0314_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0314
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0315 : Poly :=
[
  term (182 : Rat) [(8, 1), (15, 2)]
]

/-- Partial product 315 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0315 : Poly :=
[
  term (-364 : Rat) [(4, 1), (8, 1), (15, 2)],
  term (182 : Rat) [(4, 2), (8, 1), (15, 2)],
  term (182 : Rat) [(5, 2), (8, 1), (15, 2)],
  term (364 : Rat) [(8, 1), (12, 1), (15, 2)],
  term (-182 : Rat) [(8, 1), (12, 2), (15, 2)],
  term (-182 : Rat) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0315_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0315
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0316 : Poly :=
[
  term ((-1597929 : Rat) / 476576) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0316 : Poly :=
[
  term ((1597929 : Rat) / 238288) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1597929 : Rat) / 476576) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1597929 : Rat) / 476576) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1597929 : Rat) / 238288) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1597929 : Rat) / 476576) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((1597929 : Rat) / 476576) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0316_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0316
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0317 : Poly :=
[
  term (192 : Rat) [(8, 1), (15, 4)]
]

/-- Partial product 317 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0317 : Poly :=
[
  term (-384 : Rat) [(4, 1), (8, 1), (15, 4)],
  term (192 : Rat) [(4, 2), (8, 1), (15, 4)],
  term (192 : Rat) [(5, 2), (8, 1), (15, 4)],
  term (384 : Rat) [(8, 1), (12, 1), (15, 4)],
  term (-192 : Rat) [(8, 1), (12, 2), (15, 4)],
  term (-192 : Rat) [(8, 1), (13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0317_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0317
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0318 : Poly :=
[
  term ((-5701349 : Rat) / 536148) [(8, 1), (15, 4), (16, 1)]
]

/-- Partial product 318 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0318 : Poly :=
[
  term ((5701349 : Rat) / 268074) [(4, 1), (8, 1), (15, 4), (16, 1)],
  term ((-5701349 : Rat) / 536148) [(4, 2), (8, 1), (15, 4), (16, 1)],
  term ((-5701349 : Rat) / 536148) [(5, 2), (8, 1), (15, 4), (16, 1)],
  term ((-5701349 : Rat) / 268074) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((5701349 : Rat) / 536148) [(8, 1), (12, 2), (15, 4), (16, 1)],
  term ((5701349 : Rat) / 536148) [(8, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0318_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0318
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0319 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(8, 1), (15, 6), (16, 1)]
]

/-- Partial product 319 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0319 : Poly :=
[
  term ((515228 : Rat) / 44679) [(4, 1), (8, 1), (15, 6), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 2), (8, 1), (15, 6), (16, 1)],
  term ((-257614 : Rat) / 44679) [(5, 2), (8, 1), (15, 6), (16, 1)],
  term ((-515228 : Rat) / 44679) [(8, 1), (12, 1), (15, 6), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (12, 2), (15, 6), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (13, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0319_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0319
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0320 : Poly :=
[
  term ((261 : Rat) / 2) [(8, 2)]
]

/-- Partial product 320 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0320 : Poly :=
[
  term (-261 : Rat) [(4, 1), (8, 2)],
  term ((261 : Rat) / 2) [(4, 2), (8, 2)],
  term ((261 : Rat) / 2) [(5, 2), (8, 2)],
  term (261 : Rat) [(8, 2), (12, 1)],
  term ((-261 : Rat) / 2) [(8, 2), (12, 2)],
  term ((-261 : Rat) / 2) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0320_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0320
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0321 : Poly :=
[
  term (-144 : Rat) [(8, 2), (15, 2)]
]

/-- Partial product 321 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0321 : Poly :=
[
  term (288 : Rat) [(4, 1), (8, 2), (15, 2)],
  term (-144 : Rat) [(4, 2), (8, 2), (15, 2)],
  term (-144 : Rat) [(5, 2), (8, 2), (15, 2)],
  term (-288 : Rat) [(8, 2), (12, 1), (15, 2)],
  term (144 : Rat) [(8, 2), (12, 2), (15, 2)],
  term (144 : Rat) [(8, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0321_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0321
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0322 : Poly :=
[
  term ((293569 : Rat) / 536148) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 322 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0322 : Poly :=
[
  term ((-293569 : Rat) / 268074) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((293569 : Rat) / 536148) [(4, 2), (8, 2), (15, 2), (16, 1)],
  term ((293569 : Rat) / 536148) [(5, 2), (8, 2), (15, 2), (16, 1)],
  term ((293569 : Rat) / 268074) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-293569 : Rat) / 536148) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((-293569 : Rat) / 536148) [(8, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0322_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0322
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0323 : Poly :=
[
  term ((128807 : Rat) / 29786) [(8, 2), (15, 4), (16, 1)]
]

/-- Partial product 323 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0323 : Poly :=
[
  term ((-128807 : Rat) / 14893) [(4, 1), (8, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 29786) [(4, 2), (8, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 29786) [(5, 2), (8, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 14893) [(8, 2), (12, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (12, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0323_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0323
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0324 : Poly :=
[
  term (-50 : Rat) [(9, 1), (11, 1)]
]

/-- Partial product 324 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0324 : Poly :=
[
  term (100 : Rat) [(4, 1), (9, 1), (11, 1)],
  term (-50 : Rat) [(4, 2), (9, 1), (11, 1)],
  term (-50 : Rat) [(5, 2), (9, 1), (11, 1)],
  term (-100 : Rat) [(9, 1), (11, 1), (12, 1)],
  term (50 : Rat) [(9, 1), (11, 1), (12, 2)],
  term (50 : Rat) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0324_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0324
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0325 : Poly :=
[
  term (-42 : Rat) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 325 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0325 : Poly :=
[
  term (84 : Rat) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term (-42 : Rat) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term (-42 : Rat) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term (42 : Rat) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term (-84 : Rat) [(9, 1), (11, 1), (12, 2)],
  term (42 : Rat) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0325_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0325
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0326 : Poly :=
[
  term ((1180595 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 326 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0326 : Poly :=
[
  term ((-1180595 : Rat) / 402111) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 402111) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(9, 1), (11, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0326_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0326
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0327 : Poly :=
[
  term (96 : Rat) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 327 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0327 : Poly :=
[
  term (-192 : Rat) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term (96 : Rat) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term (96 : Rat) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term (192 : Rat) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term (-96 : Rat) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term (-96 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0327_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0327
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0328 : Poly :=
[
  term ((-2540575 : Rat) / 1608444) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 328 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0328 : Poly :=
[
  term ((2540575 : Rat) / 804222) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2540575 : Rat) / 1608444) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2540575 : Rat) / 1608444) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2540575 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2540575 : Rat) / 1608444) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2540575 : Rat) / 1608444) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0328_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0328
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0329 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 329 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0329 : Poly :=
[
  term ((257614 : Rat) / 44679) [(4, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0329_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0329
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0330 : Poly :=
[
  term (-216 : Rat) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 330 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0330 : Poly :=
[
  term (432 : Rat) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term (-216 : Rat) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term (-216 : Rat) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term (216 : Rat) [(9, 1), (12, 1), (13, 3)],
  term (-432 : Rat) [(9, 1), (12, 2), (13, 1)],
  term (216 : Rat) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0330_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0330
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0331 : Poly :=
[
  term (-48 : Rat) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 331 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0331 : Poly :=
[
  term (96 : Rat) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term (-48 : Rat) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term (-48 : Rat) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term (48 : Rat) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term (-96 : Rat) [(9, 1), (12, 2), (15, 1)],
  term (48 : Rat) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0331_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0331
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0332 : Poly :=
[
  term ((-149669 : Rat) / 804222) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0332 : Poly :=
[
  term ((149669 : Rat) / 402111) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-149669 : Rat) / 804222) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-149669 : Rat) / 804222) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((149669 : Rat) / 804222) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-149669 : Rat) / 402111) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((149669 : Rat) / 804222) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0332_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0332
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0333 : Poly :=
[
  term (192 : Rat) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 333 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0333 : Poly :=
[
  term (-384 : Rat) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term (192 : Rat) [(4, 2), (9, 1), (12, 1), (15, 3)],
  term (192 : Rat) [(5, 2), (9, 1), (12, 1), (15, 3)],
  term (-192 : Rat) [(9, 1), (12, 1), (13, 2), (15, 3)],
  term (384 : Rat) [(9, 1), (12, 2), (15, 3)],
  term (-192 : Rat) [(9, 1), (12, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0333_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0333
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0334 : Poly :=
[
  term ((-6627425 : Rat) / 1608444) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 334 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0334 : Poly :=
[
  term ((6627425 : Rat) / 804222) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-6627425 : Rat) / 1608444) [(4, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-6627425 : Rat) / 1608444) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((6627425 : Rat) / 1608444) [(9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-6627425 : Rat) / 804222) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((6627425 : Rat) / 1608444) [(9, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0334_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0334
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0335 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)]
]

/-- Partial product 335 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0335 : Poly :=
[
  term ((515228 : Rat) / 44679) [(4, 1), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 2), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-257614 : Rat) / 44679) [(5, 2), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (13, 2), (15, 5), (16, 1)],
  term ((-515228 : Rat) / 44679) [(9, 1), (12, 2), (15, 5), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0335_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0335
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0336 : Poly :=
[
  term ((271 : Rat) / 2) [(9, 1), (13, 1)]
]

/-- Partial product 336 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0336 : Poly :=
[
  term (-271 : Rat) [(4, 1), (9, 1), (13, 1)],
  term ((271 : Rat) / 2) [(4, 2), (9, 1), (13, 1)],
  term ((271 : Rat) / 2) [(5, 2), (9, 1), (13, 1)],
  term (271 : Rat) [(9, 1), (12, 1), (13, 1)],
  term ((-271 : Rat) / 2) [(9, 1), (12, 2), (13, 1)],
  term ((-271 : Rat) / 2) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0336_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0336
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0337 : Poly :=
[
  term (-48 : Rat) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 337 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0337 : Poly :=
[
  term (96 : Rat) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term (-48 : Rat) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term (-48 : Rat) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term (-96 : Rat) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term (48 : Rat) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term (48 : Rat) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0337_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0337
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0338 : Poly :=
[
  term ((1066411 : Rat) / 1608444) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 338 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0338 : Poly :=
[
  term ((-1066411 : Rat) / 804222) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1066411 : Rat) / 1608444) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1066411 : Rat) / 1608444) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1066411 : Rat) / 804222) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1066411 : Rat) / 1608444) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1066411 : Rat) / 1608444) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0338_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0338
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0339 : Poly :=
[
  term ((128807 : Rat) / 89358) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 339 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0339 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(4, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (12, 2), (13, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0339_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0339
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0340 : Poly :=
[
  term ((-119 : Rat) / 2) [(9, 1), (15, 1)]
]

/-- Partial product 340 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0340 : Poly :=
[
  term (119 : Rat) [(4, 1), (9, 1), (15, 1)],
  term ((-119 : Rat) / 2) [(4, 2), (9, 1), (15, 1)],
  term ((-119 : Rat) / 2) [(5, 2), (9, 1), (15, 1)],
  term (-119 : Rat) [(9, 1), (12, 1), (15, 1)],
  term ((119 : Rat) / 2) [(9, 1), (12, 2), (15, 1)],
  term ((119 : Rat) / 2) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0340_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0340
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0341 : Poly :=
[
  term ((70235 : Rat) / 29786) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0341 : Poly :=
[
  term ((-70235 : Rat) / 14893) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((70235 : Rat) / 29786) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((70235 : Rat) / 29786) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((70235 : Rat) / 14893) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70235 : Rat) / 29786) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-70235 : Rat) / 29786) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0341_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0341
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0342 : Poly :=
[
  term (-48 : Rat) [(9, 1), (15, 3)]
]

/-- Partial product 342 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0342 : Poly :=
[
  term (96 : Rat) [(4, 1), (9, 1), (15, 3)],
  term (-48 : Rat) [(4, 2), (9, 1), (15, 3)],
  term (-48 : Rat) [(5, 2), (9, 1), (15, 3)],
  term (-96 : Rat) [(9, 1), (12, 1), (15, 3)],
  term (48 : Rat) [(9, 1), (12, 2), (15, 3)],
  term (48 : Rat) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0342_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0342
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0343 : Poly :=
[
  term ((3301499 : Rat) / 1072296) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 343 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0343 : Poly :=
[
  term ((-3301499 : Rat) / 536148) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((3301499 : Rat) / 1072296) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((3301499 : Rat) / 1072296) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((3301499 : Rat) / 536148) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3301499 : Rat) / 1072296) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-3301499 : Rat) / 1072296) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0343_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0343
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0344 : Poly :=
[
  term ((128807 : Rat) / 89358) [(9, 1), (15, 5), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0344 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(4, 1), (9, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (9, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (9, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (12, 2), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0344_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0344
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0345 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 2)]
]

/-- Partial product 345 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0345 : Poly :=
[
  term (-9 : Rat) [(4, 1), (9, 2)],
  term ((9 : Rat) / 2) [(4, 2), (9, 2)],
  term ((9 : Rat) / 2) [(5, 2), (9, 2)],
  term (9 : Rat) [(9, 2), (12, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (12, 2)],
  term ((-9 : Rat) / 2) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0345_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0345
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0346 : Poly :=
[
  term (-9 : Rat) [(9, 2), (12, 1)]
]

/-- Partial product 346 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0346 : Poly :=
[
  term (18 : Rat) [(4, 1), (9, 2), (12, 1)],
  term (-9 : Rat) [(4, 2), (9, 2), (12, 1)],
  term (-9 : Rat) [(5, 2), (9, 2), (12, 1)],
  term (9 : Rat) [(9, 2), (12, 1), (13, 2)],
  term (-18 : Rat) [(9, 2), (12, 2)],
  term (9 : Rat) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0346_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0346
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0347 : Poly :=
[
  term (-96 : Rat) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 347 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0347 : Poly :=
[
  term (192 : Rat) [(4, 1), (9, 2), (12, 1), (15, 2)],
  term (-96 : Rat) [(4, 2), (9, 2), (12, 1), (15, 2)],
  term (-96 : Rat) [(5, 2), (9, 2), (12, 1), (15, 2)],
  term (96 : Rat) [(9, 2), (12, 1), (13, 2), (15, 2)],
  term (-192 : Rat) [(9, 2), (12, 2), (15, 2)],
  term (96 : Rat) [(9, 2), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0347_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0347
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0348 : Poly :=
[
  term ((2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 348 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0348 : Poly :=
[
  term ((-2612095 : Rat) / 402111) [(4, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 804222) [(4, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 804222) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 402111) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0348_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0348
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0349 : Poly :=
[
  term ((128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 349 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0349 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(4, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 1), (13, 2), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 2), (12, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0349_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0349
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0350 : Poly :=
[
  term (48 : Rat) [(9, 2), (15, 2)]
]

/-- Partial product 350 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0350 : Poly :=
[
  term (-96 : Rat) [(4, 1), (9, 2), (15, 2)],
  term (48 : Rat) [(4, 2), (9, 2), (15, 2)],
  term (48 : Rat) [(5, 2), (9, 2), (15, 2)],
  term (96 : Rat) [(9, 2), (12, 1), (15, 2)],
  term (-48 : Rat) [(9, 2), (12, 2), (15, 2)],
  term (-48 : Rat) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0350_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0350
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0351 : Poly :=
[
  term ((-2612095 : Rat) / 1608444) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 351 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0351 : Poly :=
[
  term ((2612095 : Rat) / 804222) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2612095 : Rat) / 1608444) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2612095 : Rat) / 1608444) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 1608444) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((2612095 : Rat) / 1608444) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0351_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0351
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0352 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(9, 2), (15, 4), (16, 1)]
]

/-- Partial product 352 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0352 : Poly :=
[
  term ((128807 : Rat) / 44679) [(4, 1), (9, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(4, 2), (9, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 89358) [(5, 2), (9, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 2), (12, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0352_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0352
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0353 : Poly :=
[
  term ((66847 : Rat) / 134037) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0353 : Poly :=
[
  term ((-133694 : Rat) / 134037) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((133694 : Rat) / 134037) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0353_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0353
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0354 : Poly :=
[
  term (42 : Rat) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 354 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0354 : Poly :=
[
  term (-84 : Rat) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term (42 : Rat) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term (42 : Rat) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term (-42 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term (84 : Rat) [(11, 1), (12, 2), (15, 1)],
  term (-42 : Rat) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0354_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0354
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0355 : Poly :=
[
  term ((-1180595 : Rat) / 804222) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 355 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0355 : Poly :=
[
  term ((1180595 : Rat) / 402111) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 804222) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 402111) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0355_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0355
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0356 : Poly :=
[
  term ((-21 : Rat) / 2) [(11, 1), (13, 1)]
]

/-- Partial product 356 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0356 : Poly :=
[
  term (21 : Rat) [(4, 1), (11, 1), (13, 1)],
  term ((-21 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term ((-21 : Rat) / 2) [(5, 2), (11, 1), (13, 1)],
  term (-21 : Rat) [(11, 1), (12, 1), (13, 1)],
  term ((21 : Rat) / 2) [(11, 1), (12, 2), (13, 1)],
  term ((21 : Rat) / 2) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0356_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0356
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0357 : Poly :=
[
  term ((1180595 : Rat) / 1608444) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0357 : Poly :=
[
  term ((-1180595 : Rat) / 804222) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 1608444) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 1608444) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0357_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0357
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0358 : Poly :=
[
  term ((-107 : Rat) / 4) [(11, 1), (15, 1)]
]

/-- Partial product 358 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0358 : Poly :=
[
  term ((107 : Rat) / 2) [(4, 1), (11, 1), (15, 1)],
  term ((-107 : Rat) / 4) [(4, 2), (11, 1), (15, 1)],
  term ((-107 : Rat) / 4) [(5, 2), (11, 1), (15, 1)],
  term ((-107 : Rat) / 2) [(11, 1), (12, 1), (15, 1)],
  term ((107 : Rat) / 4) [(11, 1), (12, 2), (15, 1)],
  term ((107 : Rat) / 4) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0358_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0358
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0359 : Poly :=
[
  term ((80374255 : Rat) / 51470208) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0359 : Poly :=
[
  term ((-80374255 : Rat) / 25735104) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((80374255 : Rat) / 51470208) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((80374255 : Rat) / 51470208) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((80374255 : Rat) / 25735104) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-80374255 : Rat) / 51470208) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-80374255 : Rat) / 51470208) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0359_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0359
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0360 : Poly :=
[
  term (-24 : Rat) [(11, 1), (15, 3)]
]

/-- Partial product 360 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0360 : Poly :=
[
  term (48 : Rat) [(4, 1), (11, 1), (15, 3)],
  term (-24 : Rat) [(4, 2), (11, 1), (15, 3)],
  term (-24 : Rat) [(5, 2), (11, 1), (15, 3)],
  term (-48 : Rat) [(11, 1), (12, 1), (15, 3)],
  term (24 : Rat) [(11, 1), (12, 2), (15, 3)],
  term (24 : Rat) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0360_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0360
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0361 : Poly :=
[
  term ((108589 : Rat) / 44679) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 361 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0361 : Poly :=
[
  term ((-217178 : Rat) / 44679) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((108589 : Rat) / 44679) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((108589 : Rat) / 44679) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((217178 : Rat) / 44679) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-108589 : Rat) / 44679) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-108589 : Rat) / 44679) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0361_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0361
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0362 : Poly :=
[
  term ((128807 : Rat) / 178716) [(11, 1), (15, 5), (16, 1)]
]

/-- Partial product 362 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0362 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(4, 1), (11, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 178716) [(4, 2), (11, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 178716) [(5, 2), (11, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (12, 2), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (13, 2), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0362_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0362
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0363 : Poly :=
[
  term ((21 : Rat) / 2) [(11, 2)]
]

/-- Partial product 363 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0363 : Poly :=
[
  term (-21 : Rat) [(4, 1), (11, 2)],
  term ((21 : Rat) / 2) [(4, 2), (11, 2)],
  term ((21 : Rat) / 2) [(5, 2), (11, 2)],
  term (21 : Rat) [(11, 2), (12, 1)],
  term ((-21 : Rat) / 2) [(11, 2), (12, 2)],
  term ((-21 : Rat) / 2) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0363_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0363
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0364 : Poly :=
[
  term ((-1180595 : Rat) / 3216888) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 364 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0364 : Poly :=
[
  term ((1180595 : Rat) / 1608444) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 3216888) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 3216888) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0364_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0364
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0365 : Poly :=
[
  term ((-3 : Rat) / 8) [(12, 1)]
]

/-- Partial product 365 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0365 : Poly :=
[
  term ((3 : Rat) / 4) [(4, 1), (12, 1)],
  term ((-3 : Rat) / 8) [(4, 2), (12, 1)],
  term ((-3 : Rat) / 8) [(5, 2), (12, 1)],
  term ((3 : Rat) / 8) [(12, 1), (13, 2)],
  term ((-3 : Rat) / 4) [(12, 2)],
  term ((3 : Rat) / 8) [(12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0365_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0365
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0366 : Poly :=
[
  term (-108 : Rat) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 366 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0366 : Poly :=
[
  term (216 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term (-108 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term (-108 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term (108 : Rat) [(12, 1), (13, 3), (15, 1)],
  term (-216 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (108 : Rat) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0366_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0366
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0367 : Poly :=
[
  term ((251 : Rat) / 2) [(12, 1), (15, 2)]
]

/-- Partial product 367 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0367 : Poly :=
[
  term (-251 : Rat) [(4, 1), (12, 1), (15, 2)],
  term ((251 : Rat) / 2) [(4, 2), (12, 1), (15, 2)],
  term ((251 : Rat) / 2) [(5, 2), (12, 1), (15, 2)],
  term ((-251 : Rat) / 2) [(12, 1), (13, 2), (15, 2)],
  term (251 : Rat) [(12, 2), (15, 2)],
  term ((-251 : Rat) / 2) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0367_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0367
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0368 : Poly :=
[
  term ((-1872629 : Rat) / 268074) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 368 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0368 : Poly :=
[
  term ((1872629 : Rat) / 134037) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1872629 : Rat) / 268074) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1872629 : Rat) / 268074) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((1872629 : Rat) / 268074) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1872629 : Rat) / 134037) [(12, 2), (15, 2), (16, 1)],
  term ((1872629 : Rat) / 268074) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0368_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0368
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0369 : Poly :=
[
  term (-96 : Rat) [(12, 1), (15, 4)]
]

/-- Partial product 369 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0369 : Poly :=
[
  term (192 : Rat) [(4, 1), (12, 1), (15, 4)],
  term (-96 : Rat) [(4, 2), (12, 1), (15, 4)],
  term (-96 : Rat) [(5, 2), (12, 1), (15, 4)],
  term (96 : Rat) [(12, 1), (13, 2), (15, 4)],
  term (-192 : Rat) [(12, 2), (15, 4)],
  term (96 : Rat) [(12, 3), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0369_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0369
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0370 : Poly :=
[
  term ((133325 : Rat) / 29786) [(12, 1), (15, 4), (16, 1)]
]

/-- Partial product 370 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0370 : Poly :=
[
  term ((-133325 : Rat) / 14893) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((133325 : Rat) / 29786) [(4, 2), (12, 1), (15, 4), (16, 1)],
  term ((133325 : Rat) / 29786) [(5, 2), (12, 1), (15, 4), (16, 1)],
  term ((-133325 : Rat) / 29786) [(12, 1), (13, 2), (15, 4), (16, 1)],
  term ((133325 : Rat) / 14893) [(12, 2), (15, 4), (16, 1)],
  term ((-133325 : Rat) / 29786) [(12, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0370_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0370
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0371 : Poly :=
[
  term ((128807 : Rat) / 44679) [(12, 1), (15, 6), (16, 1)]
]

/-- Partial product 371 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0371 : Poly :=
[
  term ((-257614 : Rat) / 44679) [(4, 1), (12, 1), (15, 6), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (12, 1), (15, 6), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (12, 1), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 1), (13, 2), (15, 6), (16, 1)],
  term ((257614 : Rat) / 44679) [(12, 2), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 3), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0371_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0371
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0372 : Poly :=
[
  term (-95 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 372 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0372 : Poly :=
[
  term (190 : Rat) [(4, 1), (13, 1), (15, 1)],
  term (-95 : Rat) [(4, 2), (13, 1), (15, 1)],
  term (-95 : Rat) [(5, 2), (13, 1), (15, 1)],
  term (-190 : Rat) [(12, 1), (13, 1), (15, 1)],
  term (95 : Rat) [(12, 2), (13, 1), (15, 1)],
  term (95 : Rat) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0372_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0372
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0373 : Poly :=
[
  term ((30019117 : Rat) / 8578368) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0373 : Poly :=
[
  term ((-30019117 : Rat) / 4289184) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((30019117 : Rat) / 8578368) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((30019117 : Rat) / 8578368) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((30019117 : Rat) / 4289184) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30019117 : Rat) / 8578368) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30019117 : Rat) / 8578368) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0373_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0373
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0374 : Poly :=
[
  term (48 : Rat) [(13, 1), (15, 3)]
]

/-- Partial product 374 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0374 : Poly :=
[
  term (-96 : Rat) [(4, 1), (13, 1), (15, 3)],
  term (48 : Rat) [(4, 2), (13, 1), (15, 3)],
  term (48 : Rat) [(5, 2), (13, 1), (15, 3)],
  term (96 : Rat) [(12, 1), (13, 1), (15, 3)],
  term (-48 : Rat) [(12, 2), (13, 1), (15, 3)],
  term (-48 : Rat) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0374_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0374
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0375 : Poly :=
[
  term ((-1464577 : Rat) / 714864) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 375 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0375 : Poly :=
[
  term ((1464577 : Rat) / 357432) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1464577 : Rat) / 714864) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1464577 : Rat) / 714864) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1464577 : Rat) / 357432) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1464577 : Rat) / 714864) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1464577 : Rat) / 714864) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0375_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0375
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0376 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(13, 1), (15, 5), (16, 1)]
]

/-- Partial product 376 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0376 : Poly :=
[
  term ((128807 : Rat) / 44679) [(4, 1), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(4, 2), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(5, 2), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 1), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(12, 2), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(13, 3), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0376_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0376
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0377 : Poly :=
[
  term (54 : Rat) [(13, 2)]
]

/-- Partial product 377 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0377 : Poly :=
[
  term (-108 : Rat) [(4, 1), (13, 2)],
  term (54 : Rat) [(4, 2), (13, 2)],
  term (54 : Rat) [(5, 2), (13, 2)],
  term (108 : Rat) [(12, 1), (13, 2)],
  term (-54 : Rat) [(12, 2), (13, 2)],
  term (-54 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0377_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0377
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0378 : Poly :=
[
  term ((153 : Rat) / 8) [(15, 2)]
]

/-- Partial product 378 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0378 : Poly :=
[
  term ((-153 : Rat) / 4) [(4, 1), (15, 2)],
  term ((153 : Rat) / 8) [(4, 2), (15, 2)],
  term ((153 : Rat) / 8) [(5, 2), (15, 2)],
  term ((153 : Rat) / 4) [(12, 1), (15, 2)],
  term ((-153 : Rat) / 8) [(12, 2), (15, 2)],
  term ((-153 : Rat) / 8) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0378_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0378
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0379 : Poly :=
[
  term ((-26579387 : Rat) / 8578368) [(15, 2), (16, 1)]
]

/-- Partial product 379 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0379 : Poly :=
[
  term ((26579387 : Rat) / 4289184) [(4, 1), (15, 2), (16, 1)],
  term ((-26579387 : Rat) / 8578368) [(4, 2), (15, 2), (16, 1)],
  term ((-26579387 : Rat) / 8578368) [(5, 2), (15, 2), (16, 1)],
  term ((-26579387 : Rat) / 4289184) [(12, 1), (15, 2), (16, 1)],
  term ((26579387 : Rat) / 8578368) [(12, 2), (15, 2), (16, 1)],
  term ((26579387 : Rat) / 8578368) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0379_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0379
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0380 : Poly :=
[
  term (-36 : Rat) [(15, 4)]
]

/-- Partial product 380 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0380 : Poly :=
[
  term (72 : Rat) [(4, 1), (15, 4)],
  term (-36 : Rat) [(4, 2), (15, 4)],
  term (-36 : Rat) [(5, 2), (15, 4)],
  term (-72 : Rat) [(12, 1), (15, 4)],
  term (36 : Rat) [(12, 2), (15, 4)],
  term (36 : Rat) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0380_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0380
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0381 : Poly :=
[
  term ((1254163 : Rat) / 536148) [(15, 4), (16, 1)]
]

/-- Partial product 381 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0381 : Poly :=
[
  term ((-1254163 : Rat) / 268074) [(4, 1), (15, 4), (16, 1)],
  term ((1254163 : Rat) / 536148) [(4, 2), (15, 4), (16, 1)],
  term ((1254163 : Rat) / 536148) [(5, 2), (15, 4), (16, 1)],
  term ((1254163 : Rat) / 268074) [(12, 1), (15, 4), (16, 1)],
  term ((-1254163 : Rat) / 536148) [(12, 2), (15, 4), (16, 1)],
  term ((-1254163 : Rat) / 536148) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0381_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0381
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 4. -/
def rs_R003_ueqv_R003NN_coefficient_04_0382 : Poly :=
[
  term ((128807 : Rat) / 119144) [(15, 6), (16, 1)]
]

/-- Partial product 382 for generator 4. -/
def rs_R003_ueqv_R003NN_partial_04_0382 : Poly :=
[
  term ((-128807 : Rat) / 59572) [(4, 1), (15, 6), (16, 1)],
  term ((128807 : Rat) / 119144) [(4, 2), (15, 6), (16, 1)],
  term ((128807 : Rat) / 119144) [(5, 2), (15, 6), (16, 1)],
  term ((128807 : Rat) / 59572) [(12, 1), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 119144) [(12, 2), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 119144) [(13, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 4. -/
theorem rs_R003_ueqv_R003NN_partial_04_0382_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_04_0382
        rs_R003_ueqv_R003NN_generator_04_0300_0382 =
      rs_R003_ueqv_R003NN_partial_04_0382 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_04_0300_0382 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_04_0300,
  rs_R003_ueqv_R003NN_partial_04_0301,
  rs_R003_ueqv_R003NN_partial_04_0302,
  rs_R003_ueqv_R003NN_partial_04_0303,
  rs_R003_ueqv_R003NN_partial_04_0304,
  rs_R003_ueqv_R003NN_partial_04_0305,
  rs_R003_ueqv_R003NN_partial_04_0306,
  rs_R003_ueqv_R003NN_partial_04_0307,
  rs_R003_ueqv_R003NN_partial_04_0308,
  rs_R003_ueqv_R003NN_partial_04_0309,
  rs_R003_ueqv_R003NN_partial_04_0310,
  rs_R003_ueqv_R003NN_partial_04_0311,
  rs_R003_ueqv_R003NN_partial_04_0312,
  rs_R003_ueqv_R003NN_partial_04_0313,
  rs_R003_ueqv_R003NN_partial_04_0314,
  rs_R003_ueqv_R003NN_partial_04_0315,
  rs_R003_ueqv_R003NN_partial_04_0316,
  rs_R003_ueqv_R003NN_partial_04_0317,
  rs_R003_ueqv_R003NN_partial_04_0318,
  rs_R003_ueqv_R003NN_partial_04_0319,
  rs_R003_ueqv_R003NN_partial_04_0320,
  rs_R003_ueqv_R003NN_partial_04_0321,
  rs_R003_ueqv_R003NN_partial_04_0322,
  rs_R003_ueqv_R003NN_partial_04_0323,
  rs_R003_ueqv_R003NN_partial_04_0324,
  rs_R003_ueqv_R003NN_partial_04_0325,
  rs_R003_ueqv_R003NN_partial_04_0326,
  rs_R003_ueqv_R003NN_partial_04_0327,
  rs_R003_ueqv_R003NN_partial_04_0328,
  rs_R003_ueqv_R003NN_partial_04_0329,
  rs_R003_ueqv_R003NN_partial_04_0330,
  rs_R003_ueqv_R003NN_partial_04_0331,
  rs_R003_ueqv_R003NN_partial_04_0332,
  rs_R003_ueqv_R003NN_partial_04_0333,
  rs_R003_ueqv_R003NN_partial_04_0334,
  rs_R003_ueqv_R003NN_partial_04_0335,
  rs_R003_ueqv_R003NN_partial_04_0336,
  rs_R003_ueqv_R003NN_partial_04_0337,
  rs_R003_ueqv_R003NN_partial_04_0338,
  rs_R003_ueqv_R003NN_partial_04_0339,
  rs_R003_ueqv_R003NN_partial_04_0340,
  rs_R003_ueqv_R003NN_partial_04_0341,
  rs_R003_ueqv_R003NN_partial_04_0342,
  rs_R003_ueqv_R003NN_partial_04_0343,
  rs_R003_ueqv_R003NN_partial_04_0344,
  rs_R003_ueqv_R003NN_partial_04_0345,
  rs_R003_ueqv_R003NN_partial_04_0346,
  rs_R003_ueqv_R003NN_partial_04_0347,
  rs_R003_ueqv_R003NN_partial_04_0348,
  rs_R003_ueqv_R003NN_partial_04_0349,
  rs_R003_ueqv_R003NN_partial_04_0350,
  rs_R003_ueqv_R003NN_partial_04_0351,
  rs_R003_ueqv_R003NN_partial_04_0352,
  rs_R003_ueqv_R003NN_partial_04_0353,
  rs_R003_ueqv_R003NN_partial_04_0354,
  rs_R003_ueqv_R003NN_partial_04_0355,
  rs_R003_ueqv_R003NN_partial_04_0356,
  rs_R003_ueqv_R003NN_partial_04_0357,
  rs_R003_ueqv_R003NN_partial_04_0358,
  rs_R003_ueqv_R003NN_partial_04_0359,
  rs_R003_ueqv_R003NN_partial_04_0360,
  rs_R003_ueqv_R003NN_partial_04_0361,
  rs_R003_ueqv_R003NN_partial_04_0362,
  rs_R003_ueqv_R003NN_partial_04_0363,
  rs_R003_ueqv_R003NN_partial_04_0364,
  rs_R003_ueqv_R003NN_partial_04_0365,
  rs_R003_ueqv_R003NN_partial_04_0366,
  rs_R003_ueqv_R003NN_partial_04_0367,
  rs_R003_ueqv_R003NN_partial_04_0368,
  rs_R003_ueqv_R003NN_partial_04_0369,
  rs_R003_ueqv_R003NN_partial_04_0370,
  rs_R003_ueqv_R003NN_partial_04_0371,
  rs_R003_ueqv_R003NN_partial_04_0372,
  rs_R003_ueqv_R003NN_partial_04_0373,
  rs_R003_ueqv_R003NN_partial_04_0374,
  rs_R003_ueqv_R003NN_partial_04_0375,
  rs_R003_ueqv_R003NN_partial_04_0376,
  rs_R003_ueqv_R003NN_partial_04_0377,
  rs_R003_ueqv_R003NN_partial_04_0378,
  rs_R003_ueqv_R003NN_partial_04_0379,
  rs_R003_ueqv_R003NN_partial_04_0380,
  rs_R003_ueqv_R003NN_partial_04_0381,
  rs_R003_ueqv_R003NN_partial_04_0382
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_04_0300_0382 : Poly :=
[
  term ((-2905664 : Rat) / 402111) [(4, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-515228 : Rat) / 44679) [(4, 1), (8, 1), (9, 1), (15, 5), (16, 1)],
  term (-84 : Rat) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((1180595 : Rat) / 402111) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (114 : Rat) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((410243 : Rat) / 357432) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1201927 : Rat) / 402111) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term (42 : Rat) [(4, 1), (8, 1), (12, 1)],
  term ((-22771511 : Rat) / 1608444) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term (878 : Rat) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((18365503 : Rat) / 3216888) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-1498201 : Rat) / 268074) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 1), (8, 1), (13, 1), (15, 5), (16, 1)],
  term (-432 : Rat) [(4, 1), (8, 1), (13, 2)],
  term (-364 : Rat) [(4, 1), (8, 1), (15, 2)],
  term ((1597929 : Rat) / 238288) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term (-384 : Rat) [(4, 1), (8, 1), (15, 4)],
  term ((5701349 : Rat) / 268074) [(4, 1), (8, 1), (15, 4), (16, 1)],
  term ((515228 : Rat) / 44679) [(4, 1), (8, 1), (15, 6), (16, 1)],
  term (-261 : Rat) [(4, 1), (8, 2)],
  term (288 : Rat) [(4, 1), (8, 2), (15, 2)],
  term ((-293569 : Rat) / 268074) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 14893) [(4, 1), (8, 2), (15, 4), (16, 1)],
  term (100 : Rat) [(4, 1), (9, 1), (11, 1)],
  term (84 : Rat) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1180595 : Rat) / 402111) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((2540575 : Rat) / 804222) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((257614 : Rat) / 44679) [(4, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term (432 : Rat) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((149669 : Rat) / 402111) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((6627425 : Rat) / 804222) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((515228 : Rat) / 44679) [(4, 1), (9, 1), (12, 1), (15, 5), (16, 1)],
  term (-271 : Rat) [(4, 1), (9, 1), (13, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1066411 : Rat) / 804222) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 1), (9, 1), (13, 1), (15, 4), (16, 1)],
  term (119 : Rat) [(4, 1), (9, 1), (15, 1)],
  term ((-70235 : Rat) / 14893) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(4, 1), (9, 1), (15, 3)],
  term ((-3301499 : Rat) / 536148) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 1), (9, 1), (15, 5), (16, 1)],
  term (-9 : Rat) [(4, 1), (9, 2)],
  term (18 : Rat) [(4, 1), (9, 2), (12, 1)],
  term (192 : Rat) [(4, 1), (9, 2), (12, 1), (15, 2)],
  term ((-2612095 : Rat) / 402111) [(4, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term (-96 : Rat) [(4, 1), (9, 2), (15, 2)],
  term ((2612095 : Rat) / 804222) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 1), (9, 2), (15, 4), (16, 1)],
  term ((-133694 : Rat) / 134037) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-84 : Rat) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((1180595 : Rat) / 402111) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term (21 : Rat) [(4, 1), (11, 1), (13, 1)],
  term ((-1180595 : Rat) / 804222) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((107 : Rat) / 2) [(4, 1), (11, 1), (15, 1)],
  term ((-80374255 : Rat) / 25735104) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(4, 1), (11, 1), (15, 3)],
  term ((-217178 : Rat) / 44679) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(4, 1), (11, 1), (15, 5), (16, 1)],
  term (-21 : Rat) [(4, 1), (11, 2)],
  term ((1180595 : Rat) / 1608444) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((3 : Rat) / 4) [(4, 1), (12, 1)],
  term (216 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term (-251 : Rat) [(4, 1), (12, 1), (15, 2)],
  term ((1872629 : Rat) / 134037) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(4, 1), (12, 1), (15, 4)],
  term ((-133325 : Rat) / 14893) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 1), (12, 1), (15, 6), (16, 1)],
  term (190 : Rat) [(4, 1), (13, 1), (15, 1)],
  term ((-30019117 : Rat) / 4289184) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(4, 1), (13, 1), (15, 3)],
  term ((1464577 : Rat) / 357432) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 1), (13, 1), (15, 5), (16, 1)],
  term (-108 : Rat) [(4, 1), (13, 2)],
  term ((-153 : Rat) / 4) [(4, 1), (15, 2)],
  term ((26579387 : Rat) / 4289184) [(4, 1), (15, 2), (16, 1)],
  term (72 : Rat) [(4, 1), (15, 4)],
  term ((-1254163 : Rat) / 268074) [(4, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 59572) [(4, 1), (15, 6), (16, 1)],
  term ((1452832 : Rat) / 402111) [(4, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(4, 2), (8, 1), (9, 1), (15, 5), (16, 1)],
  term (42 : Rat) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1180595 : Rat) / 804222) [(4, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-57 : Rat) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-410243 : Rat) / 714864) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1201927 : Rat) / 804222) [(4, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term (-21 : Rat) [(4, 2), (8, 1), (12, 1)],
  term ((22771511 : Rat) / 3216888) [(4, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term (-439 : Rat) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((-18365503 : Rat) / 6433776) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(4, 2), (8, 1), (13, 1), (15, 3)],
  term ((1498201 : Rat) / 536148) [(4, 2), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (8, 1), (13, 1), (15, 5), (16, 1)],
  term (216 : Rat) [(4, 2), (8, 1), (13, 2)],
  term (182 : Rat) [(4, 2), (8, 1), (15, 2)],
  term ((-1597929 : Rat) / 476576) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(4, 2), (8, 1), (15, 4)],
  term ((-5701349 : Rat) / 536148) [(4, 2), (8, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 2), (8, 1), (15, 6), (16, 1)],
  term ((261 : Rat) / 2) [(4, 2), (8, 2)],
  term (-144 : Rat) [(4, 2), (8, 2), (15, 2)],
  term ((293569 : Rat) / 536148) [(4, 2), (8, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 29786) [(4, 2), (8, 2), (15, 4), (16, 1)],
  term (-50 : Rat) [(4, 2), (9, 1), (11, 1)],
  term (-42 : Rat) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((1180595 : Rat) / 804222) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2540575 : Rat) / 1608444) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term (-216 : Rat) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term (-48 : Rat) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-149669 : Rat) / 804222) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(4, 2), (9, 1), (12, 1), (15, 3)],
  term ((-6627425 : Rat) / 1608444) [(4, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(4, 2), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((271 : Rat) / 2) [(4, 2), (9, 1), (13, 1)],
  term (-48 : Rat) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((1066411 : Rat) / 1608444) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-119 : Rat) / 2) [(4, 2), (9, 1), (15, 1)],
  term ((70235 : Rat) / 29786) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 2), (9, 1), (15, 3)],
  term ((3301499 : Rat) / 1072296) [(4, 2), (9, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (9, 1), (15, 5), (16, 1)],
  term ((9 : Rat) / 2) [(4, 2), (9, 2)],
  term (-9 : Rat) [(4, 2), (9, 2), (12, 1)],
  term (-96 : Rat) [(4, 2), (9, 2), (12, 1), (15, 2)],
  term ((2612095 : Rat) / 804222) [(4, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (9, 2), (12, 1), (15, 4), (16, 1)],
  term (48 : Rat) [(4, 2), (9, 2), (15, 2)],
  term ((-2612095 : Rat) / 1608444) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(4, 2), (9, 2), (15, 4), (16, 1)],
  term ((66847 : Rat) / 134037) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1180595 : Rat) / 804222) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-21 : Rat) / 2) [(4, 2), (11, 1), (13, 1)],
  term ((1180595 : Rat) / 1608444) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-107 : Rat) / 4) [(4, 2), (11, 1), (15, 1)],
  term ((80374255 : Rat) / 51470208) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(4, 2), (11, 1), (15, 3)],
  term ((108589 : Rat) / 44679) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(4, 2), (11, 1), (15, 5), (16, 1)],
  term ((21 : Rat) / 2) [(4, 2), (11, 2)],
  term ((-1180595 : Rat) / 3216888) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 8) [(4, 2), (12, 1)],
  term (-108 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((251 : Rat) / 2) [(4, 2), (12, 1), (15, 2)],
  term ((-1872629 : Rat) / 268074) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term (-96 : Rat) [(4, 2), (12, 1), (15, 4)],
  term ((133325 : Rat) / 29786) [(4, 2), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(4, 2), (12, 1), (15, 6), (16, 1)],
  term (-95 : Rat) [(4, 2), (13, 1), (15, 1)],
  term ((30019117 : Rat) / 8578368) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(4, 2), (13, 1), (15, 3)],
  term ((-1464577 : Rat) / 714864) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(4, 2), (13, 1), (15, 5), (16, 1)],
  term (54 : Rat) [(4, 2), (13, 2)],
  term ((153 : Rat) / 8) [(4, 2), (15, 2)],
  term ((-26579387 : Rat) / 8578368) [(4, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(4, 2), (15, 4)],
  term ((1254163 : Rat) / 536148) [(4, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(4, 2), (15, 6), (16, 1)],
  term ((1452832 : Rat) / 402111) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(5, 2), (8, 1), (9, 1), (15, 5), (16, 1)],
  term (42 : Rat) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1180595 : Rat) / 804222) [(5, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-57 : Rat) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((-410243 : Rat) / 714864) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1201927 : Rat) / 804222) [(5, 2), (8, 1), (11, 1), (15, 3), (16, 1)],
  term (-21 : Rat) [(5, 2), (8, 1), (12, 1)],
  term ((22771511 : Rat) / 3216888) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term (-439 : Rat) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((-18365503 : Rat) / 6433776) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(5, 2), (8, 1), (13, 1), (15, 3)],
  term ((1498201 : Rat) / 536148) [(5, 2), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (8, 1), (13, 1), (15, 5), (16, 1)],
  term (216 : Rat) [(5, 2), (8, 1), (13, 2)],
  term (182 : Rat) [(5, 2), (8, 1), (15, 2)],
  term ((-1597929 : Rat) / 476576) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(5, 2), (8, 1), (15, 4)],
  term ((-5701349 : Rat) / 536148) [(5, 2), (8, 1), (15, 4), (16, 1)],
  term ((-257614 : Rat) / 44679) [(5, 2), (8, 1), (15, 6), (16, 1)],
  term ((261 : Rat) / 2) [(5, 2), (8, 2)],
  term (-144 : Rat) [(5, 2), (8, 2), (15, 2)],
  term ((293569 : Rat) / 536148) [(5, 2), (8, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 29786) [(5, 2), (8, 2), (15, 4), (16, 1)],
  term (-50 : Rat) [(5, 2), (9, 1), (11, 1)],
  term (-42 : Rat) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((1180595 : Rat) / 804222) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (96 : Rat) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2540575 : Rat) / 1608444) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(5, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term (-216 : Rat) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term (-48 : Rat) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-149669 : Rat) / 804222) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(5, 2), (9, 1), (12, 1), (15, 3)],
  term ((-6627425 : Rat) / 1608444) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(5, 2), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((271 : Rat) / 2) [(5, 2), (9, 1), (13, 1)],
  term (-48 : Rat) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((1066411 : Rat) / 1608444) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-119 : Rat) / 2) [(5, 2), (9, 1), (15, 1)],
  term ((70235 : Rat) / 29786) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 2), (9, 1), (15, 3)],
  term ((3301499 : Rat) / 1072296) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (9, 1), (15, 5), (16, 1)],
  term ((9 : Rat) / 2) [(5, 2), (9, 2)],
  term (-9 : Rat) [(5, 2), (9, 2), (12, 1)],
  term (-96 : Rat) [(5, 2), (9, 2), (12, 1), (15, 2)],
  term ((2612095 : Rat) / 804222) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (9, 2), (12, 1), (15, 4), (16, 1)],
  term (48 : Rat) [(5, 2), (9, 2), (15, 2)],
  term ((-2612095 : Rat) / 1608444) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(5, 2), (9, 2), (15, 4), (16, 1)],
  term ((66847 : Rat) / 134037) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (42 : Rat) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1180595 : Rat) / 804222) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-21 : Rat) / 2) [(5, 2), (11, 1), (13, 1)],
  term ((1180595 : Rat) / 1608444) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-107 : Rat) / 4) [(5, 2), (11, 1), (15, 1)],
  term ((80374255 : Rat) / 51470208) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(5, 2), (11, 1), (15, 3)],
  term ((108589 : Rat) / 44679) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(5, 2), (11, 1), (15, 5), (16, 1)],
  term ((21 : Rat) / 2) [(5, 2), (11, 2)],
  term ((-1180595 : Rat) / 3216888) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3 : Rat) / 8) [(5, 2), (12, 1)],
  term (-108 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((251 : Rat) / 2) [(5, 2), (12, 1), (15, 2)],
  term ((-1872629 : Rat) / 268074) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term (-96 : Rat) [(5, 2), (12, 1), (15, 4)],
  term ((133325 : Rat) / 29786) [(5, 2), (12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 44679) [(5, 2), (12, 1), (15, 6), (16, 1)],
  term (-95 : Rat) [(5, 2), (13, 1), (15, 1)],
  term ((30019117 : Rat) / 8578368) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(5, 2), (13, 1), (15, 3)],
  term ((-1464577 : Rat) / 714864) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(5, 2), (13, 1), (15, 5), (16, 1)],
  term (54 : Rat) [(5, 2), (13, 2)],
  term ((153 : Rat) / 8) [(5, 2), (15, 2)],
  term ((-26579387 : Rat) / 8578368) [(5, 2), (15, 2), (16, 1)],
  term (-36 : Rat) [(5, 2), (15, 4)],
  term ((1254163 : Rat) / 536148) [(5, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 119144) [(5, 2), (15, 6), (16, 1)],
  term ((2905664 : Rat) / 402111) [(8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((515228 : Rat) / 44679) [(8, 1), (9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (12, 2), (15, 5), (16, 1)],
  term ((-1452832 : Rat) / 402111) [(8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 44679) [(8, 1), (9, 1), (13, 2), (15, 5), (16, 1)],
  term (84 : Rat) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1180595 : Rat) / 402111) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-114 : Rat) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-410243 : Rat) / 357432) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1201927 : Rat) / 402111) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term (-42 : Rat) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term (57 : Rat) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((410243 : Rat) / 714864) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1201927 : Rat) / 804222) [(8, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term (57 : Rat) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((410243 : Rat) / 714864) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1201927 : Rat) / 804222) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term (-42 : Rat) [(8, 1), (11, 1), (13, 3)],
  term ((1180595 : Rat) / 804222) [(8, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term (-878 : Rat) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18365503 : Rat) / 3216888) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((1498201 : Rat) / 268074) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (12, 1), (13, 1), (15, 5), (16, 1)],
  term (453 : Rat) [(8, 1), (12, 1), (13, 2)],
  term ((-22771511 : Rat) / 3216888) [(8, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term (364 : Rat) [(8, 1), (12, 1), (15, 2)],
  term ((-1597929 : Rat) / 238288) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term (384 : Rat) [(8, 1), (12, 1), (15, 4)],
  term ((-5701349 : Rat) / 268074) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-515228 : Rat) / 44679) [(8, 1), (12, 1), (15, 6), (16, 1)],
  term (-42 : Rat) [(8, 1), (12, 2)],
  term (439 : Rat) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((18365503 : Rat) / 6433776) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(8, 1), (12, 2), (13, 1), (15, 3)],
  term ((-1498201 : Rat) / 536148) [(8, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (12, 2), (13, 1), (15, 5), (16, 1)],
  term (-216 : Rat) [(8, 1), (12, 2), (13, 2)],
  term (-182 : Rat) [(8, 1), (12, 2), (15, 2)],
  term ((225316171 : Rat) / 12867552) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term (-192 : Rat) [(8, 1), (12, 2), (15, 4)],
  term ((5701349 : Rat) / 536148) [(8, 1), (12, 2), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (12, 2), (15, 6), (16, 1)],
  term (21 : Rat) [(8, 1), (12, 3)],
  term ((-22771511 : Rat) / 3216888) [(8, 1), (12, 3), (15, 2), (16, 1)],
  term (-182 : Rat) [(8, 1), (13, 2), (15, 2)],
  term ((1597929 : Rat) / 476576) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term (-192 : Rat) [(8, 1), (13, 2), (15, 4)],
  term ((5701349 : Rat) / 536148) [(8, 1), (13, 2), (15, 4), (16, 1)],
  term ((257614 : Rat) / 44679) [(8, 1), (13, 2), (15, 6), (16, 1)],
  term (439 : Rat) [(8, 1), (13, 3), (15, 1)],
  term ((18365503 : Rat) / 6433776) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term (96 : Rat) [(8, 1), (13, 3), (15, 3)],
  term ((-1498201 : Rat) / 536148) [(8, 1), (13, 3), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(8, 1), (13, 3), (15, 5), (16, 1)],
  term (-216 : Rat) [(8, 1), (13, 4)],
  term (261 : Rat) [(8, 2), (12, 1)],
  term (-288 : Rat) [(8, 2), (12, 1), (15, 2)],
  term ((293569 : Rat) / 268074) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 14893) [(8, 2), (12, 1), (15, 4), (16, 1)],
  term ((-261 : Rat) / 2) [(8, 2), (12, 2)],
  term (144 : Rat) [(8, 2), (12, 2), (15, 2)],
  term ((-293569 : Rat) / 536148) [(8, 2), (12, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (12, 2), (15, 4), (16, 1)],
  term ((-261 : Rat) / 2) [(8, 2), (13, 2)],
  term (144 : Rat) [(8, 2), (13, 2), (15, 2)],
  term ((-293569 : Rat) / 536148) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 29786) [(8, 2), (13, 2), (15, 4), (16, 1)],
  term (-100 : Rat) [(9, 1), (11, 1), (12, 1)],
  term (42 : Rat) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1180595 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term (192 : Rat) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2540575 : Rat) / 804222) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 44679) [(9, 1), (11, 1), (12, 1), (15, 4), (16, 1)],
  term (-34 : Rat) [(9, 1), (11, 1), (12, 2)],
  term (-96 : Rat) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((806995 : Rat) / 178716) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (11, 1), (12, 2), (15, 4), (16, 1)],
  term (42 : Rat) [(9, 1), (11, 1), (12, 3)],
  term ((-1180595 : Rat) / 804222) [(9, 1), (11, 1), (12, 3), (15, 2), (16, 1)],
  term (50 : Rat) [(9, 1), (11, 1), (13, 2)],
  term (-96 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((2540575 : Rat) / 1608444) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (11, 1), (13, 2), (15, 4), (16, 1)],
  term (271 : Rat) [(9, 1), (12, 1), (13, 1)],
  term (-96 : Rat) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1066411 : Rat) / 804222) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (13, 1), (15, 4), (16, 1)],
  term (48 : Rat) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((149669 : Rat) / 804222) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-192 : Rat) [(9, 1), (12, 1), (13, 2), (15, 3)],
  term ((6627425 : Rat) / 1608444) [(9, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 1), (13, 2), (15, 5), (16, 1)],
  term (216 : Rat) [(9, 1), (12, 1), (13, 3)],
  term (-119 : Rat) [(9, 1), (12, 1), (15, 1)],
  term ((70235 : Rat) / 14893) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(9, 1), (12, 1), (15, 3)],
  term ((3301499 : Rat) / 536148) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(9, 1), (12, 1), (15, 5), (16, 1)],
  term ((-1135 : Rat) / 2) [(9, 1), (12, 2), (13, 1)],
  term (48 : Rat) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-1066411 : Rat) / 1608444) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (12, 2), (13, 1), (15, 4), (16, 1)],
  term ((-73 : Rat) / 2) [(9, 1), (12, 2), (15, 1)],
  term ((-2195683 : Rat) / 804222) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term (432 : Rat) [(9, 1), (12, 2), (15, 3)],
  term ((-36414197 : Rat) / 3216888) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-386421 : Rat) / 29786) [(9, 1), (12, 2), (15, 5), (16, 1)],
  term (216 : Rat) [(9, 1), (12, 3), (13, 1)],
  term (48 : Rat) [(9, 1), (12, 3), (15, 1)],
  term ((149669 : Rat) / 804222) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term (-192 : Rat) [(9, 1), (12, 3), (15, 3)],
  term ((6627425 : Rat) / 1608444) [(9, 1), (12, 3), (15, 3), (16, 1)],
  term ((257614 : Rat) / 44679) [(9, 1), (12, 3), (15, 5), (16, 1)],
  term ((119 : Rat) / 2) [(9, 1), (13, 2), (15, 1)],
  term ((-70235 : Rat) / 29786) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term (48 : Rat) [(9, 1), (13, 2), (15, 3)],
  term ((-3301499 : Rat) / 1072296) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (13, 2), (15, 5), (16, 1)],
  term ((-271 : Rat) / 2) [(9, 1), (13, 3)],
  term (48 : Rat) [(9, 1), (13, 3), (15, 2)],
  term ((-1066411 : Rat) / 1608444) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 1), (13, 3), (15, 4), (16, 1)],
  term (9 : Rat) [(9, 2), (12, 1)],
  term (9 : Rat) [(9, 2), (12, 1), (13, 2)],
  term (96 : Rat) [(9, 2), (12, 1), (13, 2), (15, 2)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 1), (13, 2), (15, 4), (16, 1)],
  term (96 : Rat) [(9, 2), (12, 1), (15, 2)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 1), (15, 4), (16, 1)],
  term ((-45 : Rat) / 2) [(9, 2), (12, 2)],
  term (-240 : Rat) [(9, 2), (12, 2), (15, 2)],
  term ((13060475 : Rat) / 1608444) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((644035 : Rat) / 89358) [(9, 2), (12, 2), (15, 4), (16, 1)],
  term (9 : Rat) [(9, 2), (12, 3)],
  term (96 : Rat) [(9, 2), (12, 3), (15, 2)],
  term ((-2612095 : Rat) / 804222) [(9, 2), (12, 3), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 44679) [(9, 2), (12, 3), (15, 4), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 2), (13, 2)],
  term (-48 : Rat) [(9, 2), (13, 2), (15, 2)],
  term ((2612095 : Rat) / 1608444) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(9, 2), (13, 2), (15, 4), (16, 1)],
  term ((133694 : Rat) / 134037) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term (-21 : Rat) [(11, 1), (12, 1), (13, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-42 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-107 : Rat) / 2) [(11, 1), (12, 1), (15, 1)],
  term ((80374255 : Rat) / 25735104) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 1), (15, 3)],
  term ((217178 : Rat) / 44679) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(11, 1), (12, 1), (15, 5), (16, 1)],
  term ((21 : Rat) / 2) [(11, 1), (12, 2), (13, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((443 : Rat) / 4) [(11, 1), (12, 2), (15, 1)],
  term ((-80374255 : Rat) / 51470208) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (12, 2), (15, 3)],
  term ((-2157896 : Rat) / 402111) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (12, 2), (15, 5), (16, 1)],
  term (-42 : Rat) [(11, 1), (12, 3), (15, 1)],
  term ((1180595 : Rat) / 804222) [(11, 1), (12, 3), (15, 3), (16, 1)],
  term ((107 : Rat) / 4) [(11, 1), (13, 2), (15, 1)],
  term ((-80374255 : Rat) / 51470208) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (13, 2), (15, 3)],
  term ((-108589 : Rat) / 44679) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (13, 2), (15, 5), (16, 1)],
  term ((21 : Rat) / 2) [(11, 1), (13, 3)],
  term ((-1180595 : Rat) / 1608444) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term (21 : Rat) [(11, 2), (12, 1)],
  term ((-1180595 : Rat) / 1608444) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-21 : Rat) / 2) [(11, 2), (12, 2)],
  term ((1180595 : Rat) / 3216888) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-21 : Rat) / 2) [(11, 2), (13, 2)],
  term ((1180595 : Rat) / 3216888) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term (-190 : Rat) [(12, 1), (13, 1), (15, 1)],
  term ((30019117 : Rat) / 4289184) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(12, 1), (13, 1), (15, 3)],
  term ((-1464577 : Rat) / 357432) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 1), (13, 1), (15, 5), (16, 1)],
  term ((867 : Rat) / 8) [(12, 1), (13, 2)],
  term ((-251 : Rat) / 2) [(12, 1), (13, 2), (15, 2)],
  term ((1872629 : Rat) / 268074) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (96 : Rat) [(12, 1), (13, 2), (15, 4)],
  term ((-133325 : Rat) / 29786) [(12, 1), (13, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 1), (13, 2), (15, 6), (16, 1)],
  term (108 : Rat) [(12, 1), (13, 3), (15, 1)],
  term ((153 : Rat) / 4) [(12, 1), (15, 2)],
  term ((-26579387 : Rat) / 4289184) [(12, 1), (15, 2), (16, 1)],
  term (-72 : Rat) [(12, 1), (15, 4)],
  term ((1254163 : Rat) / 268074) [(12, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 59572) [(12, 1), (15, 6), (16, 1)],
  term ((-3 : Rat) / 4) [(12, 2)],
  term (-121 : Rat) [(12, 2), (13, 1), (15, 1)],
  term ((-30019117 : Rat) / 8578368) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(12, 2), (13, 1), (15, 3)],
  term ((1464577 : Rat) / 714864) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(12, 2), (13, 1), (15, 5), (16, 1)],
  term (-54 : Rat) [(12, 2), (13, 2)],
  term ((1855 : Rat) / 8) [(12, 2), (15, 2)],
  term ((-31089623 : Rat) / 2859456) [(12, 2), (15, 2), (16, 1)],
  term (-156 : Rat) [(12, 2), (15, 4)],
  term ((3545537 : Rat) / 536148) [(12, 2), (15, 4), (16, 1)],
  term ((1674491 : Rat) / 357432) [(12, 2), (15, 6), (16, 1)],
  term ((3 : Rat) / 8) [(12, 3)],
  term (108 : Rat) [(12, 3), (13, 1), (15, 1)],
  term ((-251 : Rat) / 2) [(12, 3), (15, 2)],
  term ((1872629 : Rat) / 268074) [(12, 3), (15, 2), (16, 1)],
  term (96 : Rat) [(12, 3), (15, 4)],
  term ((-133325 : Rat) / 29786) [(12, 3), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 44679) [(12, 3), (15, 6), (16, 1)],
  term ((-153 : Rat) / 8) [(13, 2), (15, 2)],
  term ((26579387 : Rat) / 8578368) [(13, 2), (15, 2), (16, 1)],
  term (36 : Rat) [(13, 2), (15, 4)],
  term ((-1254163 : Rat) / 536148) [(13, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 119144) [(13, 2), (15, 6), (16, 1)],
  term (95 : Rat) [(13, 3), (15, 1)],
  term ((-30019117 : Rat) / 8578368) [(13, 3), (15, 1), (16, 1)],
  term (-48 : Rat) [(13, 3), (15, 3)],
  term ((1464577 : Rat) / 714864) [(13, 3), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(13, 3), (15, 5), (16, 1)],
  term (-54 : Rat) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 382. -/
theorem rs_R003_ueqv_R003NN_block_04_0300_0382_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_04_0300_0382
      rs_R003_ueqv_R003NN_block_04_0300_0382 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
