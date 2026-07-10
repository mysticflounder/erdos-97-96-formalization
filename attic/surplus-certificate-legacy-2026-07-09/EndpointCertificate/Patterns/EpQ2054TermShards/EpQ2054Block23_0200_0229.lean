/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 23:200-229

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_23_0200_0229 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0200 : Poly :=
[
  term ((-47575847939289 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 200 for generator 23. -/
def ep_Q2_054_partial_23_0200 : Poly :=
[
  term ((95151695878578 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-47575847939289 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((95151695878578 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-47575847939289 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-95151695878578 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((47575847939289 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-95151695878578 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((47575847939289 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 23. -/
theorem ep_Q2_054_partial_23_0200_valid :
    mulPoly ep_Q2_054_coefficient_23_0200
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0201 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

/-- Partial product 201 for generator 23. -/
def ep_Q2_054_partial_23_0201 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)],
  term ((-268454987811 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 2)],
  term ((268454987811 : Rat) / 45033486517) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 23. -/
theorem ep_Q2_054_partial_23_0201_valid :
    mulPoly ep_Q2_054_coefficient_23_0201
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0202 : Poly :=
[
  term ((89484995937 : Rat) / 90066973034) [(8, 1), (12, 1)]
]

/-- Partial product 202 for generator 23. -/
def ep_Q2_054_partial_23_0202 : Poly :=
[
  term ((-89484995937 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 23. -/
theorem ep_Q2_054_partial_23_0202_valid :
    mulPoly ep_Q2_054_coefficient_23_0202
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0203 : Poly :=
[
  term ((-301737198393 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 203 for generator 23. -/
def ep_Q2_054_partial_23_0203 : Poly :=
[
  term ((301737198393 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(8, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 23. -/
theorem ep_Q2_054_partial_23_0203_valid :
    mulPoly ep_Q2_054_coefficient_23_0203
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0204 : Poly :=
[
  term ((-15606594177030 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 204 for generator 23. -/
def ep_Q2_054_partial_23_0204 : Poly :=
[
  term ((31213188354060 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-15606594177030 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((31213188354060 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15606594177030 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-31213188354060 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((15606594177030 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-31213188354060 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((15606594177030 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 23. -/
theorem ep_Q2_054_partial_23_0204_valid :
    mulPoly ep_Q2_054_coefficient_23_0204
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0205 : Poly :=
[
  term ((301737198393 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 23. -/
def ep_Q2_054_partial_23_0205 : Poly :=
[
  term ((-603474396786 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((301737198393 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((603474396786 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((603474396786 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 23. -/
theorem ep_Q2_054_partial_23_0205_valid :
    mulPoly ep_Q2_054_coefficient_23_0205
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0206 : Poly :=
[
  term ((3877789805370 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 206 for generator 23. -/
def ep_Q2_054_partial_23_0206 : Poly :=
[
  term ((-7755579610740 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((3877789805370 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-7755579610740 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((3877789805370 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((7755579610740 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-3877789805370 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2)],
  term ((7755579610740 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)],
  term ((-3877789805370 : Rat) / 45033486517) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 23. -/
theorem ep_Q2_054_partial_23_0206_valid :
    mulPoly ep_Q2_054_coefficient_23_0206
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0207 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 23. -/
def ep_Q2_054_partial_23_0207 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 23. -/
theorem ep_Q2_054_partial_23_0207_valid :
    mulPoly ep_Q2_054_coefficient_23_0207
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0208 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (16, 1)]
]

/-- Partial product 208 for generator 23. -/
def ep_Q2_054_partial_23_0208 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (9, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 2), (10, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 23. -/
theorem ep_Q2_054_partial_23_0208_valid :
    mulPoly ep_Q2_054_coefficient_23_0208
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0209 : Poly :=
[
  term ((-311355318438 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 209 for generator 23. -/
def ep_Q2_054_partial_23_0209 : Poly :=
[
  term ((622710636876 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((-622710636876 : Rat) / 45033486517) [(8, 2), (9, 1), (11, 1)],
  term ((311355318438 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((-622710636876 : Rat) / 45033486517) [(8, 3), (10, 1)],
  term ((311355318438 : Rat) / 45033486517) [(8, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 23. -/
theorem ep_Q2_054_partial_23_0209_valid :
    mulPoly ep_Q2_054_coefficient_23_0209
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0210 : Poly :=
[
  term ((-2309149427715 : Rat) / 180133946068) [(9, 1), (11, 1)]
]

/-- Partial product 210 for generator 23. -/
def ep_Q2_054_partial_23_0210 : Poly :=
[
  term ((2309149427715 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2309149427715 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((2309149427715 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 2)],
  term ((-2309149427715 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((-2309149427715 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((2309149427715 : Rat) / 180133946068) [(8, 2), (9, 1), (11, 1)],
  term ((-2309149427715 : Rat) / 90066973034) [(9, 2), (11, 2)],
  term ((2309149427715 : Rat) / 180133946068) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 23. -/
theorem ep_Q2_054_partial_23_0210_valid :
    mulPoly ep_Q2_054_coefficient_23_0210
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0211 : Poly :=
[
  term ((1100322227475 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 211 for generator 23. -/
def ep_Q2_054_partial_23_0211 : Poly :=
[
  term ((-1100322227475 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1100322227475 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1100322227475 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1100322227475 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((1100322227475 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1100322227475 : Rat) / 90066973034) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((1100322227475 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1100322227475 : Rat) / 90066973034) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 23. -/
theorem ep_Q2_054_partial_23_0211_valid :
    mulPoly ep_Q2_054_coefficient_23_0211
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0212 : Poly :=
[
  term ((-19921194908493 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 212 for generator 23. -/
def ep_Q2_054_partial_23_0212 : Poly :=
[
  term ((19921194908493 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-19921194908493 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((19921194908493 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-19921194908493 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((-19921194908493 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((19921194908493 : Rat) / 180133946068) [(8, 2), (9, 1), (13, 1)],
  term ((-19921194908493 : Rat) / 90066973034) [(9, 2), (11, 1), (13, 1)],
  term ((19921194908493 : Rat) / 180133946068) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 23. -/
theorem ep_Q2_054_partial_23_0212_valid :
    mulPoly ep_Q2_054_coefficient_23_0212
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0213 : Poly :=
[
  term ((-36431048230035 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 213 for generator 23. -/
def ep_Q2_054_partial_23_0213 : Poly :=
[
  term ((36431048230035 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-36431048230035 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((36431048230035 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-36431048230035 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((-36431048230035 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((36431048230035 : Rat) / 180133946068) [(8, 2), (9, 1), (15, 1)],
  term ((-36431048230035 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)],
  term ((36431048230035 : Rat) / 180133946068) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 23. -/
theorem ep_Q2_054_partial_23_0213_valid :
    mulPoly ep_Q2_054_coefficient_23_0213
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0214 : Poly :=
[
  term ((-798574236675 : Rat) / 90066973034) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 23. -/
def ep_Q2_054_partial_23_0214 : Poly :=
[
  term ((798574236675 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 90066973034) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((798574236675 : Rat) / 90066973034) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 23. -/
theorem ep_Q2_054_partial_23_0214_valid :
    mulPoly ep_Q2_054_coefficient_23_0214
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0215 : Poly :=
[
  term ((1596713436351 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 215 for generator 23. -/
def ep_Q2_054_partial_23_0215 : Poly :=
[
  term ((-3193426872702 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-3193426872702 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((3193426872702 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1)],
  term ((-1596713436351 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((3193426872702 : Rat) / 45033486517) [(9, 3), (11, 1)],
  term ((-1596713436351 : Rat) / 45033486517) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 23. -/
theorem ep_Q2_054_partial_23_0215_valid :
    mulPoly ep_Q2_054_coefficient_23_0215
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0216 : Poly :=
[
  term ((734867342892 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 216 for generator 23. -/
def ep_Q2_054_partial_23_0216 : Poly :=
[
  term ((-1469734685784 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((734867342892 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 2), (9, 2), (12, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(9, 3), (11, 1), (12, 1)],
  term ((-734867342892 : Rat) / 45033486517) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 23. -/
theorem ep_Q2_054_partial_23_0216_valid :
    mulPoly ep_Q2_054_coefficient_23_0216
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0217 : Poly :=
[
  term ((-10133655060114 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 217 for generator 23. -/
def ep_Q2_054_partial_23_0217 : Poly :=
[
  term ((20267310120228 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 23. -/
theorem ep_Q2_054_partial_23_0217_valid :
    mulPoly ep_Q2_054_coefficient_23_0217
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0218 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 218 for generator 23. -/
def ep_Q2_054_partial_23_0218 : Poly :=
[
  term ((-2194696049844 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(0, 2), (11, 1), (13, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 23. -/
theorem ep_Q2_054_partial_23_0218_valid :
    mulPoly ep_Q2_054_coefficient_23_0218
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0219 : Poly :=
[
  term ((106521763116387 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 219 for generator 23. -/
def ep_Q2_054_partial_23_0219 : Poly :=
[
  term ((-106521763116387 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((106521763116387 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((-106521763116387 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((106521763116387 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((106521763116387 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-106521763116387 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1)],
  term ((106521763116387 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((-106521763116387 : Rat) / 90066973034) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 23. -/
theorem ep_Q2_054_partial_23_0219_valid :
    mulPoly ep_Q2_054_coefficient_23_0219
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0220 : Poly :=
[
  term ((361703645691 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 23. -/
def ep_Q2_054_partial_23_0220 : Poly :=
[
  term ((-723407291382 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((361703645691 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-723407291382 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((361703645691 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((723407291382 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-361703645691 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((723407291382 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-361703645691 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 23. -/
theorem ep_Q2_054_partial_23_0220_valid :
    mulPoly ep_Q2_054_coefficient_23_0220
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0221 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 221 for generator 23. -/
def ep_Q2_054_partial_23_0221 : Poly :=
[
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((-3292044074766 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((-6584088149532 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2)],
  term ((3292044074766 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((-6584088149532 : Rat) / 45033486517) [(9, 1), (11, 3)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 23. -/
theorem ep_Q2_054_partial_23_0221_valid :
    mulPoly ep_Q2_054_coefficient_23_0221
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0222 : Poly :=
[
  term ((7230934801029 : Rat) / 90066973034) [(12, 1)]
]

/-- Partial product 222 for generator 23. -/
def ep_Q2_054_partial_23_0222 : Poly :=
[
  term ((-7230934801029 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((7230934801029 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((-7230934801029 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((7230934801029 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((7230934801029 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1)],
  term ((-7230934801029 : Rat) / 90066973034) [(8, 2), (12, 1)],
  term ((7230934801029 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((-7230934801029 : Rat) / 90066973034) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 23. -/
theorem ep_Q2_054_partial_23_0222_valid :
    mulPoly ep_Q2_054_coefficient_23_0222
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0223 : Poly :=
[
  term ((10927615595511 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 223 for generator 23. -/
def ep_Q2_054_partial_23_0223 : Poly :=
[
  term ((-21855231191022 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((10927615595511 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((-21855231191022 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((10927615595511 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((21855231191022 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-10927615595511 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((21855231191022 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10927615595511 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 23. -/
theorem ep_Q2_054_partial_23_0223_valid :
    mulPoly ep_Q2_054_coefficient_23_0223
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0224 : Poly :=
[
  term ((-45403677525 : Rat) / 45033486517) [(12, 1), (16, 1)]
]

/-- Partial product 224 for generator 23. -/
def ep_Q2_054_partial_23_0224 : Poly :=
[
  term ((90807355050 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(0, 2), (12, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 2), (12, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(8, 2), (12, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 23. -/
theorem ep_Q2_054_partial_23_0224_valid :
    mulPoly ep_Q2_054_coefficient_23_0224
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0225 : Poly :=
[
  term ((-76099704549987 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 225 for generator 23. -/
def ep_Q2_054_partial_23_0225 : Poly :=
[
  term ((76099704549987 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-76099704549987 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((76099704549987 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-76099704549987 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-76099704549987 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((76099704549987 : Rat) / 90066973034) [(8, 2), (13, 1), (15, 1)],
  term ((-76099704549987 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((76099704549987 : Rat) / 90066973034) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 23. -/
theorem ep_Q2_054_partial_23_0225_valid :
    mulPoly ep_Q2_054_coefficient_23_0225
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0226 : Poly :=
[
  term ((90807355050 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 23. -/
def ep_Q2_054_partial_23_0226 : Poly :=
[
  term ((-181614710100 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((90807355050 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((181614710100 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((181614710100 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 23. -/
theorem ep_Q2_054_partial_23_0226_valid :
    mulPoly ep_Q2_054_coefficient_23_0226
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0227 : Poly :=
[
  term ((37054995240639 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 227 for generator 23. -/
def ep_Q2_054_partial_23_0227 : Poly :=
[
  term ((-37054995240639 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((37054995240639 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((-37054995240639 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((37054995240639 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((37054995240639 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)],
  term ((-37054995240639 : Rat) / 90066973034) [(8, 2), (15, 2)],
  term ((37054995240639 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((-37054995240639 : Rat) / 90066973034) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 23. -/
theorem ep_Q2_054_partial_23_0227_valid :
    mulPoly ep_Q2_054_coefficient_23_0227
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0228 : Poly :=
[
  term ((2597711508381 : Rat) / 45033486517) [(15, 2), (16, 1)]
]

/-- Partial product 228 for generator 23. -/
def ep_Q2_054_partial_23_0228 : Poly :=
[
  term ((-5195423016762 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((2597711508381 : Rat) / 45033486517) [(0, 2), (15, 2), (16, 1)],
  term ((-5195423016762 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((2597711508381 : Rat) / 45033486517) [(1, 2), (15, 2), (16, 1)],
  term ((5195423016762 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-2597711508381 : Rat) / 45033486517) [(8, 2), (15, 2), (16, 1)],
  term ((5195423016762 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2597711508381 : Rat) / 45033486517) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 23. -/
theorem ep_Q2_054_partial_23_0228_valid :
    mulPoly ep_Q2_054_coefficient_23_0228
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 23. -/
def ep_Q2_054_coefficient_23_0229 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(16, 1)]
]

/-- Partial product 229 for generator 23. -/
def ep_Q2_054_partial_23_0229 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (10, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(0, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 1), (11, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(1, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(8, 1), (10, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(8, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(9, 1), (11, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 23. -/
theorem ep_Q2_054_partial_23_0229_valid :
    mulPoly ep_Q2_054_coefficient_23_0229
        ep_Q2_054_generator_23_0200_0229 =
      ep_Q2_054_partial_23_0229 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_23_0200_0229 : List Poly :=
[
  ep_Q2_054_partial_23_0200,
  ep_Q2_054_partial_23_0201,
  ep_Q2_054_partial_23_0202,
  ep_Q2_054_partial_23_0203,
  ep_Q2_054_partial_23_0204,
  ep_Q2_054_partial_23_0205,
  ep_Q2_054_partial_23_0206,
  ep_Q2_054_partial_23_0207,
  ep_Q2_054_partial_23_0208,
  ep_Q2_054_partial_23_0209,
  ep_Q2_054_partial_23_0210,
  ep_Q2_054_partial_23_0211,
  ep_Q2_054_partial_23_0212,
  ep_Q2_054_partial_23_0213,
  ep_Q2_054_partial_23_0214,
  ep_Q2_054_partial_23_0215,
  ep_Q2_054_partial_23_0216,
  ep_Q2_054_partial_23_0217,
  ep_Q2_054_partial_23_0218,
  ep_Q2_054_partial_23_0219,
  ep_Q2_054_partial_23_0220,
  ep_Q2_054_partial_23_0221,
  ep_Q2_054_partial_23_0222,
  ep_Q2_054_partial_23_0223,
  ep_Q2_054_partial_23_0224,
  ep_Q2_054_partial_23_0225,
  ep_Q2_054_partial_23_0226,
  ep_Q2_054_partial_23_0227,
  ep_Q2_054_partial_23_0228,
  ep_Q2_054_partial_23_0229
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_23_0200_0229 : Poly :=
[
  term ((95151695878578 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((301737198393 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((31213188354060 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7755579610740 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((622710636876 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1)],
  term ((2309149427715 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1100322227475 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((19921194908493 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((36431048230035 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((798574236675 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3193426872702 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-106521763116387 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-723407291382 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 2)],
  term ((-7230934801029 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((-21855231191022 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((76099704549987 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37054995240639 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((-5195423016762 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (10, 1), (16, 1)],
  term ((-47575847939289 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-15606594177030 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3877789805370 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((-2309149427715 : Rat) / 180133946068) [(0, 2), (9, 1), (11, 1)],
  term ((1100322227475 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-19921194908493 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((-36431048230035 : Rat) / 180133946068) [(0, 2), (9, 1), (15, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(0, 2), (11, 1), (13, 1)],
  term ((106521763116387 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((361703645691 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((7230934801029 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((10927615595511 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(0, 2), (12, 1), (16, 1)],
  term ((-76099704549987 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((37054995240639 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((2597711508381 : Rat) / 45033486517) [(0, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(0, 2), (16, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((301737198393 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((31213188354060 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-603474396786 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7755579610740 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((95151695878578 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)],
  term ((622710636876 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1)],
  term ((-1100322227475 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((19921194908493 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((36431048230035 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((798574236675 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2309149427715 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 2)],
  term ((-3193426872702 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1)],
  term ((-1469734685784 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((-7230934801029 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((-21855231191022 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((90807355050 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((76099704549987 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-181614710100 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37054995240639 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-5195423016762 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 1), (11, 1), (16, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1)],
  term ((-106521763116387 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((-723407291382 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((-47575847939289 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-15606594177030 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((301737198393 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((3877789805370 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (16, 1)],
  term ((-311355318438 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((-2309149427715 : Rat) / 180133946068) [(1, 2), (9, 1), (11, 1)],
  term ((1100322227475 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-19921194908493 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((-36431048230035 : Rat) / 180133946068) [(1, 2), (9, 1), (15, 1)],
  term ((-798574236675 : Rat) / 90066973034) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1596713436351 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((734867342892 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1)],
  term ((106521763116387 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((361703645691 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((7230934801029 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((10927615595511 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 2), (12, 1), (16, 1)],
  term ((-76099704549987 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((90807355050 : Rat) / 45033486517) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((37054995240639 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((2597711508381 : Rat) / 45033486517) [(1, 2), (15, 2), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(1, 2), (16, 1)],
  term ((-2309149427715 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((1100322227475 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-19921194908493 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-36431048230035 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-798574236675 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((89484995937 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-31213188354060 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7755579610740 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-95151695878578 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)],
  term ((3193426872702 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((47575847939289 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 2), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1)],
  term ((301737198393 : Rat) / 90066973034) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((15606594177030 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3877789805370 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2)],
  term ((479144542005 : Rat) / 45033486517) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (9, 2), (16, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((106521763116387 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((723407291382 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2)],
  term ((7230934801029 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1)],
  term ((21855231191022 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-76099704549987 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((37054995240639 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)],
  term ((5195423016762 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(8, 1), (10, 1), (16, 1)],
  term ((-181693119789 : Rat) / 180133946068) [(8, 2), (9, 1), (11, 1)],
  term ((-1100322227475 : Rat) / 90066973034) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((19921194908493 : Rat) / 180133946068) [(8, 2), (9, 1), (13, 1)],
  term ((36431048230035 : Rat) / 180133946068) [(8, 2), (9, 1), (15, 1)],
  term ((798574236675 : Rat) / 90066973034) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1285358117913 : Rat) / 45033486517) [(8, 2), (9, 2)],
  term ((-734867342892 : Rat) / 45033486517) [(8, 2), (9, 2), (12, 1)],
  term ((-95151695878578 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(8, 2), (10, 1), (11, 2)],
  term ((89484995937 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 2), (10, 1), (12, 1), (16, 1)],
  term ((-31213188354060 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((603474396786 : Rat) / 45033486517) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((7755579610740 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 2), (10, 1), (16, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)],
  term ((-106521763116387 : Rat) / 90066973034) [(8, 2), (11, 1), (15, 1)],
  term ((-361703645691 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((-7230934801029 : Rat) / 90066973034) [(8, 2), (12, 1)],
  term ((-10927615595511 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(8, 2), (12, 1), (16, 1)],
  term ((76099704549987 : Rat) / 90066973034) [(8, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37054995240639 : Rat) / 90066973034) [(8, 2), (15, 2)],
  term ((-2597711508381 : Rat) / 45033486517) [(8, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(8, 2), (16, 1)],
  term ((-622710636876 : Rat) / 45033486517) [(8, 3), (10, 1)],
  term ((47575847939289 : Rat) / 45033486517) [(8, 3), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 3), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(8, 3), (12, 1)],
  term ((301737198393 : Rat) / 90066973034) [(8, 3), (12, 1), (16, 1)],
  term ((15606594177030 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1)],
  term ((-301737198393 : Rat) / 45033486517) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3877789805370 : Rat) / 45033486517) [(8, 3), (15, 2)],
  term ((479144542005 : Rat) / 45033486517) [(8, 3), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 3), (16, 1)],
  term ((311355318438 : Rat) / 45033486517) [(8, 4)],
  term ((7230934801029 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((21855231191022 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-90807355050 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-76099704549987 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((181614710100 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((37054995240639 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((5195423016762 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(9, 1), (11, 1), (16, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 1)],
  term ((106521763116387 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)],
  term ((723407291382 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(9, 1), (11, 3)],
  term ((11233977287589 : Rat) / 45033486517) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-22115890958337 : Rat) / 90066973034) [(9, 2), (11, 1), (13, 1)],
  term ((-71476405673211 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1)],
  term ((-1160277882366 : Rat) / 45033486517) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((4274938721817 : Rat) / 90066973034) [(9, 2), (11, 2)],
  term ((-7230934801029 : Rat) / 90066973034) [(9, 2), (12, 1)],
  term ((-10927615595511 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)],
  term ((45403677525 : Rat) / 45033486517) [(9, 2), (12, 1), (16, 1)],
  term ((76099704549987 : Rat) / 90066973034) [(9, 2), (13, 1), (15, 1)],
  term ((-90807355050 : Rat) / 45033486517) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-37054995240639 : Rat) / 90066973034) [(9, 2), (15, 2)],
  term ((-2597711508381 : Rat) / 45033486517) [(9, 2), (15, 2), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(9, 2), (16, 1)],
  term ((15082856918523 : Rat) / 180133946068) [(9, 3), (11, 1)],
  term ((1469734685784 : Rat) / 45033486517) [(9, 3), (11, 1), (12, 1)],
  term ((-1100322227475 : Rat) / 90066973034) [(9, 3), (12, 1), (15, 1)],
  term ((19921194908493 : Rat) / 180133946068) [(9, 3), (13, 1)],
  term ((36431048230035 : Rat) / 180133946068) [(9, 3), (15, 1)],
  term ((798574236675 : Rat) / 90066973034) [(9, 3), (15, 1), (16, 1)],
  term ((-1596713436351 : Rat) / 45033486517) [(9, 4)],
  term ((-734867342892 : Rat) / 45033486517) [(9, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 200 through 229. -/
theorem ep_Q2_054_block_23_0200_0229_valid :
    checkProductSumEq ep_Q2_054_partials_23_0200_0229
      ep_Q2_054_block_23_0200_0229 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
