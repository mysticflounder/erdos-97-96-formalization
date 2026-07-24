/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

/-!
# Shared bounded input for independent checkpointed RUP replay

This is deliberately the small RUP example from the promoted checker's own
self-test, made public so the two shard modules can be compiled independently.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace RupReplayFixture

open Problem97.CheckpointedRup

def x : PosFin 3 := ⟨1, by omega⟩
def y : PosFin 3 := ⟨2, by omega⟩

theorem x_ne_y : x ≠ y := by
  intro h
  have hv := congrArg Subtype.val h
  simp [x, y] at hv

def xClause : DefaultClause 3 := DefaultClause.unit (x, true)

def notXOrY : DefaultClause 3 where
  clause := [(x, false), (y, true)]
  nodupkey := by
    intro literal
    by_cases h : literal = x
    · left
      simp [h, x_ne_y]
    · right
      simp [h]
  nodup := by simp [x_ne_y]

def notYClause : DefaultClause 3 := DefaultClause.unit (y, false)
def yClause : DefaultClause 3 := DefaultClause.unit (y, true)

def start : Array (Option (DefaultClause 3)) :=
  #[none, some xClause, some notXOrY, some notYClause]

def firstActions : List (Action 3) :=
  [.add yClause #[1, 2], .del #[1, 2]]

def checkpoint : Array (Option (DefaultClause 3)) :=
  #[none, some notYClause, some yClause]

def secondActions : List (Action 3) :=
  [.add DefaultClause.empty #[1, 2]]

end RupReplayFixture
