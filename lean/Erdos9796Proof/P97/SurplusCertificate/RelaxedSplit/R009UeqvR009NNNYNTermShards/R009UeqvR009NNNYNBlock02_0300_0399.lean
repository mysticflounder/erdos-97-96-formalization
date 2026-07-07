/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 2:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0300 : Poly :=
[
  term ((-2056320 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 300 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0300 : Poly :=
[
  term ((-2056320 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0300
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0301 : Poly :=
[
  term ((-894413216 : Rat) / 918554925) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 301 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0301 : Poly :=
[
  term ((-894413216 : Rat) / 918554925) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((894413216 : Rat) / 918554925) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((894413216 : Rat) / 918554925) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0301
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0302 : Poly :=
[
  term ((10320522397 : Rat) / 8266994325) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0302 : Poly :=
[
  term ((10320522397 : Rat) / 8266994325) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 8266994325) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0302
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0303 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 303 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0303 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(0, 2), (7, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(1, 2), (7, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(7, 1), (10, 2), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0303
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0304 : Poly :=
[
  term ((-2967541600 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 304 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0304 : Poly :=
[
  term ((-2967541600 : Rat) / 110226591) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-2967541600 : Rat) / 110226591) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((2967541600 : Rat) / 110226591) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((2967541600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0304
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0305 : Poly :=
[
  term ((99172046811419 : Rat) / 1884874706100) [(7, 1), (15, 1)]
]

/-- Partial product 305 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0305 : Poly :=
[
  term ((99172046811419 : Rat) / 1884874706100) [(0, 2), (7, 1), (15, 1)],
  term ((99172046811419 : Rat) / 1884874706100) [(1, 2), (7, 1), (15, 1)],
  term ((-99172046811419 : Rat) / 1884874706100) [(7, 1), (10, 2), (15, 1)],
  term ((-99172046811419 : Rat) / 1884874706100) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0305
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0306 : Poly :=
[
  term ((30318188881 : Rat) / 16533988650) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0306 : Poly :=
[
  term ((30318188881 : Rat) / 16533988650) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 16533988650) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0306
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0307 : Poly :=
[
  term ((-5769928000 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 307 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0307 : Poly :=
[
  term ((-5769928000 : Rat) / 110226591) [(0, 2), (7, 1), (15, 3)],
  term ((-5769928000 : Rat) / 110226591) [(1, 2), (7, 1), (15, 3)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (10, 2), (15, 3)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0307
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0308 : Poly :=
[
  term ((-632 : Rat) / 67) [(7, 2)]
]

/-- Partial product 308 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0308 : Poly :=
[
  term ((-632 : Rat) / 67) [(0, 2), (7, 2)],
  term ((-632 : Rat) / 67) [(1, 2), (7, 2)],
  term ((632 : Rat) / 67) [(7, 2), (10, 2)],
  term ((632 : Rat) / 67) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0308
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0309 : Poly :=
[
  term ((3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 309 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0309 : Poly :=
[
  term ((3840714207232 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (11, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (11, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0309
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0310 : Poly :=
[
  term ((60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 310 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0310 : Poly :=
[
  term ((60011159488 : Rat) / 17452543575) [(0, 2), (7, 2), (9, 1), (13, 1)],
  term ((60011159488 : Rat) / 17452543575) [(1, 2), (7, 2), (9, 1), (13, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0310
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0311 : Poly :=
[
  term ((-4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 311 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0311 : Poly :=
[
  term ((-4553633963861 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (15, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0311_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0311
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0312 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 312 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0312 : Poly :=
[
  term ((198921520 : Rat) / 12247399) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((198921520 : Rat) / 12247399) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0312_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0312
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0313 : Poly :=
[
  term ((-16876615721876 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 313 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0313 : Poly :=
[
  term ((-16876615721876 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0313_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0313
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0314 : Poly :=
[
  term ((1096478030144 : Rat) / 52357630725) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0314 : Poly :=
[
  term ((1096478030144 : Rat) / 52357630725) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0314_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0314
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0315 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(7, 2), (11, 2)]
]

/-- Partial product 315 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0315 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(0, 2), (7, 2), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(1, 2), (7, 2), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (10, 2), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0315_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0315
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0316 : Poly :=
[
  term ((-161932318884 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 316 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0316 : Poly :=
[
  term ((-161932318884 : Rat) / 5817514525) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((-161932318884 : Rat) / 5817514525) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0316_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0316
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0317 : Poly :=
[
  term ((51397407663 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0317 : Poly :=
[
  term ((51397407663 : Rat) / 5817514525) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((51397407663 : Rat) / 5817514525) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0317_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0317
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0318 : Poly :=
[
  term ((196 : Rat) / 67) [(7, 2), (14, 1)]
]

/-- Partial product 318 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0318 : Poly :=
[
  term ((196 : Rat) / 67) [(0, 2), (7, 2), (14, 1)],
  term ((196 : Rat) / 67) [(1, 2), (7, 2), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (10, 2), (14, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0318_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0318
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0319 : Poly :=
[
  term ((1047453296072 : Rat) / 17452543575) [(7, 2), (15, 2)]
]

/-- Partial product 319 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0319 : Poly :=
[
  term ((1047453296072 : Rat) / 17452543575) [(0, 2), (7, 2), (15, 2)],
  term ((1047453296072 : Rat) / 17452543575) [(1, 2), (7, 2), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (10, 2), (15, 2)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0319_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0319
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0320 : Poly :=
[
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0320 : Poly :=
[
  term ((-1197437289337 : Rat) / 52357630725) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((-1197437289337 : Rat) / 52357630725) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0320_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0320
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0321 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (11, 1)]
]

/-- Partial product 321 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0321 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(0, 2), (7, 3), (11, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(1, 2), (7, 3), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (10, 2), (11, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0321_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0321
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0322 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (13, 1)]
]

/-- Partial product 322 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0322 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(0, 2), (7, 3), (13, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(1, 2), (7, 3), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (10, 2), (13, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0322_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0322
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0323 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(7, 3), (15, 1)]
]

/-- Partial product 323 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0323 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(0, 2), (7, 3), (15, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(1, 2), (7, 3), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (10, 2), (15, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0323_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0323
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0324 : Poly :=
[
  term ((-2997447793676 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 324 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0324 : Poly :=
[
  term ((-2997447793676 : Rat) / 94243735305) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2997447793676 : Rat) / 94243735305) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((2997447793676 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 3)],
  term ((2997447793676 : Rat) / 94243735305) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0324_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0324
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0325 : Poly :=
[
  term ((38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 325 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0325 : Poly :=
[
  term ((38993920 : Rat) / 330679773) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 330679773) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 3), (14, 1)],
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0325_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0325
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0326 : Poly :=
[
  term ((-42527339099 : Rat) / 3490508715) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 326 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0326 : Poly :=
[
  term ((-42527339099 : Rat) / 3490508715) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-42527339099 : Rat) / 3490508715) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((42527339099 : Rat) / 3490508715) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((42527339099 : Rat) / 3490508715) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0326_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0326
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0327 : Poly :=
[
  term ((609280 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 327 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0327 : Poly :=
[
  term ((609280 : Rat) / 12247399) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((609280 : Rat) / 12247399) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0327_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0327
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0328 : Poly :=
[
  term ((-35164160 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 328 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0328 : Poly :=
[
  term ((-35164160 : Rat) / 330679773) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 330679773) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0328_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0328
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0329 : Poly :=
[
  term ((2477409840373 : Rat) / 94243735305) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 329 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0329 : Poly :=
[
  term ((2477409840373 : Rat) / 94243735305) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((2477409840373 : Rat) / 94243735305) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2477409840373 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2477409840373 : Rat) / 94243735305) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0329_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0329
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0330 : Poly :=
[
  term ((12941152933193 : Rat) / 942437353050) [(9, 1), (11, 1)]
]

/-- Partial product 330 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0330 : Poly :=
[
  term ((12941152933193 : Rat) / 942437353050) [(0, 2), (9, 1), (11, 1)],
  term ((12941152933193 : Rat) / 942437353050) [(1, 2), (9, 1), (11, 1)],
  term ((-12941152933193 : Rat) / 942437353050) [(9, 1), (10, 2), (11, 1)],
  term ((-12941152933193 : Rat) / 942437353050) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0330_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0330
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0331 : Poly :=
[
  term ((22321175296 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 331 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0331 : Poly :=
[
  term ((22321175296 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((22321175296 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-22321175296 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-22321175296 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0331_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0331
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0332 : Poly :=
[
  term ((-753383680 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 332 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0332 : Poly :=
[
  term ((-753383680 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-753383680 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((753383680 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((753383680 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0332_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0332
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0333 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 333 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0333 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0333_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0333
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0334 : Poly :=
[
  term ((3046400 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 334 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0334 : Poly :=
[
  term ((3046400 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3046400 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3046400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3046400 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0334_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0334
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0335 : Poly :=
[
  term ((26351360 : Rat) / 36742197) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 335 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0335 : Poly :=
[
  term ((26351360 : Rat) / 36742197) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((26351360 : Rat) / 36742197) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-26351360 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-26351360 : Rat) / 36742197) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0335_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0335
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0336 : Poly :=
[
  term ((-270895190756 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 336 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0336 : Poly :=
[
  term ((-270895190756 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-270895190756 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((270895190756 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((270895190756 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0336_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0336
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0337 : Poly :=
[
  term ((64409600 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 337 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0337 : Poly :=
[
  term ((64409600 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((64409600 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-64409600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-64409600 : Rat) / 110226591) [(9, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0337_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0337
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0338 : Poly :=
[
  term ((51671462864 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 338 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0338 : Poly :=
[
  term ((51671462864 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((51671462864 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0338_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0338
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0339 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 339 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0339 : Poly :=
[
  term ((9748480 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((9748480 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (11, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0339_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0339
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0340 : Poly :=
[
  term ((-1889033360 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 340 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0340 : Poly :=
[
  term ((-1889033360 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1889033360 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((1889033360 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((1889033360 : Rat) / 110226591) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0340_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0340
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0341 : Poly :=
[
  term ((-1160 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0341 : Poly :=
[
  term ((-1160 : Rat) / 201) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1160 : Rat) / 201) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 201) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 201) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0341_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0341
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0342 : Poly :=
[
  term ((-101273428814 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 342 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0342 : Poly :=
[
  term ((-101273428814 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0342_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0342
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0343 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 343 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0343 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(9, 1), (11, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0343_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0343
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0344 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 344 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0344 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0344_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0344
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0345 : Poly :=
[
  term ((348768364 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 345 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0345 : Poly :=
[
  term ((348768364 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((348768364 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-348768364 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-348768364 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0345_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0345
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0346 : Poly :=
[
  term ((-11771620 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 346 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0346 : Poly :=
[
  term ((-11771620 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11771620 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((11771620 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((11771620 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0346_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0346
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0347 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 347 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0347 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0347_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0347
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0348 : Poly :=
[
  term ((1034748008 : Rat) / 330679773) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 348 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0348 : Poly :=
[
  term ((1034748008 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1034748008 : Rat) / 330679773) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1034748008 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1034748008 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0348_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0348
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0349 : Poly :=
[
  term ((-20040077666 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 349 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0349 : Poly :=
[
  term ((-20040077666 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-20040077666 : Rat) / 330679773) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((20040077666 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((20040077666 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0349_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0349
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0350 : Poly :=
[
  term ((63 : Rat) / 134) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 350 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0350 : Poly :=
[
  term ((63 : Rat) / 134) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 134) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0350_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0350
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0351 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 351 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0351 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(0, 2), (9, 1), (12, 1), (15, 3)],
  term ((-175820800 : Rat) / 110226591) [(1, 2), (9, 1), (12, 1), (15, 3)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0351_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0351
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0352 : Poly :=
[
  term ((1112857740473 : Rat) / 139620348600) [(9, 1), (13, 1)]
]

/-- Partial product 352 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0352 : Poly :=
[
  term ((1112857740473 : Rat) / 139620348600) [(0, 2), (9, 1), (13, 1)],
  term ((1112857740473 : Rat) / 139620348600) [(1, 2), (9, 1), (13, 1)],
  term ((-1112857740473 : Rat) / 139620348600) [(9, 1), (10, 2), (13, 1)],
  term ((-1112857740473 : Rat) / 139620348600) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0352_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0352
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0353 : Poly :=
[
  term ((-5227552904 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 353 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0353 : Poly :=
[
  term ((-5227552904 : Rat) / 918554925) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5227552904 : Rat) / 918554925) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((5227552904 : Rat) / 918554925) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((5227552904 : Rat) / 918554925) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0353_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0353
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0354 : Poly :=
[
  term ((-5244160 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 354 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0354 : Poly :=
[
  term ((-5244160 : Rat) / 110226591) [(0, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5244160 : Rat) / 110226591) [(1, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0354_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0354
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0355 : Poly :=
[
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 355 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0355 : Poly :=
[
  term ((3229466429 : Rat) / 3674219700) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0355_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0355
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0356 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 356 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0356 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((456960 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0356_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0356
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0357 : Poly :=
[
  term ((-455958760 : Rat) / 36742197) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 357 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0357 : Poly :=
[
  term ((-455958760 : Rat) / 36742197) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-455958760 : Rat) / 36742197) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((455958760 : Rat) / 36742197) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((455958760 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0357_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0357
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0358 : Poly :=
[
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 358 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0358 : Poly :=
[
  term ((-3229466429 : Rat) / 3674219700) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0358_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0358
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0359 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 359 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0359 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0359_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0359
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0360 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 360 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0360 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0360_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0360
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0361 : Poly :=
[
  term ((197071479088 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 361 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0361 : Poly :=
[
  term ((197071479088 : Rat) / 24800982975) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((197071479088 : Rat) / 24800982975) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-197071479088 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-197071479088 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0361_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0361
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0362 : Poly :=
[
  term ((-10320522397 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0362 : Poly :=
[
  term ((-10320522397 : Rat) / 24800982975) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0362_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0362
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0363 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 363 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0363 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(0, 2), (9, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(1, 2), (9, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (10, 2), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0363_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0363
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0364 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 364 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0364 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0364_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0364
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0365 : Poly :=
[
  term ((-19162581761753 : Rat) / 1884874706100) [(9, 1), (15, 1)]
]

/-- Partial product 365 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0365 : Poly :=
[
  term ((-19162581761753 : Rat) / 1884874706100) [(0, 2), (9, 1), (15, 1)],
  term ((-19162581761753 : Rat) / 1884874706100) [(1, 2), (9, 1), (15, 1)],
  term ((19162581761753 : Rat) / 1884874706100) [(9, 1), (10, 2), (15, 1)],
  term ((19162581761753 : Rat) / 1884874706100) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0365_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0365
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0366 : Poly :=
[
  term ((-30318188881 : Rat) / 49601965950) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0366 : Poly :=
[
  term ((-30318188881 : Rat) / 49601965950) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0366_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0366
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0367 : Poly :=
[
  term ((2811177440 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 367 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0367 : Poly :=
[
  term ((2811177440 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((2811177440 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((-2811177440 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((-2811177440 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0367_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0367
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0368 : Poly :=
[
  term ((1693 : Rat) / 268) [(9, 2)]
]

/-- Partial product 368 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0368 : Poly :=
[
  term ((1693 : Rat) / 268) [(0, 2), (9, 2)],
  term ((1693 : Rat) / 268) [(1, 2), (9, 2)],
  term ((-1693 : Rat) / 268) [(9, 2), (10, 2)],
  term ((-1693 : Rat) / 268) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0368_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0368
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0369 : Poly :=
[
  term ((49 : Rat) / 67) [(9, 2), (10, 1)]
]

/-- Partial product 369 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0369 : Poly :=
[
  term ((49 : Rat) / 67) [(0, 2), (9, 2), (10, 1)],
  term ((49 : Rat) / 67) [(1, 2), (9, 2), (10, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 1), (11, 2)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0369_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0369
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0370 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 370 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0370 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0370_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0370
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0371 : Poly :=
[
  term ((11025602336 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0371 : Poly :=
[
  term ((11025602336 : Rat) / 18848747061) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((11025602336 : Rat) / 18848747061) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0371_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0371
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0372 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 372 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0372 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(0, 2), (9, 2), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 698101743) [(1, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0372_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0372
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0373 : Poly :=
[
  term ((344550073 : Rat) / 1396203486) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0373 : Poly :=
[
  term ((344550073 : Rat) / 1396203486) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 1396203486) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0373_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0373
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0374 : Poly :=
[
  term ((-50 : Rat) / 67) [(9, 2), (14, 1)]
]

/-- Partial product 374 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0374 : Poly :=
[
  term ((-50 : Rat) / 67) [(0, 2), (9, 2), (14, 1)],
  term ((-50 : Rat) / 67) [(1, 2), (9, 2), (14, 1)],
  term ((50 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((50 : Rat) / 67) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0374_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0374
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0375 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

/-- Partial product 375 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0375 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(0, 2), (9, 2), (15, 2)],
  term ((38452883834 : Rat) / 18848747061) [(1, 2), (9, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0375_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0375
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0376 : Poly :=
[
  term ((-19226441917 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0376 : Poly :=
[
  term ((-19226441917 : Rat) / 18848747061) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0376_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0376
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0377 : Poly :=
[
  term ((-355 : Rat) / 134) [(10, 1)]
]

/-- Partial product 377 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0377 : Poly :=
[
  term ((-355 : Rat) / 134) [(0, 2), (10, 1)],
  term ((-355 : Rat) / 134) [(1, 2), (10, 1)],
  term ((355 : Rat) / 134) [(10, 1), (11, 2)],
  term ((355 : Rat) / 134) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0377_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0377
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0378 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 378 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0378 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0378_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0378
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0379 : Poly :=
[
  term ((245820766226 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 379 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0379 : Poly :=
[
  term ((245820766226 : Rat) / 10471526145) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((245820766226 : Rat) / 10471526145) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-245820766226 : Rat) / 10471526145) [(10, 1), (11, 3), (13, 1)],
  term ((-245820766226 : Rat) / 10471526145) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0379_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0379
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0380 : Poly :=
[
  term ((-9748480 : Rat) / 110226591) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 380 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0380 : Poly :=
[
  term ((-9748480 : Rat) / 110226591) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-9748480 : Rat) / 110226591) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((9748480 : Rat) / 110226591) [(10, 3), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0380_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0380
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0381 : Poly :=
[
  term ((-4705270501004 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 381 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0381 : Poly :=
[
  term ((-4705270501004 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-4705270501004 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((4705270501004 : Rat) / 94243735305) [(10, 1), (11, 3), (15, 1)],
  term ((4705270501004 : Rat) / 94243735305) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0381_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0381
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0382 : Poly :=
[
  term ((5224419426688 : Rat) / 94243735305) [(10, 1), (11, 2)]
]

/-- Partial product 382 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0382 : Poly :=
[
  term ((5224419426688 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 2)],
  term ((5224419426688 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 2)],
  term ((-5224419426688 : Rat) / 94243735305) [(10, 1), (11, 4)],
  term ((-5224419426688 : Rat) / 94243735305) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0382_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0382
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0383 : Poly :=
[
  term ((-18 : Rat) / 67) [(10, 1), (12, 1)]
]

/-- Partial product 383 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0383 : Poly :=
[
  term ((-18 : Rat) / 67) [(0, 2), (10, 1), (12, 1)],
  term ((-18 : Rat) / 67) [(1, 2), (10, 1), (12, 1)],
  term ((18 : Rat) / 67) [(10, 1), (11, 2), (12, 1)],
  term ((18 : Rat) / 67) [(10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0383_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0383
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0384 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 384 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0384 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 3), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0384_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0384
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0385 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 385 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0385 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0385_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0385
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0386 : Poly :=
[
  term ((-456960 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 386 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0386 : Poly :=
[
  term ((-456960 : Rat) / 12247399) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(10, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0386_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0386
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0387 : Poly :=
[
  term ((39532480 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 387 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0387 : Poly :=
[
  term ((39532480 : Rat) / 110226591) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((39532480 : Rat) / 110226591) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-39532480 : Rat) / 110226591) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-39532480 : Rat) / 110226591) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0387_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0387
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0388 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 388 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0388 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(0, 2), (10, 1), (13, 2)],
  term ((456960 : Rat) / 12247399) [(1, 2), (10, 1), (13, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 2)],
  term ((-456960 : Rat) / 12247399) [(10, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0388_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0388
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0389 : Poly :=
[
  term ((6 : Rat) / 67) [(10, 1), (14, 1)]
]

/-- Partial product 389 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0389 : Poly :=
[
  term ((6 : Rat) / 67) [(0, 2), (10, 1), (14, 1)],
  term ((6 : Rat) / 67) [(1, 2), (10, 1), (14, 1)],
  term ((-6 : Rat) / 67) [(10, 1), (11, 2), (14, 1)],
  term ((-6 : Rat) / 67) [(10, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0389_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0389
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0390 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 390 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0390 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((8791040 : Rat) / 110226591) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-8791040 : Rat) / 110226591) [(10, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0390_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0390
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0391 : Poly :=
[
  term ((-367619182 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 391 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0391 : Poly :=
[
  term ((-367619182 : Rat) / 110226591) [(0, 2), (10, 1), (15, 2)],
  term ((-367619182 : Rat) / 110226591) [(1, 2), (10, 1), (15, 2)],
  term ((367619182 : Rat) / 110226591) [(10, 1), (11, 2), (15, 2)],
  term ((367619182 : Rat) / 110226591) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0391_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0391
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0392 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 392 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0392 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0392_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0392
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0393 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 393 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0393 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((4569600 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0393_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0393
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0394 : Poly :=
[
  term ((61798400 : Rat) / 36742197) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 394 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0394 : Poly :=
[
  term ((61798400 : Rat) / 36742197) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((61798400 : Rat) / 36742197) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-61798400 : Rat) / 36742197) [(11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0394_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0394
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0395 : Poly :=
[
  term ((-1174597120 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 395 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0395 : Poly :=
[
  term ((-1174597120 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1174597120 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((1174597120 : Rat) / 330679773) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((1174597120 : Rat) / 330679773) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0395_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0395
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0396 : Poly :=
[
  term ((-22740397915 : Rat) / 4188610458) [(11, 1), (13, 1)]
]

/-- Partial product 396 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0396 : Poly :=
[
  term ((-22740397915 : Rat) / 4188610458) [(0, 2), (11, 1), (13, 1)],
  term ((-22740397915 : Rat) / 4188610458) [(1, 2), (11, 1), (13, 1)],
  term ((22740397915 : Rat) / 4188610458) [(10, 2), (11, 1), (13, 1)],
  term ((22740397915 : Rat) / 4188610458) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0396_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0396
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0397 : Poly :=
[
  term ((67726400 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 397 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0397 : Poly :=
[
  term ((67726400 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((67726400 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-67726400 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-67726400 : Rat) / 36742197) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0397_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0397
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0398 : Poly :=
[
  term ((20157760 : Rat) / 36742197) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 398 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0398 : Poly :=
[
  term ((20157760 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((20157760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((-20157760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0398_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0398
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NNNYN_coefficient_02_0399 : Poly :=
[
  term ((130801600 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 399 for generator 2. -/
def rs_R009_ueqv_R009NNNYN_partial_02_0399 : Poly :=
[
  term ((130801600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((130801600 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-130801600 : Rat) / 110226591) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-130801600 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 2. -/
theorem rs_R009_ueqv_R009NNNYN_partial_02_0399_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_02_0399
        rs_R009_ueqv_R009NNNYN_generator_02_0300_0399 =
      rs_R009_ueqv_R009NNNYN_partial_02_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_02_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_02_0300,
  rs_R009_ueqv_R009NNNYN_partial_02_0301,
  rs_R009_ueqv_R009NNNYN_partial_02_0302,
  rs_R009_ueqv_R009NNNYN_partial_02_0303,
  rs_R009_ueqv_R009NNNYN_partial_02_0304,
  rs_R009_ueqv_R009NNNYN_partial_02_0305,
  rs_R009_ueqv_R009NNNYN_partial_02_0306,
  rs_R009_ueqv_R009NNNYN_partial_02_0307,
  rs_R009_ueqv_R009NNNYN_partial_02_0308,
  rs_R009_ueqv_R009NNNYN_partial_02_0309,
  rs_R009_ueqv_R009NNNYN_partial_02_0310,
  rs_R009_ueqv_R009NNNYN_partial_02_0311,
  rs_R009_ueqv_R009NNNYN_partial_02_0312,
  rs_R009_ueqv_R009NNNYN_partial_02_0313,
  rs_R009_ueqv_R009NNNYN_partial_02_0314,
  rs_R009_ueqv_R009NNNYN_partial_02_0315,
  rs_R009_ueqv_R009NNNYN_partial_02_0316,
  rs_R009_ueqv_R009NNNYN_partial_02_0317,
  rs_R009_ueqv_R009NNNYN_partial_02_0318,
  rs_R009_ueqv_R009NNNYN_partial_02_0319,
  rs_R009_ueqv_R009NNNYN_partial_02_0320,
  rs_R009_ueqv_R009NNNYN_partial_02_0321,
  rs_R009_ueqv_R009NNNYN_partial_02_0322,
  rs_R009_ueqv_R009NNNYN_partial_02_0323,
  rs_R009_ueqv_R009NNNYN_partial_02_0324,
  rs_R009_ueqv_R009NNNYN_partial_02_0325,
  rs_R009_ueqv_R009NNNYN_partial_02_0326,
  rs_R009_ueqv_R009NNNYN_partial_02_0327,
  rs_R009_ueqv_R009NNNYN_partial_02_0328,
  rs_R009_ueqv_R009NNNYN_partial_02_0329,
  rs_R009_ueqv_R009NNNYN_partial_02_0330,
  rs_R009_ueqv_R009NNNYN_partial_02_0331,
  rs_R009_ueqv_R009NNNYN_partial_02_0332,
  rs_R009_ueqv_R009NNNYN_partial_02_0333,
  rs_R009_ueqv_R009NNNYN_partial_02_0334,
  rs_R009_ueqv_R009NNNYN_partial_02_0335,
  rs_R009_ueqv_R009NNNYN_partial_02_0336,
  rs_R009_ueqv_R009NNNYN_partial_02_0337,
  rs_R009_ueqv_R009NNNYN_partial_02_0338,
  rs_R009_ueqv_R009NNNYN_partial_02_0339,
  rs_R009_ueqv_R009NNNYN_partial_02_0340,
  rs_R009_ueqv_R009NNNYN_partial_02_0341,
  rs_R009_ueqv_R009NNNYN_partial_02_0342,
  rs_R009_ueqv_R009NNNYN_partial_02_0343,
  rs_R009_ueqv_R009NNNYN_partial_02_0344,
  rs_R009_ueqv_R009NNNYN_partial_02_0345,
  rs_R009_ueqv_R009NNNYN_partial_02_0346,
  rs_R009_ueqv_R009NNNYN_partial_02_0347,
  rs_R009_ueqv_R009NNNYN_partial_02_0348,
  rs_R009_ueqv_R009NNNYN_partial_02_0349,
  rs_R009_ueqv_R009NNNYN_partial_02_0350,
  rs_R009_ueqv_R009NNNYN_partial_02_0351,
  rs_R009_ueqv_R009NNNYN_partial_02_0352,
  rs_R009_ueqv_R009NNNYN_partial_02_0353,
  rs_R009_ueqv_R009NNNYN_partial_02_0354,
  rs_R009_ueqv_R009NNNYN_partial_02_0355,
  rs_R009_ueqv_R009NNNYN_partial_02_0356,
  rs_R009_ueqv_R009NNNYN_partial_02_0357,
  rs_R009_ueqv_R009NNNYN_partial_02_0358,
  rs_R009_ueqv_R009NNNYN_partial_02_0359,
  rs_R009_ueqv_R009NNNYN_partial_02_0360,
  rs_R009_ueqv_R009NNNYN_partial_02_0361,
  rs_R009_ueqv_R009NNNYN_partial_02_0362,
  rs_R009_ueqv_R009NNNYN_partial_02_0363,
  rs_R009_ueqv_R009NNNYN_partial_02_0364,
  rs_R009_ueqv_R009NNNYN_partial_02_0365,
  rs_R009_ueqv_R009NNNYN_partial_02_0366,
  rs_R009_ueqv_R009NNNYN_partial_02_0367,
  rs_R009_ueqv_R009NNNYN_partial_02_0368,
  rs_R009_ueqv_R009NNNYN_partial_02_0369,
  rs_R009_ueqv_R009NNNYN_partial_02_0370,
  rs_R009_ueqv_R009NNNYN_partial_02_0371,
  rs_R009_ueqv_R009NNNYN_partial_02_0372,
  rs_R009_ueqv_R009NNNYN_partial_02_0373,
  rs_R009_ueqv_R009NNNYN_partial_02_0374,
  rs_R009_ueqv_R009NNNYN_partial_02_0375,
  rs_R009_ueqv_R009NNNYN_partial_02_0376,
  rs_R009_ueqv_R009NNNYN_partial_02_0377,
  rs_R009_ueqv_R009NNNYN_partial_02_0378,
  rs_R009_ueqv_R009NNNYN_partial_02_0379,
  rs_R009_ueqv_R009NNNYN_partial_02_0380,
  rs_R009_ueqv_R009NNNYN_partial_02_0381,
  rs_R009_ueqv_R009NNNYN_partial_02_0382,
  rs_R009_ueqv_R009NNNYN_partial_02_0383,
  rs_R009_ueqv_R009NNNYN_partial_02_0384,
  rs_R009_ueqv_R009NNNYN_partial_02_0385,
  rs_R009_ueqv_R009NNNYN_partial_02_0386,
  rs_R009_ueqv_R009NNNYN_partial_02_0387,
  rs_R009_ueqv_R009NNNYN_partial_02_0388,
  rs_R009_ueqv_R009NNNYN_partial_02_0389,
  rs_R009_ueqv_R009NNNYN_partial_02_0390,
  rs_R009_ueqv_R009NNNYN_partial_02_0391,
  rs_R009_ueqv_R009NNNYN_partial_02_0392,
  rs_R009_ueqv_R009NNNYN_partial_02_0393,
  rs_R009_ueqv_R009NNNYN_partial_02_0394,
  rs_R009_ueqv_R009NNNYN_partial_02_0395,
  rs_R009_ueqv_R009NNNYN_partial_02_0396,
  rs_R009_ueqv_R009NNNYN_partial_02_0397,
  rs_R009_ueqv_R009NNNYN_partial_02_0398,
  rs_R009_ueqv_R009NNNYN_partial_02_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_02_0300_0399 : Poly :=
[
  term ((-2056320 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 8266994325) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(0, 2), (7, 1), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((99172046811419 : Rat) / 1884874706100) [(0, 2), (7, 1), (15, 1)],
  term ((30318188881 : Rat) / 16533988650) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(0, 2), (7, 1), (15, 3)],
  term ((-632 : Rat) / 67) [(0, 2), (7, 2)],
  term ((3840714207232 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (11, 1)],
  term ((60011159488 : Rat) / 17452543575) [(0, 2), (7, 2), (9, 1), (13, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((198921520 : Rat) / 12247399) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(0, 2), (7, 2), (11, 2)],
  term ((-161932318884 : Rat) / 5817514525) [(0, 2), (7, 2), (13, 1), (15, 1)],
  term ((51397407663 : Rat) / 5817514525) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(0, 2), (7, 2), (14, 1)],
  term ((1047453296072 : Rat) / 17452543575) [(0, 2), (7, 2), (15, 2)],
  term ((-1197437289337 : Rat) / 52357630725) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(0, 2), (7, 3), (11, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(0, 2), (7, 3), (13, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(0, 2), (7, 3), (15, 1)],
  term ((-2997447793676 : Rat) / 94243735305) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 330679773) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-42527339099 : Rat) / 3490508715) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((609280 : Rat) / 12247399) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 330679773) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2477409840373 : Rat) / 94243735305) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((12941152933193 : Rat) / 942437353050) [(0, 2), (9, 1), (11, 1)],
  term ((22321175296 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-753383680 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((3046400 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((26351360 : Rat) / 36742197) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-270895190756 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((64409600 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9748480 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((-1889033360 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 201) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 110226591) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((348768364 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-11771620 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1034748008 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20040077666 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175820800 : Rat) / 110226591) [(0, 2), (9, 1), (12, 1), (15, 3)],
  term ((1112857740473 : Rat) / 139620348600) [(0, 2), (9, 1), (13, 1)],
  term ((-5227552904 : Rat) / 918554925) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5244160 : Rat) / 110226591) [(0, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456960 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((-455958760 : Rat) / 36742197) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((197071479088 : Rat) / 24800982975) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(0, 2), (9, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-19162581761753 : Rat) / 1884874706100) [(0, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((2811177440 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((1693 : Rat) / 268) [(0, 2), (9, 2)],
  term ((49 : Rat) / 67) [(0, 2), (9, 2), (10, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((11025602336 : Rat) / 18848747061) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(0, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 1396203486) [(0, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50 : Rat) / 67) [(0, 2), (9, 2), (14, 1)],
  term ((38452883834 : Rat) / 18848747061) [(0, 2), (9, 2), (15, 2)],
  term ((-19226441917 : Rat) / 18848747061) [(0, 2), (9, 2), (15, 2), (16, 1)],
  term ((-355 : Rat) / 134) [(0, 2), (10, 1)],
  term ((-97484800 : Rat) / 110226591) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((245820766226 : Rat) / 10471526145) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4705270501004 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 2)],
  term ((-18 : Rat) / 67) [(0, 2), (10, 1), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(0, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(0, 2), (10, 1), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((39532480 : Rat) / 110226591) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(0, 2), (10, 1), (13, 2)],
  term ((6 : Rat) / 67) [(0, 2), (10, 1), (14, 1)],
  term ((8791040 : Rat) / 110226591) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((-367619182 : Rat) / 110226591) [(0, 2), (10, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((61798400 : Rat) / 36742197) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1174597120 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-22740397915 : Rat) / 4188610458) [(0, 2), (11, 1), (13, 1)],
  term ((67726400 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((20157760 : Rat) / 36742197) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((130801600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2056320 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-894413216 : Rat) / 918554925) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 8266994325) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(1, 2), (7, 1), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((99172046811419 : Rat) / 1884874706100) [(1, 2), (7, 1), (15, 1)],
  term ((30318188881 : Rat) / 16533988650) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(1, 2), (7, 1), (15, 3)],
  term ((-632 : Rat) / 67) [(1, 2), (7, 2)],
  term ((3840714207232 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (11, 1)],
  term ((60011159488 : Rat) / 17452543575) [(1, 2), (7, 2), (9, 1), (13, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (15, 1)],
  term ((198921520 : Rat) / 12247399) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 52357630725) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(1, 2), (7, 2), (11, 2)],
  term ((-161932318884 : Rat) / 5817514525) [(1, 2), (7, 2), (13, 1), (15, 1)],
  term ((51397407663 : Rat) / 5817514525) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((196 : Rat) / 67) [(1, 2), (7, 2), (14, 1)],
  term ((1047453296072 : Rat) / 17452543575) [(1, 2), (7, 2), (15, 2)],
  term ((-1197437289337 : Rat) / 52357630725) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-2192956060288 : Rat) / 157072892175) [(1, 2), (7, 3), (11, 1)],
  term ((-34264938442 : Rat) / 5817514525) [(1, 2), (7, 3), (13, 1)],
  term ((2394874578674 : Rat) / 157072892175) [(1, 2), (7, 3), (15, 1)],
  term ((-2997447793676 : Rat) / 94243735305) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 330679773) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-42527339099 : Rat) / 3490508715) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((609280 : Rat) / 12247399) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 330679773) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((2477409840373 : Rat) / 94243735305) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((12941152933193 : Rat) / 942437353050) [(1, 2), (9, 1), (11, 1)],
  term ((22321175296 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-753383680 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((3046400 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((26351360 : Rat) / 36742197) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-270895190756 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((64409600 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9748480 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((-1889033360 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 201) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 2), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((348768364 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-11771620 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1034748008 : Rat) / 330679773) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20040077666 : Rat) / 330679773) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-175820800 : Rat) / 110226591) [(1, 2), (9, 1), (12, 1), (15, 3)],
  term ((1112857740473 : Rat) / 139620348600) [(1, 2), (9, 1), (13, 1)],
  term ((-5227552904 : Rat) / 918554925) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-5244160 : Rat) / 110226591) [(1, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456960 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-455958760 : Rat) / 36742197) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((197071479088 : Rat) / 24800982975) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(1, 2), (9, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-19162581761753 : Rat) / 1884874706100) [(1, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((2811177440 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((1693 : Rat) / 268) [(1, 2), (9, 2)],
  term ((49 : Rat) / 67) [(1, 2), (9, 2), (10, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(1, 2), (9, 2), (11, 1), (15, 1)],
  term ((11025602336 : Rat) / 18848747061) [(1, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(1, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 1396203486) [(1, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50 : Rat) / 67) [(1, 2), (9, 2), (14, 1)],
  term ((38452883834 : Rat) / 18848747061) [(1, 2), (9, 2), (15, 2)],
  term ((-19226441917 : Rat) / 18848747061) [(1, 2), (9, 2), (15, 2), (16, 1)],
  term ((-355 : Rat) / 134) [(1, 2), (10, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((245820766226 : Rat) / 10471526145) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-9748480 : Rat) / 110226591) [(1, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4705270501004 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 2)],
  term ((-18 : Rat) / 67) [(1, 2), (10, 1), (12, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 2), (10, 1), (12, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((39532480 : Rat) / 110226591) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((456960 : Rat) / 12247399) [(1, 2), (10, 1), (13, 2)],
  term ((6 : Rat) / 67) [(1, 2), (10, 1), (14, 1)],
  term ((8791040 : Rat) / 110226591) [(1, 2), (10, 1), (14, 1), (15, 2)],
  term ((-367619182 : Rat) / 110226591) [(1, 2), (10, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((61798400 : Rat) / 36742197) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1174597120 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-22740397915 : Rat) / 4188610458) [(1, 2), (11, 1), (13, 1)],
  term ((67726400 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((20157760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((130801600 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (10, 2), (13, 2), (15, 1)],
  term ((894413216 : Rat) / 918554925) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(7, 1), (10, 2), (14, 1), (15, 3)],
  term ((2967541600 : Rat) / 110226591) [(7, 1), (10, 2), (14, 2), (15, 1)],
  term ((-99172046811419 : Rat) / 1884874706100) [(7, 1), (10, 2), (15, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (10, 2), (15, 3)],
  term ((2056320 : Rat) / 12247399) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((894413216 : Rat) / 918554925) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 8266994325) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(7, 1), (11, 2), (14, 1), (15, 3)],
  term ((2967541600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-99172046811419 : Rat) / 1884874706100) [(7, 1), (11, 2), (15, 1)],
  term ((-30318188881 : Rat) / 16533988650) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((5769928000 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 3)],
  term ((632 : Rat) / 67) [(7, 2), (10, 2)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (10, 2), (11, 2)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (10, 2), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (10, 2), (15, 2)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((632 : Rat) / 67) [(7, 2), (11, 2)],
  term ((161932318884 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-196 : Rat) / 67) [(7, 2), (11, 2), (14, 1)],
  term ((-1047453296072 : Rat) / 17452543575) [(7, 2), (11, 2), (15, 2)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 3), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (11, 3), (15, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (11, 4)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (10, 2), (11, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (10, 2), (13, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (10, 2), (15, 1)],
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (11, 2), (13, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (11, 2), (15, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (11, 3)],
  term ((42527339099 : Rat) / 3490508715) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 1), (11, 2), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2477409840373 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2997447793676 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 3)],
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 1), (11, 3), (14, 1)],
  term ((-12941152933193 : Rat) / 942437353050) [(9, 1), (10, 2), (11, 1)],
  term ((-22321175296 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((753383680 : Rat) / 330679773) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-3046400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26351360 : Rat) / 36742197) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((270895190756 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-64409600 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((1889033360 : Rat) / 110226591) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((1160 : Rat) / 201) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-348768364 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((11771620 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (10, 2), (12, 1), (13, 1), (15, 2)],
  term ((-1034748008 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((20040077666 : Rat) / 330679773) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (10, 2), (12, 1), (15, 3)],
  term ((-1112857740473 : Rat) / 139620348600) [(9, 1), (10, 2), (13, 1)],
  term ((5227552904 : Rat) / 918554925) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(9, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((455958760 : Rat) / 36742197) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (14, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (10, 2), (13, 2), (15, 1)],
  term ((-197071479088 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (10, 2), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((19162581761753 : Rat) / 1884874706100) [(9, 1), (10, 2), (15, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2811177440 : Rat) / 110226591) [(9, 1), (10, 2), (15, 3)],
  term ((2997447793676 : Rat) / 94243735305) [(9, 1), (10, 3), (11, 1)],
  term ((-38993920 : Rat) / 330679773) [(9, 1), (10, 3), (11, 1), (14, 1)],
  term ((42527339099 : Rat) / 3490508715) [(9, 1), (10, 3), (13, 1)],
  term ((-609280 : Rat) / 12247399) [(9, 1), (10, 3), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 330679773) [(9, 1), (10, 3), (14, 1), (15, 1)],
  term ((-2477409840373 : Rat) / 94243735305) [(9, 1), (10, 3), (15, 1)],
  term ((-348768364 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((11771620 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(9, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-1034748008 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((20040077666 : Rat) / 330679773) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-63 : Rat) / 134) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((175820800 : Rat) / 110226591) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1112857740473 : Rat) / 139620348600) [(9, 1), (11, 2), (13, 1)],
  term ((5227552904 : Rat) / 918554925) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(9, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-456960 : Rat) / 12247399) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((455958760 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-197071479088 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 24800982975) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((19162581761753 : Rat) / 1884874706100) [(9, 1), (11, 2), (15, 1)],
  term ((30318188881 : Rat) / 49601965950) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2811177440 : Rat) / 110226591) [(9, 1), (11, 2), (15, 3)],
  term ((-12941152933193 : Rat) / 942437353050) [(9, 1), (11, 3)],
  term ((-22321175296 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1)],
  term ((753383680 : Rat) / 330679773) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-3046400 : Rat) / 110226591) [(9, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-26351360 : Rat) / 36742197) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((270895190756 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1)],
  term ((-64409600 : Rat) / 110226591) [(9, 1), (11, 3), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 24800982975) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((-9748480 : Rat) / 110226591) [(9, 1), (11, 3), (14, 2)],
  term ((1889033360 : Rat) / 110226591) [(9, 1), (11, 3), (15, 2)],
  term ((1160 : Rat) / 201) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(9, 1), (11, 3), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(9, 1), (11, 4), (14, 1), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(9, 1), (11, 4), (15, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 1), (11, 2)],
  term ((-1693 : Rat) / 268) [(9, 2), (10, 2)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (10, 2), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((50 : Rat) / 67) [(9, 2), (10, 2), (14, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-49 : Rat) / 67) [(9, 2), (10, 3)],
  term ((-1693 : Rat) / 268) [(9, 2), (11, 2)],
  term ((344550073 : Rat) / 698101743) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 1396203486) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((50 : Rat) / 67) [(9, 2), (11, 2), (14, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2)],
  term ((19226441917 : Rat) / 18848747061) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((355 : Rat) / 134) [(10, 1), (11, 2)],
  term ((18 : Rat) / 67) [(10, 1), (11, 2), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-39532480 : Rat) / 110226591) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 1), (11, 2), (13, 2)],
  term ((-6 : Rat) / 67) [(10, 1), (11, 2), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((367619182 : Rat) / 110226591) [(10, 1), (11, 2), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-245820766226 : Rat) / 10471526145) [(10, 1), (11, 3), (13, 1)],
  term ((9748480 : Rat) / 110226591) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((4705270501004 : Rat) / 94243735305) [(10, 1), (11, 3), (15, 1)],
  term ((-5224419426688 : Rat) / 94243735305) [(10, 1), (11, 4)],
  term ((-3655680 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1174597120 : Rat) / 330679773) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((22740397915 : Rat) / 4188610458) [(10, 2), (11, 1), (13, 1)],
  term ((-67726400 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(10, 2), (11, 1), (13, 1), (14, 2)],
  term ((-130801600 : Rat) / 110226591) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((355 : Rat) / 134) [(10, 3)],
  term ((97484800 : Rat) / 110226591) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((-245820766226 : Rat) / 10471526145) [(10, 3), (11, 1), (13, 1)],
  term ((9748480 : Rat) / 110226591) [(10, 3), (11, 1), (14, 1), (15, 1)],
  term ((4705270501004 : Rat) / 94243735305) [(10, 3), (11, 1), (15, 1)],
  term ((-5224419426688 : Rat) / 94243735305) [(10, 3), (11, 2)],
  term ((18 : Rat) / 67) [(10, 3), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(10, 3), (12, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(10, 3), (12, 1), (15, 2)],
  term ((456960 : Rat) / 12247399) [(10, 3), (13, 1), (14, 1), (15, 1)],
  term ((-39532480 : Rat) / 110226591) [(10, 3), (13, 1), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(10, 3), (13, 2)],
  term ((-6 : Rat) / 67) [(10, 3), (14, 1)],
  term ((-8791040 : Rat) / 110226591) [(10, 3), (14, 1), (15, 2)],
  term ((367619182 : Rat) / 110226591) [(10, 3), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(11, 3), (12, 1), (13, 1), (14, 1)],
  term ((-61798400 : Rat) / 36742197) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((1174597120 : Rat) / 330679773) [(11, 3), (12, 1), (15, 1)],
  term ((22740397915 : Rat) / 4188610458) [(11, 3), (13, 1)],
  term ((-67726400 : Rat) / 36742197) [(11, 3), (13, 1), (14, 1)],
  term ((-20157760 : Rat) / 36742197) [(11, 3), (13, 1), (14, 2)],
  term ((-130801600 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NNNYN_block_02_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_02_0300_0399
      rs_R009_ueqv_R009NNNYN_block_02_0300_0399 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
