/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0068
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0069

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactFiveCommonShellV7G3Replay.Shard1.W0069

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/e8964a4586b7cf37d8c78f270f75f9cc2c0520e2360e2582d227021379e89fa3.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0068.text actionText
      Checkpoint.C0069.text = true := by
  unfold n Checkpoint.C0068.text actionText Checkpoint.C0069.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0068.text)
      (formulaOfCompact (n := n) Checkpoint.C0069.text) :=
  checkRebaseCompact_sound_of_compact accepted

end ExactFiveCommonShellV7G3Replay.Shard1.W0069
