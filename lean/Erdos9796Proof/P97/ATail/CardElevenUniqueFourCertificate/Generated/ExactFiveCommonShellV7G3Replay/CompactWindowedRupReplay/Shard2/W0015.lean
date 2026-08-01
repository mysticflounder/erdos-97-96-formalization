/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0097
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0098

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactFiveCommonShellV7G3Replay.Shard2.W0015

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/5a074d531b3e4719de1046bb87302db84641354ef5e386850c6ff5d413c54076.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0097.text actionText
      Checkpoint.C0098.text = true := by
  unfold n Checkpoint.C0097.text actionText Checkpoint.C0098.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0097.text)
      (formulaOfCompact (n := n) Checkpoint.C0098.text) :=
  checkRebaseCompact_sound_of_compact accepted

end ExactFiveCommonShellV7G3Replay.Shard2.W0015
