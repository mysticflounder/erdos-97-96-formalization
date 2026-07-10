/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0300 : Poly :=
[
  term ((-390066955068980992 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0300 : Poly :=
[
  term ((-780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0300_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0300
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0301 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0301 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0301_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0301
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0302 : Poly :=
[
  term ((-12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0302 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (12, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0302_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0302
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0303 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 303 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0303 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (12, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0303_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0303
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0304 : Poly :=
[
  term (-4 : Rat) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0304 : Poly :=
[
  term (-8 : Rat) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0304_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0304
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0305 : Poly :=
[
  term (8 : Rat) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0305 : Poly :=
[
  term (16 : Rat) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0305_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0305
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0306 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 306 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0306 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0306_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0306
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0307 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0307 : Poly :=
[
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0307_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0307
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0308 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0308 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0308_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0308
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0309 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0309 : Poly :=
[
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0309_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0309
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0310 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0310 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0310_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0310
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0311 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0311 : Poly :=
[
  term ((262473904242278400 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0311_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0311
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0312 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0312 : Poly :=
[
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0312_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0312
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0313 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 313 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0313 : Poly :=
[
  term ((-12632040155946803200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0313_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0313
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0314 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0314 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0314_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0314
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0315 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0315 : Poly :=
[
  term ((8405931269691146240 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0315_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0315
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0316 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 316 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0316 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0316_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0316
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0317 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0317 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0317_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0317
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0318 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0318 : Poly :=
[
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0318_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0318
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0319 : Poly :=
[
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0319 : Poly :=
[
  term ((-62649590428668723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0319_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0319
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0320 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 320 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0320 : Poly :=
[
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0320_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0320
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0321 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 321 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0321 : Poly :=
[
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0321_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0321
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0322 : Poly :=
[
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0322 : Poly :=
[
  term ((-504063624782233600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0322_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0322
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0323 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 323 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0323 : Poly :=
[
  term ((-6947622085770741760 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0323_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0323
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0324 : Poly :=
[
  term ((3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0324 : Poly :=
[
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0324_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0324
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0325 : Poly :=
[
  term ((-6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 325 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0325 : Poly :=
[
  term ((-13918380046314455040 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0325_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0325
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0326 : Poly :=
[
  term ((253737326913280000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 326 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0326 : Poly :=
[
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0326_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0326
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0327 : Poly :=
[
  term ((-507474653826560000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0327 : Poly :=
[
  term ((-1014949307653120000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0327_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0327
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0328 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0328 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0328_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0328
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0329 : Poly :=
[
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0329 : Poly :=
[
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0329_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0329
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0330 : Poly :=
[
  term ((-12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0330 : Poly :=
[
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0330_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0330
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0331 : Poly :=
[
  term ((25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 331 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0331 : Poly :=
[
  term ((50830188964601446400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0331_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0331
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0332 : Poly :=
[
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 332 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0332 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0332_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0332
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0333 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0333 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0333_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0333
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0334 : Poly :=
[
  term ((-4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 334 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0334 : Poly :=
[
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0334_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0334
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0335 : Poly :=
[
  term ((2887294661323520 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 335 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0335 : Poly :=
[
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0335_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0335
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0336 : Poly :=
[
  term ((-5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0336 : Poly :=
[
  term ((-11549178645294080 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0336_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0336
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0337 : Poly :=
[
  term ((9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 337 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0337 : Poly :=
[
  term ((18316458226122864640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0337_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0337
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0338 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 338 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0338 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0338_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0338
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0339 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0339 : Poly :=
[
  term ((-4750053127536640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0339_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0339
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0340 : Poly :=
[
  term ((-2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0340 : Poly :=
[
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0340_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0340
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0341 : Poly :=
[
  term ((4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0341 : Poly :=
[
  term ((9803721998910723821312 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0341_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0341
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0342 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0342 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0342_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0342
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0343 : Poly :=
[
  term ((-508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 343 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0343 : Poly :=
[
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0343_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0343
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0344 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 344 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0344 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0344_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0344
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0345 : Poly :=
[
  term ((5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 345 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0345 : Poly :=
[
  term ((11485821038031011840 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0345_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0345
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0346 : Poly :=
[
  term ((-183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 346 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0346 : Poly :=
[
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0346_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0346
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0347 : Poly :=
[
  term ((366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0347 : Poly :=
[
  term ((733041936520499737568 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0347_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0347
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0348 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0348 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0348_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0348
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0349 : Poly :=
[
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0349 : Poly :=
[
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0349_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0349
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0350 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 350 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0350 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0350_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0350
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0351 : Poly :=
[
  term ((-593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0351 : Poly :=
[
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0351_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0351
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0352 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 352 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0352 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0352_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0352
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0353 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0353 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0353_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0353
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0354 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0354 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0354_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0354
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0355 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 355 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0355 : Poly :=
[
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0355_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0355
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0356 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0356 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0356_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0356
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0357 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 357 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0357 : Poly :=
[
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0357_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0357
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0358 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 358 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0358 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0358_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0358
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0359 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0359 : Poly :=
[
  term ((16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0359_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0359
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0360 : Poly :=
[
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 360 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0360 : Poly :=
[
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0360_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0360
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0361 : Poly :=
[
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0361 : Poly :=
[
  term ((-6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0361_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0361
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0362 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0362 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0362_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0362
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0363 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 363 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0363 : Poly :=
[
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0363_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0363
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0364 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0364 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0364_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0364
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0365 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 365 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0365 : Poly :=
[
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0365_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0365
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0366 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0366 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0366_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0366
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0367 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 367 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0367 : Poly :=
[
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0367_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0367
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0368 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 368 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0368 : Poly :=
[
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0368_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0368
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0369 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0369 : Poly :=
[
  term ((-30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0369_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0369
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0370 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0370 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0370_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0370
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0371 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0371 : Poly :=
[
  term ((37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0371_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0371
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0372 : Poly :=
[
  term (4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 372 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0372 : Poly :=
[
  term (8 : Rat) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0372_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0372
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0373 : Poly :=
[
  term (-8 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 373 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0373 : Poly :=
[
  term (-16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0373_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0373
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0374 : Poly :=
[
  term (4 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 374 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0374 : Poly :=
[
  term (-4 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0374_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0374
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0375 : Poly :=
[
  term (-8 : Rat) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0375 : Poly :=
[
  term (-16 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0375_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0375
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0376 : Poly :=
[
  term (-2 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

/-- Partial product 376 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0376 : Poly :=
[
  term (-4 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0376_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0376
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0377 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 377 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0377 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0377_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0377
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0378 : Poly :=
[
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 378 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0378 : Poly :=
[
  term ((6803910212203057664 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0378_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0378
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0379 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 379 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0379 : Poly :=
[
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0379_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0379
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0380 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 380 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0380 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0380_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0380
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0381 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0381 : Poly :=
[
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0381_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0381
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0382 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0382 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0382_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0382
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0383 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0383 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0383_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0383
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0384 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0384 : Poly :=
[
  term ((-262473904242278400 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0384_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0384
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0385 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0385 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0385_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0385
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0386 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0386 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0386_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0386
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0387 : Poly :=
[
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 387 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0387 : Poly :=
[
  term ((12632040155946803200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0387_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0387
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0388 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0388 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0388_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0388
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0389 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0389 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0389_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0389
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0390 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0390 : Poly :=
[
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0390_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0390
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0391 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0391 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0391_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0391
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0392 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 392 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0392 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0392_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0392
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0393 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 393 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0393 : Poly :=
[
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0393_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0393
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0394 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 394 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0394 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0394_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0394
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0395 : Poly :=
[
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 395 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0395 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0395_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0395
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0396 : Poly :=
[
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 396 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0396 : Poly :=
[
  term ((62649590428668723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0396_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0396
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0397 : Poly :=
[
  term ((7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 397 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0397 : Poly :=
[
  term ((15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0397_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0397
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0398 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 398 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0398 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0398_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0398
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_0399 : Poly :=
[
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 399 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_0399 : Poly :=
[
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_0399_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_0399
        rs_R010_ueqv_R010YNN_generator_25_0300_0399 =
      rs_R010_ueqv_R010YNN_partial_25_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_0300,
  rs_R010_ueqv_R010YNN_partial_25_0301,
  rs_R010_ueqv_R010YNN_partial_25_0302,
  rs_R010_ueqv_R010YNN_partial_25_0303,
  rs_R010_ueqv_R010YNN_partial_25_0304,
  rs_R010_ueqv_R010YNN_partial_25_0305,
  rs_R010_ueqv_R010YNN_partial_25_0306,
  rs_R010_ueqv_R010YNN_partial_25_0307,
  rs_R010_ueqv_R010YNN_partial_25_0308,
  rs_R010_ueqv_R010YNN_partial_25_0309,
  rs_R010_ueqv_R010YNN_partial_25_0310,
  rs_R010_ueqv_R010YNN_partial_25_0311,
  rs_R010_ueqv_R010YNN_partial_25_0312,
  rs_R010_ueqv_R010YNN_partial_25_0313,
  rs_R010_ueqv_R010YNN_partial_25_0314,
  rs_R010_ueqv_R010YNN_partial_25_0315,
  rs_R010_ueqv_R010YNN_partial_25_0316,
  rs_R010_ueqv_R010YNN_partial_25_0317,
  rs_R010_ueqv_R010YNN_partial_25_0318,
  rs_R010_ueqv_R010YNN_partial_25_0319,
  rs_R010_ueqv_R010YNN_partial_25_0320,
  rs_R010_ueqv_R010YNN_partial_25_0321,
  rs_R010_ueqv_R010YNN_partial_25_0322,
  rs_R010_ueqv_R010YNN_partial_25_0323,
  rs_R010_ueqv_R010YNN_partial_25_0324,
  rs_R010_ueqv_R010YNN_partial_25_0325,
  rs_R010_ueqv_R010YNN_partial_25_0326,
  rs_R010_ueqv_R010YNN_partial_25_0327,
  rs_R010_ueqv_R010YNN_partial_25_0328,
  rs_R010_ueqv_R010YNN_partial_25_0329,
  rs_R010_ueqv_R010YNN_partial_25_0330,
  rs_R010_ueqv_R010YNN_partial_25_0331,
  rs_R010_ueqv_R010YNN_partial_25_0332,
  rs_R010_ueqv_R010YNN_partial_25_0333,
  rs_R010_ueqv_R010YNN_partial_25_0334,
  rs_R010_ueqv_R010YNN_partial_25_0335,
  rs_R010_ueqv_R010YNN_partial_25_0336,
  rs_R010_ueqv_R010YNN_partial_25_0337,
  rs_R010_ueqv_R010YNN_partial_25_0338,
  rs_R010_ueqv_R010YNN_partial_25_0339,
  rs_R010_ueqv_R010YNN_partial_25_0340,
  rs_R010_ueqv_R010YNN_partial_25_0341,
  rs_R010_ueqv_R010YNN_partial_25_0342,
  rs_R010_ueqv_R010YNN_partial_25_0343,
  rs_R010_ueqv_R010YNN_partial_25_0344,
  rs_R010_ueqv_R010YNN_partial_25_0345,
  rs_R010_ueqv_R010YNN_partial_25_0346,
  rs_R010_ueqv_R010YNN_partial_25_0347,
  rs_R010_ueqv_R010YNN_partial_25_0348,
  rs_R010_ueqv_R010YNN_partial_25_0349,
  rs_R010_ueqv_R010YNN_partial_25_0350,
  rs_R010_ueqv_R010YNN_partial_25_0351,
  rs_R010_ueqv_R010YNN_partial_25_0352,
  rs_R010_ueqv_R010YNN_partial_25_0353,
  rs_R010_ueqv_R010YNN_partial_25_0354,
  rs_R010_ueqv_R010YNN_partial_25_0355,
  rs_R010_ueqv_R010YNN_partial_25_0356,
  rs_R010_ueqv_R010YNN_partial_25_0357,
  rs_R010_ueqv_R010YNN_partial_25_0358,
  rs_R010_ueqv_R010YNN_partial_25_0359,
  rs_R010_ueqv_R010YNN_partial_25_0360,
  rs_R010_ueqv_R010YNN_partial_25_0361,
  rs_R010_ueqv_R010YNN_partial_25_0362,
  rs_R010_ueqv_R010YNN_partial_25_0363,
  rs_R010_ueqv_R010YNN_partial_25_0364,
  rs_R010_ueqv_R010YNN_partial_25_0365,
  rs_R010_ueqv_R010YNN_partial_25_0366,
  rs_R010_ueqv_R010YNN_partial_25_0367,
  rs_R010_ueqv_R010YNN_partial_25_0368,
  rs_R010_ueqv_R010YNN_partial_25_0369,
  rs_R010_ueqv_R010YNN_partial_25_0370,
  rs_R010_ueqv_R010YNN_partial_25_0371,
  rs_R010_ueqv_R010YNN_partial_25_0372,
  rs_R010_ueqv_R010YNN_partial_25_0373,
  rs_R010_ueqv_R010YNN_partial_25_0374,
  rs_R010_ueqv_R010YNN_partial_25_0375,
  rs_R010_ueqv_R010YNN_partial_25_0376,
  rs_R010_ueqv_R010YNN_partial_25_0377,
  rs_R010_ueqv_R010YNN_partial_25_0378,
  rs_R010_ueqv_R010YNN_partial_25_0379,
  rs_R010_ueqv_R010YNN_partial_25_0380,
  rs_R010_ueqv_R010YNN_partial_25_0381,
  rs_R010_ueqv_R010YNN_partial_25_0382,
  rs_R010_ueqv_R010YNN_partial_25_0383,
  rs_R010_ueqv_R010YNN_partial_25_0384,
  rs_R010_ueqv_R010YNN_partial_25_0385,
  rs_R010_ueqv_R010YNN_partial_25_0386,
  rs_R010_ueqv_R010YNN_partial_25_0387,
  rs_R010_ueqv_R010YNN_partial_25_0388,
  rs_R010_ueqv_R010YNN_partial_25_0389,
  rs_R010_ueqv_R010YNN_partial_25_0390,
  rs_R010_ueqv_R010YNN_partial_25_0391,
  rs_R010_ueqv_R010YNN_partial_25_0392,
  rs_R010_ueqv_R010YNN_partial_25_0393,
  rs_R010_ueqv_R010YNN_partial_25_0394,
  rs_R010_ueqv_R010YNN_partial_25_0395,
  rs_R010_ueqv_R010YNN_partial_25_0396,
  rs_R010_ueqv_R010YNN_partial_25_0397,
  rs_R010_ueqv_R010YNN_partial_25_0398,
  rs_R010_ueqv_R010YNN_partial_25_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_0300_0399 : Poly :=
[
  term ((-780133910137961984 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((390066955068980992 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (12, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (12, 1), (16, 1)],
  term ((12737063581736174608 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (12, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6803910212203057664 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1510503657512214939328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((377625914378053734832 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((262473904242278400 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((65618476060569600 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12632040155946803200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8405931269691146240 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62649590428668723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15662397607167180800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-504063624782233600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6947622085770741760 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-126015906195558400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((252031812391116800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13918380046314455040 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-3479595011578613760 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((6959190023157227520 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1014949307653120000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-253737326913280000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((507474653826560000 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7266678841031601094784 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50830188964601446400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((12707547241150361600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25415094482300723200 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11549178645294080 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((18316458226122864640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((4579114556530716160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2887294661323520 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((5774589322647040 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-9158229113061432320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9803721998910723821312 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((2450930499727680955328 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4901860999455361910656 : Rat) / 449152207880882925) [(1, 1), (2, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1016830741658009600 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11485821038031011840 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 1), (9, 4), (15, 2), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((733041936520499737568 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((183260484130124934392 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-366520968260249868784 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13733191957294222900256 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1187929604337090560 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-83224183161418754048 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(1, 1), (2, 1), (5, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (13, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (15, 2), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (13, 1), (16, 1)],
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (4, 1), (12, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (4, 1), (12, 2), (16, 1)],
  term (8 : Rat) [(1, 1), (3, 1), (4, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (3, 1), (4, 1), (16, 1)],
  term ((6803910212203057664 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((12632040155946803200 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-3401955106101528832 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((62649590428668723200 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-31324795214334361600 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7831198803583590400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((126015906195558400 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-252031812391116800 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 399. -/
theorem rs_R010_ueqv_R010YNN_block_25_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_0300_0399
      rs_R010_ueqv_R010YNN_block_25_0300_0399 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
