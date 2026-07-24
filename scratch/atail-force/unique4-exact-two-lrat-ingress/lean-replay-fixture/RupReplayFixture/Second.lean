/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import RupReplayFixture.Common

/-! # Independently checked terminal RUP shard -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture

open Problem97.CheckpointedRup

/-- The terminal shard passes the promoted empty-clause checker. -/
theorem secondAccepted : checkTerminal checkpoint secondActions = true := by
  decide

/-- The second independently checked shard makes the shared checkpoint unsatisfiable. -/
theorem checkpointUnsatisfiable :
    Unsatisfiable (PosFin 3) (DefaultFormula.ofArray checkpoint) :=
  checkTerminal_sound secondAccepted

end RupReplayFixture
