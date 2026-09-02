/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0052
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0053

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard2.W0015

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/bebb072005123f1b60de90680ee92524406aad27257cfe601623803509b249fb.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0052.text actionText
      Checkpoint.C0053.text = true := by
  unfold n Checkpoint.C0052.text actionText Checkpoint.C0053.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0052.text)
      (formulaOfCompact (n := n) Checkpoint.C0053.text) :=
  checkRebaseCompact_sound_of_compact accepted

end Balanced555DirectReplay.Shard2.W0015
