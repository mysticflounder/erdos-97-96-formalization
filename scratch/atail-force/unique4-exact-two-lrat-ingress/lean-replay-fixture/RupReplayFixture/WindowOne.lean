/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import RupReplayFixture.WindowCommon

/-! # Independently checked first rebase window -/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture.Windowed

open Problem97.CheckpointedRup

theorem windowOneAccepted :
    TextIngress.checkRebaseText (n := 3) startText windowOneText checkpointOneText = true := by
  decide

theorem windowOneSound :
    Limplies (PosFin 3) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray checkpointOne) :=
  TextIngress.checkRebaseText_sound_of_parse
    startParsed checkpointOneParsed windowOneAccepted

end RupReplayFixture.Windowed
