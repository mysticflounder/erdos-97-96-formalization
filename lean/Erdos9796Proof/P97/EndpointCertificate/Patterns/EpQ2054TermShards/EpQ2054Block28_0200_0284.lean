/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 28:200-284

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_28_0200_0284 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0200 : Poly :=
[
  term ((-67632897661299 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 200 for generator 28. -/
def ep_Q2_054_partial_28_0200 : Poly :=
[
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 28. -/
theorem ep_Q2_054_partial_28_0200_valid :
    mulPoly ep_Q2_054_coefficient_28_0200
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0201 : Poly :=
[
  term ((-947285444490 : Rat) / 45033486517) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 28. -/
def ep_Q2_054_partial_28_0201 : Poly :=
[
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 28. -/
theorem ep_Q2_054_partial_28_0201_valid :
    mulPoly ep_Q2_054_coefficient_28_0201
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0202 : Poly :=
[
  term ((6365520229131 : Rat) / 45033486517) [(6, 1), (15, 2)]
]

/-- Partial product 202 for generator 28. -/
def ep_Q2_054_partial_28_0202 : Poly :=
[
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2)],
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 3)],
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 28. -/
theorem ep_Q2_054_partial_28_0202_valid :
    mulPoly ep_Q2_054_coefficient_28_0202
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0203 : Poly :=
[
  term ((634770339336 : Rat) / 45033486517) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 28. -/
def ep_Q2_054_partial_28_0203 : Poly :=
[
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 28. -/
theorem ep_Q2_054_partial_28_0203_valid :
    mulPoly ep_Q2_054_coefficient_28_0203
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0204 : Poly :=
[
  term ((-473642722245 : Rat) / 90066973034) [(6, 1), (16, 1)]
]

/-- Partial product 204 for generator 28. -/
def ep_Q2_054_partial_28_0204 : Poly :=
[
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (10, 2), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 28. -/
theorem ep_Q2_054_partial_28_0204_valid :
    mulPoly ep_Q2_054_coefficient_28_0204
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0205 : Poly :=
[
  term ((-77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1)]
]

/-- Partial product 205 for generator 28. -/
def ep_Q2_054_partial_28_0205 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 28. -/
theorem ep_Q2_054_partial_28_0205_valid :
    mulPoly ep_Q2_054_coefficient_28_0205
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0206 : Poly :=
[
  term ((1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 206 for generator 28. -/
def ep_Q2_054_partial_28_0206 : Poly :=
[
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 28. -/
theorem ep_Q2_054_partial_28_0206_valid :
    mulPoly ep_Q2_054_coefficient_28_0206
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0207 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 207 for generator 28. -/
def ep_Q2_054_partial_28_0207 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 28. -/
theorem ep_Q2_054_partial_28_0207_valid :
    mulPoly ep_Q2_054_coefficient_28_0207
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0208 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 208 for generator 28. -/
def ep_Q2_054_partial_28_0208 : Poly :=
[
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (13, 1)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 28. -/
theorem ep_Q2_054_partial_28_0208_valid :
    mulPoly ep_Q2_054_coefficient_28_0208
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0209 : Poly :=
[
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 209 for generator 28. -/
def ep_Q2_054_partial_28_0209 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 28. -/
theorem ep_Q2_054_partial_28_0209_valid :
    mulPoly ep_Q2_054_coefficient_28_0209
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0210 : Poly :=
[
  term ((3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 210 for generator 28. -/
def ep_Q2_054_partial_28_0210 : Poly :=
[
  term ((6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 28. -/
theorem ep_Q2_054_partial_28_0210_valid :
    mulPoly ep_Q2_054_coefficient_28_0210
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0211 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 211 for generator 28. -/
def ep_Q2_054_partial_28_0211 : Poly :=
[
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 28. -/
theorem ep_Q2_054_partial_28_0211_valid :
    mulPoly ep_Q2_054_coefficient_28_0211
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0212 : Poly :=
[
  term ((-1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 212 for generator 28. -/
def ep_Q2_054_partial_28_0212 : Poly :=
[
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 28. -/
theorem ep_Q2_054_partial_28_0212_valid :
    mulPoly ep_Q2_054_coefficient_28_0212
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0213 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 28. -/
def ep_Q2_054_partial_28_0213 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 28. -/
theorem ep_Q2_054_partial_28_0213_valid :
    mulPoly ep_Q2_054_coefficient_28_0213
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0214 : Poly :=
[
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)]
]

/-- Partial product 214 for generator 28. -/
def ep_Q2_054_partial_28_0214 : Poly :=
[
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (13, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 28. -/
theorem ep_Q2_054_partial_28_0214_valid :
    mulPoly ep_Q2_054_coefficient_28_0214
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0215 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1)]
]

/-- Partial product 215 for generator 28. -/
def ep_Q2_054_partial_28_0215 : Poly :=
[
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (15, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 28. -/
theorem ep_Q2_054_partial_28_0215_valid :
    mulPoly ep_Q2_054_coefficient_28_0215
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0216 : Poly :=
[
  term ((19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1)]
]

/-- Partial product 216 for generator 28. -/
def ep_Q2_054_partial_28_0216 : Poly :=
[
  term ((19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 2)],
  term ((19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 28. -/
theorem ep_Q2_054_partial_28_0216_valid :
    mulPoly ep_Q2_054_coefficient_28_0216
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0217 : Poly :=
[
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 217 for generator 28. -/
def ep_Q2_054_partial_28_0217 : Poly :=
[
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 28. -/
theorem ep_Q2_054_partial_28_0217_valid :
    mulPoly ep_Q2_054_coefficient_28_0217
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0218 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 28. -/
def ep_Q2_054_partial_28_0218 : Poly :=
[
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 28. -/
theorem ep_Q2_054_partial_28_0218_valid :
    mulPoly ep_Q2_054_coefficient_28_0218
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0219 : Poly :=
[
  term ((-2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 219 for generator 28. -/
def ep_Q2_054_partial_28_0219 : Poly :=
[
  term ((-2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 28. -/
theorem ep_Q2_054_partial_28_0219_valid :
    mulPoly ep_Q2_054_coefficient_28_0219
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0220 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 220 for generator 28. -/
def ep_Q2_054_partial_28_0220 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 28. -/
theorem ep_Q2_054_partial_28_0220_valid :
    mulPoly ep_Q2_054_coefficient_28_0220
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0221 : Poly :=
[
  term ((-39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 221 for generator 28. -/
def ep_Q2_054_partial_28_0221 : Poly :=
[
  term ((-79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 28. -/
theorem ep_Q2_054_partial_28_0221_valid :
    mulPoly ep_Q2_054_coefficient_28_0221
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0222 : Poly :=
[
  term ((-228985491894 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 222 for generator 28. -/
def ep_Q2_054_partial_28_0222 : Poly :=
[
  term ((-457970983788 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((228985491894 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1)],
  term ((-457970983788 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1)],
  term ((228985491894 : Rat) / 45033486517) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 28. -/
theorem ep_Q2_054_partial_28_0222_valid :
    mulPoly ep_Q2_054_coefficient_28_0222
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0223 : Poly :=
[
  term ((-652201892001 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 223 for generator 28. -/
def ep_Q2_054_partial_28_0223 : Poly :=
[
  term ((-1304403784002 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((652201892001 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1304403784002 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((652201892001 : Rat) / 45033486517) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 28. -/
theorem ep_Q2_054_partial_28_0223_valid :
    mulPoly ep_Q2_054_coefficient_28_0223
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0224 : Poly :=
[
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 224 for generator 28. -/
def ep_Q2_054_partial_28_0224 : Poly :=
[
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 28. -/
theorem ep_Q2_054_partial_28_0224_valid :
    mulPoly ep_Q2_054_coefficient_28_0224
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0225 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 225 for generator 28. -/
def ep_Q2_054_partial_28_0225 : Poly :=
[
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 3)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 28. -/
theorem ep_Q2_054_partial_28_0225_valid :
    mulPoly ep_Q2_054_coefficient_28_0225
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0226 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 226 for generator 28. -/
def ep_Q2_054_partial_28_0226 : Poly :=
[
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 28. -/
theorem ep_Q2_054_partial_28_0226_valid :
    mulPoly ep_Q2_054_coefficient_28_0226
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0227 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 227 for generator 28. -/
def ep_Q2_054_partial_28_0227 : Poly :=
[
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 28. -/
theorem ep_Q2_054_partial_28_0227_valid :
    mulPoly ep_Q2_054_coefficient_28_0227
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0228 : Poly :=
[
  term ((-2400258477825 : Rat) / 90066973034) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 228 for generator 28. -/
def ep_Q2_054_partial_28_0228 : Poly :=
[
  term ((-2400258477825 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2400258477825 : Rat) / 90066973034) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-2400258477825 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((2400258477825 : Rat) / 90066973034) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 28. -/
theorem ep_Q2_054_partial_28_0228_valid :
    mulPoly ep_Q2_054_coefficient_28_0228
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0229 : Poly :=
[
  term ((-15654581887563 : Rat) / 180133946068) [(7, 1), (13, 1)]
]

/-- Partial product 229 for generator 28. -/
def ep_Q2_054_partial_28_0229 : Poly :=
[
  term ((-15654581887563 : Rat) / 90066973034) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((15654581887563 : Rat) / 180133946068) [(7, 1), (10, 2), (13, 1)],
  term ((-15654581887563 : Rat) / 90066973034) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((15654581887563 : Rat) / 180133946068) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 28. -/
theorem ep_Q2_054_partial_28_0229_valid :
    mulPoly ep_Q2_054_coefficient_28_0229
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0230 : Poly :=
[
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 230 for generator 28. -/
def ep_Q2_054_partial_28_0230 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 28. -/
theorem ep_Q2_054_partial_28_0230_valid :
    mulPoly ep_Q2_054_coefficient_28_0230
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0231 : Poly :=
[
  term ((-212234300337 : Rat) / 90066973034) [(7, 1), (15, 1)]
]

/-- Partial product 231 for generator 28. -/
def ep_Q2_054_partial_28_0231 : Poly :=
[
  term ((-212234300337 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((212234300337 : Rat) / 90066973034) [(7, 1), (10, 2), (15, 1)],
  term ((-212234300337 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)],
  term ((212234300337 : Rat) / 90066973034) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 28. -/
theorem ep_Q2_054_partial_28_0231_valid :
    mulPoly ep_Q2_054_coefficient_28_0231
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0232 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 28. -/
def ep_Q2_054_partial_28_0232 : Poly :=
[
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 28. -/
theorem ep_Q2_054_partial_28_0232_valid :
    mulPoly ep_Q2_054_coefficient_28_0232
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0233 : Poly :=
[
  term ((30446504325 : Rat) / 180133946068) [(7, 2)]
]

/-- Partial product 233 for generator 28. -/
def ep_Q2_054_partial_28_0233 : Poly :=
[
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (14, 1)],
  term ((-30446504325 : Rat) / 180133946068) [(7, 2), (10, 2)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 180133946068) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 28. -/
theorem ep_Q2_054_partial_28_0233_valid :
    mulPoly ep_Q2_054_coefficient_28_0233
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0234 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 234 for generator 28. -/
def ep_Q2_054_partial_28_0234 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 28. -/
theorem ep_Q2_054_partial_28_0234_valid :
    mulPoly ep_Q2_054_coefficient_28_0234
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0235 : Poly :=
[
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 235 for generator 28. -/
def ep_Q2_054_partial_28_0235 : Poly :=
[
  term ((-121786017300 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-121786017300 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 28. -/
theorem ep_Q2_054_partial_28_0235_valid :
    mulPoly ep_Q2_054_coefficient_28_0235
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0236 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 236 for generator 28. -/
def ep_Q2_054_partial_28_0236 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (15, 2)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 28. -/
theorem ep_Q2_054_partial_28_0236_valid :
    mulPoly ep_Q2_054_coefficient_28_0236
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0237 : Poly :=
[
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (12, 1)]
]

/-- Partial product 237 for generator 28. -/
def ep_Q2_054_partial_28_0237 : Poly :=
[
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1), (14, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (12, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 28. -/
theorem ep_Q2_054_partial_28_0237_valid :
    mulPoly ep_Q2_054_coefficient_28_0237
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0238 : Poly :=
[
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 238 for generator 28. -/
def ep_Q2_054_partial_28_0238 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 28. -/
theorem ep_Q2_054_partial_28_0238_valid :
    mulPoly ep_Q2_054_coefficient_28_0238
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0239 : Poly :=
[
  term ((-3202559078829 : Rat) / 45033486517) [(8, 1)]
]

/-- Partial product 239 for generator 28. -/
def ep_Q2_054_partial_28_0239 : Poly :=
[
  term ((-6405118157658 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1)],
  term ((3202559078829 : Rat) / 45033486517) [(8, 1), (10, 2)],
  term ((-6405118157658 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)],
  term ((3202559078829 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 28. -/
theorem ep_Q2_054_partial_28_0239_valid :
    mulPoly ep_Q2_054_coefficient_28_0239
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0240 : Poly :=
[
  term ((-463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 240 for generator 28. -/
def ep_Q2_054_partial_28_0240 : Poly :=
[
  term ((-926182235166 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-926182235166 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 28. -/
theorem ep_Q2_054_partial_28_0240_valid :
    mulPoly ep_Q2_054_coefficient_28_0240
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0241 : Poly :=
[
  term ((46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 241 for generator 28. -/
def ep_Q2_054_partial_28_0241 : Poly :=
[
  term ((92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 28. -/
theorem ep_Q2_054_partial_28_0241_valid :
    mulPoly ep_Q2_054_coefficient_28_0241
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0242 : Poly :=
[
  term ((42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 242 for generator 28. -/
def ep_Q2_054_partial_28_0242 : Poly :=
[
  term ((84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 28. -/
theorem ep_Q2_054_partial_28_0242_valid :
    mulPoly ep_Q2_054_coefficient_28_0242
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0243 : Poly :=
[
  term ((-15866815881 : Rat) / 166175227) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 243 for generator 28. -/
def ep_Q2_054_partial_28_0243 : Poly :=
[
  term ((-31733631762 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((15866815881 : Rat) / 166175227) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-31733631762 : Rat) / 166175227) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((15866815881 : Rat) / 166175227) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 28. -/
theorem ep_Q2_054_partial_28_0243_valid :
    mulPoly ep_Q2_054_coefficient_28_0243
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0244 : Poly :=
[
  term ((11365328267787 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 244 for generator 28. -/
def ep_Q2_054_partial_28_0244 : Poly :=
[
  term ((22730656535574 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-11365328267787 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((22730656535574 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((-11365328267787 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 28. -/
theorem ep_Q2_054_partial_28_0244_valid :
    mulPoly ep_Q2_054_coefficient_28_0244
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0245 : Poly :=
[
  term ((218850628539 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 28. -/
def ep_Q2_054_partial_28_0245 : Poly :=
[
  term ((437701257078 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-218850628539 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((437701257078 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-218850628539 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 28. -/
theorem ep_Q2_054_partial_28_0245_valid :
    mulPoly ep_Q2_054_coefficient_28_0245
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0246 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

/-- Partial product 246 for generator 28. -/
def ep_Q2_054_partial_28_0246 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 2)],
  term ((536909975622 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 28. -/
theorem ep_Q2_054_partial_28_0246_valid :
    mulPoly ep_Q2_054_coefficient_28_0246
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0247 : Poly :=
[
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (12, 1)]
]

/-- Partial product 247 for generator 28. -/
def ep_Q2_054_partial_28_0247 : Poly :=
[
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 28. -/
theorem ep_Q2_054_partial_28_0247_valid :
    mulPoly ep_Q2_054_coefficient_28_0247
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0248 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 248 for generator 28. -/
def ep_Q2_054_partial_28_0248 : Poly :=
[
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 28. -/
theorem ep_Q2_054_partial_28_0248_valid :
    mulPoly ep_Q2_054_coefficient_28_0248
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0249 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 249 for generator 28. -/
def ep_Q2_054_partial_28_0249 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 28. -/
theorem ep_Q2_054_partial_28_0249_valid :
    mulPoly ep_Q2_054_coefficient_28_0249
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0250 : Poly :=
[
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 250 for generator 28. -/
def ep_Q2_054_partial_28_0250 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 28. -/
theorem ep_Q2_054_partial_28_0250_valid :
    mulPoly ep_Q2_054_coefficient_28_0250
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0251 : Poly :=
[
  term ((63939357650302 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 251 for generator 28. -/
def ep_Q2_054_partial_28_0251 : Poly :=
[
  term ((127878715300604 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-63939357650302 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((127878715300604 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-63939357650302 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 28. -/
theorem ep_Q2_054_partial_28_0251_valid :
    mulPoly ep_Q2_054_coefficient_28_0251
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0252 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 28. -/
def ep_Q2_054_partial_28_0252 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 28. -/
theorem ep_Q2_054_partial_28_0252_valid :
    mulPoly ep_Q2_054_coefficient_28_0252
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0253 : Poly :=
[
  term ((-3994177738187 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 253 for generator 28. -/
def ep_Q2_054_partial_28_0253 : Poly :=
[
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((3994177738187 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3)],
  term ((3994177738187 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 28. -/
theorem ep_Q2_054_partial_28_0253_valid :
    mulPoly ep_Q2_054_coefficient_28_0253
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0254 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 254 for generator 28. -/
def ep_Q2_054_partial_28_0254 : Poly :=
[
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 28. -/
theorem ep_Q2_054_partial_28_0254_valid :
    mulPoly ep_Q2_054_coefficient_28_0254
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0255 : Poly :=
[
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

/-- Partial product 255 for generator 28. -/
def ep_Q2_054_partial_28_0255 : Poly :=
[
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (10, 2), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 28. -/
theorem ep_Q2_054_partial_28_0255_valid :
    mulPoly ep_Q2_054_coefficient_28_0255
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0256 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 256 for generator 28. -/
def ep_Q2_054_partial_28_0256 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 28. -/
theorem ep_Q2_054_partial_28_0256_valid :
    mulPoly ep_Q2_054_coefficient_28_0256
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0257 : Poly :=
[
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 257 for generator 28. -/
def ep_Q2_054_partial_28_0257 : Poly :=
[
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 28. -/
theorem ep_Q2_054_partial_28_0257_valid :
    mulPoly ep_Q2_054_coefficient_28_0257
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0258 : Poly :=
[
  term ((178969991874 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 258 for generator 28. -/
def ep_Q2_054_partial_28_0258 : Poly :=
[
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 28. -/
theorem ep_Q2_054_partial_28_0258_valid :
    mulPoly ep_Q2_054_coefficient_28_0258
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0259 : Poly :=
[
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 259 for generator 28. -/
def ep_Q2_054_partial_28_0259 : Poly :=
[
  term ((-2277112645872 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-2277112645872 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 28. -/
theorem ep_Q2_054_partial_28_0259_valid :
    mulPoly ep_Q2_054_coefficient_28_0259
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0260 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

/-- Partial product 260 for generator 28. -/
def ep_Q2_054_partial_28_0260 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (10, 2), (15, 2)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 3)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 28. -/
theorem ep_Q2_054_partial_28_0260_valid :
    mulPoly ep_Q2_054_coefficient_28_0260
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0261 : Poly :=
[
  term ((-5687773837242 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 261 for generator 28. -/
def ep_Q2_054_partial_28_0261 : Poly :=
[
  term ((-11375547674484 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((5687773837242 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1)],
  term ((-11375547674484 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((5687773837242 : Rat) / 45033486517) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 28. -/
theorem ep_Q2_054_partial_28_0261_valid :
    mulPoly ep_Q2_054_coefficient_28_0261
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0262 : Poly :=
[
  term ((265368762711 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 262 for generator 28. -/
def ep_Q2_054_partial_28_0262 : Poly :=
[
  term ((530737525422 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((530737525422 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 28. -/
theorem ep_Q2_054_partial_28_0262_valid :
    mulPoly ep_Q2_054_coefficient_28_0262
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0263 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 263 for generator 28. -/
def ep_Q2_054_partial_28_0263 : Poly :=
[
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 28. -/
theorem ep_Q2_054_partial_28_0263_valid :
    mulPoly ep_Q2_054_coefficient_28_0263
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0264 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 264 for generator 28. -/
def ep_Q2_054_partial_28_0264 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 3)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 28. -/
theorem ep_Q2_054_partial_28_0264_valid :
    mulPoly ep_Q2_054_coefficient_28_0264
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0265 : Poly :=
[
  term ((-3838589777457 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 265 for generator 28. -/
def ep_Q2_054_partial_28_0265 : Poly :=
[
  term ((-3838589777457 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3838589777457 : Rat) / 90066973034) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3838589777457 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((3838589777457 : Rat) / 90066973034) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 28. -/
theorem ep_Q2_054_partial_28_0265_valid :
    mulPoly ep_Q2_054_coefficient_28_0265
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0266 : Poly :=
[
  term ((52230060302759 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 266 for generator 28. -/
def ep_Q2_054_partial_28_0266 : Poly :=
[
  term ((52230060302759 : Rat) / 90066973034) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-52230060302759 : Rat) / 180133946068) [(9, 1), (10, 2), (13, 1)],
  term ((52230060302759 : Rat) / 90066973034) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-52230060302759 : Rat) / 180133946068) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 28. -/
theorem ep_Q2_054_partial_28_0266_valid :
    mulPoly ep_Q2_054_coefficient_28_0266
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0267 : Poly :=
[
  term ((-4803268469100 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 267 for generator 28. -/
def ep_Q2_054_partial_28_0267 : Poly :=
[
  term ((-9606536938200 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4803268469100 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1)],
  term ((-9606536938200 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((4803268469100 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 28. -/
theorem ep_Q2_054_partial_28_0267_valid :
    mulPoly ep_Q2_054_coefficient_28_0267
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0268 : Poly :=
[
  term ((-2076293015355 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 28. -/
def ep_Q2_054_partial_28_0268 : Poly :=
[
  term ((-2076293015355 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2076293015355 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 28. -/
theorem ep_Q2_054_partial_28_0268_valid :
    mulPoly ep_Q2_054_coefficient_28_0268
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0269 : Poly :=
[
  term ((81445052796 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 269 for generator 28. -/
def ep_Q2_054_partial_28_0269 : Poly :=
[
  term ((162890105592 : Rat) / 45033486517) [(9, 2), (10, 1), (14, 1)],
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((162890105592 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1)],
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 28. -/
theorem ep_Q2_054_partial_28_0269_valid :
    mulPoly ep_Q2_054_coefficient_28_0269
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0270 : Poly :=
[
  term ((571563488916 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 270 for generator 28. -/
def ep_Q2_054_partial_28_0270 : Poly :=
[
  term ((1143126977832 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((1143126977832 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 28. -/
theorem ep_Q2_054_partial_28_0270_valid :
    mulPoly ep_Q2_054_coefficient_28_0270
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0271 : Poly :=
[
  term ((12351476306976 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 271 for generator 28. -/
def ep_Q2_054_partial_28_0271 : Poly :=
[
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(11, 2), (12, 1), (15, 2)],
  term ((-12351476306976 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 28. -/
theorem ep_Q2_054_partial_28_0271_valid :
    mulPoly ep_Q2_054_coefficient_28_0271
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0272 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 272 for generator 28. -/
def ep_Q2_054_partial_28_0272 : Poly :=
[
  term ((2194696049844 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 28. -/
theorem ep_Q2_054_partial_28_0272_valid :
    mulPoly ep_Q2_054_coefficient_28_0272
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0273 : Poly :=
[
  term ((-24419433217926 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 273 for generator 28. -/
def ep_Q2_054_partial_28_0273 : Poly :=
[
  term ((-48838866435852 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((24419433217926 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((-48838866435852 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((24419433217926 : Rat) / 45033486517) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 28. -/
theorem ep_Q2_054_partial_28_0273_valid :
    mulPoly ep_Q2_054_coefficient_28_0273
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0274 : Poly :=
[
  term ((-551687611376 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 28. -/
def ep_Q2_054_partial_28_0274 : Poly :=
[
  term ((-1103375222752 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((551687611376 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1103375222752 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)],
  term ((551687611376 : Rat) / 45033486517) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 28. -/
theorem ep_Q2_054_partial_28_0274_valid :
    mulPoly ep_Q2_054_coefficient_28_0274
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0275 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 275 for generator 28. -/
def ep_Q2_054_partial_28_0275 : Poly :=
[
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 2), (14, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((6584088149532 : Rat) / 45033486517) [(11, 3), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 28. -/
theorem ep_Q2_054_partial_28_0275_valid :
    mulPoly ep_Q2_054_coefficient_28_0275
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0276 : Poly :=
[
  term ((-548674012461 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 276 for generator 28. -/
def ep_Q2_054_partial_28_0276 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1)],
  term ((548674012461 : Rat) / 45033486517) [(10, 2), (12, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)],
  term ((548674012461 : Rat) / 45033486517) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 28. -/
theorem ep_Q2_054_partial_28_0276_valid :
    mulPoly ep_Q2_054_coefficient_28_0276
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0277 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 277 for generator 28. -/
def ep_Q2_054_partial_28_0277 : Poly :=
[
  term ((27023080160304 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 28. -/
theorem ep_Q2_054_partial_28_0277_valid :
    mulPoly ep_Q2_054_coefficient_28_0277
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0278 : Poly :=
[
  term ((-2268974396607 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 278 for generator 28. -/
def ep_Q2_054_partial_28_0278 : Poly :=
[
  term ((-4537948793214 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2268974396607 : Rat) / 45033486517) [(10, 2), (12, 1), (15, 2)],
  term ((-4537948793214 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 3)],
  term ((2268974396607 : Rat) / 45033486517) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 28. -/
theorem ep_Q2_054_partial_28_0278_valid :
    mulPoly ep_Q2_054_coefficient_28_0278
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0279 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(12, 1), (16, 1)]
]

/-- Partial product 279 for generator 28. -/
def ep_Q2_054_partial_28_0279 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(10, 2), (12, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 28. -/
theorem ep_Q2_054_partial_28_0279_valid :
    mulPoly ep_Q2_054_coefficient_28_0279
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0280 : Poly :=
[
  term ((23477288408891 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 280 for generator 28. -/
def ep_Q2_054_partial_28_0280 : Poly :=
[
  term ((23477288408891 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23477288408891 : Rat) / 90066973034) [(10, 2), (13, 1), (15, 1)],
  term ((23477288408891 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2)],
  term ((-23477288408891 : Rat) / 90066973034) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 28. -/
theorem ep_Q2_054_partial_28_0280_valid :
    mulPoly ep_Q2_054_coefficient_28_0280
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0281 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 28. -/
def ep_Q2_054_partial_28_0281 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 28. -/
theorem ep_Q2_054_partial_28_0281_valid :
    mulPoly ep_Q2_054_coefficient_28_0281
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0282 : Poly :=
[
  term ((-4662017721790 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 282 for generator 28. -/
def ep_Q2_054_partial_28_0282 : Poly :=
[
  term ((-9324035443580 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2)],
  term ((4662017721790 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((-9324035443580 : Rat) / 45033486517) [(11, 1), (15, 3)],
  term ((4662017721790 : Rat) / 45033486517) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 28. -/
theorem ep_Q2_054_partial_28_0282_valid :
    mulPoly ep_Q2_054_coefficient_28_0282
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0283 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(15, 2), (16, 1)]
]

/-- Partial product 283 for generator 28. -/
def ep_Q2_054_partial_28_0283 : Poly :=
[
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 2), (15, 2), (16, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(11, 1), (15, 3), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 28. -/
theorem ep_Q2_054_partial_28_0283_valid :
    mulPoly ep_Q2_054_coefficient_28_0283
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 28. -/
def ep_Q2_054_coefficient_28_0284 : Poly :=
[
  term ((-15134559175 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 284 for generator 28. -/
def ep_Q2_054_partial_28_0284 : Poly :=
[
  term ((-15134559175 : Rat) / 45033486517) [(10, 1), (14, 1), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(10, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 28. -/
theorem ep_Q2_054_partial_28_0284_valid :
    mulPoly ep_Q2_054_coefficient_28_0284
        ep_Q2_054_generator_28_0200_0284 =
      ep_Q2_054_partial_28_0284 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_28_0200_0284 : List Poly :=
[
  ep_Q2_054_partial_28_0200,
  ep_Q2_054_partial_28_0201,
  ep_Q2_054_partial_28_0202,
  ep_Q2_054_partial_28_0203,
  ep_Q2_054_partial_28_0204,
  ep_Q2_054_partial_28_0205,
  ep_Q2_054_partial_28_0206,
  ep_Q2_054_partial_28_0207,
  ep_Q2_054_partial_28_0208,
  ep_Q2_054_partial_28_0209,
  ep_Q2_054_partial_28_0210,
  ep_Q2_054_partial_28_0211,
  ep_Q2_054_partial_28_0212,
  ep_Q2_054_partial_28_0213,
  ep_Q2_054_partial_28_0214,
  ep_Q2_054_partial_28_0215,
  ep_Q2_054_partial_28_0216,
  ep_Q2_054_partial_28_0217,
  ep_Q2_054_partial_28_0218,
  ep_Q2_054_partial_28_0219,
  ep_Q2_054_partial_28_0220,
  ep_Q2_054_partial_28_0221,
  ep_Q2_054_partial_28_0222,
  ep_Q2_054_partial_28_0223,
  ep_Q2_054_partial_28_0224,
  ep_Q2_054_partial_28_0225,
  ep_Q2_054_partial_28_0226,
  ep_Q2_054_partial_28_0227,
  ep_Q2_054_partial_28_0228,
  ep_Q2_054_partial_28_0229,
  ep_Q2_054_partial_28_0230,
  ep_Q2_054_partial_28_0231,
  ep_Q2_054_partial_28_0232,
  ep_Q2_054_partial_28_0233,
  ep_Q2_054_partial_28_0234,
  ep_Q2_054_partial_28_0235,
  ep_Q2_054_partial_28_0236,
  ep_Q2_054_partial_28_0237,
  ep_Q2_054_partial_28_0238,
  ep_Q2_054_partial_28_0239,
  ep_Q2_054_partial_28_0240,
  ep_Q2_054_partial_28_0241,
  ep_Q2_054_partial_28_0242,
  ep_Q2_054_partial_28_0243,
  ep_Q2_054_partial_28_0244,
  ep_Q2_054_partial_28_0245,
  ep_Q2_054_partial_28_0246,
  ep_Q2_054_partial_28_0247,
  ep_Q2_054_partial_28_0248,
  ep_Q2_054_partial_28_0249,
  ep_Q2_054_partial_28_0250,
  ep_Q2_054_partial_28_0251,
  ep_Q2_054_partial_28_0252,
  ep_Q2_054_partial_28_0253,
  ep_Q2_054_partial_28_0254,
  ep_Q2_054_partial_28_0255,
  ep_Q2_054_partial_28_0256,
  ep_Q2_054_partial_28_0257,
  ep_Q2_054_partial_28_0258,
  ep_Q2_054_partial_28_0259,
  ep_Q2_054_partial_28_0260,
  ep_Q2_054_partial_28_0261,
  ep_Q2_054_partial_28_0262,
  ep_Q2_054_partial_28_0263,
  ep_Q2_054_partial_28_0264,
  ep_Q2_054_partial_28_0265,
  ep_Q2_054_partial_28_0266,
  ep_Q2_054_partial_28_0267,
  ep_Q2_054_partial_28_0268,
  ep_Q2_054_partial_28_0269,
  ep_Q2_054_partial_28_0270,
  ep_Q2_054_partial_28_0271,
  ep_Q2_054_partial_28_0272,
  ep_Q2_054_partial_28_0273,
  ep_Q2_054_partial_28_0274,
  ep_Q2_054_partial_28_0275,
  ep_Q2_054_partial_28_0276,
  ep_Q2_054_partial_28_0277,
  ep_Q2_054_partial_28_0278,
  ep_Q2_054_partial_28_0279,
  ep_Q2_054_partial_28_0280,
  ep_Q2_054_partial_28_0281,
  ep_Q2_054_partial_28_0282,
  ep_Q2_054_partial_28_0283,
  ep_Q2_054_partial_28_0284
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_28_0200_0284 : Poly :=
[
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (10, 2), (16, 1)],
  term ((-135265795322598 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1894570888980 : Rat) / 45033486517) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-473642722245 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12731040458262 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 3)],
  term ((1269540678672 : Rat) / 45033486517) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((67632897661299 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((947285444490 : Rat) / 45033486517) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6365520229131 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2)],
  term ((-634770339336 : Rat) / 45033486517) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((473642722245 : Rat) / 90066973034) [(6, 1), (11, 2), (16, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (10, 2)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 1), (9, 1), (11, 2)],
  term ((2035146414780 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((24405300000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((3956980528953 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1017573207390 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3)],
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 3), (16, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (13, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 2), (15, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 2), (13, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 2)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 2), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (11, 2)],
  term ((2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-5532687995724 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((-1304403784002 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-457970983788 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2400258477825 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15654581887563 : Rat) / 90066973034) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-212234300337 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((228985491894 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1)],
  term ((652201892001 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((2400258477825 : Rat) / 90066973034) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((15654581887563 : Rat) / 180133946068) [(7, 1), (10, 2), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((212234300337 : Rat) / 90066973034) [(7, 1), (10, 2), (15, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2400258477825 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15654581887563 : Rat) / 90066973034) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-212234300337 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-208549090179 : Rat) / 90066973034) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((15654581887563 : Rat) / 180133946068) [(7, 1), (11, 2), (13, 1)],
  term ((-91178799659604 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-703707667239 : Rat) / 90066973034) [(7, 1), (11, 2), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 3)],
  term ((228985491894 : Rat) / 45033486517) [(7, 1), (11, 3)],
  term ((652201892001 : Rat) / 45033486517) [(7, 1), (11, 3), (12, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 3), (16, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-121786017300 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1), (14, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (14, 1)],
  term ((-30446504325 : Rat) / 180133946068) [(7, 2), (10, 2)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 180133946068) [(7, 2), (11, 2)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 2), (12, 1)],
  term ((-650740649760 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 2), (15, 2)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 3), (15, 1)],
  term ((-926182235166 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-42382375602 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((92341833852 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((84764751204 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-46170916926 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-968564610768 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((463091117583 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)],
  term ((-31733631762 : Rat) / 166175227) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((22730656535574 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((437701257078 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((536909975622 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((127878715300604 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6405118157658 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1)],
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((3202559078829 : Rat) / 45033486517) [(8, 1), (10, 2)],
  term ((15866815881 : Rat) / 166175227) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-11365328267787 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-218850628539 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-63939357650302 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3994177738187 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((-159714847335 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (10, 2), (16, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((127878715300604 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6405118157658 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7988355476374 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3)],
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((3202559078829 : Rat) / 45033486517) [(8, 1), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-72539171857804 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((26724834273761 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((277986409743 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (11, 2), (16, 1)],
  term ((15866815881 : Rat) / 166175227) [(8, 1), (11, 3), (13, 1)],
  term ((-10828418292165 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1)],
  term ((-218850628539 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (11, 4)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2277112645872 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (10, 1), (14, 1), (15, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (10, 2), (15, 2)],
  term ((-2277112645872 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 3)],
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((422676355440 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-211338177720 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)],
  term ((530737525422 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11375547674484 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3838589777457 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((52230060302759 : Rat) / 90066973034) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9606536938200 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2076293015355 : Rat) / 45033486517) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5687773837242 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((3838589777457 : Rat) / 90066973034) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-52230060302759 : Rat) / 180133946068) [(9, 1), (10, 2), (13, 1)],
  term ((4803268469100 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3838589777457 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((52230060302759 : Rat) / 90066973034) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9606536938200 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((-2076293015355 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4900064828301 : Rat) / 90066973034) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-52230060302759 : Rat) / 180133946068) [(9, 1), (11, 2), (13, 1)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-6572279205384 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((2076293015355 : Rat) / 90066973034) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 3)],
  term ((5687773837242 : Rat) / 45033486517) [(9, 1), (11, 3)],
  term ((-265368762711 : Rat) / 45033486517) [(9, 1), (11, 3), (12, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)],
  term ((1143126977832 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((162890105592 : Rat) / 45033486517) [(9, 2), (10, 1), (14, 1)],
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((1143126977832 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((162890105592 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1)],
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (11, 2)],
  term ((-571563488916 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-48838866435852 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1103375222752 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(10, 1), (11, 2), (14, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1)],
  term ((-4537948793214 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((23477288408891 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9324035443580 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2)],
  term ((-1042836986052 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(10, 1), (14, 1), (16, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((24419433217926 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((551687611376 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((548674012461 : Rat) / 45033486517) [(10, 2), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((2268974396607 : Rat) / 45033486517) [(10, 2), (12, 1), (15, 2)],
  term ((-15134559175 : Rat) / 45033486517) [(10, 2), (12, 1), (16, 1)],
  term ((-23477288408891 : Rat) / 90066973034) [(10, 2), (13, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((4662017721790 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(10, 2), (15, 2), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(10, 2), (16, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1097348024922 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4537948793214 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 3)],
  term ((23477288408891 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)],
  term ((-9324035443580 : Rat) / 45033486517) [(11, 1), (15, 3)],
  term ((-1042836986052 : Rat) / 45033486517) [(11, 1), (15, 3), (16, 1)],
  term ((548674012461 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((26971927010559 : Rat) / 45033486517) [(11, 2), (12, 1), (15, 2)],
  term ((-15134559175 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)],
  term ((-19087896309203 : Rat) / 90066973034) [(11, 2), (13, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44176848714062 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((-581956729726 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(11, 2), (16, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(11, 3), (13, 1)],
  term ((31003521367458 : Rat) / 45033486517) [(11, 3), (15, 1)],
  term ((551687611376 : Rat) / 45033486517) [(11, 3), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 200 through 284. -/
theorem ep_Q2_054_block_28_0200_0284_valid :
    checkProductSumEq ep_Q2_054_partials_28_0200_0284
      ep_Q2_054_block_28_0200_0284 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
