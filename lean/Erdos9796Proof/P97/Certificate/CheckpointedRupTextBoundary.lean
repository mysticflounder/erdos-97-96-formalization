/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

/-!
# Opaque text boundaries for checkpointed RUP windows

The core text checker can expose caller-named parsed arrays, but large arrays
are expensive to retain in theorem signatures. This module instead names the
formula denoted by a DIMACS string without reducing the parser in the theorem
type. Adjacent independently compiled windows share the same checkpoint text
constant, so their semantic results compose without replay or expanded array
terms in their `.olean` interfaces.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.CheckpointedRup.TextBoundary

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.TextIngress

/-- The formula denoted by canonical DIMACS text, or the empty fallback. -/
def formulaOfText {n : Nat} (text : String) : DefaultFormula n :=
  DefaultFormula.ofArray ((parseDimacs (n := n) text).getD #[])

/--
A successful rebase replay implies the formula named by its checkpoint text.
The parser remains opaque in the exported theorem type.
-/
theorem checkRebaseText_sound_of_text {n : Nat}
    {startText actionText checkpointText : String}
    (h : checkRebaseText (n := n) startText actionText checkpointText = true) :
    Limplies (PosFin n) (formulaOfText (n := n) startText)
      (formulaOfText (n := n) checkpointText) := by
  obtain ⟨package, hpackage, himp⟩ := checkRebaseText_sound h
  cases hStart : parseDimacs (n := n) startText with
  | none =>
      simp [parseRebasePackage, hStart] at hpackage
  | some start =>
      cases hActions : parseActions (n := n) start.size actionText with
      | none =>
          simp [parseRebasePackage, hStart, hActions] at hpackage
      | some actions =>
          cases hCheckpoint : parseDimacs (n := n) checkpointText with
          | none =>
              simp [parseRebasePackage, hStart, hCheckpoint] at hpackage
          | some checkpoint =>
              simp [parseRebasePackage, hStart, hActions, hCheckpoint] at hpackage
              subst package
              simpa [formulaOfText, hStart, hCheckpoint] using himp

/--
A successful terminal replay makes the formula named by its start text
unsatisfiable, again without an expanded parsed-array theorem boundary.
-/
theorem checkTerminalText_sound_of_text {n : Nat}
    {startText actionText : String}
    (h : checkTerminalText (n := n) startText actionText = true) :
    Unsatisfiable (PosFin n) (formulaOfText (n := n) startText) := by
  obtain ⟨package, hpackage, hunsat⟩ := checkTerminalText_sound h
  cases hStart : parseDimacs (n := n) startText with
  | none =>
      simp [parseTerminalPackage, hStart] at hpackage
  | some start =>
      cases hActions : parseActions (n := n) start.size actionText with
      | none =>
          simp [parseTerminalPackage, hStart, hActions] at hpackage
      | some actions =>
          simp [parseTerminalPackage, hStart, hActions] at hpackage
          subst package
          simpa [formulaOfText, hStart] using hunsat

/-- Compose imported rebase-window facts without parsing or replay. -/
theorem composeRebaseText {n : Nat} {start middle finish : String}
    (hFirst :
      Limplies (PosFin n) (formulaOfText (n := n) start)
        (formulaOfText (n := n) middle))
    (hSecond :
      Limplies (PosFin n) (formulaOfText (n := n) middle)
        (formulaOfText (n := n) finish)) :
    Limplies (PosFin n) (formulaOfText (n := n) start)
      (formulaOfText (n := n) finish) :=
  Limplies.trans (formulaOfText (n := n) start)
    (formulaOfText (n := n) middle) (formulaOfText (n := n) finish)
    hFirst hSecond

/-- Transfer terminal unsatisfiability through an imported rebase fact. -/
theorem closeRebaseText {n : Nat} {start checkpoint : String}
    (hRebase :
      Limplies (PosFin n) (formulaOfText (n := n) start)
        (formulaOfText (n := n) checkpoint))
    (hTerminal :
      Unsatisfiable (PosFin n) (formulaOfText (n := n) checkpoint)) :
    Unsatisfiable (PosFin n) (formulaOfText (n := n) start) :=
  limplies_unsat (formulaOfText (n := n) checkpoint)
    (formulaOfText (n := n) start) hRebase hTerminal

end Problem97.CheckpointedRup.TextBoundary
