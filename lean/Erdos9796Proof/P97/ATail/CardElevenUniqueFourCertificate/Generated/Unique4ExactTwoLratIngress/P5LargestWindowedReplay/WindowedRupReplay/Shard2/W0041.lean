/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Checkpoint.C0223
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Checkpoint.C0224

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace WindowedRupReplay.Shard2.W0041

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.TextBoundary

private def actionText : String :=
  include_str "../../data/shard-2/window-0041/actions.lrat"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    TextIngress.checkRebaseText (n := n)
      Checkpoint.C0223.text actionText
      Checkpoint.C0224.text = true := by
  unfold n Checkpoint.C0223.text actionText Checkpoint.C0224.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfText (n := n) Checkpoint.C0223.text)
      (formulaOfText (n := n) Checkpoint.C0224.text) :=
  checkRebaseText_sound_of_text accepted

end WindowedRupReplay.Shard2.W0041
