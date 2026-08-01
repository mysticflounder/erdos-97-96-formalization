/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0152
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0153

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactFiveCommonShellV7G3Replay.Shard2.W0070

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/b037db30d7d48343a8e0dc5a23aa1c8dec41cce63c216d3db9ada6d115223039.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0152.text actionText
      Checkpoint.C0153.text = true := by
  unfold n Checkpoint.C0152.text actionText Checkpoint.C0153.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0152.text)
      (formulaOfCompact (n := n) Checkpoint.C0153.text) :=
  checkRebaseCompact_sound_of_compact accepted

end ExactFiveCommonShellV7G3Replay.Shard2.W0070
