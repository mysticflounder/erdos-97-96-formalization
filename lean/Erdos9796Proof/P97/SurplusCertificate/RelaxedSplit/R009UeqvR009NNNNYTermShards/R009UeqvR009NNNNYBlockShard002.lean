/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R009UeqvR009NNNNYGenerators

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, coefficient shard 2

This generated module stores bounded coefficient blocks from an internally
sharded relaxed pinned-surplus split certificate. Each block contains at most
100 coefficient terms, and its product
is computed by the shared checker.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Computed product block for generator 30, coefficient terms 300
through 310. -/
def rs_R009_ueqv_R009NNNNY_block_30_0300_0310 :
    ComputedProductBlock rs_R009_ueqv_R009NNNNY_generators :=
  { generatorIndex := 30
    coefficient :=
[
  term ((121 : Rat) / 372) [(13, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 31) [(13, 1), (15, 3), (16, 1)],
  term ((100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(13, 2), (16, 1)],
  term ((12 : Rat) / 31) [(14, 1), (15, 2), (16, 1)],
  term ((-831 : Rat) / 62) [(14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(14, 2), (16, 1)],
  term ((483 : Rat) / 62) [(15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(15, 4), (16, 1)],
  term ((463 : Rat) / 744) [(16, 1)]
] }

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
