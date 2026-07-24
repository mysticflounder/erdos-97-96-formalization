/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import RupReplayFixture.WindowCommon

/-! # Independently checked terminal window -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture.Windowed

open Problem97.CheckpointedRup

theorem terminalAccepted :
    TextIngress.checkTerminalText (n := 3) checkpointTwoText terminalText = true := by
  decide

theorem terminalSound :
    Unsatisfiable (PosFin 3) (DefaultFormula.ofArray checkpointTwo) :=
  TextIngress.checkTerminalText_sound_of_parse checkpointTwoParsed terminalAccepted

end RupReplayFixture.Windowed
