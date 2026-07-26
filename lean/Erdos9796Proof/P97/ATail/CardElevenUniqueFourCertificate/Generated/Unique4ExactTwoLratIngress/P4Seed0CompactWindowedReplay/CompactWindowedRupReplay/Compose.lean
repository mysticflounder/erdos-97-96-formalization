/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Shard1
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P4Seed0CompactWindowedReplay.CompactWindowedRupReplay.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay

open Problem97.CheckpointedRup.CompactBoundary

theorem startUnsatisfiable :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text) :=
  closeRebaseCompact Shard1.sound Shard2.sound

end CompactWindowedRupReplay
