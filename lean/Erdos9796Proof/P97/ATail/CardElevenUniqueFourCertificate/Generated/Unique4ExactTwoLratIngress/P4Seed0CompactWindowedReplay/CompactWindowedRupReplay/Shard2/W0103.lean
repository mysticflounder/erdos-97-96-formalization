/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0329
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0330

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0103

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/43ce818345e9e73aef9fdf1a7f642b123eed1c2e0fe6eb2e7d999976f552344f.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0329.text actionText
      Checkpoint.C0330.text = true := by
  unfold n Checkpoint.C0329.text actionText Checkpoint.C0330.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0329.text)
      (formulaOfCompact (n := n) Checkpoint.C0330.text) :=
  checkRebaseCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0103
