/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0343
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Checkpoint.C0344

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2.W0117

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/df29b934ae8dc6449b3040cd1f4703517d6111f92cd17e5c8f6ed809d80c5ec5.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0343.text actionText
      Checkpoint.C0344.text = true := by
  unfold n Checkpoint.C0343.text actionText Checkpoint.C0344.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0343.text)
      (formulaOfCompact (n := n) Checkpoint.C0344.text) :=
  checkRebaseCompact_sound_of_compact accepted

end CompactWindowedRupReplay.Shard2.W0117
