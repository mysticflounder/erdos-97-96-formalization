/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 29:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0300 : Poly :=
[
  term ((891740262161 : Rat) / 34905087150) [(7, 1), (13, 1)]
]

/-- Partial product 300 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0300 : Poly :=
[
  term ((891740262161 : Rat) / 17452543575) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-891740262161 : Rat) / 34905087150) [(7, 1), (10, 2), (13, 1)],
  term ((891740262161 : Rat) / 17452543575) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-891740262161 : Rat) / 34905087150) [(7, 1), (11, 2), (13, 1)],
  term ((891740262161 : Rat) / 34905087150) [(7, 1), (13, 1)],
  term ((-891740262161 : Rat) / 17452543575) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0300
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0301 : Poly :=
[
  term ((-1878107679 : Rat) / 612369950) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 301 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0301 : Poly :=
[
  term ((-1878107679 : Rat) / 306184975) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((1878107679 : Rat) / 612369950) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1878107679 : Rat) / 306184975) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1878107679 : Rat) / 612369950) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((-1878107679 : Rat) / 612369950) [(7, 1), (13, 1), (14, 1)],
  term ((1878107679 : Rat) / 306184975) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0301
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0302 : Poly :=
[
  term ((-5244160 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 302 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0302 : Poly :=
[
  term ((-10488320 : Rat) / 110226591) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(7, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-10488320 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((5244160 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-5244160 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((10488320 : Rat) / 110226591) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0302
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0303 : Poly :=
[
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0303 : Poly :=
[
  term ((3229466429 : Rat) / 612369950) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 612369950) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0303
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0304 : Poly :=
[
  term ((-154253400 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 304 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0304 : Poly :=
[
  term ((-308506800 : Rat) / 12247399) [(7, 1), (10, 1), (13, 1), (14, 3)],
  term ((154253400 : Rat) / 12247399) [(7, 1), (10, 2), (13, 1), (14, 2)],
  term ((-308506800 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((154253400 : Rat) / 12247399) [(7, 1), (11, 2), (13, 1), (14, 2)],
  term ((-154253400 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((308506800 : Rat) / 12247399) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0304
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0305 : Poly :=
[
  term ((-5741840 : Rat) / 231083) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 305 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0305 : Poly :=
[
  term ((-11483680 : Rat) / 231083) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((5741840 : Rat) / 231083) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-11483680 : Rat) / 231083) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((5741840 : Rat) / 231083) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((11483680 : Rat) / 231083) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5741840 : Rat) / 231083) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0305
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0306 : Poly :=
[
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 306 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0306 : Poly :=
[
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 612369950) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0306
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0307 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0307 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0307
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0308 : Poly :=
[
  term ((2056320 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 308 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0308 : Poly :=
[
  term ((4112640 : Rat) / 12247399) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2056320 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-4112640 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0308
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0309 : Poly :=
[
  term ((894413216 : Rat) / 918554925) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 309 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0309 : Poly :=
[
  term ((1788826432 : Rat) / 918554925) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((1788826432 : Rat) / 918554925) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-894413216 : Rat) / 918554925) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((894413216 : Rat) / 918554925) [(7, 1), (14, 1), (15, 1)],
  term ((-1788826432 : Rat) / 918554925) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0309
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0310 : Poly :=
[
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0310 : Poly :=
[
  term ((-20641044794 : Rat) / 8266994325) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 8266994325) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0310
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0311 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 311 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0311 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(7, 1), (10, 1), (14, 2), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(7, 1), (10, 2), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(7, 1), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(7, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0311_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0311
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0312 : Poly :=
[
  term ((2967541600 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 312 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0312 : Poly :=
[
  term ((5935083200 : Rat) / 110226591) [(7, 1), (10, 1), (14, 3), (15, 1)],
  term ((-2967541600 : Rat) / 110226591) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((5935083200 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-2967541600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((2967541600 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)],
  term ((-5935083200 : Rat) / 110226591) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0312_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0312
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0313 : Poly :=
[
  term ((-90195334051259 : Rat) / 1884874706100) [(7, 1), (15, 1)]
]

/-- Partial product 313 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0313 : Poly :=
[
  term ((-90195334051259 : Rat) / 942437353050) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((90195334051259 : Rat) / 1884874706100) [(7, 1), (10, 2), (15, 1)],
  term ((-90195334051259 : Rat) / 942437353050) [(7, 1), (11, 1), (15, 2)],
  term ((90195334051259 : Rat) / 1884874706100) [(7, 1), (11, 2), (15, 1)],
  term ((90195334051259 : Rat) / 942437353050) [(7, 1), (14, 1), (15, 1)],
  term ((-90195334051259 : Rat) / 1884874706100) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0313_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0313
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0314 : Poly :=
[
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0314 : Poly :=
[
  term ((-30318188881 : Rat) / 8266994325) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 8266994325) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0314_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0314
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0315 : Poly :=
[
  term ((5769928000 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 315 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0315 : Poly :=
[
  term ((11539856000 : Rat) / 110226591) [(7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-5769928000 : Rat) / 110226591) [(7, 1), (10, 2), (15, 3)],
  term ((11539856000 : Rat) / 110226591) [(7, 1), (11, 1), (15, 4)],
  term ((-5769928000 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((-11539856000 : Rat) / 110226591) [(7, 1), (14, 1), (15, 3)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0315_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0315
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0316 : Poly :=
[
  term ((632 : Rat) / 67) [(7, 2)]
]

/-- Partial product 316 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0316 : Poly :=
[
  term ((632 : Rat) / 67) [(7, 2)],
  term ((1264 : Rat) / 67) [(7, 2), (10, 1), (14, 1)],
  term ((-632 : Rat) / 67) [(7, 2), (10, 2)],
  term ((1264 : Rat) / 67) [(7, 2), (11, 1), (15, 1)],
  term ((-632 : Rat) / 67) [(7, 2), (11, 2)],
  term ((-1264 : Rat) / 67) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0316_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0316
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0317 : Poly :=
[
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 317 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0317 : Poly :=
[
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0317_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0317
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0318 : Poly :=
[
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 318 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0318 : Poly :=
[
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0318_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0318
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0319 : Poly :=
[
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 319 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0319 : Poly :=
[
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((-4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0319_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0319
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0320 : Poly :=
[
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 320 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0320 : Poly :=
[
  term ((-397843040 : Rat) / 12247399) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0320_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0320
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0321 : Poly :=
[
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 321 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0321 : Poly :=
[
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (11, 2), (15, 2)],
  term ((-16876615721876 : Rat) / 157072892175) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0321_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0321
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0322 : Poly :=
[
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0322 : Poly :=
[
  term ((-2192956060288 : Rat) / 52357630725) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((2192956060288 : Rat) / 52357630725) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0322_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0322
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0323 : Poly :=
[
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (11, 2)]
]

/-- Partial product 323 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0323 : Poly :=
[
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (10, 1), (11, 2), (14, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 2), (10, 2), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(7, 2), (11, 2), (14, 1)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (11, 3), (15, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 2), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0323_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0323
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0324 : Poly :=
[
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 324 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0324 : Poly :=
[
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-161932318884 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-161932318884 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0324_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0324
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0325 : Poly :=
[
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0325 : Poly :=
[
  term ((-102794815326 : Rat) / 5817514525) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-102794815326 : Rat) / 5817514525) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((102794815326 : Rat) / 5817514525) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0325_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0325
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0326 : Poly :=
[
  term ((-196 : Rat) / 67) [(7, 2), (14, 1)]
]

/-- Partial product 326 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0326 : Poly :=
[
  term ((-392 : Rat) / 67) [(7, 2), (10, 1), (14, 2)],
  term ((196 : Rat) / 67) [(7, 2), (10, 2), (14, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((196 : Rat) / 67) [(7, 2), (11, 2), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (14, 1)],
  term ((392 : Rat) / 67) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0326_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0326
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0327 : Poly :=
[
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (15, 2)]
]

/-- Partial product 327 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0327 : Poly :=
[
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (10, 1), (14, 1), (15, 2)],
  term ((1047453296072 : Rat) / 17452543575) [(7, 2), (10, 2), (15, 2)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (11, 1), (15, 3)],
  term ((1047453296072 : Rat) / 17452543575) [(7, 2), (11, 2), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (14, 1), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0327_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0327
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0328 : Poly :=
[
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 328 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0328 : Poly :=
[
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-2394874578674 : Rat) / 52357630725) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0328_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0328
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0329 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (11, 1)]
]

/-- Partial product 329 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0329 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (10, 1), (11, 1), (14, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (10, 2), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (11, 1), (14, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (11, 2), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0329_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0329
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0330 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (13, 1)]
]

/-- Partial product 330 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0330 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (10, 1), (13, 1), (14, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (10, 2), (13, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (11, 2), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0330_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0330
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0331 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (15, 1)]
]

/-- Partial product 331 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0331 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (10, 1), (14, 1), (15, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 3), (10, 2), (15, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (11, 1), (15, 2)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 3), (11, 2), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (14, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0331_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0331
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0332 : Poly :=
[
  term ((42804231148 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 332 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0332 : Poly :=
[
  term ((42804231148 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1)],
  term ((-85608462296 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((85608462296 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-42804231148 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 3)],
  term ((85608462296 : Rat) / 10471526145) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-42804231148 : Rat) / 10471526145) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0332_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0332
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0333 : Poly :=
[
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 333 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0333 : Poly :=
[
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((77987840 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-77987840 : Rat) / 330679773) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 3), (14, 1)],
  term ((-77987840 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((38993920 : Rat) / 330679773) [(9, 1), (10, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0333_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0333
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0334 : Poly :=
[
  term ((570520776 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 334 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0334 : Poly :=
[
  term ((1141041552 : Rat) / 1163502905) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-570520776 : Rat) / 1163502905) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((570520776 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1)],
  term ((-1141041552 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1141041552 : Rat) / 1163502905) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-570520776 : Rat) / 1163502905) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0334_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0334
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0335 : Poly :=
[
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 335 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0335 : Poly :=
[
  term ((-1218560 : Rat) / 12247399) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((609280 : Rat) / 12247399) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1218560 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1218560 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((609280 : Rat) / 12247399) [(9, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0335_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0335
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0336 : Poly :=
[
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 336 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0336 : Poly :=
[
  term ((70328320 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-35164160 : Rat) / 330679773) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 330679773) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((70328320 : Rat) / 330679773) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-35164160 : Rat) / 330679773) [(9, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0336_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0336
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0337 : Poly :=
[
  term ((-8422972919 : Rat) / 10471526145) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 337 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0337 : Poly :=
[
  term ((-16845945838 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((8422972919 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((16845945838 : Rat) / 10471526145) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8422972919 : Rat) / 10471526145) [(9, 1), (10, 1), (15, 1)],
  term ((-16845945838 : Rat) / 10471526145) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((8422972919 : Rat) / 10471526145) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0337_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0337
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0338 : Poly :=
[
  term ((2648080897193 : Rat) / 104715261450) [(9, 1), (11, 1)]
]

/-- Partial product 338 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0338 : Poly :=
[
  term ((2648080897193 : Rat) / 52357630725) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-2648080897193 : Rat) / 104715261450) [(9, 1), (10, 2), (11, 1)],
  term ((2648080897193 : Rat) / 104715261450) [(9, 1), (11, 1)],
  term ((-2648080897193 : Rat) / 52357630725) [(9, 1), (11, 1), (14, 1)],
  term ((2648080897193 : Rat) / 52357630725) [(9, 1), (11, 2), (15, 1)],
  term ((-2648080897193 : Rat) / 104715261450) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0338_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0338
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0339 : Poly :=
[
  term ((-22496647936 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 339 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0339 : Poly :=
[
  term ((-44993295872 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((22496647936 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-22496647936 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)],
  term ((44993295872 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-44993295872 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((22496647936 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0339_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0339
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0340 : Poly :=
[
  term ((1045838080 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 340 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0340 : Poly :=
[
  term ((2091676160 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1045838080 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((1045838080 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2091676160 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((2091676160 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1045838080 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0340_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0340
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0341 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 341 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0341 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0341_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0341
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0342 : Poly :=
[
  term ((-3046400 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 342 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0342 : Poly :=
[
  term ((-6092800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((3046400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3046400 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((6092800 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6092800 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((3046400 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0342_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0342
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0343 : Poly :=
[
  term ((-81186560 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 343 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0343 : Poly :=
[
  term ((-162373120 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((81186560 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((162373120 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-81186560 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-162373120 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((81186560 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0343_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0343
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0344 : Poly :=
[
  term ((239821910756 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 344 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0344 : Poly :=
[
  term ((479643821512 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-239821910756 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((239821910756 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)],
  term ((-479643821512 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 2)],
  term ((479643821512 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-239821910756 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0344_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0344
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0345 : Poly :=
[
  term ((-64409600 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 345 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0345 : Poly :=
[
  term ((-128819200 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((64409600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-64409600 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((128819200 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-128819200 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 3)],
  term ((64409600 : Rat) / 110226591) [(9, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0345_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0345
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0346 : Poly :=
[
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 346 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0346 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((51671462864 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((51671462864 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0346_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0346
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0347 : Poly :=
[
  term ((4874240 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 347 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0347 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (14, 3)],
  term ((-4874240 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((4874240 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (11, 1), (14, 3)],
  term ((9748480 : Rat) / 110226591) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-4874240 : Rat) / 110226591) [(9, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0347_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0347
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0348 : Poly :=
[
  term ((1986692240 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 348 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0348 : Poly :=
[
  term ((3973384480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1986692240 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-3973384480 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((1986692240 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)],
  term ((3973384480 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((-1986692240 : Rat) / 110226591) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0348_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0348
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0349 : Poly :=
[
  term ((1160 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0349 : Poly :=
[
  term ((2320 : Rat) / 201) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1160 : Rat) / 201) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 201) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1160 : Rat) / 201) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0349_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0349
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0350 : Poly :=
[
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 350 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0350 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0350_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0350
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0351 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 351 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0351 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(9, 1), (11, 3), (14, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (11, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0351_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0351
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0352 : Poly :=
[
  term ((-48742400 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 352 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0352 : Poly :=
[
  term ((-97484800 : Rat) / 36742197) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 36742197) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-48742400 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 36742197) [(9, 1), (11, 3), (15, 2)],
  term ((48742400 : Rat) / 36742197) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0352_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0352
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0353 : Poly :=
[
  term ((-351510124 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 353 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0353 : Poly :=
[
  term ((-703020248 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((351510124 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-703020248 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((351510124 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-351510124 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((703020248 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0353_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0353
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0354 : Poly :=
[
  term ((16341220 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 354 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0354 : Poly :=
[
  term ((32682440 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-16341220 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((32682440 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16341220 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((16341220 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-32682440 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0354_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0354
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0355 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 355 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0355 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((9139200 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0355_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0355
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0356 : Poly :=
[
  term ((-1298479208 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 356 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0356 : Poly :=
[
  term ((-2596958416 : Rat) / 330679773) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1298479208 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-2596958416 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1298479208 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1298479208 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2596958416 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0356_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0356
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0357 : Poly :=
[
  term ((20198316386 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 357 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0357 : Poly :=
[
  term ((40396632772 : Rat) / 330679773) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20198316386 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((40396632772 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-20198316386 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-40396632772 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((20198316386 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0357_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0357
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0358 : Poly :=
[
  term ((-63 : Rat) / 134) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0358 : Poly :=
[
  term ((-63 : Rat) / 67) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 134) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 67) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((63 : Rat) / 134) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0358_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0358
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0359 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 359 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0359 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-175820800 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((-175820800 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0359_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0359
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0360 : Poly :=
[
  term ((427112002869 : Rat) / 46540116200) [(9, 1), (13, 1)]
]

/-- Partial product 360 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0360 : Poly :=
[
  term ((427112002869 : Rat) / 23270058100) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-427112002869 : Rat) / 46540116200) [(9, 1), (10, 2), (13, 1)],
  term ((427112002869 : Rat) / 23270058100) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-427112002869 : Rat) / 46540116200) [(9, 1), (11, 2), (13, 1)],
  term ((427112002869 : Rat) / 46540116200) [(9, 1), (13, 1)],
  term ((-427112002869 : Rat) / 23270058100) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0360_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0360
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0361 : Poly :=
[
  term ((4742032904 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 361 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0361 : Poly :=
[
  term ((9484065808 : Rat) / 918554925) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-4742032904 : Rat) / 918554925) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((9484065808 : Rat) / 918554925) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4742032904 : Rat) / 918554925) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((4742032904 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)],
  term ((-9484065808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0361_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0361
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0362 : Poly :=
[
  term ((5244160 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 362 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0362 : Poly :=
[
  term ((10488320 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5244160 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((10488320 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5244160 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10488320 : Rat) / 110226591) [(9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0362_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0362
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0363 : Poly :=
[
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 363 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0363 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0363_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0363
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0364 : Poly :=
[
  term ((228480 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 364 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0364 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 3)],
  term ((-228480 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((456960 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-228480 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((228480 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0364_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0364
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0365 : Poly :=
[
  term ((1336824760 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 365 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0365 : Poly :=
[
  term ((2673649520 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1336824760 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((2673649520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1336824760 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2673649520 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((1336824760 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0365_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0365
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0366 : Poly :=
[
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 366 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0366 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0366_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0366
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0367 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 367 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0367 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0367_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0367
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0368 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 368 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0368 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0368_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0368
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0369 : Poly :=
[
  term ((-181142060638 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 369 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0369 : Poly :=
[
  term ((-362284121276 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((181142060638 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-362284121276 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((181142060638 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-181142060638 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)],
  term ((362284121276 : Rat) / 24800982975) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0369_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0369
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0370 : Poly :=
[
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0370 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0370_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0370
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0371 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 371 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0371 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(9, 1), (10, 2), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((-8791040 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0371_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0371
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0372 : Poly :=
[
  term ((-4395520 : Rat) / 110226591) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 372 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0372 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(9, 1), (10, 1), (14, 3), (15, 1)],
  term ((4395520 : Rat) / 110226591) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((4395520 : Rat) / 110226591) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-4395520 : Rat) / 110226591) [(9, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0372_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0372
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0373 : Poly :=
[
  term ((-5598500678003 : Rat) / 209430522900) [(9, 1), (15, 1)]
]

/-- Partial product 373 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0373 : Poly :=
[
  term ((-5598500678003 : Rat) / 104715261450) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((5598500678003 : Rat) / 209430522900) [(9, 1), (10, 2), (15, 1)],
  term ((-5598500678003 : Rat) / 104715261450) [(9, 1), (11, 1), (15, 2)],
  term ((5598500678003 : Rat) / 209430522900) [(9, 1), (11, 2), (15, 1)],
  term ((5598500678003 : Rat) / 104715261450) [(9, 1), (14, 1), (15, 1)],
  term ((-5598500678003 : Rat) / 209430522900) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0373_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0373
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0374 : Poly :=
[
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 374 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0374 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0374_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0374
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0375 : Poly :=
[
  term ((-2819968480 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 375 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0375 : Poly :=
[
  term ((-5639936960 : Rat) / 110226591) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((2819968480 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((-5639936960 : Rat) / 110226591) [(9, 1), (11, 1), (15, 4)],
  term ((2819968480 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((5639936960 : Rat) / 110226591) [(9, 1), (14, 1), (15, 3)],
  term ((-2819968480 : Rat) / 110226591) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0375_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0375
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0376 : Poly :=
[
  term ((-821 : Rat) / 268) [(9, 2)]
]

/-- Partial product 376 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0376 : Poly :=
[
  term ((-821 : Rat) / 268) [(9, 2)],
  term ((-821 : Rat) / 134) [(9, 2), (10, 1), (14, 1)],
  term ((821 : Rat) / 268) [(9, 2), (10, 2)],
  term ((-821 : Rat) / 134) [(9, 2), (11, 1), (15, 1)],
  term ((821 : Rat) / 268) [(9, 2), (11, 2)],
  term ((821 : Rat) / 134) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0376_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0376
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0377 : Poly :=
[
  term ((49 : Rat) / 67) [(9, 2), (10, 1)]
]

/-- Partial product 377 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0377 : Poly :=
[
  term ((49 : Rat) / 67) [(9, 2), (10, 1)],
  term ((98 : Rat) / 67) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 1), (11, 2)],
  term ((-98 : Rat) / 67) [(9, 2), (10, 1), (14, 1)],
  term ((98 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0377_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0377
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0378 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 378 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0378 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0378_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0378
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0379 : Poly :=
[
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0379 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((11025602336 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((11025602336 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0379_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0379
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0380 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 380 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0380 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0380_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0380
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0381 : Poly :=
[
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0381 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 1396203486) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((344550073 : Rat) / 1396203486) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0381_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0381
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0382 : Poly :=
[
  term ((-48 : Rat) / 67) [(9, 2), (14, 1)]
]

/-- Partial product 382 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0382 : Poly :=
[
  term ((-96 : Rat) / 67) [(9, 2), (10, 1), (14, 2)],
  term ((48 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((-96 : Rat) / 67) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((48 : Rat) / 67) [(9, 2), (11, 2), (14, 1)],
  term ((-48 : Rat) / 67) [(9, 2), (14, 1)],
  term ((96 : Rat) / 67) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0382_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0382
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0383 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

/-- Partial product 383 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0383 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 3)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(9, 2), (14, 1), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0383_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0383
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0384 : Poly :=
[
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 384 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0384 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0384_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0384
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0385 : Poly :=
[
  term ((415 : Rat) / 134) [(10, 1)]
]

/-- Partial product 385 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0385 : Poly :=
[
  term ((415 : Rat) / 134) [(10, 1)],
  term ((415 : Rat) / 67) [(10, 1), (11, 1), (15, 1)],
  term ((-415 : Rat) / 134) [(10, 1), (11, 2)],
  term ((-415 : Rat) / 67) [(10, 1), (14, 1)],
  term ((415 : Rat) / 67) [(10, 2), (14, 1)],
  term ((-415 : Rat) / 134) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0385_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0385
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0386 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 386 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0386 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0386_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0386
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0387 : Poly :=
[
  term ((-245820766226 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 387 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0387 : Poly :=
[
  term ((-245820766226 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)],
  term ((491641532452 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-491641532452 : Rat) / 10471526145) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((245820766226 : Rat) / 10471526145) [(10, 1), (11, 3), (13, 1)],
  term ((-491641532452 : Rat) / 10471526145) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((245820766226 : Rat) / 10471526145) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0387_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0387
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0388 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 388 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0388 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0388_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0388
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0389 : Poly :=
[
  term ((4721940401804 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 389 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0389 : Poly :=
[
  term ((-9443880803608 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4721940401804 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)],
  term ((9443880803608 : Rat) / 94243735305) [(10, 1), (11, 2), (15, 2)],
  term ((-4721940401804 : Rat) / 94243735305) [(10, 1), (11, 3), (15, 1)],
  term ((9443880803608 : Rat) / 94243735305) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4721940401804 : Rat) / 94243735305) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0389_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0389
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0390 : Poly :=
[
  term ((-5224419426688 : Rat) / 94243735305) [(10, 1), (11, 2)]
]

/-- Partial product 390 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0390 : Poly :=
[
  term ((-5224419426688 : Rat) / 94243735305) [(10, 1), (11, 2)],
  term ((10448838853376 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 1)],
  term ((-10448838853376 : Rat) / 94243735305) [(10, 1), (11, 3), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(10, 1), (11, 4)],
  term ((-10448838853376 : Rat) / 94243735305) [(10, 2), (11, 2), (14, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0390_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0390
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0391 : Poly :=
[
  term ((18 : Rat) / 67) [(10, 1), (12, 1)]
]

/-- Partial product 391 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0391 : Poly :=
[
  term ((36 : Rat) / 67) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-18 : Rat) / 67) [(10, 1), (11, 2), (12, 1)],
  term ((18 : Rat) / 67) [(10, 1), (12, 1)],
  term ((-36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((36 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((-18 : Rat) / 67) [(10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0391_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0391
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0392 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 392 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0392 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0392_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0392
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0393 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 393 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0393 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0393_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0393
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0394 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 394 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0394 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0394_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0394
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0395 : Poly :=
[
  term ((-31307200 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 395 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0395 : Poly :=
[
  term ((-62614400 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((31307200 : Rat) / 110226591) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((62614400 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-31307200 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)],
  term ((-62614400 : Rat) / 110226591) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((31307200 : Rat) / 110226591) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0395_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0395
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0396 : Poly :=
[
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 396 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0396 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((456960 : Rat) / 12247399) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0396_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0396
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0397 : Poly :=
[
  term ((-6 : Rat) / 67) [(10, 1), (14, 1)]
]

/-- Partial product 397 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0397 : Poly :=
[
  term ((-12 : Rat) / 67) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((6 : Rat) / 67) [(10, 1), (11, 2), (14, 1)],
  term ((-6 : Rat) / 67) [(10, 1), (14, 1)],
  term ((12 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-12 : Rat) / 67) [(10, 2), (14, 2)],
  term ((6 : Rat) / 67) [(10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0397_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0397
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0398 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 398 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0398 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(10, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0398_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0398
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NNNYN_coefficient_29_0399 : Poly :=
[
  term ((116679034 : Rat) / 36742197) [(10, 1), (15, 2)]
]

/-- Partial product 399 for generator 29. -/
def rs_R009_ueqv_R009NNNYN_partial_29_0399 : Poly :=
[
  term ((233358068 : Rat) / 36742197) [(10, 1), (11, 1), (15, 3)],
  term ((-116679034 : Rat) / 36742197) [(10, 1), (11, 2), (15, 2)],
  term ((-233358068 : Rat) / 36742197) [(10, 1), (14, 1), (15, 2)],
  term ((116679034 : Rat) / 36742197) [(10, 1), (15, 2)],
  term ((233358068 : Rat) / 36742197) [(10, 2), (14, 1), (15, 2)],
  term ((-116679034 : Rat) / 36742197) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 29. -/
theorem rs_R009_ueqv_R009NNNYN_partial_29_0399_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_29_0399
        rs_R009_ueqv_R009NNNYN_generator_29_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_29_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_29_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_29_0300,
  rs_R009_ueqv_R009NNNYN_partial_29_0301,
  rs_R009_ueqv_R009NNNYN_partial_29_0302,
  rs_R009_ueqv_R009NNNYN_partial_29_0303,
  rs_R009_ueqv_R009NNNYN_partial_29_0304,
  rs_R009_ueqv_R009NNNYN_partial_29_0305,
  rs_R009_ueqv_R009NNNYN_partial_29_0306,
  rs_R009_ueqv_R009NNNYN_partial_29_0307,
  rs_R009_ueqv_R009NNNYN_partial_29_0308,
  rs_R009_ueqv_R009NNNYN_partial_29_0309,
  rs_R009_ueqv_R009NNNYN_partial_29_0310,
  rs_R009_ueqv_R009NNNYN_partial_29_0311,
  rs_R009_ueqv_R009NNNYN_partial_29_0312,
  rs_R009_ueqv_R009NNNYN_partial_29_0313,
  rs_R009_ueqv_R009NNNYN_partial_29_0314,
  rs_R009_ueqv_R009NNNYN_partial_29_0315,
  rs_R009_ueqv_R009NNNYN_partial_29_0316,
  rs_R009_ueqv_R009NNNYN_partial_29_0317,
  rs_R009_ueqv_R009NNNYN_partial_29_0318,
  rs_R009_ueqv_R009NNNYN_partial_29_0319,
  rs_R009_ueqv_R009NNNYN_partial_29_0320,
  rs_R009_ueqv_R009NNNYN_partial_29_0321,
  rs_R009_ueqv_R009NNNYN_partial_29_0322,
  rs_R009_ueqv_R009NNNYN_partial_29_0323,
  rs_R009_ueqv_R009NNNYN_partial_29_0324,
  rs_R009_ueqv_R009NNNYN_partial_29_0325,
  rs_R009_ueqv_R009NNNYN_partial_29_0326,
  rs_R009_ueqv_R009NNNYN_partial_29_0327,
  rs_R009_ueqv_R009NNNYN_partial_29_0328,
  rs_R009_ueqv_R009NNNYN_partial_29_0329,
  rs_R009_ueqv_R009NNNYN_partial_29_0330,
  rs_R009_ueqv_R009NNNYN_partial_29_0331,
  rs_R009_ueqv_R009NNNYN_partial_29_0332,
  rs_R009_ueqv_R009NNNYN_partial_29_0333,
  rs_R009_ueqv_R009NNNYN_partial_29_0334,
  rs_R009_ueqv_R009NNNYN_partial_29_0335,
  rs_R009_ueqv_R009NNNYN_partial_29_0336,
  rs_R009_ueqv_R009NNNYN_partial_29_0337,
  rs_R009_ueqv_R009NNNYN_partial_29_0338,
  rs_R009_ueqv_R009NNNYN_partial_29_0339,
  rs_R009_ueqv_R009NNNYN_partial_29_0340,
  rs_R009_ueqv_R009NNNYN_partial_29_0341,
  rs_R009_ueqv_R009NNNYN_partial_29_0342,
  rs_R009_ueqv_R009NNNYN_partial_29_0343,
  rs_R009_ueqv_R009NNNYN_partial_29_0344,
  rs_R009_ueqv_R009NNNYN_partial_29_0345,
  rs_R009_ueqv_R009NNNYN_partial_29_0346,
  rs_R009_ueqv_R009NNNYN_partial_29_0347,
  rs_R009_ueqv_R009NNNYN_partial_29_0348,
  rs_R009_ueqv_R009NNNYN_partial_29_0349,
  rs_R009_ueqv_R009NNNYN_partial_29_0350,
  rs_R009_ueqv_R009NNNYN_partial_29_0351,
  rs_R009_ueqv_R009NNNYN_partial_29_0352,
  rs_R009_ueqv_R009NNNYN_partial_29_0353,
  rs_R009_ueqv_R009NNNYN_partial_29_0354,
  rs_R009_ueqv_R009NNNYN_partial_29_0355,
  rs_R009_ueqv_R009NNNYN_partial_29_0356,
  rs_R009_ueqv_R009NNNYN_partial_29_0357,
  rs_R009_ueqv_R009NNNYN_partial_29_0358,
  rs_R009_ueqv_R009NNNYN_partial_29_0359,
  rs_R009_ueqv_R009NNNYN_partial_29_0360,
  rs_R009_ueqv_R009NNNYN_partial_29_0361,
  rs_R009_ueqv_R009NNNYN_partial_29_0362,
  rs_R009_ueqv_R009NNNYN_partial_29_0363,
  rs_R009_ueqv_R009NNNYN_partial_29_0364,
  rs_R009_ueqv_R009NNNYN_partial_29_0365,
  rs_R009_ueqv_R009NNNYN_partial_29_0366,
  rs_R009_ueqv_R009NNNYN_partial_29_0367,
  rs_R009_ueqv_R009NNNYN_partial_29_0368,
  rs_R009_ueqv_R009NNNYN_partial_29_0369,
  rs_R009_ueqv_R009NNNYN_partial_29_0370,
  rs_R009_ueqv_R009NNNYN_partial_29_0371,
  rs_R009_ueqv_R009NNNYN_partial_29_0372,
  rs_R009_ueqv_R009NNNYN_partial_29_0373,
  rs_R009_ueqv_R009NNNYN_partial_29_0374,
  rs_R009_ueqv_R009NNNYN_partial_29_0375,
  rs_R009_ueqv_R009NNNYN_partial_29_0376,
  rs_R009_ueqv_R009NNNYN_partial_29_0377,
  rs_R009_ueqv_R009NNNYN_partial_29_0378,
  rs_R009_ueqv_R009NNNYN_partial_29_0379,
  rs_R009_ueqv_R009NNNYN_partial_29_0380,
  rs_R009_ueqv_R009NNNYN_partial_29_0381,
  rs_R009_ueqv_R009NNNYN_partial_29_0382,
  rs_R009_ueqv_R009NNNYN_partial_29_0383,
  rs_R009_ueqv_R009NNNYN_partial_29_0384,
  rs_R009_ueqv_R009NNNYN_partial_29_0385,
  rs_R009_ueqv_R009NNNYN_partial_29_0386,
  rs_R009_ueqv_R009NNNYN_partial_29_0387,
  rs_R009_ueqv_R009NNNYN_partial_29_0388,
  rs_R009_ueqv_R009NNNYN_partial_29_0389,
  rs_R009_ueqv_R009NNNYN_partial_29_0390,
  rs_R009_ueqv_R009NNNYN_partial_29_0391,
  rs_R009_ueqv_R009NNNYN_partial_29_0392,
  rs_R009_ueqv_R009NNNYN_partial_29_0393,
  rs_R009_ueqv_R009NNNYN_partial_29_0394,
  rs_R009_ueqv_R009NNNYN_partial_29_0395,
  rs_R009_ueqv_R009NNNYN_partial_29_0396,
  rs_R009_ueqv_R009NNNYN_partial_29_0397,
  rs_R009_ueqv_R009NNNYN_partial_29_0398,
  rs_R009_ueqv_R009NNNYN_partial_29_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_29_0300_0399 : Poly :=
[
  term ((891740262161 : Rat) / 17452543575) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-11483680 : Rat) / 231083) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1878107679 : Rat) / 306184975) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-10488320 : Rat) / 110226591) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((3229466429 : Rat) / 612369950) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-308506800 : Rat) / 12247399) [(7, 1), (10, 1), (13, 1), (14, 3)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((-90195334051259 : Rat) / 942437353050) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-30318188881 : Rat) / 8266994325) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11539856000 : Rat) / 110226591) [(7, 1), (10, 1), (14, 1), (15, 3)],
  term ((1788826432 : Rat) / 918554925) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-20641044794 : Rat) / 8266994325) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(7, 1), (10, 1), (14, 2), (15, 3)],
  term ((5935083200 : Rat) / 110226591) [(7, 1), (10, 1), (14, 3), (15, 1)],
  term ((-891740262161 : Rat) / 34905087150) [(7, 1), (10, 2), (13, 1)],
  term ((1878107679 : Rat) / 612369950) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(7, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((154253400 : Rat) / 12247399) [(7, 1), (10, 2), (13, 1), (14, 2)],
  term ((5741840 : Rat) / 231083) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(7, 1), (10, 2), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((90195334051259 : Rat) / 1884874706100) [(7, 1), (10, 2), (15, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(7, 1), (10, 2), (15, 3)],
  term ((-1878107679 : Rat) / 306184975) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3229466429 : Rat) / 612369950) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10488320 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-308506800 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((891740262161 : Rat) / 17452543575) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11483680 : Rat) / 231083) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((4112640 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((1788826432 : Rat) / 918554925) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-20641044794 : Rat) / 8266994325) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 4)],
  term ((5935083200 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((-90195334051259 : Rat) / 942437353050) [(7, 1), (11, 1), (15, 2)],
  term ((-30318188881 : Rat) / 8266994325) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((11539856000 : Rat) / 110226591) [(7, 1), (11, 1), (15, 4)],
  term ((-891740262161 : Rat) / 34905087150) [(7, 1), (11, 2), (13, 1)],
  term ((1878107679 : Rat) / 612369950) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((154253400 : Rat) / 12247399) [(7, 1), (11, 2), (13, 1), (14, 2)],
  term ((5741840 : Rat) / 231083) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1224739900) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((90195334051259 : Rat) / 1884874706100) [(7, 1), (11, 2), (15, 1)],
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((891740262161 : Rat) / 34905087150) [(7, 1), (13, 1)],
  term ((-75621306481 : Rat) / 1396203486) [(7, 1), (13, 1), (14, 1)],
  term ((5472471200 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((9688399287 : Rat) / 1224739900) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1978227321 : Rat) / 306184975) [(7, 1), (13, 1), (14, 2)],
  term ((10488320 : Rat) / 110226591) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3229466429 : Rat) / 612369950) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((308506800 : Rat) / 12247399) [(7, 1), (13, 1), (14, 3)],
  term ((-5741840 : Rat) / 231083) [(7, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1224739900) [(7, 1), (13, 1), (16, 1)],
  term ((-3198720 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)],
  term ((3644520080435 : Rat) / 37697494122) [(7, 1), (14, 1), (15, 1)],
  term ((6665888828 : Rat) / 2755664775) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11566229120 : Rat) / 110226591) [(7, 1), (14, 1), (15, 3)],
  term ((68822060704 : Rat) / 2755664775) [(7, 1), (14, 2), (15, 1)],
  term ((20641044794 : Rat) / 8266994325) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(7, 1), (14, 2), (15, 3)],
  term ((-5935083200 : Rat) / 110226591) [(7, 1), (14, 3), (15, 1)],
  term ((-90195334051259 : Rat) / 1884874706100) [(7, 1), (15, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (15, 3)],
  term ((632 : Rat) / 67) [(7, 2)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-489402495133 : Rat) / 18848747061) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 3)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 52357630725) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (10, 1), (11, 2), (14, 1)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-102794815326 : Rat) / 5817514525) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1264 : Rat) / 67) [(7, 2), (10, 1), (14, 1)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (10, 1), (14, 1), (15, 2)],
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (10, 1), (14, 2)],
  term ((-632 : Rat) / 67) [(7, 2), (10, 2)],
  term ((198921520 : Rat) / 12247399) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 2), (10, 2), (11, 2)],
  term ((-161932318884 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(7, 2), (10, 2), (14, 1)],
  term ((1047453296072 : Rat) / 17452543575) [(7, 2), (10, 2), (15, 2)],
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-102794815326 : Rat) / 5817514525) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-34672225081552 : Rat) / 157072892175) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((2192956060288 : Rat) / 52357630725) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19839901329476 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (11, 1), (15, 3)],
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-15850225288 : Rat) / 330679773) [(7, 2), (11, 2)],
  term ((-350907762884 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((26429316284 : Rat) / 330679773) [(7, 2), (11, 2), (14, 1)],
  term ((1727212444336 : Rat) / 6282915687) [(7, 2), (11, 2), (15, 2)],
  term ((-135615733985 : Rat) / 2094305229) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((198921520 : Rat) / 12247399) [(7, 2), (11, 3), (13, 1)],
  term ((-28971044137876 : Rat) / 157072892175) [(7, 2), (11, 3), (15, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(7, 2), (11, 4)],
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((102794815326 : Rat) / 5817514525) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1460 : Rat) / 67) [(7, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (14, 1), (15, 2)],
  term ((-2394874578674 : Rat) / 52357630725) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((392 : Rat) / 67) [(7, 2), (14, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (15, 2)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (10, 1), (11, 1), (14, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (10, 1), (13, 1), (14, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (10, 1), (14, 1), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (10, 2), (11, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (10, 2), (13, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(7, 3), (10, 2), (15, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (11, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (11, 1), (13, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (11, 1), (14, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (11, 1), (15, 2)],
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (11, 2), (13, 1)],
  term ((271231467970 : Rat) / 6282915687) [(7, 3), (11, 2), (15, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (11, 3)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (13, 1), (14, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (14, 1), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (15, 1)],
  term ((42804231148 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1)],
  term ((-44993295872 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2091676160 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-173340160 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6092800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1141041552 : Rat) / 1163502905) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((6641593645139 : Rat) / 157072892175) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((11990481760 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((2320 : Rat) / 201) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((485492909512 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-128819200 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((9748480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (14, 3)],
  term ((-16845945838 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-570520776 : Rat) / 1163502905) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((609280 : Rat) / 12247399) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-990515200 : Rat) / 330679773) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((18806287043 : Rat) / 2094305229) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-42804231148 : Rat) / 10471526145) [(9, 1), (10, 1), (11, 3)],
  term ((38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 3), (14, 1)],
  term ((-703020248 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((32682440 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((40396632772 : Rat) / 330679773) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-63 : Rat) / 67) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2596958416 : Rat) / 330679773) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((570520776 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1)],
  term ((403133539829 : Rat) / 23270058100) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((2673649520 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9575457808 : Rat) / 918554925) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((10488320 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((456960 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 3)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((-16256717706869 : Rat) / 314145784350) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5639936960 : Rat) / 110226591) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-367558745276 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (10, 1), (14, 2), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (10, 1), (14, 3), (15, 1)],
  term ((-8422972919 : Rat) / 10471526145) [(9, 1), (10, 1), (15, 1)],
  term ((-2648080897193 : Rat) / 104715261450) [(9, 1), (10, 2), (11, 1)],
  term ((22496647936 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1045838080 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((3046400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((81186560 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-704235501044 : Rat) / 471218676525) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((64409600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-92610560 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((-1986692240 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 201) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 36742197) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((351510124 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-16341220 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((1298479208 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-20198316386 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-175820800 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((-427112002869 : Rat) / 46540116200) [(9, 1), (10, 2), (13, 1)],
  term ((-72983001896 : Rat) / 17452543575) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-5244160 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1447040 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-1336824760 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((2683631589412 : Rat) / 471218676525) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(9, 1), (10, 2), (14, 1), (15, 3)],
  term ((83514880 : Rat) / 330679773) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((5598500678003 : Rat) / 209430522900) [(9, 1), (10, 2), (15, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2819968480 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((-42804231148 : Rat) / 10471526145) [(9, 1), (10, 3), (11, 1)],
  term ((38993920 : Rat) / 330679773) [(9, 1), (10, 3), (11, 1), (14, 1)],
  term ((-570520776 : Rat) / 1163502905) [(9, 1), (10, 3), (13, 1)],
  term ((609280 : Rat) / 12247399) [(9, 1), (10, 3), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 330679773) [(9, 1), (10, 3), (14, 1), (15, 1)],
  term ((8422972919 : Rat) / 10471526145) [(9, 1), (10, 3), (15, 1)],
  term ((2648080897193 : Rat) / 104715261450) [(9, 1), (11, 1)],
  term ((-22496647936 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)],
  term ((32682440 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-703020248 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18278400 : Rat) / 12247399) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((5115459328 : Rat) / 36742197) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1427140816 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2091676160 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((39811723972 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-63 : Rat) / 67) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 4)],
  term ((32435365424 : Rat) / 2755664775) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10488320 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((152320 : Rat) / 1645173) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((3689753561821 : Rat) / 209430522900) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2673649520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-19276111770373 : Rat) / 471218676525) [(9, 1), (11, 1), (14, 1)],
  term ((-1270787789276 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-265619057206 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 4)],
  term ((-84739440164 : Rat) / 8266994325) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-478547117512 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 2)],
  term ((120028160 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (11, 1), (14, 3)],
  term ((-3711143050003 : Rat) / 104715261450) [(9, 1), (11, 1), (15, 2)],
  term ((173448239881 : Rat) / 24800982975) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5639936960 : Rat) / 110226591) [(9, 1), (11, 1), (15, 4)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)],
  term ((351510124 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-16341220 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((3390155368 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-65191612258 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-565760000 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-427112002869 : Rat) / 46540116200) [(9, 1), (11, 2), (13, 1)],
  term ((-4742032904 : Rat) / 918554925) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-11336960 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-228480 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((-1499197880 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((29414470166 : Rat) / 992039319) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-67858775 : Rat) / 14806557) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-155192320 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 3)],
  term ((-7093760 : Rat) / 12247399) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((636519703471 : Rat) / 8377220916) [(9, 1), (11, 2), (15, 1)],
  term ((14991021055 : Rat) / 1984078638) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((6793352960 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((2320 : Rat) / 201) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-2648080897193 : Rat) / 104715261450) [(9, 1), (11, 3)],
  term ((22496647936 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1)],
  term ((-1045838080 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((3046400 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((81186560 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-239821910756 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1)],
  term ((142397440 : Rat) / 110226591) [(9, 1), (11, 3), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-4874240 : Rat) / 110226591) [(9, 1), (11, 3), (14, 2)],
  term ((-2279146640 : Rat) / 110226591) [(9, 1), (11, 3), (15, 2)],
  term ((-1160 : Rat) / 201) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(9, 1), (11, 3), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(9, 1), (11, 4), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 36742197) [(9, 1), (11, 4), (15, 1)],
  term ((-351510124 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((719361468 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-32682440 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4632790220 : Rat) / 36742197) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((63 : Rat) / 67) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((2596958416 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((20198316386 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((427112002869 : Rat) / 46540116200) [(9, 1), (13, 1)],
  term ((-920941507903 : Rat) / 69810174300) [(9, 1), (13, 1), (14, 1)],
  term ((-2668405360 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1224739900) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9466929808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 2)],
  term ((-10488320 : Rat) / 110226591) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (13, 1), (14, 3)],
  term ((1336824760 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)],
  term ((43503107797783 : Rat) / 942437353050) [(9, 1), (14, 1), (15, 1)],
  term ((-6665888828 : Rat) / 8266994325) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5666310080 : Rat) / 110226591) [(9, 1), (14, 1), (15, 3)],
  term ((361295129276 : Rat) / 24800982975) [(9, 1), (14, 2), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (14, 2), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (14, 3), (15, 1)],
  term ((-5598500678003 : Rat) / 209430522900) [(9, 1), (15, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (15, 1), (16, 1)],
  term ((-2819968480 : Rat) / 110226591) [(9, 1), (15, 3)],
  term ((-821 : Rat) / 268) [(9, 2)],
  term ((49 : Rat) / 67) [(9, 2), (10, 1)],
  term ((44102409344 : Rat) / 18848747061) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((98 : Rat) / 67) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 1), (11, 2)],
  term ((689100146 : Rat) / 698101743) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1017 : Rat) / 134) [(9, 2), (10, 1), (14, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (10, 1), (14, 1), (15, 2)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-96 : Rat) / 67) [(9, 2), (10, 1), (14, 2)],
  term ((821 : Rat) / 268) [(9, 2), (10, 2)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((11025602336 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 1396203486) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((146 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2)],
  term ((-19226441917 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 3)],
  term ((689100146 : Rat) / 698101743) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-71109569312 : Rat) / 18848747061) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186865073299 : Rat) / 37697494122) [(9, 2), (11, 1), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 3)],
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((821 : Rat) / 268) [(9, 2), (11, 2)],
  term ((-344550073 : Rat) / 698101743) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 1396203486) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 67) [(9, 2), (11, 2), (14, 1)],
  term ((82555293178 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2)],
  term ((-41277646589 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1)],
  term ((11025602336 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((725 : Rat) / 134) [(9, 2), (14, 1)],
  term ((76905767668 : Rat) / 18848747061) [(9, 2), (14, 1), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 67) [(9, 2), (14, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)],
  term ((415 : Rat) / 134) [(10, 1)],
  term ((9139200 : Rat) / 12247399) [(10, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((156711028 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-245820766226 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)],
  term ((491641532452 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-62614400 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-9452425328188 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((-19496960 : Rat) / 110226591) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((5305688911529 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)],
  term ((233358068 : Rat) / 36742197) [(10, 1), (11, 1), (15, 3)],
  term ((-11032587363101 : Rat) / 188487470610) [(10, 1), (11, 2)],
  term ((-18 : Rat) / 67) [(10, 1), (11, 2), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((282880000 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-488667348452 : Rat) / 10471526145) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 2)],
  term ((10457278590866 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 1)],
  term ((28288000 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((9144599081398 : Rat) / 94243735305) [(10, 1), (11, 2), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((245820766226 : Rat) / 10471526145) [(10, 1), (11, 3), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((-3034155851036 : Rat) / 18848747061) [(10, 1), (11, 3), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(10, 1), (11, 4)],
  term ((18 : Rat) / 67) [(10, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-36 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)],
  term ((66727040 : Rat) / 110226591) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-31307200 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2), (14, 1)],
  term ((-421 : Rat) / 67) [(10, 1), (14, 1)],
  term ((-708865244 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((12 : Rat) / 67) [(10, 1), (14, 2)],
  term ((17582080 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((116679034 : Rat) / 36742197) [(10, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-491641532452 : Rat) / 10471526145) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((9443880803608 : Rat) / 94243735305) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(10, 2), (11, 1), (14, 2), (15, 1)],
  term ((-10448838853376 : Rat) / 94243735305) [(10, 2), (11, 2), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((36 : Rat) / 67) [(10, 2), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-62614400 : Rat) / 110226591) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 2), (13, 2), (14, 1)],
  term ((415 : Rat) / 67) [(10, 2), (14, 1)],
  term ((233358068 : Rat) / 36742197) [(10, 2), (14, 1), (15, 2)],
  term ((-12 : Rat) / 67) [(10, 2), (14, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 2), (14, 2), (15, 2)],
  term ((-415 : Rat) / 134) [(10, 3)],
  term ((-97484800 : Rat) / 110226591) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((245820766226 : Rat) / 10471526145) [(10, 3), (11, 1), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(10, 3), (11, 1), (14, 1), (15, 1)],
  term ((-4721940401804 : Rat) / 94243735305) [(10, 3), (11, 1), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(10, 3), (11, 2)],
  term ((-18 : Rat) / 67) [(10, 3), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(10, 3), (12, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(10, 3), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 3), (13, 1), (14, 1), (15, 1)],
  term ((31307200 : Rat) / 110226591) [(10, 3), (13, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 3), (13, 2)],
  term ((6 : Rat) / 67) [(10, 3), (14, 1)],
  term ((8791040 : Rat) / 110226591) [(10, 3), (14, 1), (15, 2)],
  term ((-116679034 : Rat) / 36742197) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NNNYN_block_29_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_29_0300_0399
      rs_R009_ueqv_R009NNNYN_block_29_0300_0399 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
