/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0071.CompactWindowedRupReplay.Shard1
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowArmTerminal.Generated.Cell0071.CompactWindowedRupReplay.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace ExactTwelveRigid221NextRowArmCell0071Replay

open Problem97.CheckpointedRup.CompactBoundary

theorem startUnsatisfiable :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text) :=
  closeRebaseCompact Shard1.sound Shard2.sound

end ExactTwelveRigid221NextRowArmCell0071Replay
