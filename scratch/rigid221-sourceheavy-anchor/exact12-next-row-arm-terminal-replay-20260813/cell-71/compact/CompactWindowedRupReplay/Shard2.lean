/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import CompactWindowedRupReplay.Shard2.W0001

open Std.Sat
open Std.Tactic.BVDecide.LRAT.Internal

namespace CompactWindowedRupReplay.Shard2

open Problem97.CheckpointedRup.CompactBoundary

theorem sound :
    Unsatisfiable (PosFin n)
      (formulaOfCompact (n := n) Checkpoint.C0001.text) :=
  W0001.sound

end CompactWindowedRupReplay.Shard2
