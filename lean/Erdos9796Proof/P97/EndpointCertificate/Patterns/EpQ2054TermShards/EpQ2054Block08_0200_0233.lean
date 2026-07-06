/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 8:200-233

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_08_0200_0233 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0200 : Poly :=
[
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 200 for generator 8. -/
def ep_Q2_054_partial_08_0200 : Poly :=
[
  term ((2103710916 : Rat) / 166175227) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 8. -/
theorem ep_Q2_054_partial_08_0200_valid :
    mulPoly ep_Q2_054_coefficient_08_0200
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0201 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 201 for generator 8. -/
def ep_Q2_054_partial_08_0201 : Poly :=
[
  term ((-27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 8. -/
theorem ep_Q2_054_partial_08_0201_valid :
    mulPoly ep_Q2_054_coefficient_08_0201
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0202 : Poly :=
[
  term ((-20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 202 for generator 8. -/
def ep_Q2_054_partial_08_0202 : Poly :=
[
  term ((41642046810488 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-41642046810488 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 8. -/
theorem ep_Q2_054_partial_08_0202_valid :
    mulPoly ep_Q2_054_coefficient_08_0202
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0203 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 8. -/
def ep_Q2_054_partial_08_0203 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 8. -/
theorem ep_Q2_054_partial_08_0203_valid :
    mulPoly ep_Q2_054_coefficient_08_0203
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0204 : Poly :=
[
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

/-- Partial product 204 for generator 8. -/
def ep_Q2_054_partial_08_0204 : Poly :=
[
  term ((-8420844215628 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2)],
  term ((4210422107814 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((4210422107814 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((8420844215628 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 8. -/
theorem ep_Q2_054_partial_08_0204_valid :
    mulPoly ep_Q2_054_coefficient_08_0204
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0205 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 205 for generator 8. -/
def ep_Q2_054_partial_08_0205 : Poly :=
[
  term ((402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 8. -/
theorem ep_Q2_054_partial_08_0205_valid :
    mulPoly ep_Q2_054_coefficient_08_0205
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0206 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 206 for generator 8. -/
def ep_Q2_054_partial_08_0206 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 8. -/
theorem ep_Q2_054_partial_08_0206_valid :
    mulPoly ep_Q2_054_coefficient_08_0206
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0207 : Poly :=
[
  term ((-14270755238232 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 207 for generator 8. -/
def ep_Q2_054_partial_08_0207 : Poly :=
[
  term ((28541510476464 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-14270755238232 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-14270755238232 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-28541510476464 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((14270755238232 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((14270755238232 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 8. -/
theorem ep_Q2_054_partial_08_0207_valid :
    mulPoly ep_Q2_054_coefficient_08_0207
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0208 : Poly :=
[
  term ((6511650396893 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 208 for generator 8. -/
def ep_Q2_054_partial_08_0208 : Poly :=
[
  term ((-13023300793786 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((6511650396893 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((6511650396893 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((13023300793786 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2)],
  term ((-6511650396893 : Rat) / 45033486517) [(8, 1), (14, 2), (15, 2)],
  term ((-6511650396893 : Rat) / 45033486517) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 8. -/
theorem ep_Q2_054_partial_08_0208_valid :
    mulPoly ep_Q2_054_coefficient_08_0208
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0209 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 8. -/
def ep_Q2_054_partial_08_0209 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 8. -/
theorem ep_Q2_054_partial_08_0209_valid :
    mulPoly ep_Q2_054_coefficient_08_0209
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0210 : Poly :=
[
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

/-- Partial product 210 for generator 8. -/
def ep_Q2_054_partial_08_0210 : Poly :=
[
  term ((100579066131 : Rat) / 90066973034) [(0, 1), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(0, 2), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(1, 2), (8, 1), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (14, 1), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (14, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 8. -/
theorem ep_Q2_054_partial_08_0210_valid :
    mulPoly ep_Q2_054_coefficient_08_0210
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0211 : Poly :=
[
  term ((579810306249 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 211 for generator 8. -/
def ep_Q2_054_partial_08_0211 : Poly :=
[
  term ((-1159620612498 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((579810306249 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((579810306249 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((1159620612498 : Rat) / 45033486517) [(8, 2), (14, 1)],
  term ((-579810306249 : Rat) / 45033486517) [(8, 2), (14, 2)],
  term ((-579810306249 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 8. -/
theorem ep_Q2_054_partial_08_0211_valid :
    mulPoly ep_Q2_054_coefficient_08_0211
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0212 : Poly :=
[
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 212 for generator 8. -/
def ep_Q2_054_partial_08_0212 : Poly :=
[
  term ((-1919172662124 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 8. -/
theorem ep_Q2_054_partial_08_0212_valid :
    mulPoly ep_Q2_054_coefficient_08_0212
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0213 : Poly :=
[
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

/-- Partial product 213 for generator 8. -/
def ep_Q2_054_partial_08_0213 : Poly :=
[
  term ((-715879967496 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 2)],
  term ((357939983748 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 2)],
  term ((357939983748 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 2)],
  term ((715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 2)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 8. -/
theorem ep_Q2_054_partial_08_0213_valid :
    mulPoly ep_Q2_054_coefficient_08_0213
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0214 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

/-- Partial product 214 for generator 8. -/
def ep_Q2_054_partial_08_0214 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(0, 2), (8, 2), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(1, 2), (8, 2), (15, 2)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (14, 1), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (14, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 8. -/
theorem ep_Q2_054_partial_08_0214_valid :
    mulPoly ep_Q2_054_coefficient_08_0214
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0215 : Poly :=
[
  term ((537865271416 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 215 for generator 8. -/
def ep_Q2_054_partial_08_0215 : Poly :=
[
  term ((-1075730542832 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1)],
  term ((537865271416 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1)],
  term ((537865271416 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((1075730542832 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)],
  term ((-537865271416 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2)],
  term ((-537865271416 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 8. -/
theorem ep_Q2_054_partial_08_0215_valid :
    mulPoly ep_Q2_054_coefficient_08_0215
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0216 : Poly :=
[
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 216 for generator 8. -/
def ep_Q2_054_partial_08_0216 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 8. -/
theorem ep_Q2_054_partial_08_0216_valid :
    mulPoly ep_Q2_054_coefficient_08_0216
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0217 : Poly :=
[
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 217 for generator 8. -/
def ep_Q2_054_partial_08_0217 : Poly :=
[
  term ((54875727906936 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 8. -/
theorem ep_Q2_054_partial_08_0217_valid :
    mulPoly ep_Q2_054_coefficient_08_0217
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0218 : Poly :=
[
  term ((21486531878697 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 218 for generator 8. -/
def ep_Q2_054_partial_08_0218 : Poly :=
[
  term ((-21486531878697 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((21486531878697 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((21486531878697 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((21486531878697 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21486531878697 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-21486531878697 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 8. -/
theorem ep_Q2_054_partial_08_0218_valid :
    mulPoly ep_Q2_054_coefficient_08_0218
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0219 : Poly :=
[
  term ((-15822799879185 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 219 for generator 8. -/
def ep_Q2_054_partial_08_0219 : Poly :=
[
  term ((15822799879185 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1)],
  term ((-15822799879185 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((-15822799879185 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((-15822799879185 : Rat) / 90066973034) [(9, 1), (13, 1), (14, 1)],
  term ((15822799879185 : Rat) / 180133946068) [(9, 1), (13, 1), (14, 2)],
  term ((15822799879185 : Rat) / 180133946068) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 8. -/
theorem ep_Q2_054_partial_08_0219_valid :
    mulPoly ep_Q2_054_coefficient_08_0219
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0220 : Poly :=
[
  term ((4093741004229 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 220 for generator 8. -/
def ep_Q2_054_partial_08_0220 : Poly :=
[
  term ((-8187482008458 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((8187482008458 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1)],
  term ((-4093741004229 : Rat) / 45033486517) [(9, 1), (14, 2), (15, 1)],
  term ((-4093741004229 : Rat) / 45033486517) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 8. -/
theorem ep_Q2_054_partial_08_0220_valid :
    mulPoly ep_Q2_054_coefficient_08_0220
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0221 : Poly :=
[
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 8. -/
def ep_Q2_054_partial_08_0221 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 8. -/
theorem ep_Q2_054_partial_08_0221_valid :
    mulPoly ep_Q2_054_coefficient_08_0221
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0222 : Poly :=
[
  term ((245162655156 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 222 for generator 8. -/
def ep_Q2_054_partial_08_0222 : Poly :=
[
  term ((-490325310312 : Rat) / 45033486517) [(0, 1), (9, 2)],
  term ((245162655156 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((245162655156 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((490325310312 : Rat) / 45033486517) [(9, 2), (14, 1)],
  term ((-245162655156 : Rat) / 45033486517) [(9, 2), (14, 2)],
  term ((-245162655156 : Rat) / 45033486517) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 8. -/
theorem ep_Q2_054_partial_08_0222_valid :
    mulPoly ep_Q2_054_coefficient_08_0222
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0223 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 223 for generator 8. -/
def ep_Q2_054_partial_08_0223 : Poly :=
[
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((326607707952 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((653215415904 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 8. -/
theorem ep_Q2_054_partial_08_0223_valid :
    mulPoly ep_Q2_054_coefficient_08_0223
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0224 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 224 for generator 8. -/
def ep_Q2_054_partial_08_0224 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 8. -/
theorem ep_Q2_054_partial_08_0224_valid :
    mulPoly ep_Q2_054_coefficient_08_0224
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0225 : Poly :=
[
  term ((20075064985895 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 225 for generator 8. -/
def ep_Q2_054_partial_08_0225 : Poly :=
[
  term ((-20075064985895 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)],
  term ((20075064985895 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((20075064985895 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((20075064985895 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)],
  term ((-20075064985895 : Rat) / 90066973034) [(11, 1), (14, 2), (15, 1)],
  term ((-20075064985895 : Rat) / 90066973034) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 8. -/
theorem ep_Q2_054_partial_08_0225_valid :
    mulPoly ep_Q2_054_coefficient_08_0225
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0226 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 8. -/
def ep_Q2_054_partial_08_0226 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 8. -/
theorem ep_Q2_054_partial_08_0226_valid :
    mulPoly ep_Q2_054_coefficient_08_0226
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0227 : Poly :=
[
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 227 for generator 8. -/
def ep_Q2_054_partial_08_0227 : Poly :=
[
  term ((4389392099688 : Rat) / 45033486517) [(0, 1), (11, 2)],
  term ((-2194696049844 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((-2194696049844 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((-4389392099688 : Rat) / 45033486517) [(11, 2), (14, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 2), (14, 2)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 8. -/
theorem ep_Q2_054_partial_08_0227_valid :
    mulPoly ep_Q2_054_coefficient_08_0227
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0228 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

/-- Partial product 228 for generator 8. -/
def ep_Q2_054_partial_08_0228 : Poly :=
[
  term ((121076473400 : Rat) / 45033486517) [(0, 1), (11, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(0, 2), (11, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 2), (11, 2), (16, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (14, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 8. -/
theorem ep_Q2_054_partial_08_0228_valid :
    mulPoly ep_Q2_054_coefficient_08_0228
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0229 : Poly :=
[
  term ((4096480566687 : Rat) / 90066973034) [(12, 1)]
]

/-- Partial product 229 for generator 8. -/
def ep_Q2_054_partial_08_0229 : Poly :=
[
  term ((-4096480566687 : Rat) / 45033486517) [(0, 1), (12, 1)],
  term ((4096480566687 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((4096480566687 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((4096480566687 : Rat) / 45033486517) [(12, 1), (14, 1)],
  term ((-4096480566687 : Rat) / 90066973034) [(12, 1), (14, 2)],
  term ((-4096480566687 : Rat) / 90066973034) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 8. -/
theorem ep_Q2_054_partial_08_0229_valid :
    mulPoly ep_Q2_054_coefficient_08_0229
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0230 : Poly :=
[
  term ((18216764978541 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 230 for generator 8. -/
def ep_Q2_054_partial_08_0230 : Poly :=
[
  term ((-36433529957082 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((18216764978541 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((18216764978541 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((36433529957082 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((-18216764978541 : Rat) / 45033486517) [(12, 1), (14, 2), (15, 2)],
  term ((-18216764978541 : Rat) / 45033486517) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 8. -/
theorem ep_Q2_054_partial_08_0230_valid :
    mulPoly ep_Q2_054_coefficient_08_0230
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0231 : Poly :=
[
  term ((-7485669697389 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 231 for generator 8. -/
def ep_Q2_054_partial_08_0231 : Poly :=
[
  term ((7485669697389 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)],
  term ((-7485669697389 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-7485669697389 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-7485669697389 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)],
  term ((7485669697389 : Rat) / 90066973034) [(13, 1), (14, 2), (15, 1)],
  term ((7485669697389 : Rat) / 90066973034) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 8. -/
theorem ep_Q2_054_partial_08_0231_valid :
    mulPoly ep_Q2_054_coefficient_08_0231
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0232 : Poly :=
[
  term ((-8355678486513 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 232 for generator 8. -/
def ep_Q2_054_partial_08_0232 : Poly :=
[
  term ((16711356973026 : Rat) / 45033486517) [(0, 1), (15, 2)],
  term ((-8355678486513 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((-8355678486513 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((-16711356973026 : Rat) / 45033486517) [(14, 1), (15, 2)],
  term ((8355678486513 : Rat) / 45033486517) [(14, 2), (15, 2)],
  term ((8355678486513 : Rat) / 45033486517) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 8. -/
theorem ep_Q2_054_partial_08_0232_valid :
    mulPoly ep_Q2_054_coefficient_08_0232
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 8. -/
def ep_Q2_054_coefficient_08_0233 : Poly :=
[
  term ((-15134559175 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 233 for generator 8. -/
def ep_Q2_054_partial_08_0233 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(0, 1), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((-15134559175 : Rat) / 45033486517) [(14, 1), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(14, 2), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 8. -/
theorem ep_Q2_054_partial_08_0233_valid :
    mulPoly ep_Q2_054_coefficient_08_0233
        ep_Q2_054_generator_08_0200_0233 =
      ep_Q2_054_partial_08_0233 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_08_0200_0233 : List Poly :=
[
  ep_Q2_054_partial_08_0200,
  ep_Q2_054_partial_08_0201,
  ep_Q2_054_partial_08_0202,
  ep_Q2_054_partial_08_0203,
  ep_Q2_054_partial_08_0204,
  ep_Q2_054_partial_08_0205,
  ep_Q2_054_partial_08_0206,
  ep_Q2_054_partial_08_0207,
  ep_Q2_054_partial_08_0208,
  ep_Q2_054_partial_08_0209,
  ep_Q2_054_partial_08_0210,
  ep_Q2_054_partial_08_0211,
  ep_Q2_054_partial_08_0212,
  ep_Q2_054_partial_08_0213,
  ep_Q2_054_partial_08_0214,
  ep_Q2_054_partial_08_0215,
  ep_Q2_054_partial_08_0216,
  ep_Q2_054_partial_08_0217,
  ep_Q2_054_partial_08_0218,
  ep_Q2_054_partial_08_0219,
  ep_Q2_054_partial_08_0220,
  ep_Q2_054_partial_08_0221,
  ep_Q2_054_partial_08_0222,
  ep_Q2_054_partial_08_0223,
  ep_Q2_054_partial_08_0224,
  ep_Q2_054_partial_08_0225,
  ep_Q2_054_partial_08_0226,
  ep_Q2_054_partial_08_0227,
  ep_Q2_054_partial_08_0228,
  ep_Q2_054_partial_08_0229,
  ep_Q2_054_partial_08_0230,
  ep_Q2_054_partial_08_0231,
  ep_Q2_054_partial_08_0232,
  ep_Q2_054_partial_08_0233
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_08_0200_0233 : Poly :=
[
  term ((2103710916 : Rat) / 166175227) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((41642046810488 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8420844215628 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2)],
  term ((402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((28541510476464 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-13023300793786 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(0, 1), (8, 1), (16, 1)],
  term ((-1159620612498 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((-1919172662124 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 2)],
  term ((1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((-1075730542832 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((54875727906936 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-21486531878697 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((15822799879185 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1)],
  term ((-8187482008458 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-490325310312 : Rat) / 45033486517) [(0, 1), (9, 2)],
  term ((-653215415904 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20075064985895 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((4389392099688 : Rat) / 45033486517) [(0, 1), (11, 2)],
  term ((121076473400 : Rat) / 45033486517) [(0, 1), (11, 2), (16, 1)],
  term ((-4096480566687 : Rat) / 45033486517) [(0, 1), (12, 1)],
  term ((-36433529957082 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((7485669697389 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)],
  term ((16711356973026 : Rat) / 45033486517) [(0, 1), (15, 2)],
  term ((15134559175 : Rat) / 45033486517) [(0, 1), (16, 1)],
  term ((-1051855458 : Rat) / 166175227) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((-14270755238232 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((6511650396893 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(0, 2), (8, 1), (16, 1)],
  term ((579810306249 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((959586331062 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((357939983748 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(0, 2), (8, 2), (15, 2)],
  term ((537865271416 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-27437863953468 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((21486531878697 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15822799879185 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((245162655156 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((326607707952 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((20075064985895 : Rat) / 90066973034) [(0, 2), (11, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(0, 2), (11, 2), (16, 1)],
  term ((4096480566687 : Rat) / 90066973034) [(0, 2), (12, 1)],
  term ((18216764978541 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((-7485669697389 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-8355678486513 : Rat) / 45033486517) [(0, 2), (15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((-1051855458 : Rat) / 166175227) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-14270755238232 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((6511650396893 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(1, 2), (8, 1), (16, 1)],
  term ((579810306249 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((959586331062 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((357939983748 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(1, 2), (8, 2), (15, 2)],
  term ((537865271416 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-27437863953468 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((21486531878697 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15822799879185 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((245162655156 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((326607707952 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((20075064985895 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 2), (11, 2), (16, 1)],
  term ((4096480566687 : Rat) / 90066973034) [(1, 2), (12, 1)],
  term ((18216764978541 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-7485669697389 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-8355678486513 : Rat) / 45033486517) [(1, 2), (15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((-2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 3)],
  term ((27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-41642046810488 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((8420844215628 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 4)],
  term ((-28541510476464 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((14270755238232 : Rat) / 45033486517) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((14270755238232 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 3)],
  term ((13023300793786 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(8, 1), (14, 1), (16, 1)],
  term ((-6511650396893 : Rat) / 45033486517) [(8, 1), (14, 2), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (14, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (15, 2), (16, 1)],
  term ((-6511650396893 : Rat) / 45033486517) [(8, 1), (15, 4)],
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (15, 4), (16, 1)],
  term ((1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 3)],
  term ((715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (14, 2)],
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)],
  term ((1159620612498 : Rat) / 45033486517) [(8, 2), (14, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(8, 2), (14, 1), (15, 2)],
  term ((-579810306249 : Rat) / 45033486517) [(8, 2), (14, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (14, 2), (15, 2)],
  term ((-579810306249 : Rat) / 45033486517) [(8, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (15, 4)],
  term ((1075730542832 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-537865271416 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-537865271416 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 4)],
  term ((-54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 3)],
  term ((21486531878697 : Rat) / 45033486517) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21486531878697 : Rat) / 90066973034) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-21486531878697 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 3)],
  term ((-15822799879185 : Rat) / 90066973034) [(9, 1), (13, 1), (14, 1)],
  term ((15822799879185 : Rat) / 180133946068) [(9, 1), (13, 1), (14, 2)],
  term ((15822799879185 : Rat) / 180133946068) [(9, 1), (13, 1), (15, 2)],
  term ((8187482008458 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4093741004229 : Rat) / 45033486517) [(9, 1), (14, 2), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4093741004229 : Rat) / 45033486517) [(9, 1), (15, 3)],
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (15, 3), (16, 1)],
  term ((653215415904 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(9, 2), (12, 1), (15, 2)],
  term ((490325310312 : Rat) / 45033486517) [(9, 2), (14, 1)],
  term ((-245162655156 : Rat) / 45033486517) [(9, 2), (14, 2)],
  term ((-245162655156 : Rat) / 45033486517) [(9, 2), (15, 2)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 3)],
  term ((20075064985895 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20075064985895 : Rat) / 90066973034) [(11, 1), (14, 2), (15, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20075064985895 : Rat) / 90066973034) [(11, 1), (15, 3)],
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (15, 3), (16, 1)],
  term ((-4389392099688 : Rat) / 45033486517) [(11, 2), (14, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 2), (14, 2)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (14, 2), (16, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (15, 2), (16, 1)],
  term ((4096480566687 : Rat) / 45033486517) [(12, 1), (14, 1)],
  term ((36433529957082 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((-4096480566687 : Rat) / 90066973034) [(12, 1), (14, 2)],
  term ((-18216764978541 : Rat) / 45033486517) [(12, 1), (14, 2), (15, 2)],
  term ((-4096480566687 : Rat) / 90066973034) [(12, 1), (15, 2)],
  term ((-18216764978541 : Rat) / 45033486517) [(12, 1), (15, 4)],
  term ((-7485669697389 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)],
  term ((7485669697389 : Rat) / 90066973034) [(13, 1), (14, 2), (15, 1)],
  term ((7485669697389 : Rat) / 90066973034) [(13, 1), (15, 3)],
  term ((-16711356973026 : Rat) / 45033486517) [(14, 1), (15, 2)],
  term ((-15134559175 : Rat) / 45033486517) [(14, 1), (16, 1)],
  term ((8355678486513 : Rat) / 45033486517) [(14, 2), (15, 2)],
  term ((15134559175 : Rat) / 90066973034) [(14, 2), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(15, 2), (16, 1)],
  term ((8355678486513 : Rat) / 45033486517) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 200 through 233. -/
theorem ep_Q2_054_block_08_0200_0233_valid :
    checkProductSumEq ep_Q2_054_partials_08_0200_0233
      ep_Q2_054_block_08_0200_0233 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
