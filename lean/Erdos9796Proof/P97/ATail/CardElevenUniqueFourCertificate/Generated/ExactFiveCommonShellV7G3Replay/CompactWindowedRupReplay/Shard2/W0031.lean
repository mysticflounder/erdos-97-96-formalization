/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0113
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Checkpoint.C0114

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactFiveCommonShellV7G3Replay.Shard2.W0031

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress
open Problem97.CheckpointedRup.CompactBoundary

/-- P97 ATail generated W0031 def. -/
private def actionText : String :=
  include_str "../../data/actions/a8605f49698e04f8c3201e91602e0599fbc08fcde1d9a8b812baea3d7993f57b.cpa85"

set_option maxHeartbeats 0 in
set_option maxRecDepth 2000000 in
/-- P97 ATail generated W0031 theorem. -/
theorem accepted :
    checkRebaseCompact (n := n)
      Checkpoint.C0113.text actionText
      Checkpoint.C0114.text = true := by
  unfold n Checkpoint.C0113.text actionText Checkpoint.C0114.text
  native_decide

/-- P97 ATail generated W0031 theorem. -/
theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0113.text)
      (formulaOfCompact (n := n) Checkpoint.C0114.text) :=
  checkRebaseCompact_sound_of_compact accepted

end ExactFiveCommonShellV7G3Replay.Shard2.W0031
