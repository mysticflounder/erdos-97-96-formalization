/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Generated.Balanced555DirectReplay.CompactWindowedRupReplay.Checkpoint.C0076

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Balanced555DirectReplay.Shard2.W0039

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

private def actionText : String :=
  include_str "../../data/actions/acf2038521cd5893a010695c8912b21c255762d7eea2d75a8d6f452001e48658.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
theorem accepted :
    checkTerminalCompact (n := n)
      Checkpoint.C0076.text actionText = true := by
  unfold n Checkpoint.C0076.text actionText
  native_decide

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0076.text) :=
  checkTerminalCompact_sound_of_compact accepted

end Balanced555DirectReplay.Shard2.W0039
