/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 23:200-204

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_23_0200_0204 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0200 : Poly :=
[
  term ((233530095897682551 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 200 for generator 23. -/
def ep_Q2_020_partial_23_0200 : Poly :=
[
  term ((233530095897682551 : Rat) / 28298395017400811) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((233530095897682551 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-233530095897682551 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((-233530095897682551 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 23. -/
theorem ep_Q2_020_partial_23_0200_valid :
    mulPoly ep_Q2_020_coefficient_23_0200
        ep_Q2_020_generator_23_0200_0204 =
      ep_Q2_020_partial_23_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0201 : Poly :=
[
  term ((-258468134561443098 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 201 for generator 23. -/
def ep_Q2_020_partial_23_0201 : Poly :=
[
  term ((-516936269122886196 : Rat) / 28298395017400811) [(10, 1), (14, 2), (16, 1)],
  term ((-516936269122886196 : Rat) / 28298395017400811) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((258468134561443098 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((258468134561443098 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 23. -/
theorem ep_Q2_020_partial_23_0201_valid :
    mulPoly ep_Q2_020_coefficient_23_0201
        ep_Q2_020_generator_23_0200_0204 =
      ep_Q2_020_partial_23_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0202 : Poly :=
[
  term ((-111654401023963923 : Rat) / 28298395017400811) [(14, 2), (16, 1)]
]

/-- Partial product 202 for generator 23. -/
def ep_Q2_020_partial_23_0202 : Poly :=
[
  term ((-223308802047927846 : Rat) / 28298395017400811) [(10, 1), (14, 3), (16, 1)],
  term ((-223308802047927846 : Rat) / 28298395017400811) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((111654401023963923 : Rat) / 28298395017400811) [(14, 2), (15, 2), (16, 1)],
  term ((111654401023963923 : Rat) / 28298395017400811) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 23. -/
theorem ep_Q2_020_partial_23_0202_valid :
    mulPoly ep_Q2_020_coefficient_23_0202
        ep_Q2_020_generator_23_0200_0204 =
      ep_Q2_020_partial_23_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0203 : Poly :=
[
  term ((-4899123653804755497 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 203 for generator 23. -/
def ep_Q2_020_partial_23_0203 : Poly :=
[
  term ((-4899123653804755497 : Rat) / 28298395017400811) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4899123653804755497 : Rat) / 28298395017400811) [(11, 1), (15, 3), (16, 1)],
  term ((4899123653804755497 : Rat) / 56596790034801622) [(14, 2), (15, 2), (16, 1)],
  term ((4899123653804755497 : Rat) / 56596790034801622) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 23. -/
theorem ep_Q2_020_partial_23_0203_valid :
    mulPoly ep_Q2_020_coefficient_23_0203
        ep_Q2_020_generator_23_0200_0204 =
      ep_Q2_020_partial_23_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 23. -/
def ep_Q2_020_coefficient_23_0204 : Poly :=
[
  term ((552401434184546867 : Rat) / 28298395017400811) [(16, 1)]
]

/-- Partial product 204 for generator 23. -/
def ep_Q2_020_partial_23_0204 : Poly :=
[
  term ((1104802868369093734 : Rat) / 28298395017400811) [(10, 1), (14, 1), (16, 1)],
  term ((1104802868369093734 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)],
  term ((-552401434184546867 : Rat) / 28298395017400811) [(14, 2), (16, 1)],
  term ((-552401434184546867 : Rat) / 28298395017400811) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 23. -/
theorem ep_Q2_020_partial_23_0204_valid :
    mulPoly ep_Q2_020_coefficient_23_0204
        ep_Q2_020_generator_23_0200_0204 =
      ep_Q2_020_partial_23_0204 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_23_0200_0204 : List Poly :=
[
  ep_Q2_020_partial_23_0200,
  ep_Q2_020_partial_23_0201,
  ep_Q2_020_partial_23_0202,
  ep_Q2_020_partial_23_0203,
  ep_Q2_020_partial_23_0204
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_23_0200_0204 : Poly :=
[
  term ((233530095897682551 : Rat) / 28298395017400811) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4899123653804755497 : Rat) / 28298395017400811) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1104802868369093734 : Rat) / 28298395017400811) [(10, 1), (14, 1), (16, 1)],
  term ((-516936269122886196 : Rat) / 28298395017400811) [(10, 1), (14, 2), (16, 1)],
  term ((-223308802047927846 : Rat) / 28298395017400811) [(10, 1), (14, 3), (16, 1)],
  term ((233530095897682551 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-516936269122886196 : Rat) / 28298395017400811) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223308802047927846 : Rat) / 28298395017400811) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1104802868369093734 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)],
  term ((-4899123653804755497 : Rat) / 28298395017400811) [(11, 1), (15, 3), (16, 1)],
  term ((-233530095897682551 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((-233530095897682551 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((258468134561443098 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((5122432455852683343 : Rat) / 56596790034801622) [(14, 2), (15, 2), (16, 1)],
  term ((-552401434184546867 : Rat) / 28298395017400811) [(14, 2), (16, 1)],
  term ((258468134561443098 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((111654401023963923 : Rat) / 28298395017400811) [(14, 4), (16, 1)],
  term ((-552401434184546867 : Rat) / 28298395017400811) [(15, 2), (16, 1)],
  term ((4899123653804755497 : Rat) / 56596790034801622) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 200 through 204. -/
theorem ep_Q2_020_block_23_0200_0204_valid :
    checkProductSumEq ep_Q2_020_partials_23_0200_0204
      ep_Q2_020_block_23_0200_0204 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
