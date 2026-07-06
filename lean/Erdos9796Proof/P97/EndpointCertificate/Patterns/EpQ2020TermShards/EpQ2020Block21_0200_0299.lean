/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 21:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_21_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0200 : Poly :=
[
  term ((160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 21. -/
def ep_Q2_020_partial_21_0200 : Poly :=
[
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 21. -/
theorem ep_Q2_020_partial_21_0200_valid :
    mulPoly ep_Q2_020_coefficient_21_0200
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0201 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 21. -/
def ep_Q2_020_partial_21_0201 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 21. -/
theorem ep_Q2_020_partial_21_0201_valid :
    mulPoly ep_Q2_020_coefficient_21_0201
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0202 : Poly :=
[
  term ((2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 21. -/
def ep_Q2_020_partial_21_0202 : Poly :=
[
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 21. -/
theorem ep_Q2_020_partial_21_0202_valid :
    mulPoly ep_Q2_020_coefficient_21_0202
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0203 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 21. -/
def ep_Q2_020_partial_21_0203 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 21. -/
theorem ep_Q2_020_partial_21_0203_valid :
    mulPoly ep_Q2_020_coefficient_21_0203
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0204 : Poly :=
[
  term ((-200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 204 for generator 21. -/
def ep_Q2_020_partial_21_0204 : Poly :=
[
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 21. -/
theorem ep_Q2_020_partial_21_0204_valid :
    mulPoly ep_Q2_020_coefficient_21_0204
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0205 : Poly :=
[
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 21. -/
def ep_Q2_020_partial_21_0205 : Poly :=
[
  term ((-320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 21. -/
theorem ep_Q2_020_partial_21_0205_valid :
    mulPoly ep_Q2_020_coefficient_21_0205
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0206 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 21. -/
def ep_Q2_020_partial_21_0206 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 21. -/
theorem ep_Q2_020_partial_21_0206_valid :
    mulPoly ep_Q2_020_coefficient_21_0206
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0207 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 21. -/
def ep_Q2_020_partial_21_0207 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 21. -/
theorem ep_Q2_020_partial_21_0207_valid :
    mulPoly ep_Q2_020_coefficient_21_0207
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0208 : Poly :=
[
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 21. -/
def ep_Q2_020_partial_21_0208 : Poly :=
[
  term ((200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 21. -/
theorem ep_Q2_020_partial_21_0208_valid :
    mulPoly ep_Q2_020_coefficient_21_0208
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0209 : Poly :=
[
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

/-- Partial product 209 for generator 21. -/
def ep_Q2_020_partial_21_0209 : Poly :=
[
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 21. -/
theorem ep_Q2_020_partial_21_0209_valid :
    mulPoly ep_Q2_020_coefficient_21_0209
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0210 : Poly :=
[
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 210 for generator 21. -/
def ep_Q2_020_partial_21_0210 : Poly :=
[
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 21. -/
theorem ep_Q2_020_partial_21_0210_valid :
    mulPoly ep_Q2_020_coefficient_21_0210
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0211 : Poly :=
[
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 21. -/
def ep_Q2_020_partial_21_0211 : Poly :=
[
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 21. -/
theorem ep_Q2_020_partial_21_0211_valid :
    mulPoly ep_Q2_020_coefficient_21_0211
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0212 : Poly :=
[
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 212 for generator 21. -/
def ep_Q2_020_partial_21_0212 : Poly :=
[
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 21. -/
theorem ep_Q2_020_partial_21_0212_valid :
    mulPoly ep_Q2_020_coefficient_21_0212
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0213 : Poly :=
[
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 213 for generator 21. -/
def ep_Q2_020_partial_21_0213 : Poly :=
[
  term ((135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 21. -/
theorem ep_Q2_020_partial_21_0213_valid :
    mulPoly ep_Q2_020_coefficient_21_0213
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0214 : Poly :=
[
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 214 for generator 21. -/
def ep_Q2_020_partial_21_0214 : Poly :=
[
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 21. -/
theorem ep_Q2_020_partial_21_0214_valid :
    mulPoly ep_Q2_020_coefficient_21_0214
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0215 : Poly :=
[
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 21. -/
def ep_Q2_020_partial_21_0215 : Poly :=
[
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 21. -/
theorem ep_Q2_020_partial_21_0215_valid :
    mulPoly ep_Q2_020_coefficient_21_0215
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0216 : Poly :=
[
  term ((-638862153186575133 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 21. -/
def ep_Q2_020_partial_21_0216 : Poly :=
[
  term ((-1277724306373150266 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 21. -/
theorem ep_Q2_020_partial_21_0216_valid :
    mulPoly ep_Q2_020_coefficient_21_0216
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0217 : Poly :=
[
  term ((-255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 21. -/
def ep_Q2_020_partial_21_0217 : Poly :=
[
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 21. -/
theorem ep_Q2_020_partial_21_0217_valid :
    mulPoly ep_Q2_020_coefficient_21_0217
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0218 : Poly :=
[
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 218 for generator 21. -/
def ep_Q2_020_partial_21_0218 : Poly :=
[
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 21. -/
theorem ep_Q2_020_partial_21_0218_valid :
    mulPoly ep_Q2_020_coefficient_21_0218
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0219 : Poly :=
[
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 21. -/
def ep_Q2_020_partial_21_0219 : Poly :=
[
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 21. -/
theorem ep_Q2_020_partial_21_0219_valid :
    mulPoly ep_Q2_020_coefficient_21_0219
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0220 : Poly :=
[
  term ((30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 21. -/
def ep_Q2_020_partial_21_0220 : Poly :=
[
  term ((61668711084931578 : Rat) / 975806724737959) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 21. -/
theorem ep_Q2_020_partial_21_0220_valid :
    mulPoly ep_Q2_020_coefficient_21_0220
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0221 : Poly :=
[
  term ((-19047670292866644 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)]
]

/-- Partial product 221 for generator 21. -/
def ep_Q2_020_partial_21_0221 : Poly :=
[
  term ((19047670292866644 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 21. -/
theorem ep_Q2_020_partial_21_0221_valid :
    mulPoly ep_Q2_020_coefficient_21_0221
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0222 : Poly :=
[
  term ((34632127805212080 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 222 for generator 21. -/
def ep_Q2_020_partial_21_0222 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 21. -/
theorem ep_Q2_020_partial_21_0222_valid :
    mulPoly ep_Q2_020_coefficient_21_0222
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0223 : Poly :=
[
  term ((-8658031951303020 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 223 for generator 21. -/
def ep_Q2_020_partial_21_0223 : Poly :=
[
  term ((-17316063902606040 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((8658031951303020 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 21. -/
theorem ep_Q2_020_partial_21_0223_valid :
    mulPoly ep_Q2_020_coefficient_21_0223
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0224 : Poly :=
[
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 224 for generator 21. -/
def ep_Q2_020_partial_21_0224 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 21. -/
theorem ep_Q2_020_partial_21_0224_valid :
    mulPoly ep_Q2_020_coefficient_21_0224
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0225 : Poly :=
[
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 225 for generator 21. -/
def ep_Q2_020_partial_21_0225 : Poly :=
[
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 21. -/
theorem ep_Q2_020_partial_21_0225_valid :
    mulPoly ep_Q2_020_coefficient_21_0225
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0226 : Poly :=
[
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 226 for generator 21. -/
def ep_Q2_020_partial_21_0226 : Poly :=
[
  term ((-166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 21. -/
theorem ep_Q2_020_partial_21_0226_valid :
    mulPoly ep_Q2_020_coefficient_21_0226
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0227 : Poly :=
[
  term ((20779276683127248 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 227 for generator 21. -/
def ep_Q2_020_partial_21_0227 : Poly :=
[
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-20779276683127248 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 21. -/
theorem ep_Q2_020_partial_21_0227_valid :
    mulPoly ep_Q2_020_coefficient_21_0227
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0228 : Poly :=
[
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 228 for generator 21. -/
def ep_Q2_020_partial_21_0228 : Poly :=
[
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 21. -/
theorem ep_Q2_020_partial_21_0228_valid :
    mulPoly ep_Q2_020_coefficient_21_0228
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0229 : Poly :=
[
  term ((13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 229 for generator 21. -/
def ep_Q2_020_partial_21_0229 : Poly :=
[
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 21. -/
theorem ep_Q2_020_partial_21_0229_valid :
    mulPoly ep_Q2_020_coefficient_21_0229
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0230 : Poly :=
[
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 230 for generator 21. -/
def ep_Q2_020_partial_21_0230 : Poly :=
[
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 21. -/
theorem ep_Q2_020_partial_21_0230_valid :
    mulPoly ep_Q2_020_coefficient_21_0230
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0231 : Poly :=
[
  term ((104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 21. -/
def ep_Q2_020_partial_21_0231 : Poly :=
[
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 21. -/
theorem ep_Q2_020_partial_21_0231_valid :
    mulPoly ep_Q2_020_coefficient_21_0231
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0232 : Poly :=
[
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 21. -/
def ep_Q2_020_partial_21_0232 : Poly :=
[
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 21. -/
theorem ep_Q2_020_partial_21_0232_valid :
    mulPoly ep_Q2_020_coefficient_21_0232
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0233 : Poly :=
[
  term ((1154404260173736 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 233 for generator 21. -/
def ep_Q2_020_partial_21_0233 : Poly :=
[
  term ((2308808520347472 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1154404260173736 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 21. -/
theorem ep_Q2_020_partial_21_0233_valid :
    mulPoly ep_Q2_020_coefficient_21_0233
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0234 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 21. -/
def ep_Q2_020_partial_21_0234 : Poly :=
[
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 21. -/
theorem ep_Q2_020_partial_21_0234_valid :
    mulPoly ep_Q2_020_coefficient_21_0234
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0235 : Poly :=
[
  term ((-20816413162101435 : Rat) / 1951613449475918) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 235 for generator 21. -/
def ep_Q2_020_partial_21_0235 : Poly :=
[
  term ((-20816413162101435 : Rat) / 975806724737959) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((20816413162101435 : Rat) / 1951613449475918) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 21. -/
theorem ep_Q2_020_partial_21_0235_valid :
    mulPoly ep_Q2_020_coefficient_21_0235
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0236 : Poly :=
[
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 236 for generator 21. -/
def ep_Q2_020_partial_21_0236 : Poly :=
[
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 21. -/
theorem ep_Q2_020_partial_21_0236_valid :
    mulPoly ep_Q2_020_coefficient_21_0236
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0237 : Poly :=
[
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 237 for generator 21. -/
def ep_Q2_020_partial_21_0237 : Poly :=
[
  term ((13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 21. -/
theorem ep_Q2_020_partial_21_0237_valid :
    mulPoly ep_Q2_020_coefficient_21_0237
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0238 : Poly :=
[
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 238 for generator 21. -/
def ep_Q2_020_partial_21_0238 : Poly :=
[
  term ((55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 21. -/
theorem ep_Q2_020_partial_21_0238_valid :
    mulPoly ep_Q2_020_coefficient_21_0238
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0239 : Poly :=
[
  term ((-6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 239 for generator 21. -/
def ep_Q2_020_partial_21_0239 : Poly :=
[
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 21. -/
theorem ep_Q2_020_partial_21_0239_valid :
    mulPoly ep_Q2_020_coefficient_21_0239
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0240 : Poly :=
[
  term ((-55988606618426196 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 240 for generator 21. -/
def ep_Q2_020_partial_21_0240 : Poly :=
[
  term ((55988606618426196 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-111977213236852392 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 21. -/
theorem ep_Q2_020_partial_21_0240_valid :
    mulPoly ep_Q2_020_coefficient_21_0240
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0241 : Poly :=
[
  term ((201623799577101858 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 241 for generator 21. -/
def ep_Q2_020_partial_21_0241 : Poly :=
[
  term ((-201623799577101858 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((403247599154203716 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 21. -/
theorem ep_Q2_020_partial_21_0241_valid :
    mulPoly ep_Q2_020_coefficient_21_0241
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0242 : Poly :=
[
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 242 for generator 21. -/
def ep_Q2_020_partial_21_0242 : Poly :=
[
  term ((-171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 21. -/
theorem ep_Q2_020_partial_21_0242_valid :
    mulPoly ep_Q2_020_coefficient_21_0242
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0243 : Poly :=
[
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 21. -/
def ep_Q2_020_partial_21_0243 : Poly :=
[
  term ((-208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 21. -/
theorem ep_Q2_020_partial_21_0243_valid :
    mulPoly ep_Q2_020_coefficient_21_0243
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0244 : Poly :=
[
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 21. -/
def ep_Q2_020_partial_21_0244 : Poly :=
[
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 21. -/
theorem ep_Q2_020_partial_21_0244_valid :
    mulPoly ep_Q2_020_coefficient_21_0244
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0245 : Poly :=
[
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 245 for generator 21. -/
def ep_Q2_020_partial_21_0245 : Poly :=
[
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 21. -/
theorem ep_Q2_020_partial_21_0245_valid :
    mulPoly ep_Q2_020_coefficient_21_0245
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0246 : Poly :=
[
  term ((71928997313883351 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 246 for generator 21. -/
def ep_Q2_020_partial_21_0246 : Poly :=
[
  term ((71928997313883351 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-71928997313883351 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 21. -/
theorem ep_Q2_020_partial_21_0246_valid :
    mulPoly ep_Q2_020_coefficient_21_0246
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0247 : Poly :=
[
  term ((3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

/-- Partial product 247 for generator 21. -/
def ep_Q2_020_partial_21_0247 : Poly :=
[
  term ((6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 21. -/
theorem ep_Q2_020_partial_21_0247_valid :
    mulPoly ep_Q2_020_coefficient_21_0247
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0248 : Poly :=
[
  term ((100811899788550929 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 248 for generator 21. -/
def ep_Q2_020_partial_21_0248 : Poly :=
[
  term ((201623799577101858 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-100811899788550929 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 21. -/
theorem ep_Q2_020_partial_21_0248_valid :
    mulPoly ep_Q2_020_coefficient_21_0248
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0249 : Poly :=
[
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 249 for generator 21. -/
def ep_Q2_020_partial_21_0249 : Poly :=
[
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 21. -/
theorem ep_Q2_020_partial_21_0249_valid :
    mulPoly ep_Q2_020_coefficient_21_0249
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0250 : Poly :=
[
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 21. -/
def ep_Q2_020_partial_21_0250 : Poly :=
[
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 21. -/
theorem ep_Q2_020_partial_21_0250_valid :
    mulPoly ep_Q2_020_coefficient_21_0250
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0251 : Poly :=
[
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 251 for generator 21. -/
def ep_Q2_020_partial_21_0251 : Poly :=
[
  term ((152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 21. -/
theorem ep_Q2_020_partial_21_0251_valid :
    mulPoly ep_Q2_020_coefficient_21_0251
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0252 : Poly :=
[
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 21. -/
def ep_Q2_020_partial_21_0252 : Poly :=
[
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 21. -/
theorem ep_Q2_020_partial_21_0252_valid :
    mulPoly ep_Q2_020_coefficient_21_0252
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0253 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 253 for generator 21. -/
def ep_Q2_020_partial_21_0253 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 21. -/
theorem ep_Q2_020_partial_21_0253_valid :
    mulPoly ep_Q2_020_coefficient_21_0253
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0254 : Poly :=
[
  term ((-23986675266936876 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 254 for generator 21. -/
def ep_Q2_020_partial_21_0254 : Poly :=
[
  term ((23986675266936876 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 21. -/
theorem ep_Q2_020_partial_21_0254_valid :
    mulPoly ep_Q2_020_coefficient_21_0254
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0255 : Poly :=
[
  term ((-71960025800810628 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 255 for generator 21. -/
def ep_Q2_020_partial_21_0255 : Poly :=
[
  term ((-143920051601621256 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 21. -/
theorem ep_Q2_020_partial_21_0255_valid :
    mulPoly ep_Q2_020_coefficient_21_0255
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0256 : Poly :=
[
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 256 for generator 21. -/
def ep_Q2_020_partial_21_0256 : Poly :=
[
  term ((-230283190210998144 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 21. -/
theorem ep_Q2_020_partial_21_0256_valid :
    mulPoly ep_Q2_020_coefficient_21_0256
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0257 : Poly :=
[
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 257 for generator 21. -/
def ep_Q2_020_partial_21_0257 : Poly :=
[
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 21. -/
theorem ep_Q2_020_partial_21_0257_valid :
    mulPoly ep_Q2_020_coefficient_21_0257
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0258 : Poly :=
[
  term ((172712392658248608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 258 for generator 21. -/
def ep_Q2_020_partial_21_0258 : Poly :=
[
  term ((345424785316497216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 21. -/
theorem ep_Q2_020_partial_21_0258_valid :
    mulPoly ep_Q2_020_coefficient_21_0258
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0259 : Poly :=
[
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 259 for generator 21. -/
def ep_Q2_020_partial_21_0259 : Poly :=
[
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 21. -/
theorem ep_Q2_020_partial_21_0259_valid :
    mulPoly ep_Q2_020_coefficient_21_0259
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0260 : Poly :=
[
  term ((119555652922309767 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 260 for generator 21. -/
def ep_Q2_020_partial_21_0260 : Poly :=
[
  term ((239111305844619534 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-119555652922309767 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 21. -/
theorem ep_Q2_020_partial_21_0260_valid :
    mulPoly ep_Q2_020_coefficient_21_0260
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0261 : Poly :=
[
  term ((21436308964867500 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 261 for generator 21. -/
def ep_Q2_020_partial_21_0261 : Poly :=
[
  term ((-21436308964867500 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 21. -/
theorem ep_Q2_020_partial_21_0261_valid :
    mulPoly ep_Q2_020_coefficient_21_0261
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0262 : Poly :=
[
  term ((983715691841784 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 21. -/
def ep_Q2_020_partial_21_0262 : Poly :=
[
  term ((-983715691841784 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 21. -/
theorem ep_Q2_020_partial_21_0262_valid :
    mulPoly ep_Q2_020_coefficient_21_0262
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0263 : Poly :=
[
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 263 for generator 21. -/
def ep_Q2_020_partial_21_0263 : Poly :=
[
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 21. -/
theorem ep_Q2_020_partial_21_0263_valid :
    mulPoly ep_Q2_020_coefficient_21_0263
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0264 : Poly :=
[
  term ((6234066813450306 : Rat) / 975806724737959) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 264 for generator 21. -/
def ep_Q2_020_partial_21_0264 : Poly :=
[
  term ((12468133626900612 : Rat) / 975806724737959) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 21. -/
theorem ep_Q2_020_partial_21_0264_valid :
    mulPoly ep_Q2_020_coefficient_21_0264
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0265 : Poly :=
[
  term ((-211687499867098608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 265 for generator 21. -/
def ep_Q2_020_partial_21_0265 : Poly :=
[
  term ((-423374999734197216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((211687499867098608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 21. -/
theorem ep_Q2_020_partial_21_0265_valid :
    mulPoly ep_Q2_020_coefficient_21_0265
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0266 : Poly :=
[
  term ((56522808000085824 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 266 for generator 21. -/
def ep_Q2_020_partial_21_0266 : Poly :=
[
  term ((113045616000171648 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-56522808000085824 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 21. -/
theorem ep_Q2_020_partial_21_0266_valid :
    mulPoly ep_Q2_020_coefficient_21_0266
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0267 : Poly :=
[
  term ((-1788573985166880 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 21. -/
def ep_Q2_020_partial_21_0267 : Poly :=
[
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 21. -/
theorem ep_Q2_020_partial_21_0267_valid :
    mulPoly ep_Q2_020_coefficient_21_0267
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0268 : Poly :=
[
  term ((447143496291720 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 21. -/
def ep_Q2_020_partial_21_0268 : Poly :=
[
  term ((894286992583440 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-447143496291720 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 21. -/
theorem ep_Q2_020_partial_21_0268_valid :
    mulPoly ep_Q2_020_coefficient_21_0268
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0269 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 269 for generator 21. -/
def ep_Q2_020_partial_21_0269 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 21. -/
theorem ep_Q2_020_partial_21_0269_valid :
    mulPoly ep_Q2_020_coefficient_21_0269
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0270 : Poly :=
[
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 270 for generator 21. -/
def ep_Q2_020_partial_21_0270 : Poly :=
[
  term ((383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 21. -/
theorem ep_Q2_020_partial_21_0270_valid :
    mulPoly ep_Q2_020_coefficient_21_0270
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0271 : Poly :=
[
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 271 for generator 21. -/
def ep_Q2_020_partial_21_0271 : Poly :=
[
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 21. -/
theorem ep_Q2_020_partial_21_0271_valid :
    mulPoly ep_Q2_020_coefficient_21_0271
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0272 : Poly :=
[
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 21. -/
def ep_Q2_020_partial_21_0272 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 21. -/
theorem ep_Q2_020_partial_21_0272_valid :
    mulPoly ep_Q2_020_coefficient_21_0272
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0273 : Poly :=
[
  term ((-354621813634541679 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 273 for generator 21. -/
def ep_Q2_020_partial_21_0273 : Poly :=
[
  term ((-709243627269083358 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((354621813634541679 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 21. -/
theorem ep_Q2_020_partial_21_0273_valid :
    mulPoly ep_Q2_020_coefficient_21_0273
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0274 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 274 for generator 21. -/
def ep_Q2_020_partial_21_0274 : Poly :=
[
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 21. -/
theorem ep_Q2_020_partial_21_0274_valid :
    mulPoly ep_Q2_020_coefficient_21_0274
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0275 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 21. -/
def ep_Q2_020_partial_21_0275 : Poly :=
[
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 21. -/
theorem ep_Q2_020_partial_21_0275_valid :
    mulPoly ep_Q2_020_coefficient_21_0275
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0276 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 276 for generator 21. -/
def ep_Q2_020_partial_21_0276 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 21. -/
theorem ep_Q2_020_partial_21_0276_valid :
    mulPoly ep_Q2_020_coefficient_21_0276
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0277 : Poly :=
[
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 277 for generator 21. -/
def ep_Q2_020_partial_21_0277 : Poly :=
[
  term ((187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 21. -/
theorem ep_Q2_020_partial_21_0277_valid :
    mulPoly ep_Q2_020_coefficient_21_0277
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0278 : Poly :=
[
  term ((-23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 278 for generator 21. -/
def ep_Q2_020_partial_21_0278 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 21. -/
theorem ep_Q2_020_partial_21_0278_valid :
    mulPoly ep_Q2_020_coefficient_21_0278
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0279 : Poly :=
[
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 21. -/
def ep_Q2_020_partial_21_0279 : Poly :=
[
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 21. -/
theorem ep_Q2_020_partial_21_0279_valid :
    mulPoly ep_Q2_020_coefficient_21_0279
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0280 : Poly :=
[
  term ((-1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 21. -/
def ep_Q2_020_partial_21_0280 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 21. -/
theorem ep_Q2_020_partial_21_0280_valid :
    mulPoly ep_Q2_020_coefficient_21_0280
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0281 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 281 for generator 21. -/
def ep_Q2_020_partial_21_0281 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 21. -/
theorem ep_Q2_020_partial_21_0281_valid :
    mulPoly ep_Q2_020_coefficient_21_0281
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0282 : Poly :=
[
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 282 for generator 21. -/
def ep_Q2_020_partial_21_0282 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 21. -/
theorem ep_Q2_020_partial_21_0282_valid :
    mulPoly ep_Q2_020_coefficient_21_0282
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0283 : Poly :=
[
  term ((-474110357871051 : Rat) / 975806724737959) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 283 for generator 21. -/
def ep_Q2_020_partial_21_0283 : Poly :=
[
  term ((474110357871051 : Rat) / 975806724737959) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((-948220715742102 : Rat) / 975806724737959) [(1, 1), (7, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 21. -/
theorem ep_Q2_020_partial_21_0283_valid :
    mulPoly ep_Q2_020_coefficient_21_0283
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0284 : Poly :=
[
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 284 for generator 21. -/
def ep_Q2_020_partial_21_0284 : Poly :=
[
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 21. -/
theorem ep_Q2_020_partial_21_0284_valid :
    mulPoly ep_Q2_020_coefficient_21_0284
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0285 : Poly :=
[
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 21. -/
def ep_Q2_020_partial_21_0285 : Poly :=
[
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 21. -/
theorem ep_Q2_020_partial_21_0285_valid :
    mulPoly ep_Q2_020_coefficient_21_0285
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0286 : Poly :=
[
  term ((232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 286 for generator 21. -/
def ep_Q2_020_partial_21_0286 : Poly :=
[
  term ((465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 21. -/
theorem ep_Q2_020_partial_21_0286_valid :
    mulPoly ep_Q2_020_coefficient_21_0286
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0287 : Poly :=
[
  term ((-474110357871051 : Rat) / 1951613449475918) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 287 for generator 21. -/
def ep_Q2_020_partial_21_0287 : Poly :=
[
  term ((-474110357871051 : Rat) / 975806724737959) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((474110357871051 : Rat) / 1951613449475918) [(1, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 21. -/
theorem ep_Q2_020_partial_21_0287_valid :
    mulPoly ep_Q2_020_coefficient_21_0287
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0288 : Poly :=
[
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 288 for generator 21. -/
def ep_Q2_020_partial_21_0288 : Poly :=
[
  term ((-383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 21. -/
theorem ep_Q2_020_partial_21_0288_valid :
    mulPoly ep_Q2_020_coefficient_21_0288
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0289 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 289 for generator 21. -/
def ep_Q2_020_partial_21_0289 : Poly :=
[
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 21. -/
theorem ep_Q2_020_partial_21_0289_valid :
    mulPoly ep_Q2_020_coefficient_21_0289
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0290 : Poly :=
[
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

/-- Partial product 290 for generator 21. -/
def ep_Q2_020_partial_21_0290 : Poly :=
[
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 21. -/
theorem ep_Q2_020_partial_21_0290_valid :
    mulPoly ep_Q2_020_coefficient_21_0290
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0291 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 291 for generator 21. -/
def ep_Q2_020_partial_21_0291 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 21. -/
theorem ep_Q2_020_partial_21_0291_valid :
    mulPoly ep_Q2_020_coefficient_21_0291
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0292 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 21. -/
def ep_Q2_020_partial_21_0292 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 21. -/
theorem ep_Q2_020_partial_21_0292_valid :
    mulPoly ep_Q2_020_coefficient_21_0292
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0293 : Poly :=
[
  term ((164429684718532356 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 293 for generator 21. -/
def ep_Q2_020_partial_21_0293 : Poly :=
[
  term ((328859369437064712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-164429684718532356 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 21. -/
theorem ep_Q2_020_partial_21_0293_valid :
    mulPoly ep_Q2_020_coefficient_21_0293
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0294 : Poly :=
[
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 294 for generator 21. -/
def ep_Q2_020_partial_21_0294 : Poly :=
[
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 21. -/
theorem ep_Q2_020_partial_21_0294_valid :
    mulPoly ep_Q2_020_coefficient_21_0294
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0295 : Poly :=
[
  term ((-15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 21. -/
def ep_Q2_020_partial_21_0295 : Poly :=
[
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 21. -/
theorem ep_Q2_020_partial_21_0295_valid :
    mulPoly ep_Q2_020_coefficient_21_0295
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0296 : Poly :=
[
  term ((-715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 296 for generator 21. -/
def ep_Q2_020_partial_21_0296 : Poly :=
[
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 21. -/
theorem ep_Q2_020_partial_21_0296_valid :
    mulPoly ep_Q2_020_coefficient_21_0296
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0297 : Poly :=
[
  term ((1235969444906157824 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 297 for generator 21. -/
def ep_Q2_020_partial_21_0297 : Poly :=
[
  term ((2471938889812315648 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1235969444906157824 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 21. -/
theorem ep_Q2_020_partial_21_0297_valid :
    mulPoly ep_Q2_020_coefficient_21_0297
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0298 : Poly :=
[
  term ((-59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 21. -/
def ep_Q2_020_partial_21_0298 : Poly :=
[
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 21. -/
theorem ep_Q2_020_partial_21_0298_valid :
    mulPoly ep_Q2_020_coefficient_21_0298
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 21. -/
def ep_Q2_020_coefficient_21_0299 : Poly :=
[
  term ((-1299170240295000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 299 for generator 21. -/
def ep_Q2_020_partial_21_0299 : Poly :=
[
  term ((-2598340480590000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1299170240295000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 21. -/
theorem ep_Q2_020_partial_21_0299_valid :
    mulPoly ep_Q2_020_coefficient_21_0299
        ep_Q2_020_generator_21_0200_0299 =
      ep_Q2_020_partial_21_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_21_0200_0299 : List Poly :=
[
  ep_Q2_020_partial_21_0200,
  ep_Q2_020_partial_21_0201,
  ep_Q2_020_partial_21_0202,
  ep_Q2_020_partial_21_0203,
  ep_Q2_020_partial_21_0204,
  ep_Q2_020_partial_21_0205,
  ep_Q2_020_partial_21_0206,
  ep_Q2_020_partial_21_0207,
  ep_Q2_020_partial_21_0208,
  ep_Q2_020_partial_21_0209,
  ep_Q2_020_partial_21_0210,
  ep_Q2_020_partial_21_0211,
  ep_Q2_020_partial_21_0212,
  ep_Q2_020_partial_21_0213,
  ep_Q2_020_partial_21_0214,
  ep_Q2_020_partial_21_0215,
  ep_Q2_020_partial_21_0216,
  ep_Q2_020_partial_21_0217,
  ep_Q2_020_partial_21_0218,
  ep_Q2_020_partial_21_0219,
  ep_Q2_020_partial_21_0220,
  ep_Q2_020_partial_21_0221,
  ep_Q2_020_partial_21_0222,
  ep_Q2_020_partial_21_0223,
  ep_Q2_020_partial_21_0224,
  ep_Q2_020_partial_21_0225,
  ep_Q2_020_partial_21_0226,
  ep_Q2_020_partial_21_0227,
  ep_Q2_020_partial_21_0228,
  ep_Q2_020_partial_21_0229,
  ep_Q2_020_partial_21_0230,
  ep_Q2_020_partial_21_0231,
  ep_Q2_020_partial_21_0232,
  ep_Q2_020_partial_21_0233,
  ep_Q2_020_partial_21_0234,
  ep_Q2_020_partial_21_0235,
  ep_Q2_020_partial_21_0236,
  ep_Q2_020_partial_21_0237,
  ep_Q2_020_partial_21_0238,
  ep_Q2_020_partial_21_0239,
  ep_Q2_020_partial_21_0240,
  ep_Q2_020_partial_21_0241,
  ep_Q2_020_partial_21_0242,
  ep_Q2_020_partial_21_0243,
  ep_Q2_020_partial_21_0244,
  ep_Q2_020_partial_21_0245,
  ep_Q2_020_partial_21_0246,
  ep_Q2_020_partial_21_0247,
  ep_Q2_020_partial_21_0248,
  ep_Q2_020_partial_21_0249,
  ep_Q2_020_partial_21_0250,
  ep_Q2_020_partial_21_0251,
  ep_Q2_020_partial_21_0252,
  ep_Q2_020_partial_21_0253,
  ep_Q2_020_partial_21_0254,
  ep_Q2_020_partial_21_0255,
  ep_Q2_020_partial_21_0256,
  ep_Q2_020_partial_21_0257,
  ep_Q2_020_partial_21_0258,
  ep_Q2_020_partial_21_0259,
  ep_Q2_020_partial_21_0260,
  ep_Q2_020_partial_21_0261,
  ep_Q2_020_partial_21_0262,
  ep_Q2_020_partial_21_0263,
  ep_Q2_020_partial_21_0264,
  ep_Q2_020_partial_21_0265,
  ep_Q2_020_partial_21_0266,
  ep_Q2_020_partial_21_0267,
  ep_Q2_020_partial_21_0268,
  ep_Q2_020_partial_21_0269,
  ep_Q2_020_partial_21_0270,
  ep_Q2_020_partial_21_0271,
  ep_Q2_020_partial_21_0272,
  ep_Q2_020_partial_21_0273,
  ep_Q2_020_partial_21_0274,
  ep_Q2_020_partial_21_0275,
  ep_Q2_020_partial_21_0276,
  ep_Q2_020_partial_21_0277,
  ep_Q2_020_partial_21_0278,
  ep_Q2_020_partial_21_0279,
  ep_Q2_020_partial_21_0280,
  ep_Q2_020_partial_21_0281,
  ep_Q2_020_partial_21_0282,
  ep_Q2_020_partial_21_0283,
  ep_Q2_020_partial_21_0284,
  ep_Q2_020_partial_21_0285,
  ep_Q2_020_partial_21_0286,
  ep_Q2_020_partial_21_0287,
  ep_Q2_020_partial_21_0288,
  ep_Q2_020_partial_21_0289,
  ep_Q2_020_partial_21_0290,
  ep_Q2_020_partial_21_0291,
  ep_Q2_020_partial_21_0292,
  ep_Q2_020_partial_21_0293,
  ep_Q2_020_partial_21_0294,
  ep_Q2_020_partial_21_0295,
  ep_Q2_020_partial_21_0296,
  ep_Q2_020_partial_21_0297,
  ep_Q2_020_partial_21_0298,
  ep_Q2_020_partial_21_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_21_0200_0299 : Poly :=
[
  term ((320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (8, 1), (14, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-320436771763309902 : Rat) / 975806724737959) [(1, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (3, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((200042314802096763 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4163688479918734536 : Rat) / 28298395017400811) [(1, 1), (3, 1), (10, 1), (14, 2), (16, 1)],
  term ((160218385881654951 : Rat) / 975806724737959) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-200042314802096763 : Rat) / 56596790034801622) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term ((2081844239959367268 : Rat) / 28298395017400811) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((742179327954631344 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-371089663977315672 : Rat) / 28298395017400811) [(1, 1), (4, 1), (5, 1), (14, 1), (16, 1)],
  term ((-135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (8, 1), (16, 1)],
  term ((135171833884640244 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-67585916942320122 : Rat) / 28298395017400811) [(1, 1), (4, 1), (7, 1), (14, 1), (16, 1)],
  term ((3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1277724306373150266 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((-345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((638862153186575133 : Rat) / 28298395017400811) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-510668315089865496 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((255334157544932748 : Rat) / 28298395017400811) [(1, 1), (4, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3536462259980089668 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-690727606191489504 : Rat) / 28298395017400811) [(1, 1), (4, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((61668711084931578 : Rat) / 975806724737959) [(1, 1), (4, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1768231129990044834 : Rat) / 28298395017400811) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((345363803095744752 : Rat) / 28298395017400811) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30834355542465789 : Rat) / 975806724737959) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((1731606390260604 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 1), (16, 1)],
  term ((-38095340585733288 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (10, 2), (16, 1)],
  term ((-34632127805212080 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((8658031951303020 : Rat) / 28298395017400811) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-166234213465017984 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-20779276683127248 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((83117106732508992 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41558553366254496 : Rat) / 28298395017400811) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2308808520347472 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20816413162101435 : Rat) / 975806724737959) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1154404260173736 : Rat) / 28298395017400811) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((20816413162101435 : Rat) / 1951613449475918) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((13852851122084832 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((55411404488339328 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((-27705702244169664 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 28298395017400811) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-171490471718940000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208709389543057920 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((155900428835400000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7154295940667520 : Rat) / 1230365000756557) [(1, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((127917603932309547 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((6926425561042416 : Rat) / 975806724737959) [(1, 1), (5, 1), (10, 1), (14, 2), (16, 1)],
  term ((-111977213236852392 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((403247599154203716 : Rat) / 28298395017400811) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((85745235859470000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((104354694771528960 : Rat) / 28298395017400811) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-77950214417700000 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71928997313883351 : Rat) / 56596790034801622) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-3463212780521208 : Rat) / 975806724737959) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-100811899788550929 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)],
  term ((-152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (11, 1), (16, 1)],
  term ((-69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((152381362342933152 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-138528511220848320 : Rat) / 28298395017400811) [(1, 1), (5, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76190681171466576 : Rat) / 28298395017400811) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((69264255610424160 : Rat) / 28298395017400811) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-119933376334684380 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (10, 2), (16, 1)],
  term ((71960025800810628 : Rat) / 28298395017400811) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-230283190210998144 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((345424785316497216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-172712392658248608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((6260017527305862 : Rat) / 975806724737959) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((-119555652922309767 : Rat) / 28298395017400811) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((115141595105499072 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((12468133626900612 : Rat) / 975806724737959) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-423374999734197216 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((91609307035304148 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3577147970333760 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-89428699258344 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((42872617929735000 : Rat) / 28298395017400811) [(1, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((1967431383683568 : Rat) / 1230365000756557) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-57570797552749536 : Rat) / 28298395017400811) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6234066813450306 : Rat) / 975806724737959) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((211687499867098608 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56522808000085824 : Rat) / 28298395017400811) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((1788573985166880 : Rat) / 1230365000756557) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-447143496291720 : Rat) / 1230365000756557) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-709243627269083358 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((354621813634541679 : Rat) / 28298395017400811) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((187080514602480000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8585155128801024 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((95946701067747504 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((23385064325310000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1073144391100128 : Rat) / 1230365000756557) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-93540257301240000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4292577564400512 : Rat) / 1230365000756557) [(1, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((465560430789778194 : Rat) / 28298395017400811) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-948220715742102 : Rat) / 975806724737959) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((46770128650620000 : Rat) / 28298395017400811) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2146288782200256 : Rat) / 1230365000756557) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-232780215394889097 : Rat) / 28298395017400811) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((474110357871051 : Rat) / 1951613449475918) [(1, 1), (7, 1), (16, 1)],
  term ((-383786804270990016 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((191893402135495008 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (10, 2), (16, 1)],
  term ((-47973350533873752 : Rat) / 28298395017400811) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((328859369437064712 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-164429684718532356 : Rat) / 28298395017400811) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-31180085767080000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1430859188133504 : Rat) / 1230365000756557) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2471938889812315648 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-118610657023559616 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2598340480590000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((15590042883540000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((715429594066752 : Rat) / 1230365000756557) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1235969444906157824 : Rat) / 28298395017400811) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((59305328511779808 : Rat) / 28298395017400811) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1299170240295000 : Rat) / 28298395017400811) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 200 through 299. -/
theorem ep_Q2_020_block_21_0200_0299_valid :
    checkProductSumEq ep_Q2_020_partials_21_0200_0299
      ep_Q2_020_block_21_0200_0299 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
