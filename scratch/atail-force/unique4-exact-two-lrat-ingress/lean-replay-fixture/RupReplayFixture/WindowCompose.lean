/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import RupReplayFixture.WindowOne
import RupReplayFixture.WindowTwo
import RupReplayFixture.WindowTerminal

/-!
# Replay-free composition of three independently checked windows

This coordinator imports semantic facts only. It performs no text parsing and
invokes no certificate checker.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture.Windowed

open Problem97.CheckpointedRup

theorem startImpliesCheckpointTwo :
    Limplies (PosFin 3) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray checkpointTwo) :=
  TextIngress.composeRebase windowOneSound windowTwoSound

theorem startUnsatisfiable :
    Unsatisfiable (PosFin 3) (DefaultFormula.ofArray start) :=
  TextIngress.closeRebase startImpliesCheckpointTwo terminalSound

end RupReplayFixture.Windowed
