/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 10:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_10_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0200 : Poly :=
[
  term ((-863714323825459526366 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0200 : Poly :=
[
  term ((-1727428647650919052732 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((863714323825459526366 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0200_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0200
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0201 : Poly :=
[
  term ((-64964900237184640 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 201 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0201 : Poly :=
[
  term ((-129929800474369280 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0201_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0201
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0202 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 202 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0202 : Poly :=
[
  term ((-37122800135534080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0202_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0202
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0203 : Poly :=
[
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 203 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0203 : Poly :=
[
  term ((4084947824446715776 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0203_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0203
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0204 : Poly :=
[
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 204 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0204 : Poly :=
[
  term ((-10955545468596454528 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0204_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0204
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0205 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0205 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0205_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0205
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0206 : Poly :=
[
  term ((9109666273165623616 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 206 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0206 : Poly :=
[
  term ((18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0206_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0206
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0207 : Poly :=
[
  term ((56657962475641339648 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0207 : Poly :=
[
  term ((113315924951282679296 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0207_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0207
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0208 : Poly :=
[
  term ((2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 208 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0208 : Poly :=
[
  term ((5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0208_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0208
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0209 : Poly :=
[
  term ((-1027701016310259040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 209 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0209 : Poly :=
[
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0209_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0209
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0210 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0210 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0210_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0210
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0211 : Poly :=
[
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0211 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0211_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0211
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0212 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0212 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0212_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0212
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0213 : Poly :=
[
  term ((-499908810423280896 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 213 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0213 : Poly :=
[
  term ((-999817620846561792 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((499908810423280896 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0213_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0213
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0214 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 214 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0214 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0214_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0214
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0215 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0215 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0215_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0215
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0216 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 216 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0216 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0216_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0216
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0217 : Poly :=
[
  term ((-231295728469506371144 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0217 : Poly :=
[
  term ((-462591456939012742288 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((231295728469506371144 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0217_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0217
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0218 : Poly :=
[
  term ((-3447953533616398400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 218 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0218 : Poly :=
[
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0218_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0218
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0219 : Poly :=
[
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 219 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0219 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0219_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0219
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0220 : Poly :=
[
  term ((1499838585870571520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0220 : Poly :=
[
  term ((2999677171741143040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1499838585870571520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0220_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0220
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0221 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0221 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0221_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0221
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0222 : Poly :=
[
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0222 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0222_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0222
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0223 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0223 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0223_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0223
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0224 : Poly :=
[
  term ((-4734839686258701184 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 224 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0224 : Poly :=
[
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((4734839686258701184 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0224_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0224
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0225 : Poly :=
[
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0225 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0225_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0225
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0226 : Poly :=
[
  term ((193637179697847607808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0226 : Poly :=
[
  term ((387274359395695215616 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-193637179697847607808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0226_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0226
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0227 : Poly :=
[
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 227 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0227 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0227_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0227
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0228 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0228 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0228_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0228
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0229 : Poly :=
[
  term ((948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 229 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0229 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0229_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0229
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0230 : Poly :=
[
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0230 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0230_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0230
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0231 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0231 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0231_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0231
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0232 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 232 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0232 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0232_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0232
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0233 : Poly :=
[
  term ((-6056116470334974208 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0233 : Poly :=
[
  term ((-12112232940669948416 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((6056116470334974208 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0233_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0233
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0234 : Poly :=
[
  term (2 : Rat) [(4, 1), (16, 1)]
]

/-- Partial product 234 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0234 : Poly :=
[
  term (4 : Rat) [(2, 1), (4, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0234_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0234
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0235 : Poly :=
[
  term ((-6346883630080000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 235 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0235 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0235_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0235
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0236 : Poly :=
[
  term ((-31346233214680373128 : Rat) / 269491324728529755) [(4, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 236 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0236 : Poly :=
[
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0236_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0236
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0237 : Poly :=
[
  term ((285761802735610880 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 237 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0237 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0237_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0237
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0238 : Poly :=
[
  term ((-540046735322931200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 238 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0238 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0238_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0238
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0239 : Poly :=
[
  term ((-6452166422020122004 : Rat) / 269491324728529755) [(4, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 239 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0239 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0239_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0239
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0240 : Poly :=
[
  term ((-736193698575668608 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 240 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0240 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0240_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0240
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0241 : Poly :=
[
  term ((-925745491604164352 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 241 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0241 : Poly :=
[
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0241_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0241
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0242 : Poly :=
[
  term (-1 : Rat) [(4, 2), (16, 1)]
]

/-- Partial product 242 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0242 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 2), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0242_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0242
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0243 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0243 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0243_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0243
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0244 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0244 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0244_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0244
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0245 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0245 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0245_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0245
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0246 : Poly :=
[
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0246 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0246_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0246
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0247 : Poly :=
[
  term ((41650959356594560 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 247 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0247 : Poly :=
[
  term ((83301918713189120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-41650959356594560 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0247_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0247
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0248 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0248 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0248_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0248
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0249 : Poly :=
[
  term ((-83301918713189120 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 249 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0249 : Poly :=
[
  term ((-166603837426378240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((83301918713189120 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0249_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0249
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0250 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0250 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0250_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0250
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0251 : Poly :=
[
  term ((227026159796208640 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0251 : Poly :=
[
  term ((454052319592417280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-227026159796208640 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0251_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0251
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0252 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 252 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0252 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0252_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0252
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0253 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0253 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0253_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0253
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0254 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 254 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0254 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0254_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0254
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0255 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0255 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0255_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0255
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0256 : Poly :=
[
  term ((-145100070275572688 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0256 : Poly :=
[
  term ((-290200140551145376 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0256_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0256
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0257 : Poly :=
[
  term ((72550035137786344 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 257 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0257 : Poly :=
[
  term ((145100070275572688 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0257_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0257
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0258 : Poly :=
[
  term ((606001144449815456 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0258 : Poly :=
[
  term ((1212002288899630912 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-606001144449815456 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0258_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0258
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0259 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0259 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0259_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0259
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0260 : Poly :=
[
  term ((95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 260 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0260 : Poly :=
[
  term ((191473380494950400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0260_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0260
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0261 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0261 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0261_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0261
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0262 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0262 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0262_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0262
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0263 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0263 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0263_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0263
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0264 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0264 : Poly :=
[
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0264_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0264
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0265 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 265 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0265 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0265_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0265
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0266 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0266 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0266_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0266
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0267 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 267 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0267 : Poly :=
[
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0267_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0267
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0268 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0268 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0268_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0268
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0269 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0269 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0269_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0269
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0270 : Poly :=
[
  term ((-272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 270 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0270 : Poly :=
[
  term ((-545357204886808984 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0270_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0270
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0271 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0271 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0271_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0271
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0272 : Poly :=
[
  term ((82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0272 : Poly :=
[
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0272_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0272
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0273 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 273 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0273 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0273_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0273
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0274 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0274 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0274_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0274
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0275 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 275 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0275 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0275_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0275
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0276 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 276 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0276 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0276_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0276
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0277 : Poly :=
[
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 277 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0277 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0277_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0277
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0278 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0278 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0278_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0278
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0279 : Poly :=
[
  term ((-20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 279 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0279 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0279_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0279
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0280 : Poly :=
[
  term ((47203239297256716854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 280 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0280 : Poly :=
[
  term ((94406478594513433708 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0280_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0280
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0281 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 281 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0281 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0281_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0281
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0282 : Poly :=
[
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 282 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0282 : Poly :=
[
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0282_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0282
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0283 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 283 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0283 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0283_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0283
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0284 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 284 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0284 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0284_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0284
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0285 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0285 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0285_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0285
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0286 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0286 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0286_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0286
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0287 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 287 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0287 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0287_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0287
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0288 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 288 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0288 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0288_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0288
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0289 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0289 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0289_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0289
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0290 : Poly :=
[
  term ((-394751254873337600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0290 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((394751254873337600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0290_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0290
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0291 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 291 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0291 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0291_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0291
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0292 : Poly :=
[
  term ((8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 292 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0292 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0292_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0292
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0293 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 293 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0293 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0293_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0293
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0294 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 294 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0294 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0294_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0294
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0295 : Poly :=
[
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 295 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0295 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0295_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0295
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0296 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

/-- Partial product 296 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0296 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0296_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0296
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0297 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0297 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0297_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0297
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0298 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0298 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0298_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0298
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YNN_coefficient_10_0299 : Poly :=
[
  term ((262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 299 for generator 10. -/
def rs_R010_ueqv_R010YNN_partial_10_0299 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 10. -/
theorem rs_R010_ueqv_R010YNN_partial_10_0299_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_10_0299
        rs_R010_ueqv_R010YNN_generator_10_0200_0299 =
      rs_R010_ueqv_R010YNN_partial_10_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_10_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_10_0200,
  rs_R010_ueqv_R010YNN_partial_10_0201,
  rs_R010_ueqv_R010YNN_partial_10_0202,
  rs_R010_ueqv_R010YNN_partial_10_0203,
  rs_R010_ueqv_R010YNN_partial_10_0204,
  rs_R010_ueqv_R010YNN_partial_10_0205,
  rs_R010_ueqv_R010YNN_partial_10_0206,
  rs_R010_ueqv_R010YNN_partial_10_0207,
  rs_R010_ueqv_R010YNN_partial_10_0208,
  rs_R010_ueqv_R010YNN_partial_10_0209,
  rs_R010_ueqv_R010YNN_partial_10_0210,
  rs_R010_ueqv_R010YNN_partial_10_0211,
  rs_R010_ueqv_R010YNN_partial_10_0212,
  rs_R010_ueqv_R010YNN_partial_10_0213,
  rs_R010_ueqv_R010YNN_partial_10_0214,
  rs_R010_ueqv_R010YNN_partial_10_0215,
  rs_R010_ueqv_R010YNN_partial_10_0216,
  rs_R010_ueqv_R010YNN_partial_10_0217,
  rs_R010_ueqv_R010YNN_partial_10_0218,
  rs_R010_ueqv_R010YNN_partial_10_0219,
  rs_R010_ueqv_R010YNN_partial_10_0220,
  rs_R010_ueqv_R010YNN_partial_10_0221,
  rs_R010_ueqv_R010YNN_partial_10_0222,
  rs_R010_ueqv_R010YNN_partial_10_0223,
  rs_R010_ueqv_R010YNN_partial_10_0224,
  rs_R010_ueqv_R010YNN_partial_10_0225,
  rs_R010_ueqv_R010YNN_partial_10_0226,
  rs_R010_ueqv_R010YNN_partial_10_0227,
  rs_R010_ueqv_R010YNN_partial_10_0228,
  rs_R010_ueqv_R010YNN_partial_10_0229,
  rs_R010_ueqv_R010YNN_partial_10_0230,
  rs_R010_ueqv_R010YNN_partial_10_0231,
  rs_R010_ueqv_R010YNN_partial_10_0232,
  rs_R010_ueqv_R010YNN_partial_10_0233,
  rs_R010_ueqv_R010YNN_partial_10_0234,
  rs_R010_ueqv_R010YNN_partial_10_0235,
  rs_R010_ueqv_R010YNN_partial_10_0236,
  rs_R010_ueqv_R010YNN_partial_10_0237,
  rs_R010_ueqv_R010YNN_partial_10_0238,
  rs_R010_ueqv_R010YNN_partial_10_0239,
  rs_R010_ueqv_R010YNN_partial_10_0240,
  rs_R010_ueqv_R010YNN_partial_10_0241,
  rs_R010_ueqv_R010YNN_partial_10_0242,
  rs_R010_ueqv_R010YNN_partial_10_0243,
  rs_R010_ueqv_R010YNN_partial_10_0244,
  rs_R010_ueqv_R010YNN_partial_10_0245,
  rs_R010_ueqv_R010YNN_partial_10_0246,
  rs_R010_ueqv_R010YNN_partial_10_0247,
  rs_R010_ueqv_R010YNN_partial_10_0248,
  rs_R010_ueqv_R010YNN_partial_10_0249,
  rs_R010_ueqv_R010YNN_partial_10_0250,
  rs_R010_ueqv_R010YNN_partial_10_0251,
  rs_R010_ueqv_R010YNN_partial_10_0252,
  rs_R010_ueqv_R010YNN_partial_10_0253,
  rs_R010_ueqv_R010YNN_partial_10_0254,
  rs_R010_ueqv_R010YNN_partial_10_0255,
  rs_R010_ueqv_R010YNN_partial_10_0256,
  rs_R010_ueqv_R010YNN_partial_10_0257,
  rs_R010_ueqv_R010YNN_partial_10_0258,
  rs_R010_ueqv_R010YNN_partial_10_0259,
  rs_R010_ueqv_R010YNN_partial_10_0260,
  rs_R010_ueqv_R010YNN_partial_10_0261,
  rs_R010_ueqv_R010YNN_partial_10_0262,
  rs_R010_ueqv_R010YNN_partial_10_0263,
  rs_R010_ueqv_R010YNN_partial_10_0264,
  rs_R010_ueqv_R010YNN_partial_10_0265,
  rs_R010_ueqv_R010YNN_partial_10_0266,
  rs_R010_ueqv_R010YNN_partial_10_0267,
  rs_R010_ueqv_R010YNN_partial_10_0268,
  rs_R010_ueqv_R010YNN_partial_10_0269,
  rs_R010_ueqv_R010YNN_partial_10_0270,
  rs_R010_ueqv_R010YNN_partial_10_0271,
  rs_R010_ueqv_R010YNN_partial_10_0272,
  rs_R010_ueqv_R010YNN_partial_10_0273,
  rs_R010_ueqv_R010YNN_partial_10_0274,
  rs_R010_ueqv_R010YNN_partial_10_0275,
  rs_R010_ueqv_R010YNN_partial_10_0276,
  rs_R010_ueqv_R010YNN_partial_10_0277,
  rs_R010_ueqv_R010YNN_partial_10_0278,
  rs_R010_ueqv_R010YNN_partial_10_0279,
  rs_R010_ueqv_R010YNN_partial_10_0280,
  rs_R010_ueqv_R010YNN_partial_10_0281,
  rs_R010_ueqv_R010YNN_partial_10_0282,
  rs_R010_ueqv_R010YNN_partial_10_0283,
  rs_R010_ueqv_R010YNN_partial_10_0284,
  rs_R010_ueqv_R010YNN_partial_10_0285,
  rs_R010_ueqv_R010YNN_partial_10_0286,
  rs_R010_ueqv_R010YNN_partial_10_0287,
  rs_R010_ueqv_R010YNN_partial_10_0288,
  rs_R010_ueqv_R010YNN_partial_10_0289,
  rs_R010_ueqv_R010YNN_partial_10_0290,
  rs_R010_ueqv_R010YNN_partial_10_0291,
  rs_R010_ueqv_R010YNN_partial_10_0292,
  rs_R010_ueqv_R010YNN_partial_10_0293,
  rs_R010_ueqv_R010YNN_partial_10_0294,
  rs_R010_ueqv_R010YNN_partial_10_0295,
  rs_R010_ueqv_R010YNN_partial_10_0296,
  rs_R010_ueqv_R010YNN_partial_10_0297,
  rs_R010_ueqv_R010YNN_partial_10_0298,
  rs_R010_ueqv_R010YNN_partial_10_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_10_0200_0299 : Poly :=
[
  term ((-1727428647650919052732 : Rat) / 1347456623642648775) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10955545468596454528 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((18219332546331247232 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((113315924951282679296 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5767772926478503424 : Rat) / 89830441576176585) [(2, 1), (4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-2055402032620518080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-999817620846561792 : Rat) / 29943480525392195) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-462591456939012742288 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6895907067232796800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2999677171741143040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-9469679372517402368 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((387274359395695215616 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((-12112232940669948416 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (4, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (9, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(2, 1), (4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(2, 1), (4, 2), (5, 2), (9, 2), (16, 1)],
  term (-2 : Rat) [(2, 1), (4, 2), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((83301918713189120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((454052319592417280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((1212002288899630912 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((165133630615065491708 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(2, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((863714323825459526366 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9109666273165623616 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-56657962475641339648 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((1027701016310259040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-736193698575668608 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((499908810423280896 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((231295728469506371144 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3447953533616398400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1499838585870571520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-925745491604164352 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)],
  term ((4734839686258701184 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-193637179697847607808 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-948514696307494240 : Rat) / 53898264945705951) [(4, 1), (5, 2), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)],
  term ((6056116470334974208 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (16, 1)],
  term ((6346883630080000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31346233214680373128 : Rat) / 269491324728529755) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((-285761802735610880 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((540046735322931200 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((6452166422020122004 : Rat) / 269491324728529755) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((736193698575668608 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((925745491604164352 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term (1 : Rat) [(4, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-41650959356594560 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((83301918713189120 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227026159796208640 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72550035137786344 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-606001144449815456 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((272678602443404492 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-82566815307532745854 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((394751254873337600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-8202309507571200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 200 through 299. -/
theorem rs_R010_ueqv_R010YNN_block_10_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_10_0200_0299
      rs_R010_ueqv_R010YNN_block_10_0200_0299 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
