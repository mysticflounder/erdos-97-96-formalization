/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0058.CompactWindowedRupReplay.Shard1.W0001

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactTwelveRigid221NextRowArmCell0058Replay.Shard1

open Problem97.CheckpointedRup.CompactBoundary

theorem throughW0001 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  W0001.sound

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  throughW0001

end ExactTwelveRigid221NextRowArmCell0058Replay.Shard1
