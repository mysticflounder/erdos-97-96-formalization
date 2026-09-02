/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0020
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0021

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard1.W0021

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/6e5bb1e0cadf99dbc84089b5ea16a7483680cae6557abf3bde839a88a95255ce.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0020.text actionText
      Checkpoint.C0021.text = true := by
  unfold n Checkpoint.C0020.text actionText Checkpoint.C0021.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0020.text)
      (formulaOfCompact (n := n) Checkpoint.C0021.text) :=
  checkRebaseCompact_sound_of_compact accepted

end Balanced555DirectReplay.Shard1.W0021
