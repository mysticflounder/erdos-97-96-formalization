/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Shard1
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Generated.Unique4ExactTwoLratIngress.P5LargestWindowedReplay.WindowedRupReplay.Shard2

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace WindowedRupReplay

open Problem97.CheckpointedRup.TextBoundary

theorem startUnsatisfiable :
    Unsatisfiable (PosFin n)
      (formulaOfText (n := n) Checkpoint.C0000.text) :=
  closeRebaseText Shard1.sound Shard2.sound

end WindowedRupReplay
