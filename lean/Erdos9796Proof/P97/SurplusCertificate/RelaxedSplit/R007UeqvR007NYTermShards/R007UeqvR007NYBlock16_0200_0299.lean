/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0200 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0200 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0200_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0200
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0201 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0201 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0201_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0201
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0202 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0202 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0202_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0202
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0203 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 7558345736637153438456) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0203 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 3779172868318576719228) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 7558345736637153438456) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0203_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0203
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0204 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0204 : Poly :=
[
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0204_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0204
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0205 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 2519448578879051146152) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 205 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0205 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 1259724289439525573076) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 2519448578879051146152) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0205_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0205
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0206 : Poly :=
[
  term ((-34739079592070301272645 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0206 : Poly :=
[
  term ((34739079592070301272645 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-69478159184140602545290 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0206_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0206
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0207 : Poly :=
[
  term ((6947815918414060254529 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0207 : Poly :=
[
  term ((-6947815918414060254529 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((13895631836828120509058 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0207_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0207
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0208 : Poly :=
[
  term ((-42677432026261647859735 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 208 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0208 : Poly :=
[
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0208_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0208
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0209 : Poly :=
[
  term ((8535486405252329571947 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0209 : Poly :=
[
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0209_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0209
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0210 : Poly :=
[
  term ((-207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0210 : Poly :=
[
  term ((-415316613247652497622140 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0210_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0210
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0211 : Poly :=
[
  term ((41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0211 : Poly :=
[
  term ((83063322649530499524428 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0211_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0211
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0212 : Poly :=
[
  term ((-22711605626680568539535 : Rat) / 1889586434159288359614) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0212 : Poly :=
[
  term ((-22711605626680568539535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((22711605626680568539535 : Rat) / 1889586434159288359614) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0212_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0212
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0213 : Poly :=
[
  term ((-8474609018702418325450 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0213 : Poly :=
[
  term ((-16949218037404836650900 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((8474609018702418325450 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0213_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0213
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0214 : Poly :=
[
  term ((31564675167719005705840 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 214 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0214 : Poly :=
[
  term ((63129350335438011411680 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-31564675167719005705840 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0214_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0214
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0215 : Poly :=
[
  term ((4542321125336113707907 : Rat) / 629862144719762786538) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0215 : Poly :=
[
  term ((4542321125336113707907 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4542321125336113707907 : Rat) / 629862144719762786538) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0215_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0215
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0216 : Poly :=
[
  term ((1694921803740483665090 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0216 : Poly :=
[
  term ((3389843607480967330180 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1694921803740483665090 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0216_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0216
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0217 : Poly :=
[
  term ((-18938805100631403423504 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0217 : Poly :=
[
  term ((-37877610201262806847008 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((18938805100631403423504 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0217_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0217
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0218 : Poly :=
[
  term ((10106779373992834607635 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0218 : Poly :=
[
  term ((20213558747985669215270 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-10106779373992834607635 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0218_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0218
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0219 : Poly :=
[
  term ((-2021355874798566921527 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0219 : Poly :=
[
  term ((-4042711749597133843054 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((2021355874798566921527 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0219_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0219
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0220 : Poly :=
[
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0220 : Poly :=
[
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0220_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0220
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0221 : Poly :=
[
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0221 : Poly :=
[
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0221_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0221
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0222 : Poly :=
[
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0222 : Poly :=
[
  term ((91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0222_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0222
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0223 : Poly :=
[
  term ((-105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0223 : Poly :=
[
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0223_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0223
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0224 : Poly :=
[
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0224 : Poly :=
[
  term ((-18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0224_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0224
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0225 : Poly :=
[
  term ((21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0225 : Poly :=
[
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0225_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0225
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0226 : Poly :=
[
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0226 : Poly :=
[
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0226_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0226
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0227 : Poly :=
[
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0227 : Poly :=
[
  term ((-169319473946737348098992 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0227_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0227
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0228 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0228 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0228_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0228
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0229 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0229 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0229_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0229
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0230 : Poly :=
[
  term ((125918390043384091745345 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0230 : Poly :=
[
  term ((125918390043384091745345 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-125918390043384091745345 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0230_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0230
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0231 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0231 : Poly :=
[
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0231_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0231
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0232 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0232 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0232_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0232
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0233 : Poly :=
[
  term ((-25183678008676818349069 : Rat) / 209954048239920928846) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0233 : Poly :=
[
  term ((-25183678008676818349069 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((25183678008676818349069 : Rat) / 209954048239920928846) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0233_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0233
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0234 : Poly :=
[
  term ((1047316035339671504241670 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0234 : Poly :=
[
  term ((-1047316035339671504241670 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2094632070679343008483340 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0234_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0234
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0235 : Poly :=
[
  term ((-209463207067934300848334 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 235 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0235 : Poly :=
[
  term ((209463207067934300848334 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-418926414135868601696668 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0235_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0235
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0236 : Poly :=
[
  term ((5776255943177158755620 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0236 : Poly :=
[
  term ((-5776255943177158755620 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0236_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0236
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0237 : Poly :=
[
  term ((-3465753565906295253372 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0237 : Poly :=
[
  term ((3465753565906295253372 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0237_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0237
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0238 : Poly :=
[
  term (-1 : Rat) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0238 : Poly :=
[
  term (1 : Rat) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0238_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0238
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0239 : Poly :=
[
  term ((7 : Rat) / 3) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0239 : Poly :=
[
  term ((-7 : Rat) / 3) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 3) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0239_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0239
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0240 : Poly :=
[
  term ((3179145811872181200340 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0240 : Poly :=
[
  term ((-3179145811872181200340 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((6358291623744362400680 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0240_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0240
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0241 : Poly :=
[
  term ((2370660811517217320455853 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 241 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0241 : Poly :=
[
  term ((-2370660811517217320455853 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2370660811517217320455853 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0241_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0241
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0242 : Poly :=
[
  term ((11975490955070508686759 : Rat) / 9062764672226802684) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0242 : Poly :=
[
  term ((-11975490955070508686759 : Rat) / 9062764672226802684) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((11975490955070508686759 : Rat) / 4531382336113401342) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0242_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0242
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0243 : Poly :=
[
  term ((-860941520337184143220369 : Rat) / 7558345736637153438456) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 243 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0243 : Poly :=
[
  term ((860941520337184143220369 : Rat) / 7558345736637153438456) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-860941520337184143220369 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0243_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0243
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0244 : Poly :=
[
  term ((-58439353087047514579495 : Rat) / 77125976904460749372) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0244 : Poly :=
[
  term ((58439353087047514579495 : Rat) / 77125976904460749372) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0244_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0244
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0245 : Poly :=
[
  term ((-635829162374436240068 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0245 : Poly :=
[
  term ((635829162374436240068 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1271658324748872480136 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0245_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0245
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0246 : Poly :=
[
  term ((-473376327729779748747325 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0246 : Poly :=
[
  term ((473376327729779748747325 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-473376327729779748747325 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0246_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0246
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0247 : Poly :=
[
  term ((168661076057006157039461 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0247 : Poly :=
[
  term ((-168661076057006157039461 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((168661076057006157039461 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0247_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0247
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0248 : Poly :=
[
  term ((-109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0248 : Poly :=
[
  term ((109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0248_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0248
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0249 : Poly :=
[
  term ((-3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0249 : Poly :=
[
  term ((-3030923051102697019063435 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0249_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0249
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0250 : Poly :=
[
  term (4 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 250 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0250 : Poly :=
[
  term (8 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0250_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0250
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0251 : Poly :=
[
  term ((606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0251 : Poly :=
[
  term ((606184610220539403812687 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0251_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0251
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0252 : Poly :=
[
  term (-1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0252 : Poly :=
[
  term (-2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0252_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0252
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0253 : Poly :=
[
  term (1 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

/-- Partial product 253 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0253 : Poly :=
[
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0253_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0253
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0254 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 254 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0254 : Poly :=
[
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0254_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0254
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0255 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0255 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0255_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0255
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0256 : Poly :=
[
  term ((-597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0256 : Poly :=
[
  term ((-597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0256_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0256
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0257 : Poly :=
[
  term ((464710451562190286626655 : Rat) / 539881838331225245604) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0257 : Poly :=
[
  term ((464710451562190286626655 : Rat) / 269940919165612622802) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-464710451562190286626655 : Rat) / 539881838331225245604) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0257_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0257
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0258 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 258 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0258 : Poly :=
[
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0258_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0258
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0259 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0259 : Poly :=
[
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0259_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0259
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0260 : Poly :=
[
  term ((119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0260 : Poly :=
[
  term ((119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0260_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0260
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0261 : Poly :=
[
  term (9 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0261 : Poly :=
[
  term (18 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0261_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0261
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0262 : Poly :=
[
  term (-5 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)]
]

/-- Partial product 262 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0262 : Poly :=
[
  term (-10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term (5 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0262_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0262
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0263 : Poly :=
[
  term ((-92942090312438057325331 : Rat) / 179960612777075081868) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 263 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0263 : Poly :=
[
  term ((-92942090312438057325331 : Rat) / 89980306388537540934) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((92942090312438057325331 : Rat) / 179960612777075081868) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0263_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0263
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0264 : Poly :=
[
  term (-4 : Rat) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 264 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0264 : Poly :=
[
  term (-8 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0264_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0264
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0265 : Poly :=
[
  term ((1304011931363422869821230 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 265 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0265 : Poly :=
[
  term ((2608023862726845739642460 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1304011931363422869821230 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0265_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0265
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0266 : Poly :=
[
  term ((-260802386272684573964246 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0266 : Poly :=
[
  term ((-521604772545369147928492 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((260802386272684573964246 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0266_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0266
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0267 : Poly :=
[
  term ((-35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 267 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0267 : Poly :=
[
  term ((-70604046413259990682270 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0267_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0267
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0268 : Poly :=
[
  term ((7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0268 : Poly :=
[
  term ((14120809282651998136454 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0268_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0268
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0269 : Poly :=
[
  term ((-209421520205624501551505 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 269 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0269 : Poly :=
[
  term ((-418843040411249003103010 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((209421520205624501551505 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0269_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0269
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0270 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 270 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0270 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0270_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0270
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0271 : Poly :=
[
  term ((345457341358057032370293 : Rat) / 839816192959683715384) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 271 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0271 : Poly :=
[
  term ((345457341358057032370293 : Rat) / 419908096479841857692) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-345457341358057032370293 : Rat) / 839816192959683715384) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0271_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0271
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0272 : Poly :=
[
  term ((-3687797193745082173087445 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 272 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0272 : Poly :=
[
  term ((-3687797193745082173087445 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((3687797193745082173087445 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0272_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0272
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0273 : Poly :=
[
  term ((-521435277155338639608265 : Rat) / 7558345736637153438456) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 273 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0273 : Poly :=
[
  term ((-521435277155338639608265 : Rat) / 3779172868318576719228) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((521435277155338639608265 : Rat) / 7558345736637153438456) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0273_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0273
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0274 : Poly :=
[
  term ((41884304041124900310301 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0274 : Poly :=
[
  term ((83768608082249800620602 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41884304041124900310301 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0274_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0274
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0275 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0275 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0275_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0275
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0276 : Poly :=
[
  term ((-637275832394960838629593 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0276 : Poly :=
[
  term ((-637275832394960838629593 : Rat) / 1259724289439525573076) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((637275832394960838629593 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0276_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0276
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0277 : Poly :=
[
  term ((113525033553624248790877 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0277 : Poly :=
[
  term ((113525033553624248790877 : Rat) / 1259724289439525573076) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113525033553624248790877 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0277_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0277
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0278 : Poly :=
[
  term ((737559438749016434617489 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 278 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0278 : Poly :=
[
  term ((737559438749016434617489 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-737559438749016434617489 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0278_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0278
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0279 : Poly :=
[
  term ((-20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 279 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0279 : Poly :=
[
  term ((-40598312741837720600650 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0279_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0279
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0280 : Poly :=
[
  term ((3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0280 : Poly :=
[
  term ((7699754451887702262438 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0280_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0280
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0281 : Poly :=
[
  term ((-79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 281 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0281 : Poly :=
[
  term ((-79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0281_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0281
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0282 : Poly :=
[
  term ((357705130205582466788875 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 282 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0282 : Poly :=
[
  term ((357705130205582466788875 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-357705130205582466788875 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0282_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0282
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0283 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0283 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0283_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0283
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0284 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0284 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0284_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0284
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0285 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 285 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0285 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0285_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0285
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0286 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 286 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0286 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0286_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0286
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0287 : Poly :=
[
  term ((-11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 287 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0287 : Poly :=
[
  term ((-11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0287_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0287
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0288 : Poly :=
[
  term ((240256106421875004505546 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 288 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0288 : Poly :=
[
  term ((480512212843750009011092 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240256106421875004505546 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0288_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0288
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0289 : Poly :=
[
  term ((-181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 289 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0289 : Poly :=
[
  term ((-181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0289_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0289
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0290 : Poly :=
[
  term ((-2702957087252139550862299 : Rat) / 2519448578879051146152) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 290 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0290 : Poly :=
[
  term ((-2702957087252139550862299 : Rat) / 1259724289439525573076) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((2702957087252139550862299 : Rat) / 2519448578879051146152) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0290_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0290
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0291 : Poly :=
[
  term ((-33725246276068153783716857 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 291 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0291 : Poly :=
[
  term ((-33725246276068153783716857 : Rat) / 7558345736637153438456) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((33725246276068153783716857 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0291_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0291
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0292 : Poly :=
[
  term ((58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0292 : Poly :=
[
  term ((58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0292_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0292
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0293 : Poly :=
[
  term ((-58439353087047514579495 : Rat) / 154251953808921498744) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0293 : Poly :=
[
  term ((-58439353087047514579495 : Rat) / 77125976904460749372) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 154251953808921498744) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0293_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0293
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0294 : Poly :=
[
  term ((47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0294 : Poly :=
[
  term ((47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0294_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0294
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0295 : Poly :=
[
  term ((-71541026041116493357775 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0295 : Poly :=
[
  term ((-71541026041116493357775 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((71541026041116493357775 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0295_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0295
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0296 : Poly :=
[
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 296 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0296 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0296_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0296
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0297 : Poly :=
[
  term ((1 : Rat) / 6) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 297 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0297 : Poly :=
[
  term ((1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0297_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0297
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0298 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 298 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0298 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0298_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0298
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_0299 : Poly :=
[
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 299 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_0299 : Poly :=
[
  term ((-1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_0299_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_0299
        rs_R007_ueqv_R007NY_generator_16_0200_0299 =
      rs_R007_ueqv_R007NY_partial_16_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_0200_0299 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_0200,
  rs_R007_ueqv_R007NY_partial_16_0201,
  rs_R007_ueqv_R007NY_partial_16_0202,
  rs_R007_ueqv_R007NY_partial_16_0203,
  rs_R007_ueqv_R007NY_partial_16_0204,
  rs_R007_ueqv_R007NY_partial_16_0205,
  rs_R007_ueqv_R007NY_partial_16_0206,
  rs_R007_ueqv_R007NY_partial_16_0207,
  rs_R007_ueqv_R007NY_partial_16_0208,
  rs_R007_ueqv_R007NY_partial_16_0209,
  rs_R007_ueqv_R007NY_partial_16_0210,
  rs_R007_ueqv_R007NY_partial_16_0211,
  rs_R007_ueqv_R007NY_partial_16_0212,
  rs_R007_ueqv_R007NY_partial_16_0213,
  rs_R007_ueqv_R007NY_partial_16_0214,
  rs_R007_ueqv_R007NY_partial_16_0215,
  rs_R007_ueqv_R007NY_partial_16_0216,
  rs_R007_ueqv_R007NY_partial_16_0217,
  rs_R007_ueqv_R007NY_partial_16_0218,
  rs_R007_ueqv_R007NY_partial_16_0219,
  rs_R007_ueqv_R007NY_partial_16_0220,
  rs_R007_ueqv_R007NY_partial_16_0221,
  rs_R007_ueqv_R007NY_partial_16_0222,
  rs_R007_ueqv_R007NY_partial_16_0223,
  rs_R007_ueqv_R007NY_partial_16_0224,
  rs_R007_ueqv_R007NY_partial_16_0225,
  rs_R007_ueqv_R007NY_partial_16_0226,
  rs_R007_ueqv_R007NY_partial_16_0227,
  rs_R007_ueqv_R007NY_partial_16_0228,
  rs_R007_ueqv_R007NY_partial_16_0229,
  rs_R007_ueqv_R007NY_partial_16_0230,
  rs_R007_ueqv_R007NY_partial_16_0231,
  rs_R007_ueqv_R007NY_partial_16_0232,
  rs_R007_ueqv_R007NY_partial_16_0233,
  rs_R007_ueqv_R007NY_partial_16_0234,
  rs_R007_ueqv_R007NY_partial_16_0235,
  rs_R007_ueqv_R007NY_partial_16_0236,
  rs_R007_ueqv_R007NY_partial_16_0237,
  rs_R007_ueqv_R007NY_partial_16_0238,
  rs_R007_ueqv_R007NY_partial_16_0239,
  rs_R007_ueqv_R007NY_partial_16_0240,
  rs_R007_ueqv_R007NY_partial_16_0241,
  rs_R007_ueqv_R007NY_partial_16_0242,
  rs_R007_ueqv_R007NY_partial_16_0243,
  rs_R007_ueqv_R007NY_partial_16_0244,
  rs_R007_ueqv_R007NY_partial_16_0245,
  rs_R007_ueqv_R007NY_partial_16_0246,
  rs_R007_ueqv_R007NY_partial_16_0247,
  rs_R007_ueqv_R007NY_partial_16_0248,
  rs_R007_ueqv_R007NY_partial_16_0249,
  rs_R007_ueqv_R007NY_partial_16_0250,
  rs_R007_ueqv_R007NY_partial_16_0251,
  rs_R007_ueqv_R007NY_partial_16_0252,
  rs_R007_ueqv_R007NY_partial_16_0253,
  rs_R007_ueqv_R007NY_partial_16_0254,
  rs_R007_ueqv_R007NY_partial_16_0255,
  rs_R007_ueqv_R007NY_partial_16_0256,
  rs_R007_ueqv_R007NY_partial_16_0257,
  rs_R007_ueqv_R007NY_partial_16_0258,
  rs_R007_ueqv_R007NY_partial_16_0259,
  rs_R007_ueqv_R007NY_partial_16_0260,
  rs_R007_ueqv_R007NY_partial_16_0261,
  rs_R007_ueqv_R007NY_partial_16_0262,
  rs_R007_ueqv_R007NY_partial_16_0263,
  rs_R007_ueqv_R007NY_partial_16_0264,
  rs_R007_ueqv_R007NY_partial_16_0265,
  rs_R007_ueqv_R007NY_partial_16_0266,
  rs_R007_ueqv_R007NY_partial_16_0267,
  rs_R007_ueqv_R007NY_partial_16_0268,
  rs_R007_ueqv_R007NY_partial_16_0269,
  rs_R007_ueqv_R007NY_partial_16_0270,
  rs_R007_ueqv_R007NY_partial_16_0271,
  rs_R007_ueqv_R007NY_partial_16_0272,
  rs_R007_ueqv_R007NY_partial_16_0273,
  rs_R007_ueqv_R007NY_partial_16_0274,
  rs_R007_ueqv_R007NY_partial_16_0275,
  rs_R007_ueqv_R007NY_partial_16_0276,
  rs_R007_ueqv_R007NY_partial_16_0277,
  rs_R007_ueqv_R007NY_partial_16_0278,
  rs_R007_ueqv_R007NY_partial_16_0279,
  rs_R007_ueqv_R007NY_partial_16_0280,
  rs_R007_ueqv_R007NY_partial_16_0281,
  rs_R007_ueqv_R007NY_partial_16_0282,
  rs_R007_ueqv_R007NY_partial_16_0283,
  rs_R007_ueqv_R007NY_partial_16_0284,
  rs_R007_ueqv_R007NY_partial_16_0285,
  rs_R007_ueqv_R007NY_partial_16_0286,
  rs_R007_ueqv_R007NY_partial_16_0287,
  rs_R007_ueqv_R007NY_partial_16_0288,
  rs_R007_ueqv_R007NY_partial_16_0289,
  rs_R007_ueqv_R007NY_partial_16_0290,
  rs_R007_ueqv_R007NY_partial_16_0291,
  rs_R007_ueqv_R007NY_partial_16_0292,
  rs_R007_ueqv_R007NY_partial_16_0293,
  rs_R007_ueqv_R007NY_partial_16_0294,
  rs_R007_ueqv_R007NY_partial_16_0295,
  rs_R007_ueqv_R007NY_partial_16_0296,
  rs_R007_ueqv_R007NY_partial_16_0297,
  rs_R007_ueqv_R007NY_partial_16_0298,
  rs_R007_ueqv_R007NY_partial_16_0299
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_0200_0299 : Poly :=
[
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 7558345736637153438456) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 2519448578879051146152) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-85354864052523295719470 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((17070972810504659143894 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-415316613247652497622140 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((83063322649530499524428 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-22711605626680568539535 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16949218037404836650900 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((602903232611012403977765 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((4542321125336113707907 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3389843607480967330180 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-120580646522202480795553 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-69478159184140602545290 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((13895631836828120509058 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((42677432026261647859735 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-8535486405252329571947 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((207658306623826248811070 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41531661324765249762214 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((22711605626680568539535 : Rat) / 1889586434159288359614) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((8474609018702418325450 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-31564675167719005705840 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-4542321125336113707907 : Rat) / 629862144719762786538) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1694921803740483665090 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((18938805100631403423504 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((20213558747985669215270 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-4042711749597133843054 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-10106779373992834607635 : Rat) / 314931072359881393269) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((2021355874798566921527 : Rat) / 104977024119960464423) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-169319473946737348098992 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (15, 2), (16, 1)],
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((105824671216710842561870 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21164934243342168512374 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-125918390043384091745345 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((25183678008676818349069 : Rat) / 209954048239920928846) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((606184610220539403812687 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((2608023862726845739642460 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-521604772545369147928492 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-122590349901854419482850 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((24518069980370883896570 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-418843040411249003103010 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((345457341358057032370293 : Rat) / 419908096479841857692) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3687797193745082173087445 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-517656104287020062889037 : Rat) / 3779172868318576719228) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((83768608082249800620602 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-637275832394960838629593 : Rat) / 1259724289439525573076) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((110585676878265355787033 : Rat) / 1259724289439525573076) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((737559438749016434617489 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-40598312741837720600650 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((7699754451887702262438 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((224181006106950856374595 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((512412465545282733610699 : Rat) / 1889586434159288359614) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-363962527500578354860150 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4108038094466371205062061 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44836201221390171274919 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((473376327729779748747325 : Rat) / 629862144719762786538) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-168661076057006157039461 : Rat) / 2519448578879051146152) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((2094632070679343008483340 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-418926414135868601696668 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((11552511886354317511240 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-6931507131812590506744 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((14 : Rat) / 3) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((6358291623744362400680 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((2370660811517217320455853 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((11975490955070508686759 : Rat) / 4531382336113401342) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((-860941520337184143220369 : Rat) / 3779172868318576719228) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1271658324748872480136 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-473376327729779748747325 : Rat) / 314931072359881393269) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((168661076057006157039461 : Rat) / 1259724289439525573076) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (15, 3), (16, 1)],
  term ((3030923051102697019063435 : Rat) / 1889586434159288359614) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-606184610220539403812687 : Rat) / 629862144719762786538) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-464710451562190286626655 : Rat) / 539881838331225245604) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (-9 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((92942090312438057325331 : Rat) / 179960612777075081868) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (16, 1)],
  term ((-1304011931363422869821230 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((260802386272684573964246 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((35302023206629995341135 : Rat) / 944793217079644179807) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-7060404641325999068227 : Rat) / 314931072359881393269) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((209421520205624501551505 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(1, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-345457341358057032370293 : Rat) / 839816192959683715384) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3687797193745082173087445 : Rat) / 1889586434159288359614) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((521435277155338639608265 : Rat) / 7558345736637153438456) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41884304041124900310301 : Rat) / 314931072359881393269) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((637275832394960838629593 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-113525033553624248790877 : Rat) / 2519448578879051146152) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-737559438749016434617489 : Rat) / 629862144719762786538) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((20299156370918860300325 : Rat) / 314931072359881393269) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-3849877225943851131219 : Rat) / 104977024119960464423) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-357705130205582466788875 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-240256106421875004505546 : Rat) / 314931072359881393269) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((2702957087252139550862299 : Rat) / 2519448578879051146152) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((33725246276068153783716857 : Rat) / 15116691473274306876912) [(1, 1), (11, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 154251953808921498744) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((71541026041116493357775 : Rat) / 1259724289439525573076) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 299. -/
theorem rs_R007_ueqv_R007NY_block_16_0200_0299_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_0200_0299
      rs_R007_ueqv_R007NY_block_16_0200_0299 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
