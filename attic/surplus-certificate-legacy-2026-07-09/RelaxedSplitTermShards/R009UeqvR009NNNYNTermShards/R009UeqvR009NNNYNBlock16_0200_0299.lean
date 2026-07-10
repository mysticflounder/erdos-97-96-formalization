/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 16:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0200 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 200 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0200 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0200
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0201 : Poly :=
[
  term ((-16777040 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 201 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0201 : Poly :=
[
  term ((-33554080 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((16777040 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0201
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0202 : Poly :=
[
  term ((968274880 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 202 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0202 : Poly :=
[
  term ((1936549760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-968274880 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0202
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0203 : Poly :=
[
  term ((33693100 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 203 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0203 : Poly :=
[
  term ((67386200 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-33693100 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0203
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0204 : Poly :=
[
  term ((25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 204 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0204 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0204
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0205 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 205 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0205 : Poly :=
[
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0205
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0206 : Poly :=
[
  term ((-1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 206 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0206 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0206
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0207 : Poly :=
[
  term ((-1944573200 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 207 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0207 : Poly :=
[
  term ((-3889146400 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((1944573200 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0207
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0208 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 208 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0208 : Poly :=
[
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (15, 3)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0208
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0209 : Poly :=
[
  term ((-83722240 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 209 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0209 : Poly :=
[
  term ((83722240 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-167444480 : Rat) / 110226591) [(2, 1), (6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0209
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0210 : Poly :=
[
  term ((-3924480 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 210 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0210 : Poly :=
[
  term ((3924480 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-7848960 : Rat) / 12247399) [(2, 1), (6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0210
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0211 : Poly :=
[
  term ((75499520 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 211 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0211 : Poly :=
[
  term ((-75499520 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((150999040 : Rat) / 110226591) [(2, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0211
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0212 : Poly :=
[
  term ((-18780160 : Rat) / 12247399) [(2, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 212 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0212 : Poly :=
[
  term ((18780160 : Rat) / 12247399) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-37560320 : Rat) / 12247399) [(2, 1), (6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0212
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0213 : Poly :=
[
  term ((16935680 : Rat) / 12247399) [(2, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0213 : Poly :=
[
  term ((-16935680 : Rat) / 12247399) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((33871360 : Rat) / 12247399) [(2, 1), (6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0213
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0214 : Poly :=
[
  term ((-7922880 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)]
]

/-- Partial product 214 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0214 : Poly :=
[
  term ((7922880 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((-15845760 : Rat) / 12247399) [(2, 1), (6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0214
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0215 : Poly :=
[
  term ((306252800 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 215 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0215 : Poly :=
[
  term ((612505600 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-306252800 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0215
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0216 : Poly :=
[
  term ((1027317760 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 216 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0216 : Poly :=
[
  term ((2054635520 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1027317760 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0216
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0217 : Poly :=
[
  term ((-1727559680 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 217 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0217 : Poly :=
[
  term ((-3455119360 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((1727559680 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0217
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0218 : Poly :=
[
  term ((16051840 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 218 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0218 : Poly :=
[
  term ((32103680 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-16051840 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0218
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0219 : Poly :=
[
  term ((-926420480 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 219 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0219 : Poly :=
[
  term ((-1852840960 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((926420480 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0219
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0220 : Poly :=
[
  term ((4785200 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 220 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0220 : Poly :=
[
  term ((9570400 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-4785200 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0220
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0221 : Poly :=
[
  term ((-26993120 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 221 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0221 : Poly :=
[
  term ((-53986240 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((26993120 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0221
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0222 : Poly :=
[
  term ((1557888640 : Rat) / 330679773) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 222 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0222 : Poly :=
[
  term ((3115777280 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1557888640 : Rat) / 330679773) [(2, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0222
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0223 : Poly :=
[
  term ((-276174400 : Rat) / 330679773) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 223 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0223 : Poly :=
[
  term ((-552348800 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((276174400 : Rat) / 330679773) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0223
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0224 : Poly :=
[
  term ((-1647806720 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 224 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0224 : Poly :=
[
  term ((-3295613440 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((1647806720 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0224
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0225 : Poly :=
[
  term ((59745280 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 225 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0225 : Poly :=
[
  term ((119490560 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-59745280 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0225
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0226 : Poly :=
[
  term ((-50462720 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 226 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0226 : Poly :=
[
  term ((-100925440 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((50462720 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0226
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0227 : Poly :=
[
  term ((-209592320 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 227 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0227 : Poly :=
[
  term ((-419184640 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0227
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0228 : Poly :=
[
  term ((8401680 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 228 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0228 : Poly :=
[
  term ((16803360 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-8401680 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0228
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0229 : Poly :=
[
  term ((-53877440 : Rat) / 36742197) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 229 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0229 : Poly :=
[
  term ((-107754880 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((53877440 : Rat) / 36742197) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0229
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0230 : Poly :=
[
  term ((-25746980 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 230 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0230 : Poly :=
[
  term ((-51493960 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((25746980 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0230
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0231 : Poly :=
[
  term ((-7096320 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 231 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0231 : Poly :=
[
  term ((-14192640 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((7096320 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0231
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0232 : Poly :=
[
  term ((-9824640 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 232 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0232 : Poly :=
[
  term ((-19649280 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((9824640 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0232
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0233 : Poly :=
[
  term ((45506560 : Rat) / 36742197) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 233 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0233 : Poly :=
[
  term ((91013120 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-45506560 : Rat) / 36742197) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0233
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0234 : Poly :=
[
  term ((1485968560 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 234 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0234 : Poly :=
[
  term ((2971937120 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-1485968560 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0234
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0235 : Poly :=
[
  term ((189007360 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 235 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0235 : Poly :=
[
  term ((378014720 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0235
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0236 : Poly :=
[
  term ((-63365120 : Rat) / 36742197) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 236 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0236 : Poly :=
[
  term ((-126730240 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((63365120 : Rat) / 36742197) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0236
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0237 : Poly :=
[
  term ((205300480 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 237 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0237 : Poly :=
[
  term ((410600960 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-205300480 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0237
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0238 : Poly :=
[
  term ((468070400 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 238 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0238 : Poly :=
[
  term ((936140800 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-468070400 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0238
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0239 : Poly :=
[
  term ((-1608373760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 239 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0239 : Poly :=
[
  term ((-3216747520 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((1608373760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0239
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0240 : Poly :=
[
  term ((104796160 : Rat) / 110226591) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 240 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0240 : Poly :=
[
  term ((209592320 : Rat) / 110226591) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-104796160 : Rat) / 110226591) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0240
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0241 : Poly :=
[
  term ((-950862080 : Rat) / 330679773) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 241 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0241 : Poly :=
[
  term ((-1901724160 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((950862080 : Rat) / 330679773) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0241
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0242 : Poly :=
[
  term ((66765220 : Rat) / 36742197) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 242 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0242 : Poly :=
[
  term ((133530440 : Rat) / 36742197) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-66765220 : Rat) / 36742197) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0242
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0243 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 243 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0243 : Poly :=
[
  term ((-17821440 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((8910720 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0243
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0244 : Poly :=
[
  term ((-185137040 : Rat) / 330679773) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 244 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0244 : Poly :=
[
  term ((-370274080 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((185137040 : Rat) / 330679773) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0244
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0245 : Poly :=
[
  term ((1583041120 : Rat) / 330679773) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0245 : Poly :=
[
  term ((3166082240 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1583041120 : Rat) / 330679773) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0245
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0246 : Poly :=
[
  term ((-823244140 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 246 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0246 : Poly :=
[
  term ((-1646488280 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((823244140 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0246
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0247 : Poly :=
[
  term ((7313600 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 247 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0247 : Poly :=
[
  term ((14627200 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((-7313600 : Rat) / 12247399) [(2, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0247
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0248 : Poly :=
[
  term ((-25130840 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)]
]

/-- Partial product 248 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0248 : Poly :=
[
  term ((-50261680 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((25130840 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0248
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0249 : Poly :=
[
  term ((-94503680 : Rat) / 110226591) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 249 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0249 : Poly :=
[
  term ((-189007360 : Rat) / 110226591) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((94503680 : Rat) / 110226591) [(2, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0249
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0250 : Poly :=
[
  term ((857473840 : Rat) / 330679773) [(2, 1), (15, 2)]
]

/-- Partial product 250 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0250 : Poly :=
[
  term ((1714947680 : Rat) / 330679773) [(2, 1), (6, 1), (15, 2)],
  term ((-857473840 : Rat) / 330679773) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0250
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0251 : Poly :=
[
  term ((317542400 : Rat) / 110226591) [(2, 2), (11, 1), (15, 1)]
]

/-- Partial product 251 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0251 : Poly :=
[
  term ((635084800 : Rat) / 110226591) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-317542400 : Rat) / 110226591) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0251
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0252 : Poly :=
[
  term ((14884800 : Rat) / 12247399) [(2, 2), (13, 1), (15, 1)]
]

/-- Partial product 252 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0252 : Poly :=
[
  term ((29769600 : Rat) / 12247399) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0252
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0253 : Poly :=
[
  term ((-286355200 : Rat) / 110226591) [(2, 2), (15, 2)]
]

/-- Partial product 253 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0253 : Poly :=
[
  term ((-572710400 : Rat) / 110226591) [(2, 2), (6, 1), (15, 2)],
  term ((286355200 : Rat) / 110226591) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0253
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0254 : Poly :=
[
  term ((479924480 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 254 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0254 : Poly :=
[
  term ((959848960 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-479924480 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0254
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0255 : Poly :=
[
  term ((671390720 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 255 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0255 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-671390720 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0255
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0256 : Poly :=
[
  term ((1619537920 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 256 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0256 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((-1619537920 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0256
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0257 : Poly :=
[
  term ((10490480 : Rat) / 12247399) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 257 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0257 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-10490480 : Rat) / 12247399) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0257
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0258 : Poly :=
[
  term ((-605450560 : Rat) / 330679773) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 258 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0258 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((605450560 : Rat) / 330679773) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0258
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0259 : Poly :=
[
  term ((7498820 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 259 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0259 : Poly :=
[
  term ((14997640 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-7498820 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0259
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0260 : Poly :=
[
  term ((25305280 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 260 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0260 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-25305280 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0260
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0261 : Poly :=
[
  term ((-1460476160 : Rat) / 330679773) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 261 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0261 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((1460476160 : Rat) / 330679773) [(3, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0261
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0262 : Poly :=
[
  term ((-432789040 : Rat) / 330679773) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 262 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0262 : Poly :=
[
  term ((-865578080 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((432789040 : Rat) / 330679773) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0262
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0263 : Poly :=
[
  term ((-180669440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 263 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0263 : Poly :=
[
  term ((180669440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1)],
  term ((-361338880 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0263
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0264 : Poly :=
[
  term ((-520253440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 264 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0264 : Poly :=
[
  term ((520253440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-1040506880 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0264
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0265 : Poly :=
[
  term ((1727559680 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 265 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0265 : Poly :=
[
  term ((-1727559680 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((3455119360 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0265
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0266 : Poly :=
[
  term ((-8128960 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 266 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0266 : Poly :=
[
  term ((8128960 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-16257920 : Rat) / 12247399) [(3, 1), (6, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0266
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0267 : Poly :=
[
  term ((469157120 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 267 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0267 : Poly :=
[
  term ((-469157120 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((938314240 : Rat) / 330679773) [(3, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0267
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0268 : Poly :=
[
  term ((-2822960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 268 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0268 : Poly :=
[
  term ((2822960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1)],
  term ((-5645920 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0268
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0269 : Poly :=
[
  term ((26993120 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 269 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0269 : Poly :=
[
  term ((-26993120 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((53986240 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0269
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0270 : Poly :=
[
  term ((-1557888640 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 270 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0270 : Poly :=
[
  term ((1557888640 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3115777280 : Rat) / 330679773) [(3, 1), (6, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0270
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0271 : Poly :=
[
  term ((162925120 : Rat) / 330679773) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 271 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0271 : Poly :=
[
  term ((-162925120 : Rat) / 330679773) [(3, 1), (6, 1), (15, 1)],
  term ((325850240 : Rat) / 330679773) [(3, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0271
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0272 : Poly :=
[
  term ((414937600 : Rat) / 330679773) [(3, 1), (11, 1)]
]

/-- Partial product 272 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0272 : Poly :=
[
  term ((829875200 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1)],
  term ((-414937600 : Rat) / 330679773) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0272
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0273 : Poly :=
[
  term ((-3191856640 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 273 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0273 : Poly :=
[
  term ((-6383713280 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((3191856640 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0273
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0274 : Poly :=
[
  term ((1403073280 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 274 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0274 : Poly :=
[
  term ((2806146560 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1403073280 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0274
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0275 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(3, 1), (11, 1), (12, 2)]
]

/-- Partial product 275 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0275 : Poly :=
[
  term ((126730240 : Rat) / 36742197) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0275
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0276 : Poly :=
[
  term ((281093120 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 276 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0276 : Poly :=
[
  term ((562186240 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-281093120 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0276
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0277 : Poly :=
[
  term ((-49872760 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 277 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0277 : Poly :=
[
  term ((-99745520 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((49872760 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0277
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0278 : Poly :=
[
  term ((21923020 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 278 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0278 : Poly :=
[
  term ((43846040 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21923020 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0278
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0279 : Poly :=
[
  term ((-1265271440 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 279 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0279 : Poly :=
[
  term ((-2530542880 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((1265271440 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0279
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0280 : Poly :=
[
  term ((2878370720 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 280 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0280 : Poly :=
[
  term ((5756741440 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2878370720 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0280
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0281 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)]
]

/-- Partial product 281 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0281 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0281
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0282 : Poly :=
[
  term ((-57141760 : Rat) / 36742197) [(3, 1), (12, 2), (15, 1)]
]

/-- Partial product 282 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0282 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(3, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0282
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0283 : Poly :=
[
  term ((6483400 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 283 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0283 : Poly :=
[
  term ((12966800 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1)],
  term ((-6483400 : Rat) / 12247399) [(3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0283
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0284 : Poly :=
[
  term ((4392080 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 284 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0284 : Poly :=
[
  term ((8784160 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-4392080 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0284
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0285 : Poly :=
[
  term ((-253485760 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 285 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0285 : Poly :=
[
  term ((-506971520 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((253485760 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0285
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0286 : Poly :=
[
  term ((-374184800 : Rat) / 330679773) [(3, 1), (15, 1)]
]

/-- Partial product 286 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0286 : Poly :=
[
  term ((-748369600 : Rat) / 330679773) [(3, 1), (6, 1), (15, 1)],
  term ((374184800 : Rat) / 330679773) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0286
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0287 : Poly :=
[
  term ((-457 : Rat) / 536) [(4, 1)]
]

/-- Partial product 287 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0287 : Poly :=
[
  term ((457 : Rat) / 536) [(4, 1)],
  term ((-457 : Rat) / 268) [(4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0287
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0288 : Poly :=
[
  term ((243 : Rat) / 134) [(4, 1), (7, 1), (9, 1)]
]

/-- Partial product 288 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0288 : Poly :=
[
  term ((243 : Rat) / 67) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-243 : Rat) / 134) [(4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0288
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0289 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0289 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0289
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0290 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0290 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((34264938442 : Rat) / 5817514525) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0290
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0291 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0291 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0291_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0291
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0292 : Poly :=
[
  term ((-641398435328 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 292 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0292 : Poly :=
[
  term ((-1282796870656 : Rat) / 31414578435) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((641398435328 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0292_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0292
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0293 : Poly :=
[
  term ((-10021850552 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

/-- Partial product 293 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0293 : Poly :=
[
  term ((-20043701104 : Rat) / 1163502905) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((10021850552 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0293_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0293
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0294 : Poly :=
[
  term ((578403946144 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 294 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0294 : Poly :=
[
  term ((1156807892288 : Rat) / 31414578435) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-578403946144 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0294_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0294
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0295 : Poly :=
[
  term ((-15149450103352 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 295 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0295 : Poly :=
[
  term ((-30298900206704 : Rat) / 471218676525) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((15149450103352 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0295_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0295
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0296 : Poly :=
[
  term ((13162601984 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 296 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0296 : Poly :=
[
  term ((26325203968 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-13162601984 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0296_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0296
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0297 : Poly :=
[
  term ((-6702080 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 297 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0297 : Poly :=
[
  term ((-13404160 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((6702080 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0297_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0297
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0298 : Poly :=
[
  term ((5335775872 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 298 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0298 : Poly :=
[
  term ((10671551744 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-5335775872 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0298_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0298
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 16. -/
def rs_R009_ueqv_R009NNNYN_coefficient_16_0299 : Poly :=
[
  term ((-40386560 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 299 for generator 16. -/
def rs_R009_ueqv_R009NNNYN_partial_16_0299 : Poly :=
[
  term ((-80773120 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((40386560 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 16. -/
theorem rs_R009_ueqv_R009NNNYN_partial_16_0299_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_16_0299
        rs_R009_ueqv_R009NNNYN_generator_16_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_16_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_16_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_16_0200,
  rs_R009_ueqv_R009NNNYN_partial_16_0201,
  rs_R009_ueqv_R009NNNYN_partial_16_0202,
  rs_R009_ueqv_R009NNNYN_partial_16_0203,
  rs_R009_ueqv_R009NNNYN_partial_16_0204,
  rs_R009_ueqv_R009NNNYN_partial_16_0205,
  rs_R009_ueqv_R009NNNYN_partial_16_0206,
  rs_R009_ueqv_R009NNNYN_partial_16_0207,
  rs_R009_ueqv_R009NNNYN_partial_16_0208,
  rs_R009_ueqv_R009NNNYN_partial_16_0209,
  rs_R009_ueqv_R009NNNYN_partial_16_0210,
  rs_R009_ueqv_R009NNNYN_partial_16_0211,
  rs_R009_ueqv_R009NNNYN_partial_16_0212,
  rs_R009_ueqv_R009NNNYN_partial_16_0213,
  rs_R009_ueqv_R009NNNYN_partial_16_0214,
  rs_R009_ueqv_R009NNNYN_partial_16_0215,
  rs_R009_ueqv_R009NNNYN_partial_16_0216,
  rs_R009_ueqv_R009NNNYN_partial_16_0217,
  rs_R009_ueqv_R009NNNYN_partial_16_0218,
  rs_R009_ueqv_R009NNNYN_partial_16_0219,
  rs_R009_ueqv_R009NNNYN_partial_16_0220,
  rs_R009_ueqv_R009NNNYN_partial_16_0221,
  rs_R009_ueqv_R009NNNYN_partial_16_0222,
  rs_R009_ueqv_R009NNNYN_partial_16_0223,
  rs_R009_ueqv_R009NNNYN_partial_16_0224,
  rs_R009_ueqv_R009NNNYN_partial_16_0225,
  rs_R009_ueqv_R009NNNYN_partial_16_0226,
  rs_R009_ueqv_R009NNNYN_partial_16_0227,
  rs_R009_ueqv_R009NNNYN_partial_16_0228,
  rs_R009_ueqv_R009NNNYN_partial_16_0229,
  rs_R009_ueqv_R009NNNYN_partial_16_0230,
  rs_R009_ueqv_R009NNNYN_partial_16_0231,
  rs_R009_ueqv_R009NNNYN_partial_16_0232,
  rs_R009_ueqv_R009NNNYN_partial_16_0233,
  rs_R009_ueqv_R009NNNYN_partial_16_0234,
  rs_R009_ueqv_R009NNNYN_partial_16_0235,
  rs_R009_ueqv_R009NNNYN_partial_16_0236,
  rs_R009_ueqv_R009NNNYN_partial_16_0237,
  rs_R009_ueqv_R009NNNYN_partial_16_0238,
  rs_R009_ueqv_R009NNNYN_partial_16_0239,
  rs_R009_ueqv_R009NNNYN_partial_16_0240,
  rs_R009_ueqv_R009NNNYN_partial_16_0241,
  rs_R009_ueqv_R009NNNYN_partial_16_0242,
  rs_R009_ueqv_R009NNNYN_partial_16_0243,
  rs_R009_ueqv_R009NNNYN_partial_16_0244,
  rs_R009_ueqv_R009NNNYN_partial_16_0245,
  rs_R009_ueqv_R009NNNYN_partial_16_0246,
  rs_R009_ueqv_R009NNNYN_partial_16_0247,
  rs_R009_ueqv_R009NNNYN_partial_16_0248,
  rs_R009_ueqv_R009NNNYN_partial_16_0249,
  rs_R009_ueqv_R009NNNYN_partial_16_0250,
  rs_R009_ueqv_R009NNNYN_partial_16_0251,
  rs_R009_ueqv_R009NNNYN_partial_16_0252,
  rs_R009_ueqv_R009NNNYN_partial_16_0253,
  rs_R009_ueqv_R009NNNYN_partial_16_0254,
  rs_R009_ueqv_R009NNNYN_partial_16_0255,
  rs_R009_ueqv_R009NNNYN_partial_16_0256,
  rs_R009_ueqv_R009NNNYN_partial_16_0257,
  rs_R009_ueqv_R009NNNYN_partial_16_0258,
  rs_R009_ueqv_R009NNNYN_partial_16_0259,
  rs_R009_ueqv_R009NNNYN_partial_16_0260,
  rs_R009_ueqv_R009NNNYN_partial_16_0261,
  rs_R009_ueqv_R009NNNYN_partial_16_0262,
  rs_R009_ueqv_R009NNNYN_partial_16_0263,
  rs_R009_ueqv_R009NNNYN_partial_16_0264,
  rs_R009_ueqv_R009NNNYN_partial_16_0265,
  rs_R009_ueqv_R009NNNYN_partial_16_0266,
  rs_R009_ueqv_R009NNNYN_partial_16_0267,
  rs_R009_ueqv_R009NNNYN_partial_16_0268,
  rs_R009_ueqv_R009NNNYN_partial_16_0269,
  rs_R009_ueqv_R009NNNYN_partial_16_0270,
  rs_R009_ueqv_R009NNNYN_partial_16_0271,
  rs_R009_ueqv_R009NNNYN_partial_16_0272,
  rs_R009_ueqv_R009NNNYN_partial_16_0273,
  rs_R009_ueqv_R009NNNYN_partial_16_0274,
  rs_R009_ueqv_R009NNNYN_partial_16_0275,
  rs_R009_ueqv_R009NNNYN_partial_16_0276,
  rs_R009_ueqv_R009NNNYN_partial_16_0277,
  rs_R009_ueqv_R009NNNYN_partial_16_0278,
  rs_R009_ueqv_R009NNNYN_partial_16_0279,
  rs_R009_ueqv_R009NNNYN_partial_16_0280,
  rs_R009_ueqv_R009NNNYN_partial_16_0281,
  rs_R009_ueqv_R009NNNYN_partial_16_0282,
  rs_R009_ueqv_R009NNNYN_partial_16_0283,
  rs_R009_ueqv_R009NNNYN_partial_16_0284,
  rs_R009_ueqv_R009NNNYN_partial_16_0285,
  rs_R009_ueqv_R009NNNYN_partial_16_0286,
  rs_R009_ueqv_R009NNNYN_partial_16_0287,
  rs_R009_ueqv_R009NNNYN_partial_16_0288,
  rs_R009_ueqv_R009NNNYN_partial_16_0289,
  rs_R009_ueqv_R009NNNYN_partial_16_0290,
  rs_R009_ueqv_R009NNNYN_partial_16_0291,
  rs_R009_ueqv_R009NNNYN_partial_16_0292,
  rs_R009_ueqv_R009NNNYN_partial_16_0293,
  rs_R009_ueqv_R009NNNYN_partial_16_0294,
  rs_R009_ueqv_R009NNNYN_partial_16_0295,
  rs_R009_ueqv_R009NNNYN_partial_16_0296,
  rs_R009_ueqv_R009NNNYN_partial_16_0297,
  rs_R009_ueqv_R009NNNYN_partial_16_0298,
  rs_R009_ueqv_R009NNNYN_partial_16_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_16_0200_0299 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-33554080 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((1936549760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((67386200 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((50610560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3889146400 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (15, 3)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((16777040 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-968274880 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-33693100 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)],
  term ((-25305280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((1460476160 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((1944573200 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)],
  term ((612505600 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((2054635520 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-3455119360 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((32103680 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1852840960 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((9570400 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((-53986240 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((3115777280 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-552348800 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-3044446720 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((119490560 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-100925440 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((16803360 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-107754880 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-47569480 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-14192640 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((91013120 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((2745438560 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((-126730240 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((410600960 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1443205120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-3216747520 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1901724160 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((133530440 : Rat) / 36742197) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17821440 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((-370274080 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((3166082240 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2103751640 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((22550080 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((-50261680 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((1714947680 : Rat) / 330679773) [(2, 1), (6, 1), (15, 2)],
  term ((-167444480 : Rat) / 110226591) [(2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-7848960 : Rat) / 12247399) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((150999040 : Rat) / 110226591) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-37560320 : Rat) / 12247399) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((33871360 : Rat) / 12247399) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-15845760 : Rat) / 12247399) [(2, 1), (6, 2), (13, 2)],
  term ((-306252800 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1)],
  term ((-1027317760 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((1727559680 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-16051840 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((926420480 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4785200 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((26993120 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1557888640 : Rat) / 330679773) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((276174400 : Rat) / 330679773) [(2, 1), (7, 1), (15, 1)],
  term ((1647806720 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)],
  term ((-59745280 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((50462720 : Rat) / 36742197) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((209592320 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-8401680 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((53877440 : Rat) / 36742197) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((25746980 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)],
  term ((7096320 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((9824640 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-45506560 : Rat) / 36742197) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1485968560 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)],
  term ((-189007360 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)],
  term ((63365120 : Rat) / 36742197) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-205300480 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-468070400 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)],
  term ((1608373760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-104796160 : Rat) / 110226591) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((950862080 : Rat) / 330679773) [(2, 1), (11, 1), (15, 1)],
  term ((-66765220 : Rat) / 36742197) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2)],
  term ((185137040 : Rat) / 330679773) [(2, 1), (12, 1), (15, 2)],
  term ((-1583041120 : Rat) / 330679773) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((823244140 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)],
  term ((-7313600 : Rat) / 12247399) [(2, 1), (13, 2)],
  term ((25130840 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)],
  term ((94503680 : Rat) / 110226591) [(2, 1), (14, 1), (15, 2)],
  term ((-857473840 : Rat) / 330679773) [(2, 1), (15, 2)],
  term ((635084800 : Rat) / 110226591) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((29769600 : Rat) / 12247399) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-572710400 : Rat) / 110226591) [(2, 2), (6, 1), (15, 2)],
  term ((-317542400 : Rat) / 110226591) [(2, 2), (11, 1), (15, 1)],
  term ((-14884800 : Rat) / 12247399) [(2, 2), (13, 1), (15, 1)],
  term ((286355200 : Rat) / 110226591) [(2, 2), (15, 2)],
  term ((959848960 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((1342781440 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((3239075840 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1)],
  term ((20980960 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1210901120 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1)],
  term ((14997640 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((50610560 : Rat) / 12247399) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2920952320 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1)],
  term ((-865578080 : Rat) / 330679773) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-479924480 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1)],
  term ((-671390720 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-1619537920 : Rat) / 330679773) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-10490480 : Rat) / 12247399) [(3, 1), (4, 1), (12, 1), (13, 1)],
  term ((605450560 : Rat) / 330679773) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-7498820 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)],
  term ((-25305280 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((1460476160 : Rat) / 330679773) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((432789040 : Rat) / 330679773) [(3, 1), (4, 1), (15, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (6, 1), (11, 1)],
  term ((-5863459840 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((2806146560 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-91616560 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((43846040 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2530542880 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((5287584320 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (6, 1), (13, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (6, 1), (15, 1)],
  term ((-361338880 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1)],
  term ((-1040506880 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((3455119360 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-16257920 : Rat) / 12247399) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((938314240 : Rat) / 330679773) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-5645920 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1)],
  term ((53986240 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-3115777280 : Rat) / 330679773) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((325850240 : Rat) / 330679773) [(3, 1), (6, 2), (15, 1)],
  term ((-414937600 : Rat) / 330679773) [(3, 1), (11, 1)],
  term ((3191856640 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)],
  term ((-1403073280 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (11, 1), (12, 2)],
  term ((-281093120 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)],
  term ((49872760 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)],
  term ((-21923020 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((1265271440 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2878370720 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(3, 1), (12, 2), (15, 1)],
  term ((-6483400 : Rat) / 12247399) [(3, 1), (13, 1)],
  term ((-4392080 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((253485760 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)],
  term ((374184800 : Rat) / 330679773) [(3, 1), (15, 1)],
  term ((457 : Rat) / 536) [(4, 1)],
  term ((-457 : Rat) / 268) [(4, 1), (6, 1)],
  term ((243 : Rat) / 67) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 1), (6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1282796870656 : Rat) / 31414578435) [(4, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-20043701104 : Rat) / 1163502905) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1)],
  term ((1156807892288 : Rat) / 31414578435) [(4, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-30298900206704 : Rat) / 471218676525) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((26325203968 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-13404160 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((10671551744 : Rat) / 330679773) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-80773120 : Rat) / 110226591) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-243 : Rat) / 134) [(4, 1), (7, 1), (9, 1)],
  term ((2192956060288 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34264938442 : Rat) / 5817514525) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2394874578674 : Rat) / 157072892175) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((641398435328 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (11, 1)],
  term ((10021850552 : Rat) / 1163502905) [(4, 1), (7, 1), (10, 1), (13, 1)],
  term ((-578403946144 : Rat) / 31414578435) [(4, 1), (7, 1), (10, 1), (15, 1)],
  term ((15149450103352 : Rat) / 471218676525) [(4, 1), (7, 1), (11, 1)],
  term ((-13162601984 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((6702080 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5335775872 : Rat) / 330679773) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((40386560 : Rat) / 110226591) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NNNYN_block_16_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_16_0200_0299
      rs_R009_ueqv_R009NNNYN_block_16_0200_0299 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
