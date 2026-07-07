/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:2200-2299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_2200_2299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 2200 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2200 : Poly :=
[
  term ((-2096 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2200 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2200 : Poly :=
[
  term ((2096 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4192 : Rat) / 7) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2200 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2200
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2200 := by
  native_decide

/-- Coefficient term 2201 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2201 : Poly :=
[
  term ((1392 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2201 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2201 : Poly :=
[
  term ((-1392 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2784 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2201 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2201
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2201 := by
  native_decide

/-- Coefficient term 2202 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2202 : Poly :=
[
  term ((-45861024 : Rat) / 53375) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 2202 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2202 : Poly :=
[
  term ((45861024 : Rat) / 53375) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-91722048 : Rat) / 53375) [(8, 2), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2202 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2202
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2202 := by
  native_decide

/-- Coefficient term 2203 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2203 : Poly :=
[
  term ((36864 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2203 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2203 : Poly :=
[
  term ((-36864 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((73728 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2203 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2203
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2203 := by
  native_decide

/-- Coefficient term 2204 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2204 : Poly :=
[
  term ((-12288 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2204 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2204 : Poly :=
[
  term ((12288 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-24576 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2204 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2204
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2204 := by
  native_decide

/-- Coefficient term 2205 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2205 : Poly :=
[
  term ((9984 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2205 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2205 : Poly :=
[
  term ((-9984 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((19968 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2205 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2205
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2205 := by
  native_decide

/-- Coefficient term 2206 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2206 : Poly :=
[
  term ((-1732 : Rat) / 5) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 2206 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2206 : Poly :=
[
  term ((1732 : Rat) / 5) [(8, 1), (9, 1), (13, 1)],
  term ((-3464 : Rat) / 5) [(8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2206 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2206
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2206 := by
  native_decide

/-- Coefficient term 2207 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2207 : Poly :=
[
  term ((1568 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2207 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2207 : Poly :=
[
  term ((-1568 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((3136 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2207 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2207
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2207 := by
  native_decide

/-- Coefficient term 2208 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2208 : Poly :=
[
  term ((-2 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2208 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2208 : Poly :=
[
  term ((2 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2208 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2208_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2208
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2208 := by
  native_decide

/-- Coefficient term 2209 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2209 : Poly :=
[
  term ((31352 : Rat) / 875) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 2209 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2209 : Poly :=
[
  term ((-31352 : Rat) / 875) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((62704 : Rat) / 875) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2209 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2209_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2209
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2209 := by
  native_decide

/-- Coefficient term 2210 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2210 : Poly :=
[
  term ((-1536 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2210 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2210 : Poly :=
[
  term ((1536 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2210 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2210_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2210
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2210 := by
  native_decide

/-- Coefficient term 2211 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2211 : Poly :=
[
  term ((512 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2211 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2211 : Poly :=
[
  term ((-512 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2211 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2211_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2211
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2211 := by
  native_decide

/-- Coefficient term 2212 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2212 : Poly :=
[
  term ((-416 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2212 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2212 : Poly :=
[
  term ((416 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2212 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2212_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2212
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2212 := by
  native_decide

/-- Coefficient term 2213 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2213 : Poly :=
[
  term ((9209 : Rat) / 420) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 2213 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2213 : Poly :=
[
  term ((-9209 : Rat) / 420) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((9209 : Rat) / 210) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2213 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2213_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2213
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2213 := by
  native_decide

/-- Coefficient term 2214 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2214 : Poly :=
[
  term ((-379 : Rat) / 140) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2214 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2214 : Poly :=
[
  term ((379 : Rat) / 140) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-379 : Rat) / 70) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2214 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2214_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2214
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2214 := by
  native_decide

/-- Coefficient term 2215 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2215 : Poly :=
[
  term ((-1277 : Rat) / 12) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 2215 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2215 : Poly :=
[
  term ((1277 : Rat) / 12) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1277 : Rat) / 6) [(8, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2215 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2215_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2215
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2215 := by
  native_decide

/-- Coefficient term 2216 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2216 : Poly :=
[
  term ((227 : Rat) / 20) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2216 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2216 : Poly :=
[
  term ((-227 : Rat) / 20) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((227 : Rat) / 10) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2216 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2216_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2216
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2216 := by
  native_decide

/-- Coefficient term 2217 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2217 : Poly :=
[
  term ((466832 : Rat) / 7625) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 2217 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2217 : Poly :=
[
  term ((-466832 : Rat) / 7625) [(8, 1), (10, 1), (13, 2)],
  term ((933664 : Rat) / 7625) [(8, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2217 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2217_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2217
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2217 := by
  native_decide

/-- Coefficient term 2218 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2218 : Poly :=
[
  term ((-384 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 2218 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2218 : Poly :=
[
  term ((384 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-768 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2218 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2218_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2218
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2218 := by
  native_decide

/-- Coefficient term 2219 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2219 : Poly :=
[
  term ((128 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2219 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2219 : Poly :=
[
  term ((-128 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((256 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2219 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2219_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2219
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2219 := by
  native_decide

/-- Coefficient term 2220 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2220 : Poly :=
[
  term ((-104 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 2220 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2220 : Poly :=
[
  term ((104 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2220 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2220_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2220
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2220 := by
  native_decide

/-- Coefficient term 2221 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2221 : Poly :=
[
  term ((2835192 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2221 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2221 : Poly :=
[
  term ((-2835192 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((5670384 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2221 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2221_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2221
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2221 := by
  native_decide

/-- Coefficient term 2222 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2222 : Poly :=
[
  term ((-2304 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2222 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2222 : Poly :=
[
  term ((2304 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2222 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2222_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2222
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2222 := by
  native_decide

/-- Coefficient term 2223 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2223 : Poly :=
[
  term ((768 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2223 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2223 : Poly :=
[
  term ((-768 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2223 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2223_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2223
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2223 := by
  native_decide

/-- Coefficient term 2224 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2224 : Poly :=
[
  term ((-624 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2224 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2224 : Poly :=
[
  term ((624 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2224 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2224_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2224
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2224 := by
  native_decide

/-- Coefficient term 2225 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2225 : Poly :=
[
  term ((-3617 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2225 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2225 : Poly :=
[
  term ((3617 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3617 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2225 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2225_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2225
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2225 := by
  native_decide

/-- Coefficient term 2226 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2226 : Poly :=
[
  term ((69 : Rat) / 28) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2226 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2226 : Poly :=
[
  term ((-69 : Rat) / 28) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((69 : Rat) / 14) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2226 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2226_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2226
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2226 := by
  native_decide

/-- Coefficient term 2227 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2227 : Poly :=
[
  term ((-677676 : Rat) / 53375) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 2227 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2227 : Poly :=
[
  term ((677676 : Rat) / 53375) [(8, 1), (11, 1), (13, 1)],
  term ((-1355352 : Rat) / 53375) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2227 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2227_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2227
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2227 := by
  native_decide

/-- Coefficient term 2228 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2228 : Poly :=
[
  term ((576 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2228 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2228 : Poly :=
[
  term ((-576 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1152 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2228 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2228_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2228
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2228 := by
  native_decide

/-- Coefficient term 2229 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2229 : Poly :=
[
  term ((-192 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2229 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2229 : Poly :=
[
  term ((192 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2229 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2229_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2229
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2229 := by
  native_decide

/-- Coefficient term 2230 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2230 : Poly :=
[
  term ((156 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2230 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2230 : Poly :=
[
  term ((-156 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((312 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2230 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2230_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2230
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2230 := by
  native_decide

/-- Coefficient term 2231 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2231 : Poly :=
[
  term ((2053 : Rat) / 105) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 2231 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2231 : Poly :=
[
  term ((-2053 : Rat) / 105) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((4106 : Rat) / 105) [(8, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2231 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2231_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2231
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2231 := by
  native_decide

/-- Coefficient term 2232 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2232 : Poly :=
[
  term ((-19 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2232 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2232 : Poly :=
[
  term ((19 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2232 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2232_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2232
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2232 := by
  native_decide

/-- Coefficient term 2233 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2233 : Poly :=
[
  term ((155296 : Rat) / 2135) [(8, 1), (11, 1), (13, 3)]
]

/-- Partial product 2233 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2233 : Poly :=
[
  term ((-155296 : Rat) / 2135) [(8, 1), (11, 1), (13, 3)],
  term ((310592 : Rat) / 2135) [(8, 2), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2233 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2233_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2233
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2233 := by
  native_decide

/-- Coefficient term 2234 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2234 : Poly :=
[
  term ((-3072 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1)]
]

/-- Partial product 2234 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2234 : Poly :=
[
  term ((3072 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-6144 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2234 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2234_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2234
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2234 := by
  native_decide

/-- Coefficient term 2235 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2235 : Poly :=
[
  term ((1024 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 2235 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2235 : Poly :=
[
  term ((-1024 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2235 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2235_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2235
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2235 := by
  native_decide

/-- Coefficient term 2236 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2236 : Poly :=
[
  term ((-832 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 2236 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2236 : Poly :=
[
  term ((832 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1664 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2236 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2236_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2236
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2236 := by
  native_decide

/-- Coefficient term 2237 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2237 : Poly :=
[
  term ((1112 : Rat) / 35) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 2237 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2237 : Poly :=
[
  term ((-1112 : Rat) / 35) [(8, 1), (11, 1), (15, 1)],
  term ((2224 : Rat) / 35) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2237 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2237_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2237
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2237 := by
  native_decide

/-- Coefficient term 2238 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2238 : Poly :=
[
  term ((-24 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2238 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2238 : Poly :=
[
  term ((24 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2238 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2238_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2238
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2238 := by
  native_decide

/-- Coefficient term 2239 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2239 : Poly :=
[
  term ((-2704 : Rat) / 21) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 2239 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2239 : Poly :=
[
  term ((2704 : Rat) / 21) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5408 : Rat) / 21) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2239 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2239_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2239
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2239 := by
  native_decide

/-- Coefficient term 2240 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2240 : Poly :=
[
  term ((496 : Rat) / 35) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2240 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2240 : Poly :=
[
  term ((-496 : Rat) / 35) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((992 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2240 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2240_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2240
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2240 := by
  native_decide

/-- Coefficient term 2241 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2241 : Poly :=
[
  term ((941872 : Rat) / 53375) [(8, 1), (11, 2), (13, 2)]
]

/-- Partial product 2241 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2241 : Poly :=
[
  term ((-941872 : Rat) / 53375) [(8, 1), (11, 2), (13, 2)],
  term ((1883744 : Rat) / 53375) [(8, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2241 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2241_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2241
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2241 := by
  native_decide

/-- Coefficient term 2242 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2242 : Poly :=
[
  term ((-768 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1)]
]

/-- Partial product 2242 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2242 : Poly :=
[
  term ((768 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2242 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2242_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2242
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2242 := by
  native_decide

/-- Coefficient term 2243 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2243 : Poly :=
[
  term ((256 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2243 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2243 : Poly :=
[
  term ((-256 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2243 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2243_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2243
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2243 := by
  native_decide

/-- Coefficient term 2244 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2244 : Poly :=
[
  term ((-208 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 2244 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2244 : Poly :=
[
  term ((208 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-416 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2244 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2244_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2244
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2244 := by
  native_decide

/-- Coefficient term 2245 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2245 : Poly :=
[
  term ((-6 : Rat) / 5) [(8, 1), (12, 1)]
]

/-- Partial product 2245 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2245 : Poly :=
[
  term ((6 : Rat) / 5) [(8, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(8, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2245 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2245_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2245
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2245 := by
  native_decide

/-- Coefficient term 2246 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2246 : Poly :=
[
  term ((13873 : Rat) / 210) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2246 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2246 : Poly :=
[
  term ((-13873 : Rat) / 210) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((13873 : Rat) / 105) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2246 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2246_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2246
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2246 := by
  native_decide

/-- Coefficient term 2247 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2247 : Poly :=
[
  term ((-523 : Rat) / 70) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2247 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2247 : Poly :=
[
  term ((523 : Rat) / 70) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 35) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2247 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2247_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2247
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2247 := by
  native_decide

/-- Coefficient term 2248 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2248 : Poly :=
[
  term ((5913704 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 2248 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2248 : Poly :=
[
  term ((-5913704 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((11827408 : Rat) / 53375) [(8, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2248 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2248_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2248
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2248 := by
  native_decide

/-- Coefficient term 2249 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2249 : Poly :=
[
  term ((-4608 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2249 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2249 : Poly :=
[
  term ((4608 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-9216 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2249 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2249_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2249
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2249 := by
  native_decide

/-- Coefficient term 2250 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2250 : Poly :=
[
  term ((1536 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2250 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2250 : Poly :=
[
  term ((-1536 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3072 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2250 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2250_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2250
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2250 := by
  native_decide

/-- Coefficient term 2251 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2251 : Poly :=
[
  term ((-1248 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2251 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2251 : Poly :=
[
  term ((1248 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2496 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2251 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2251_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2251
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2251 := by
  native_decide

/-- Coefficient term 2252 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2252 : Poly :=
[
  term ((6 : Rat) / 5) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 2252 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2252 : Poly :=
[
  term ((-6 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(8, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2252 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2252_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2252
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2252 := by
  native_decide

/-- Coefficient term 2253 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2253 : Poly :=
[
  term ((183403 : Rat) / 4200) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 2253 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2253 : Poly :=
[
  term ((-183403 : Rat) / 4200) [(8, 1), (13, 1), (15, 1)],
  term ((183403 : Rat) / 2100) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2253 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2253_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2253
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2253 := by
  native_decide

/-- Coefficient term 2254 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2254 : Poly :=
[
  term ((-1229 : Rat) / 280) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2254 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2254 : Poly :=
[
  term ((1229 : Rat) / 280) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1229 : Rat) / 140) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2254 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2254_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2254
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2254 := by
  native_decide

/-- Coefficient term 2255 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2255 : Poly :=
[
  term ((221772 : Rat) / 10675) [(8, 1), (13, 2)]
]

/-- Partial product 2255 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2255 : Poly :=
[
  term ((-221772 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((443544 : Rat) / 10675) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2255 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2255_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2255
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2255 := by
  native_decide

/-- Coefficient term 2256 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2256 : Poly :=
[
  term ((92 : Rat) / 35) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 2256 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2256 : Poly :=
[
  term ((-92 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((184 : Rat) / 35) [(8, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2256 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2256_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2256
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2256 := by
  native_decide

/-- Coefficient term 2257 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2257 : Poly :=
[
  term ((-1216 : Rat) / 35) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2257 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2257 : Poly :=
[
  term ((1216 : Rat) / 35) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2432 : Rat) / 35) [(8, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2257 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2257_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2257
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2257 := by
  native_decide

/-- Coefficient term 2258 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2258 : Poly :=
[
  term ((988 : Rat) / 35) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 2258 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2258 : Poly :=
[
  term ((-988 : Rat) / 35) [(8, 1), (13, 2), (16, 1)],
  term ((1976 : Rat) / 35) [(8, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2258 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2258_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2258
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2258 := by
  native_decide

/-- Coefficient term 2259 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2259 : Poly :=
[
  term ((9209 : Rat) / 105) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2259 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2259 : Poly :=
[
  term ((18418 : Rat) / 105) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2259 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2259_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2259
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2259 := by
  native_decide

/-- Coefficient term 2260 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2260 : Poly :=
[
  term ((-379 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2260 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2260 : Poly :=
[
  term ((-758 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((379 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2260 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2260_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2260
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2260 := by
  native_decide

/-- Coefficient term 2261 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2261 : Poly :=
[
  term ((125408 : Rat) / 875) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

/-- Partial product 2261 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2261 : Poly :=
[
  term ((250816 : Rat) / 875) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-125408 : Rat) / 875) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2261 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2261_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2261
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2261 := by
  native_decide

/-- Coefficient term 2262 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2262 : Poly :=
[
  term ((-6144 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2262 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2262 : Poly :=
[
  term ((-12288 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((6144 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2262 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2262_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2262
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2262 := by
  native_decide

/-- Coefficient term 2263 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2263 : Poly :=
[
  term ((2048 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2263 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2263 : Poly :=
[
  term ((4096 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2263 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2263_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2263
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2263 := by
  native_decide

/-- Coefficient term 2264 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2264 : Poly :=
[
  term ((-1664 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2264 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2264 : Poly :=
[
  term ((-3328 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2264 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2264_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2264
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2264 := by
  native_decide

/-- Coefficient term 2265 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2265 : Poly :=
[
  term ((-6103016 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 2265 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2265 : Poly :=
[
  term ((-12206032 : Rat) / 53375) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6103016 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2265 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2265_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2265
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2265 := by
  native_decide

/-- Coefficient term 2266 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2266 : Poly :=
[
  term ((4992 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2266 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2266 : Poly :=
[
  term ((9984 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4992 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2266 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2266_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2266
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2266 := by
  native_decide

/-- Coefficient term 2267 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2267 : Poly :=
[
  term ((-1664 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2267 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2267 : Poly :=
[
  term ((-3328 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2267 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2267_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2267
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2267 := by
  native_decide

/-- Coefficient term 2268 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2268 : Poly :=
[
  term ((1352 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2268 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2268 : Poly :=
[
  term ((2704 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2268 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2268_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2268
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2268 := by
  native_decide

/-- Coefficient term 2269 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2269 : Poly :=
[
  term ((27773 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 2269 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2269 : Poly :=
[
  term ((27773 : Rat) / 105) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-27773 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2269 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2269_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2269
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2269 := by
  native_decide

/-- Coefficient term 2270 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2270 : Poly :=
[
  term ((-967 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2270 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2270 : Poly :=
[
  term ((-967 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((967 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2270 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2270_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2270
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2270 := by
  native_decide

/-- Coefficient term 2271 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2271 : Poly :=
[
  term ((-2590148 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 2271 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2271 : Poly :=
[
  term ((-5180296 : Rat) / 53375) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2590148 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2271 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2271_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2271
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2271 := by
  native_decide

/-- Coefficient term 2272 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2272 : Poly :=
[
  term ((2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 2272 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2272 : Poly :=
[
  term ((4224 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2272 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2272_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2272
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2272 := by
  native_decide

/-- Coefficient term 2273 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2273 : Poly :=
[
  term ((-704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2273 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2273 : Poly :=
[
  term ((-1408 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2273 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2273_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2273
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2273 := by
  native_decide

/-- Coefficient term 2274 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2274 : Poly :=
[
  term ((572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2274 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2274 : Poly :=
[
  term ((1144 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2274 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2274_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2274
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2274 := by
  native_decide

/-- Coefficient term 2275 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2275 : Poly :=
[
  term ((31351 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 2275 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2275 : Poly :=
[
  term ((31351 : Rat) / 210) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-31351 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2275 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2275_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2275
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2275 := by
  native_decide

/-- Coefficient term 2276 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2276 : Poly :=
[
  term ((-1109 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2276 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2276 : Poly :=
[
  term ((-1109 : Rat) / 70) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1109 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2276 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2276_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2276
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2276 := by
  native_decide

/-- Coefficient term 2277 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2277 : Poly :=
[
  term ((-31352 : Rat) / 875) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 2277 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2277 : Poly :=
[
  term ((-62704 : Rat) / 875) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2277 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2277_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2277
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2277 := by
  native_decide

/-- Coefficient term 2278 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2278 : Poly :=
[
  term ((1536 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 2278 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2278 : Poly :=
[
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2278 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2278_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2278
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2278 := by
  native_decide

/-- Coefficient term 2279 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2279 : Poly :=
[
  term ((-512 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2279 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2279 : Poly :=
[
  term ((-1024 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2279 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2279_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2279
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2279 := by
  native_decide

/-- Coefficient term 2280 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2280 : Poly :=
[
  term ((416 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 2280 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2280 : Poly :=
[
  term ((832 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2280 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2280_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2280
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2280 := by
  native_decide

/-- Coefficient term 2281 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2281 : Poly :=
[
  term ((-9209 : Rat) / 420) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 2281 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2281 : Poly :=
[
  term ((-9209 : Rat) / 210) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2281 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2281_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2281
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2281 := by
  native_decide

/-- Coefficient term 2282 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2282 : Poly :=
[
  term ((379 : Rat) / 140) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 2282 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2282 : Poly :=
[
  term ((379 : Rat) / 70) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2282 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2282_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2282
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2282 := by
  native_decide

/-- Coefficient term 2283 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2283 : Poly :=
[
  term ((-2053 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2283 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2283 : Poly :=
[
  term ((-4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2053 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2283 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2283_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2283
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2283 := by
  native_decide

/-- Coefficient term 2284 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2284 : Poly :=
[
  term ((19 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2284 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2284 : Poly :=
[
  term ((38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2284 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2284_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2284
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2284 := by
  native_decide

/-- Coefficient term 2285 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2285 : Poly :=
[
  term ((-155296 : Rat) / 2135) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 2285 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2285 : Poly :=
[
  term ((-310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((155296 : Rat) / 2135) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2285 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2285_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2285
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2285 := by
  native_decide

/-- Coefficient term 2286 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2286 : Poly :=
[
  term ((3072 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2286 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2286 : Poly :=
[
  term ((6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2286 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2286_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2286
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2286 := by
  native_decide

/-- Coefficient term 2287 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2287 : Poly :=
[
  term ((-1024 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2287 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2287 : Poly :=
[
  term ((-2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2287 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2287_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2287
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2287 := by
  native_decide

/-- Coefficient term 2288 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2288 : Poly :=
[
  term ((832 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2288 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2288 : Poly :=
[
  term ((1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2288 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2288_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2288
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2288 := by
  native_decide

/-- Coefficient term 2289 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2289 : Poly :=
[
  term ((-2539 : Rat) / 15) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2289 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2289 : Poly :=
[
  term ((-5078 : Rat) / 15) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2539 : Rat) / 15) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2289 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2289_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2289
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2289 := by
  native_decide

/-- Coefficient term 2290 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2290 : Poly :=
[
  term ((113 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2290 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2290 : Poly :=
[
  term ((226 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-113 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2290 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2290_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2290
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2290 := by
  native_decide

/-- Coefficient term 2291 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2291 : Poly :=
[
  term ((-3830416 : Rat) / 7625) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 2291 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2291 : Poly :=
[
  term ((-7660832 : Rat) / 7625) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((3830416 : Rat) / 7625) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2291 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2291_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2291
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2291 := by
  native_decide

/-- Coefficient term 2292 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2292 : Poly :=
[
  term ((3072 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2292 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2292 : Poly :=
[
  term ((6144 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2292 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2292_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2292
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2292 := by
  native_decide

/-- Coefficient term 2293 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2293 : Poly :=
[
  term ((-1024 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2293 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2293 : Poly :=
[
  term ((-2048 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2293 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2293_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2293
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2293 := by
  native_decide

/-- Coefficient term 2294 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2294 : Poly :=
[
  term ((832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2294 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2294 : Poly :=
[
  term ((1664 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2294 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2294_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2294
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2294 := by
  native_decide

/-- Coefficient term 2295 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2295 : Poly :=
[
  term ((-1718352 : Rat) / 10675) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

/-- Partial product 2295 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2295 : Poly :=
[
  term ((-3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2295 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2295_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2295
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2295 := by
  native_decide

/-- Coefficient term 2296 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2296 : Poly :=
[
  term ((6912 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2296 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2296 : Poly :=
[
  term ((13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2296 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2296_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2296
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2296 := by
  native_decide

/-- Coefficient term 2297 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2297 : Poly :=
[
  term ((-2304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2297 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2297 : Poly :=
[
  term ((-4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2297 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2297_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2297
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2297 := by
  native_decide

/-- Coefficient term 2298 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2298 : Poly :=
[
  term ((1872 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2298 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2298 : Poly :=
[
  term ((3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2298 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2298_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2298
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2298 := by
  native_decide

/-- Coefficient term 2299 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2299 : Poly :=
[
  term ((1437 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 2299 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2299 : Poly :=
[
  term ((2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2299 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2299_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2299
        rs_R003_ueqv_R003YY_generator_19_2200_2299 =
      rs_R003_ueqv_R003YY_partial_19_2299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_2200_2299 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_2200,
  rs_R003_ueqv_R003YY_partial_19_2201,
  rs_R003_ueqv_R003YY_partial_19_2202,
  rs_R003_ueqv_R003YY_partial_19_2203,
  rs_R003_ueqv_R003YY_partial_19_2204,
  rs_R003_ueqv_R003YY_partial_19_2205,
  rs_R003_ueqv_R003YY_partial_19_2206,
  rs_R003_ueqv_R003YY_partial_19_2207,
  rs_R003_ueqv_R003YY_partial_19_2208,
  rs_R003_ueqv_R003YY_partial_19_2209,
  rs_R003_ueqv_R003YY_partial_19_2210,
  rs_R003_ueqv_R003YY_partial_19_2211,
  rs_R003_ueqv_R003YY_partial_19_2212,
  rs_R003_ueqv_R003YY_partial_19_2213,
  rs_R003_ueqv_R003YY_partial_19_2214,
  rs_R003_ueqv_R003YY_partial_19_2215,
  rs_R003_ueqv_R003YY_partial_19_2216,
  rs_R003_ueqv_R003YY_partial_19_2217,
  rs_R003_ueqv_R003YY_partial_19_2218,
  rs_R003_ueqv_R003YY_partial_19_2219,
  rs_R003_ueqv_R003YY_partial_19_2220,
  rs_R003_ueqv_R003YY_partial_19_2221,
  rs_R003_ueqv_R003YY_partial_19_2222,
  rs_R003_ueqv_R003YY_partial_19_2223,
  rs_R003_ueqv_R003YY_partial_19_2224,
  rs_R003_ueqv_R003YY_partial_19_2225,
  rs_R003_ueqv_R003YY_partial_19_2226,
  rs_R003_ueqv_R003YY_partial_19_2227,
  rs_R003_ueqv_R003YY_partial_19_2228,
  rs_R003_ueqv_R003YY_partial_19_2229,
  rs_R003_ueqv_R003YY_partial_19_2230,
  rs_R003_ueqv_R003YY_partial_19_2231,
  rs_R003_ueqv_R003YY_partial_19_2232,
  rs_R003_ueqv_R003YY_partial_19_2233,
  rs_R003_ueqv_R003YY_partial_19_2234,
  rs_R003_ueqv_R003YY_partial_19_2235,
  rs_R003_ueqv_R003YY_partial_19_2236,
  rs_R003_ueqv_R003YY_partial_19_2237,
  rs_R003_ueqv_R003YY_partial_19_2238,
  rs_R003_ueqv_R003YY_partial_19_2239,
  rs_R003_ueqv_R003YY_partial_19_2240,
  rs_R003_ueqv_R003YY_partial_19_2241,
  rs_R003_ueqv_R003YY_partial_19_2242,
  rs_R003_ueqv_R003YY_partial_19_2243,
  rs_R003_ueqv_R003YY_partial_19_2244,
  rs_R003_ueqv_R003YY_partial_19_2245,
  rs_R003_ueqv_R003YY_partial_19_2246,
  rs_R003_ueqv_R003YY_partial_19_2247,
  rs_R003_ueqv_R003YY_partial_19_2248,
  rs_R003_ueqv_R003YY_partial_19_2249,
  rs_R003_ueqv_R003YY_partial_19_2250,
  rs_R003_ueqv_R003YY_partial_19_2251,
  rs_R003_ueqv_R003YY_partial_19_2252,
  rs_R003_ueqv_R003YY_partial_19_2253,
  rs_R003_ueqv_R003YY_partial_19_2254,
  rs_R003_ueqv_R003YY_partial_19_2255,
  rs_R003_ueqv_R003YY_partial_19_2256,
  rs_R003_ueqv_R003YY_partial_19_2257,
  rs_R003_ueqv_R003YY_partial_19_2258,
  rs_R003_ueqv_R003YY_partial_19_2259,
  rs_R003_ueqv_R003YY_partial_19_2260,
  rs_R003_ueqv_R003YY_partial_19_2261,
  rs_R003_ueqv_R003YY_partial_19_2262,
  rs_R003_ueqv_R003YY_partial_19_2263,
  rs_R003_ueqv_R003YY_partial_19_2264,
  rs_R003_ueqv_R003YY_partial_19_2265,
  rs_R003_ueqv_R003YY_partial_19_2266,
  rs_R003_ueqv_R003YY_partial_19_2267,
  rs_R003_ueqv_R003YY_partial_19_2268,
  rs_R003_ueqv_R003YY_partial_19_2269,
  rs_R003_ueqv_R003YY_partial_19_2270,
  rs_R003_ueqv_R003YY_partial_19_2271,
  rs_R003_ueqv_R003YY_partial_19_2272,
  rs_R003_ueqv_R003YY_partial_19_2273,
  rs_R003_ueqv_R003YY_partial_19_2274,
  rs_R003_ueqv_R003YY_partial_19_2275,
  rs_R003_ueqv_R003YY_partial_19_2276,
  rs_R003_ueqv_R003YY_partial_19_2277,
  rs_R003_ueqv_R003YY_partial_19_2278,
  rs_R003_ueqv_R003YY_partial_19_2279,
  rs_R003_ueqv_R003YY_partial_19_2280,
  rs_R003_ueqv_R003YY_partial_19_2281,
  rs_R003_ueqv_R003YY_partial_19_2282,
  rs_R003_ueqv_R003YY_partial_19_2283,
  rs_R003_ueqv_R003YY_partial_19_2284,
  rs_R003_ueqv_R003YY_partial_19_2285,
  rs_R003_ueqv_R003YY_partial_19_2286,
  rs_R003_ueqv_R003YY_partial_19_2287,
  rs_R003_ueqv_R003YY_partial_19_2288,
  rs_R003_ueqv_R003YY_partial_19_2289,
  rs_R003_ueqv_R003YY_partial_19_2290,
  rs_R003_ueqv_R003YY_partial_19_2291,
  rs_R003_ueqv_R003YY_partial_19_2292,
  rs_R003_ueqv_R003YY_partial_19_2293,
  rs_R003_ueqv_R003YY_partial_19_2294,
  rs_R003_ueqv_R003YY_partial_19_2295,
  rs_R003_ueqv_R003YY_partial_19_2296,
  rs_R003_ueqv_R003YY_partial_19_2297,
  rs_R003_ueqv_R003YY_partial_19_2298,
  rs_R003_ueqv_R003YY_partial_19_2299
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_2200_2299 : Poly :=
[
  term ((18418 : Rat) / 105) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-758 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((250816 : Rat) / 875) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-12288 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((4096 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3328 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-12206032 : Rat) / 53375) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((9984 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3328 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2704 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((27773 : Rat) / 105) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-967 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5180296 : Rat) / 53375) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((31351 : Rat) / 210) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1109 : Rat) / 70) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62704 : Rat) / 875) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((3072 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-1024 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 210) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((379 : Rat) / 70) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4106 : Rat) / 105) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((38 : Rat) / 7) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-310592 : Rat) / 2135) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3436704 : Rat) / 10675) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((13824 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-4608 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3744 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((2874 : Rat) / 35) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((1732 : Rat) / 5) [(8, 1), (9, 1), (13, 1)],
  term ((-1568 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((2 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-31352 : Rat) / 875) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1536 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 35) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-9209 : Rat) / 420) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((379 : Rat) / 140) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1277 : Rat) / 12) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-227 : Rat) / 20) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-466832 : Rat) / 7625) [(8, 1), (10, 1), (13, 2)],
  term ((384 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-128 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((104 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-2835192 : Rat) / 53375) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2304 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 35) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3617 : Rat) / 140) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-69 : Rat) / 28) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((677676 : Rat) / 53375) [(8, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-156 : Rat) / 35) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2053 : Rat) / 105) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((19 : Rat) / 7) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-155296 : Rat) / 2135) [(8, 1), (11, 1), (13, 3)],
  term ((3072 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-1024 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((832 : Rat) / 35) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1112 : Rat) / 35) [(8, 1), (11, 1), (15, 1)],
  term ((24 : Rat) / 7) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2704 : Rat) / 21) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-496 : Rat) / 35) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-941872 : Rat) / 53375) [(8, 1), (11, 2), (13, 2)],
  term ((768 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-256 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((208 : Rat) / 35) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((6 : Rat) / 5) [(8, 1), (12, 1)],
  term ((-13873 : Rat) / 210) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((523 : Rat) / 70) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5913704 : Rat) / 53375) [(8, 1), (12, 1), (13, 2)],
  term ((4608 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1248 : Rat) / 35) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6 : Rat) / 5) [(8, 1), (12, 1), (14, 1)],
  term ((-183403 : Rat) / 4200) [(8, 1), (13, 1), (15, 1)],
  term ((1229 : Rat) / 280) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-221772 : Rat) / 10675) [(8, 1), (13, 2)],
  term ((-92 : Rat) / 35) [(8, 1), (13, 2), (14, 1)],
  term ((1216 : Rat) / 35) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-988 : Rat) / 35) [(8, 1), (13, 2), (16, 1)],
  term ((-4192 : Rat) / 7) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2784 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91722048 : Rat) / 53375) [(8, 2), (9, 1), (11, 1), (13, 2)],
  term ((73728 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-24576 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((19968 : Rat) / 35) [(8, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3464 : Rat) / 5) [(8, 2), (9, 1), (13, 1)],
  term ((3136 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-4 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((62704 : Rat) / 875) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3072 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((9209 : Rat) / 210) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-379 : Rat) / 70) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1277 : Rat) / 6) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((227 : Rat) / 10) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((933664 : Rat) / 7625) [(8, 2), (10, 1), (13, 2)],
  term ((-768 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1)],
  term ((256 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(8, 2), (10, 1), (13, 2), (16, 1)],
  term ((5670384 : Rat) / 53375) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4608 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1536 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1248 : Rat) / 35) [(8, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3617 : Rat) / 70) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((69 : Rat) / 14) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1355352 : Rat) / 53375) [(8, 2), (11, 1), (13, 1)],
  term ((1152 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((312 : Rat) / 35) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((4106 : Rat) / 105) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-38 : Rat) / 7) [(8, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((310592 : Rat) / 2135) [(8, 2), (11, 1), (13, 3)],
  term ((-6144 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (14, 1)],
  term ((2048 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(8, 2), (11, 1), (13, 3), (16, 1)],
  term ((2224 : Rat) / 35) [(8, 2), (11, 1), (15, 1)],
  term ((-48 : Rat) / 7) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5408 : Rat) / 21) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((992 : Rat) / 35) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1883744 : Rat) / 53375) [(8, 2), (11, 2), (13, 2)],
  term ((-1536 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1)],
  term ((512 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(8, 2), (11, 2), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(8, 2), (12, 1)],
  term ((13873 : Rat) / 105) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-523 : Rat) / 35) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11827408 : Rat) / 53375) [(8, 2), (12, 1), (13, 2)],
  term ((-9216 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(8, 2), (12, 1), (13, 2), (16, 1)],
  term ((12 : Rat) / 5) [(8, 2), (12, 1), (14, 1)],
  term ((183403 : Rat) / 2100) [(8, 2), (13, 1), (15, 1)],
  term ((-1229 : Rat) / 140) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((443544 : Rat) / 10675) [(8, 2), (13, 2)],
  term ((184 : Rat) / 35) [(8, 2), (13, 2), (14, 1)],
  term ((-2432 : Rat) / 35) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((1976 : Rat) / 35) [(8, 2), (13, 2), (16, 1)],
  term ((-9209 : Rat) / 105) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((379 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125408 : Rat) / 875) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((6103016 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4992 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1664 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1352 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-27773 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((967 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2590148 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)],
  term ((-2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-31351 : Rat) / 420) [(9, 1), (10, 1), (15, 1)],
  term ((1109 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((31352 : Rat) / 875) [(9, 1), (10, 2), (13, 1)],
  term ((-1536 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((512 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 35) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((9209 : Rat) / 420) [(9, 1), (10, 2), (15, 1)],
  term ((-379 : Rat) / 140) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2053 : Rat) / 105) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-19 : Rat) / 7) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((155296 : Rat) / 2135) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3072 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((1024 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-832 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2539 : Rat) / 15) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-113 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3830416 : Rat) / 7625) [(9, 1), (11, 1), (13, 2)],
  term ((-3072 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1024 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-832 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1718352 : Rat) / 10675) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-6912 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1872 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1437 : Rat) / 35) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 2200 through 2299. -/
theorem rs_R003_ueqv_R003YY_block_19_2200_2299_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_2200_2299
      rs_R003_ueqv_R003YY_block_19_2200_2299 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
