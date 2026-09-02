/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0054
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0055

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard2.W0017

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/49cff65e1f1132a96a923ab1a0700dc16a5411405e419ff7f7091f20eaf1f2f7.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0054.text actionText
      Checkpoint.C0055.text = true := by
  unfold n Checkpoint.C0054.text actionText Checkpoint.C0055.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0054.text)
      (formulaOfCompact (n := n) Checkpoint.C0055.text) :=
  checkRebaseCompact_sound_of_compact accepted

end Balanced555DirectReplay.Shard2.W0017
