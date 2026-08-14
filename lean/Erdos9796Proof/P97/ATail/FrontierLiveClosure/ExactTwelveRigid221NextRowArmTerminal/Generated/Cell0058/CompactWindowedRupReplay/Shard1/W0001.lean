/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0058.CompactWindowedRupReplay.Checkpoint.C0000
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0058.CompactWindowedRupReplay.Checkpoint.C0001

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactTwelveRigid221NextRowArmCell0058Replay.Shard1.W0001

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/ecb505301bd044427dc27b8ae738836884352dcd96ec63a89aaa280b0521820d.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0000.text actionText
      Checkpoint.C0001.text = true := by
  unfold n Checkpoint.C0000.text actionText Checkpoint.C0001.text
  native_decide

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  checkRebaseCompact_sound_of_compact accepted

end ExactTwelveRigid221NextRowArmCell0058Replay.Shard1.W0001
