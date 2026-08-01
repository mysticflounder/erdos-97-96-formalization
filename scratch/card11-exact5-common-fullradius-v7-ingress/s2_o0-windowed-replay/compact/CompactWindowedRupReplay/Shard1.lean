/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Shard1.W0001
import CompactWindowedRupReplay.Shard1.W0002

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard1

open Problem97.CheckpointedRup.CompactBoundary

theorem throughW0001 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  W0001.sound

theorem throughW0002 :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0002.text) :=
  composeRebaseCompact throughW0001 W0002.sound

theorem sound :
    Limplies (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0000.text)
      (formulaOfCompact (n := n) Checkpoint.C0002.text) :=
  throughW0002

end CompactWindowedRupReplay.Shard1
