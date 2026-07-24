/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import RupReplayFixture.WindowCommon

/-! # Independently checked second rebase window -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture.Windowed

open Problem97.CheckpointedRup

theorem windowTwoAccepted :
    TextIngress.checkRebaseText (n := 3)
      checkpointOneText windowTwoText checkpointTwoText = true := by
  decide

theorem windowTwoSound :
    Limplies (PosFin 3) (DefaultFormula.ofArray checkpointOne)
      (DefaultFormula.ofArray checkpointTwo) :=
  TextIngress.checkRebaseText_sound_of_parse
    checkpointOneParsed checkpointTwoParsed windowTwoAccepted

end RupReplayFixture.Windowed
