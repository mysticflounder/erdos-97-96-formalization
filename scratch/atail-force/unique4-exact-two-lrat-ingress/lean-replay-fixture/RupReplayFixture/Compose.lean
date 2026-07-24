/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import RupReplayFixture.First
import RupReplayFixture.Second

/-! # Soundness composition for separately checked RUP shards -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture

/-- The initial formula is unsatisfiable by semantic composition of the two shards. -/
theorem startUnsatisfiable :
    Unsatisfiable (PosFin 3) (DefaultFormula.ofArray start) :=
  limplies_unsat (DefaultFormula.ofArray checkpoint) (DefaultFormula.ofArray start)
    firstImpliesCheckpoint checkpointUnsatisfiable

end RupReplayFixture
