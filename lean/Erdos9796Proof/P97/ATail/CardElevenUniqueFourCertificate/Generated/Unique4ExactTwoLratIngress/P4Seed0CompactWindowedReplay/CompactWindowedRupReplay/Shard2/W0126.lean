/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0352
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0353

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0126

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/0dd423438ae81df21162e491b07a73f114240b28844aaa68e25f2a64c44aa7d0.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0352.text actionText
      Checkpoint.C0353.text = true := by
  unfold n Checkpoint.C0352.text actionText Checkpoint.C0353.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0352.text)
      (formulaOfCompact (n := n) Checkpoint.C0353.text) :=
  checkRebaseCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0126
