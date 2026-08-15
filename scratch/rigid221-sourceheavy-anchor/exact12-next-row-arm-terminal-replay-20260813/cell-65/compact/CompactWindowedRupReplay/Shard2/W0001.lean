/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Checkpoint.C0001

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0001

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/1f6e20f4985b86b03115728b4d10dc564d1ca6a75cbeedac2dd7262373a1ca21.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkTerminalCompact (n := n)
      Checkpoint.C0001.text actionText = true := by
  unfold n Checkpoint.C0001.text actionText
  native_decide

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  checkTerminalCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0001
