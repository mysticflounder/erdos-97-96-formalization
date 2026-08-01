/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Checkpoint.C0001
import CompactWindowedRupReplay.Checkpoint.C0002

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard1.W0002

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/9951808c22aae528c9b457b20149ccde64a11ac912b8f823cad7e9e55c0c30e6.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0001.text actionText
      Checkpoint.C0002.text = true := by
  unfold n Checkpoint.C0001.text actionText Checkpoint.C0002.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0001.text)
      (formulaOfCompact (n := n) Checkpoint.C0002.text) :=
  checkRebaseCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard1.W0002
