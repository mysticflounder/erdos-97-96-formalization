/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Checkpoint.C0063
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Checkpoint.C0064

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace WindowedRupReplay.Shard1.W0064

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.TextBoundary

private def actionText : String :=
  include_str "../../data/shard-1/window-0064/actions.lrat"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    TextIngress.checkRebaseText (n := n)
      Checkpoint.C0063.text actionText
      Checkpoint.C0064.text = true := by
  unfold n Checkpoint.C0063.text actionText Checkpoint.C0064.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfText (n := n) Checkpoint.C0063.text)
      (formulaOfText (n := n) Checkpoint.C0064.text) :=
  checkRebaseText_sound_of_text accepted

end WindowedRupReplay.Shard1.W0064
