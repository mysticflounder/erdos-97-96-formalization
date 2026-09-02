/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0126
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0127

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace DRExactTwelveTwoFamilyReplay.Shard1.W0127

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/7c631bda6e2c5da935688e9d9a5722a74a9f177ec9b72a0b2c8041218ce575ce.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0126.text actionText
      Checkpoint.C0127.text = true := by
  unfold n Checkpoint.C0126.text actionText Checkpoint.C0127.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0126.text)
      (formulaOfCompact (n := n) Checkpoint.C0127.text) :=
  checkRebaseCompact_sound_of_compact accepted

end DRExactTwelveTwoFamilyReplay.Shard1.W0127
