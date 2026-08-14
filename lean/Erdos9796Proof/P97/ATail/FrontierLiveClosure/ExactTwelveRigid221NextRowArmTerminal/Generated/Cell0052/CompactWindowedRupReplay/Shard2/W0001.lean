/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0052.CompactWindowedRupReplay.Checkpoint.C0001

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactTwelveRigid221NextRowArmCell0052Replay.Shard2.W0001

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/cd33ac67c9d775ab9c915df793795d5b4439a0d2c50be1f987a0f1aee90ac6c9.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkTerminalCompact (n := n)
      Checkpoint.C0001.text actionText = true := by
  unfold n Checkpoint.C0001.text actionText
  native_decide

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  checkTerminalCompact_sound_of_compact accepted

end ExactTwelveRigid221NextRowArmCell0052Replay.Shard2.W0001
