/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 25:100-100

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 25 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_25_0100_0100 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 25. -/
def ep_Q2_054_coefficient_25_0100 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(15, 2), (16, 1)]
]

/-- Partial product 100 for generator 25. -/
def ep_Q2_054_partial_25_0100 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 2), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 25. -/
theorem ep_Q2_054_partial_25_0100_valid :
    mulPoly ep_Q2_054_coefficient_25_0100
        ep_Q2_054_generator_25_0100_0100 =
      ep_Q2_054_partial_25_0100 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_25_0100_0100 : List Poly :=
[
  ep_Q2_054_partial_25_0100
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_25_0100_0100 : Poly :=
[
  term ((1916578168020 : Rat) / 45033486517) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(0, 2), (15, 2), (16, 1)],
  term ((1916578168020 : Rat) / 45033486517) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(1, 2), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(8, 2), (15, 2), (16, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 100 through 100. -/
theorem ep_Q2_054_block_25_0100_0100_valid :
    checkProductSumEq ep_Q2_054_partials_25_0100_0100
      ep_Q2_054_block_25_0100_0100 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
