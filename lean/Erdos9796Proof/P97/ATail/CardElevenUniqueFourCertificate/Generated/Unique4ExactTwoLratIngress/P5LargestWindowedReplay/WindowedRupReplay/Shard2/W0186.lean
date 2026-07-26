/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Checkpoint.C0368

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace WindowedRupReplay.Shard2.W0186

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.TextBoundary

private def actionText : String :=
  include_str "../../data/shard-2/window-0186/actions.lrat"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    TextIngress.checkTerminalText (n := n)
      Checkpoint.C0368.text actionText = true := by
  unfold n Checkpoint.C0368.text actionText
  native_decide

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfText (n := n) Checkpoint.C0368.text) :=
  checkTerminalText_sound_of_text accepted

end WindowedRupReplay.Shard2.W0186
