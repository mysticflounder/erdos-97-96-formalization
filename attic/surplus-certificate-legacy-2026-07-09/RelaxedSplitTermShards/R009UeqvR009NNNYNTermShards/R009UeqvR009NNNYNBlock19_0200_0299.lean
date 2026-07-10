/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0200 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 200 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0200 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0200
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0201 : Poly :=
[
  term ((-13414100 : Rat) / 12247399) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 201 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0201 : Poly :=
[
  term ((13414100 : Rat) / 12247399) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-26828200 : Rat) / 12247399) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0201
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0202 : Poly :=
[
  term ((774185200 : Rat) / 330679773) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 202 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0202 : Poly :=
[
  term ((-774185200 : Rat) / 330679773) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((1548370400 : Rat) / 330679773) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0202
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0203 : Poly :=
[
  term ((63690007717 : Rat) / 3490508715) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 203 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0203 : Poly :=
[
  term ((-63690007717 : Rat) / 3490508715) [(1, 1), (8, 1), (13, 1)],
  term ((127380015434 : Rat) / 3490508715) [(1, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0203
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0204 : Poly :=
[
  term ((-30398956 : Rat) / 12247399) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 204 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0204 : Poly :=
[
  term ((30398956 : Rat) / 12247399) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-60797912 : Rat) / 12247399) [(1, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0204
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0205 : Poly :=
[
  term ((-2981120 : Rat) / 110226591) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 205 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0205 : Poly :=
[
  term ((2981120 : Rat) / 110226591) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0205
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0206 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 206 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0206 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (8, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0206
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0207 : Poly :=
[
  term ((1754454032 : Rat) / 330679773) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 207 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0207 : Poly :=
[
  term ((-1754454032 : Rat) / 330679773) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((3508908064 : Rat) / 330679773) [(1, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0207
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0208 : Poly :=
[
  term ((-3813672348194 : Rat) / 94243735305) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 208 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0208 : Poly :=
[
  term ((3813672348194 : Rat) / 94243735305) [(1, 1), (8, 1), (15, 1)],
  term ((-7627344696388 : Rat) / 94243735305) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0208
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0209 : Poly :=
[
  term ((43955200 : Rat) / 110226591) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 209 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0209 : Poly :=
[
  term ((-43955200 : Rat) / 110226591) [(1, 1), (8, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0209
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0210 : Poly :=
[
  term ((27 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 210 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0210 : Poly :=
[
  term ((54 : Rat) / 67) [(1, 1), (8, 1), (9, 1)],
  term ((-27 : Rat) / 67) [(1, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0210
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0211 : Poly :=
[
  term ((-828 : Rat) / 67) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 211 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0211 : Poly :=
[
  term ((-1656 : Rat) / 67) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((828 : Rat) / 67) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0211
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0212 : Poly :=
[
  term ((17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 212 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0212 : Poly :=
[
  term ((34033664 : Rat) / 182797) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0212
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0213 : Poly :=
[
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 213 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0213 : Poly :=
[
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0213
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0214 : Poly :=
[
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 214 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0214 : Poly :=
[
  term ((14357952 : Rat) / 182797) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0214
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0215 : Poly :=
[
  term ((949672005944 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 215 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0215 : Poly :=
[
  term ((1899344011888 : Rat) / 31414578435) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-949672005944 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0215
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0216 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 216 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0216 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0216
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0217 : Poly :=
[
  term ((43258880 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 217 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0217 : Poly :=
[
  term ((86517760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43258880 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0217
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0218 : Poly :=
[
  term ((219790592 : Rat) / 6239241) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 218 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0218 : Poly :=
[
  term ((439581184 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-219790592 : Rat) / 6239241) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0218
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0219 : Poly :=
[
  term ((-65105920 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 219 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0219 : Poly :=
[
  term ((-130211840 : Rat) / 36742197) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((65105920 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0219
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0220 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 220 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0220 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0220
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0221 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 221 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0221 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0221
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0222 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 222 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0222 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0222
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0223 : Poly :=
[
  term ((13959485771 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 223 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0223 : Poly :=
[
  term ((27918971542 : Rat) / 1163502905) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-13959485771 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0223
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0224 : Poly :=
[
  term ((3434228 : Rat) / 231083) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 224 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0224 : Poly :=
[
  term ((6868456 : Rat) / 231083) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3434228 : Rat) / 231083) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0224
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0225 : Poly :=
[
  term ((26938880 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 225 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0225 : Poly :=
[
  term ((53877760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-26938880 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0225
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0226 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 226 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0226 : Poly :=
[
  term ((-3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0226
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0227 : Poly :=
[
  term ((-198204016 : Rat) / 6239241) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 227 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0227 : Poly :=
[
  term ((-396408032 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((198204016 : Rat) / 6239241) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0227
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0228 : Poly :=
[
  term ((-897561113992 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 228 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0228 : Poly :=
[
  term ((-1795122227984 : Rat) / 31414578435) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((897561113992 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0228
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0229 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 3)]
]

/-- Partial product 229 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0229 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0229
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0230 : Poly :=
[
  term ((3616138137472 : Rat) / 94243735305) [(1, 1), (10, 2), (11, 1)]
]

/-- Partial product 230 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0230 : Poly :=
[
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(1, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0230
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0231 : Poly :=
[
  term ((56502158398 : Rat) / 3490508715) [(1, 1), (10, 2), (13, 1)]
]

/-- Partial product 231 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0231 : Poly :=
[
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(1, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0231
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0232 : Poly :=
[
  term ((-3260981713256 : Rat) / 94243735305) [(1, 1), (10, 2), (15, 1)]
]

/-- Partial product 232 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0232 : Poly :=
[
  term ((-6521963426512 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(1, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0232
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0233 : Poly :=
[
  term ((305113458964 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

/-- Partial product 233 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0233 : Poly :=
[
  term ((610226917928 : Rat) / 94243735305) [(1, 1), (8, 1), (11, 1)],
  term ((-305113458964 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0233
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0234 : Poly :=
[
  term ((-993725824 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 234 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0234 : Poly :=
[
  term ((-1987451648 : Rat) / 12247399) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((993725824 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0234
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0235 : Poly :=
[
  term ((1066240 : Rat) / 1645173) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 235 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0235 : Poly :=
[
  term ((2132480 : Rat) / 1645173) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1066240 : Rat) / 1645173) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0235
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0236 : Poly :=
[
  term ((3691748480 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 236 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0236 : Poly :=
[
  term ((7383496960 : Rat) / 330679773) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3691748480 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0236
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0237 : Poly :=
[
  term ((-107494400 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 237 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0237 : Poly :=
[
  term ((-214988800 : Rat) / 110226591) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((107494400 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0237
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0238 : Poly :=
[
  term ((48742400 : Rat) / 36742197) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 238 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0238 : Poly :=
[
  term ((97484800 : Rat) / 36742197) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-48742400 : Rat) / 36742197) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0238
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0239 : Poly :=
[
  term ((-419228082 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0239 : Poly :=
[
  term ((-838456164 : Rat) / 12247399) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((419228082 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0239
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0240 : Poly :=
[
  term ((869804984 : Rat) / 12247399) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0240 : Poly :=
[
  term ((1739609968 : Rat) / 12247399) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-869804984 : Rat) / 12247399) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0240
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0241 : Poly :=
[
  term ((6897377627 : Rat) / 6981017430) [(1, 1), (13, 1)]
]

/-- Partial product 241 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0241 : Poly :=
[
  term ((6897377627 : Rat) / 3490508715) [(1, 1), (8, 1), (13, 1)],
  term ((-6897377627 : Rat) / 6981017430) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0241
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0242 : Poly :=
[
  term ((57683570 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 242 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0242 : Poly :=
[
  term ((115367140 : Rat) / 12247399) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-57683570 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0242
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0243 : Poly :=
[
  term ((1490560 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 243 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0243 : Poly :=
[
  term ((2981120 : Rat) / 110226591) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1490560 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0243
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0244 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 244 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0244 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0244
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0245 : Poly :=
[
  term ((-3329166040 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 245 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0245 : Poly :=
[
  term ((-6658332080 : Rat) / 330679773) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((3329166040 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0245
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0246 : Poly :=
[
  term ((-130114088687 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

/-- Partial product 246 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0246 : Poly :=
[
  term ((-260228177374 : Rat) / 94243735305) [(1, 1), (8, 1), (15, 1)],
  term ((130114088687 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0246
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0247 : Poly :=
[
  term ((-21977600 : Rat) / 110226591) [(1, 1), (15, 3)]
]

/-- Partial product 247 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0247 : Poly :=
[
  term ((-43955200 : Rat) / 110226591) [(1, 1), (8, 1), (15, 3)],
  term ((21977600 : Rat) / 110226591) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0247
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0248 : Poly :=
[
  term ((-953128960 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 248 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0248 : Poly :=
[
  term ((-1906257920 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((953128960 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0248
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0249 : Poly :=
[
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 249 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0249 : Poly :=
[
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0249
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0250 : Poly :=
[
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 250 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0250 : Poly :=
[
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0250
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0251 : Poly :=
[
  term ((-838369280 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 251 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0251 : Poly :=
[
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0251
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0252 : Poly :=
[
  term ((-41961920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 252 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0252 : Poly :=
[
  term ((-83923840 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0252
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0253 : Poly :=
[
  term ((2421802240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 253 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0253 : Poly :=
[
  term ((4843604480 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0253
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0254 : Poly :=
[
  term ((-44677920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 254 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0254 : Poly :=
[
  term ((-89355840 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((44677920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0254
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0255 : Poly :=
[
  term ((-101221120 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 255 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0255 : Poly :=
[
  term ((-202442240 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0255
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0256 : Poly :=
[
  term ((-39298560 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 256 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0256 : Poly :=
[
  term ((-78597120 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0256
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0257 : Poly :=
[
  term ((5841904640 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 257 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0257 : Poly :=
[
  term ((11683809280 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0257
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0258 : Poly :=
[
  term ((859518080 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 258 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0258 : Poly :=
[
  term ((1719036160 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-859518080 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0258
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0259 : Poly :=
[
  term ((756029440 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 3)]
]

/-- Partial product 259 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0259 : Poly :=
[
  term ((1512058880 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0259
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0260 : Poly :=
[
  term ((1657832960 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)]
]

/-- Partial product 260 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0260 : Poly :=
[
  term ((3315665920 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1657832960 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0260
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0261 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 261 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0261 : Poly :=
[
  term ((2685562880 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0261
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0262 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 262 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0262 : Poly :=
[
  term ((6478151680 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0262
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0263 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 263 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0263 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0263
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0264 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 264 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0264 : Poly :=
[
  term ((41961920 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0264
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0265 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 265 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0265 : Poly :=
[
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0265
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0266 : Poly :=
[
  term ((25903640 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

/-- Partial product 266 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0266 : Poly :=
[
  term ((51807280 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-25903640 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0266
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0267 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 267 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0267 : Poly :=
[
  term ((101221120 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0267
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0268 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 268 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0268 : Poly :=
[
  term ((39298560 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0268
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0269 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 269 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0269 : Poly :=
[
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0269
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0270 : Poly :=
[
  term ((-1495010080 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 270 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0270 : Poly :=
[
  term ((-2990020160 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((1495010080 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0270
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0271 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (15, 3)]
]

/-- Partial product 271 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0271 : Poly :=
[
  term ((-756029440 : Rat) / 110226591) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0271
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0272 : Poly :=
[
  term ((-1165373440 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 272 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0272 : Poly :=
[
  term ((-2330746880 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((1165373440 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0272
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0273 : Poly :=
[
  term ((-18208960 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 273 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0273 : Poly :=
[
  term ((-36417920 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((18208960 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0273
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0274 : Poly :=
[
  term ((1050917120 : Rat) / 330679773) [(2, 1), (4, 1), (15, 2)]
]

/-- Partial product 274 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0274 : Poly :=
[
  term ((2101834240 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-1050917120 : Rat) / 330679773) [(2, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0274
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0275 : Poly :=
[
  term ((4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)]
]

/-- Partial product 275 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0275 : Poly :=
[
  term ((9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0275
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0276 : Poly :=
[
  term ((2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 276 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0276 : Poly :=
[
  term ((5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0276
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0277 : Poly :=
[
  term ((6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 277 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0277 : Poly :=
[
  term ((12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0277
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0278 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 278 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0278 : Poly :=
[
  term ((1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-838369280 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0278
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0279 : Poly :=
[
  term ((41961920 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 279 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0279 : Poly :=
[
  term ((83923840 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-41961920 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0279
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0280 : Poly :=
[
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 280 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0280 : Poly :=
[
  term ((-4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0280
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0281 : Poly :=
[
  term ((74397680 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 281 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0281 : Poly :=
[
  term ((148795360 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-74397680 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0281
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0282 : Poly :=
[
  term ((101221120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 282 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0282 : Poly :=
[
  term ((202442240 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-101221120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0282
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0283 : Poly :=
[
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 283 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0283 : Poly :=
[
  term ((78597120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-39298560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0283
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0284 : Poly :=
[
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 284 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0284 : Poly :=
[
  term ((-11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0284
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0285 : Poly :=
[
  term ((-4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 285 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0285 : Poly :=
[
  term ((-8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0285
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0286 : Poly :=
[
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (15, 3)]
]

/-- Partial product 286 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0286 : Poly :=
[
  term ((-1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((756029440 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0286
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0287 : Poly :=
[
  term ((-1657832960 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1)]
]

/-- Partial product 287 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0287 : Poly :=
[
  term ((1657832960 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((-3315665920 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0287
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0288 : Poly :=
[
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 288 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0288 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0288
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0289 : Poly :=
[
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 289 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0289 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0289
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0290 : Poly :=
[
  term ((-419184640 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 290 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0290 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-838369280 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0290
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0291 : Poly :=
[
  term ((-20980960 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 291 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0291 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-41961920 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0291_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0291
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0292 : Poly :=
[
  term ((1210901120 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 292 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0292 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0292_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0292
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0293 : Poly :=
[
  term ((-25903640 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1)]
]

/-- Partial product 293 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0293 : Poly :=
[
  term ((25903640 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((-51807280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0293_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0293
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0294 : Poly :=
[
  term ((-50610560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 294 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0294 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-101221120 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0294_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0294
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0295 : Poly :=
[
  term ((-19649280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 295 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0295 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-39298560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0295_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0295
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0296 : Poly :=
[
  term ((2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 296 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0296 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0296_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0296
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0297 : Poly :=
[
  term ((1495010080 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (15, 1)]
]

/-- Partial product 297 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0297 : Poly :=
[
  term ((-1495010080 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((2990020160 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0297_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0297
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0298 : Poly :=
[
  term ((378014720 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (15, 3)]
]

/-- Partial product 298 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0298 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((756029440 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0298_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0298
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_0299 : Poly :=
[
  term ((-2274702080 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 299 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_0299 : Poly :=
[
  term ((-4549404160 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((2274702080 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_0299_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_0299
        rs_R009_ueqv_R009NNNYN_generator_19_0200_0299 =
      rs_R009_ueqv_R009NNNYN_partial_19_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_0200,
  rs_R009_ueqv_R009NNNYN_partial_19_0201,
  rs_R009_ueqv_R009NNNYN_partial_19_0202,
  rs_R009_ueqv_R009NNNYN_partial_19_0203,
  rs_R009_ueqv_R009NNNYN_partial_19_0204,
  rs_R009_ueqv_R009NNNYN_partial_19_0205,
  rs_R009_ueqv_R009NNNYN_partial_19_0206,
  rs_R009_ueqv_R009NNNYN_partial_19_0207,
  rs_R009_ueqv_R009NNNYN_partial_19_0208,
  rs_R009_ueqv_R009NNNYN_partial_19_0209,
  rs_R009_ueqv_R009NNNYN_partial_19_0210,
  rs_R009_ueqv_R009NNNYN_partial_19_0211,
  rs_R009_ueqv_R009NNNYN_partial_19_0212,
  rs_R009_ueqv_R009NNNYN_partial_19_0213,
  rs_R009_ueqv_R009NNNYN_partial_19_0214,
  rs_R009_ueqv_R009NNNYN_partial_19_0215,
  rs_R009_ueqv_R009NNNYN_partial_19_0216,
  rs_R009_ueqv_R009NNNYN_partial_19_0217,
  rs_R009_ueqv_R009NNNYN_partial_19_0218,
  rs_R009_ueqv_R009NNNYN_partial_19_0219,
  rs_R009_ueqv_R009NNNYN_partial_19_0220,
  rs_R009_ueqv_R009NNNYN_partial_19_0221,
  rs_R009_ueqv_R009NNNYN_partial_19_0222,
  rs_R009_ueqv_R009NNNYN_partial_19_0223,
  rs_R009_ueqv_R009NNNYN_partial_19_0224,
  rs_R009_ueqv_R009NNNYN_partial_19_0225,
  rs_R009_ueqv_R009NNNYN_partial_19_0226,
  rs_R009_ueqv_R009NNNYN_partial_19_0227,
  rs_R009_ueqv_R009NNNYN_partial_19_0228,
  rs_R009_ueqv_R009NNNYN_partial_19_0229,
  rs_R009_ueqv_R009NNNYN_partial_19_0230,
  rs_R009_ueqv_R009NNNYN_partial_19_0231,
  rs_R009_ueqv_R009NNNYN_partial_19_0232,
  rs_R009_ueqv_R009NNNYN_partial_19_0233,
  rs_R009_ueqv_R009NNNYN_partial_19_0234,
  rs_R009_ueqv_R009NNNYN_partial_19_0235,
  rs_R009_ueqv_R009NNNYN_partial_19_0236,
  rs_R009_ueqv_R009NNNYN_partial_19_0237,
  rs_R009_ueqv_R009NNNYN_partial_19_0238,
  rs_R009_ueqv_R009NNNYN_partial_19_0239,
  rs_R009_ueqv_R009NNNYN_partial_19_0240,
  rs_R009_ueqv_R009NNNYN_partial_19_0241,
  rs_R009_ueqv_R009NNNYN_partial_19_0242,
  rs_R009_ueqv_R009NNNYN_partial_19_0243,
  rs_R009_ueqv_R009NNNYN_partial_19_0244,
  rs_R009_ueqv_R009NNNYN_partial_19_0245,
  rs_R009_ueqv_R009NNNYN_partial_19_0246,
  rs_R009_ueqv_R009NNNYN_partial_19_0247,
  rs_R009_ueqv_R009NNNYN_partial_19_0248,
  rs_R009_ueqv_R009NNNYN_partial_19_0249,
  rs_R009_ueqv_R009NNNYN_partial_19_0250,
  rs_R009_ueqv_R009NNNYN_partial_19_0251,
  rs_R009_ueqv_R009NNNYN_partial_19_0252,
  rs_R009_ueqv_R009NNNYN_partial_19_0253,
  rs_R009_ueqv_R009NNNYN_partial_19_0254,
  rs_R009_ueqv_R009NNNYN_partial_19_0255,
  rs_R009_ueqv_R009NNNYN_partial_19_0256,
  rs_R009_ueqv_R009NNNYN_partial_19_0257,
  rs_R009_ueqv_R009NNNYN_partial_19_0258,
  rs_R009_ueqv_R009NNNYN_partial_19_0259,
  rs_R009_ueqv_R009NNNYN_partial_19_0260,
  rs_R009_ueqv_R009NNNYN_partial_19_0261,
  rs_R009_ueqv_R009NNNYN_partial_19_0262,
  rs_R009_ueqv_R009NNNYN_partial_19_0263,
  rs_R009_ueqv_R009NNNYN_partial_19_0264,
  rs_R009_ueqv_R009NNNYN_partial_19_0265,
  rs_R009_ueqv_R009NNNYN_partial_19_0266,
  rs_R009_ueqv_R009NNNYN_partial_19_0267,
  rs_R009_ueqv_R009NNNYN_partial_19_0268,
  rs_R009_ueqv_R009NNNYN_partial_19_0269,
  rs_R009_ueqv_R009NNNYN_partial_19_0270,
  rs_R009_ueqv_R009NNNYN_partial_19_0271,
  rs_R009_ueqv_R009NNNYN_partial_19_0272,
  rs_R009_ueqv_R009NNNYN_partial_19_0273,
  rs_R009_ueqv_R009NNNYN_partial_19_0274,
  rs_R009_ueqv_R009NNNYN_partial_19_0275,
  rs_R009_ueqv_R009NNNYN_partial_19_0276,
  rs_R009_ueqv_R009NNNYN_partial_19_0277,
  rs_R009_ueqv_R009NNNYN_partial_19_0278,
  rs_R009_ueqv_R009NNNYN_partial_19_0279,
  rs_R009_ueqv_R009NNNYN_partial_19_0280,
  rs_R009_ueqv_R009NNNYN_partial_19_0281,
  rs_R009_ueqv_R009NNNYN_partial_19_0282,
  rs_R009_ueqv_R009NNNYN_partial_19_0283,
  rs_R009_ueqv_R009NNNYN_partial_19_0284,
  rs_R009_ueqv_R009NNNYN_partial_19_0285,
  rs_R009_ueqv_R009NNNYN_partial_19_0286,
  rs_R009_ueqv_R009NNNYN_partial_19_0287,
  rs_R009_ueqv_R009NNNYN_partial_19_0288,
  rs_R009_ueqv_R009NNNYN_partial_19_0289,
  rs_R009_ueqv_R009NNNYN_partial_19_0290,
  rs_R009_ueqv_R009NNNYN_partial_19_0291,
  rs_R009_ueqv_R009NNNYN_partial_19_0292,
  rs_R009_ueqv_R009NNNYN_partial_19_0293,
  rs_R009_ueqv_R009NNNYN_partial_19_0294,
  rs_R009_ueqv_R009NNNYN_partial_19_0295,
  rs_R009_ueqv_R009NNNYN_partial_19_0296,
  rs_R009_ueqv_R009NNNYN_partial_19_0297,
  rs_R009_ueqv_R009NNNYN_partial_19_0298,
  rs_R009_ueqv_R009NNNYN_partial_19_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_0200_0299 : Poly :=
[
  term ((54 : Rat) / 67) [(1, 1), (8, 1), (9, 1)],
  term ((-1656 : Rat) / 67) [(1, 1), (8, 1), (9, 1), (10, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (8, 1), (9, 1), (13, 2)],
  term ((1899344011888 : Rat) / 31414578435) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((86517760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((439581184 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-130211840 : Rat) / 36742197) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-70328320 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((27918971542 : Rat) / 1163502905) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((6868456 : Rat) / 231083) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((53877760 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-396408032 : Rat) / 6239241) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1795122227984 : Rat) / 31414578435) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-6521963426512 : Rat) / 94243735305) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((610226917928 : Rat) / 94243735305) [(1, 1), (8, 1), (11, 1)],
  term ((-1987451648 : Rat) / 12247399) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((2132480 : Rat) / 1645173) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((7383496960 : Rat) / 330679773) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-214988800 : Rat) / 110226591) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-825042064 : Rat) / 12247399) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((46195283936 : Rat) / 330679773) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-11358526018 : Rat) / 698101743) [(1, 1), (8, 1), (13, 1)],
  term ((145766096 : Rat) / 12247399) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((5962240 : Rat) / 110226591) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-8412786112 : Rat) / 330679773) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((710688834164 : Rat) / 18848747061) [(1, 1), (8, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(1, 1), (8, 1), (15, 3)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((-26828200 : Rat) / 12247399) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((1548370400 : Rat) / 330679773) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((127380015434 : Rat) / 3490508715) [(1, 1), (8, 2), (13, 1)],
  term ((-60797912 : Rat) / 12247399) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((3508908064 : Rat) / 330679773) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((-7627344696388 : Rat) / 94243735305) [(1, 1), (8, 2), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (8, 2), (15, 3)],
  term ((-27 : Rat) / 67) [(1, 1), (9, 1)],
  term ((828 : Rat) / 67) [(1, 1), (9, 1), (10, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)],
  term ((-949672005944 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-43258880 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-219790592 : Rat) / 6239241) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((65105920 : Rat) / 36742197) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-13959485771 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)],
  term ((-3434228 : Rat) / 231083) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-26938880 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((198204016 : Rat) / 6239241) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((897561113992 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 3)],
  term ((-3616138137472 : Rat) / 94243735305) [(1, 1), (10, 2), (11, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(1, 1), (10, 2), (13, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(1, 1), (10, 2), (15, 1)],
  term ((-305113458964 : Rat) / 94243735305) [(1, 1), (11, 1)],
  term ((993725824 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1)],
  term ((-1066240 : Rat) / 1645173) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3691748480 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)],
  term ((107494400 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)],
  term ((-48742400 : Rat) / 36742197) [(1, 1), (11, 2), (15, 1)],
  term ((419228082 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((-869804984 : Rat) / 12247399) [(1, 1), (12, 1), (15, 1)],
  term ((-6897377627 : Rat) / 6981017430) [(1, 1), (13, 1)],
  term ((-57683570 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((-1490560 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((3329166040 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((130114088687 : Rat) / 94243735305) [(1, 1), (15, 1)],
  term ((21977600 : Rat) / 110226591) [(1, 1), (15, 3)],
  term ((-1906257920 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-83923840 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((4843604480 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-89355840 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-202442240 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-78597120 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((11683809280 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((1719036160 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((1512058880 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 3)],
  term ((953128960 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((44677920 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-859518080 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((3315665920 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((51807280 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2990020160 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-2330746880 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-36417920 : Rat) / 12247399) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((2101834240 : Rat) / 330679773) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-1657832960 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-25903640 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((1495010080 : Rat) / 330679773) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((1165373440 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((18208960 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1050917120 : Rat) / 330679773) [(2, 1), (4, 1), (15, 2)],
  term ((9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((83923840 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((148795360 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((202442240 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((78597120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-838369280 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((-41961920 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-74397680 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1)],
  term ((-101221120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-39298560 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((756029440 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (15, 3)],
  term ((-2891571200 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1)],
  term ((1342781440 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1)],
  term ((3239075840 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (11, 1), (14, 1)],
  term ((419184640 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((20980960 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((25903640 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1)],
  term ((50610560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (14, 1)],
  term ((19649280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1495010080 : Rat) / 330679773) [(2, 1), (5, 1), (8, 1), (15, 1)],
  term ((-378014720 : Rat) / 110226591) [(2, 1), (5, 1), (8, 1), (15, 3)],
  term ((-3315665920 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (12, 1)],
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (14, 1)],
  term ((-838369280 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (11, 1), (15, 2)],
  term ((-41961920 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (12, 1), (13, 1)],
  term ((2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-51807280 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((-101221120 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)],
  term ((-39298560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (15, 2)],
  term ((5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((2990020160 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((756029440 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (15, 3)],
  term ((2274702080 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_0200_0299
      rs_R009_ueqv_R009NNNYN_block_19_0200_0299 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
