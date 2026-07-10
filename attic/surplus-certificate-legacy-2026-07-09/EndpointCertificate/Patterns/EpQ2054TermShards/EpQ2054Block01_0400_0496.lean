/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 1:400-496

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_01_0400_0496 : Poly :=
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

/-- Coefficient term 400 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0400 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 1. -/
def ep_Q2_054_partial_01_0400 : Poly :=
[
  term ((-410136305154 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-410136305154 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 1. -/
theorem ep_Q2_054_partial_01_0400_valid :
    mulPoly ep_Q2_054_coefficient_01_0400
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0401 : Poly :=
[
  term ((8339643840051 : Rat) / 180133946068) [(7, 1), (11, 1)]
]

/-- Partial product 401 for generator 1. -/
def ep_Q2_054_partial_01_0401 : Poly :=
[
  term ((-8339643840051 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((8339643840051 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-8339643840051 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((8339643840051 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((8339643840051 : Rat) / 180133946068) [(2, 2), (7, 1), (11, 1)],
  term ((8339643840051 : Rat) / 180133946068) [(3, 2), (7, 1), (11, 1)],
  term ((-8339643840051 : Rat) / 180133946068) [(7, 1), (10, 2), (11, 1)],
  term ((-8339643840051 : Rat) / 180133946068) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 1. -/
theorem ep_Q2_054_partial_01_0401_valid :
    mulPoly ep_Q2_054_coefficient_01_0401
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0402 : Poly :=
[
  term ((2052455979501 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 402 for generator 1. -/
def ep_Q2_054_partial_01_0402 : Poly :=
[
  term ((-2052455979501 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((2052455979501 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2052455979501 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((2052455979501 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((2052455979501 : Rat) / 90066973034) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((2052455979501 : Rat) / 90066973034) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-2052455979501 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-2052455979501 : Rat) / 90066973034) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 1. -/
theorem ep_Q2_054_partial_01_0402_valid :
    mulPoly ep_Q2_054_coefficient_01_0402
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0403 : Poly :=
[
  term ((82433994683382 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 403 for generator 1. -/
def ep_Q2_054_partial_01_0403 : Poly :=
[
  term ((-164867989366764 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((164867989366764 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-164867989366764 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((164867989366764 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((82433994683382 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((82433994683382 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-82433994683382 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-82433994683382 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 1. -/
theorem ep_Q2_054_partial_01_0403_valid :
    mulPoly ep_Q2_054_coefficient_01_0403
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0404 : Poly :=
[
  term ((-1457467496037 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 404 for generator 1. -/
def ep_Q2_054_partial_01_0404 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2)],
  term ((2914934992074 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (15, 2)],
  term ((-1457467496037 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-1457467496037 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 1. -/
theorem ep_Q2_054_partial_01_0404_valid :
    mulPoly ep_Q2_054_coefficient_01_0404
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0405 : Poly :=
[
  term ((-621305782731 : Rat) / 90066973034) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 405 for generator 1. -/
def ep_Q2_054_partial_01_0405 : Poly :=
[
  term ((621305782731 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-621305782731 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((621305782731 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-621305782731 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-621305782731 : Rat) / 90066973034) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-621305782731 : Rat) / 90066973034) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((621305782731 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((621305782731 : Rat) / 90066973034) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 1. -/
theorem ep_Q2_054_partial_01_0405_valid :
    mulPoly ep_Q2_054_coefficient_01_0405
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0406 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 406 for generator 1. -/
def ep_Q2_054_partial_01_0406 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((933502725000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 1. -/
theorem ep_Q2_054_partial_01_0406_valid :
    mulPoly ep_Q2_054_coefficient_01_0406
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0407 : Poly :=
[
  term ((-20443448739699 : Rat) / 180133946068) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 407 for generator 1. -/
def ep_Q2_054_partial_01_0407 : Poly :=
[
  term ((20443448739699 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-20443448739699 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((20443448739699 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-20443448739699 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20443448739699 : Rat) / 180133946068) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-20443448739699 : Rat) / 180133946068) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((20443448739699 : Rat) / 180133946068) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((20443448739699 : Rat) / 180133946068) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 1. -/
theorem ep_Q2_054_partial_01_0407_valid :
    mulPoly ep_Q2_054_coefficient_01_0407
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0408 : Poly :=
[
  term ((87100421001741 : Rat) / 360267892136) [(7, 1), (13, 1)]
]

/-- Partial product 408 for generator 1. -/
def ep_Q2_054_partial_01_0408 : Poly :=
[
  term ((-87100421001741 : Rat) / 180133946068) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((87100421001741 : Rat) / 180133946068) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-87100421001741 : Rat) / 180133946068) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((87100421001741 : Rat) / 180133946068) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((87100421001741 : Rat) / 360267892136) [(2, 2), (7, 1), (13, 1)],
  term ((87100421001741 : Rat) / 360267892136) [(3, 2), (7, 1), (13, 1)],
  term ((-87100421001741 : Rat) / 360267892136) [(7, 1), (10, 2), (13, 1)],
  term ((-87100421001741 : Rat) / 360267892136) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 1. -/
theorem ep_Q2_054_partial_01_0408_valid :
    mulPoly ep_Q2_054_coefficient_01_0408
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0409 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 409 for generator 1. -/
def ep_Q2_054_partial_01_0409 : Poly :=
[
  term ((159038119382616 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((159038119382616 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-79519059691308 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 1. -/
theorem ep_Q2_054_partial_01_0409_valid :
    mulPoly ep_Q2_054_coefficient_01_0409
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0410 : Poly :=
[
  term ((-55250710078701 : Rat) / 180133946068) [(7, 1), (15, 1)]
]

/-- Partial product 410 for generator 1. -/
def ep_Q2_054_partial_01_0410 : Poly :=
[
  term ((55250710078701 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-55250710078701 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((55250710078701 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-55250710078701 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-55250710078701 : Rat) / 180133946068) [(2, 2), (7, 1), (15, 1)],
  term ((-55250710078701 : Rat) / 180133946068) [(3, 2), (7, 1), (15, 1)],
  term ((55250710078701 : Rat) / 180133946068) [(7, 1), (10, 2), (15, 1)],
  term ((55250710078701 : Rat) / 180133946068) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 1. -/
theorem ep_Q2_054_partial_01_0410_valid :
    mulPoly ep_Q2_054_coefficient_01_0410
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0411 : Poly :=
[
  term ((-1123698624087 : Rat) / 45033486517) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 1. -/
def ep_Q2_054_partial_01_0411 : Poly :=
[
  term ((2247397248174 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 1. -/
theorem ep_Q2_054_partial_01_0411_valid :
    mulPoly ep_Q2_054_coefficient_01_0411
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0412 : Poly :=
[
  term ((3508535951397 : Rat) / 180133946068) [(7, 2)]
]

/-- Partial product 412 for generator 1. -/
def ep_Q2_054_partial_01_0412 : Poly :=
[
  term ((-3508535951397 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2)],
  term ((3508535951397 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 1)],
  term ((-3508535951397 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2)],
  term ((3508535951397 : Rat) / 90066973034) [(1, 1), (7, 2), (11, 1)],
  term ((3508535951397 : Rat) / 180133946068) [(2, 2), (7, 2)],
  term ((3508535951397 : Rat) / 180133946068) [(3, 2), (7, 2)],
  term ((-3508535951397 : Rat) / 180133946068) [(7, 2), (10, 2)],
  term ((-3508535951397 : Rat) / 180133946068) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 1. -/
theorem ep_Q2_054_partial_01_0412_valid :
    mulPoly ep_Q2_054_coefficient_01_0412
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0413 : Poly :=
[
  term ((-827016877386 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 413 for generator 1. -/
def ep_Q2_054_partial_01_0413 : Poly :=
[
  term ((1654033754772 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1)],
  term ((-1654033754772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((1654033754772 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((-1654033754772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1)],
  term ((-827016877386 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1)],
  term ((-827016877386 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1)],
  term ((827016877386 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((827016877386 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 1. -/
theorem ep_Q2_054_partial_01_0413_valid :
    mulPoly ep_Q2_054_coefficient_01_0413
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0414 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 414 for generator 1. -/
def ep_Q2_054_partial_01_0414 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 1. -/
theorem ep_Q2_054_partial_01_0414_valid :
    mulPoly ep_Q2_054_coefficient_01_0414
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0415 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 415 for generator 1. -/
def ep_Q2_054_partial_01_0415 : Poly :=
[
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 1. -/
theorem ep_Q2_054_partial_01_0415_valid :
    mulPoly ep_Q2_054_coefficient_01_0415
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0416 : Poly :=
[
  term ((18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (16, 1)]
]

/-- Partial product 416 for generator 1. -/
def ep_Q2_054_partial_01_0416 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 1. -/
theorem ep_Q2_054_partial_01_0416_valid :
    mulPoly ep_Q2_054_coefficient_01_0416
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0417 : Poly :=
[
  term ((91339512975 : Rat) / 180133946068) [(7, 2), (10, 1)]
]

/-- Partial product 417 for generator 1. -/
def ep_Q2_054_partial_01_0417 : Poly :=
[
  term ((-91339512975 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((91339512975 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 2)],
  term ((-91339512975 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((91339512975 : Rat) / 90066973034) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((91339512975 : Rat) / 180133946068) [(2, 2), (7, 2), (10, 1)],
  term ((91339512975 : Rat) / 180133946068) [(3, 2), (7, 2), (10, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(7, 2), (10, 1), (11, 2)],
  term ((-91339512975 : Rat) / 180133946068) [(7, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 1. -/
theorem ep_Q2_054_partial_01_0417_valid :
    mulPoly ep_Q2_054_coefficient_01_0417
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0418 : Poly :=
[
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1)]
]

/-- Partial product 418 for generator 1. -/
def ep_Q2_054_partial_01_0418 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (10, 1), (12, 1)],
  term ((-60893008650 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 2), (12, 1)],
  term ((60893008650 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (10, 1), (12, 1)],
  term ((-60893008650 : Rat) / 45033486517) [(1, 1), (7, 2), (10, 1), (11, 1), (12, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(2, 2), (7, 2), (10, 1), (12, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(3, 2), (7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 1. -/
theorem ep_Q2_054_partial_01_0418_valid :
    mulPoly ep_Q2_054_coefficient_01_0418
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0419 : Poly :=
[
  term ((559401136785 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 419 for generator 1. -/
def ep_Q2_054_partial_01_0419 : Poly :=
[
  term ((-1118802273570 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (11, 1), (13, 1)],
  term ((1118802273570 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-1118802273570 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (11, 1), (13, 1)],
  term ((1118802273570 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (13, 1)],
  term ((559401136785 : Rat) / 45033486517) [(2, 2), (7, 2), (11, 1), (13, 1)],
  term ((559401136785 : Rat) / 45033486517) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((-559401136785 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-559401136785 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 1. -/
theorem ep_Q2_054_partial_01_0419_valid :
    mulPoly ep_Q2_054_coefficient_01_0419
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0420 : Poly :=
[
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 420 for generator 1. -/
def ep_Q2_054_partial_01_0420 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (15, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 1. -/
theorem ep_Q2_054_partial_01_0420_valid :
    mulPoly ep_Q2_054_coefficient_01_0420
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0421 : Poly :=
[
  term ((903056220675 : Rat) / 180133946068) [(7, 2), (12, 1)]
]

/-- Partial product 421 for generator 1. -/
def ep_Q2_054_partial_01_0421 : Poly :=
[
  term ((-903056220675 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term ((903056220675 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((-903056220675 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((903056220675 : Rat) / 90066973034) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((903056220675 : Rat) / 180133946068) [(2, 2), (7, 2), (12, 1)],
  term ((903056220675 : Rat) / 180133946068) [(3, 2), (7, 2), (12, 1)],
  term ((-903056220675 : Rat) / 180133946068) [(7, 2), (10, 2), (12, 1)],
  term ((-903056220675 : Rat) / 180133946068) [(7, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 1. -/
theorem ep_Q2_054_partial_01_0421_valid :
    mulPoly ep_Q2_054_coefficient_01_0421
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0422 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 422 for generator 1. -/
def ep_Q2_054_partial_01_0422 : Poly :=
[
  term ((1057909264920 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 1. -/
theorem ep_Q2_054_partial_01_0422_valid :
    mulPoly ep_Q2_054_coefficient_01_0422
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0423 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (16, 1)]
]

/-- Partial product 423 for generator 1. -/
def ep_Q2_054_partial_01_0423 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (7, 2), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (7, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (10, 2), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 1. -/
theorem ep_Q2_054_partial_01_0423_valid :
    mulPoly ep_Q2_054_coefficient_01_0423
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0424 : Poly :=
[
  term ((6713587775319 : Rat) / 90066973034) [(8, 1)]
]

/-- Partial product 424 for generator 1. -/
def ep_Q2_054_partial_01_0424 : Poly :=
[
  term ((-6713587775319 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((6713587775319 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1)],
  term ((-6713587775319 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1)],
  term ((6713587775319 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((6713587775319 : Rat) / 90066973034) [(2, 2), (8, 1)],
  term ((6713587775319 : Rat) / 90066973034) [(3, 2), (8, 1)],
  term ((-6713587775319 : Rat) / 90066973034) [(8, 1), (10, 2)],
  term ((-6713587775319 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 1. -/
theorem ep_Q2_054_partial_01_0424_valid :
    mulPoly ep_Q2_054_coefficient_01_0424
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0425 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 425 for generator 1. -/
def ep_Q2_054_partial_01_0425 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (11, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 3)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 1. -/
theorem ep_Q2_054_partial_01_0425_valid :
    mulPoly ep_Q2_054_coefficient_01_0425
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0426 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 426 for generator 1. -/
def ep_Q2_054_partial_01_0426 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 1. -/
theorem ep_Q2_054_partial_01_0426_valid :
    mulPoly ep_Q2_054_coefficient_01_0426
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0427 : Poly :=
[
  term ((-272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 427 for generator 1. -/
def ep_Q2_054_partial_01_0427 : Poly :=
[
  term ((544942043676 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-544942043676 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((544942043676 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-544942043676 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 1. -/
theorem ep_Q2_054_partial_01_0427_valid :
    mulPoly ep_Q2_054_coefficient_01_0427
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0428 : Poly :=
[
  term ((506198322402 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 428 for generator 1. -/
def ep_Q2_054_partial_01_0428 : Poly :=
[
  term ((-1012396644804 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((1012396644804 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1012396644804 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((1012396644804 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((506198322402 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((506198322402 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-506198322402 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-506198322402 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 1. -/
theorem ep_Q2_054_partial_01_0428_valid :
    mulPoly ep_Q2_054_coefficient_01_0428
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0429 : Poly :=
[
  term ((571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 429 for generator 1. -/
def ep_Q2_054_partial_01_0429 : Poly :=
[
  term ((-1143126977832 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1143126977832 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1143126977832 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((1143126977832 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((571563488916 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 1. -/
theorem ep_Q2_054_partial_01_0429_valid :
    mulPoly ep_Q2_054_coefficient_01_0429
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0430 : Poly :=
[
  term ((-756711556203 : Rat) / 90066973034) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 430 for generator 1. -/
def ep_Q2_054_partial_01_0430 : Poly :=
[
  term ((756711556203 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1)],
  term ((-756711556203 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((756711556203 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term ((-756711556203 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-756711556203 : Rat) / 90066973034) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-756711556203 : Rat) / 90066973034) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((756711556203 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((756711556203 : Rat) / 90066973034) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 1. -/
theorem ep_Q2_054_partial_01_0430_valid :
    mulPoly ep_Q2_054_coefficient_01_0430
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0431 : Poly :=
[
  term ((627322886004 : Rat) / 45033486517) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 431 for generator 1. -/
def ep_Q2_054_partial_01_0431 : Poly :=
[
  term ((-1254645772008 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((1254645772008 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1254645772008 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((1254645772008 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((627322886004 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((627322886004 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-627322886004 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-627322886004 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 1. -/
theorem ep_Q2_054_partial_01_0431_valid :
    mulPoly ep_Q2_054_coefficient_01_0431
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0432 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 432 for generator 1. -/
def ep_Q2_054_partial_01_0432 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 1. -/
theorem ep_Q2_054_partial_01_0432_valid :
    mulPoly ep_Q2_054_coefficient_01_0432
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0433 : Poly :=
[
  term ((100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 433 for generator 1. -/
def ep_Q2_054_partial_01_0433 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((100579066131 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 1. -/
theorem ep_Q2_054_partial_01_0433_valid :
    mulPoly ep_Q2_054_coefficient_01_0433
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0434 : Poly :=
[
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 434 for generator 1. -/
def ep_Q2_054_partial_01_0434 : Poly :=
[
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 1. -/
theorem ep_Q2_054_partial_01_0434_valid :
    mulPoly ep_Q2_054_coefficient_01_0434
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0435 : Poly :=
[
  term ((-201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 1. -/
def ep_Q2_054_partial_01_0435 : Poly :=
[
  term ((402316264524 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((402316264524 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 1. -/
theorem ep_Q2_054_partial_01_0435_valid :
    mulPoly ep_Q2_054_coefficient_01_0435
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0436 : Poly :=
[
  term ((9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 436 for generator 1. -/
def ep_Q2_054_partial_01_0436 : Poly :=
[
  term ((-18520234427760 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((18520234427760 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((-18520234427760 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((18520234427760 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((9260117213880 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((9260117213880 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((-9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-9260117213880 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 1. -/
theorem ep_Q2_054_partial_01_0436_valid :
    mulPoly ep_Q2_054_coefficient_01_0436
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0437 : Poly :=
[
  term ((319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 437 for generator 1. -/
def ep_Q2_054_partial_01_0437 : Poly :=
[
  term ((-638859389340 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((638859389340 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-638859389340 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((638859389340 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 1. -/
theorem ep_Q2_054_partial_01_0437_valid :
    mulPoly ep_Q2_054_coefficient_01_0437
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0438 : Poly :=
[
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 438 for generator 1. -/
def ep_Q2_054_partial_01_0438 : Poly :=
[
  term ((301737198393 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(2, 2), (8, 1), (10, 1), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(3, 2), (8, 1), (10, 1), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 1. -/
theorem ep_Q2_054_partial_01_0438_valid :
    mulPoly ep_Q2_054_coefficient_01_0438
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0439 : Poly :=
[
  term ((10133655060114 : Rat) / 45033486517) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 439 for generator 1. -/
def ep_Q2_054_partial_01_0439 : Poly :=
[
  term ((-20267310120228 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(8, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 1. -/
theorem ep_Q2_054_partial_01_0439_valid :
    mulPoly ep_Q2_054_coefficient_01_0439
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0440 : Poly :=
[
  term ((2284181045781 : Rat) / 90066973034) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 440 for generator 1. -/
def ep_Q2_054_partial_01_0440 : Poly :=
[
  term ((-2284181045781 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((2284181045781 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2284181045781 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((2284181045781 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((2284181045781 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((2284181045781 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-2284181045781 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-2284181045781 : Rat) / 90066973034) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 1. -/
theorem ep_Q2_054_partial_01_0440_valid :
    mulPoly ep_Q2_054_coefficient_01_0440
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0441 : Poly :=
[
  term ((-141982542184275 : Rat) / 90066973034) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 441 for generator 1. -/
def ep_Q2_054_partial_01_0441 : Poly :=
[
  term ((141982542184275 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-141982542184275 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((141982542184275 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-141982542184275 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-141982542184275 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-141982542184275 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((141982542184275 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((141982542184275 : Rat) / 90066973034) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 1. -/
theorem ep_Q2_054_partial_01_0441_valid :
    mulPoly ep_Q2_054_coefficient_01_0441
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0442 : Poly :=
[
  term ((-29567890602 : Rat) / 45033486517) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 442 for generator 1. -/
def ep_Q2_054_partial_01_0442 : Poly :=
[
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((59135781204 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-29567890602 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-29567890602 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((29567890602 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((29567890602 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 1. -/
theorem ep_Q2_054_partial_01_0442_valid :
    mulPoly ep_Q2_054_coefficient_01_0442
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0443 : Poly :=
[
  term ((5778723186099 : Rat) / 90066973034) [(8, 1), (11, 2)]
]

/-- Partial product 443 for generator 1. -/
def ep_Q2_054_partial_01_0443 : Poly :=
[
  term ((-5778723186099 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 2)],
  term ((5778723186099 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-5778723186099 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((5778723186099 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)],
  term ((5778723186099 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 2)],
  term ((5778723186099 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 2)],
  term ((-5778723186099 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 2)],
  term ((-5778723186099 : Rat) / 90066973034) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 1. -/
theorem ep_Q2_054_partial_01_0443_valid :
    mulPoly ep_Q2_054_coefficient_01_0443
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0444 : Poly :=
[
  term ((-5168922793781 : Rat) / 180133946068) [(8, 1), (12, 1)]
]

/-- Partial product 444 for generator 1. -/
def ep_Q2_054_partial_01_0444 : Poly :=
[
  term ((5168922793781 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (12, 1)],
  term ((-5168922793781 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((5168922793781 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((-5168922793781 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((-5168922793781 : Rat) / 180133946068) [(2, 2), (8, 1), (12, 1)],
  term ((-5168922793781 : Rat) / 180133946068) [(3, 2), (8, 1), (12, 1)],
  term ((5168922793781 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1)],
  term ((5168922793781 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 1. -/
theorem ep_Q2_054_partial_01_0444_valid :
    mulPoly ep_Q2_054_coefficient_01_0444
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0445 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 445 for generator 1. -/
def ep_Q2_054_partial_01_0445 : Poly :=
[
  term ((-27023080160304 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 1. -/
theorem ep_Q2_054_partial_01_0445_valid :
    mulPoly ep_Q2_054_coefficient_01_0445
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0446 : Poly :=
[
  term ((-12289330278489 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 446 for generator 1. -/
def ep_Q2_054_partial_01_0446 : Poly :=
[
  term ((24578660556978 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-24578660556978 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((24578660556978 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-24578660556978 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-12289330278489 : Rat) / 45033486517) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((-12289330278489 : Rat) / 45033486517) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((12289330278489 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((12289330278489 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 1. -/
theorem ep_Q2_054_partial_01_0446_valid :
    mulPoly ep_Q2_054_coefficient_01_0446
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0447 : Poly :=
[
  term ((-502895330655 : Rat) / 180133946068) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 447 for generator 1. -/
def ep_Q2_054_partial_01_0447 : Poly :=
[
  term ((502895330655 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((502895330655 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 180133946068) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-502895330655 : Rat) / 180133946068) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((502895330655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((502895330655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 1. -/
theorem ep_Q2_054_partial_01_0447_valid :
    mulPoly ep_Q2_054_coefficient_01_0447
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0448 : Poly :=
[
  term ((-23144241521980 : Rat) / 45033486517) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 448 for generator 1. -/
def ep_Q2_054_partial_01_0448 : Poly :=
[
  term ((46288483043960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-46288483043960 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((46288483043960 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((-46288483043960 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-23144241521980 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-23144241521980 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((23144241521980 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((23144241521980 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 1. -/
theorem ep_Q2_054_partial_01_0448_valid :
    mulPoly ep_Q2_054_coefficient_01_0448
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0449 : Poly :=
[
  term ((502895330655 : Rat) / 90066973034) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 449 for generator 1. -/
def ep_Q2_054_partial_01_0449 : Poly :=
[
  term ((-502895330655 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-502895330655 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 90066973034) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((502895330655 : Rat) / 90066973034) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 1. -/
theorem ep_Q2_054_partial_01_0449_valid :
    mulPoly ep_Q2_054_coefficient_01_0449
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0450 : Poly :=
[
  term ((39957426240563 : Rat) / 45033486517) [(8, 1), (15, 2)]
]

/-- Partial product 450 for generator 1. -/
def ep_Q2_054_partial_01_0450 : Poly :=
[
  term ((-79914852481126 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((79914852481126 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-79914852481126 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((79914852481126 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((39957426240563 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((39957426240563 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)],
  term ((-39957426240563 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((-39957426240563 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 1. -/
theorem ep_Q2_054_partial_01_0450_valid :
    mulPoly ep_Q2_054_coefficient_01_0450
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0451 : Poly :=
[
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (16, 1)]
]

/-- Partial product 451 for generator 1. -/
def ep_Q2_054_partial_01_0451 : Poly :=
[
  term ((-301737198393 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(2, 2), (8, 1), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(3, 2), (8, 1), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 1. -/
theorem ep_Q2_054_partial_01_0451_valid :
    mulPoly ep_Q2_054_coefficient_01_0451
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0452 : Poly :=
[
  term ((-221870322501 : Rat) / 45033486517) [(8, 2)]
]

/-- Partial product 452 for generator 1. -/
def ep_Q2_054_partial_01_0452 : Poly :=
[
  term ((443740645002 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2)],
  term ((-443740645002 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1)],
  term ((443740645002 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2)],
  term ((-443740645002 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1)],
  term ((-221870322501 : Rat) / 45033486517) [(2, 2), (8, 2)],
  term ((-221870322501 : Rat) / 45033486517) [(3, 2), (8, 2)],
  term ((221870322501 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((221870322501 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 1. -/
theorem ep_Q2_054_partial_01_0452_valid :
    mulPoly ep_Q2_054_coefficient_01_0452
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0453 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 453 for generator 1. -/
def ep_Q2_054_partial_01_0453 : Poly :=
[
  term ((-178969991874 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 1), (13, 1)],
  term ((178969991874 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-178969991874 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 1), (13, 1)],
  term ((178969991874 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 1), (13, 1)],
  term ((89484995937 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 1), (13, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 1. -/
theorem ep_Q2_054_partial_01_0453_valid :
    mulPoly ep_Q2_054_coefficient_01_0453
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0454 : Poly :=
[
  term ((-280105091682 : Rat) / 45033486517) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 454 for generator 1. -/
def ep_Q2_054_partial_01_0454 : Poly :=
[
  term ((560210183364 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-560210183364 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((560210183364 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 1), (15, 1)],
  term ((-560210183364 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((-280105091682 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 1), (15, 1)],
  term ((-280105091682 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 1), (15, 1)],
  term ((280105091682 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((280105091682 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 1. -/
theorem ep_Q2_054_partial_01_0454_valid :
    mulPoly ep_Q2_054_coefficient_01_0454
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0455 : Poly :=
[
  term ((268454987811 : Rat) / 45033486517) [(8, 2), (11, 2)]
]

/-- Partial product 455 for generator 1. -/
def ep_Q2_054_partial_01_0455 : Poly :=
[
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 2)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 2)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 2)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 3)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 2)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 2)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 1. -/
theorem ep_Q2_054_partial_01_0455_valid :
    mulPoly ep_Q2_054_coefficient_01_0455
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0456 : Poly :=
[
  term ((-89484995937 : Rat) / 90066973034) [(8, 2), (12, 1)]
]

/-- Partial product 456 for generator 1. -/
def ep_Q2_054_partial_01_0456 : Poly :=
[
  term ((89484995937 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (12, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (12, 1)],
  term ((89484995937 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(2, 2), (8, 2), (12, 1)],
  term ((-89484995937 : Rat) / 90066973034) [(3, 2), (8, 2), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 2), (10, 2), (12, 1)],
  term ((89484995937 : Rat) / 90066973034) [(8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 1. -/
theorem ep_Q2_054_partial_01_0456_valid :
    mulPoly ep_Q2_054_coefficient_01_0456
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0457 : Poly :=
[
  term ((1675466298558 : Rat) / 45033486517) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 457 for generator 1. -/
def ep_Q2_054_partial_01_0457 : Poly :=
[
  term ((-3350932597116 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (13, 1), (15, 1)],
  term ((3350932597116 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3350932597116 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((3350932597116 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((1675466298558 : Rat) / 45033486517) [(2, 2), (8, 2), (13, 1), (15, 1)],
  term ((1675466298558 : Rat) / 45033486517) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-1675466298558 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((-1675466298558 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 1. -/
theorem ep_Q2_054_partial_01_0457_valid :
    mulPoly ep_Q2_054_coefficient_01_0457
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0458 : Poly :=
[
  term ((-569278161468 : Rat) / 45033486517) [(8, 2), (15, 2)]
]

/-- Partial product 458 for generator 1. -/
def ep_Q2_054_partial_01_0458 : Poly :=
[
  term ((1138556322936 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (15, 2)],
  term ((-1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (15, 2)],
  term ((1138556322936 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((-1138556322936 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(2, 2), (8, 2), (15, 2)],
  term ((-569278161468 : Rat) / 45033486517) [(3, 2), (8, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (10, 2), (15, 2)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 1. -/
theorem ep_Q2_054_partial_01_0458_valid :
    mulPoly ep_Q2_054_coefficient_01_0458
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0459 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 459 for generator 1. -/
def ep_Q2_054_partial_01_0459 : Poly :=
[
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 3)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 1. -/
theorem ep_Q2_054_partial_01_0459_valid :
    mulPoly ep_Q2_054_coefficient_01_0459
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0460 : Poly :=
[
  term ((3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 460 for generator 1. -/
def ep_Q2_054_partial_01_0460 : Poly :=
[
  term ((-7701291358662 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((7701291358662 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-7701291358662 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((7701291358662 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(9, 1), (10, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 1. -/
theorem ep_Q2_054_partial_01_0460_valid :
    mulPoly ep_Q2_054_coefficient_01_0460
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0461 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 461 for generator 1. -/
def ep_Q2_054_partial_01_0461 : Poly :=
[
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 1. -/
theorem ep_Q2_054_partial_01_0461_valid :
    mulPoly ep_Q2_054_coefficient_01_0461
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0462 : Poly :=
[
  term ((3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 462 for generator 1. -/
def ep_Q2_054_partial_01_0462 : Poly :=
[
  term ((-7407286468056 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((7407286468056 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-7407286468056 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((7407286468056 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 1. -/
theorem ep_Q2_054_partial_01_0462_valid :
    mulPoly ep_Q2_054_coefficient_01_0462
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0463 : Poly :=
[
  term ((-159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 1. -/
def ep_Q2_054_partial_01_0463 : Poly :=
[
  term ((159714847335 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 1. -/
theorem ep_Q2_054_partial_01_0463_valid :
    mulPoly ep_Q2_054_coefficient_01_0463
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0464 : Poly :=
[
  term ((-4851246627951 : Rat) / 180133946068) [(9, 1), (11, 1)]
]

/-- Partial product 464 for generator 1. -/
def ep_Q2_054_partial_01_0464 : Poly :=
[
  term ((4851246627951 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-4851246627951 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((4851246627951 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-4851246627951 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 2)],
  term ((-4851246627951 : Rat) / 180133946068) [(2, 2), (9, 1), (11, 1)],
  term ((-4851246627951 : Rat) / 180133946068) [(3, 2), (9, 1), (11, 1)],
  term ((4851246627951 : Rat) / 180133946068) [(9, 1), (10, 2), (11, 1)],
  term ((4851246627951 : Rat) / 180133946068) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 1. -/
theorem ep_Q2_054_partial_01_0464_valid :
    mulPoly ep_Q2_054_coefficient_01_0464
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0465 : Poly :=
[
  term ((-265368762711 : Rat) / 90066973034) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 465 for generator 1. -/
def ep_Q2_054_partial_01_0465 : Poly :=
[
  term ((265368762711 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((265368762711 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 1. -/
theorem ep_Q2_054_partial_01_0465_valid :
    mulPoly ep_Q2_054_coefficient_01_0465
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0466 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 466 for generator 1. -/
def ep_Q2_054_partial_01_0466 : Poly :=
[
  term ((27437863953468 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 1. -/
theorem ep_Q2_054_partial_01_0466_valid :
    mulPoly ep_Q2_054_coefficient_01_0466
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0467 : Poly :=
[
  term ((6859465988367 : Rat) / 45033486517) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 467 for generator 1. -/
def ep_Q2_054_partial_01_0467 : Poly :=
[
  term ((-13718931976734 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((13718931976734 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((6859465988367 : Rat) / 45033486517) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((6859465988367 : Rat) / 45033486517) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 1. -/
theorem ep_Q2_054_partial_01_0467_valid :
    mulPoly ep_Q2_054_coefficient_01_0467
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0468 : Poly :=
[
  term ((24622302836829 : Rat) / 180133946068) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 468 for generator 1. -/
def ep_Q2_054_partial_01_0468 : Poly :=
[
  term ((-24622302836829 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((24622302836829 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-24622302836829 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((24622302836829 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((24622302836829 : Rat) / 180133946068) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((24622302836829 : Rat) / 180133946068) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-24622302836829 : Rat) / 180133946068) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-24622302836829 : Rat) / 180133946068) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 1. -/
theorem ep_Q2_054_partial_01_0468_valid :
    mulPoly ep_Q2_054_coefficient_01_0468
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0469 : Poly :=
[
  term ((-77521178935289 : Rat) / 360267892136) [(9, 1), (13, 1)]
]

/-- Partial product 469 for generator 1. -/
def ep_Q2_054_partial_01_0469 : Poly :=
[
  term ((77521178935289 : Rat) / 180133946068) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-77521178935289 : Rat) / 180133946068) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((77521178935289 : Rat) / 180133946068) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-77521178935289 : Rat) / 180133946068) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-77521178935289 : Rat) / 360267892136) [(2, 2), (9, 1), (13, 1)],
  term ((-77521178935289 : Rat) / 360267892136) [(3, 2), (9, 1), (13, 1)],
  term ((77521178935289 : Rat) / 360267892136) [(9, 1), (10, 2), (13, 1)],
  term ((77521178935289 : Rat) / 360267892136) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 1. -/
theorem ep_Q2_054_partial_01_0469_valid :
    mulPoly ep_Q2_054_coefficient_01_0469
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0470 : Poly :=
[
  term ((-27327360761499 : Rat) / 180133946068) [(9, 1), (15, 1)]
]

/-- Partial product 470 for generator 1. -/
def ep_Q2_054_partial_01_0470 : Poly :=
[
  term ((27327360761499 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-27327360761499 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((27327360761499 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-27327360761499 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-27327360761499 : Rat) / 180133946068) [(2, 2), (9, 1), (15, 1)],
  term ((-27327360761499 : Rat) / 180133946068) [(3, 2), (9, 1), (15, 1)],
  term ((27327360761499 : Rat) / 180133946068) [(9, 1), (10, 2), (15, 1)],
  term ((27327360761499 : Rat) / 180133946068) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 1. -/
theorem ep_Q2_054_partial_01_0470_valid :
    mulPoly ep_Q2_054_coefficient_01_0470
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0471 : Poly :=
[
  term ((319429694670 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 1. -/
def ep_Q2_054_partial_01_0471 : Poly :=
[
  term ((-638859389340 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((638859389340 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-638859389340 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((638859389340 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((319429694670 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 1. -/
theorem ep_Q2_054_partial_01_0471_valid :
    mulPoly ep_Q2_054_coefficient_01_0471
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0472 : Poly :=
[
  term ((2135664294747 : Rat) / 45033486517) [(9, 2)]
]

/-- Partial product 472 for generator 1. -/
def ep_Q2_054_partial_01_0472 : Poly :=
[
  term ((-4271328589494 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2)],
  term ((4271328589494 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1)],
  term ((-4271328589494 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2)],
  term ((4271328589494 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1)],
  term ((2135664294747 : Rat) / 45033486517) [(2, 2), (9, 2)],
  term ((2135664294747 : Rat) / 45033486517) [(3, 2), (9, 2)],
  term ((-2135664294747 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((-2135664294747 : Rat) / 45033486517) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 1. -/
theorem ep_Q2_054_partial_01_0472_valid :
    mulPoly ep_Q2_054_coefficient_01_0472
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0473 : Poly :=
[
  term ((-408880257516 : Rat) / 45033486517) [(9, 2), (10, 1)]
]

/-- Partial product 473 for generator 1. -/
def ep_Q2_054_partial_01_0473 : Poly :=
[
  term ((817760515032 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-817760515032 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 2)],
  term ((817760515032 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-817760515032 : Rat) / 45033486517) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((-408880257516 : Rat) / 45033486517) [(2, 2), (9, 2), (10, 1)],
  term ((-408880257516 : Rat) / 45033486517) [(3, 2), (9, 2), (10, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (11, 2)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 1. -/
theorem ep_Q2_054_partial_01_0473_valid :
    mulPoly ep_Q2_054_coefficient_01_0473
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0474 : Poly :=
[
  term ((449085598434 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 474 for generator 1. -/
def ep_Q2_054_partial_01_0474 : Poly :=
[
  term ((-898171196868 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2), (12, 1)],
  term ((898171196868 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-898171196868 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((898171196868 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((449085598434 : Rat) / 45033486517) [(2, 2), (9, 2), (12, 1)],
  term ((449085598434 : Rat) / 45033486517) [(3, 2), (9, 2), (12, 1)],
  term ((-449085598434 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((-449085598434 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 1. -/
theorem ep_Q2_054_partial_01_0474_valid :
    mulPoly ep_Q2_054_coefficient_01_0474
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0475 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 475 for generator 1. -/
def ep_Q2_054_partial_01_0475 : Poly :=
[
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 3), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 1. -/
theorem ep_Q2_054_partial_01_0475_valid :
    mulPoly ep_Q2_054_coefficient_01_0475
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0476 : Poly :=
[
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 476 for generator 1. -/
def ep_Q2_054_partial_01_0476 : Poly :=
[
  term ((-24702952613952 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((24702952613952 : Rat) / 45033486517) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((-24702952613952 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2)],
  term ((24702952613952 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((12351476306976 : Rat) / 45033486517) [(2, 2), (10, 1), (12, 1), (15, 2)],
  term ((12351476306976 : Rat) / 45033486517) [(3, 2), (10, 1), (12, 1), (15, 2)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 1. -/
theorem ep_Q2_054_partial_01_0476_valid :
    mulPoly ep_Q2_054_coefficient_01_0476
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0477 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 477 for generator 1. -/
def ep_Q2_054_partial_01_0477 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 1. -/
theorem ep_Q2_054_partial_01_0477_valid :
    mulPoly ep_Q2_054_coefficient_01_0477
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0478 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 478 for generator 1. -/
def ep_Q2_054_partial_01_0478 : Poly :=
[
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 1. -/
theorem ep_Q2_054_partial_01_0478_valid :
    mulPoly ep_Q2_054_coefficient_01_0478
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0479 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 1. -/
def ep_Q2_054_partial_01_0479 : Poly :=
[
  term ((121076473400 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((121076473400 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 1. -/
theorem ep_Q2_054_partial_01_0479_valid :
    mulPoly ep_Q2_054_coefficient_01_0479
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0480 : Poly :=
[
  term ((-23322085193004 : Rat) / 45033486517) [(10, 1), (15, 2)]
]

/-- Partial product 480 for generator 1. -/
def ep_Q2_054_partial_01_0480 : Poly :=
[
  term ((46644170386008 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-46644170386008 : Rat) / 45033486517) [(0, 1), (10, 2), (15, 2)],
  term ((46644170386008 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-46644170386008 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-23322085193004 : Rat) / 45033486517) [(2, 2), (10, 1), (15, 2)],
  term ((-23322085193004 : Rat) / 45033486517) [(3, 2), (10, 1), (15, 2)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 1. -/
theorem ep_Q2_054_partial_01_0480_valid :
    mulPoly ep_Q2_054_coefficient_01_0480
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0481 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 481 for generator 1. -/
def ep_Q2_054_partial_01_0481 : Poly :=
[
  term ((1042836986052 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((1042836986052 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((521418493026 : Rat) / 45033486517) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 1. -/
theorem ep_Q2_054_partial_01_0481_valid :
    mulPoly ep_Q2_054_coefficient_01_0481
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0482 : Poly :=
[
  term ((-45403677525 : Rat) / 90066973034) [(10, 1), (16, 1)]
]

/-- Partial product 482 for generator 1. -/
def ep_Q2_054_partial_01_0482 : Poly :=
[
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(0, 1), (10, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(2, 2), (10, 1), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(3, 2), (10, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (11, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 1. -/
theorem ep_Q2_054_partial_01_0482_valid :
    mulPoly ep_Q2_054_coefficient_01_0482
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0483 : Poly :=
[
  term ((-16309393213602 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 483 for generator 1. -/
def ep_Q2_054_partial_01_0483 : Poly :=
[
  term ((32618786427204 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32618786427204 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((32618786427204 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-32618786427204 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-16309393213602 : Rat) / 45033486517) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-16309393213602 : Rat) / 45033486517) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((16309393213602 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((16309393213602 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 1. -/
theorem ep_Q2_054_partial_01_0483_valid :
    mulPoly ep_Q2_054_coefficient_01_0483
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0484 : Poly :=
[
  term ((548674012461 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 484 for generator 1. -/
def ep_Q2_054_partial_01_0484 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1)],
  term ((548674012461 : Rat) / 45033486517) [(2, 2), (11, 1), (13, 1)],
  term ((548674012461 : Rat) / 45033486517) [(3, 2), (11, 1), (13, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 1. -/
theorem ep_Q2_054_partial_01_0484_valid :
    mulPoly ep_Q2_054_coefficient_01_0484
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0485 : Poly :=
[
  term ((74957798226150 : Rat) / 45033486517) [(11, 1), (15, 1)]
]

/-- Partial product 485 for generator 1. -/
def ep_Q2_054_partial_01_0485 : Poly :=
[
  term ((-149915596452300 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((149915596452300 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((-149915596452300 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((149915596452300 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((74957798226150 : Rat) / 45033486517) [(2, 2), (11, 1), (15, 1)],
  term ((74957798226150 : Rat) / 45033486517) [(3, 2), (11, 1), (15, 1)],
  term ((-74957798226150 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((-74957798226150 : Rat) / 45033486517) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 1. -/
theorem ep_Q2_054_partial_01_0485_valid :
    mulPoly ep_Q2_054_coefficient_01_0485
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0486 : Poly :=
[
  term ((1434809750093 : Rat) / 90066973034) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 1. -/
def ep_Q2_054_partial_01_0486 : Poly :=
[
  term ((-1434809750093 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1434809750093 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1434809750093 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1434809750093 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((1434809750093 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1434809750093 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1434809750093 : Rat) / 90066973034) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1434809750093 : Rat) / 90066973034) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 1. -/
theorem ep_Q2_054_partial_01_0486_valid :
    mulPoly ep_Q2_054_coefficient_01_0486
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0487 : Poly :=
[
  term ((-4938066112149 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 487 for generator 1. -/
def ep_Q2_054_partial_01_0487 : Poly :=
[
  term ((9876132224298 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 2)],
  term ((-9876132224298 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 2)],
  term ((9876132224298 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2)],
  term ((-9876132224298 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((-4938066112149 : Rat) / 45033486517) [(2, 2), (11, 2)],
  term ((-4938066112149 : Rat) / 45033486517) [(3, 2), (11, 2)],
  term ((4938066112149 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((4938066112149 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 1. -/
theorem ep_Q2_054_partial_01_0487_valid :
    mulPoly ep_Q2_054_coefficient_01_0487
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0488 : Poly :=
[
  term ((4855604559560 : Rat) / 45033486517) [(12, 1)]
]

/-- Partial product 488 for generator 1. -/
def ep_Q2_054_partial_01_0488 : Poly :=
[
  term ((-9711209119120 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((9711209119120 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((-9711209119120 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1)],
  term ((9711209119120 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((4855604559560 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((4855604559560 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((-4855604559560 : Rat) / 45033486517) [(10, 2), (12, 1)],
  term ((-4855604559560 : Rat) / 45033486517) [(11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 1. -/
theorem ep_Q2_054_partial_01_0488_valid :
    mulPoly ep_Q2_054_coefficient_01_0488
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0489 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 489 for generator 1. -/
def ep_Q2_054_partial_01_0489 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 1. -/
theorem ep_Q2_054_partial_01_0489_valid :
    mulPoly ep_Q2_054_coefficient_01_0489
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0490 : Poly :=
[
  term ((76316419620075 : Rat) / 90066973034) [(12, 1), (15, 2)]
]

/-- Partial product 490 for generator 1. -/
def ep_Q2_054_partial_01_0490 : Poly :=
[
  term ((-76316419620075 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((76316419620075 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-76316419620075 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((76316419620075 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((76316419620075 : Rat) / 90066973034) [(2, 2), (12, 1), (15, 2)],
  term ((76316419620075 : Rat) / 90066973034) [(3, 2), (12, 1), (15, 2)],
  term ((-76316419620075 : Rat) / 90066973034) [(10, 2), (12, 1), (15, 2)],
  term ((-76316419620075 : Rat) / 90066973034) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 1. -/
theorem ep_Q2_054_partial_01_0490_valid :
    mulPoly ep_Q2_054_coefficient_01_0490
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0491 : Poly :=
[
  term ((-75672795875 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

/-- Partial product 491 for generator 1. -/
def ep_Q2_054_partial_01_0491 : Poly :=
[
  term ((75672795875 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(2, 2), (12, 1), (16, 1)],
  term ((-75672795875 : Rat) / 90066973034) [(3, 2), (12, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(10, 2), (12, 1), (16, 1)],
  term ((75672795875 : Rat) / 90066973034) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 1. -/
theorem ep_Q2_054_partial_01_0491_valid :
    mulPoly ep_Q2_054_coefficient_01_0491
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0492 : Poly :=
[
  term ((-216358771534215 : Rat) / 180133946068) [(13, 1), (15, 1)]
]

/-- Partial product 492 for generator 1. -/
def ep_Q2_054_partial_01_0492 : Poly :=
[
  term ((216358771534215 : Rat) / 90066973034) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-216358771534215 : Rat) / 90066973034) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((216358771534215 : Rat) / 90066973034) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-216358771534215 : Rat) / 90066973034) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-216358771534215 : Rat) / 180133946068) [(2, 2), (13, 1), (15, 1)],
  term ((-216358771534215 : Rat) / 180133946068) [(3, 2), (13, 1), (15, 1)],
  term ((216358771534215 : Rat) / 180133946068) [(10, 2), (13, 1), (15, 1)],
  term ((216358771534215 : Rat) / 180133946068) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 1. -/
theorem ep_Q2_054_partial_01_0492_valid :
    mulPoly ep_Q2_054_coefficient_01_0492
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0493 : Poly :=
[
  term ((75672795875 : Rat) / 45033486517) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 493 for generator 1. -/
def ep_Q2_054_partial_01_0493 : Poly :=
[
  term ((-151345591750 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((151345591750 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((151345591750 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((75672795875 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 1. -/
theorem ep_Q2_054_partial_01_0493_valid :
    mulPoly ep_Q2_054_coefficient_01_0493
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0494 : Poly :=
[
  term ((-40107365400593 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 494 for generator 1. -/
def ep_Q2_054_partial_01_0494 : Poly :=
[
  term ((80214730801186 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)],
  term ((-80214730801186 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((80214730801186 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2)],
  term ((-80214730801186 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((-40107365400593 : Rat) / 45033486517) [(2, 2), (15, 2)],
  term ((-40107365400593 : Rat) / 45033486517) [(3, 2), (15, 2)],
  term ((40107365400593 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((40107365400593 : Rat) / 45033486517) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 1. -/
theorem ep_Q2_054_partial_01_0494_valid :
    mulPoly ep_Q2_054_coefficient_01_0494
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0495 : Poly :=
[
  term ((3119130001407 : Rat) / 90066973034) [(15, 2), (16, 1)]
]

/-- Partial product 495 for generator 1. -/
def ep_Q2_054_partial_01_0495 : Poly :=
[
  term ((-3119130001407 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((3119130001407 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(10, 2), (15, 2), (16, 1)],
  term ((-3119130001407 : Rat) / 90066973034) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 1. -/
theorem ep_Q2_054_partial_01_0495_valid :
    mulPoly ep_Q2_054_coefficient_01_0495
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 1. -/
def ep_Q2_054_coefficient_01_0496 : Poly :=
[
  term ((45403677525 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 496 for generator 1. -/
def ep_Q2_054_partial_01_0496 : Poly :=
[
  term ((-45403677525 : Rat) / 45033486517) [(0, 1), (2, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (10, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 1), (3, 1), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (11, 1), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(2, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(3, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 1. -/
theorem ep_Q2_054_partial_01_0496_valid :
    mulPoly ep_Q2_054_coefficient_01_0496
        ep_Q2_054_generator_01_0400_0496 =
      ep_Q2_054_partial_01_0496 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_01_0400_0496 : List Poly :=
[
  ep_Q2_054_partial_01_0400,
  ep_Q2_054_partial_01_0401,
  ep_Q2_054_partial_01_0402,
  ep_Q2_054_partial_01_0403,
  ep_Q2_054_partial_01_0404,
  ep_Q2_054_partial_01_0405,
  ep_Q2_054_partial_01_0406,
  ep_Q2_054_partial_01_0407,
  ep_Q2_054_partial_01_0408,
  ep_Q2_054_partial_01_0409,
  ep_Q2_054_partial_01_0410,
  ep_Q2_054_partial_01_0411,
  ep_Q2_054_partial_01_0412,
  ep_Q2_054_partial_01_0413,
  ep_Q2_054_partial_01_0414,
  ep_Q2_054_partial_01_0415,
  ep_Q2_054_partial_01_0416,
  ep_Q2_054_partial_01_0417,
  ep_Q2_054_partial_01_0418,
  ep_Q2_054_partial_01_0419,
  ep_Q2_054_partial_01_0420,
  ep_Q2_054_partial_01_0421,
  ep_Q2_054_partial_01_0422,
  ep_Q2_054_partial_01_0423,
  ep_Q2_054_partial_01_0424,
  ep_Q2_054_partial_01_0425,
  ep_Q2_054_partial_01_0426,
  ep_Q2_054_partial_01_0427,
  ep_Q2_054_partial_01_0428,
  ep_Q2_054_partial_01_0429,
  ep_Q2_054_partial_01_0430,
  ep_Q2_054_partial_01_0431,
  ep_Q2_054_partial_01_0432,
  ep_Q2_054_partial_01_0433,
  ep_Q2_054_partial_01_0434,
  ep_Q2_054_partial_01_0435,
  ep_Q2_054_partial_01_0436,
  ep_Q2_054_partial_01_0437,
  ep_Q2_054_partial_01_0438,
  ep_Q2_054_partial_01_0439,
  ep_Q2_054_partial_01_0440,
  ep_Q2_054_partial_01_0441,
  ep_Q2_054_partial_01_0442,
  ep_Q2_054_partial_01_0443,
  ep_Q2_054_partial_01_0444,
  ep_Q2_054_partial_01_0445,
  ep_Q2_054_partial_01_0446,
  ep_Q2_054_partial_01_0447,
  ep_Q2_054_partial_01_0448,
  ep_Q2_054_partial_01_0449,
  ep_Q2_054_partial_01_0450,
  ep_Q2_054_partial_01_0451,
  ep_Q2_054_partial_01_0452,
  ep_Q2_054_partial_01_0453,
  ep_Q2_054_partial_01_0454,
  ep_Q2_054_partial_01_0455,
  ep_Q2_054_partial_01_0456,
  ep_Q2_054_partial_01_0457,
  ep_Q2_054_partial_01_0458,
  ep_Q2_054_partial_01_0459,
  ep_Q2_054_partial_01_0460,
  ep_Q2_054_partial_01_0461,
  ep_Q2_054_partial_01_0462,
  ep_Q2_054_partial_01_0463,
  ep_Q2_054_partial_01_0464,
  ep_Q2_054_partial_01_0465,
  ep_Q2_054_partial_01_0466,
  ep_Q2_054_partial_01_0467,
  ep_Q2_054_partial_01_0468,
  ep_Q2_054_partial_01_0469,
  ep_Q2_054_partial_01_0470,
  ep_Q2_054_partial_01_0471,
  ep_Q2_054_partial_01_0472,
  ep_Q2_054_partial_01_0473,
  ep_Q2_054_partial_01_0474,
  ep_Q2_054_partial_01_0475,
  ep_Q2_054_partial_01_0476,
  ep_Q2_054_partial_01_0477,
  ep_Q2_054_partial_01_0478,
  ep_Q2_054_partial_01_0479,
  ep_Q2_054_partial_01_0480,
  ep_Q2_054_partial_01_0481,
  ep_Q2_054_partial_01_0482,
  ep_Q2_054_partial_01_0483,
  ep_Q2_054_partial_01_0484,
  ep_Q2_054_partial_01_0485,
  ep_Q2_054_partial_01_0486,
  ep_Q2_054_partial_01_0487,
  ep_Q2_054_partial_01_0488,
  ep_Q2_054_partial_01_0489,
  ep_Q2_054_partial_01_0490,
  ep_Q2_054_partial_01_0491,
  ep_Q2_054_partial_01_0492,
  ep_Q2_054_partial_01_0493,
  ep_Q2_054_partial_01_0494,
  ep_Q2_054_partial_01_0495,
  ep_Q2_054_partial_01_0496
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_01_0400_0496 : Poly :=
[
  term ((-410136305154 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8339643840051 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-2052455979501 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-164867989366764 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)],
  term ((621305782731 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((20443448739699 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-87100421001741 : Rat) / 180133946068) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (13, 1), (15, 2)],
  term ((55250710078701 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3508535951397 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2)],
  term ((1654033754772 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (8, 1), (16, 1)],
  term ((-91339512975 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2), (10, 1)],
  term ((60893008650 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (10, 1), (12, 1)],
  term ((-1118802273570 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (11, 1), (13, 1)],
  term ((30446504325 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (11, 1), (15, 1)],
  term ((-903056220675 : Rat) / 90066973034) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((-6713587775319 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((544942043676 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1012396644804 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1143126977832 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((756711556203 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1254645772008 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((402316264524 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18520234427760 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-638859389340 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (10, 1), (16, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2284181045781 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((141982542184275 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((59135781204 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5778723186099 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (11, 2)],
  term ((5168922793781 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (12, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((24578660556978 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (12, 1), (16, 1)],
  term ((46288483043960 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79914852481126 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((-301737198393 : Rat) / 90066973034) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((443740645002 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2)],
  term ((-178969991874 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 1), (13, 1)],
  term ((560210183364 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (11, 2)],
  term ((89484995937 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (12, 1)],
  term ((-3350932597116 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (13, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(0, 1), (2, 1), (8, 2), (15, 2)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-7701291358662 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7407286468056 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4851246627951 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((265368762711 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-24622302836829 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((77521178935289 : Rat) / 180133946068) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((27327360761499 : Rat) / 90066973034) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-638859389340 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4271328589494 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2)],
  term ((817760515032 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2), (10, 1)],
  term ((-898171196868 : Rat) / 45033486517) [(0, 1), (2, 1), (9, 2), (12, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-24702952613952 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1)],
  term ((121076473400 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((46644170386008 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((1042836986052 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((32618786427204 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-149915596452300 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-1434809750093 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((9876132224298 : Rat) / 45033486517) [(0, 1), (2, 1), (11, 2)],
  term ((-9711209119120 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-76316419620075 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 45033486517) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((216358771534215 : Rat) / 90066973034) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((80214730801186 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(0, 1), (2, 1), (16, 1)],
  term ((8339643840051 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((2052455979501 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((164867989366764 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-621305782731 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-20443448739699 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((87100421001741 : Rat) / 180133946068) [(0, 1), (7, 1), (10, 1), (13, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-55250710078701 : Rat) / 90066973034) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1654033754772 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(0, 1), (7, 2), (8, 1), (10, 1), (16, 1)],
  term ((3508535951397 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 1)],
  term ((1118802273570 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((903056220675 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((91339512975 : Rat) / 90066973034) [(0, 1), (7, 2), (10, 2)],
  term ((-60893008650 : Rat) / 45033486517) [(0, 1), (7, 2), (10, 2), (12, 1)],
  term ((1012396644804 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((1143126977832 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-756711556203 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((1254645772008 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (11, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-544942043676 : Rat) / 45033486517) [(0, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((6713587775319 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((2284181045781 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-141982542184275 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((5778723186099 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (11, 2)],
  term ((-5168922793781 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (12, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24578660556978 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-46288483043960 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((79914852481126 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((301737198393 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (12, 1), (16, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((18520234427760 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((638859389340 : Rat) / 45033486517) [(0, 1), (8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(0, 1), (8, 1), (10, 2), (16, 1)],
  term ((-443740645002 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1)],
  term ((178969991874 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-560210183364 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 1), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (11, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (12, 1)],
  term ((3350932597116 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(0, 1), (8, 2), (10, 1), (15, 2)],
  term ((-4851246627951 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-265368762711 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((24622302836829 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-77521178935289 : Rat) / 180133946068) [(0, 1), (9, 1), (10, 1), (13, 1)],
  term ((-27327360761499 : Rat) / 90066973034) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((638859389340 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((7701291358662 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((7407286468056 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((4271328589494 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1)],
  term ((898171196868 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 1), (12, 1)],
  term ((-817760515032 : Rat) / 45033486517) [(0, 1), (9, 2), (10, 2)],
  term ((-32618786427204 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((149915596452300 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((1434809750093 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9876132224298 : Rat) / 45033486517) [(0, 1), (10, 1), (11, 2)],
  term ((9711209119120 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((76316419620075 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 45033486517) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-216358771534215 : Rat) / 90066973034) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((151345591750 : Rat) / 45033486517) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80214730801186 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(0, 1), (10, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((60538236700 : Rat) / 45033486517) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46644170386008 : Rat) / 45033486517) [(0, 1), (10, 2), (15, 2)],
  term ((-1042836986052 : Rat) / 45033486517) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(0, 1), (10, 2), (16, 1)],
  term ((-410136305154 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8339643840051 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-2052455979501 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-164867989366764 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((621305782731 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((20443448739699 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-87100421001741 : Rat) / 180133946068) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((159038119382616 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((55250710078701 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((2247397248174 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3508535951397 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2)],
  term ((1654033754772 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (8, 1), (16, 1)],
  term ((-91339512975 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2), (10, 1)],
  term ((60893008650 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (10, 1), (12, 1)],
  term ((-1118802273570 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (11, 1), (13, 1)],
  term ((30446504325 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1)],
  term ((-903056220675 : Rat) / 90066973034) [(1, 1), (3, 1), (7, 2), (12, 1)],
  term ((1057909264920 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (13, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-6713587775319 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((544942043676 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1012396644804 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1143126977832 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((756711556203 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1254645772008 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((402316264524 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18520234427760 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2)],
  term ((-638859389340 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (10, 1), (16, 1)],
  term ((-20267310120228 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2284181045781 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((141982542184275 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((59135781204 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5778723186099 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((5168922793781 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (12, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((24578660556978 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (12, 1), (16, 1)],
  term ((46288483043960 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-79914852481126 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((443740645002 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2)],
  term ((-178969991874 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 1), (13, 1)],
  term ((560210183364 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (11, 2)],
  term ((89484995937 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (12, 1)],
  term ((-3350932597116 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (13, 1), (15, 1)],
  term ((1138556322936 : Rat) / 45033486517) [(1, 1), (3, 1), (8, 2), (15, 2)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-7701291358662 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7407286468056 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((159714847335 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4851246627951 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((265368762711 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((27437863953468 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-24622302836829 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((77521178935289 : Rat) / 180133946068) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((27327360761499 : Rat) / 90066973034) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-638859389340 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4271328589494 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2)],
  term ((817760515032 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2), (10, 1)],
  term ((-898171196868 : Rat) / 45033486517) [(1, 1), (3, 1), (9, 2), (12, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-24702952613952 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (12, 1), (15, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (12, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((121076473400 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((46644170386008 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((1042836986052 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((32618786427204 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1097348024922 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-149915596452300 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1434809750093 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((9876132224298 : Rat) / 45033486517) [(1, 1), (3, 1), (11, 2)],
  term ((-9711209119120 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-76316419620075 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 45033486517) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term ((216358771534215 : Rat) / 90066973034) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-151345591750 : Rat) / 45033486517) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((80214730801186 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2)],
  term ((-3119130001407 : Rat) / 45033486517) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 1), (3, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((933502725000 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-20443448739699 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((87100421001741 : Rat) / 180133946068) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-55250710078701 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2247397248174 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8339643840051 : Rat) / 90066973034) [(1, 1), (7, 1), (11, 2)],
  term ((2052455979501 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((164867989366764 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (15, 2)],
  term ((-621305782731 : Rat) / 45033486517) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1654033754772 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(1, 1), (7, 2), (8, 1), (11, 2), (13, 1)],
  term ((91339512975 : Rat) / 90066973034) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-60893008650 : Rat) / 45033486517) [(1, 1), (7, 2), (10, 1), (11, 1), (12, 1)],
  term ((3508535951397 : Rat) / 90066973034) [(1, 1), (7, 2), (11, 1)],
  term ((903056220675 : Rat) / 90066973034) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((1118802273570 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (13, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(1, 1), (7, 2), (11, 2), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-544942043676 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (10, 1), (11, 2)],
  term ((1143126977832 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-756711556203 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1254645772008 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((1012396644804 : Rat) / 45033486517) [(1, 1), (8, 1), (9, 1), (11, 2)],
  term ((201158132262 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-402316264524 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18520234427760 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((638859389340 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 90066973034) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((6713587775319 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1)],
  term ((-5168922793781 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-24578660556978 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-46288483043960 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((79914852481126 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((301737198393 : Rat) / 90066973034) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((20267310120228 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((2284181045781 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((-141982542184275 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-59135781204 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((5778723186099 : Rat) / 45033486517) [(1, 1), (8, 1), (11, 3)],
  term ((-443740645002 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1)],
  term ((-89484995937 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((3350932597116 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-1138556322936 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((178969991874 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((-560210183364 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((536909975622 : Rat) / 45033486517) [(1, 1), (8, 2), (11, 3)],
  term ((7701291358662 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((7407286468056 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-159714847335 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((24622302836829 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-77521178935289 : Rat) / 180133946068) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-27327360761499 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((638859389340 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4851246627951 : Rat) / 90066973034) [(1, 1), (9, 1), (11, 2)],
  term ((-265368762711 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-27437863953468 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(1, 1), (9, 1), (11, 2), (15, 2)],
  term ((-817760515032 : Rat) / 45033486517) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((4271328589494 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1)],
  term ((898171196868 : Rat) / 45033486517) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((24702952613952 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((60538236700 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6584088149532 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-121076473400 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46644170386008 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1042836986052 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((6584088149532 : Rat) / 45033486517) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((9711209119120 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((76316419620075 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 45033486517) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-216358771534215 : Rat) / 90066973034) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((151345591750 : Rat) / 45033486517) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80214730801186 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2)],
  term ((3119130001407 : Rat) / 45033486517) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 45033486517) [(1, 1), (11, 1), (16, 1)],
  term ((-32618786427204 : Rat) / 45033486517) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(1, 1), (11, 2), (13, 1)],
  term ((149915596452300 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1)],
  term ((1434809750093 : Rat) / 45033486517) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-9876132224298 : Rat) / 45033486517) [(1, 1), (11, 3)],
  term ((205068152577 : Rat) / 45033486517) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8339643840051 : Rat) / 180133946068) [(2, 2), (7, 1), (11, 1)],
  term ((2052455979501 : Rat) / 90066973034) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((82433994683382 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1457467496037 : Rat) / 45033486517) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-621305782731 : Rat) / 90066973034) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((466751362500 : Rat) / 45033486517) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-20443448739699 : Rat) / 180133946068) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((87100421001741 : Rat) / 360267892136) [(2, 2), (7, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-55250710078701 : Rat) / 180133946068) [(2, 2), (7, 1), (15, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((3508535951397 : Rat) / 180133946068) [(2, 2), (7, 2)],
  term ((-827016877386 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(2, 2), (7, 2), (8, 1), (16, 1)],
  term ((91339512975 : Rat) / 180133946068) [(2, 2), (7, 2), (10, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(2, 2), (7, 2), (10, 1), (12, 1)],
  term ((559401136785 : Rat) / 45033486517) [(2, 2), (7, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((903056220675 : Rat) / 180133946068) [(2, 2), (7, 2), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(2, 2), (7, 2), (16, 1)],
  term ((6713587775319 : Rat) / 90066973034) [(2, 2), (8, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((506198322402 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((571563488916 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-756711556203 : Rat) / 90066973034) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((627322886004 : Rat) / 45033486517) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9260117213880 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (15, 2)],
  term ((319429694670 : Rat) / 45033486517) [(2, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(2, 2), (8, 1), (10, 1), (16, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2284181045781 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-141982542184275 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-29567890602 : Rat) / 45033486517) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5778723186099 : Rat) / 90066973034) [(2, 2), (8, 1), (11, 2)],
  term ((-5168922793781 : Rat) / 180133946068) [(2, 2), (8, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(2, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12289330278489 : Rat) / 45033486517) [(2, 2), (8, 1), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 180133946068) [(2, 2), (8, 1), (12, 1), (16, 1)],
  term ((-23144241521980 : Rat) / 45033486517) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 90066973034) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39957426240563 : Rat) / 45033486517) [(2, 2), (8, 1), (15, 2)],
  term ((301737198393 : Rat) / 180133946068) [(2, 2), (8, 1), (16, 1)],
  term ((-221870322501 : Rat) / 45033486517) [(2, 2), (8, 2)],
  term ((89484995937 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 1), (13, 1)],
  term ((-280105091682 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(2, 2), (8, 2), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(2, 2), (8, 2), (12, 1)],
  term ((1675466298558 : Rat) / 45033486517) [(2, 2), (8, 2), (13, 1), (15, 1)],
  term ((-569278161468 : Rat) / 45033486517) [(2, 2), (8, 2), (15, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4851246627951 : Rat) / 180133946068) [(2, 2), (9, 1), (11, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6859465988367 : Rat) / 45033486517) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((24622302836829 : Rat) / 180133946068) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-77521178935289 : Rat) / 360267892136) [(2, 2), (9, 1), (13, 1)],
  term ((-27327360761499 : Rat) / 180133946068) [(2, 2), (9, 1), (15, 1)],
  term ((319429694670 : Rat) / 45033486517) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2135664294747 : Rat) / 45033486517) [(2, 2), (9, 2)],
  term ((-408880257516 : Rat) / 45033486517) [(2, 2), (9, 2), (10, 1)],
  term ((449085598434 : Rat) / 45033486517) [(2, 2), (9, 2), (12, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(2, 2), (10, 1), (12, 1), (15, 2)],
  term ((30269118350 : Rat) / 45033486517) [(2, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23322085193004 : Rat) / 45033486517) [(2, 2), (10, 1), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(2, 2), (10, 1), (16, 1)],
  term ((-16309393213602 : Rat) / 45033486517) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((548674012461 : Rat) / 45033486517) [(2, 2), (11, 1), (13, 1)],
  term ((74957798226150 : Rat) / 45033486517) [(2, 2), (11, 1), (15, 1)],
  term ((1434809750093 : Rat) / 90066973034) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4938066112149 : Rat) / 45033486517) [(2, 2), (11, 2)],
  term ((4855604559560 : Rat) / 45033486517) [(2, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((76316419620075 : Rat) / 90066973034) [(2, 2), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 90066973034) [(2, 2), (12, 1), (16, 1)],
  term ((-216358771534215 : Rat) / 180133946068) [(2, 2), (13, 1), (15, 1)],
  term ((75672795875 : Rat) / 45033486517) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40107365400593 : Rat) / 45033486517) [(2, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(2, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(2, 2), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8339643840051 : Rat) / 180133946068) [(3, 2), (7, 1), (11, 1)],
  term ((2052455979501 : Rat) / 90066973034) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((82433994683382 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1457467496037 : Rat) / 45033486517) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((-621305782731 : Rat) / 90066973034) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((466751362500 : Rat) / 45033486517) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-20443448739699 : Rat) / 180133946068) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((87100421001741 : Rat) / 360267892136) [(3, 2), (7, 1), (13, 1)],
  term ((-79519059691308 : Rat) / 45033486517) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-55250710078701 : Rat) / 180133946068) [(3, 2), (7, 1), (15, 1)],
  term ((-1123698624087 : Rat) / 45033486517) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((3508535951397 : Rat) / 180133946068) [(3, 2), (7, 2)],
  term ((-827016877386 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((18303975000 : Rat) / 45033486517) [(3, 2), (7, 2), (8, 1), (16, 1)],
  term ((91339512975 : Rat) / 180133946068) [(3, 2), (7, 2), (10, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(3, 2), (7, 2), (10, 1), (12, 1)],
  term ((559401136785 : Rat) / 45033486517) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((903056220675 : Rat) / 180133946068) [(3, 2), (7, 2), (12, 1)],
  term ((-528954632460 : Rat) / 45033486517) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(3, 2), (7, 2), (16, 1)],
  term ((6713587775319 : Rat) / 90066973034) [(3, 2), (8, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-272471021838 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((506198322402 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((571563488916 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-756711556203 : Rat) / 90066973034) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((627322886004 : Rat) / 45033486517) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((100579066131 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-201158132262 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9260117213880 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (15, 2)],
  term ((319429694670 : Rat) / 45033486517) [(3, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-301737198393 : Rat) / 180133946068) [(3, 2), (8, 1), (10, 1), (16, 1)],
  term ((10133655060114 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2284181045781 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((-141982542184275 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-29567890602 : Rat) / 45033486517) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5778723186099 : Rat) / 90066973034) [(3, 2), (8, 1), (11, 2)],
  term ((-5168922793781 : Rat) / 180133946068) [(3, 2), (8, 1), (12, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(3, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12289330278489 : Rat) / 45033486517) [(3, 2), (8, 1), (12, 1), (15, 2)],
  term ((-502895330655 : Rat) / 180133946068) [(3, 2), (8, 1), (12, 1), (16, 1)],
  term ((-23144241521980 : Rat) / 45033486517) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((502895330655 : Rat) / 90066973034) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((39957426240563 : Rat) / 45033486517) [(3, 2), (8, 1), (15, 2)],
  term ((301737198393 : Rat) / 180133946068) [(3, 2), (8, 1), (16, 1)],
  term ((-221870322501 : Rat) / 45033486517) [(3, 2), (8, 2)],
  term ((89484995937 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 1), (13, 1)],
  term ((-280105091682 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 1), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(3, 2), (8, 2), (11, 2)],
  term ((-89484995937 : Rat) / 90066973034) [(3, 2), (8, 2), (12, 1)],
  term ((1675466298558 : Rat) / 45033486517) [(3, 2), (8, 2), (13, 1), (15, 1)],
  term ((-569278161468 : Rat) / 45033486517) [(3, 2), (8, 2), (15, 2)],
  term ((-3292044074766 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((3850645679331 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((3703643234028 : Rat) / 45033486517) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-159714847335 : Rat) / 90066973034) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4851246627951 : Rat) / 180133946068) [(3, 2), (9, 1), (11, 1)],
  term ((-265368762711 : Rat) / 90066973034) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13718931976734 : Rat) / 45033486517) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6859465988367 : Rat) / 45033486517) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((24622302836829 : Rat) / 180133946068) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-77521178935289 : Rat) / 360267892136) [(3, 2), (9, 1), (13, 1)],
  term ((-27327360761499 : Rat) / 180133946068) [(3, 2), (9, 1), (15, 1)],
  term ((319429694670 : Rat) / 45033486517) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2135664294747 : Rat) / 45033486517) [(3, 2), (9, 2)],
  term ((-408880257516 : Rat) / 45033486517) [(3, 2), (9, 2), (10, 1)],
  term ((449085598434 : Rat) / 45033486517) [(3, 2), (9, 2), (12, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(3, 2), (10, 1), (12, 1), (15, 2)],
  term ((30269118350 : Rat) / 45033486517) [(3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23322085193004 : Rat) / 45033486517) [(3, 2), (10, 1), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(3, 2), (10, 1), (16, 1)],
  term ((-16309393213602 : Rat) / 45033486517) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((548674012461 : Rat) / 45033486517) [(3, 2), (11, 1), (13, 1)],
  term ((74957798226150 : Rat) / 45033486517) [(3, 2), (11, 1), (15, 1)],
  term ((1434809750093 : Rat) / 90066973034) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4938066112149 : Rat) / 45033486517) [(3, 2), (11, 2)],
  term ((4855604559560 : Rat) / 45033486517) [(3, 2), (12, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((76316419620075 : Rat) / 90066973034) [(3, 2), (12, 1), (15, 2)],
  term ((-75672795875 : Rat) / 90066973034) [(3, 2), (12, 1), (16, 1)],
  term ((-216358771534215 : Rat) / 180133946068) [(3, 2), (13, 1), (15, 1)],
  term ((75672795875 : Rat) / 45033486517) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-40107365400593 : Rat) / 45033486517) [(3, 2), (15, 2)],
  term ((3119130001407 : Rat) / 90066973034) [(3, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(3, 2), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8339643840051 : Rat) / 180133946068) [(7, 1), (10, 2), (11, 1)],
  term ((-2052455979501 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-82433994683382 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((621305782731 : Rat) / 90066973034) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((20443448739699 : Rat) / 180133946068) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-87100421001741 : Rat) / 360267892136) [(7, 1), (10, 2), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((55250710078701 : Rat) / 180133946068) [(7, 1), (10, 2), (15, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((20443448739699 : Rat) / 180133946068) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-87100421001741 : Rat) / 360267892136) [(7, 1), (11, 2), (13, 1)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((55250710078701 : Rat) / 180133946068) [(7, 1), (11, 2), (15, 1)],
  term ((1123698624087 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8339643840051 : Rat) / 180133946068) [(7, 1), (11, 3)],
  term ((-2052455979501 : Rat) / 90066973034) [(7, 1), (11, 3), (12, 1)],
  term ((-82433994683382 : Rat) / 45033486517) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((1457467496037 : Rat) / 45033486517) [(7, 1), (11, 3), (15, 2)],
  term ((621305782731 : Rat) / 90066973034) [(7, 1), (11, 3), (16, 1)],
  term ((827016877386 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((827016877386 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-18303975000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 3), (13, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(7, 2), (10, 1), (11, 2)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 2), (12, 1)],
  term ((-3508535951397 : Rat) / 180133946068) [(7, 2), (10, 2)],
  term ((-559401136785 : Rat) / 45033486517) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((-903056220675 : Rat) / 180133946068) [(7, 2), (10, 2), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (10, 2), (16, 1)],
  term ((-91339512975 : Rat) / 180133946068) [(7, 2), (10, 3)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 3), (12, 1)],
  term ((-3508535951397 : Rat) / 180133946068) [(7, 2), (11, 2)],
  term ((-903056220675 : Rat) / 180133946068) [(7, 2), (11, 2), (12, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (11, 2), (16, 1)],
  term ((-559401136785 : Rat) / 45033486517) [(7, 2), (11, 3), (13, 1)],
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (11, 3), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (13, 1)],
  term ((272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 1), (11, 3)],
  term ((-506198322402 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((756711556203 : Rat) / 90066973034) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((-627322886004 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (11, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (13, 1)],
  term ((272471021838 : Rat) / 45033486517) [(8, 1), (9, 1), (10, 3), (15, 1)],
  term ((-571563488916 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((756711556203 : Rat) / 90066973034) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-627322886004 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-506198322402 : Rat) / 45033486517) [(8, 1), (9, 1), (11, 3)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9260117213880 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2)],
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 1), (11, 3), (15, 1)],
  term ((-6713587775319 : Rat) / 90066973034) [(8, 1), (10, 2)],
  term ((-10133655060114 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2284181045781 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((141982542184275 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((29567890602 : Rat) / 45033486517) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5778723186099 : Rat) / 90066973034) [(8, 1), (10, 2), (11, 2)],
  term ((5168922793781 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (13, 1), (15, 1)],
  term ((12289330278489 : Rat) / 45033486517) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 180133946068) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((23144241521980 : Rat) / 45033486517) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39957426240563 : Rat) / 45033486517) [(8, 1), (10, 2), (15, 2)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (10, 2), (16, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (11, 1), (15, 1)],
  term ((-100579066131 : Rat) / 45033486517) [(8, 1), (10, 3), (12, 1), (16, 1)],
  term ((268454987811 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1)],
  term ((201158132262 : Rat) / 45033486517) [(8, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-9260117213880 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2)],
  term ((-319429694670 : Rat) / 45033486517) [(8, 1), (10, 3), (15, 2), (16, 1)],
  term ((301737198393 : Rat) / 180133946068) [(8, 1), (10, 3), (16, 1)],
  term ((-6713587775319 : Rat) / 90066973034) [(8, 1), (11, 2)],
  term ((5168922793781 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((12289330278489 : Rat) / 45033486517) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((502895330655 : Rat) / 180133946068) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((23144241521980 : Rat) / 45033486517) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-502895330655 : Rat) / 90066973034) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39957426240563 : Rat) / 45033486517) [(8, 1), (11, 2), (15, 2)],
  term ((-301737198393 : Rat) / 180133946068) [(8, 1), (11, 2), (16, 1)],
  term ((-10133655060114 : Rat) / 45033486517) [(8, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2284181045781 : Rat) / 90066973034) [(8, 1), (11, 3), (13, 1)],
  term ((141982542184275 : Rat) / 90066973034) [(8, 1), (11, 3), (15, 1)],
  term ((29567890602 : Rat) / 45033486517) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5778723186099 : Rat) / 90066973034) [(8, 1), (11, 4)],
  term ((221870322501 : Rat) / 45033486517) [(8, 2), (10, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (13, 1)],
  term ((280105091682 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 1), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (10, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 2), (10, 2), (12, 1)],
  term ((-1675466298558 : Rat) / 45033486517) [(8, 2), (10, 2), (13, 1), (15, 1)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (10, 2), (15, 2)],
  term ((221870322501 : Rat) / 45033486517) [(8, 2), (11, 2)],
  term ((89484995937 : Rat) / 90066973034) [(8, 2), (11, 2), (12, 1)],
  term ((-1675466298558 : Rat) / 45033486517) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((569278161468 : Rat) / 45033486517) [(8, 2), (11, 2), (15, 2)],
  term ((-89484995937 : Rat) / 45033486517) [(8, 2), (11, 3), (13, 1)],
  term ((280105091682 : Rat) / 45033486517) [(8, 2), (11, 3), (15, 1)],
  term ((-268454987811 : Rat) / 45033486517) [(8, 2), (11, 4)],
  term ((-3850645679331 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 1), (11, 3)],
  term ((4851246627951 : Rat) / 180133946068) [(9, 1), (10, 2), (11, 1)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-24622302836829 : Rat) / 180133946068) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((77521178935289 : Rat) / 360267892136) [(9, 1), (10, 2), (13, 1)],
  term ((27327360761499 : Rat) / 180133946068) [(9, 1), (10, 2), (15, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (11, 1)],
  term ((-3850645679331 : Rat) / 45033486517) [(9, 1), (10, 3), (12, 1), (15, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(9, 1), (10, 3), (13, 1)],
  term ((-3703643234028 : Rat) / 45033486517) [(9, 1), (10, 3), (15, 1)],
  term ((159714847335 : Rat) / 90066973034) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-24622302836829 : Rat) / 180133946068) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((77521178935289 : Rat) / 360267892136) [(9, 1), (11, 2), (13, 1)],
  term ((27327360761499 : Rat) / 180133946068) [(9, 1), (11, 2), (15, 1)],
  term ((-319429694670 : Rat) / 45033486517) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4851246627951 : Rat) / 180133946068) [(9, 1), (11, 3)],
  term ((265368762711 : Rat) / 90066973034) [(9, 1), (11, 3), (12, 1)],
  term ((13718931976734 : Rat) / 45033486517) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-6859465988367 : Rat) / 45033486517) [(9, 1), (11, 3), (15, 2)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 1), (11, 2)],
  term ((-2135664294747 : Rat) / 45033486517) [(9, 2), (10, 2)],
  term ((-449085598434 : Rat) / 45033486517) [(9, 2), (10, 2), (12, 1)],
  term ((408880257516 : Rat) / 45033486517) [(9, 2), (10, 3)],
  term ((-2135664294747 : Rat) / 45033486517) [(9, 2), (11, 2)],
  term ((-449085598434 : Rat) / 45033486517) [(9, 2), (11, 2), (12, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 1), (11, 2), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 3), (15, 1)],
  term ((16309393213602 : Rat) / 45033486517) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(10, 2), (11, 1), (13, 1)],
  term ((-74957798226150 : Rat) / 45033486517) [(10, 2), (11, 1), (15, 1)],
  term ((-1434809750093 : Rat) / 90066973034) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((4938066112149 : Rat) / 45033486517) [(10, 2), (11, 2)],
  term ((-4855604559560 : Rat) / 45033486517) [(10, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-76316419620075 : Rat) / 90066973034) [(10, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(10, 2), (12, 1), (16, 1)],
  term ((216358771534215 : Rat) / 180133946068) [(10, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((40107365400593 : Rat) / 45033486517) [(10, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(10, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(10, 2), (16, 1)],
  term ((-3292044074766 : Rat) / 45033486517) [(10, 3), (11, 1), (15, 1)],
  term ((-12351476306976 : Rat) / 45033486517) [(10, 3), (12, 1), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 3), (12, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((23322085193004 : Rat) / 45033486517) [(10, 3), (15, 2)],
  term ((521418493026 : Rat) / 45033486517) [(10, 3), (15, 2), (16, 1)],
  term ((45403677525 : Rat) / 90066973034) [(10, 3), (16, 1)],
  term ((-4855604559560 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-76316419620075 : Rat) / 90066973034) [(11, 2), (12, 1), (15, 2)],
  term ((75672795875 : Rat) / 90066973034) [(11, 2), (12, 1), (16, 1)],
  term ((216358771534215 : Rat) / 180133946068) [(11, 2), (13, 1), (15, 1)],
  term ((-75672795875 : Rat) / 45033486517) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((40107365400593 : Rat) / 45033486517) [(11, 2), (15, 2)],
  term ((-3119130001407 : Rat) / 90066973034) [(11, 2), (15, 2), (16, 1)],
  term ((-45403677525 : Rat) / 90066973034) [(11, 2), (16, 1)],
  term ((16309393213602 : Rat) / 45033486517) [(11, 3), (12, 1), (15, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 3), (13, 1)],
  term ((-74957798226150 : Rat) / 45033486517) [(11, 3), (15, 1)],
  term ((-1434809750093 : Rat) / 90066973034) [(11, 3), (15, 1), (16, 1)],
  term ((4938066112149 : Rat) / 45033486517) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 400 through 496. -/
theorem ep_Q2_054_block_01_0400_0496_valid :
    checkProductSumEq ep_Q2_054_partials_01_0400_0496
      ep_Q2_054_block_01_0400_0496 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
