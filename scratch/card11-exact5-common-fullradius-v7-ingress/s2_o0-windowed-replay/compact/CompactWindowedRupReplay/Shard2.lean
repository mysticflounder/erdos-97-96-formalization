/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Shard2.W0001
import CompactWindowedRupReplay.Shard2.W0002

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2

open Problem97.CheckpointedRup.CompactBoundary

theorem throughW0001 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0002.text)
      (formulaOfCompact (n := n) Checkpoint.C0003.text) :=
  W0001.sound

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0002.text) :=
  closeRebaseCompact throughW0001 W0002.sound

end CompactWindowedRupReplay.Shard2
