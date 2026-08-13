/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.SourceStages

/-!
# Preservation below the first source-Sinz boundary

The later four source counters preserve the first counter's emitted interval.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open SafeCoverCnf

theorem sourceSinzAssign_eq_local_zero_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ sourceSinzBase cell 0 + (sourceBlockerVars cell 0).length) :
    sourceSinzAssign cell σ v =
      sinzExt σ (sourceBlockerVars cell 0) 1 (sourceSinzBase cell 0) v := by
  rw [sourceSinzAssign_eq_stage4]
  rw [sourceSinzStage4_eq_stage3_of_le cell σ v hv]
  rw [sourceSinzStage3_eq_stage2_of_le cell σ v hv]
  rw [sourceSinzStage2_eq_stage1_of_le cell σ v hv]
  rw [sourceSinzStage1_eq_stage0_of_le cell σ v hv]
  rfl

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
