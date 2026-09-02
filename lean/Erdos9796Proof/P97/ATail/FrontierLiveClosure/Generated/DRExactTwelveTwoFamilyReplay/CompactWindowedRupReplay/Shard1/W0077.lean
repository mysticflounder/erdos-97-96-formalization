/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0076
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0077

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace DRExactTwelveTwoFamilyReplay.Shard1.W0077

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/cd062db1d0e1a890689f316e8e0811efe355f6696f2d1de5132e9cfb07ac6cd0.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0076.text actionText
      Checkpoint.C0077.text = true := by
  unfold n Checkpoint.C0076.text actionText Checkpoint.C0077.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0076.text)
      (formulaOfCompact (n := n) Checkpoint.C0077.text) :=
  checkRebaseCompact_sound_of_compact accepted

end DRExactTwelveTwoFamilyReplay.Shard1.W0077
