/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup
import RupReplayFixture.Common

/-! # Independently checked first RUP shard -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture

open Problem97.CheckpointedRup

/-- The first shard passes the promoted exact-checkpoint checker. -/
theorem firstAccepted : checkRebase start firstActions checkpoint = true := by
  decide

/-- The first independently checked shard implies the shared checkpoint. -/
theorem firstImpliesCheckpoint :
    Limplies (PosFin 3) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray checkpoint) :=
  checkRebase_sound firstAccepted

end RupReplayFixture
