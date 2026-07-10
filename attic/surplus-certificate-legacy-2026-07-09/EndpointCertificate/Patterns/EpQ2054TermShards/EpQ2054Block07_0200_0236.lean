/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 7:200-236

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_07_0200_0236 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0200 : Poly :=
[
  term ((505654933203 : Rat) / 90066973034) [(7, 2), (12, 1)]
]

/-- Partial product 200 for generator 7. -/
def ep_Q2_054_partial_07_0200 : Poly :=
[
  term ((-505654933203 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 1)],
  term ((505654933203 : Rat) / 90066973034) [(0, 2), (7, 2), (12, 1)],
  term ((505654933203 : Rat) / 90066973034) [(1, 2), (7, 2), (12, 1)],
  term ((-505654933203 : Rat) / 90066973034) [(7, 2), (12, 1), (13, 2)],
  term ((505654933203 : Rat) / 45033486517) [(7, 2), (12, 2)],
  term ((-505654933203 : Rat) / 90066973034) [(7, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 7. -/
theorem ep_Q2_054_partial_07_0200_valid :
    mulPoly ep_Q2_054_coefficient_07_0200
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0201 : Poly :=
[
  term ((-7449494196237 : Rat) / 90066973034) [(8, 1)]
]

/-- Partial product 201 for generator 7. -/
def ep_Q2_054_partial_07_0201 : Poly :=
[
  term ((7449494196237 : Rat) / 45033486517) [(0, 1), (8, 1)],
  term ((-7449494196237 : Rat) / 90066973034) [(0, 2), (8, 1)],
  term ((-7449494196237 : Rat) / 90066973034) [(1, 2), (8, 1)],
  term ((-7449494196237 : Rat) / 45033486517) [(8, 1), (12, 1)],
  term ((7449494196237 : Rat) / 90066973034) [(8, 1), (12, 2)],
  term ((7449494196237 : Rat) / 90066973034) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 7. -/
theorem ep_Q2_054_partial_07_0201_valid :
    mulPoly ep_Q2_054_coefficient_07_0201
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0202 : Poly :=
[
  term ((-580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 202 for generator 7. -/
def ep_Q2_054_partial_07_0202 : Poly :=
[
  term ((1160448109266 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-580224054633 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((-580224054633 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((-1160448109266 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 7. -/
theorem ep_Q2_054_partial_07_0202_valid :
    mulPoly ep_Q2_054_coefficient_07_0202
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0203 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 203 for generator 7. -/
def ep_Q2_054_partial_07_0203 : Poly :=
[
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((326607707952 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 7. -/
theorem ep_Q2_054_partial_07_0203_valid :
    mulPoly ep_Q2_054_coefficient_07_0203
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0204 : Poly :=
[
  term ((1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 204 for generator 7. -/
def ep_Q2_054_partial_07_0204 : Poly :=
[
  term ((-2103710916 : Rat) / 166175227) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1051855458 : Rat) / 166175227) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 7. -/
theorem ep_Q2_054_partial_07_0204_valid :
    mulPoly ep_Q2_054_coefficient_07_0204
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0205 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 205 for generator 7. -/
def ep_Q2_054_partial_07_0205 : Poly :=
[
  term ((27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 7. -/
theorem ep_Q2_054_partial_07_0205_valid :
    mulPoly ep_Q2_054_coefficient_07_0205
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0206 : Poly :=
[
  term ((20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 206 for generator 7. -/
def ep_Q2_054_partial_07_0206 : Poly :=
[
  term ((-41642046810488 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((41642046810488 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 7. -/
theorem ep_Q2_054_partial_07_0206_valid :
    mulPoly ep_Q2_054_coefficient_07_0206
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0207 : Poly :=
[
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 7. -/
def ep_Q2_054_partial_07_0207 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 7. -/
theorem ep_Q2_054_partial_07_0207_valid :
    mulPoly ep_Q2_054_coefficient_07_0207
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0208 : Poly :=
[
  term ((-4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2)]
]

/-- Partial product 208 for generator 7. -/
def ep_Q2_054_partial_07_0208 : Poly :=
[
  term ((8420844215628 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2)],
  term ((-4210422107814 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((-4210422107814 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((-8420844215628 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 2)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 7. -/
theorem ep_Q2_054_partial_07_0208_valid :
    mulPoly ep_Q2_054_coefficient_07_0208
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0209 : Poly :=
[
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 209 for generator 7. -/
def ep_Q2_054_partial_07_0209 : Poly :=
[
  term ((-402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 7. -/
theorem ep_Q2_054_partial_07_0209_valid :
    mulPoly ep_Q2_054_coefficient_07_0209
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0210 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 210 for generator 7. -/
def ep_Q2_054_partial_07_0210 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((6755770040076 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 7. -/
theorem ep_Q2_054_partial_07_0210_valid :
    mulPoly ep_Q2_054_coefficient_07_0210
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0211 : Poly :=
[
  term ((5215545007482 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 211 for generator 7. -/
def ep_Q2_054_partial_07_0211 : Poly :=
[
  term ((-10431090014964 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((5215545007482 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((5215545007482 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((10431090014964 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5215545007482 : Rat) / 45033486517) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5215545007482 : Rat) / 45033486517) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 7. -/
theorem ep_Q2_054_partial_07_0211_valid :
    mulPoly ep_Q2_054_coefficient_07_0211
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0212 : Poly :=
[
  term ((7275511830661 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 212 for generator 7. -/
def ep_Q2_054_partial_07_0212 : Poly :=
[
  term ((-14551023661322 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((7275511830661 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((7275511830661 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((14551023661322 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)],
  term ((-7275511830661 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)],
  term ((-7275511830661 : Rat) / 45033486517) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 7. -/
theorem ep_Q2_054_partial_07_0212_valid :
    mulPoly ep_Q2_054_coefficient_07_0212
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0213 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 7. -/
def ep_Q2_054_partial_07_0213 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 7. -/
theorem ep_Q2_054_partial_07_0213_valid :
    mulPoly ep_Q2_054_coefficient_07_0213
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0214 : Poly :=
[
  term ((100579066131 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

/-- Partial product 214 for generator 7. -/
def ep_Q2_054_partial_07_0214 : Poly :=
[
  term ((-100579066131 : Rat) / 90066973034) [(0, 1), (8, 1), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(0, 2), (8, 1), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(1, 2), (8, 1), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (12, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 7. -/
theorem ep_Q2_054_partial_07_0214_valid :
    mulPoly ep_Q2_054_coefficient_07_0214
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0215 : Poly :=
[
  term ((-579810306249 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 215 for generator 7. -/
def ep_Q2_054_partial_07_0215 : Poly :=
[
  term ((1159620612498 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((-579810306249 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((-579810306249 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((-1159620612498 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((579810306249 : Rat) / 45033486517) [(8, 2), (12, 2)],
  term ((579810306249 : Rat) / 45033486517) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 7. -/
theorem ep_Q2_054_partial_07_0215_valid :
    mulPoly ep_Q2_054_coefficient_07_0215
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0216 : Poly :=
[
  term ((-959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 216 for generator 7. -/
def ep_Q2_054_partial_07_0216 : Poly :=
[
  term ((1919172662124 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((-959586331062 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((-1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 7. -/
theorem ep_Q2_054_partial_07_0216_valid :
    mulPoly ep_Q2_054_coefficient_07_0216
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0217 : Poly :=
[
  term ((-357939983748 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

/-- Partial product 217 for generator 7. -/
def ep_Q2_054_partial_07_0217 : Poly :=
[
  term ((715879967496 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 2)],
  term ((-357939983748 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 2)],
  term ((-357939983748 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 2)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 2)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 7. -/
theorem ep_Q2_054_partial_07_0217_valid :
    mulPoly ep_Q2_054_coefficient_07_0217
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0218 : Poly :=
[
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

/-- Partial product 218 for generator 7. -/
def ep_Q2_054_partial_07_0218 : Poly :=
[
  term ((-1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(0, 2), (8, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(1, 2), (8, 2), (15, 2)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (12, 2), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 7. -/
theorem ep_Q2_054_partial_07_0218_valid :
    mulPoly ep_Q2_054_coefficient_07_0218
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0219 : Poly :=
[
  term ((1295523909881 : Rat) / 45033486517) [(9, 1), (11, 1)]
]

/-- Partial product 219 for generator 7. -/
def ep_Q2_054_partial_07_0219 : Poly :=
[
  term ((-2591047819762 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1)],
  term ((1295523909881 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1)],
  term ((1295523909881 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((2591047819762 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((-1295523909881 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 2)],
  term ((-1295523909881 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 7. -/
theorem ep_Q2_054_partial_07_0219_valid :
    mulPoly ep_Q2_054_coefficient_07_0219
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0220 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 220 for generator 7. -/
def ep_Q2_054_partial_07_0220 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 7. -/
theorem ep_Q2_054_partial_07_0220_valid :
    mulPoly ep_Q2_054_coefficient_07_0220
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0221 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 221 for generator 7. -/
def ep_Q2_054_partial_07_0221 : Poly :=
[
  term ((-54875727906936 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 7. -/
theorem ep_Q2_054_partial_07_0221_valid :
    mulPoly ep_Q2_054_coefficient_07_0221
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0222 : Poly :=
[
  term ((-5614553240853 : Rat) / 90066973034) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 222 for generator 7. -/
def ep_Q2_054_partial_07_0222 : Poly :=
[
  term ((5614553240853 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-5614553240853 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-5614553240853 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((5614553240853 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-5614553240853 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)],
  term ((5614553240853 : Rat) / 90066973034) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 7. -/
theorem ep_Q2_054_partial_07_0222_valid :
    mulPoly ep_Q2_054_coefficient_07_0222
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0223 : Poly :=
[
  term ((1939233265965 : Rat) / 180133946068) [(9, 1), (13, 1)]
]

/-- Partial product 223 for generator 7. -/
def ep_Q2_054_partial_07_0223 : Poly :=
[
  term ((-1939233265965 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1)],
  term ((1939233265965 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((1939233265965 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((1939233265965 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 1)],
  term ((-1939233265965 : Rat) / 180133946068) [(9, 1), (12, 2), (13, 1)],
  term ((-1939233265965 : Rat) / 180133946068) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 7. -/
theorem ep_Q2_054_partial_07_0223_valid :
    mulPoly ep_Q2_054_coefficient_07_0223
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0224 : Poly :=
[
  term ((-12926102368368 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 224 for generator 7. -/
def ep_Q2_054_partial_07_0224 : Poly :=
[
  term ((25852204736736 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)],
  term ((-12926102368368 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((-12926102368368 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((-25852204736736 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1)],
  term ((12926102368368 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)],
  term ((12926102368368 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 7. -/
theorem ep_Q2_054_partial_07_0224_valid :
    mulPoly ep_Q2_054_coefficient_07_0224
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0225 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 7. -/
def ep_Q2_054_partial_07_0225 : Poly :=
[
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 7. -/
theorem ep_Q2_054_partial_07_0225_valid :
    mulPoly ep_Q2_054_coefficient_07_0225
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0226 : Poly :=
[
  term ((-245162655156 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 226 for generator 7. -/
def ep_Q2_054_partial_07_0226 : Poly :=
[
  term ((490325310312 : Rat) / 45033486517) [(0, 1), (9, 2)],
  term ((-245162655156 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-245162655156 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((-490325310312 : Rat) / 45033486517) [(9, 2), (12, 1)],
  term ((245162655156 : Rat) / 45033486517) [(9, 2), (12, 2)],
  term ((245162655156 : Rat) / 45033486517) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 7. -/
theorem ep_Q2_054_partial_07_0226_valid :
    mulPoly ep_Q2_054_coefficient_07_0226
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0227 : Poly :=
[
  term ((-163303853976 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 227 for generator 7. -/
def ep_Q2_054_partial_07_0227 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 2)],
  term ((-326607707952 : Rat) / 45033486517) [(9, 2), (12, 2)],
  term ((163303853976 : Rat) / 45033486517) [(9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 7. -/
theorem ep_Q2_054_partial_07_0227_valid :
    mulPoly ep_Q2_054_coefficient_07_0227
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0228 : Poly :=
[
  term ((6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 228 for generator 7. -/
def ep_Q2_054_partial_07_0228 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 7. -/
theorem ep_Q2_054_partial_07_0228_valid :
    mulPoly ep_Q2_054_coefficient_07_0228
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0229 : Poly :=
[
  term ((5592094446365 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 229 for generator 7. -/
def ep_Q2_054_partial_07_0229 : Poly :=
[
  term ((-11184188892730 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)],
  term ((5592094446365 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1)],
  term ((5592094446365 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1)],
  term ((11184188892730 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)],
  term ((-5592094446365 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)],
  term ((-5592094446365 : Rat) / 45033486517) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 7. -/
theorem ep_Q2_054_partial_07_0229_valid :
    mulPoly ep_Q2_054_coefficient_07_0229
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0230 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 7. -/
def ep_Q2_054_partial_07_0230 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 7. -/
theorem ep_Q2_054_partial_07_0230_valid :
    mulPoly ep_Q2_054_coefficient_07_0230
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0231 : Poly :=
[
  term ((2194696049844 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 231 for generator 7. -/
def ep_Q2_054_partial_07_0231 : Poly :=
[
  term ((-4389392099688 : Rat) / 45033486517) [(0, 1), (11, 2)],
  term ((2194696049844 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((2194696049844 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((4389392099688 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (12, 2)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 7. -/
theorem ep_Q2_054_partial_07_0231_valid :
    mulPoly ep_Q2_054_coefficient_07_0231
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0232 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

/-- Partial product 232 for generator 7. -/
def ep_Q2_054_partial_07_0232 : Poly :=
[
  term ((-121076473400 : Rat) / 45033486517) [(0, 1), (11, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(0, 2), (11, 2), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(1, 2), (11, 2), (16, 1)],
  term ((121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (12, 2), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 7. -/
theorem ep_Q2_054_partial_07_0232_valid :
    mulPoly ep_Q2_054_coefficient_07_0232
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0233 : Poly :=
[
  term ((1859887110627 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 233 for generator 7. -/
def ep_Q2_054_partial_07_0233 : Poly :=
[
  term ((-3719774221254 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((1859887110627 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((1859887110627 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-1859887110627 : Rat) / 45033486517) [(12, 1), (13, 2), (15, 2)],
  term ((3719774221254 : Rat) / 45033486517) [(12, 2), (15, 2)],
  term ((-1859887110627 : Rat) / 45033486517) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 7. -/
theorem ep_Q2_054_partial_07_0233_valid :
    mulPoly ep_Q2_054_coefficient_07_0233
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0234 : Poly :=
[
  term ((-8615657150703 : Rat) / 90066973034) [(13, 1), (15, 1)]
]

/-- Partial product 234 for generator 7. -/
def ep_Q2_054_partial_07_0234 : Poly :=
[
  term ((8615657150703 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)],
  term ((-8615657150703 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-8615657150703 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-8615657150703 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)],
  term ((8615657150703 : Rat) / 90066973034) [(12, 2), (13, 1), (15, 1)],
  term ((8615657150703 : Rat) / 90066973034) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 7. -/
theorem ep_Q2_054_partial_07_0234_valid :
    mulPoly ep_Q2_054_coefficient_07_0234
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0235 : Poly :=
[
  term ((-13446358243617 : Rat) / 90066973034) [(15, 2)]
]

/-- Partial product 235 for generator 7. -/
def ep_Q2_054_partial_07_0235 : Poly :=
[
  term ((13446358243617 : Rat) / 45033486517) [(0, 1), (15, 2)],
  term ((-13446358243617 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((-13446358243617 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((-13446358243617 : Rat) / 45033486517) [(12, 1), (15, 2)],
  term ((13446358243617 : Rat) / 90066973034) [(12, 2), (15, 2)],
  term ((13446358243617 : Rat) / 90066973034) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 7. -/
theorem ep_Q2_054_partial_07_0235_valid :
    mulPoly ep_Q2_054_coefficient_07_0235
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 7. -/
def ep_Q2_054_coefficient_07_0236 : Poly :=
[
  term ((15134559175 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 236 for generator 7. -/
def ep_Q2_054_partial_07_0236 : Poly :=
[
  term ((-15134559175 : Rat) / 45033486517) [(0, 1), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((15134559175 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((15134559175 : Rat) / 45033486517) [(12, 1), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(12, 2), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 7. -/
theorem ep_Q2_054_partial_07_0236_valid :
    mulPoly ep_Q2_054_coefficient_07_0236
        ep_Q2_054_generator_07_0200_0236 =
      ep_Q2_054_partial_07_0236 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_07_0200_0236 : List Poly :=
[
  ep_Q2_054_partial_07_0200,
  ep_Q2_054_partial_07_0201,
  ep_Q2_054_partial_07_0202,
  ep_Q2_054_partial_07_0203,
  ep_Q2_054_partial_07_0204,
  ep_Q2_054_partial_07_0205,
  ep_Q2_054_partial_07_0206,
  ep_Q2_054_partial_07_0207,
  ep_Q2_054_partial_07_0208,
  ep_Q2_054_partial_07_0209,
  ep_Q2_054_partial_07_0210,
  ep_Q2_054_partial_07_0211,
  ep_Q2_054_partial_07_0212,
  ep_Q2_054_partial_07_0213,
  ep_Q2_054_partial_07_0214,
  ep_Q2_054_partial_07_0215,
  ep_Q2_054_partial_07_0216,
  ep_Q2_054_partial_07_0217,
  ep_Q2_054_partial_07_0218,
  ep_Q2_054_partial_07_0219,
  ep_Q2_054_partial_07_0220,
  ep_Q2_054_partial_07_0221,
  ep_Q2_054_partial_07_0222,
  ep_Q2_054_partial_07_0223,
  ep_Q2_054_partial_07_0224,
  ep_Q2_054_partial_07_0225,
  ep_Q2_054_partial_07_0226,
  ep_Q2_054_partial_07_0227,
  ep_Q2_054_partial_07_0228,
  ep_Q2_054_partial_07_0229,
  ep_Q2_054_partial_07_0230,
  ep_Q2_054_partial_07_0231,
  ep_Q2_054_partial_07_0232,
  ep_Q2_054_partial_07_0233,
  ep_Q2_054_partial_07_0234,
  ep_Q2_054_partial_07_0235,
  ep_Q2_054_partial_07_0236
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_07_0200_0236 : Poly :=
[
  term ((-505654933203 : Rat) / 45033486517) [(0, 1), (7, 2), (12, 1)],
  term ((7449494196237 : Rat) / 45033486517) [(0, 1), (8, 1)],
  term ((1160448109266 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (11, 1)],
  term ((-326607707952 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (13, 1)],
  term ((-2103710916 : Rat) / 166175227) [(0, 1), (8, 1), (9, 1), (15, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-41642046810488 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8420844215628 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2)],
  term ((-402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-10431090014964 : Rat) / 45033486517) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-14551023661322 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2)],
  term ((-1916578168020 : Rat) / 45033486517) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 90066973034) [(0, 1), (8, 1), (16, 1)],
  term ((1159620612498 : Rat) / 45033486517) [(0, 1), (8, 2)],
  term ((1919172662124 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((715879967496 : Rat) / 45033486517) [(0, 1), (8, 2), (11, 2)],
  term ((-1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (15, 2)],
  term ((-2591047819762 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-54875727906936 : Rat) / 45033486517) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((5614553240853 : Rat) / 45033486517) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1939233265965 : Rat) / 90066973034) [(0, 1), (9, 1), (13, 1)],
  term ((25852204736736 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((490325310312 : Rat) / 45033486517) [(0, 1), (9, 2)],
  term ((326607707952 : Rat) / 45033486517) [(0, 1), (9, 2), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-11184188892730 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4389392099688 : Rat) / 45033486517) [(0, 1), (11, 2)],
  term ((-121076473400 : Rat) / 45033486517) [(0, 1), (11, 2), (16, 1)],
  term ((-3719774221254 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2)],
  term ((8615657150703 : Rat) / 45033486517) [(0, 1), (13, 1), (15, 1)],
  term ((13446358243617 : Rat) / 45033486517) [(0, 1), (15, 2)],
  term ((-15134559175 : Rat) / 45033486517) [(0, 1), (16, 1)],
  term ((505654933203 : Rat) / 90066973034) [(0, 2), (7, 2), (12, 1)],
  term ((-7449494196237 : Rat) / 90066973034) [(0, 2), (8, 1)],
  term ((-580224054633 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((163303853976 : Rat) / 45033486517) [(0, 2), (8, 1), (9, 1), (13, 1)],
  term ((1051855458 : Rat) / 166175227) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2)],
  term ((201158132262 : Rat) / 45033486517) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(0, 2), (8, 1), (12, 1), (15, 2)],
  term ((5215545007482 : Rat) / 45033486517) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((7275511830661 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(0, 2), (8, 1), (16, 1)],
  term ((-579810306249 : Rat) / 45033486517) [(0, 2), (8, 2)],
  term ((-959586331062 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 1), (15, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(0, 2), (8, 2), (11, 2)],
  term ((569278161468 : Rat) / 45033486517) [(0, 2), (8, 2), (15, 2)],
  term ((1295523909881 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((27437863953468 : Rat) / 45033486517) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-5614553240853 : Rat) / 90066973034) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((1939233265965 : Rat) / 180133946068) [(0, 2), (9, 1), (13, 1)],
  term ((-12926102368368 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-245162655156 : Rat) / 45033486517) [(0, 2), (9, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(0, 2), (9, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((5592094446365 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(0, 2), (11, 2)],
  term ((60538236700 : Rat) / 45033486517) [(0, 2), (11, 2), (16, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(0, 2), (12, 1), (15, 2)],
  term ((-8615657150703 : Rat) / 90066973034) [(0, 2), (13, 1), (15, 1)],
  term ((-13446358243617 : Rat) / 90066973034) [(0, 2), (15, 2)],
  term ((15134559175 : Rat) / 90066973034) [(0, 2), (16, 1)],
  term ((505654933203 : Rat) / 90066973034) [(1, 2), (7, 2), (12, 1)],
  term ((-7449494196237 : Rat) / 90066973034) [(1, 2), (8, 1)],
  term ((-580224054633 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((163303853976 : Rat) / 45033486517) [(1, 2), (8, 1), (9, 1), (13, 1)],
  term ((1051855458 : Rat) / 166175227) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((20821023405244 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4210422107814 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((201158132262 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((5215545007482 : Rat) / 45033486517) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((7275511830661 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2)],
  term ((958289084010 : Rat) / 45033486517) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 180133946068) [(1, 2), (8, 1), (16, 1)],
  term ((-579810306249 : Rat) / 45033486517) [(1, 2), (8, 2)],
  term ((-959586331062 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 1), (15, 1)],
  term ((-357939983748 : Rat) / 45033486517) [(1, 2), (8, 2), (11, 2)],
  term ((569278161468 : Rat) / 45033486517) [(1, 2), (8, 2), (15, 2)],
  term ((1295523909881 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((27437863953468 : Rat) / 45033486517) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-5614553240853 : Rat) / 90066973034) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((1939233265965 : Rat) / 180133946068) [(1, 2), (9, 1), (13, 1)],
  term ((-12926102368368 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1)],
  term ((-479144542005 : Rat) / 45033486517) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-245162655156 : Rat) / 45033486517) [(1, 2), (9, 2)],
  term ((-163303853976 : Rat) / 45033486517) [(1, 2), (9, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((5592094446365 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((60538236700 : Rat) / 45033486517) [(1, 2), (11, 2), (16, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(1, 2), (12, 1), (15, 2)],
  term ((-8615657150703 : Rat) / 90066973034) [(1, 2), (13, 1), (15, 1)],
  term ((-13446358243617 : Rat) / 90066973034) [(1, 2), (15, 2)],
  term ((15134559175 : Rat) / 90066973034) [(1, 2), (16, 1)],
  term ((-505654933203 : Rat) / 90066973034) [(7, 2), (12, 1), (13, 2)],
  term ((505654933203 : Rat) / 45033486517) [(7, 2), (12, 2)],
  term ((-505654933203 : Rat) / 90066973034) [(7, 2), (12, 3)],
  term ((-1160448109266 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((580224054633 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((326607707952 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2103710916 : Rat) / 166175227) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1051855458 : Rat) / 166175227) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(8, 1), (9, 1), (13, 3)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((41642046810488 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47844103565548 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 3), (15, 1)],
  term ((-20821023405244 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8420844215628 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1)],
  term ((402316264524 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((4210422107814 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 2)],
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-7449494196237 : Rat) / 45033486517) [(8, 1), (12, 1)],
  term ((10431090014964 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((14551023661322 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)],
  term ((1916578168020 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((100579066131 : Rat) / 90066973034) [(8, 1), (12, 1), (16, 1)],
  term ((7449494196237 : Rat) / 90066973034) [(8, 1), (12, 2)],
  term ((-5215545007482 : Rat) / 45033486517) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((6236028249491 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (12, 2), (16, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(8, 1), (12, 3), (15, 2)],
  term ((7449494196237 : Rat) / 90066973034) [(8, 1), (13, 2)],
  term ((-7275511830661 : Rat) / 45033486517) [(8, 1), (13, 2), (15, 2)],
  term ((-958289084010 : Rat) / 45033486517) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-100579066131 : Rat) / 180133946068) [(8, 1), (13, 2), (16, 1)],
  term ((-5215545007482 : Rat) / 45033486517) [(8, 1), (13, 3), (15, 1)],
  term ((-1919172662124 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (12, 2), (15, 1)],
  term ((959586331062 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-715879967496 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 1)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (12, 2)],
  term ((357939983748 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 2)],
  term ((-1159620612498 : Rat) / 45033486517) [(8, 2), (12, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(8, 2), (12, 1), (15, 2)],
  term ((579810306249 : Rat) / 45033486517) [(8, 2), (12, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (12, 2), (15, 2)],
  term ((579810306249 : Rat) / 45033486517) [(8, 2), (13, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (13, 2), (15, 2)],
  term ((2591047819762 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1295523909881 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1295523909881 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((54875727906936 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((1939233265965 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 1)],
  term ((5614553240853 : Rat) / 90066973034) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-25852204736736 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1939233265965 : Rat) / 180133946068) [(9, 1), (12, 2), (13, 1)],
  term ((7311549127515 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5614553240853 : Rat) / 90066973034) [(9, 1), (12, 3), (15, 1)],
  term ((12926102368368 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1939233265965 : Rat) / 180133946068) [(9, 1), (13, 3)],
  term ((-490325310312 : Rat) / 45033486517) [(9, 2), (12, 1)],
  term ((163303853976 : Rat) / 45033486517) [(9, 2), (12, 1), (13, 2)],
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (12, 2)],
  term ((163303853976 : Rat) / 45033486517) [(9, 2), (12, 3)],
  term ((245162655156 : Rat) / 45033486517) [(9, 2), (13, 2)],
  term ((-6755770040076 : Rat) / 45033486517) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((11184188892730 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7919445633787 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(11, 1), (12, 3), (15, 1)],
  term ((-5592094446365 : Rat) / 45033486517) [(11, 1), (13, 2), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4389392099688 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (12, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (12, 2), (16, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (13, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (13, 2), (16, 1)],
  term ((-8615657150703 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)],
  term ((-1859887110627 : Rat) / 45033486517) [(12, 1), (13, 2), (15, 2)],
  term ((-13446358243617 : Rat) / 45033486517) [(12, 1), (15, 2)],
  term ((15134559175 : Rat) / 45033486517) [(12, 1), (16, 1)],
  term ((8615657150703 : Rat) / 90066973034) [(12, 2), (13, 1), (15, 1)],
  term ((20885906686125 : Rat) / 90066973034) [(12, 2), (15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(12, 2), (16, 1)],
  term ((-1859887110627 : Rat) / 45033486517) [(12, 3), (15, 2)],
  term ((13446358243617 : Rat) / 90066973034) [(13, 2), (15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(13, 2), (16, 1)],
  term ((8615657150703 : Rat) / 90066973034) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 200 through 236. -/
theorem ep_Q2_054_block_07_0200_0236_valid :
    checkProductSumEq ep_Q2_054_partials_07_0200_0236
      ep_Q2_054_block_07_0200_0236 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
