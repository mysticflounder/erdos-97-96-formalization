/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.Part_02

/-! # Ordering of source-Sinz auxiliary intervals -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

/-- The complete auxiliary interval for an earlier source ends no later than
the Sinz base of a later source. -/
theorem sourceSinzEnd_le_sourceSinzBase_of_lt
    (cell : FrozenV14JobCoordinate) {i j : Fin 5} (hji : j.val < i.val) :
    sourceSinzBase cell j + (sourceBlockerVars cell j).length ≤
      sourceSinzBase cell i := by
  rw [sourceSinzEnd_eq, sourceSinzBase_eq]
  omega

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
