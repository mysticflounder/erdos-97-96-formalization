/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 16:1200-1299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_16_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1200 : Poly :=
[
  term ((-17226 : Rat) / 7625) [(5, 1), (13, 1)]
]

/-- Partial product 1200 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1200 : Poly :=
[
  term ((-34452 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)],
  term ((17226 : Rat) / 7625) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1200_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1200
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1201 : Poly :=
[
  term ((11586 : Rat) / 7625) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 1201 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1201 : Poly :=
[
  term ((23172 : Rat) / 7625) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-11586 : Rat) / 7625) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1201_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1201
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1202 : Poly :=
[
  term ((-32832 : Rat) / 7625) [(5, 1), (13, 3)]
]

/-- Partial product 1202 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1202 : Poly :=
[
  term ((-65664 : Rat) / 7625) [(5, 1), (6, 1), (13, 3)],
  term ((32832 : Rat) / 7625) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1202_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1202
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1203 : Poly :=
[
  term ((6 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 1203 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1203 : Poly :=
[
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-6 : Rat) / 5) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1203_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1203
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1204 : Poly :=
[
  term ((-6 : Rat) / 5) [(5, 1), (15, 1)]
]

/-- Partial product 1204 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1204 : Poly :=
[
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (15, 1)],
  term ((6 : Rat) / 5) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1204_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1204
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1205 : Poly :=
[
  term ((-125 : Rat) / 2) [(6, 1)]
]

/-- Partial product 1205 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1205 : Poly :=
[
  term ((125 : Rat) / 2) [(6, 1)],
  term (-125 : Rat) [(6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1205_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1205
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1206 : Poly :=
[
  term ((-81 : Rat) / 10) [(6, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1206 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1206 : Poly :=
[
  term ((81 : Rat) / 10) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-81 : Rat) / 5) [(6, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1206_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1206
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1207 : Poly :=
[
  term ((9 : Rat) / 10) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1207 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1207 : Poly :=
[
  term ((-9 : Rat) / 10) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1207_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1207
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1208 : Poly :=
[
  term ((-616 : Rat) / 5) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 1208 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1208 : Poly :=
[
  term ((616 : Rat) / 5) [(6, 1), (9, 1), (11, 1)],
  term ((-1232 : Rat) / 5) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1208_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1208
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1209 : Poly :=
[
  term ((576 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1209 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1209 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1209_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1209
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1210 : Poly :=
[
  term ((-693 : Rat) / 25) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1210 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1210 : Poly :=
[
  term ((693 : Rat) / 25) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1386 : Rat) / 25) [(6, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1210_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1210
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1211 : Poly :=
[
  term ((9 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1211 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1211 : Poly :=
[
  term ((-9 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 5) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1211_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1211
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1212 : Poly :=
[
  term ((-510288 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 1212 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1212 : Poly :=
[
  term ((510288 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)],
  term ((-1020576 : Rat) / 53375) [(6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1212_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1212
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1213 : Poly :=
[
  term ((192 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1213 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1213 : Poly :=
[
  term ((-192 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1213_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1213
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1214 : Poly :=
[
  term ((-288 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1214 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1214 : Poly :=
[
  term ((288 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-576 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1214_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1214
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1215 : Poly :=
[
  term ((30 : Rat) / 7) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1215 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1215 : Poly :=
[
  term ((-30 : Rat) / 7) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1215_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1215
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1216 : Poly :=
[
  term ((-16867 : Rat) / 1400) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1216 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1216 : Poly :=
[
  term ((16867 : Rat) / 1400) [(6, 1), (9, 1), (15, 1)],
  term ((-16867 : Rat) / 700) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1216_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1216
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1217 : Poly :=
[
  term ((79 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1217 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1217 : Poly :=
[
  term ((-79 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((79 : Rat) / 140) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1217_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1217
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1218 : Poly :=
[
  term ((5472 : Rat) / 7625) [(6, 1), (10, 1), (13, 2)]
]

/-- Partial product 1218 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1218 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(6, 1), (10, 1), (13, 2)],
  term ((10944 : Rat) / 7625) [(6, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1218_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1218
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1219 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1219 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1219 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((19067264 : Rat) / 53375) [(6, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1219_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1219
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1220 : Poly :=
[
  term ((-1536 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1220 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1220 : Poly :=
[
  term ((1536 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3072 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1220_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1220
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1221 : Poly :=
[
  term ((512 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1221 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1221 : Poly :=
[
  term ((-512 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1221_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1221
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1222 : Poly :=
[
  term ((-416 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1222 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1222 : Poly :=
[
  term ((416 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1222_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1222
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1223 : Poly :=
[
  term ((12787 : Rat) / 105) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1223 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1223 : Poly :=
[
  term ((-12787 : Rat) / 105) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(6, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1223_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1223
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1224 : Poly :=
[
  term ((-521 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1224 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1224 : Poly :=
[
  term ((521 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1224_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1224
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1225 : Poly :=
[
  term ((-7150224 : Rat) / 53375) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 1225 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1225 : Poly :=
[
  term ((7150224 : Rat) / 53375) [(6, 1), (11, 1), (13, 1)],
  term ((-14300448 : Rat) / 53375) [(6, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1225_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1225
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1226 : Poly :=
[
  term ((1152 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1226 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1226 : Poly :=
[
  term ((-1152 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((2304 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1226_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1226
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1227 : Poly :=
[
  term ((-384 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1227 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1227 : Poly :=
[
  term ((384 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1227_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1227
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1228 : Poly :=
[
  term ((312 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1228 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1228 : Poly :=
[
  term ((-312 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((624 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1228_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1228
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1229 : Poly :=
[
  term ((-611 : Rat) / 7) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 1229 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1229 : Poly :=
[
  term ((611 : Rat) / 7) [(6, 1), (11, 1), (15, 1)],
  term ((-1222 : Rat) / 7) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1229_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1229
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1230 : Poly :=
[
  term ((75 : Rat) / 7) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1230 : Poly :=
[
  term ((-75 : Rat) / 7) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((150 : Rat) / 7) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1230_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1230
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1231 : Poly :=
[
  term ((314 : Rat) / 5) [(6, 1), (12, 1)]
]

/-- Partial product 1231 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1231 : Poly :=
[
  term ((-314 : Rat) / 5) [(6, 1), (12, 1)],
  term ((628 : Rat) / 5) [(6, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1231_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1231
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1232 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 1232 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1232 : Poly :=
[
  term ((20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2)],
  term ((-41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1232_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1232
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1233 : Poly :=
[
  term ((20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1233 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1233 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1233_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1233
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1234 : Poly :=
[
  term ((-276 : Rat) / 5) [(6, 1), (12, 1), (14, 1)]
]

/-- Partial product 1234 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1234 : Poly :=
[
  term ((276 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((-552 : Rat) / 5) [(6, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1234_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1234
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1235 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 1235 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1235 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(6, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1235_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1235
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1236 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1236 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1236 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1236_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1236
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1237 : Poly :=
[
  term ((-33 : Rat) / 20) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1237 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1237 : Poly :=
[
  term ((33 : Rat) / 20) [(6, 1), (13, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1237_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1237
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1238 : Poly :=
[
  term ((9 : Rat) / 20) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1238 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1238 : Poly :=
[
  term ((-9 : Rat) / 20) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1238_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1238
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1239 : Poly :=
[
  term ((15168 : Rat) / 7625) [(6, 1), (13, 2)]
]

/-- Partial product 1239 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1239 : Poly :=
[
  term ((-15168 : Rat) / 7625) [(6, 1), (13, 2)],
  term ((30336 : Rat) / 7625) [(6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1239_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1239
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1240 : Poly :=
[
  term ((-4872 : Rat) / 7625) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 1240 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1240 : Poly :=
[
  term ((4872 : Rat) / 7625) [(6, 1), (13, 2), (14, 1)],
  term ((-9744 : Rat) / 7625) [(6, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1240_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1240
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1241 : Poly :=
[
  term ((279 : Rat) / 5) [(6, 1), (14, 1)]
]

/-- Partial product 1241 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1241 : Poly :=
[
  term ((-279 : Rat) / 5) [(6, 1), (14, 1)],
  term ((558 : Rat) / 5) [(6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1241_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1241
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1242 : Poly :=
[
  term ((-9 : Rat) / 10) [(6, 1), (16, 1)]
]

/-- Partial product 1242 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1242 : Poly :=
[
  term ((9 : Rat) / 10) [(6, 1), (16, 1)],
  term ((-9 : Rat) / 5) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1242_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1242
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1243 : Poly :=
[
  term ((3 : Rat) / 5) [(7, 1), (9, 1)]
]

/-- Partial product 1243 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1243 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1243_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1243
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1244 : Poly :=
[
  term ((4766816 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 1244 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1244 : Poly :=
[
  term ((9533632 : Rat) / 53375) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-4766816 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1244_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1244
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1245 : Poly :=
[
  term ((-768 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1245 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1245 : Poly :=
[
  term ((-1536 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((768 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1245_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1245
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1246 : Poly :=
[
  term ((256 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1246 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1246 : Poly :=
[
  term ((512 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1246_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1246
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1247 : Poly :=
[
  term ((-208 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1247 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1247 : Poly :=
[
  term ((-416 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((208 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1247_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1247
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1248 : Poly :=
[
  term ((12787 : Rat) / 210) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 1248 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1248 : Poly :=
[
  term ((12787 : Rat) / 105) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12787 : Rat) / 210) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1248_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1248
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1249 : Poly :=
[
  term ((-521 : Rat) / 70) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1249 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1249 : Poly :=
[
  term ((-521 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((521 : Rat) / 70) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1249_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1249
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1250 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1250 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1250 : Poly :=
[
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1250_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1250
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1251 : Poly :=
[
  term ((-24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1251 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1251 : Poly :=
[
  term ((-48 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1251_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1251
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1252 : Poly :=
[
  term ((6 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1252 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1252 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1252_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1252
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1253 : Poly :=
[
  term ((3 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1253 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1253 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1253_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1253
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1254 : Poly :=
[
  term ((-5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1254 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1254 : Poly :=
[
  term ((-10944 : Rat) / 7625) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1254_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1254
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1255 : Poly :=
[
  term ((308 : Rat) / 5) [(7, 1), (11, 1)]
]

/-- Partial product 1255 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1255 : Poly :=
[
  term ((616 : Rat) / 5) [(6, 1), (7, 1), (11, 1)],
  term ((-308 : Rat) / 5) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1255_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1255
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1256 : Poly :=
[
  term ((-12787 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1256 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1256 : Poly :=
[
  term ((-25574 : Rat) / 105) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1256_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1256
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1257 : Poly :=
[
  term ((521 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1257 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1257 : Poly :=
[
  term ((1042 : Rat) / 35) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1257_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1257
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1258 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

/-- Partial product 1258 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1258 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(6, 1), (7, 1), (11, 1), (13, 2)],
  term ((9533632 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1258_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1258
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1259 : Poly :=
[
  term ((1536 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1259 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1259 : Poly :=
[
  term ((3072 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1536 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1259_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1259
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1260 : Poly :=
[
  term ((-512 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1260 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1260 : Poly :=
[
  term ((-1024 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((512 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1260_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1260
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1261 : Poly :=
[
  term ((416 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1261 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1261 : Poly :=
[
  term ((832 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1261_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1261
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1262 : Poly :=
[
  term ((-288 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1262 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1262 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((288 : Rat) / 5) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1262_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1262
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1263 : Poly :=
[
  term ((-15168 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1263 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1263 : Poly :=
[
  term ((-30336 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((15168 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1263_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1263
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1264 : Poly :=
[
  term ((4872 : Rat) / 7625) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1264 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1264 : Poly :=
[
  term ((9744 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4872 : Rat) / 7625) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1264_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1264
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1265 : Poly :=
[
  term ((12 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1265 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1265 : Poly :=
[
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1265_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1265
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1266 : Poly :=
[
  term ((1551 : Rat) / 100) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1266 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1266 : Poly :=
[
  term ((1551 : Rat) / 50) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1551 : Rat) / 100) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1266_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1266
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1267 : Poly :=
[
  term ((-27 : Rat) / 20) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1267 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1267 : Poly :=
[
  term ((-27 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 20) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1267_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1267
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1268 : Poly :=
[
  term ((20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1268 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1268 : Poly :=
[
  term ((41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1268_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1268
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1269 : Poly :=
[
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1269 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1269 : Poly :=
[
  term ((-41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1269_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1269
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1270 : Poly :=
[
  term ((-3160856 : Rat) / 53375) [(7, 1), (13, 1)]
]

/-- Partial product 1270 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1270 : Poly :=
[
  term ((-6321712 : Rat) / 53375) [(6, 1), (7, 1), (13, 1)],
  term ((3160856 : Rat) / 53375) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1270_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1270
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1271 : Poly :=
[
  term ((384 : Rat) / 7) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1271 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1271 : Poly :=
[
  term ((768 : Rat) / 7) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-384 : Rat) / 7) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1271_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1271
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1272 : Poly :=
[
  term ((144 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1272 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1272 : Poly :=
[
  term ((288 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1272_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1272
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1273 : Poly :=
[
  term ((-117 : Rat) / 35) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1273 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1273 : Poly :=
[
  term ((-234 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((117 : Rat) / 35) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1273_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1273
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1274 : Poly :=
[
  term ((16867 : Rat) / 2800) [(7, 1), (15, 1)]
]

/-- Partial product 1274 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1274 : Poly :=
[
  term ((16867 : Rat) / 1400) [(6, 1), (7, 1), (15, 1)],
  term ((-16867 : Rat) / 2800) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1274_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1274
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1275 : Poly :=
[
  term ((-79 : Rat) / 560) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1275 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1275 : Poly :=
[
  term ((-79 : Rat) / 280) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((79 : Rat) / 560) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1275_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1275
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1276 : Poly :=
[
  term ((5161144 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1276 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1276 : Poly :=
[
  term ((10322288 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5161144 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1276_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1276
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1277 : Poly :=
[
  term ((-4224 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1277 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1277 : Poly :=
[
  term ((-8448 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4224 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1277_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1277
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1278 : Poly :=
[
  term ((1408 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1278 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1278 : Poly :=
[
  term ((2816 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1278_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1278
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1279 : Poly :=
[
  term ((-1144 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1279 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1279 : Poly :=
[
  term ((-2288 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1279_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1279
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1280 : Poly :=
[
  term ((-14341 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1280 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1280 : Poly :=
[
  term ((-14341 : Rat) / 105) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((14341 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1280_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1280
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1281 : Poly :=
[
  term ((479 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1281 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1281 : Poly :=
[
  term ((479 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-479 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1281_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1281
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1282 : Poly :=
[
  term ((-2570996 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1282 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1282 : Poly :=
[
  term ((-5141992 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((2570996 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1282_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1282
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1283 : Poly :=
[
  term ((2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1283 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1283 : Poly :=
[
  term ((4224 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1283_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1283
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1284 : Poly :=
[
  term ((-704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1284 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1284 : Poly :=
[
  term ((-1408 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1284_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1284
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1285 : Poly :=
[
  term ((572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1285 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1285 : Poly :=
[
  term ((1144 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1285_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1285
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1286 : Poly :=
[
  term ((-2669 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1286 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1286 : Poly :=
[
  term ((-2669 : Rat) / 210) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((2669 : Rat) / 420) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1286_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1286
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1287 : Poly :=
[
  term ((151 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1287 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1287 : Poly :=
[
  term ((151 : Rat) / 70) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-151 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1287_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1287
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1288 : Poly :=
[
  term ((-308 : Rat) / 5) [(9, 1), (11, 1)]
]

/-- Partial product 1288 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1288 : Poly :=
[
  term ((-616 : Rat) / 5) [(6, 1), (9, 1), (11, 1)],
  term ((308 : Rat) / 5) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1288_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1288
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1289 : Poly :=
[
  term ((1232 : Rat) / 5) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1289 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1289 : Poly :=
[
  term ((2464 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1289_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1289
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1290 : Poly :=
[
  term ((18418 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1290 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1290 : Poly :=
[
  term ((36836 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18418 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1290_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1290
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1291 : Poly :=
[
  term ((-2274 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1291 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1291 : Poly :=
[
  term ((-4548 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2274 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1291_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1291
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1292 : Poly :=
[
  term ((752448 : Rat) / 875) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

/-- Partial product 1292 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1292 : Poly :=
[
  term ((1504896 : Rat) / 875) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-752448 : Rat) / 875) [(9, 1), (11, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1292_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1292
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1293 : Poly :=
[
  term ((-36864 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1293 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1293 : Poly :=
[
  term ((-73728 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((36864 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1293_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1293
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1294 : Poly :=
[
  term ((12288 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1294 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1294 : Poly :=
[
  term ((24576 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-12288 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1294_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1294
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1295 : Poly :=
[
  term ((-9984 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1295 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1295 : Poly :=
[
  term ((-19968 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1295_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1295
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1296 : Poly :=
[
  term ((-1152 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1296 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1296 : Poly :=
[
  term ((-2304 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1296_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1296
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1297 : Poly :=
[
  term ((1005 : Rat) / 14) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1297 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1297 : Poly :=
[
  term ((1005 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1005 : Rat) / 14) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1297_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1297
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1298 : Poly :=
[
  term ((-729 : Rat) / 70) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1298 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1298 : Poly :=
[
  term ((-729 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((729 : Rat) / 70) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1298_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1298
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003YY_coefficient_16_1299 : Poly :=
[
  term ((17221824 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1299 for generator 16. -/
def rs_R003_ueqv_R003YY_partial_16_1299 : Poly :=
[
  term ((34443648 : Rat) / 53375) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-17221824 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 16. -/
theorem rs_R003_ueqv_R003YY_partial_16_1299_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_16_1299
        rs_R003_ueqv_R003YY_generator_16_1200_1299 =
      rs_R003_ueqv_R003YY_partial_16_1299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_16_1200_1299 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_16_1200,
  rs_R003_ueqv_R003YY_partial_16_1201,
  rs_R003_ueqv_R003YY_partial_16_1202,
  rs_R003_ueqv_R003YY_partial_16_1203,
  rs_R003_ueqv_R003YY_partial_16_1204,
  rs_R003_ueqv_R003YY_partial_16_1205,
  rs_R003_ueqv_R003YY_partial_16_1206,
  rs_R003_ueqv_R003YY_partial_16_1207,
  rs_R003_ueqv_R003YY_partial_16_1208,
  rs_R003_ueqv_R003YY_partial_16_1209,
  rs_R003_ueqv_R003YY_partial_16_1210,
  rs_R003_ueqv_R003YY_partial_16_1211,
  rs_R003_ueqv_R003YY_partial_16_1212,
  rs_R003_ueqv_R003YY_partial_16_1213,
  rs_R003_ueqv_R003YY_partial_16_1214,
  rs_R003_ueqv_R003YY_partial_16_1215,
  rs_R003_ueqv_R003YY_partial_16_1216,
  rs_R003_ueqv_R003YY_partial_16_1217,
  rs_R003_ueqv_R003YY_partial_16_1218,
  rs_R003_ueqv_R003YY_partial_16_1219,
  rs_R003_ueqv_R003YY_partial_16_1220,
  rs_R003_ueqv_R003YY_partial_16_1221,
  rs_R003_ueqv_R003YY_partial_16_1222,
  rs_R003_ueqv_R003YY_partial_16_1223,
  rs_R003_ueqv_R003YY_partial_16_1224,
  rs_R003_ueqv_R003YY_partial_16_1225,
  rs_R003_ueqv_R003YY_partial_16_1226,
  rs_R003_ueqv_R003YY_partial_16_1227,
  rs_R003_ueqv_R003YY_partial_16_1228,
  rs_R003_ueqv_R003YY_partial_16_1229,
  rs_R003_ueqv_R003YY_partial_16_1230,
  rs_R003_ueqv_R003YY_partial_16_1231,
  rs_R003_ueqv_R003YY_partial_16_1232,
  rs_R003_ueqv_R003YY_partial_16_1233,
  rs_R003_ueqv_R003YY_partial_16_1234,
  rs_R003_ueqv_R003YY_partial_16_1235,
  rs_R003_ueqv_R003YY_partial_16_1236,
  rs_R003_ueqv_R003YY_partial_16_1237,
  rs_R003_ueqv_R003YY_partial_16_1238,
  rs_R003_ueqv_R003YY_partial_16_1239,
  rs_R003_ueqv_R003YY_partial_16_1240,
  rs_R003_ueqv_R003YY_partial_16_1241,
  rs_R003_ueqv_R003YY_partial_16_1242,
  rs_R003_ueqv_R003YY_partial_16_1243,
  rs_R003_ueqv_R003YY_partial_16_1244,
  rs_R003_ueqv_R003YY_partial_16_1245,
  rs_R003_ueqv_R003YY_partial_16_1246,
  rs_R003_ueqv_R003YY_partial_16_1247,
  rs_R003_ueqv_R003YY_partial_16_1248,
  rs_R003_ueqv_R003YY_partial_16_1249,
  rs_R003_ueqv_R003YY_partial_16_1250,
  rs_R003_ueqv_R003YY_partial_16_1251,
  rs_R003_ueqv_R003YY_partial_16_1252,
  rs_R003_ueqv_R003YY_partial_16_1253,
  rs_R003_ueqv_R003YY_partial_16_1254,
  rs_R003_ueqv_R003YY_partial_16_1255,
  rs_R003_ueqv_R003YY_partial_16_1256,
  rs_R003_ueqv_R003YY_partial_16_1257,
  rs_R003_ueqv_R003YY_partial_16_1258,
  rs_R003_ueqv_R003YY_partial_16_1259,
  rs_R003_ueqv_R003YY_partial_16_1260,
  rs_R003_ueqv_R003YY_partial_16_1261,
  rs_R003_ueqv_R003YY_partial_16_1262,
  rs_R003_ueqv_R003YY_partial_16_1263,
  rs_R003_ueqv_R003YY_partial_16_1264,
  rs_R003_ueqv_R003YY_partial_16_1265,
  rs_R003_ueqv_R003YY_partial_16_1266,
  rs_R003_ueqv_R003YY_partial_16_1267,
  rs_R003_ueqv_R003YY_partial_16_1268,
  rs_R003_ueqv_R003YY_partial_16_1269,
  rs_R003_ueqv_R003YY_partial_16_1270,
  rs_R003_ueqv_R003YY_partial_16_1271,
  rs_R003_ueqv_R003YY_partial_16_1272,
  rs_R003_ueqv_R003YY_partial_16_1273,
  rs_R003_ueqv_R003YY_partial_16_1274,
  rs_R003_ueqv_R003YY_partial_16_1275,
  rs_R003_ueqv_R003YY_partial_16_1276,
  rs_R003_ueqv_R003YY_partial_16_1277,
  rs_R003_ueqv_R003YY_partial_16_1278,
  rs_R003_ueqv_R003YY_partial_16_1279,
  rs_R003_ueqv_R003YY_partial_16_1280,
  rs_R003_ueqv_R003YY_partial_16_1281,
  rs_R003_ueqv_R003YY_partial_16_1282,
  rs_R003_ueqv_R003YY_partial_16_1283,
  rs_R003_ueqv_R003YY_partial_16_1284,
  rs_R003_ueqv_R003YY_partial_16_1285,
  rs_R003_ueqv_R003YY_partial_16_1286,
  rs_R003_ueqv_R003YY_partial_16_1287,
  rs_R003_ueqv_R003YY_partial_16_1288,
  rs_R003_ueqv_R003YY_partial_16_1289,
  rs_R003_ueqv_R003YY_partial_16_1290,
  rs_R003_ueqv_R003YY_partial_16_1291,
  rs_R003_ueqv_R003YY_partial_16_1292,
  rs_R003_ueqv_R003YY_partial_16_1293,
  rs_R003_ueqv_R003YY_partial_16_1294,
  rs_R003_ueqv_R003YY_partial_16_1295,
  rs_R003_ueqv_R003YY_partial_16_1296,
  rs_R003_ueqv_R003YY_partial_16_1297,
  rs_R003_ueqv_R003YY_partial_16_1298,
  rs_R003_ueqv_R003YY_partial_16_1299
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_16_1200_1299 : Poly :=
[
  term ((-34452 : Rat) / 7625) [(5, 1), (6, 1), (13, 1)],
  term ((23172 : Rat) / 7625) [(5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-65664 : Rat) / 7625) [(5, 1), (6, 1), (13, 3)],
  term ((12 : Rat) / 5) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(5, 1), (6, 1), (15, 1)],
  term ((17226 : Rat) / 7625) [(5, 1), (13, 1)],
  term ((-11586 : Rat) / 7625) [(5, 1), (13, 1), (14, 1)],
  term ((32832 : Rat) / 7625) [(5, 1), (13, 3)],
  term ((-6 : Rat) / 5) [(5, 1), (14, 1), (15, 1)],
  term ((6 : Rat) / 5) [(5, 1), (15, 1)],
  term ((125 : Rat) / 2) [(6, 1)],
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1)],
  term ((9533632 : Rat) / 53375) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1536 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((512 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 105) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-48 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-10944 : Rat) / 7625) [(6, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((616 : Rat) / 5) [(6, 1), (7, 1), (11, 1)],
  term ((-25574 : Rat) / 105) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1042 : Rat) / 35) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19067264 : Rat) / 53375) [(6, 1), (7, 1), (11, 1), (13, 2)],
  term ((3072 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1024 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((832 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-30336 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((9744 : Rat) / 7625) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((24 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1551 : Rat) / 50) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 10) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((-41472 : Rat) / 7625) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-6321712 : Rat) / 53375) [(6, 1), (7, 1), (13, 1)],
  term ((768 : Rat) / 7) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-234 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((16867 : Rat) / 1400) [(6, 1), (7, 1), (15, 1)],
  term ((-79 : Rat) / 280) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((10322288 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8448 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2816 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2288 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-14341 : Rat) / 105) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((479 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5141992 : Rat) / 53375) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-484 : Rat) / 105) [(6, 1), (9, 1), (10, 1), (15, 1)],
  term ((44 : Rat) / 35) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((36836 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4548 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1504896 : Rat) / 875) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-73728 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((24576 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19968 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2304 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1005 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-729 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34443648 : Rat) / 53375) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-576 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((693 : Rat) / 25) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((510288 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)],
  term ((-192 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((288 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((16867 : Rat) / 1400) [(6, 1), (9, 1), (15, 1)],
  term ((-79 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5472 : Rat) / 7625) [(6, 1), (10, 1), (13, 2)],
  term ((-9533632 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((521 : Rat) / 35) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7150224 : Rat) / 53375) [(6, 1), (11, 1), (13, 1)],
  term ((-1152 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((611 : Rat) / 7) [(6, 1), (11, 1), (15, 1)],
  term ((-75 : Rat) / 7) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 5) [(6, 1), (12, 1)],
  term ((20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2)],
  term ((-20736 : Rat) / 7625) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((276 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (12, 1), (16, 1)],
  term ((12 : Rat) / 5) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 20) [(6, 1), (13, 1), (15, 1)],
  term ((-9 : Rat) / 20) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15168 : Rat) / 7625) [(6, 1), (13, 2)],
  term ((4872 : Rat) / 7625) [(6, 1), (13, 2), (14, 1)],
  term ((-279 : Rat) / 5) [(6, 1), (14, 1)],
  term ((9 : Rat) / 10) [(6, 1), (16, 1)],
  term (-125 : Rat) [(6, 2)],
  term ((-81 : Rat) / 5) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 5) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 5) [(6, 2), (9, 1), (11, 1)],
  term ((1152 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-1386 : Rat) / 25) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((18 : Rat) / 5) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1020576 : Rat) / 53375) [(6, 2), (9, 1), (13, 1)],
  term ((384 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 35) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 7) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-16867 : Rat) / 700) [(6, 2), (9, 1), (15, 1)],
  term ((79 : Rat) / 140) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((10944 : Rat) / 7625) [(6, 2), (10, 1), (13, 2)],
  term ((19067264 : Rat) / 53375) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3072 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1024 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((25574 : Rat) / 105) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14300448 : Rat) / 53375) [(6, 2), (11, 1), (13, 1)],
  term ((2304 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((624 : Rat) / 7) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1222 : Rat) / 7) [(6, 2), (11, 1), (15, 1)],
  term ((150 : Rat) / 7) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 5) [(6, 2), (12, 1)],
  term ((-41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2)],
  term ((41472 : Rat) / 7625) [(6, 2), (12, 1), (13, 2), (14, 1)],
  term ((-552 : Rat) / 5) [(6, 2), (12, 1), (14, 1)],
  term ((12 : Rat) / 5) [(6, 2), (12, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33 : Rat) / 10) [(6, 2), (13, 1), (15, 1)],
  term ((9 : Rat) / 10) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((30336 : Rat) / 7625) [(6, 2), (13, 2)],
  term ((-9744 : Rat) / 7625) [(6, 2), (13, 2), (14, 1)],
  term ((558 : Rat) / 5) [(6, 2), (14, 1)],
  term ((-9 : Rat) / 5) [(6, 2), (16, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1)],
  term ((-4766816 : Rat) / 53375) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((768 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-256 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 7) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 210) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((521 : Rat) / 70) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (9, 1), (12, 1)],
  term ((24 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(7, 1), (9, 1), (14, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1), (16, 1)],
  term ((5472 : Rat) / 7625) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-308 : Rat) / 5) [(7, 1), (11, 1)],
  term ((12787 : Rat) / 105) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-521 : Rat) / 35) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9533632 : Rat) / 53375) [(7, 1), (11, 1), (13, 2)],
  term ((-1536 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((512 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-416 : Rat) / 7) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(7, 1), (11, 1), (14, 1)],
  term ((15168 : Rat) / 7625) [(7, 1), (12, 1), (13, 1)],
  term ((-4872 : Rat) / 7625) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12 : Rat) / 5) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1551 : Rat) / 100) [(7, 1), (12, 1), (15, 1)],
  term ((27 : Rat) / 20) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1)],
  term ((20736 : Rat) / 7625) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((3160856 : Rat) / 53375) [(7, 1), (13, 1)],
  term ((-384 : Rat) / 7) [(7, 1), (13, 1), (14, 1)],
  term ((-144 : Rat) / 35) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((117 : Rat) / 35) [(7, 1), (13, 1), (16, 1)],
  term ((-16867 : Rat) / 2800) [(7, 1), (15, 1)],
  term ((79 : Rat) / 560) [(7, 1), (15, 1), (16, 1)],
  term ((-5161144 : Rat) / 53375) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((4224 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1408 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1144 : Rat) / 35) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((14341 : Rat) / 210) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-479 : Rat) / 70) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2570996 : Rat) / 53375) [(9, 1), (10, 1), (13, 1)],
  term ((-2112 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((704 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-572 : Rat) / 35) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2669 : Rat) / 420) [(9, 1), (10, 1), (15, 1)],
  term ((-151 : Rat) / 140) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((308 : Rat) / 5) [(9, 1), (11, 1)],
  term ((-1232 : Rat) / 5) [(9, 1), (11, 1), (12, 1)],
  term ((-18418 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2274 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-752448 : Rat) / 875) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((36864 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-12288 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((9984 : Rat) / 35) [(9, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1152 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1005 : Rat) / 14) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((729 : Rat) / 70) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17221824 : Rat) / 53375) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 1200 through 1299. -/
theorem rs_R003_ueqv_R003YY_block_16_1200_1299_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_16_1200_1299
      rs_R003_ueqv_R003YY_block_16_1200_1299 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
