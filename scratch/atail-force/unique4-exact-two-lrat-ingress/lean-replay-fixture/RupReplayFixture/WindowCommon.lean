/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

/-!
# Shared text and parsed endpoints for a three-window RUP replay

Every boundary is defined once in this module. Adjacent window modules import
the same parsed array, so their soundness theorems compose definitionally.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture.Windowed

open Problem97.CheckpointedRup

def startText := "p cnf 2 3\n1 0\n-1 2 0\n-2 0\n"
def windowOneText := "4 2 0 1 2 0\n1 d 1 2 0\n"
def checkpointOneText := "p cnf 2 2\n-2 0\n2 0\n"
def windowTwoText := "3 1 0 1 2 0\n"
def checkpointTwoText := "p cnf 2 3\n-2 0\n2 0\n1 0\n"
def terminalText := "4 0 1 2 0\n"

def start : Array (Option (DefaultClause 3)) :=
  (TextIngress.parseDimacs (n := 3) startText).get (by decide)

def checkpointOne : Array (Option (DefaultClause 3)) :=
  (TextIngress.parseDimacs (n := 3) checkpointOneText).get (by decide)

def checkpointTwo : Array (Option (DefaultClause 3)) :=
  (TextIngress.parseDimacs (n := 3) checkpointTwoText).get (by decide)

theorem startParsed :
    TextIngress.parseDimacs (n := 3) startText = some start := by
  unfold start
  exact Option.eq_some_of_isSome (by decide)

theorem checkpointOneParsed :
    TextIngress.parseDimacs (n := 3) checkpointOneText = some checkpointOne := by
  unfold checkpointOne
  exact Option.eq_some_of_isSome (by decide)

theorem checkpointTwoParsed :
    TextIngress.parseDimacs (n := 3) checkpointTwoText = some checkpointTwo := by
  unfold checkpointTwo
  exact Option.eq_some_of_isSome (by decide)

end RupReplayFixture.Windowed
