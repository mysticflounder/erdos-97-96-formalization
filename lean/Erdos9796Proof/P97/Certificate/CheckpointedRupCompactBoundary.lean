/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRupCompact

/-!
# Opaque compact boundaries for checkpointed RUP windows

Large decoded arrays are expensive to retain in exported theorem signatures.
This module names the formula denoted by a compact ASCII85 string, so adjacent
independently compiled windows can share a compact checkpoint constant and
compose their semantic results without replay or expanded array terms.
-/

set_option warningAsError true

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.CheckpointedRup.CompactBoundary

open Problem97.CheckpointedRup
open Problem97.CheckpointedRup.CompactIngress

/-- The formula denoted by compact ASCII85 data, or the empty fallback. -/
def formulaOfCompact {n : Nat} (text : String) : DefaultFormula n :=
  DefaultFormula.ofArray ((parseFormula (n := n) text).getD #[])

/--
A successful compact rebase replay implies the formulas named by its compact
endpoints. Decoded arrays do not occur in the exported theorem type.
-/
theorem checkRebaseCompact_sound_of_compact {n : Nat}
    {startText actionText checkpointText : String}
    (h : checkRebaseCompact (n := n) startText actionText checkpointText = true) :
    Limplies (PosFin n) (formulaOfCompact (n := n) startText)
      (formulaOfCompact (n := n) checkpointText) := by
  obtain ⟨package, hpackage, himp⟩ := checkRebaseCompact_sound h
  cases hStart : parseFormula (n := n) startText with
  | none =>
      simp [parseRebasePackage, hStart] at hpackage
  | some start =>
      cases hActions : parseActions (n := n) start.size actionText with
      | none =>
          simp [parseRebasePackage, hStart, hActions] at hpackage
      | some actions =>
          cases hCheckpoint : parseFormula (n := n) checkpointText with
          | none =>
              simp [parseRebasePackage, hStart, hCheckpoint] at hpackage
          | some checkpoint =>
              simp [parseRebasePackage, hStart, hActions, hCheckpoint] at hpackage
              subst package
              simpa [formulaOfCompact, hStart, hCheckpoint] using himp

/--
A successful compact terminal replay makes the formula named by its compact
start data unsatisfiable, without an expanded decoded-array boundary.
-/
theorem checkTerminalCompact_sound_of_compact {n : Nat}
    {startText actionText : String}
    (h : checkTerminalCompact (n := n) startText actionText = true) :
    Unsatisfiable (PosFin n) (formulaOfCompact (n := n) startText) := by
  obtain ⟨package, hpackage, hunsat⟩ := checkTerminalCompact_sound h
  cases hStart : parseFormula (n := n) startText with
  | none =>
      simp [parseTerminalPackage, hStart] at hpackage
  | some start =>
      cases hActions : parseActions (n := n) start.size actionText with
      | none =>
          simp [parseTerminalPackage, hStart, hActions] at hpackage
      | some actions =>
          simp [parseTerminalPackage, hStart, hActions] at hpackage
          subst package
          simpa [formulaOfCompact, hStart] using hunsat

/-- Compose imported compact rebase-window facts without parsing or replay. -/
theorem composeRebaseCompact {n : Nat} {start middle finish : String}
    (hFirst :
      Limplies (PosFin n) (formulaOfCompact (n := n) start)
        (formulaOfCompact (n := n) middle))
    (hSecond :
      Limplies (PosFin n) (formulaOfCompact (n := n) middle)
        (formulaOfCompact (n := n) finish)) :
    Limplies (PosFin n) (formulaOfCompact (n := n) start)
      (formulaOfCompact (n := n) finish) :=
  Limplies.trans (formulaOfCompact (n := n) start)
    (formulaOfCompact (n := n) middle) (formulaOfCompact (n := n) finish)
    hFirst hSecond

/-- Transfer terminal unsatisfiability through an imported compact rebase fact. -/
theorem closeRebaseCompact {n : Nat} {start checkpoint : String}
    (hRebase :
      Limplies (PosFin n) (formulaOfCompact (n := n) start)
        (formulaOfCompact (n := n) checkpoint))
    (hTerminal :
      Unsatisfiable (PosFin n) (formulaOfCompact (n := n) checkpoint)) :
    Unsatisfiable (PosFin n) (formulaOfCompact (n := n) start) :=
  limplies_unsat (formulaOfCompact (n := n) checkpoint)
    (formulaOfCompact (n := n) start) hRebase hTerminal

end Problem97.CheckpointedRup.CompactBoundary
