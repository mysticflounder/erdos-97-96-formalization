/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 19:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0200 : Poly :=
[
  term ((38304994570225 : Rat) / 2901071261844) [(6, 1), (8, 1)]
]

/-- Partial product 200 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0200 : Poly :=
[
  term ((-38304994570225 : Rat) / 2901071261844) [(6, 1), (8, 1)],
  term ((38304994570225 : Rat) / 1450535630922) [(6, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0200
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0201 : Poly :=
[
  term ((900 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 201 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0201 : Poly :=
[
  term ((-900 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1800 : Rat) / 7) [(6, 1), (8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0201
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0202 : Poly :=
[
  term ((-7158759049051 : Rat) / 2901071261844) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 202 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0202 : Poly :=
[
  term ((7158759049051 : Rat) / 2901071261844) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0202
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0203 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 203 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0203 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0203
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0204 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 204 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0204 : Poly :=
[
  term ((2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0204
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0205 : Poly :=
[
  term ((-985353530115407 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 205 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0205 : Poly :=
[
  term ((-985353530115407 : Rat) / 399637367703) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0205
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0206 : Poly :=
[
  term ((-8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 206 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0206 : Poly :=
[
  term ((-8088939207425 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0206
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0207 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 207 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0207 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0207
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0208 : Poly :=
[
  term ((7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 208 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0208 : Poly :=
[
  term ((7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0208
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0209 : Poly :=
[
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 209 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0209 : Poly :=
[
  term ((-13804982796901 : Rat) / 10117401714) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0209
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0210 : Poly :=
[
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 210 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0210 : Poly :=
[
  term ((-725 : Rat) / 21) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0210
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0211 : Poly :=
[
  term ((223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 211 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0211 : Poly :=
[
  term ((223402835779553401 : Rat) / 78328924069788) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0211
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0212 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0212 : Poly :=
[
  term ((628 : Rat) / 21) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0212
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0213 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

/-- Partial product 213 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0213 : Poly :=
[
  term ((2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0213
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0214 : Poly :=
[
  term ((-570510700538045 : Rat) / 1243316255076) [(6, 1), (10, 1)]
]

/-- Partial product 214 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0214 : Poly :=
[
  term ((-570510700538045 : Rat) / 621658127538) [(6, 1), (8, 1), (10, 1)],
  term ((570510700538045 : Rat) / 1243316255076) [(6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0214
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0215 : Poly :=
[
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 215 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0215 : Poly :=
[
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0215
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0216 : Poly :=
[
  term ((-44388 : Rat) / 79) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 216 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0216 : Poly :=
[
  term ((-88776 : Rat) / 79) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0216
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0217 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 217 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0217 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0217
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0218 : Poly :=
[
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 218 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0218 : Poly :=
[
  term ((6070875812284601 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0218
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0219 : Poly :=
[
  term ((-1727 : Rat) / 126) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0219 : Poly :=
[
  term ((-1727 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0219
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0220 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (10, 1), (13, 2)]
]

/-- Partial product 220 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0220 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0220
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0221 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 221 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0221 : Poly :=
[
  term ((-340 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0221
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0222 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 1), (15, 2)]
]

/-- Partial product 222 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0222 : Poly :=
[
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0222
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0223 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0223 : Poly :=
[
  term ((628 : Rat) / 21) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0223
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0224 : Poly :=
[
  term ((366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 224 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0224 : Poly :=
[
  term ((733927432418038 : Rat) / 399637367703) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0224
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0225 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 225 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0225 : Poly :=
[
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0225
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0226 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 226 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0226 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0226
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0227 : Poly :=
[
  term ((-12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 227 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0227 : Poly :=
[
  term ((-12436879200914209 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0227
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0228 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0228 : Poly :=
[
  term ((-64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0228
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0229 : Poly :=
[
  term ((20299262556543776 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 229 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0229 : Poly :=
[
  term ((40598525113087552 : Rat) / 19582231017447) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-20299262556543776 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0229
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0230 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0230 : Poly :=
[
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0230
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0231 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 231 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0231 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0231
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0232 : Poly :=
[
  term ((338835024887419 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 232 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0232 : Poly :=
[
  term ((677670049774838 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0232
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0233 : Poly :=
[
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0233 : Poly :=
[
  term ((-64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0233
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0234 : Poly :=
[
  term ((-7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2)]
]

/-- Partial product 234 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0234 : Poly :=
[
  term ((-7337393541563251 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 2)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0234
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0235 : Poly :=
[
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1)]
]

/-- Partial product 235 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0235 : Poly :=
[
  term ((6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0235
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0236 : Poly :=
[
  term ((-34362796658753 : Rat) / 725267815461) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 236 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0236 : Poly :=
[
  term ((-68725593317506 : Rat) / 725267815461) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((34362796658753 : Rat) / 725267815461) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0236
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0237 : Poly :=
[
  term ((-157 : Rat) / 21) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0237 : Poly :=
[
  term ((-314 : Rat) / 21) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0237
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0238 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 238 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0238 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0238
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0239 : Poly :=
[
  term ((725 : Rat) / 84) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 239 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0239 : Poly :=
[
  term ((725 : Rat) / 42) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0239
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0240 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 240 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0240 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0240
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0241 : Poly :=
[
  term ((-292090046557461905 : Rat) / 156657848139576) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 241 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0241 : Poly :=
[
  term ((-292090046557461905 : Rat) / 78328924069788) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((292090046557461905 : Rat) / 156657848139576) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0241
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0242 : Poly :=
[
  term ((349 : Rat) / 42) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0242 : Poly :=
[
  term ((349 : Rat) / 21) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0242
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0243 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 243 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0243 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0243
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0244 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 244 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0244 : Poly :=
[
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0244
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0245 : Poly :=
[
  term ((1532199782809 : Rat) / 107447083772) [(6, 1), (14, 1)]
]

/-- Partial product 245 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0245 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (8, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0245
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0246 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 246 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0246 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0246
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0247 : Poly :=
[
  term ((13718602083010135 : Rat) / 13054820678298) [(6, 1), (15, 2)]
]

/-- Partial product 247 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0247 : Poly :=
[
  term ((13718602083010135 : Rat) / 6527410339149) [(6, 1), (8, 1), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0247
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0248 : Poly :=
[
  term ((-494 : Rat) / 63) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0248 : Poly :=
[
  term ((-988 : Rat) / 63) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0248
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0249 : Poly :=
[
  term ((-35240595004607 : Rat) / 2901071261844) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 249 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0249 : Poly :=
[
  term ((35240595004607 : Rat) / 2901071261844) [(7, 1), (8, 1), (13, 1)],
  term ((-35240595004607 : Rat) / 1450535630922) [(7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0249
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0250 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 250 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0250 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0250
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0251 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1)]
]

/-- Partial product 251 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0251 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(7, 1), (8, 1), (9, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0251
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0252 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 252 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0252 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0252
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0253 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 253 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0253 : Poly :=
[
  term ((-2172201733 : Rat) / 83270796) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0253
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0254 : Poly :=
[
  term ((-3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 254 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0254 : Poly :=
[
  term ((-3849005354029 : Rat) / 429788335088) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0254
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0255 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 255 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0255 : Poly :=
[
  term ((3064399565618 : Rat) / 80585312829) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0255
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0256 : Poly :=
[
  term ((-205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 256 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0256 : Poly :=
[
  term ((-205192938256542655 : Rat) / 78328924069788) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0256
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0257 : Poly :=
[
  term ((-671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 257 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0257 : Poly :=
[
  term ((-1343248370880734 : Rat) / 6527410339149) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0257
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0258 : Poly :=
[
  term ((44388 : Rat) / 79) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 258 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0258 : Poly :=
[
  term ((88776 : Rat) / 79) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-44388 : Rat) / 79) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0258
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0259 : Poly :=
[
  term ((4049454544782883 : Rat) / 5594923147842) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 259 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0259 : Poly :=
[
  term ((4049454544782883 : Rat) / 2797461573921) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-4049454544782883 : Rat) / 5594923147842) [(7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0259
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0260 : Poly :=
[
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 260 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0260 : Poly :=
[
  term ((10732472496839915 : Rat) / 13054820678298) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0260
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0261 : Poly :=
[
  term ((725 : Rat) / 42) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 261 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0261 : Poly :=
[
  term ((725 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0261
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0262 : Poly :=
[
  term ((170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 262 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0262 : Poly :=
[
  term ((340 : Rat) / 63) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0262
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0263 : Poly :=
[
  term ((-282061132319075 : Rat) / 2901071261844) [(7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 263 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0263 : Poly :=
[
  term ((-282061132319075 : Rat) / 1450535630922) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0263
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0264 : Poly :=
[
  term ((-314 : Rat) / 21) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0264 : Poly :=
[
  term ((-628 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0264
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0265 : Poly :=
[
  term ((-778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 265 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0265 : Poly :=
[
  term ((-1556277381736670 : Rat) / 725267815461) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0265
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0266 : Poly :=
[
  term ((-32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0266 : Poly :=
[
  term ((-64 : Rat) / 9) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0266
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0267 : Poly :=
[
  term ((2978180803873216 : Rat) / 6527410339149) [(7, 1), (11, 1)]
]

/-- Partial product 267 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0267 : Poly :=
[
  term ((5956361607746432 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0267
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0268 : Poly :=
[
  term ((-357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 268 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0268 : Poly :=
[
  term ((-357218796280009 : Rat) / 310829063769) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0268
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0269 : Poly :=
[
  term ((-2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 269 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0269 : Poly :=
[
  term ((-5218672460247454 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0269
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0270 : Poly :=
[
  term ((-27208160598739489 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 270 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0270 : Poly :=
[
  term ((-27208160598739489 : Rat) / 13054820678298) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0270
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0271 : Poly :=
[
  term ((-17059450106977 : Rat) / 1289365005264) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 271 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0271 : Poly :=
[
  term ((-17059450106977 : Rat) / 644682502632) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((17059450106977 : Rat) / 1289365005264) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0271
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0272 : Poly :=
[
  term ((-725 : Rat) / 56) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 272 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0272 : Poly :=
[
  term ((-725 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 56) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0272
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0273 : Poly :=
[
  term ((474671511135211 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 273 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0273 : Poly :=
[
  term ((474671511135211 : Rat) / 2901071261844) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-474671511135211 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0273
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0274 : Poly :=
[
  term ((157 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0274 : Poly :=
[
  term ((157 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0274
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0275 : Poly :=
[
  term ((-26294240440710373 : Rat) / 39164462034894) [(7, 1), (13, 1)]
]

/-- Partial product 275 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0275 : Poly :=
[
  term ((-26294240440710373 : Rat) / 19582231017447) [(7, 1), (8, 1), (13, 1)],
  term ((26294240440710373 : Rat) / 39164462034894) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0275
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0276 : Poly :=
[
  term ((79946227939325689 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 276 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0276 : Poly :=
[
  term ((79946227939325689 : Rat) / 39164462034894) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-79946227939325689 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0276
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0277 : Poly :=
[
  term ((-1495 : Rat) / 126) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 277 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0277 : Poly :=
[
  term ((-1495 : Rat) / 63) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0277
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0278 : Poly :=
[
  term ((1495 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0278 : Poly :=
[
  term ((1495 : Rat) / 126) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0278
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0279 : Poly :=
[
  term ((-7417787862338948 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 279 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0279 : Poly :=
[
  term ((-14835575724677896 : Rat) / 6527410339149) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0279
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0280 : Poly :=
[
  term ((494 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0280 : Poly :=
[
  term ((988 : Rat) / 63) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0280
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0281 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 281 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0281 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0281
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0282 : Poly :=
[
  term ((271318535678836 : Rat) / 310829063769) [(7, 1), (15, 1)]
]

/-- Partial product 282 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0282 : Poly :=
[
  term ((542637071357672 : Rat) / 310829063769) [(7, 1), (8, 1), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0282
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0283 : Poly :=
[
  term ((-247 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0283 : Poly :=
[
  term ((-494 : Rat) / 63) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0283
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0284 : Poly :=
[
  term ((-5712040790311952 : Rat) / 6527410339149) [(7, 2)]
]

/-- Partial product 284 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0284 : Poly :=
[
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2)],
  term ((-11424081580623904 : Rat) / 6527410339149) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0284
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0285 : Poly :=
[
  term ((-2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1)]
]

/-- Partial product 285 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0285 : Poly :=
[
  term ((-2600143031426873 : Rat) / 6527410339149) [(7, 2), (8, 1), (10, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0285
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0286 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (10, 1), (14, 1)]
]

/-- Partial product 286 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0286 : Poly :=
[
  term ((3064399565618 : Rat) / 80585312829) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0286
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0287 : Poly :=
[
  term ((-1532199782809 : Rat) / 107447083772) [(7, 2), (12, 1)]
]

/-- Partial product 287 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0287 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (8, 1), (12, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0287
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0288 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (14, 1)]
]

/-- Partial product 288 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0288 : Poly :=
[
  term ((8699830366789502 : Rat) / 6527410339149) [(7, 2), (8, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0288
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0289 : Poly :=
[
  term ((6874863739861 : Rat) / 236822143824) [(8, 1)]
]

/-- Partial product 289 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0289 : Poly :=
[
  term ((-6874863739861 : Rat) / 236822143824) [(8, 1)],
  term ((6874863739861 : Rat) / 118411071912) [(8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0289
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0290 : Poly :=
[
  term ((210703568101 : Rat) / 8993245968) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 290 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0290 : Poly :=
[
  term ((-210703568101 : Rat) / 8993245968) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((210703568101 : Rat) / 4496622984) [(8, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0290
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0291 : Poly :=
[
  term ((-1692145150007 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 291 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0291 : Poly :=
[
  term ((1692145150007 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1)],
  term ((-1692145150007 : Rat) / 8993245968) [(8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0291
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0292 : Poly :=
[
  term ((4012056600851 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 292 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0292 : Poly :=
[
  term ((-4012056600851 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((4012056600851 : Rat) / 8993245968) [(8, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0292
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0293 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 293 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0293 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((210703568101 : Rat) / 1498874328) [(8, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0293
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0294 : Poly :=
[
  term ((23894219063 : Rat) / 1124155746) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 294 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0294 : Poly :=
[
  term ((-23894219063 : Rat) / 1124155746) [(8, 1), (9, 1), (13, 1)],
  term ((23894219063 : Rat) / 562077873) [(8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0294
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0295 : Poly :=
[
  term ((-1249015996475 : Rat) / 17986491936) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 295 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0295 : Poly :=
[
  term ((1249015996475 : Rat) / 17986491936) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1249015996475 : Rat) / 8993245968) [(8, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0295
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0296 : Poly :=
[
  term ((-210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 296 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0296 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-210703568101 : Rat) / 1498874328) [(8, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0296
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0297 : Poly :=
[
  term ((39936 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 297 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0297 : Poly :=
[
  term ((-39936 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((79872 : Rat) / 553) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0297
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0298 : Poly :=
[
  term ((3366906314273 : Rat) / 88808303934) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 298 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0298 : Poly :=
[
  term ((-3366906314273 : Rat) / 88808303934) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((3366906314273 : Rat) / 44404151967) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0298
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009YNNNN_coefficient_19_0299 : Poly :=
[
  term ((-65 : Rat) / 21) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 19. -/
def rs_R009_ueqv_R009YNNNN_partial_19_0299 : Poly :=
[
  term ((65 : Rat) / 21) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-130 : Rat) / 21) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 19. -/
theorem rs_R009_ueqv_R009YNNNN_partial_19_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_19_0299
        rs_R009_ueqv_R009YNNNN_generator_19_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_19_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_19_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_19_0200,
  rs_R009_ueqv_R009YNNNN_partial_19_0201,
  rs_R009_ueqv_R009YNNNN_partial_19_0202,
  rs_R009_ueqv_R009YNNNN_partial_19_0203,
  rs_R009_ueqv_R009YNNNN_partial_19_0204,
  rs_R009_ueqv_R009YNNNN_partial_19_0205,
  rs_R009_ueqv_R009YNNNN_partial_19_0206,
  rs_R009_ueqv_R009YNNNN_partial_19_0207,
  rs_R009_ueqv_R009YNNNN_partial_19_0208,
  rs_R009_ueqv_R009YNNNN_partial_19_0209,
  rs_R009_ueqv_R009YNNNN_partial_19_0210,
  rs_R009_ueqv_R009YNNNN_partial_19_0211,
  rs_R009_ueqv_R009YNNNN_partial_19_0212,
  rs_R009_ueqv_R009YNNNN_partial_19_0213,
  rs_R009_ueqv_R009YNNNN_partial_19_0214,
  rs_R009_ueqv_R009YNNNN_partial_19_0215,
  rs_R009_ueqv_R009YNNNN_partial_19_0216,
  rs_R009_ueqv_R009YNNNN_partial_19_0217,
  rs_R009_ueqv_R009YNNNN_partial_19_0218,
  rs_R009_ueqv_R009YNNNN_partial_19_0219,
  rs_R009_ueqv_R009YNNNN_partial_19_0220,
  rs_R009_ueqv_R009YNNNN_partial_19_0221,
  rs_R009_ueqv_R009YNNNN_partial_19_0222,
  rs_R009_ueqv_R009YNNNN_partial_19_0223,
  rs_R009_ueqv_R009YNNNN_partial_19_0224,
  rs_R009_ueqv_R009YNNNN_partial_19_0225,
  rs_R009_ueqv_R009YNNNN_partial_19_0226,
  rs_R009_ueqv_R009YNNNN_partial_19_0227,
  rs_R009_ueqv_R009YNNNN_partial_19_0228,
  rs_R009_ueqv_R009YNNNN_partial_19_0229,
  rs_R009_ueqv_R009YNNNN_partial_19_0230,
  rs_R009_ueqv_R009YNNNN_partial_19_0231,
  rs_R009_ueqv_R009YNNNN_partial_19_0232,
  rs_R009_ueqv_R009YNNNN_partial_19_0233,
  rs_R009_ueqv_R009YNNNN_partial_19_0234,
  rs_R009_ueqv_R009YNNNN_partial_19_0235,
  rs_R009_ueqv_R009YNNNN_partial_19_0236,
  rs_R009_ueqv_R009YNNNN_partial_19_0237,
  rs_R009_ueqv_R009YNNNN_partial_19_0238,
  rs_R009_ueqv_R009YNNNN_partial_19_0239,
  rs_R009_ueqv_R009YNNNN_partial_19_0240,
  rs_R009_ueqv_R009YNNNN_partial_19_0241,
  rs_R009_ueqv_R009YNNNN_partial_19_0242,
  rs_R009_ueqv_R009YNNNN_partial_19_0243,
  rs_R009_ueqv_R009YNNNN_partial_19_0244,
  rs_R009_ueqv_R009YNNNN_partial_19_0245,
  rs_R009_ueqv_R009YNNNN_partial_19_0246,
  rs_R009_ueqv_R009YNNNN_partial_19_0247,
  rs_R009_ueqv_R009YNNNN_partial_19_0248,
  rs_R009_ueqv_R009YNNNN_partial_19_0249,
  rs_R009_ueqv_R009YNNNN_partial_19_0250,
  rs_R009_ueqv_R009YNNNN_partial_19_0251,
  rs_R009_ueqv_R009YNNNN_partial_19_0252,
  rs_R009_ueqv_R009YNNNN_partial_19_0253,
  rs_R009_ueqv_R009YNNNN_partial_19_0254,
  rs_R009_ueqv_R009YNNNN_partial_19_0255,
  rs_R009_ueqv_R009YNNNN_partial_19_0256,
  rs_R009_ueqv_R009YNNNN_partial_19_0257,
  rs_R009_ueqv_R009YNNNN_partial_19_0258,
  rs_R009_ueqv_R009YNNNN_partial_19_0259,
  rs_R009_ueqv_R009YNNNN_partial_19_0260,
  rs_R009_ueqv_R009YNNNN_partial_19_0261,
  rs_R009_ueqv_R009YNNNN_partial_19_0262,
  rs_R009_ueqv_R009YNNNN_partial_19_0263,
  rs_R009_ueqv_R009YNNNN_partial_19_0264,
  rs_R009_ueqv_R009YNNNN_partial_19_0265,
  rs_R009_ueqv_R009YNNNN_partial_19_0266,
  rs_R009_ueqv_R009YNNNN_partial_19_0267,
  rs_R009_ueqv_R009YNNNN_partial_19_0268,
  rs_R009_ueqv_R009YNNNN_partial_19_0269,
  rs_R009_ueqv_R009YNNNN_partial_19_0270,
  rs_R009_ueqv_R009YNNNN_partial_19_0271,
  rs_R009_ueqv_R009YNNNN_partial_19_0272,
  rs_R009_ueqv_R009YNNNN_partial_19_0273,
  rs_R009_ueqv_R009YNNNN_partial_19_0274,
  rs_R009_ueqv_R009YNNNN_partial_19_0275,
  rs_R009_ueqv_R009YNNNN_partial_19_0276,
  rs_R009_ueqv_R009YNNNN_partial_19_0277,
  rs_R009_ueqv_R009YNNNN_partial_19_0278,
  rs_R009_ueqv_R009YNNNN_partial_19_0279,
  rs_R009_ueqv_R009YNNNN_partial_19_0280,
  rs_R009_ueqv_R009YNNNN_partial_19_0281,
  rs_R009_ueqv_R009YNNNN_partial_19_0282,
  rs_R009_ueqv_R009YNNNN_partial_19_0283,
  rs_R009_ueqv_R009YNNNN_partial_19_0284,
  rs_R009_ueqv_R009YNNNN_partial_19_0285,
  rs_R009_ueqv_R009YNNNN_partial_19_0286,
  rs_R009_ueqv_R009YNNNN_partial_19_0287,
  rs_R009_ueqv_R009YNNNN_partial_19_0288,
  rs_R009_ueqv_R009YNNNN_partial_19_0289,
  rs_R009_ueqv_R009YNNNN_partial_19_0290,
  rs_R009_ueqv_R009YNNNN_partial_19_0291,
  rs_R009_ueqv_R009YNNNN_partial_19_0292,
  rs_R009_ueqv_R009YNNNN_partial_19_0293,
  rs_R009_ueqv_R009YNNNN_partial_19_0294,
  rs_R009_ueqv_R009YNNNN_partial_19_0295,
  rs_R009_ueqv_R009YNNNN_partial_19_0296,
  rs_R009_ueqv_R009YNNNN_partial_19_0297,
  rs_R009_ueqv_R009YNNNN_partial_19_0298,
  rs_R009_ueqv_R009YNNNN_partial_19_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_19_0200_0299 : Poly :=
[
  term ((-38304994570225 : Rat) / 2901071261844) [(6, 1), (8, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-985353530115407 : Rat) / 399637367703) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-8088939207425 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-13804982796901 : Rat) / 10117401714) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 21) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((223402835779553401 : Rat) / 78328924069788) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((628 : Rat) / 21) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 2)],
  term ((-570510700538045 : Rat) / 621658127538) [(6, 1), (8, 1), (10, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-88776 : Rat) / 79) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1727 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((628 : Rat) / 21) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((733927432418038 : Rat) / 399637367703) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12436879200914209 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((38080809696558652 : Rat) / 19582231017447) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((677670049774838 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7337393541563251 : Rat) / 13054820678298) [(6, 1), (8, 1), (11, 2)],
  term ((6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (11, 2), (12, 1)],
  term ((-68725593317506 : Rat) / 725267815461) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((725 : Rat) / 42) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-72974190015784382 : Rat) / 19582231017447) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((349 : Rat) / 21) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (13, 2)],
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (8, 1), (14, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((13718602083010135 : Rat) / 6527410339149) [(6, 1), (8, 1), (15, 2)],
  term ((-988 : Rat) / 63) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((38304994570225 : Rat) / 1450535630922) [(6, 1), (8, 2)],
  term ((1800 : Rat) / 7) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((-7158759049051 : Rat) / 1450535630922) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((985353530115407 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)],
  term ((8088939207425 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-7158759049051 : Rat) / 2901071261844) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-223402835779553401 : Rat) / 156657848139576) [(6, 1), (9, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2)],
  term ((570510700538045 : Rat) / 1243316255076) [(6, 1), (10, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((44388 : Rat) / 79) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (10, 1), (13, 2)],
  term ((170 : Rat) / 63) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 1), (15, 2)],
  term ((-314 : Rat) / 21) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-366963716209019 : Rat) / 399637367703) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12436879200914209 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20299262556543776 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-338835024887419 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((7337393541563251 : Rat) / 26109641356596) [(6, 1), (11, 2)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1)],
  term ((34362796658753 : Rat) / 725267815461) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((157 : Rat) / 21) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (12, 1), (13, 2)],
  term ((-725 : Rat) / 84) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((292090046557461905 : Rat) / 156657848139576) [(6, 1), (13, 1), (15, 1)],
  term ((-349 : Rat) / 42) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 107447083772) [(6, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)],
  term ((-13718602083010135 : Rat) / 13054820678298) [(6, 1), (15, 2)],
  term ((494 : Rat) / 63) [(6, 1), (15, 2), (16, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(7, 1), (8, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(7, 1), (8, 1), (9, 1), (10, 1)],
  term ((-2172201733 : Rat) / 83270796) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3849005354029 : Rat) / 429788335088) [(7, 1), (8, 1), (9, 1), (12, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(7, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-205192938256542655 : Rat) / 78328924069788) [(7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-1343248370880734 : Rat) / 6527410339149) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((88776 : Rat) / 79) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((4049454544782883 : Rat) / 2797461573921) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((10732472496839915 : Rat) / 13054820678298) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-628 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1556277381736670 : Rat) / 725267815461) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((5956361607746432 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1)],
  term ((-357218796280009 : Rat) / 310829063769) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-5218672460247454 : Rat) / 6527410339149) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-27208160598739489 : Rat) / 13054820678298) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-17059450106977 : Rat) / 644682502632) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 28) [(7, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((474671511135211 : Rat) / 2901071261844) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 7) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-104225465697717103 : Rat) / 78328924069788) [(7, 1), (8, 1), (13, 1)],
  term ((80690877033770863 : Rat) / 39164462034894) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 63) [(7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-14835575724677896 : Rat) / 6527410339149) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((988 : Rat) / 63) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((542637071357672 : Rat) / 310829063769) [(7, 1), (8, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-35240595004607 : Rat) / 1450535630922) [(7, 1), (8, 2), (13, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(7, 1), (9, 1), (10, 1)],
  term ((2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((205192938256542655 : Rat) / 156657848139576) [(7, 1), (9, 1), (14, 1)],
  term ((671624185440367 : Rat) / 6527410339149) [(7, 1), (10, 1), (11, 1)],
  term ((-44388 : Rat) / 79) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-4049454544782883 : Rat) / 5594923147842) [(7, 1), (10, 1), (13, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((778138690868335 : Rat) / 725267815461) [(7, 1), (10, 1), (15, 1)],
  term ((32 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2978180803873216 : Rat) / 6527410339149) [(7, 1), (11, 1)],
  term ((357218796280009 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 1)],
  term ((2609336230123727 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((27208160598739489 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)],
  term ((17059450106977 : Rat) / 1289365005264) [(7, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 56) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-474671511135211 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 14) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((26294240440710373 : Rat) / 39164462034894) [(7, 1), (13, 1)],
  term ((-79946227939325689 : Rat) / 78328924069788) [(7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (13, 1), (16, 1)],
  term ((7417787862338948 : Rat) / 6527410339149) [(7, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)],
  term ((-271318535678836 : Rat) / 310829063769) [(7, 1), (15, 1)],
  term ((247 : Rat) / 63) [(7, 1), (15, 1), (16, 1)],
  term ((5712040790311952 : Rat) / 6527410339149) [(7, 2)],
  term ((-11424081580623904 : Rat) / 6527410339149) [(7, 2), (8, 1)],
  term ((-2600143031426873 : Rat) / 6527410339149) [(7, 2), (8, 1), (10, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(7, 2), (8, 1), (12, 1)],
  term ((8699830366789502 : Rat) / 6527410339149) [(7, 2), (8, 1), (14, 1)],
  term ((2600143031426873 : Rat) / 13054820678298) [(7, 2), (10, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (10, 1), (14, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (14, 1)],
  term ((-6874863739861 : Rat) / 236822143824) [(8, 1)],
  term ((-210703568101 : Rat) / 8993245968) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1692145150007 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1)],
  term ((-4012056600851 : Rat) / 17986491936) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-23894219063 : Rat) / 1124155746) [(8, 1), (9, 1), (13, 1)],
  term ((1249015996475 : Rat) / 17986491936) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((210703568101 : Rat) / 2997748656) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-39936 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-3366906314273 : Rat) / 88808303934) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((65 : Rat) / 21) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6874863739861 : Rat) / 118411071912) [(8, 2)],
  term ((210703568101 : Rat) / 4496622984) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1692145150007 : Rat) / 8993245968) [(8, 2), (9, 1), (11, 1)],
  term ((4012056600851 : Rat) / 8993245968) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((210703568101 : Rat) / 1498874328) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((23894219063 : Rat) / 562077873) [(8, 2), (9, 1), (13, 1)],
  term ((-1249015996475 : Rat) / 8993245968) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-210703568101 : Rat) / 1498874328) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((79872 : Rat) / 553) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((3366906314273 : Rat) / 44404151967) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-130 : Rat) / 21) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_19_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_19_0200_0299
      rs_R009_ueqv_R009YNNNN_block_19_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
