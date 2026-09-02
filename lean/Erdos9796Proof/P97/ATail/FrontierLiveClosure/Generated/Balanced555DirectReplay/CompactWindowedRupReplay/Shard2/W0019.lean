/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0056
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0057

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard2.W0019

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/a7e8e28df9bf2ae8b6c9f3af15b64702890cd355e8aa5328eaf90d1df867ecc2.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0056.text actionText
      Checkpoint.C0057.text = true := by
  unfold n Checkpoint.C0056.text actionText Checkpoint.C0057.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0056.text)
      (formulaOfCompact (n := n) Checkpoint.C0057.text) :=
  checkRebaseCompact_sound_of_compact accepted

end Balanced555DirectReplay.Shard2.W0019
