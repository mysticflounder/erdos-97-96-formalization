/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Checkpoint.C0003

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0002

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/8346041f99bc1915c7767faf4061c4504442576edf7289ef9d05d6682cd4ce08.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkTerminalCompact (n := n)
      Checkpoint.C0003.text actionText = true := by
  unfold n Checkpoint.C0003.text actionText
  native_decide

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0003.text) :=
  checkTerminalCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0002
