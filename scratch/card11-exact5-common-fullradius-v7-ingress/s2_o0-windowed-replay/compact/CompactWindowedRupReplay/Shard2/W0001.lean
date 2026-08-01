/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Checkpoint.C0002
import CompactWindowedRupReplay.Checkpoint.C0003

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0001

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/cf5ef05517e8445eb03b924310b8c74172b4490db099718a398cf0a064b4d4a7.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0002.text actionText
      Checkpoint.C0003.text = true := by
  unfold n Checkpoint.C0002.text actionText Checkpoint.C0003.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0002.text)
      (formulaOfCompact (n := n) Checkpoint.C0003.text) :=
  checkRebaseCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0001
