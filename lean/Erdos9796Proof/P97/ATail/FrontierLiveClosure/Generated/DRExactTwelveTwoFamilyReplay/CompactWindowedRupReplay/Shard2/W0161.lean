/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0344
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.DRExactTwelveTwoFamilyReplay.CompactWindowedRupReplay.Checkpoint.C0345

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace DRExactTwelveTwoFamilyReplay.Shard2.W0161

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/4e133cf47754064ce986d7026981334460644c6899067541f52d81770694e1ab.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0344.text actionText
      Checkpoint.C0345.text = true := by
  unfold n Checkpoint.C0344.text actionText Checkpoint.C0345.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0344.text)
      (formulaOfCompact (n := n) Checkpoint.C0345.text) :=
  checkRebaseCompact_sound_of_compact accepted

end DRExactTwelveTwoFamilyReplay.Shard2.W0161
