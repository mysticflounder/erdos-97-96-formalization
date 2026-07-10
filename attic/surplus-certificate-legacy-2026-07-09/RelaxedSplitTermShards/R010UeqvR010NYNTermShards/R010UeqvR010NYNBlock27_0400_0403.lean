/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R010UeqvR010NYNGenerators

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 27:400-403

This generated module checks one bounded coefficient-generator product from an
internally sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Checked product block for generator 27, coefficient terms 400
through 403. -/
def rs_R010_ueqv_R010NYN_block_27_0400_0403 :
    VerifiedProductBlock rs_R010_ueqv_R010NYN_generators :=
  { generatorIndex := ⟨27, by native_decide⟩
    coefficient :=
[
  term ((1211904 : Rat) / 2995) [(14, 1), (15, 2)],
  term ((-267 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((102688 : Rat) / 2995) [(15, 2)],
  term ((-33 : Rat) / 10) [(15, 2), (16, 1)]
]
    product :=
[
  term ((205376 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((-33 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2423808 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2423808 : Rat) / 2995) [(13, 1), (14, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((205376 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((-33 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((-1211904 : Rat) / 2995) [(14, 1), (15, 4)],
  term ((267 : Rat) / 5) [(14, 1), (15, 4), (16, 1)],
  term ((-102688 : Rat) / 2995) [(14, 2), (15, 2)],
  term ((33 : Rat) / 10) [(14, 2), (15, 2), (16, 1)],
  term ((-1211904 : Rat) / 2995) [(14, 3), (15, 2)],
  term ((267 : Rat) / 5) [(14, 3), (15, 2), (16, 1)],
  term ((-102688 : Rat) / 2995) [(15, 4)],
  term ((33 : Rat) / 10) [(15, 4), (16, 1)]
]
    valid := by native_decide }

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
