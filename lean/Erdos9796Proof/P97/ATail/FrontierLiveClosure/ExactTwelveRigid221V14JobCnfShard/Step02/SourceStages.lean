/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.SourceOrderBound

/-!
# Compact source-Sinz assignment stages

These opaque stages expose the fixed five-step source-counter fold without
forcing downstream preservation proofs to normalize the complete fold at once.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open SafeCoverCnf

def sourceSinzStage0 (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  sinzExt σ (sourceBlockerVars cell 0) 1 (sourceSinzBase cell 0)

def sourceSinzStage1 (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  sinzExt (sourceSinzStage0 cell σ) (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)

def sourceSinzStage2 (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  sinzExt (sourceSinzStage1 cell σ) (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2)

def sourceSinzStage3 (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  sinzExt (sourceSinzStage2 cell σ) (sourceBlockerVars cell 3) 1
    (sourceSinzBase cell 3)

def sourceSinzStage4 (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  sinzExt (sourceSinzStage3 cell σ) (sourceBlockerVars cell 4) 1
    (sourceSinzBase cell 4)

theorem sourceSinzAssign_eq_stage4 (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) :
    sourceSinzAssign cell σ = sourceSinzStage4 cell σ := by
  rfl

theorem sourceSinzStage1_eq_stage0_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ sourceSinzBase cell 0 + (sourceBlockerVars cell 0).length) :
    sourceSinzStage1 cell σ v = sourceSinzStage0 cell σ v := by
  unfold sourceSinzStage1
  apply sinzExt_le
  exact hv.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
    (i := (1 : Fin 5)) (j := (0 : Fin 5)) (by decide))

theorem sourceSinzStage2_eq_stage1_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ sourceSinzBase cell 0 + (sourceBlockerVars cell 0).length) :
    sourceSinzStage2 cell σ v = sourceSinzStage1 cell σ v := by
  unfold sourceSinzStage2
  apply sinzExt_le
  exact hv.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
    (i := (2 : Fin 5)) (j := (0 : Fin 5)) (by decide))

theorem sourceSinzStage3_eq_stage2_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ sourceSinzBase cell 0 + (sourceBlockerVars cell 0).length) :
    sourceSinzStage3 cell σ v = sourceSinzStage2 cell σ v := by
  unfold sourceSinzStage3
  apply sinzExt_le
  exact hv.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
    (i := (3 : Fin 5)) (j := (0 : Fin 5)) (by decide))

theorem sourceSinzStage4_eq_stage3_of_le
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) (v : Nat)
    (hv : v ≤ sourceSinzBase cell 0 + (sourceBlockerVars cell 0).length) :
    sourceSinzStage4 cell σ v = sourceSinzStage3 cell σ v := by
  unfold sourceSinzStage4
  apply sinzExt_le
  exact hv.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
    (i := (4 : Fin 5)) (j := (0 : Fin 5)) (by decide))

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
