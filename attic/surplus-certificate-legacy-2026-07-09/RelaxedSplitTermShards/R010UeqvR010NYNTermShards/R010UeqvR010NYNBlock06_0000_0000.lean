/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNGenerators

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 6:0-0

This generated module checks one bounded coefficient-generator product from an
internally sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Checked product block for generator 6, coefficient terms 0
through 0. -/
def rs_R010_ueqv_R010NYN_block_06_0000_0000 :
    VerifiedProductBlock rs_R010_ueqv_R010NYN_generators :=
  { generatorIndex := ⟨6, by native_decide⟩
    coefficient :=
[
  term (4 : Rat) [(15, 2)]
]
    product :=
[
  term (4 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(15, 2)]
]
    valid := by native_decide }

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
