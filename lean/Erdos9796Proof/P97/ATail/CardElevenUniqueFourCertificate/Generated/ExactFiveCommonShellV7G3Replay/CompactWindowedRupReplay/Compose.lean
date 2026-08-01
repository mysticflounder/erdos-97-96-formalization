/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Shard1
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.ExactFiveCommonShellV7G3Replay.CompactWindowedRupReplay.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactFiveCommonShellV7G3Replay

open Problem97.CheckpointedRup.CompactBoundary

theorem startUnsatisfiable :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text) :=
  closeRebaseCompact Shard1.sound Shard2.sound

end ExactFiveCommonShellV7G3Replay
