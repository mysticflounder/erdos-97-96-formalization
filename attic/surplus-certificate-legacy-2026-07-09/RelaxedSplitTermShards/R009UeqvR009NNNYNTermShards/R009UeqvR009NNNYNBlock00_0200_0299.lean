/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 0:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0200 : Poly :=
[
  term ((6365488640 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 200 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0200 : Poly :=
[
  term ((6365488640 : Rat) / 110226591) [(0, 2), (5, 1), (9, 1), (11, 2)],
  term ((6365488640 : Rat) / 110226591) [(1, 2), (5, 1), (9, 1), (11, 2)],
  term ((-6365488640 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (11, 2)],
  term ((-6365488640 : Rat) / 110226591) [(5, 3), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0200
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0201 : Poly :=
[
  term ((-294955080 : Rat) / 12247399) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 201 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0201 : Poly :=
[
  term ((-294955080 : Rat) / 12247399) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-294955080 : Rat) / 12247399) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((294955080 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((294955080 : Rat) / 12247399) [(5, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0201
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0202 : Poly :=
[
  term ((-123 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

/-- Partial product 202 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0202 : Poly :=
[
  term ((-123 : Rat) / 67) [(0, 2), (5, 1), (9, 1), (14, 1)],
  term ((-123 : Rat) / 67) [(1, 2), (5, 1), (9, 1), (14, 1)],
  term ((123 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((123 : Rat) / 67) [(5, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0202
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0203 : Poly :=
[
  term ((4881400534 : Rat) / 110226591) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 203 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0203 : Poly :=
[
  term ((4881400534 : Rat) / 110226591) [(0, 2), (5, 1), (9, 1), (15, 2)],
  term ((4881400534 : Rat) / 110226591) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((-4881400534 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (15, 2)],
  term ((-4881400534 : Rat) / 110226591) [(5, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0203
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0204 : Poly :=
[
  term ((11025602336 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 204 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0204 : Poly :=
[
  term ((11025602336 : Rat) / 6282915687) [(0, 2), (5, 1), (9, 2), (11, 1)],
  term ((11025602336 : Rat) / 6282915687) [(1, 2), (5, 1), (9, 2), (11, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (11, 1)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 3), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0204
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0205 : Poly :=
[
  term ((344550073 : Rat) / 465401162) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 205 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0205 : Poly :=
[
  term ((344550073 : Rat) / 465401162) [(0, 2), (5, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 465401162) [(1, 2), (5, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 465401162) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 465401162) [(5, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0205
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0206 : Poly :=
[
  term ((-19226441917 : Rat) / 6282915687) [(5, 1), (9, 2), (15, 1)]
]

/-- Partial product 206 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0206 : Poly :=
[
  term ((-19226441917 : Rat) / 6282915687) [(0, 2), (5, 1), (9, 2), (15, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(1, 2), (5, 1), (9, 2), (15, 1)],
  term ((19226441917 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (15, 1)],
  term ((19226441917 : Rat) / 6282915687) [(5, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0206
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0207 : Poly :=
[
  term ((-19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 207 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0207 : Poly :=
[
  term ((-19496960 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0207
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0208 : Poly :=
[
  term ((19496960 : Rat) / 330679773) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 208 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0208 : Poly :=
[
  term ((19496960 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0208
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0209 : Poly :=
[
  term ((-304640 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 209 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0209 : Poly :=
[
  term ((-304640 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0209
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0210 : Poly :=
[
  term ((304640 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 210 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0210 : Poly :=
[
  term ((304640 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((304640 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0210
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0211 : Poly :=
[
  term ((-17582080 : Rat) / 330679773) [(5, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 211 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0211 : Poly :=
[
  term ((-17582080 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0211
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0212 : Poly :=
[
  term ((17582080 : Rat) / 330679773) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 212 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0212 : Poly :=
[
  term ((17582080 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(5, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0212
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0213 : Poly :=
[
  term ((4798512052 : Rat) / 330679773) [(5, 1), (11, 1)]
]

/-- Partial product 213 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0213 : Poly :=
[
  term ((4798512052 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1)],
  term ((4798512052 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1)],
  term ((-4798512052 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1)],
  term ((-4798512052 : Rat) / 330679773) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0213
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0214 : Poly :=
[
  term ((225164800 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 214 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0214 : Poly :=
[
  term ((225164800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((225164800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-225164800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((-225164800 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0214
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0215 : Poly :=
[
  term ((-225164800 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 215 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0215 : Poly :=
[
  term ((-225164800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-225164800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((225164800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((225164800 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0215
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0216 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 216 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0216 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 3), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0216
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0217 : Poly :=
[
  term ((-60623360 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 217 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0217 : Poly :=
[
  term ((-60623360 : Rat) / 36742197) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-60623360 : Rat) / 36742197) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((60623360 : Rat) / 36742197) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((60623360 : Rat) / 36742197) [(5, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0217
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0218 : Poly :=
[
  term ((-9916867252 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 218 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0218 : Poly :=
[
  term ((-9916867252 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-9916867252 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((9916867252 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((9916867252 : Rat) / 330679773) [(5, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0218
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0219 : Poly :=
[
  term ((32204800 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 219 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0219 : Poly :=
[
  term ((32204800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((32204800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-32204800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-32204800 : Rat) / 110226591) [(5, 3), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0219
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0220 : Poly :=
[
  term ((1706118400 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 220 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0220 : Poly :=
[
  term ((1706118400 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (14, 2)],
  term ((1706118400 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (14, 2)],
  term ((-1706118400 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 2)],
  term ((-1706118400 : Rat) / 110226591) [(5, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0220
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0221 : Poly :=
[
  term ((62842880 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 221 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0221 : Poly :=
[
  term ((62842880 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((62842880 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-62842880 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((-62842880 : Rat) / 110226591) [(5, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0221
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0222 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 222 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0222 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 3), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0222
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0223 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 223 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0223 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0223
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0224 : Poly :=
[
  term ((10554600 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 224 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0224 : Poly :=
[
  term ((10554600 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((10554600 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10554600 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10554600 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0224
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0225 : Poly :=
[
  term ((-10554600 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 225 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0225 : Poly :=
[
  term ((-10554600 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10554600 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((10554600 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((10554600 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0225
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0226 : Poly :=
[
  term ((262276628 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 226 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0226 : Poly :=
[
  term ((262276628 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((262276628 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-262276628 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-262276628 : Rat) / 110226591) [(5, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0226
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0227 : Poly :=
[
  term ((-262276628 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 227 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0227 : Poly :=
[
  term ((-262276628 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-262276628 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((262276628 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((262276628 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0227
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0228 : Poly :=
[
  term ((74051341 : Rat) / 12247399) [(5, 1), (13, 1)]
]

/-- Partial product 228 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0228 : Poly :=
[
  term ((74051341 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1)],
  term ((74051341 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1)],
  term ((-74051341 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1)],
  term ((-74051341 : Rat) / 12247399) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0228
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0229 : Poly :=
[
  term ((-154025641 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 229 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0229 : Poly :=
[
  term ((-154025641 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((-154025641 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((154025641 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((154025641 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0229
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0230 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 230 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0230 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((685440 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-685440 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-685440 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0230
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0231 : Poly :=
[
  term ((79974300 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 231 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0231 : Poly :=
[
  term ((79974300 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 2)],
  term ((79974300 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((-79974300 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 2)],
  term ((-79974300 : Rat) / 12247399) [(5, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0231
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0232 : Poly :=
[
  term ((68451520 : Rat) / 36742197) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 232 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0232 : Poly :=
[
  term ((68451520 : Rat) / 36742197) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((68451520 : Rat) / 36742197) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-68451520 : Rat) / 36742197) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((-68451520 : Rat) / 36742197) [(5, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0232
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0233 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 233 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0233 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(4, 2), (5, 1), (13, 2), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(5, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0233
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0234 : Poly :=
[
  term ((8618026307 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 234 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0234 : Poly :=
[
  term ((8618026307 : Rat) / 330679773) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((8618026307 : Rat) / 330679773) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-8618026307 : Rat) / 330679773) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((-8618026307 : Rat) / 330679773) [(5, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0234
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0235 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 235 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0235 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(0, 2), (5, 1), (14, 1), (15, 3)],
  term ((-4395520 : Rat) / 36742197) [(1, 2), (5, 1), (14, 1), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(4, 2), (5, 1), (14, 1), (15, 3)],
  term ((4395520 : Rat) / 36742197) [(5, 3), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0235
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0236 : Poly :=
[
  term ((-1538553200 : Rat) / 110226591) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 236 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0236 : Poly :=
[
  term ((-1538553200 : Rat) / 110226591) [(0, 2), (5, 1), (14, 2), (15, 1)],
  term ((-1538553200 : Rat) / 110226591) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((1538553200 : Rat) / 110226591) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((1538553200 : Rat) / 110226591) [(5, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0236
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0237 : Poly :=
[
  term ((-4002366707 : Rat) / 330679773) [(5, 1), (15, 1)]
]

/-- Partial product 237 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0237 : Poly :=
[
  term ((-4002366707 : Rat) / 330679773) [(0, 2), (5, 1), (15, 1)],
  term ((-4002366707 : Rat) / 330679773) [(1, 2), (5, 1), (15, 1)],
  term ((4002366707 : Rat) / 330679773) [(4, 2), (5, 1), (15, 1)],
  term ((4002366707 : Rat) / 330679773) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0237
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0238 : Poly :=
[
  term ((-24175360 : Rat) / 36742197) [(5, 1), (15, 3)]
]

/-- Partial product 238 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0238 : Poly :=
[
  term ((-24175360 : Rat) / 36742197) [(0, 2), (5, 1), (15, 3)],
  term ((-24175360 : Rat) / 36742197) [(1, 2), (5, 1), (15, 3)],
  term ((24175360 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((24175360 : Rat) / 36742197) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0238
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0239 : Poly :=
[
  term ((-507 : Rat) / 268) [(7, 1), (9, 1)]
]

/-- Partial product 239 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0239 : Poly :=
[
  term ((-507 : Rat) / 268) [(0, 2), (7, 1), (9, 1)],
  term ((-507 : Rat) / 268) [(1, 2), (7, 1), (9, 1)],
  term ((507 : Rat) / 268) [(4, 2), (7, 1), (9, 1)],
  term ((507 : Rat) / 268) [(5, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0239
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0240 : Poly :=
[
  term ((99460760 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 240 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0240 : Poly :=
[
  term ((99460760 : Rat) / 12247399) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((99460760 : Rat) / 12247399) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-99460760 : Rat) / 12247399) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-99460760 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0240
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0241 : Poly :=
[
  term ((-26417483816414 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 241 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0241 : Poly :=
[
  term ((-26417483816414 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-26417483816414 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0241
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0242 : Poly :=
[
  term ((3565074148832 : Rat) / 471218676525) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0242 : Poly :=
[
  term ((3565074148832 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3565074148832 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3565074148832 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3565074148832 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0242
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0243 : Poly :=
[
  term ((6365488640 : Rat) / 330679773) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 243 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0243 : Poly :=
[
  term ((6365488640 : Rat) / 330679773) [(0, 2), (7, 1), (9, 1), (11, 2)],
  term ((6365488640 : Rat) / 330679773) [(1, 2), (7, 1), (9, 1), (11, 2)],
  term ((-6365488640 : Rat) / 330679773) [(4, 2), (7, 1), (9, 1), (11, 2)],
  term ((-6365488640 : Rat) / 330679773) [(5, 2), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0243
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0244 : Poly :=
[
  term ((-260125981976 : Rat) / 17452543575) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 244 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0244 : Poly :=
[
  term ((-260125981976 : Rat) / 17452543575) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-260125981976 : Rat) / 17452543575) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((260125981976 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((260125981976 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0244
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0245 : Poly :=
[
  term ((111408567151 : Rat) / 34905087150) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0245 : Poly :=
[
  term ((111408567151 : Rat) / 34905087150) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((111408567151 : Rat) / 34905087150) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111408567151 : Rat) / 34905087150) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-111408567151 : Rat) / 34905087150) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0245
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0246 : Poly :=
[
  term ((392 : Rat) / 67) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 246 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0246 : Poly :=
[
  term ((392 : Rat) / 67) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((392 : Rat) / 67) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(5, 2), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0246
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0247 : Poly :=
[
  term ((16063263688672 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 247 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0247 : Poly :=
[
  term ((16063263688672 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (15, 2)],
  term ((16063263688672 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (15, 2)],
  term ((-16063263688672 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2)],
  term ((-16063263688672 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0247
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0248 : Poly :=
[
  term ((-4072972915936 : Rat) / 471218676525) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0248 : Poly :=
[
  term ((-4072972915936 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4072972915936 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((4072972915936 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((4072972915936 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0248
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0249 : Poly :=
[
  term ((11025602336 : Rat) / 18848747061) [(7, 1), (9, 2), (11, 1)]
]

/-- Partial product 249 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0249 : Poly :=
[
  term ((11025602336 : Rat) / 18848747061) [(0, 2), (7, 1), (9, 2), (11, 1)],
  term ((11025602336 : Rat) / 18848747061) [(1, 2), (7, 1), (9, 2), (11, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (11, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0249
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0250 : Poly :=
[
  term ((344550073 : Rat) / 1396203486) [(7, 1), (9, 2), (13, 1)]
]

/-- Partial product 250 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0250 : Poly :=
[
  term ((344550073 : Rat) / 1396203486) [(0, 2), (7, 1), (9, 2), (13, 1)],
  term ((344550073 : Rat) / 1396203486) [(1, 2), (7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 1396203486) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 1396203486) [(5, 2), (7, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0250
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0251 : Poly :=
[
  term ((-19226441917 : Rat) / 18848747061) [(7, 1), (9, 2), (15, 1)]
]

/-- Partial product 251 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0251 : Poly :=
[
  term ((-19226441917 : Rat) / 18848747061) [(0, 2), (7, 1), (9, 2), (15, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(1, 2), (7, 1), (9, 2), (15, 1)],
  term ((19226441917 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (15, 1)],
  term ((19226441917 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0251
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0252 : Poly :=
[
  term ((165906242432 : Rat) / 31414578435) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 252 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0252 : Poly :=
[
  term ((165906242432 : Rat) / 31414578435) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((165906242432 : Rat) / 31414578435) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0252
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0253 : Poly :=
[
  term ((2592285038 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 253 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0253 : Poly :=
[
  term ((2592285038 : Rat) / 1163502905) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((2592285038 : Rat) / 1163502905) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0253
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0254 : Poly :=
[
  term ((-149611879336 : Rat) / 31414578435) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 254 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0254 : Poly :=
[
  term ((-149611879336 : Rat) / 31414578435) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((149611879336 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((149611879336 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0254
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0255 : Poly :=
[
  term ((8029168110697 : Rat) / 471218676525) [(7, 1), (11, 1)]
]

/-- Partial product 255 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0255 : Poly :=
[
  term ((8029168110697 : Rat) / 471218676525) [(0, 2), (7, 1), (11, 1)],
  term ((8029168110697 : Rat) / 471218676525) [(1, 2), (7, 1), (11, 1)],
  term ((-8029168110697 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((-8029168110697 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0255
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0256 : Poly :=
[
  term ((23507742272 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 256 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0256 : Poly :=
[
  term ((23507742272 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((23507742272 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-23507742272 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-23507742272 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0256
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0257 : Poly :=
[
  term ((90576640 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 257 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0257 : Poly :=
[
  term ((90576640 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((90576640 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-90576640 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-90576640 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0257
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0258 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 258 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0258 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0258
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0259 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 259 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0259 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0259
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0260 : Poly :=
[
  term ((7159040 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 260 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0260 : Poly :=
[
  term ((7159040 : Rat) / 12247399) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((7159040 : Rat) / 12247399) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7159040 : Rat) / 12247399) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7159040 : Rat) / 12247399) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0260
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0261 : Poly :=
[
  term ((30961795424 : Rat) / 2755664775) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 261 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0261 : Poly :=
[
  term ((30961795424 : Rat) / 2755664775) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((30961795424 : Rat) / 2755664775) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-30961795424 : Rat) / 2755664775) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-30961795424 : Rat) / 2755664775) [(5, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0261
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0262 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 262 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0262 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(0, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(1, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0262
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0263 : Poly :=
[
  term ((51671462864 : Rat) / 24800982975) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 263 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0263 : Poly :=
[
  term ((51671462864 : Rat) / 24800982975) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((51671462864 : Rat) / 24800982975) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51671462864 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0263
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0264 : Poly :=
[
  term ((-3290739200 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2)]
]

/-- Partial product 264 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0264 : Poly :=
[
  term ((-3290739200 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((-3290739200 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((3290739200 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (14, 2)],
  term ((3290739200 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0264
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0265 : Poly :=
[
  term ((-1299252320 : Rat) / 36742197) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 265 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0265 : Poly :=
[
  term ((-1299252320 : Rat) / 36742197) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((-1299252320 : Rat) / 36742197) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((1299252320 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((1299252320 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0265
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0266 : Poly :=
[
  term ((-1160 : Rat) / 201) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0266 : Poly :=
[
  term ((-1160 : Rat) / 201) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1160 : Rat) / 201) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 201) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1160 : Rat) / 201) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0266
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0267 : Poly :=
[
  term ((-101273428814 : Rat) / 24800982975) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 267 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0267 : Poly :=
[
  term ((-101273428814 : Rat) / 24800982975) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0267
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0268 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 268 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0268 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0268
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0269 : Poly :=
[
  term ((367308473 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 269 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0269 : Poly :=
[
  term ((367308473 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((367308473 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-367308473 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-367308473 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0269
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0270 : Poly :=
[
  term ((4245780 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 270 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0270 : Poly :=
[
  term ((4245780 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((4245780 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4245780 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4245780 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0270
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0271 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 271 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0271 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0271
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0272 : Poly :=
[
  term ((-81680720 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 272 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0272 : Poly :=
[
  term ((-81680720 : Rat) / 110226591) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-81680720 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0272
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0273 : Poly :=
[
  term ((-20577070762 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 273 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0273 : Poly :=
[
  term ((-20577070762 : Rat) / 330679773) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-20577070762 : Rat) / 330679773) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((20577070762 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((20577070762 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0273
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0274 : Poly :=
[
  term ((63 : Rat) / 134) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0274 : Poly :=
[
  term ((63 : Rat) / 134) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 134) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 134) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 134) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0274
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0275 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 275 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0275 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(0, 2), (7, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0275
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0276 : Poly :=
[
  term ((129810061871 : Rat) / 34905087150) [(7, 1), (13, 1)]
]

/-- Partial product 276 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0276 : Poly :=
[
  term ((129810061871 : Rat) / 34905087150) [(0, 2), (7, 1), (13, 1)],
  term ((129810061871 : Rat) / 34905087150) [(1, 2), (7, 1), (13, 1)],
  term ((-129810061871 : Rat) / 34905087150) [(4, 2), (7, 1), (13, 1)],
  term ((-129810061871 : Rat) / 34905087150) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0276
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0277 : Poly :=
[
  term ((2902668321 : Rat) / 612369950) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 277 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0277 : Poly :=
[
  term ((2902668321 : Rat) / 612369950) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((2902668321 : Rat) / 612369950) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2902668321 : Rat) / 612369950) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2902668321 : Rat) / 612369950) [(5, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0277
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0278 : Poly :=
[
  term ((-5244160 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 278 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0278 : Poly :=
[
  term ((-5244160 : Rat) / 110226591) [(0, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5244160 : Rat) / 110226591) [(1, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(4, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((5244160 : Rat) / 110226591) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0278
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0279 : Poly :=
[
  term ((3229466429 : Rat) / 3674219700) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 279 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0279 : Poly :=
[
  term ((3229466429 : Rat) / 3674219700) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0279
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0280 : Poly :=
[
  term ((-154253400 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 280 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0280 : Poly :=
[
  term ((-154253400 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-154253400 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((154253400 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((154253400 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0280
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0281 : Poly :=
[
  term ((-5741840 : Rat) / 231083) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 281 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0281 : Poly :=
[
  term ((-5741840 : Rat) / 231083) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-5741840 : Rat) / 231083) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((5741840 : Rat) / 231083) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((5741840 : Rat) / 231083) [(5, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0281
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0282 : Poly :=
[
  term ((-3229466429 : Rat) / 3674219700) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 282 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0282 : Poly :=
[
  term ((-3229466429 : Rat) / 3674219700) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 3674219700) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 3674219700) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0282
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0283 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 283 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0283 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0283
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0284 : Poly :=
[
  term ((2056320 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 284 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0284 : Poly :=
[
  term ((2056320 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0284
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0285 : Poly :=
[
  term ((-43303272352 : Rat) / 2755664775) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 285 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0285 : Poly :=
[
  term ((-43303272352 : Rat) / 2755664775) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-43303272352 : Rat) / 2755664775) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((43303272352 : Rat) / 2755664775) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((43303272352 : Rat) / 2755664775) [(5, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0285
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0286 : Poly :=
[
  term ((-10320522397 : Rat) / 24800982975) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0286 : Poly :=
[
  term ((-10320522397 : Rat) / 24800982975) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((10320522397 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0286
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0287 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 287 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0287 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(0, 2), (7, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(1, 2), (7, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(4, 2), (7, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(5, 2), (7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0287
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0288 : Poly :=
[
  term ((2967541600 : Rat) / 110226591) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 288 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0288 : Poly :=
[
  term ((2967541600 : Rat) / 110226591) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((2967541600 : Rat) / 110226591) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-2967541600 : Rat) / 110226591) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((-2967541600 : Rat) / 110226591) [(5, 2), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0288
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0289 : Poly :=
[
  term ((-4272356501099 : Rat) / 1884874706100) [(7, 1), (15, 1)]
]

/-- Partial product 289 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0289 : Poly :=
[
  term ((-4272356501099 : Rat) / 1884874706100) [(0, 2), (7, 1), (15, 1)],
  term ((-4272356501099 : Rat) / 1884874706100) [(1, 2), (7, 1), (15, 1)],
  term ((4272356501099 : Rat) / 1884874706100) [(4, 2), (7, 1), (15, 1)],
  term ((4272356501099 : Rat) / 1884874706100) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0289
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0290 : Poly :=
[
  term ((-30318188881 : Rat) / 49601965950) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0290 : Poly :=
[
  term ((-30318188881 : Rat) / 49601965950) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 49601965950) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 49601965950) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0290
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0291 : Poly :=
[
  term ((5769928000 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 291 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0291 : Poly :=
[
  term ((5769928000 : Rat) / 110226591) [(0, 2), (7, 1), (15, 3)],
  term ((5769928000 : Rat) / 110226591) [(1, 2), (7, 1), (15, 3)],
  term ((-5769928000 : Rat) / 110226591) [(4, 2), (7, 1), (15, 3)],
  term ((-5769928000 : Rat) / 110226591) [(5, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0291_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0291
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0292 : Poly :=
[
  term ((632 : Rat) / 67) [(7, 2)]
]

/-- Partial product 292 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0292 : Poly :=
[
  term ((632 : Rat) / 67) [(0, 2), (7, 2)],
  term ((632 : Rat) / 67) [(1, 2), (7, 2)],
  term ((-632 : Rat) / 67) [(4, 2), (7, 2)],
  term ((-632 : Rat) / 67) [(5, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0292_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0292
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0293 : Poly :=
[
  term ((-3840714207232 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 293 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0293 : Poly :=
[
  term ((-3840714207232 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (11, 1)],
  term ((-3840714207232 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (11, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (11, 1)],
  term ((3840714207232 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0293_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0293
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0294 : Poly :=
[
  term ((-60011159488 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 294 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0294 : Poly :=
[
  term ((-60011159488 : Rat) / 17452543575) [(0, 2), (7, 2), (9, 1), (13, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(1, 2), (7, 2), (9, 1), (13, 1)],
  term ((60011159488 : Rat) / 17452543575) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((60011159488 : Rat) / 17452543575) [(5, 2), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0294_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0294
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0295 : Poly :=
[
  term ((4553633963861 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 295 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0295 : Poly :=
[
  term ((4553633963861 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (15, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (15, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0295_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0295
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0296 : Poly :=
[
  term ((-198921520 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 296 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0296 : Poly :=
[
  term ((-198921520 : Rat) / 12247399) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((-198921520 : Rat) / 12247399) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((198921520 : Rat) / 12247399) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((198921520 : Rat) / 12247399) [(5, 2), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0296_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0296
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0297 : Poly :=
[
  term ((16876615721876 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 297 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0297 : Poly :=
[
  term ((16876615721876 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0297_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0297
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0298 : Poly :=
[
  term ((-1096478030144 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0298 : Poly :=
[
  term ((-1096478030144 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1096478030144 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1096478030144 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1096478030144 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0298_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0298
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 0. -/
def rs_R009_ueqv_R009NNNYN_coefficient_00_0299 : Poly :=
[
  term ((-12730977280 : Rat) / 330679773) [(7, 2), (11, 2)]
]

/-- Partial product 299 for generator 0. -/
def rs_R009_ueqv_R009NNNYN_partial_00_0299 : Poly :=
[
  term ((-12730977280 : Rat) / 330679773) [(0, 2), (7, 2), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(1, 2), (7, 2), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(4, 2), (7, 2), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(5, 2), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 0. -/
theorem rs_R009_ueqv_R009NNNYN_partial_00_0299_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_00_0299
        rs_R009_ueqv_R009NNNYN_generator_00_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_00_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_00_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_00_0200,
  rs_R009_ueqv_R009NNNYN_partial_00_0201,
  rs_R009_ueqv_R009NNNYN_partial_00_0202,
  rs_R009_ueqv_R009NNNYN_partial_00_0203,
  rs_R009_ueqv_R009NNNYN_partial_00_0204,
  rs_R009_ueqv_R009NNNYN_partial_00_0205,
  rs_R009_ueqv_R009NNNYN_partial_00_0206,
  rs_R009_ueqv_R009NNNYN_partial_00_0207,
  rs_R009_ueqv_R009NNNYN_partial_00_0208,
  rs_R009_ueqv_R009NNNYN_partial_00_0209,
  rs_R009_ueqv_R009NNNYN_partial_00_0210,
  rs_R009_ueqv_R009NNNYN_partial_00_0211,
  rs_R009_ueqv_R009NNNYN_partial_00_0212,
  rs_R009_ueqv_R009NNNYN_partial_00_0213,
  rs_R009_ueqv_R009NNNYN_partial_00_0214,
  rs_R009_ueqv_R009NNNYN_partial_00_0215,
  rs_R009_ueqv_R009NNNYN_partial_00_0216,
  rs_R009_ueqv_R009NNNYN_partial_00_0217,
  rs_R009_ueqv_R009NNNYN_partial_00_0218,
  rs_R009_ueqv_R009NNNYN_partial_00_0219,
  rs_R009_ueqv_R009NNNYN_partial_00_0220,
  rs_R009_ueqv_R009NNNYN_partial_00_0221,
  rs_R009_ueqv_R009NNNYN_partial_00_0222,
  rs_R009_ueqv_R009NNNYN_partial_00_0223,
  rs_R009_ueqv_R009NNNYN_partial_00_0224,
  rs_R009_ueqv_R009NNNYN_partial_00_0225,
  rs_R009_ueqv_R009NNNYN_partial_00_0226,
  rs_R009_ueqv_R009NNNYN_partial_00_0227,
  rs_R009_ueqv_R009NNNYN_partial_00_0228,
  rs_R009_ueqv_R009NNNYN_partial_00_0229,
  rs_R009_ueqv_R009NNNYN_partial_00_0230,
  rs_R009_ueqv_R009NNNYN_partial_00_0231,
  rs_R009_ueqv_R009NNNYN_partial_00_0232,
  rs_R009_ueqv_R009NNNYN_partial_00_0233,
  rs_R009_ueqv_R009NNNYN_partial_00_0234,
  rs_R009_ueqv_R009NNNYN_partial_00_0235,
  rs_R009_ueqv_R009NNNYN_partial_00_0236,
  rs_R009_ueqv_R009NNNYN_partial_00_0237,
  rs_R009_ueqv_R009NNNYN_partial_00_0238,
  rs_R009_ueqv_R009NNNYN_partial_00_0239,
  rs_R009_ueqv_R009NNNYN_partial_00_0240,
  rs_R009_ueqv_R009NNNYN_partial_00_0241,
  rs_R009_ueqv_R009NNNYN_partial_00_0242,
  rs_R009_ueqv_R009NNNYN_partial_00_0243,
  rs_R009_ueqv_R009NNNYN_partial_00_0244,
  rs_R009_ueqv_R009NNNYN_partial_00_0245,
  rs_R009_ueqv_R009NNNYN_partial_00_0246,
  rs_R009_ueqv_R009NNNYN_partial_00_0247,
  rs_R009_ueqv_R009NNNYN_partial_00_0248,
  rs_R009_ueqv_R009NNNYN_partial_00_0249,
  rs_R009_ueqv_R009NNNYN_partial_00_0250,
  rs_R009_ueqv_R009NNNYN_partial_00_0251,
  rs_R009_ueqv_R009NNNYN_partial_00_0252,
  rs_R009_ueqv_R009NNNYN_partial_00_0253,
  rs_R009_ueqv_R009NNNYN_partial_00_0254,
  rs_R009_ueqv_R009NNNYN_partial_00_0255,
  rs_R009_ueqv_R009NNNYN_partial_00_0256,
  rs_R009_ueqv_R009NNNYN_partial_00_0257,
  rs_R009_ueqv_R009NNNYN_partial_00_0258,
  rs_R009_ueqv_R009NNNYN_partial_00_0259,
  rs_R009_ueqv_R009NNNYN_partial_00_0260,
  rs_R009_ueqv_R009NNNYN_partial_00_0261,
  rs_R009_ueqv_R009NNNYN_partial_00_0262,
  rs_R009_ueqv_R009NNNYN_partial_00_0263,
  rs_R009_ueqv_R009NNNYN_partial_00_0264,
  rs_R009_ueqv_R009NNNYN_partial_00_0265,
  rs_R009_ueqv_R009NNNYN_partial_00_0266,
  rs_R009_ueqv_R009NNNYN_partial_00_0267,
  rs_R009_ueqv_R009NNNYN_partial_00_0268,
  rs_R009_ueqv_R009NNNYN_partial_00_0269,
  rs_R009_ueqv_R009NNNYN_partial_00_0270,
  rs_R009_ueqv_R009NNNYN_partial_00_0271,
  rs_R009_ueqv_R009NNNYN_partial_00_0272,
  rs_R009_ueqv_R009NNNYN_partial_00_0273,
  rs_R009_ueqv_R009NNNYN_partial_00_0274,
  rs_R009_ueqv_R009NNNYN_partial_00_0275,
  rs_R009_ueqv_R009NNNYN_partial_00_0276,
  rs_R009_ueqv_R009NNNYN_partial_00_0277,
  rs_R009_ueqv_R009NNNYN_partial_00_0278,
  rs_R009_ueqv_R009NNNYN_partial_00_0279,
  rs_R009_ueqv_R009NNNYN_partial_00_0280,
  rs_R009_ueqv_R009NNNYN_partial_00_0281,
  rs_R009_ueqv_R009NNNYN_partial_00_0282,
  rs_R009_ueqv_R009NNNYN_partial_00_0283,
  rs_R009_ueqv_R009NNNYN_partial_00_0284,
  rs_R009_ueqv_R009NNNYN_partial_00_0285,
  rs_R009_ueqv_R009NNNYN_partial_00_0286,
  rs_R009_ueqv_R009NNNYN_partial_00_0287,
  rs_R009_ueqv_R009NNNYN_partial_00_0288,
  rs_R009_ueqv_R009NNNYN_partial_00_0289,
  rs_R009_ueqv_R009NNNYN_partial_00_0290,
  rs_R009_ueqv_R009NNNYN_partial_00_0291,
  rs_R009_ueqv_R009NNNYN_partial_00_0292,
  rs_R009_ueqv_R009NNNYN_partial_00_0293,
  rs_R009_ueqv_R009NNNYN_partial_00_0294,
  rs_R009_ueqv_R009NNNYN_partial_00_0295,
  rs_R009_ueqv_R009NNNYN_partial_00_0296,
  rs_R009_ueqv_R009NNNYN_partial_00_0297,
  rs_R009_ueqv_R009NNNYN_partial_00_0298,
  rs_R009_ueqv_R009NNNYN_partial_00_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_00_0200_0299 : Poly :=
[
  term ((6365488640 : Rat) / 110226591) [(0, 2), (5, 1), (9, 1), (11, 2)],
  term ((-294955080 : Rat) / 12247399) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-123 : Rat) / 67) [(0, 2), (5, 1), (9, 1), (14, 1)],
  term ((4881400534 : Rat) / 110226591) [(0, 2), (5, 1), (9, 1), (15, 2)],
  term ((11025602336 : Rat) / 6282915687) [(0, 2), (5, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 465401162) [(0, 2), (5, 1), (9, 2), (13, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(0, 2), (5, 1), (9, 2), (15, 1)],
  term ((-19496960 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((19496960 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-304640 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((304640 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((4798512052 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1)],
  term ((225164800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-225164800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60623360 : Rat) / 36742197) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9916867252 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((32204800 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((1706118400 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (14, 2)],
  term ((62842880 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(0, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((10554600 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10554600 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((262276628 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-262276628 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((74051341 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1)],
  term ((-154025641 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((685440 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((79974300 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 2)],
  term ((68451520 : Rat) / 36742197) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((-8910720 : Rat) / 12247399) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((8618026307 : Rat) / 330679773) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(0, 2), (5, 1), (14, 1), (15, 3)],
  term ((-1538553200 : Rat) / 110226591) [(0, 2), (5, 1), (14, 2), (15, 1)],
  term ((-4002366707 : Rat) / 330679773) [(0, 2), (5, 1), (15, 1)],
  term ((-24175360 : Rat) / 36742197) [(0, 2), (5, 1), (15, 3)],
  term ((-507 : Rat) / 268) [(0, 2), (7, 1), (9, 1)],
  term ((99460760 : Rat) / 12247399) [(0, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-26417483816414 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((3565074148832 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6365488640 : Rat) / 330679773) [(0, 2), (7, 1), (9, 1), (11, 2)],
  term ((-260125981976 : Rat) / 17452543575) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((111408567151 : Rat) / 34905087150) [(0, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((16063263688672 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (15, 2)],
  term ((-4072972915936 : Rat) / 471218676525) [(0, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((11025602336 : Rat) / 18848747061) [(0, 2), (7, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 1396203486) [(0, 2), (7, 1), (9, 2), (13, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(0, 2), (7, 1), (9, 2), (15, 1)],
  term ((165906242432 : Rat) / 31414578435) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((2592285038 : Rat) / 1163502905) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((8029168110697 : Rat) / 471218676525) [(0, 2), (7, 1), (11, 1)],
  term ((23507742272 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((90576640 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7159040 : Rat) / 12247399) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((30961795424 : Rat) / 2755664775) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(0, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3290739200 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (14, 2)],
  term ((-1299252320 : Rat) / 36742197) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 201) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((48742400 : Rat) / 110226591) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((367308473 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((4245780 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-81680720 : Rat) / 110226591) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20577070762 : Rat) / 330679773) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(0, 2), (7, 1), (12, 1), (15, 3)],
  term ((129810061871 : Rat) / 34905087150) [(0, 2), (7, 1), (13, 1)],
  term ((2902668321 : Rat) / 612369950) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-5244160 : Rat) / 110226591) [(0, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-154253400 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-5741840 : Rat) / 231083) [(0, 2), (7, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(0, 2), (7, 1), (13, 2), (15, 1)],
  term ((-43303272352 : Rat) / 2755664775) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(0, 2), (7, 1), (14, 1), (15, 3)],
  term ((2967541600 : Rat) / 110226591) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-4272356501099 : Rat) / 1884874706100) [(0, 2), (7, 1), (15, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((5769928000 : Rat) / 110226591) [(0, 2), (7, 1), (15, 3)],
  term ((632 : Rat) / 67) [(0, 2), (7, 2)],
  term ((-3840714207232 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (11, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(0, 2), (7, 2), (9, 1), (13, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(0, 2), (7, 2), (9, 1), (15, 1)],
  term ((-198921520 : Rat) / 12247399) [(0, 2), (7, 2), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1)],
  term ((-1096478030144 : Rat) / 157072892175) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(0, 2), (7, 2), (11, 2)],
  term ((6365488640 : Rat) / 110226591) [(1, 2), (5, 1), (9, 1), (11, 2)],
  term ((-294955080 : Rat) / 12247399) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-123 : Rat) / 67) [(1, 2), (5, 1), (9, 1), (14, 1)],
  term ((4881400534 : Rat) / 110226591) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((11025602336 : Rat) / 6282915687) [(1, 2), (5, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 465401162) [(1, 2), (5, 1), (9, 2), (13, 1)],
  term ((-19226441917 : Rat) / 6282915687) [(1, 2), (5, 1), (9, 2), (15, 1)],
  term ((-19496960 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((19496960 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-304640 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((304640 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 330679773) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((4798512052 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1)],
  term ((225164800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-225164800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60623360 : Rat) / 36742197) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9916867252 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((32204800 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((1706118400 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (14, 2)],
  term ((62842880 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(1, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((10554600 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-10554600 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((262276628 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-262276628 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((74051341 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1)],
  term ((-154025641 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((685440 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((79974300 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((68451520 : Rat) / 36742197) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-8910720 : Rat) / 12247399) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((8618026307 : Rat) / 330679773) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(1, 2), (5, 1), (14, 1), (15, 3)],
  term ((-1538553200 : Rat) / 110226591) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((-4002366707 : Rat) / 330679773) [(1, 2), (5, 1), (15, 1)],
  term ((-24175360 : Rat) / 36742197) [(1, 2), (5, 1), (15, 3)],
  term ((-507 : Rat) / 268) [(1, 2), (7, 1), (9, 1)],
  term ((99460760 : Rat) / 12247399) [(1, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-26417483816414 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((3565074148832 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6365488640 : Rat) / 330679773) [(1, 2), (7, 1), (9, 1), (11, 2)],
  term ((-260125981976 : Rat) / 17452543575) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((111408567151 : Rat) / 34905087150) [(1, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((16063263688672 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (15, 2)],
  term ((-4072972915936 : Rat) / 471218676525) [(1, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((11025602336 : Rat) / 18848747061) [(1, 2), (7, 1), (9, 2), (11, 1)],
  term ((344550073 : Rat) / 1396203486) [(1, 2), (7, 1), (9, 2), (13, 1)],
  term ((-19226441917 : Rat) / 18848747061) [(1, 2), (7, 1), (9, 2), (15, 1)],
  term ((165906242432 : Rat) / 31414578435) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((2592285038 : Rat) / 1163502905) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-149611879336 : Rat) / 31414578435) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((8029168110697 : Rat) / 471218676525) [(1, 2), (7, 1), (11, 1)],
  term ((23507742272 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((90576640 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7159040 : Rat) / 12247399) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((30961795424 : Rat) / 2755664775) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(1, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((51671462864 : Rat) / 24800982975) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3290739200 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (14, 2)],
  term ((-1299252320 : Rat) / 36742197) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-1160 : Rat) / 201) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-101273428814 : Rat) / 24800982975) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((367308473 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((4245780 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((18278400 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-81680720 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20577070762 : Rat) / 330679773) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 134) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (15, 3)],
  term ((129810061871 : Rat) / 34905087150) [(1, 2), (7, 1), (13, 1)],
  term ((2902668321 : Rat) / 612369950) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-5244160 : Rat) / 110226591) [(1, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-154253400 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-5741840 : Rat) / 231083) [(1, 2), (7, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((2056320 : Rat) / 12247399) [(1, 2), (7, 1), (13, 2), (15, 1)],
  term ((-43303272352 : Rat) / 2755664775) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-10320522397 : Rat) / 24800982975) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8791040 : Rat) / 36742197) [(1, 2), (7, 1), (14, 1), (15, 3)],
  term ((2967541600 : Rat) / 110226591) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-4272356501099 : Rat) / 1884874706100) [(1, 2), (7, 1), (15, 1)],
  term ((-30318188881 : Rat) / 49601965950) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((5769928000 : Rat) / 110226591) [(1, 2), (7, 1), (15, 3)],
  term ((632 : Rat) / 67) [(1, 2), (7, 2)],
  term ((-3840714207232 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (11, 1)],
  term ((-60011159488 : Rat) / 17452543575) [(1, 2), (7, 2), (9, 1), (13, 1)],
  term ((4553633963861 : Rat) / 471218676525) [(1, 2), (7, 2), (9, 1), (15, 1)],
  term ((-198921520 : Rat) / 12247399) [(1, 2), (7, 2), (11, 1), (13, 1)],
  term ((16876615721876 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1)],
  term ((-1096478030144 : Rat) / 157072892175) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 330679773) [(1, 2), (7, 2), (11, 2)],
  term ((-6365488640 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (11, 2)],
  term ((294955080 : Rat) / 12247399) [(4, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((123 : Rat) / 67) [(4, 2), (5, 1), (9, 1), (14, 1)],
  term ((-4881400534 : Rat) / 110226591) [(4, 2), (5, 1), (9, 1), (15, 2)],
  term ((-11025602336 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 465401162) [(4, 2), (5, 1), (9, 2), (13, 1)],
  term ((19226441917 : Rat) / 6282915687) [(4, 2), (5, 1), (9, 2), (15, 1)],
  term ((19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (11, 1), (14, 1)],
  term ((304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(4, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(4, 2), (5, 1), (10, 1), (15, 1)],
  term ((-4798512052 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1)],
  term ((-225164800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((225164800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((60623360 : Rat) / 36742197) [(4, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((9916867252 : Rat) / 330679773) [(4, 2), (5, 1), (11, 1), (14, 1)],
  term ((-32204800 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1706118400 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (14, 2)],
  term ((-62842880 : Rat) / 110226591) [(4, 2), (5, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (5, 1), (11, 2), (15, 1)],
  term ((-10554600 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((10554600 : Rat) / 12247399) [(4, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-262276628 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((262276628 : Rat) / 110226591) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((-74051341 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1)],
  term ((154025641 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-79974300 : Rat) / 12247399) [(4, 2), (5, 1), (13, 1), (14, 2)],
  term ((-68451520 : Rat) / 36742197) [(4, 2), (5, 1), (13, 1), (15, 2)],
  term ((8910720 : Rat) / 12247399) [(4, 2), (5, 1), (13, 2), (15, 1)],
  term ((-8618026307 : Rat) / 330679773) [(4, 2), (5, 1), (14, 1), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(4, 2), (5, 1), (14, 1), (15, 3)],
  term ((1538553200 : Rat) / 110226591) [(4, 2), (5, 1), (14, 2), (15, 1)],
  term ((4002366707 : Rat) / 330679773) [(4, 2), (5, 1), (15, 1)],
  term ((24175360 : Rat) / 36742197) [(4, 2), (5, 1), (15, 3)],
  term ((507 : Rat) / 268) [(4, 2), (7, 1), (9, 1)],
  term ((-99460760 : Rat) / 12247399) [(4, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3565074148832 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 330679773) [(4, 2), (7, 1), (9, 1), (11, 2)],
  term ((260125981976 : Rat) / 17452543575) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-111408567151 : Rat) / 34905087150) [(4, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-16063263688672 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2)],
  term ((4072972915936 : Rat) / 471218676525) [(4, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 1396203486) [(4, 2), (7, 1), (9, 2), (13, 1)],
  term ((19226441917 : Rat) / 18848747061) [(4, 2), (7, 1), (9, 2), (15, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (11, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(4, 2), (7, 1), (10, 1), (13, 1)],
  term ((149611879336 : Rat) / 31414578435) [(4, 2), (7, 1), (10, 1), (15, 1)],
  term ((-8029168110697 : Rat) / 471218676525) [(4, 2), (7, 1), (11, 1)],
  term ((-23507742272 : Rat) / 330679773) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((-90576640 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7159040 : Rat) / 12247399) [(4, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-30961795424 : Rat) / 2755664775) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((3290739200 : Rat) / 110226591) [(4, 2), (7, 1), (11, 1), (14, 2)],
  term ((1299252320 : Rat) / 36742197) [(4, 2), (7, 1), (11, 1), (15, 2)],
  term ((1160 : Rat) / 201) [(4, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-48742400 : Rat) / 110226591) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-367308473 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((-4245780 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(4, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((20577070762 : Rat) / 330679773) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 134) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(4, 2), (7, 1), (12, 1), (15, 3)],
  term ((-129810061871 : Rat) / 34905087150) [(4, 2), (7, 1), (13, 1)],
  term ((-2902668321 : Rat) / 612369950) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(4, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((154253400 : Rat) / 12247399) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((5741840 : Rat) / 231083) [(4, 2), (7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(4, 2), (7, 1), (13, 2), (15, 1)],
  term ((43303272352 : Rat) / 2755664775) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 24800982975) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(4, 2), (7, 1), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((4272356501099 : Rat) / 1884874706100) [(4, 2), (7, 1), (15, 1)],
  term ((30318188881 : Rat) / 49601965950) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(4, 2), (7, 1), (15, 3)],
  term ((-632 : Rat) / 67) [(4, 2), (7, 2)],
  term ((3840714207232 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (11, 1)],
  term ((60011159488 : Rat) / 17452543575) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (15, 1)],
  term ((198921520 : Rat) / 12247399) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(4, 2), (7, 2), (11, 2)],
  term ((507 : Rat) / 268) [(5, 2), (7, 1), (9, 1)],
  term ((-99460760 : Rat) / 12247399) [(5, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((26417483816414 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-3565074148832 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6365488640 : Rat) / 330679773) [(5, 2), (7, 1), (9, 1), (11, 2)],
  term ((260125981976 : Rat) / 17452543575) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-111408567151 : Rat) / 34905087150) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-16063263688672 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2)],
  term ((4072972915936 : Rat) / 471218676525) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11025602336 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 1396203486) [(5, 2), (7, 1), (9, 2), (13, 1)],
  term ((19226441917 : Rat) / 18848747061) [(5, 2), (7, 1), (9, 2), (15, 1)],
  term ((-165906242432 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (11, 1)],
  term ((-2592285038 : Rat) / 1163502905) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((149611879336 : Rat) / 31414578435) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((-8029168110697 : Rat) / 471218676525) [(5, 2), (7, 1), (11, 1)],
  term ((-23507742272 : Rat) / 330679773) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-90576640 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7159040 : Rat) / 12247399) [(5, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-30961795424 : Rat) / 2755664775) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-51671462864 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((3290739200 : Rat) / 110226591) [(5, 2), (7, 1), (11, 1), (14, 2)],
  term ((1299252320 : Rat) / 36742197) [(5, 2), (7, 1), (11, 1), (15, 2)],
  term ((1160 : Rat) / 201) [(5, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((101273428814 : Rat) / 24800982975) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-48742400 : Rat) / 110226591) [(5, 2), (7, 1), (11, 2), (15, 1)],
  term ((-367308473 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-4245780 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(5, 2), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((20577070762 : Rat) / 330679773) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 134) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(5, 2), (7, 1), (12, 1), (15, 3)],
  term ((-129810061871 : Rat) / 34905087150) [(5, 2), (7, 1), (13, 1)],
  term ((-2902668321 : Rat) / 612369950) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((5244160 : Rat) / 110226591) [(5, 2), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 3674219700) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((154253400 : Rat) / 12247399) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((5741840 : Rat) / 231083) [(5, 2), (7, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 3674219700) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2056320 : Rat) / 12247399) [(5, 2), (7, 1), (13, 2), (15, 1)],
  term ((43303272352 : Rat) / 2755664775) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((10320522397 : Rat) / 24800982975) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 2), (7, 1), (14, 1), (15, 3)],
  term ((-2967541600 : Rat) / 110226591) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((4272356501099 : Rat) / 1884874706100) [(5, 2), (7, 1), (15, 1)],
  term ((30318188881 : Rat) / 49601965950) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5769928000 : Rat) / 110226591) [(5, 2), (7, 1), (15, 3)],
  term ((-632 : Rat) / 67) [(5, 2), (7, 2)],
  term ((3840714207232 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (11, 1)],
  term ((60011159488 : Rat) / 17452543575) [(5, 2), (7, 2), (9, 1), (13, 1)],
  term ((-4553633963861 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (15, 1)],
  term ((198921520 : Rat) / 12247399) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-16876615721876 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((1096478030144 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12730977280 : Rat) / 330679773) [(5, 2), (7, 2), (11, 2)],
  term ((-6365488640 : Rat) / 110226591) [(5, 3), (9, 1), (11, 2)],
  term ((294955080 : Rat) / 12247399) [(5, 3), (9, 1), (13, 1), (15, 1)],
  term ((123 : Rat) / 67) [(5, 3), (9, 1), (14, 1)],
  term ((-4881400534 : Rat) / 110226591) [(5, 3), (9, 1), (15, 2)],
  term ((-11025602336 : Rat) / 6282915687) [(5, 3), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 465401162) [(5, 3), (9, 2), (13, 1)],
  term ((19226441917 : Rat) / 6282915687) [(5, 3), (9, 2), (15, 1)],
  term ((19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1)],
  term ((-19496960 : Rat) / 330679773) [(5, 3), (10, 1), (11, 1), (14, 1)],
  term ((304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1)],
  term ((-304640 : Rat) / 12247399) [(5, 3), (10, 1), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 330679773) [(5, 3), (10, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 330679773) [(5, 3), (10, 1), (15, 1)],
  term ((-4798512052 : Rat) / 330679773) [(5, 3), (11, 1)],
  term ((-225164800 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1)],
  term ((225164800 : Rat) / 110226591) [(5, 3), (11, 1), (12, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 3), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((60623360 : Rat) / 36742197) [(5, 3), (11, 1), (13, 1), (15, 1)],
  term ((9916867252 : Rat) / 330679773) [(5, 3), (11, 1), (14, 1)],
  term ((-32204800 : Rat) / 110226591) [(5, 3), (11, 1), (14, 1), (15, 2)],
  term ((-1706118400 : Rat) / 110226591) [(5, 3), (11, 1), (14, 2)],
  term ((-62842880 : Rat) / 110226591) [(5, 3), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(5, 3), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 3), (11, 2), (15, 1)],
  term ((-10554600 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1)],
  term ((10554600 : Rat) / 12247399) [(5, 3), (12, 1), (13, 1), (14, 1)],
  term ((-262276628 : Rat) / 110226591) [(5, 3), (12, 1), (14, 1), (15, 1)],
  term ((262276628 : Rat) / 110226591) [(5, 3), (12, 1), (15, 1)],
  term ((-74051341 : Rat) / 12247399) [(5, 3), (13, 1)],
  term ((154025641 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(5, 3), (13, 1), (14, 1), (15, 2)],
  term ((-79974300 : Rat) / 12247399) [(5, 3), (13, 1), (14, 2)],
  term ((-68451520 : Rat) / 36742197) [(5, 3), (13, 1), (15, 2)],
  term ((8910720 : Rat) / 12247399) [(5, 3), (13, 2), (15, 1)],
  term ((-8618026307 : Rat) / 330679773) [(5, 3), (14, 1), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(5, 3), (14, 1), (15, 3)],
  term ((1538553200 : Rat) / 110226591) [(5, 3), (14, 2), (15, 1)],
  term ((4002366707 : Rat) / 330679773) [(5, 3), (15, 1)],
  term ((24175360 : Rat) / 36742197) [(5, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NNNYN_block_00_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_00_0200_0299
      rs_R009_ueqv_R009NNNYN_block_00_0200_0299 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
