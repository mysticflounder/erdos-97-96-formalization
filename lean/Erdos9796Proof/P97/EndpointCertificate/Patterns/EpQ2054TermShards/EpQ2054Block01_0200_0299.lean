/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 1:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_01_0200_0299 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0200 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 200 for generator 1. -/
def ep_Q2_054_partial_01_0200 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 1. -/
theorem ep_Q2_054_partial_01_0200_valid :
    mulPoly ep_Q2_054_coefficient_01_0200
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0201 : Poly :=
[
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 201 for generator 1. -/
def ep_Q2_054_partial_01_0201 : Poly :=
[
  term ((-31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 3), (15, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 1. -/
theorem ep_Q2_054_partial_01_0201_valid :
    mulPoly ep_Q2_054_coefficient_01_0201
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0202 : Poly :=
[
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 1. -/
def ep_Q2_054_partial_01_0202 : Poly :=
[
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 1. -/
theorem ep_Q2_054_partial_01_0202_valid :
    mulPoly ep_Q2_054_coefficient_01_0202
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0203 : Poly :=
[
  term ((14875014080163 : Rat) / 180133946068) [(1, 1), (11, 1)]
]

/-- Partial product 203 for generator 1. -/
def ep_Q2_054_partial_01_0203 : Poly :=
[
  term ((-14875014080163 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((14875014080163 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((14875014080163 : Rat) / 180133946068) [(1, 1), (2, 2), (11, 1)],
  term ((14875014080163 : Rat) / 180133946068) [(1, 1), (3, 2), (11, 1)],
  term ((-14875014080163 : Rat) / 180133946068) [(1, 1), (10, 2), (11, 1)],
  term ((-14875014080163 : Rat) / 180133946068) [(1, 1), (11, 3)],
  term ((-14875014080163 : Rat) / 90066973034) [(1, 2), (3, 1), (11, 1)],
  term ((14875014080163 : Rat) / 90066973034) [(1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 1. -/
theorem ep_Q2_054_partial_01_0203_valid :
    mulPoly ep_Q2_054_coefficient_01_0203
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0204 : Poly :=
[
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 204 for generator 1. -/
def ep_Q2_054_partial_01_0204 : Poly :=
[
  term ((-515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 3), (12, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((515943272403 : Rat) / 45033486517) [(1, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 1. -/
theorem ep_Q2_054_partial_01_0204_valid :
    mulPoly ep_Q2_054_coefficient_01_0204
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0205 : Poly :=
[
  term ((13038820898874 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 205 for generator 1. -/
def ep_Q2_054_partial_01_0205 : Poly :=
[
  term ((-26077641797748 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((26077641797748 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((13038820898874 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((13038820898874 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-13038820898874 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-13038820898874 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-26077641797748 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((26077641797748 : Rat) / 45033486517) [(1, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 1. -/
theorem ep_Q2_054_partial_01_0205_valid :
    mulPoly ep_Q2_054_coefficient_01_0205
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0206 : Poly :=
[
  term ((-19101465389847 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 206 for generator 1. -/
def ep_Q2_054_partial_01_0206 : Poly :=
[
  term ((38202930779694 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-38202930779694 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-19101465389847 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-19101465389847 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((19101465389847 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((19101465389847 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)],
  term ((38202930779694 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-38202930779694 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 1. -/
theorem ep_Q2_054_partial_01_0206_valid :
    mulPoly ep_Q2_054_coefficient_01_0206
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0207 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 1. -/
def ep_Q2_054_partial_01_0207 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 1. -/
theorem ep_Q2_054_partial_01_0207_valid :
    mulPoly ep_Q2_054_coefficient_01_0207
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0208 : Poly :=
[
  term ((6120999700740 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 208 for generator 1. -/
def ep_Q2_054_partial_01_0208 : Poly :=
[
  term ((-12241999401480 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((6120999700740 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((6120999700740 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-6120999700740 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((-6120999700740 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 1. -/
theorem ep_Q2_054_partial_01_0208_valid :
    mulPoly ep_Q2_054_coefficient_01_0208
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0209 : Poly :=
[
  term ((-6170096552583 : Rat) / 180133946068) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 209 for generator 1. -/
def ep_Q2_054_partial_01_0209 : Poly :=
[
  term ((6170096552583 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-6170096552583 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6170096552583 : Rat) / 180133946068) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-6170096552583 : Rat) / 180133946068) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((6170096552583 : Rat) / 180133946068) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((6170096552583 : Rat) / 180133946068) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((6170096552583 : Rat) / 90066973034) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-6170096552583 : Rat) / 90066973034) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 1. -/
theorem ep_Q2_054_partial_01_0209_valid :
    mulPoly ep_Q2_054_coefficient_01_0209
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0210 : Poly :=
[
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 1. -/
def ep_Q2_054_partial_01_0210 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 1. -/
theorem ep_Q2_054_partial_01_0210_valid :
    mulPoly ep_Q2_054_coefficient_01_0210
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0211 : Poly :=
[
  term ((41892184808781 : Rat) / 360267892136) [(1, 1), (13, 1)]
]

/-- Partial product 211 for generator 1. -/
def ep_Q2_054_partial_01_0211 : Poly :=
[
  term ((-41892184808781 : Rat) / 180133946068) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((41892184808781 : Rat) / 180133946068) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((41892184808781 : Rat) / 360267892136) [(1, 1), (2, 2), (13, 1)],
  term ((41892184808781 : Rat) / 360267892136) [(1, 1), (3, 2), (13, 1)],
  term ((-41892184808781 : Rat) / 360267892136) [(1, 1), (10, 2), (13, 1)],
  term ((-41892184808781 : Rat) / 360267892136) [(1, 1), (11, 2), (13, 1)],
  term ((-41892184808781 : Rat) / 180133946068) [(1, 2), (3, 1), (13, 1)],
  term ((41892184808781 : Rat) / 180133946068) [(1, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 1. -/
theorem ep_Q2_054_partial_01_0211_valid :
    mulPoly ep_Q2_054_coefficient_01_0211
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0212 : Poly :=
[
  term ((10201666167900 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 212 for generator 1. -/
def ep_Q2_054_partial_01_0212 : Poly :=
[
  term ((-20403332335800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((20403332335800 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((10201666167900 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((10201666167900 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-10201666167900 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-10201666167900 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 1. -/
theorem ep_Q2_054_partial_01_0212_valid :
    mulPoly ep_Q2_054_coefficient_01_0212
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0213 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 1. -/
def ep_Q2_054_partial_01_0213 : Poly :=
[
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 1. -/
theorem ep_Q2_054_partial_01_0213_valid :
    mulPoly ep_Q2_054_coefficient_01_0213
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0214 : Poly :=
[
  term ((-54153981689547 : Rat) / 180133946068) [(1, 1), (15, 1)]
]

/-- Partial product 214 for generator 1. -/
def ep_Q2_054_partial_01_0214 : Poly :=
[
  term ((54153981689547 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-54153981689547 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-54153981689547 : Rat) / 180133946068) [(1, 1), (2, 2), (15, 1)],
  term ((-54153981689547 : Rat) / 180133946068) [(1, 1), (3, 2), (15, 1)],
  term ((54153981689547 : Rat) / 180133946068) [(1, 1), (10, 2), (15, 1)],
  term ((54153981689547 : Rat) / 180133946068) [(1, 1), (11, 2), (15, 1)],
  term ((54153981689547 : Rat) / 90066973034) [(1, 2), (3, 1), (15, 1)],
  term ((-54153981689547 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 1. -/
theorem ep_Q2_054_partial_01_0214_valid :
    mulPoly ep_Q2_054_coefficient_01_0214
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0215 : Poly :=
[
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 1. -/
def ep_Q2_054_partial_01_0215 : Poly :=
[
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 1. -/
theorem ep_Q2_054_partial_01_0215_valid :
    mulPoly ep_Q2_054_coefficient_01_0215
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0216 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 2)]
]

/-- Partial product 216 for generator 1. -/
def ep_Q2_054_partial_01_0216 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (10, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (2, 2)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (3, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (10, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (11, 2)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 3), (3, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 1. -/
theorem ep_Q2_054_partial_01_0216_valid :
    mulPoly ep_Q2_054_coefficient_01_0216
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0217 : Poly :=
[
  term ((-952510656744 : Rat) / 45033486517) [(1, 2), (8, 1)]
]

/-- Partial product 217 for generator 1. -/
def ep_Q2_054_partial_01_0217 : Poly :=
[
  term ((1905021313488 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1), (8, 1)],
  term ((-1905021313488 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (10, 1)],
  term ((-952510656744 : Rat) / 45033486517) [(1, 2), (2, 2), (8, 1)],
  term ((-952510656744 : Rat) / 45033486517) [(1, 2), (3, 2), (8, 1)],
  term ((952510656744 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 2)],
  term ((952510656744 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((1905021313488 : Rat) / 45033486517) [(1, 3), (3, 1), (8, 1)],
  term ((-1905021313488 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 1. -/
theorem ep_Q2_054_partial_01_0217_valid :
    mulPoly ep_Q2_054_coefficient_01_0217
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0218 : Poly :=
[
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (12, 1)]
]

/-- Partial product 218 for generator 1. -/
def ep_Q2_054_partial_01_0218 : Poly :=
[
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (10, 1), (12, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (2, 2), (12, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (3, 2), (12, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (10, 2), (12, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (11, 2), (12, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 3), (3, 1), (12, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 1. -/
theorem ep_Q2_054_partial_01_0218_valid :
    mulPoly ep_Q2_054_coefficient_01_0218
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0219 : Poly :=
[
  term ((-8043991308213 : Rat) / 180133946068) [(2, 1)]
]

/-- Partial product 219 for generator 1. -/
def ep_Q2_054_partial_01_0219 : Poly :=
[
  term ((-8043991308213 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1)],
  term ((8043991308213 : Rat) / 90066973034) [(0, 1), (2, 2)],
  term ((8043991308213 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1)],
  term ((-8043991308213 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1)],
  term ((-8043991308213 : Rat) / 180133946068) [(2, 1), (3, 2)],
  term ((8043991308213 : Rat) / 180133946068) [(2, 1), (10, 2)],
  term ((8043991308213 : Rat) / 180133946068) [(2, 1), (11, 2)],
  term ((-8043991308213 : Rat) / 180133946068) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 1. -/
theorem ep_Q2_054_partial_01_0219_valid :
    mulPoly ep_Q2_054_coefficient_01_0219
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0220 : Poly :=
[
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1)]
]

/-- Partial product 220 for generator 1. -/
def ep_Q2_054_partial_01_0220 : Poly :=
[
  term ((4806987178158 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(0, 1), (2, 2), (6, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (3, 2), (6, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (10, 2)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 2)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 1. -/
theorem ep_Q2_054_partial_01_0220_valid :
    mulPoly ep_Q2_054_coefficient_01_0220
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0221 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 221 for generator 1. -/
def ep_Q2_054_partial_01_0221 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (11, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 3)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 1. -/
theorem ep_Q2_054_partial_01_0221_valid :
    mulPoly ep_Q2_054_coefficient_01_0221
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0222 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 222 for generator 1. -/
def ep_Q2_054_partial_01_0222 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 1. -/
theorem ep_Q2_054_partial_01_0222_valid :
    mulPoly ep_Q2_054_coefficient_01_0222
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0223 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 223 for generator 1. -/
def ep_Q2_054_partial_01_0223 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 1. -/
theorem ep_Q2_054_partial_01_0223_valid :
    mulPoly ep_Q2_054_coefficient_01_0223
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0224 : Poly :=
[
  term ((4532427553158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 224 for generator 1. -/
def ep_Q2_054_partial_01_0224 : Poly :=
[
  term ((9064855106316 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-9064855106316 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-9064855106316 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((9064855106316 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((4532427553158 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((-4532427553158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((-4532427553158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((4532427553158 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 1. -/
theorem ep_Q2_054_partial_01_0224_valid :
    mulPoly ep_Q2_054_coefficient_01_0224
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0225 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 225 for generator 1. -/
def ep_Q2_054_partial_01_0225 : Poly :=
[
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 3), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 1. -/
theorem ep_Q2_054_partial_01_0225_valid :
    mulPoly ep_Q2_054_coefficient_01_0225
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0226 : Poly :=
[
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 226 for generator 1. -/
def ep_Q2_054_partial_01_0226 : Poly :=
[
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 1. -/
theorem ep_Q2_054_partial_01_0226_valid :
    mulPoly ep_Q2_054_coefficient_01_0226
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0227 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 227 for generator 1. -/
def ep_Q2_054_partial_01_0227 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 1. -/
theorem ep_Q2_054_partial_01_0227_valid :
    mulPoly ep_Q2_054_coefficient_01_0227
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0228 : Poly :=
[
  term ((384383475000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 228 for generator 1. -/
def ep_Q2_054_partial_01_0228 : Poly :=
[
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (12, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (12, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 1. -/
theorem ep_Q2_054_partial_01_0228_valid :
    mulPoly ep_Q2_054_coefficient_01_0228
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0229 : Poly :=
[
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 229 for generator 1. -/
def ep_Q2_054_partial_01_0229 : Poly :=
[
  term ((-1827617815512 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 2), (15, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (10, 1), (15, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1827617815512 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (10, 1), (15, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 3), (15, 1)],
  term ((-913808907756 : Rat) / 45033486517) [(2, 3), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 1. -/
theorem ep_Q2_054_partial_01_0229_valid :
    mulPoly ep_Q2_054_coefficient_01_0229
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0230 : Poly :=
[
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 1. -/
def ep_Q2_054_partial_01_0230 : Poly :=
[
  term ((-134229150000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((134229150000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((134229150000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-134229150000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 3), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 1. -/
theorem ep_Q2_054_partial_01_0230_valid :
    mulPoly ep_Q2_054_coefficient_01_0230
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0231 : Poly :=
[
  term ((5055489718524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 231 for generator 1. -/
def ep_Q2_054_partial_01_0231 : Poly :=
[
  term ((10110979437048 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-10110979437048 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-10110979437048 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((10110979437048 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((5055489718524 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((-5055489718524 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((-5055489718524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3)],
  term ((5055489718524 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 1. -/
theorem ep_Q2_054_partial_01_0231_valid :
    mulPoly ep_Q2_054_coefficient_01_0231
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0232 : Poly :=
[
  term ((85418550000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 232 for generator 1. -/
def ep_Q2_054_partial_01_0232 : Poly :=
[
  term ((170837100000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-170837100000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-170837100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((170837100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)],
  term ((85418550000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-85418550000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-85418550000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3), (16, 1)],
  term ((85418550000 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 1. -/
theorem ep_Q2_054_partial_01_0232_valid :
    mulPoly ep_Q2_054_coefficient_01_0232
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0233 : Poly :=
[
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 233 for generator 1. -/
def ep_Q2_054_partial_01_0233 : Poly :=
[
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 3), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 1. -/
theorem ep_Q2_054_partial_01_0233_valid :
    mulPoly ep_Q2_054_coefficient_01_0233
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0234 : Poly :=
[
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 234 for generator 1. -/
def ep_Q2_054_partial_01_0234 : Poly :=
[
  term ((12652452277560 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((12652452277560 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 1. -/
theorem ep_Q2_054_partial_01_0234_valid :
    mulPoly ep_Q2_054_coefficient_01_0234
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0235 : Poly :=
[
  term ((-8563594110615 : Rat) / 45033486517) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 235 for generator 1. -/
def ep_Q2_054_partial_01_0235 : Poly :=
[
  term ((-17127188221230 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((17127188221230 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((17127188221230 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-17127188221230 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-8563594110615 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((8563594110615 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((8563594110615 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-8563594110615 : Rat) / 45033486517) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 1. -/
theorem ep_Q2_054_partial_01_0235_valid :
    mulPoly ep_Q2_054_coefficient_01_0235
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0236 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 236 for generator 1. -/
def ep_Q2_054_partial_01_0236 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 3), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 1. -/
theorem ep_Q2_054_partial_01_0236_valid :
    mulPoly ep_Q2_054_coefficient_01_0236
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0237 : Poly :=
[
  term ((302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 237 for generator 1. -/
def ep_Q2_054_partial_01_0237 : Poly :=
[
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 3), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 1. -/
theorem ep_Q2_054_partial_01_0237_valid :
    mulPoly ep_Q2_054_coefficient_01_0237
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0238 : Poly :=
[
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 238 for generator 1. -/
def ep_Q2_054_partial_01_0238 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 3), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 1. -/
theorem ep_Q2_054_partial_01_0238_valid :
    mulPoly ep_Q2_054_coefficient_01_0238
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0239 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 239 for generator 1. -/
def ep_Q2_054_partial_01_0239 : Poly :=
[
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 3), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 3), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 1. -/
theorem ep_Q2_054_partial_01_0239_valid :
    mulPoly ep_Q2_054_coefficient_01_0239
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0240 : Poly :=
[
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 240 for generator 1. -/
def ep_Q2_054_partial_01_0240 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 3), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 1. -/
theorem ep_Q2_054_partial_01_0240_valid :
    mulPoly ep_Q2_054_coefficient_01_0240
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0241 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 241 for generator 1. -/
def ep_Q2_054_partial_01_0241 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (11, 1), (15, 2)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 3), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 1. -/
theorem ep_Q2_054_partial_01_0241_valid :
    mulPoly ep_Q2_054_coefficient_01_0241
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0242 : Poly :=
[
  term ((-6347703393360 : Rat) / 45033486517) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 242 for generator 1. -/
def ep_Q2_054_partial_01_0242 : Poly :=
[
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 3), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 1. -/
theorem ep_Q2_054_partial_01_0242_valid :
    mulPoly ep_Q2_054_coefficient_01_0242
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0243 : Poly :=
[
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 243 for generator 1. -/
def ep_Q2_054_partial_01_0243 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 1. -/
theorem ep_Q2_054_partial_01_0243_valid :
    mulPoly ep_Q2_054_coefficient_01_0243
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0244 : Poly :=
[
  term ((4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 244 for generator 1. -/
def ep_Q2_054_partial_01_0244 : Poly :=
[
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 1. -/
theorem ep_Q2_054_partial_01_0244_valid :
    mulPoly ep_Q2_054_coefficient_01_0244
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0245 : Poly :=
[
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 245 for generator 1. -/
def ep_Q2_054_partial_01_0245 : Poly :=
[
  term ((-520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (12, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (12, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 3), (12, 1), (16, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 3), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 1. -/
theorem ep_Q2_054_partial_01_0245_valid :
    mulPoly ep_Q2_054_coefficient_01_0245
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0246 : Poly :=
[
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 1. -/
def ep_Q2_054_partial_01_0246 : Poly :=
[
  term ((1041888176220 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1041888176220 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 1. -/
theorem ep_Q2_054_partial_01_0246_valid :
    mulPoly ep_Q2_054_coefficient_01_0246
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0247 : Poly :=
[
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 247 for generator 1. -/
def ep_Q2_054_partial_01_0247 : Poly :=
[
  term ((-12403430059266 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((12403430059266 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (15, 2)],
  term ((12403430059266 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (15, 2)],
  term ((-12403430059266 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (15, 2)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 3), (15, 2)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 3), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 1. -/
theorem ep_Q2_054_partial_01_0247_valid :
    mulPoly ep_Q2_054_coefficient_01_0247
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0248 : Poly :=
[
  term ((587385075810 : Rat) / 45033486517) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 248 for generator 1. -/
def ep_Q2_054_partial_01_0248 : Poly :=
[
  term ((1174770151620 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-1174770151620 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1174770151620 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((1174770151620 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((587385075810 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-587385075810 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-587385075810 : Rat) / 45033486517) [(2, 1), (10, 3), (15, 2), (16, 1)],
  term ((587385075810 : Rat) / 45033486517) [(2, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 1. -/
theorem ep_Q2_054_partial_01_0248_valid :
    mulPoly ep_Q2_054_coefficient_01_0248
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0249 : Poly :=
[
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 249 for generator 1. -/
def ep_Q2_054_partial_01_0249 : Poly :=
[
  term ((781416132165 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (10, 3), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 1. -/
theorem ep_Q2_054_partial_01_0249_valid :
    mulPoly ep_Q2_054_coefficient_01_0249
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0250 : Poly :=
[
  term ((787604322741 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 250 for generator 1. -/
def ep_Q2_054_partial_01_0250 : Poly :=
[
  term ((1575208645482 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1575208645482 : Rat) / 45033486517) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-1575208645482 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((1575208645482 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((787604322741 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-787604322741 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-787604322741 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1)],
  term ((787604322741 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 1. -/
theorem ep_Q2_054_partial_01_0250_valid :
    mulPoly ep_Q2_054_coefficient_01_0250
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0251 : Poly :=
[
  term ((-1410600754080 : Rat) / 45033486517) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 251 for generator 1. -/
def ep_Q2_054_partial_01_0251 : Poly :=
[
  term ((-2821201508160 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2821201508160 : Rat) / 45033486517) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((2821201508160 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2821201508160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1410600754080 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((1410600754080 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1410600754080 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1410600754080 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 1. -/
theorem ep_Q2_054_partial_01_0251_valid :
    mulPoly ep_Q2_054_coefficient_01_0251
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0252 : Poly :=
[
  term ((938437253395 : Rat) / 45033486517) [(2, 1), (12, 1)]
]

/-- Partial product 252 for generator 1. -/
def ep_Q2_054_partial_01_0252 : Poly :=
[
  term ((1876874506790 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 1), (3, 2), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 1), (10, 2), (12, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 1. -/
theorem ep_Q2_054_partial_01_0252_valid :
    mulPoly ep_Q2_054_coefficient_01_0252
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0253 : Poly :=
[
  term ((156283226433 : Rat) / 45033486517) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 253 for generator 1. -/
def ep_Q2_054_partial_01_0253 : Poly :=
[
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(2, 1), (3, 2), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 1), (10, 2), (12, 1), (15, 2)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((156283226433 : Rat) / 45033486517) [(2, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 1. -/
theorem ep_Q2_054_partial_01_0253_valid :
    mulPoly ep_Q2_054_coefficient_01_0253
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0254 : Poly :=
[
  term ((1302360220275 : Rat) / 180133946068) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 254 for generator 1. -/
def ep_Q2_054_partial_01_0254 : Poly :=
[
  term ((1302360220275 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((1302360220275 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((1302360220275 : Rat) / 180133946068) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 180133946068) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 180133946068) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((1302360220275 : Rat) / 180133946068) [(2, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 1. -/
theorem ep_Q2_054_partial_01_0254_valid :
    mulPoly ep_Q2_054_coefficient_01_0254
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0255 : Poly :=
[
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 255 for generator 1. -/
def ep_Q2_054_partial_01_0255 : Poly :=
[
  term ((1593060589474 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1593060589474 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 1. -/
theorem ep_Q2_054_partial_01_0255_valid :
    mulPoly ep_Q2_054_coefficient_01_0255
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0256 : Poly :=
[
  term ((-1302360220275 : Rat) / 90066973034) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 1. -/
def ep_Q2_054_partial_01_0256 : Poly :=
[
  term ((-1302360220275 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1302360220275 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((1302360220275 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((1302360220275 : Rat) / 90066973034) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1302360220275 : Rat) / 90066973034) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(2, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 1. -/
theorem ep_Q2_054_partial_01_0256_valid :
    mulPoly ep_Q2_054_coefficient_01_0256
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0257 : Poly :=
[
  term ((-24107146625041 : Rat) / 45033486517) [(2, 1), (15, 2)]
]

/-- Partial product 257 for generator 1. -/
def ep_Q2_054_partial_01_0257 : Poly :=
[
  term ((-48214293250082 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((48214293250082 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((48214293250082 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-48214293250082 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-24107146625041 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2)],
  term ((24107146625041 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2)],
  term ((24107146625041 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2)],
  term ((-24107146625041 : Rat) / 45033486517) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 1. -/
theorem ep_Q2_054_partial_01_0257_valid :
    mulPoly ep_Q2_054_coefficient_01_0257
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0258 : Poly :=
[
  term ((-2344248396495 : Rat) / 45033486517) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 1. -/
def ep_Q2_054_partial_01_0258 : Poly :=
[
  term ((-4688496792990 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((4688496792990 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((4688496792990 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-4688496792990 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2344248396495 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((2344248396495 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((2344248396495 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2344248396495 : Rat) / 45033486517) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 1. -/
theorem ep_Q2_054_partial_01_0258_valid :
    mulPoly ep_Q2_054_coefficient_01_0258
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0259 : Poly :=
[
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (16, 1)]
]

/-- Partial product 259 for generator 1. -/
def ep_Q2_054_partial_01_0259 : Poly :=
[
  term ((-781416132165 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 1), (2, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (3, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (10, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (11, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 1. -/
theorem ep_Q2_054_partial_01_0259_valid :
    mulPoly ep_Q2_054_coefficient_01_0259
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0260 : Poly :=
[
  term ((-19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 260 for generator 1. -/
def ep_Q2_054_partial_01_0260 : Poly :=
[
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (11, 2)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 1. -/
theorem ep_Q2_054_partial_01_0260_valid :
    mulPoly ep_Q2_054_coefficient_01_0260
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0261 : Poly :=
[
  term ((15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 261 for generator 1. -/
def ep_Q2_054_partial_01_0261 : Poly :=
[
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 1. -/
theorem ep_Q2_054_partial_01_0261_valid :
    mulPoly ep_Q2_054_coefficient_01_0261
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0262 : Poly :=
[
  term ((-8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 262 for generator 1. -/
def ep_Q2_054_partial_01_0262 : Poly :=
[
  term ((17009567950608 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 1. -/
theorem ep_Q2_054_partial_01_0262_valid :
    mulPoly ep_Q2_054_coefficient_01_0262
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0263 : Poly :=
[
  term ((-2316161312055 : Rat) / 90066973034) [(3, 1), (7, 1)]
]

/-- Partial product 263 for generator 1. -/
def ep_Q2_054_partial_01_0263 : Poly :=
[
  term ((2316161312055 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((-2316161312055 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-2316161312055 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((2316161312055 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1)],
  term ((-2316161312055 : Rat) / 90066973034) [(2, 2), (3, 1), (7, 1)],
  term ((2316161312055 : Rat) / 90066973034) [(3, 1), (7, 1), (10, 2)],
  term ((2316161312055 : Rat) / 90066973034) [(3, 1), (7, 1), (11, 2)],
  term ((-2316161312055 : Rat) / 90066973034) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 1. -/
theorem ep_Q2_054_partial_01_0263_valid :
    mulPoly ep_Q2_054_coefficient_01_0263
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0264 : Poly :=
[
  term ((-4907659040658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1)]
]

/-- Partial product 264 for generator 1. -/
def ep_Q2_054_partial_01_0264 : Poly :=
[
  term ((9815318081316 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1)],
  term ((-9815318081316 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-9815318081316 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((9815318081316 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((-4907659040658 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1)],
  term ((4907659040658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((4907659040658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-4907659040658 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 1. -/
theorem ep_Q2_054_partial_01_0264_valid :
    mulPoly ep_Q2_054_coefficient_01_0264
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0265 : Poly :=
[
  term ((-109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1)]
]

/-- Partial product 265 for generator 1. -/
def ep_Q2_054_partial_01_0265 : Poly :=
[
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 2)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (10, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 3)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 1. -/
theorem ep_Q2_054_partial_01_0265_valid :
    mulPoly ep_Q2_054_coefficient_01_0265
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0266 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 266 for generator 1. -/
def ep_Q2_054_partial_01_0266 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 1. -/
theorem ep_Q2_054_partial_01_0266_valid :
    mulPoly ep_Q2_054_coefficient_01_0266
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0267 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 267 for generator 1. -/
def ep_Q2_054_partial_01_0267 : Poly :=
[
  term ((-146431800000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 1. -/
theorem ep_Q2_054_partial_01_0267_valid :
    mulPoly ep_Q2_054_coefficient_01_0267
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0268 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)]
]

/-- Partial product 268 for generator 1. -/
def ep_Q2_054_partial_01_0268 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 3)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 2)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 2)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 4)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 1. -/
theorem ep_Q2_054_partial_01_0268_valid :
    mulPoly ep_Q2_054_coefficient_01_0268
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0269 : Poly :=
[
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 269 for generator 1. -/
def ep_Q2_054_partial_01_0269 : Poly :=
[
  term ((-9151987500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1)],
  term ((4575993750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (12, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 1. -/
theorem ep_Q2_054_partial_01_0269_valid :
    mulPoly ep_Q2_054_coefficient_01_0269
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0270 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 270 for generator 1. -/
def ep_Q2_054_partial_01_0270 : Poly :=
[
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 1. -/
theorem ep_Q2_054_partial_01_0270_valid :
    mulPoly ep_Q2_054_coefficient_01_0270
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0271 : Poly :=
[
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 271 for generator 1. -/
def ep_Q2_054_partial_01_0271 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 3)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 3), (11, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 1. -/
theorem ep_Q2_054_partial_01_0271_valid :
    mulPoly ep_Q2_054_coefficient_01_0271
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0272 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 272 for generator 1. -/
def ep_Q2_054_partial_01_0272 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 3), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 1. -/
theorem ep_Q2_054_partial_01_0272_valid :
    mulPoly ep_Q2_054_coefficient_01_0272
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0273 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 273 for generator 1. -/
def ep_Q2_054_partial_01_0273 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 2)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 1. -/
theorem ep_Q2_054_partial_01_0273_valid :
    mulPoly ep_Q2_054_coefficient_01_0273
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0274 : Poly :=
[
  term ((13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 274 for generator 1. -/
def ep_Q2_054_partial_01_0274 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((27455962500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((13727981250 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((13727981250 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 1. -/
theorem ep_Q2_054_partial_01_0274_valid :
    mulPoly ep_Q2_054_coefficient_01_0274
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0275 : Poly :=
[
  term ((-4488761414646 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 275 for generator 1. -/
def ep_Q2_054_partial_01_0275 : Poly :=
[
  term ((8977522829292 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-8977522829292 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3)],
  term ((-4488761414646 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 1. -/
theorem ep_Q2_054_partial_01_0275_valid :
    mulPoly ep_Q2_054_coefficient_01_0275
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0276 : Poly :=
[
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 276 for generator 1. -/
def ep_Q2_054_partial_01_0276 : Poly :=
[
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 3), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 1. -/
theorem ep_Q2_054_partial_01_0276_valid :
    mulPoly ep_Q2_054_coefficient_01_0276
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0277 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 277 for generator 1. -/
def ep_Q2_054_partial_01_0277 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (12, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 1. -/
theorem ep_Q2_054_partial_01_0277_valid :
    mulPoly ep_Q2_054_coefficient_01_0277
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0278 : Poly :=
[
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 278 for generator 1. -/
def ep_Q2_054_partial_01_0278 : Poly :=
[
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (13, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 1. -/
theorem ep_Q2_054_partial_01_0278_valid :
    mulPoly ep_Q2_054_coefficient_01_0278
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0279 : Poly :=
[
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 1. -/
def ep_Q2_054_partial_01_0279 : Poly :=
[
  term ((48810600000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 1. -/
theorem ep_Q2_054_partial_01_0279_valid :
    mulPoly ep_Q2_054_coefficient_01_0279
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0280 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 280 for generator 1. -/
def ep_Q2_054_partial_01_0280 : Poly :=
[
  term ((12202650000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 1. -/
theorem ep_Q2_054_partial_01_0280_valid :
    mulPoly ep_Q2_054_coefficient_01_0280
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0281 : Poly :=
[
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 281 for generator 1. -/
def ep_Q2_054_partial_01_0281 : Poly :=
[
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (13, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 1. -/
theorem ep_Q2_054_partial_01_0281_valid :
    mulPoly ep_Q2_054_coefficient_01_0281
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0282 : Poly :=
[
  term ((-82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 282 for generator 1. -/
def ep_Q2_054_partial_01_0282 : Poly :=
[
  term ((164735775000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 1. -/
theorem ep_Q2_054_partial_01_0282_valid :
    mulPoly ep_Q2_054_coefficient_01_0282
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0283 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 283 for generator 1. -/
def ep_Q2_054_partial_01_0283 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 1. -/
theorem ep_Q2_054_partial_01_0283_valid :
    mulPoly ep_Q2_054_coefficient_01_0283
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0284 : Poly :=
[
  term ((41183943750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2)]
]

/-- Partial product 284 for generator 1. -/
def ep_Q2_054_partial_01_0284 : Poly :=
[
  term ((-82367887500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 2)],
  term ((82367887500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 2)],
  term ((82367887500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((-82367887500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((41183943750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 2)],
  term ((-41183943750 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 2)],
  term ((-41183943750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 4)],
  term ((41183943750 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 1. -/
theorem ep_Q2_054_partial_01_0284_valid :
    mulPoly ep_Q2_054_coefficient_01_0284
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0285 : Poly :=
[
  term ((-646808194503 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1)]
]

/-- Partial product 285 for generator 1. -/
def ep_Q2_054_partial_01_0285 : Poly :=
[
  term ((1293616389006 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-1293616389006 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1293616389006 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((1293616389006 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((-646808194503 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1)],
  term ((646808194503 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1)],
  term ((646808194503 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)],
  term ((-646808194503 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 1. -/
theorem ep_Q2_054_partial_01_0285_valid :
    mulPoly ep_Q2_054_coefficient_01_0285
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0286 : Poly :=
[
  term ((-15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 286 for generator 1. -/
def ep_Q2_054_partial_01_0286 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 1. -/
theorem ep_Q2_054_partial_01_0286_valid :
    mulPoly ep_Q2_054_coefficient_01_0286
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0287 : Poly :=
[
  term ((68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 287 for generator 1. -/
def ep_Q2_054_partial_01_0287 : Poly :=
[
  term ((-137279812500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((137279812500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((68639906250 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((68639906250 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 1. -/
theorem ep_Q2_054_partial_01_0287_valid :
    mulPoly ep_Q2_054_coefficient_01_0287
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0288 : Poly :=
[
  term ((30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 1. -/
def ep_Q2_054_partial_01_0288 : Poly :=
[
  term ((-61013250000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((61013250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((30506625000 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 1. -/
theorem ep_Q2_054_partial_01_0288_valid :
    mulPoly ep_Q2_054_coefficient_01_0288
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0289 : Poly :=
[
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 289 for generator 1. -/
def ep_Q2_054_partial_01_0289 : Poly :=
[
  term ((-48810600000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 1. -/
theorem ep_Q2_054_partial_01_0289_valid :
    mulPoly ep_Q2_054_coefficient_01_0289
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0290 : Poly :=
[
  term ((1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 290 for generator 1. -/
def ep_Q2_054_partial_01_0290 : Poly :=
[
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 3), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 3), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 1. -/
theorem ep_Q2_054_partial_01_0290_valid :
    mulPoly ep_Q2_054_coefficient_01_0290
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0291 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 291 for generator 1. -/
def ep_Q2_054_partial_01_0291 : Poly :=
[
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 1. -/
theorem ep_Q2_054_partial_01_0291_valid :
    mulPoly ep_Q2_054_coefficient_01_0291
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0292 : Poly :=
[
  term ((-1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 292 for generator 1. -/
def ep_Q2_054_partial_01_0292 : Poly :=
[
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2418172721280 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2)],
  term ((2418172721280 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (15, 2)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 1. -/
theorem ep_Q2_054_partial_01_0292_valid :
    mulPoly ep_Q2_054_coefficient_01_0292
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0293 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 293 for generator 1. -/
def ep_Q2_054_partial_01_0293 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 3), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 4), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 1. -/
theorem ep_Q2_054_partial_01_0293_valid :
    mulPoly ep_Q2_054_coefficient_01_0293
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0294 : Poly :=
[
  term ((-75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 294 for generator 1. -/
def ep_Q2_054_partial_01_0294 : Poly :=
[
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 1. -/
theorem ep_Q2_054_partial_01_0294_valid :
    mulPoly ep_Q2_054_coefficient_01_0294
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0295 : Poly :=
[
  term ((7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 295 for generator 1. -/
def ep_Q2_054_partial_01_0295 : Poly :=
[
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 1. -/
theorem ep_Q2_054_partial_01_0295_valid :
    mulPoly ep_Q2_054_coefficient_01_0295
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0296 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 296 for generator 1. -/
def ep_Q2_054_partial_01_0296 : Poly :=
[
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(3, 3), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 1. -/
theorem ep_Q2_054_partial_01_0296_valid :
    mulPoly ep_Q2_054_coefficient_01_0296
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0297 : Poly :=
[
  term ((1662493745880 : Rat) / 45033486517) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 297 for generator 1. -/
def ep_Q2_054_partial_01_0297 : Poly :=
[
  term ((-3324987491760 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((3324987491760 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3324987491760 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-3324987491760 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((1662493745880 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-1662493745880 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1662493745880 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((1662493745880 : Rat) / 45033486517) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 1. -/
theorem ep_Q2_054_partial_01_0297_valid :
    mulPoly ep_Q2_054_coefficient_01_0297
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0298 : Poly :=
[
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 298 for generator 1. -/
def ep_Q2_054_partial_01_0298 : Poly :=
[
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 3), (11, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 3), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 1. -/
theorem ep_Q2_054_partial_01_0298_valid :
    mulPoly ep_Q2_054_coefficient_01_0298
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0299 : Poly :=
[
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 299 for generator 1. -/
def ep_Q2_054_partial_01_0299 : Poly :=
[
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 3), (13, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 3), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 1. -/
theorem ep_Q2_054_partial_01_0299_valid :
    mulPoly ep_Q2_054_coefficient_01_0299
        ep_Q2_054_generator_01_0200_0299 =
      ep_Q2_054_partial_01_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_01_0200_0299 : List Poly :=
[
  ep_Q2_054_partial_01_0200,
  ep_Q2_054_partial_01_0201,
  ep_Q2_054_partial_01_0202,
  ep_Q2_054_partial_01_0203,
  ep_Q2_054_partial_01_0204,
  ep_Q2_054_partial_01_0205,
  ep_Q2_054_partial_01_0206,
  ep_Q2_054_partial_01_0207,
  ep_Q2_054_partial_01_0208,
  ep_Q2_054_partial_01_0209,
  ep_Q2_054_partial_01_0210,
  ep_Q2_054_partial_01_0211,
  ep_Q2_054_partial_01_0212,
  ep_Q2_054_partial_01_0213,
  ep_Q2_054_partial_01_0214,
  ep_Q2_054_partial_01_0215,
  ep_Q2_054_partial_01_0216,
  ep_Q2_054_partial_01_0217,
  ep_Q2_054_partial_01_0218,
  ep_Q2_054_partial_01_0219,
  ep_Q2_054_partial_01_0220,
  ep_Q2_054_partial_01_0221,
  ep_Q2_054_partial_01_0222,
  ep_Q2_054_partial_01_0223,
  ep_Q2_054_partial_01_0224,
  ep_Q2_054_partial_01_0225,
  ep_Q2_054_partial_01_0226,
  ep_Q2_054_partial_01_0227,
  ep_Q2_054_partial_01_0228,
  ep_Q2_054_partial_01_0229,
  ep_Q2_054_partial_01_0230,
  ep_Q2_054_partial_01_0231,
  ep_Q2_054_partial_01_0232,
  ep_Q2_054_partial_01_0233,
  ep_Q2_054_partial_01_0234,
  ep_Q2_054_partial_01_0235,
  ep_Q2_054_partial_01_0236,
  ep_Q2_054_partial_01_0237,
  ep_Q2_054_partial_01_0238,
  ep_Q2_054_partial_01_0239,
  ep_Q2_054_partial_01_0240,
  ep_Q2_054_partial_01_0241,
  ep_Q2_054_partial_01_0242,
  ep_Q2_054_partial_01_0243,
  ep_Q2_054_partial_01_0244,
  ep_Q2_054_partial_01_0245,
  ep_Q2_054_partial_01_0246,
  ep_Q2_054_partial_01_0247,
  ep_Q2_054_partial_01_0248,
  ep_Q2_054_partial_01_0249,
  ep_Q2_054_partial_01_0250,
  ep_Q2_054_partial_01_0251,
  ep_Q2_054_partial_01_0252,
  ep_Q2_054_partial_01_0253,
  ep_Q2_054_partial_01_0254,
  ep_Q2_054_partial_01_0255,
  ep_Q2_054_partial_01_0256,
  ep_Q2_054_partial_01_0257,
  ep_Q2_054_partial_01_0258,
  ep_Q2_054_partial_01_0259,
  ep_Q2_054_partial_01_0260,
  ep_Q2_054_partial_01_0261,
  ep_Q2_054_partial_01_0262,
  ep_Q2_054_partial_01_0263,
  ep_Q2_054_partial_01_0264,
  ep_Q2_054_partial_01_0265,
  ep_Q2_054_partial_01_0266,
  ep_Q2_054_partial_01_0267,
  ep_Q2_054_partial_01_0268,
  ep_Q2_054_partial_01_0269,
  ep_Q2_054_partial_01_0270,
  ep_Q2_054_partial_01_0271,
  ep_Q2_054_partial_01_0272,
  ep_Q2_054_partial_01_0273,
  ep_Q2_054_partial_01_0274,
  ep_Q2_054_partial_01_0275,
  ep_Q2_054_partial_01_0276,
  ep_Q2_054_partial_01_0277,
  ep_Q2_054_partial_01_0278,
  ep_Q2_054_partial_01_0279,
  ep_Q2_054_partial_01_0280,
  ep_Q2_054_partial_01_0281,
  ep_Q2_054_partial_01_0282,
  ep_Q2_054_partial_01_0283,
  ep_Q2_054_partial_01_0284,
  ep_Q2_054_partial_01_0285,
  ep_Q2_054_partial_01_0286,
  ep_Q2_054_partial_01_0287,
  ep_Q2_054_partial_01_0288,
  ep_Q2_054_partial_01_0289,
  ep_Q2_054_partial_01_0290,
  ep_Q2_054_partial_01_0291,
  ep_Q2_054_partial_01_0292,
  ep_Q2_054_partial_01_0293,
  ep_Q2_054_partial_01_0294,
  ep_Q2_054_partial_01_0295,
  ep_Q2_054_partial_01_0296,
  ep_Q2_054_partial_01_0297,
  ep_Q2_054_partial_01_0298,
  ep_Q2_054_partial_01_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_01_0200_0299 : Poly :=
[
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14875014080163 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (11, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-26077641797748 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((38202930779694 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((6170096552583 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41892184808781 : Rat) / 180133946068) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((-20403332335800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((54153981689547 : Rat) / 90066973034) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((14875014080163 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (11, 1)],
  term ((515943272403 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((26077641797748 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38202930779694 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-6170096552583 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((41892184808781 : Rat) / 180133946068) [(0, 1), (1, 1), (10, 1), (13, 1)],
  term ((20403332335800 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54153981689547 : Rat) / 90066973034) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1)],
  term ((1905021313488 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1), (8, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((-1905021313488 : Rat) / 45033486517) [(0, 1), (1, 2), (8, 1), (10, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (10, 1)],
  term ((635007104496 : Rat) / 45033486517) [(0, 1), (1, 2), (10, 1), (12, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((2316161312055 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1)],
  term ((9815318081316 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((18303975000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-9151987500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((48810600000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((164735775000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 2)],
  term ((1293616389006 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((30506625000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-3324987491760 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (2, 1), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(0, 1), (2, 1), (6, 1), (10, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((9064855106316 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((768766950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((10110979437048 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((170837100000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((12652452277560 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-17127188221230 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1827617815512 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 2), (15, 1)],
  term ((-134229150000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-12695406786720 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-8043991308213 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1)],
  term ((1575208645482 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2821201508160 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((1302360220275 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((1593060589474 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1302360220275 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48214293250082 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-4688496792990 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (12, 1), (16, 1)],
  term ((1041888176220 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12403430059266 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (15, 2)],
  term ((1174770151620 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 2), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 1), (2, 1), (10, 2), (16, 1)],
  term ((8043991308213 : Rat) / 90066973034) [(0, 1), (2, 2)],
  term ((-4806987178158 : Rat) / 45033486517) [(0, 1), (2, 2), (6, 1)],
  term ((109823850000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-9064855106316 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (9, 1), (12, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (10, 1), (15, 1)],
  term ((134229150000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10110979437048 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-170837100000 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((17127188221230 : Rat) / 45033486517) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (11, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((520944088110 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12403430059266 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (15, 2)],
  term ((-1174770151620 : Rat) / 45033486517) [(0, 1), (2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(0, 1), (2, 2), (10, 1), (16, 1)],
  term ((-1575208645482 : Rat) / 45033486517) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((2821201508160 : Rat) / 45033486517) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-1302360220275 : Rat) / 90066973034) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((1302360220275 : Rat) / 45033486517) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((48214293250082 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2)],
  term ((4688496792990 : Rat) / 45033486517) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(0, 1), (2, 2), (16, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (7, 1), (10, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (13, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(0, 1), (3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-9815318081316 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (8, 1), (10, 2)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((27455962500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-2316161312055 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((82367887500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (11, 2)],
  term ((-1293616389006 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((61013250000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-8977522829292 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2)],
  term ((-54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((24405300000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(0, 1), (3, 1), (7, 1), (10, 2), (16, 1)],
  term ((302271590160 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((3324987491760 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(0, 1), (3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(0, 1), (3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((8043991308213 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1)],
  term ((-4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-9064855106316 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (12, 1)],
  term ((1827617815512 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((134229150000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10110979437048 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-170837100000 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-12652452277560 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((17127188221230 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (8, 1), (15, 2)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1041888176220 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12403430059266 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (15, 2)],
  term ((-1174770151620 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (10, 1), (16, 1)],
  term ((-1575208645482 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((2821201508160 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1876874506790 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-312566452866 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (12, 1), (15, 2)],
  term ((-1302360220275 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-1593060589474 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1302360220275 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((48214293250082 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((4688496792990 : Rat) / 45033486517) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((4806987178158 : Rat) / 45033486517) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (8, 1), (11, 2)],
  term ((439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9064855106316 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((768766950000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-439295400000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1827617815512 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-134229150000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2559776815512 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((12652452277560 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-17127188221230 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((10110979437048 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2)],
  term ((170837100000 : Rat) / 45033486517) [(1, 1), (2, 1), (7, 1), (11, 2), (16, 1)],
  term ((604543180320 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 1), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (2, 1), (8, 1), (11, 2), (15, 1)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12695406786720 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 1), (9, 1), (11, 2), (15, 2)],
  term ((-520944088110 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1041888176220 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12403430059266 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2)],
  term ((1174770151620 : Rat) / 45033486517) [(1, 1), (2, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8043991308213 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1)],
  term ((1876874506790 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((312566452866 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((1302360220275 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((1593060589474 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1302360220275 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48214293250082 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-4688496792990 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 90066973034) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((1575208645482 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-2821201508160 : Rat) / 45033486517) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (10, 1), (15, 1), (16, 1)],
  term ((14875014080163 : Rat) / 180133946068) [(1, 1), (2, 2), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((13038820898874 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (13, 1), (15, 1)],
  term ((-19101465389847 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 1), (15, 2), (16, 1)],
  term ((6120999700740 : Rat) / 45033486517) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-6170096552583 : Rat) / 180133946068) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((41892184808781 : Rat) / 360267892136) [(1, 1), (2, 2), (13, 1)],
  term ((10201666167900 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-54153981689547 : Rat) / 180133946068) [(1, 1), (2, 2), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-38827572436728 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((30717321786144 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((-17009567950608 : Rat) / 45033486517) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-9815318081316 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((146431800000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 3)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 1), (11, 2)],
  term ((27455962500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 2)],
  term ((-8977522829292 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((24405300000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2316161312055 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-1293616389006 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((137279812500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((61013250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((-164735775000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((82367887500 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((3324987491760 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2418172721280 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 3), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((38827572436728 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (7, 1)],
  term ((-30717321786144 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((17009567950608 : Rat) / 45033486517) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((2316161312055 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1)],
  term ((9815318081316 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((219647700000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (10, 1)],
  term ((18303975000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-146431800000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (11, 2)],
  term ((-9151987500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (12, 1)],
  term ((109823850000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (9, 1), (13, 1)],
  term ((8977522829292 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1)],
  term ((54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((48810600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (10, 1), (16, 1)],
  term ((9151987500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((164735775000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((1293616389006 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((30506625000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-137279812500 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-61013250000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48810600000 : Rat) / 45033486517) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (10, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2418172721280 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (11, 2), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (12, 1), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (13, 1), (15, 2)],
  term ((-3324987491760 : Rat) / 45033486517) [(1, 1), (3, 2), (8, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 90066973034) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (10, 1), (15, 1), (16, 1)],
  term ((14875014080163 : Rat) / 180133946068) [(1, 1), (3, 2), (11, 1)],
  term ((515943272403 : Rat) / 90066973034) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((13038820898874 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1)],
  term ((-19101465389847 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((906814770480 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((6120999700740 : Rat) / 45033486517) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-6170096552583 : Rat) / 180133946068) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-2267036926200 : Rat) / 45033486517) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((41892184808781 : Rat) / 360267892136) [(1, 1), (3, 2), (13, 1)],
  term ((10201666167900 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-54153981689547 : Rat) / 180133946068) [(1, 1), (3, 2), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14875014080163 : Rat) / 180133946068) [(1, 1), (10, 2), (11, 1)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (10, 2), (11, 1), (12, 1)],
  term ((-13038820898874 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((19101465389847 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-6120999700740 : Rat) / 45033486517) [(1, 1), (10, 2), (11, 2), (15, 1)],
  term ((6170096552583 : Rat) / 180133946068) [(1, 1), (10, 2), (12, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41892184808781 : Rat) / 360267892136) [(1, 1), (10, 2), (13, 1)],
  term ((-10201666167900 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((54153981689547 : Rat) / 180133946068) [(1, 1), (10, 2), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(1, 1), (10, 3), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 90066973034) [(1, 1), (10, 3), (15, 1)],
  term ((1360222155720 : Rat) / 45033486517) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((6170096552583 : Rat) / 180133946068) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((2267036926200 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41892184808781 : Rat) / 360267892136) [(1, 1), (11, 2), (13, 1)],
  term ((-10201666167900 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((54153981689547 : Rat) / 180133946068) [(1, 1), (11, 2), (15, 1)],
  term ((-1360222155720 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-14875014080163 : Rat) / 180133946068) [(1, 1), (11, 3)],
  term ((-515943272403 : Rat) / 90066973034) [(1, 1), (11, 3), (12, 1)],
  term ((-13038820898874 : Rat) / 45033486517) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((19101465389847 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(1, 1), (11, 3), (15, 2), (16, 1)],
  term ((-6120999700740 : Rat) / 45033486517) [(1, 1), (11, 4), (15, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (2, 2)],
  term ((-952510656744 : Rat) / 45033486517) [(1, 2), (2, 2), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (2, 2), (12, 1)],
  term ((7254518163840 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31891289877147 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-14875014080163 : Rat) / 90066973034) [(1, 2), (3, 1), (11, 1)],
  term ((-515943272403 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-26077641797748 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((38202930779694 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-1813629540960 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12241999401480 : Rat) / 45033486517) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((6170096552583 : Rat) / 90066973034) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41892184808781 : Rat) / 180133946068) [(1, 2), (3, 1), (13, 1)],
  term ((-20403332335800 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-9068147704800 : Rat) / 45033486517) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((54153981689547 : Rat) / 90066973034) [(1, 2), (3, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (3, 2)],
  term ((-952510656744 : Rat) / 45033486517) [(1, 2), (3, 2), (8, 1)],
  term ((317503552248 : Rat) / 45033486517) [(1, 2), (3, 2), (12, 1)],
  term ((952510656744 : Rat) / 45033486517) [(1, 2), (8, 1), (10, 2)],
  term ((952510656744 : Rat) / 45033486517) [(1, 2), (8, 1), (11, 2)],
  term ((-7254518163840 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((31891289877147 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-2720444311440 : Rat) / 45033486517) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (10, 2)],
  term ((-317503552248 : Rat) / 45033486517) [(1, 2), (10, 2), (12, 1)],
  term ((-6170096552583 : Rat) / 90066973034) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((41892184808781 : Rat) / 180133946068) [(1, 2), (11, 1), (13, 1)],
  term ((20403332335800 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((9068147704800 : Rat) / 45033486517) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54153981689547 : Rat) / 90066973034) [(1, 2), (11, 1), (15, 1)],
  term ((2720444311440 : Rat) / 45033486517) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((14240006975667 : Rat) / 90066973034) [(1, 2), (11, 2)],
  term ((198439720155 : Rat) / 45033486517) [(1, 2), (11, 2), (12, 1)],
  term ((26077641797748 : Rat) / 45033486517) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38202930779694 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2)],
  term ((1813629540960 : Rat) / 45033486517) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((12241999401480 : Rat) / 45033486517) [(1, 2), (11, 3), (15, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 3), (3, 1)],
  term ((1905021313488 : Rat) / 45033486517) [(1, 3), (3, 1), (8, 1)],
  term ((-635007104496 : Rat) / 45033486517) [(1, 3), (3, 1), (12, 1)],
  term ((-1905021313488 : Rat) / 45033486517) [(1, 3), (8, 1), (11, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (11, 1)],
  term ((635007104496 : Rat) / 45033486517) [(1, 3), (11, 1), (12, 1)],
  term ((-8043991308213 : Rat) / 180133946068) [(2, 1), (3, 2)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 1), (3, 2), (6, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (11, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (8, 1), (15, 1)],
  term ((4532427553158 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (9, 1), (12, 1)],
  term ((-913808907756 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (10, 1), (15, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((5055489718524 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((85418550000 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (13, 1)],
  term ((-8563594110615 : Rat) / 45033486517) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (11, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 1), (3, 2), (8, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (15, 2)],
  term ((587385075810 : Rat) / 45033486517) [(2, 1), (3, 2), (10, 1), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (3, 2), (10, 1), (16, 1)],
  term ((787604322741 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-1410600754080 : Rat) / 45033486517) [(2, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 1), (3, 2), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(2, 1), (3, 2), (12, 1), (15, 2)],
  term ((1302360220275 : Rat) / 180133946068) [(2, 1), (3, 2), (12, 1), (16, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(2, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24107146625041 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2)],
  term ((-2344248396495 : Rat) / 45033486517) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (3, 2), (16, 1)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (10, 2)],
  term ((-2403493589079 : Rat) / 45033486517) [(2, 1), (6, 1), (11, 2)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (11, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((54911925000 : Rat) / 45033486517) [(2, 1), (7, 1), (8, 1), (11, 3)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-4532427553158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 2), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (10, 3), (12, 1)],
  term ((-4532427553158 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2)],
  term ((-384383475000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 2), (12, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (13, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 1), (7, 1), (9, 1), (11, 3), (15, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5055489718524 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1)],
  term ((-85418550000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (13, 1)],
  term ((8563594110615 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 2), (15, 1)],
  term ((913808907756 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 3), (15, 1)],
  term ((67114575000 : Rat) / 45033486517) [(2, 1), (7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-1279888407756 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6326226138780 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (13, 1)],
  term ((8563594110615 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-5055489718524 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3)],
  term ((-85418550000 : Rat) / 45033486517) [(2, 1), (7, 1), (11, 3), (16, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (10, 2), (15, 2)],
  term ((-302271590160 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((604543180320 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 2), (15, 2)],
  term ((-906814770480 : Rat) / 45033486517) [(2, 1), (8, 1), (11, 3), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((6347703393360 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (13, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 2), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (10, 3), (12, 1), (15, 1)],
  term ((6347703393360 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-4534073852400 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (13, 1), (15, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 1), (9, 1), (11, 3), (15, 2)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (15, 2)],
  term ((-587385075810 : Rat) / 45033486517) [(2, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((8043991308213 : Rat) / 180133946068) [(2, 1), (10, 2)],
  term ((-787604322741 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((1410600754080 : Rat) / 45033486517) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 1), (10, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 1), (10, 2), (12, 1), (15, 2)],
  term ((-1302360220275 : Rat) / 180133946068) [(2, 1), (10, 2), (12, 1), (16, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((1302360220275 : Rat) / 90066973034) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((24107146625041 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2)],
  term ((2344248396495 : Rat) / 45033486517) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (10, 2), (16, 1)],
  term ((260472044055 : Rat) / 45033486517) [(2, 1), (10, 3), (12, 1), (16, 1)],
  term ((-520944088110 : Rat) / 45033486517) [(2, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((6201715029633 : Rat) / 45033486517) [(2, 1), (10, 3), (15, 2)],
  term ((-587385075810 : Rat) / 45033486517) [(2, 1), (10, 3), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 1), (10, 3), (16, 1)],
  term ((8043991308213 : Rat) / 180133946068) [(2, 1), (11, 2)],
  term ((-938437253395 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1)],
  term ((-156283226433 : Rat) / 45033486517) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1302360220275 : Rat) / 180133946068) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-796530294737 : Rat) / 45033486517) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((1302360220275 : Rat) / 90066973034) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24107146625041 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2)],
  term ((2344248396495 : Rat) / 45033486517) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 1), (11, 2), (16, 1)],
  term ((-787604322741 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1)],
  term ((1410600754080 : Rat) / 45033486517) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-2316161312055 : Rat) / 90066973034) [(2, 2), (3, 1), (7, 1)],
  term ((-4907659040658 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (10, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (11, 2)],
  term ((4575993750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((13727981250 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((27455962500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((41183943750 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (11, 2)],
  term ((-646808194503 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((68639906250 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(2, 2), (3, 1), (7, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (13, 1), (15, 2)],
  term ((1662493745880 : Rat) / 45033486517) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(2, 2), (3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-8043991308213 : Rat) / 180133946068) [(2, 3)],
  term ((2403493589079 : Rat) / 45033486517) [(2, 3), (6, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (11, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (13, 1)],
  term ((36607950000 : Rat) / 45033486517) [(2, 3), (7, 1), (8, 1), (15, 1)],
  term ((4532427553158 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1)],
  term ((219647700000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((-219647700000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((109823850000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((384383475000 : Rat) / 45033486517) [(2, 3), (7, 1), (9, 1), (12, 1)],
  term ((-913808907756 : Rat) / 45033486517) [(2, 3), (7, 1), (10, 1), (15, 1)],
  term ((-67114575000 : Rat) / 45033486517) [(2, 3), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((5055489718524 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1)],
  term ((85418550000 : Rat) / 45033486517) [(2, 3), (7, 1), (11, 1), (16, 1)],
  term ((1279888407756 : Rat) / 45033486517) [(2, 3), (7, 1), (12, 1), (15, 1)],
  term ((6326226138780 : Rat) / 45033486517) [(2, 3), (7, 1), (13, 1)],
  term ((-8563594110615 : Rat) / 45033486517) [(2, 3), (7, 1), (15, 1)],
  term ((906814770480 : Rat) / 45033486517) [(2, 3), (8, 1), (11, 1), (15, 1)],
  term ((302271590160 : Rat) / 45033486517) [(2, 3), (8, 1), (13, 1), (15, 1)],
  term ((-604543180320 : Rat) / 45033486517) [(2, 3), (8, 1), (15, 2)],
  term ((-3627259081920 : Rat) / 45033486517) [(2, 3), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3627259081920 : Rat) / 45033486517) [(2, 3), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(2, 3), (9, 1), (11, 1), (15, 2)],
  term ((-6347703393360 : Rat) / 45033486517) [(2, 3), (9, 1), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(2, 3), (9, 1), (13, 1)],
  term ((4534073852400 : Rat) / 45033486517) [(2, 3), (9, 1), (15, 1)],
  term ((-260472044055 : Rat) / 45033486517) [(2, 3), (10, 1), (12, 1), (16, 1)],
  term ((520944088110 : Rat) / 45033486517) [(2, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6201715029633 : Rat) / 45033486517) [(2, 3), (10, 1), (15, 2)],
  term ((587385075810 : Rat) / 45033486517) [(2, 3), (10, 1), (15, 2), (16, 1)],
  term ((781416132165 : Rat) / 180133946068) [(2, 3), (10, 1), (16, 1)],
  term ((787604322741 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1)],
  term ((-1410600754080 : Rat) / 45033486517) [(2, 3), (11, 1), (15, 1), (16, 1)],
  term ((938437253395 : Rat) / 45033486517) [(2, 3), (12, 1)],
  term ((156283226433 : Rat) / 45033486517) [(2, 3), (12, 1), (15, 2)],
  term ((1302360220275 : Rat) / 180133946068) [(2, 3), (12, 1), (16, 1)],
  term ((796530294737 : Rat) / 45033486517) [(2, 3), (13, 1), (15, 1)],
  term ((-1302360220275 : Rat) / 90066973034) [(2, 3), (13, 1), (15, 1), (16, 1)],
  term ((-24107146625041 : Rat) / 45033486517) [(2, 3), (15, 2)],
  term ((-2344248396495 : Rat) / 45033486517) [(2, 3), (15, 2), (16, 1)],
  term ((-781416132165 : Rat) / 180133946068) [(2, 3), (16, 1)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((19413786218364 : Rat) / 45033486517) [(3, 1), (6, 1), (7, 1), (11, 2)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((-15358660893072 : Rat) / 45033486517) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((8504783975304 : Rat) / 45033486517) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 1), (11, 2)],
  term ((4907659040658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (11, 2)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (12, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((109823850000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (10, 3)],
  term ((4907659040658 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (12, 1)],
  term ((54911925000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((9151987500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (13, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 3), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (8, 1), (11, 4)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 3)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((-13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 2), (13, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 3), (11, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (10, 3), (13, 1)],
  term ((-13727981250 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 2), (13, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 1), (7, 1), (9, 1), (11, 3)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 1), (11, 3), (15, 1)],
  term ((2316161312055 : Rat) / 90066973034) [(3, 1), (7, 1), (10, 2)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41183943750 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (11, 2)],
  term ((646808194503 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (12, 1), (16, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 2), (16, 1)],
  term ((4488761414646 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3)],
  term ((27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (11, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (12, 1), (16, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (13, 1), (15, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (10, 3), (16, 1)],
  term ((2316161312055 : Rat) / 90066973034) [(3, 1), (7, 1), (11, 2)],
  term ((646808194503 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1)],
  term ((15253312500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-68639906250 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-30506625000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 2), (16, 1)],
  term ((4575993750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (13, 1)],
  term ((82367887500 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-41183943750 : Rat) / 45033486517) [(3, 1), (7, 1), (11, 4)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (11, 2), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((-1662493745880 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1813629540960 : Rat) / 45033486517) [(3, 1), (8, 1), (10, 3), (15, 1)],
  term ((75567897540 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7679330446536 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((-906814770480 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1662493745880 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-151135795080 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((1209086360640 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 3), (15, 2)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (8, 1), (11, 4), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 3), (11, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 1), (9, 1), (10, 3), (13, 1), (15, 1)],
  term ((-19413786218364 : Rat) / 45033486517) [(3, 3), (6, 1), (7, 1)],
  term ((15358660893072 : Rat) / 45033486517) [(3, 3), (6, 1), (13, 1)],
  term ((-8504783975304 : Rat) / 45033486517) [(3, 3), (6, 1), (15, 1)],
  term ((-2316161312055 : Rat) / 90066973034) [(3, 3), (7, 1)],
  term ((-4907659040658 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1)],
  term ((-109823850000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (10, 1)],
  term ((-9151987500 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((73215900000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (11, 2)],
  term ((4575993750 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (12, 1)],
  term ((-54911925000 : Rat) / 45033486517) [(3, 3), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (11, 1)],
  term ((13727981250 : Rat) / 45033486517) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((-4488761414646 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1)],
  term ((-27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((12202650000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((27455962500 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-24405300000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6101325000 : Rat) / 45033486517) [(3, 3), (7, 1), (10, 1), (16, 1)],
  term ((-4575993750 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (13, 1)],
  term ((-82367887500 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((41183943750 : Rat) / 45033486517) [(3, 3), (7, 1), (11, 2)],
  term ((-646808194503 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1)],
  term ((-15253312500 : Rat) / 45033486517) [(3, 3), (7, 1), (12, 1), (16, 1)],
  term ((68639906250 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1)],
  term ((30506625000 : Rat) / 45033486517) [(3, 3), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24405300000 : Rat) / 45033486517) [(3, 3), (7, 1), (16, 1)],
  term ((1813629540960 : Rat) / 45033486517) [(3, 3), (8, 1), (10, 1), (15, 1)],
  term ((151135795080 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1209086360640 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 1), (15, 2)],
  term ((453407385240 : Rat) / 45033486517) [(3, 3), (8, 1), (11, 2), (15, 1)],
  term ((-75567897540 : Rat) / 45033486517) [(3, 3), (8, 1), (12, 1), (15, 1)],
  term ((7679330446536 : Rat) / 45033486517) [(3, 3), (8, 1), (13, 1)],
  term ((906814770480 : Rat) / 45033486517) [(3, 3), (8, 1), (13, 1), (15, 2)],
  term ((1662493745880 : Rat) / 45033486517) [(3, 3), (8, 1), (15, 1)],
  term ((-453407385240 : Rat) / 45033486517) [(3, 3), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((453407385240 : Rat) / 45033486517) [(3, 3), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 200 through 299. -/
theorem ep_Q2_054_block_01_0200_0299_valid :
    checkProductSumEq ep_Q2_054_partials_01_0200_0299
      ep_Q2_054_block_01_0200_0299 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
