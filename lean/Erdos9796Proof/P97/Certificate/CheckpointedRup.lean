/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Std.Tactic.BVDecide.Reflect

/-!
# Sound two-shard checkpointed RUP checking

This module composes two pure-RUP proof shards across a compact
checkpoint. The first shard may add RUP clauses and delete old clauses. Its
active semantic clause list must then equal the checkpoint's clause list. The
second shard starts with fresh local clause identifiers and must derive the
empty clause.

The soundness result is intentionally stated as an implication. RUP additions
preserve satisfiability, while deletion weakens the active formula. Exact
semantic equality at the checkpoint is enough to transfer the second shard's
unsatisfiability result back through the first shard.

RAT additions are not part of `Action`, so this checker rejects them by
construction. `TextIngress` parses the canonical one-line-per-clause DIMACS
and pure-RUP LRAT formats emitted by the companion materializer. Shard
generation and artifact hashing remain outside this file's trust boundary.
-/

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.CheckpointedRup

/-- A supported proof action: a pure-RUP addition or a clause deletion. -/
inductive Action (n : Nat) where
  | add (clause : DefaultClause n) (hints : Array Nat)
  | del (ids : Array Nat)

namespace Action

/--
Run a list of pure-RUP actions, failing closed when an addition does not pass
the verified RUP check.
-/
def run {n : Nat} (formula : DefaultFormula n) :
    List (Action n) → Option (DefaultFormula n)
  | [] => some formula
  | .add clause hints :: rest =>
      let (next, success) := formula.performRupAdd clause hints
      if success then run next rest else none
  | .del ids :: rest => run (formula.delete ids) rest

/-- A successful action list leaves the formula ready for another RUP check. -/
theorem run_ready {n : Nat} {formula result : DefaultFormula n}
    (ready : Formula.ReadyForRupAdd formula) {actions : List (Action n)}
    (h : run formula actions = some result) : Formula.ReadyForRupAdd result := by
  induction actions generalizing formula with
  | nil =>
      simp [run] at h
      subst result
      exact ready
  | cons action rest ih =>
      cases action with
      | del ids =>
          exact ih (Formula.readyForRupAdd_delete formula ids ready) (by simpa [run] using h)
      | add clause hints =>
          simp only [run] at h
          split at h
          next success =>
            apply ih _ h
            have heq : formula.performRupAdd clause hints =
                ((formula.performRupAdd clause hints).1, true) := by
              exact Prod.ext rfl success
            have hresult :
                (formula.performRupAdd clause hints).1 = formula.insert clause :=
              Formula.rupAdd_result formula clause hints _ ready heq
            rw [hresult]
            exact Formula.readyForRupAdd_insert formula clause ready
          next failure => simp at h

/--
Every successful action list produces a formula logically implied by its
starting formula.
-/
theorem run_limplies {n : Nat} {formula result : DefaultFormula n}
    (ready : Formula.ReadyForRupAdd formula) {actions : List (Action n)}
    (h : run formula actions = some result) : Limplies (PosFin n) formula result := by
  induction actions generalizing formula with
  | nil =>
      simp [run] at h
      subst result
      exact Limplies.refl formula
  | cons action rest ih =>
      cases action with
      | del ids =>
          apply Limplies.trans formula (formula.delete ids) result
          · exact Formula.limplies_delete
          · exact ih (Formula.readyForRupAdd_delete formula ids ready) (by simpa [run] using h)
      | add clause hints =>
          simp only [run] at h
          split at h
          next success =>
            have heq : formula.performRupAdd clause hints =
                ((formula.performRupAdd clause hints).1, true) := by
              exact Prod.ext rfl success
            have hiff := Formula.rupAdd_sound formula clause hints _ ready heq
            have hresult :
                (formula.performRupAdd clause hints).1 = formula.insert clause :=
              Formula.rupAdd_result formula clause hints _ ready heq
            have readyNext :
                Formula.ReadyForRupAdd (formula.performRupAdd clause hints).1 := by
              rw [hresult]
              exact Formula.readyForRupAdd_insert formula clause ready
            apply Limplies.trans formula (formula.performRupAdd clause hints).1 result
            · exact (liff_iff_limplies_and_limplies _ _).mp hiff |>.1
            · exact ih readyNext h
          next failure => simp at h

end Action

/--
The active clauses of a formula, stripped of implementation-specific clause
proofs and deleted-array holes.
-/
def signature {n : Nat} (formula : DefaultFormula n) : List (CNF.Clause (PosFin n)) :=
  (Formula.toList formula).map Clause.toList

/-- Equal active semantic clause lists describe logically equivalent formulas. -/
theorem liff_of_signature_eq {n : Nat} {left right : DefaultFormula n}
    (h : signature left = signature right) : Liff (PosFin n) left right := by
  intro assignment
  simp only [Formula.formulaEntails_def, List.all_eq_true, decide_eq_true_eq]
  constructor
  · intro hl clause hclause
    have hs : Clause.toList clause ∈ signature right :=
      List.mem_map.mpr ⟨clause, hclause, rfl⟩
    rw [← h] at hs
    simp only [signature, List.mem_map] at hs
    rcases hs with ⟨source, hsource, heq⟩
    have := hl source hsource
    simp only [(· ⊨ ·), Clause.eval] at this ⊢
    rw [← heq]
    exact this
  · intro hr clause hclause
    have hs : Clause.toList clause ∈ signature left :=
      List.mem_map.mpr ⟨clause, hclause, rfl⟩
    rw [h] at hs
    simp only [signature, List.mem_map] at hs
    rcases hs with ⟨source, hsource, heq⟩
    have := hr source hsource
    simp only [(· ⊨ ·), Clause.eval] at this ⊢
    rw [← heq]
    exact this

/--
Check one shard and require its active semantic clauses to equal a compact
checkpoint. The checkpoint may use fresh local clause identifiers.
-/
def checkRebase {n : Nat} (start : Array (Option (DefaultClause n)))
    (actions : List (Action n)) (checkpoint : Array (Option (DefaultClause n))) : Bool :=
  let formula := DefaultFormula.ofArray start
  match Action.run formula actions with
  | none => false
  | some result => decide (signature result = signature (DefaultFormula.ofArray checkpoint))

/-- A successful rebase checkpoint is implied by the shard's starting formula. -/
theorem checkRebase_sound {n : Nat} {start : Array (Option (DefaultClause n))}
    {actions : List (Action n)} {checkpoint : Array (Option (DefaultClause n))}
    (h : checkRebase start actions checkpoint = true) :
    Limplies (PosFin n) (DefaultFormula.ofArray start) (DefaultFormula.ofArray checkpoint) := by
  simp only [checkRebase] at h
  split at h
  next => simp at h
  next result hrun =>
    simp only [decide_eq_true_eq] at h
    apply Limplies.trans (DefaultFormula.ofArray start) result (DefaultFormula.ofArray checkpoint)
    · exact Action.run_limplies (Formula.readyForRupAdd_ofArray start) hrun
    · exact (liff_iff_limplies_and_limplies _ _).mp (liff_of_signature_eq h) |>.1

/-- An active empty clause makes a formula unsatisfiable. -/
theorem unsatisfiable_of_empty_signature {n : Nat} {formula : DefaultFormula n}
    (h : ([] : CNF.Clause (PosFin n)) ∈ signature formula) :
    Unsatisfiable (PosFin n) formula := by
  intro assignment hsatisfies
  simp only [Formula.formulaEntails_def, List.all_eq_true, decide_eq_true_eq] at hsatisfies
  simp only [signature, List.mem_map] at h
  rcases h with ⟨clause, hclause, heq⟩
  have := hsatisfies clause hclause
  simp only [(· ⊨ ·), Clause.eval] at this
  rw [heq] at this
  simp at this

/-- Check a final shard and require it to derive the empty clause by RUP. -/
def checkTerminal {n : Nat} (start : Array (Option (DefaultClause n)))
    (actions : List (Action n)) : Bool :=
  let formula := DefaultFormula.ofArray start
  match Action.run formula actions with
  | none => false
  | some result => decide (([] : CNF.Clause (PosFin n)) ∈ signature result)

/-- A successful terminal shard proves its starting formula unsatisfiable. -/
theorem checkTerminal_sound {n : Nat} {start : Array (Option (DefaultClause n))}
    {actions : List (Action n)} (h : checkTerminal start actions = true) :
    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start) := by
  simp only [checkTerminal] at h
  split at h
  next => simp at h
  next result hrun =>
    simp only [decide_eq_true_eq] at h
    exact limplies_unsat result (DefaultFormula.ofArray start)
      (Action.run_limplies (Formula.readyForRupAdd_ofArray start) hrun)
      (unsatisfiable_of_empty_signature h)

/--
Check two sequential pure-RUP shards separated by an exact compact checkpoint.
-/
def checkTwo {n : Nat} (start : Array (Option (DefaultClause n)))
    (first : List (Action n)) (checkpoint : Array (Option (DefaultClause n)))
    (second : List (Action n)) : Bool :=
  checkRebase start first checkpoint && checkTerminal checkpoint second

/-- Soundness of the two-shard checkpointed RUP checker. -/
theorem checkTwo_sound {n : Nat} {start : Array (Option (DefaultClause n))}
    {first : List (Action n)} {checkpoint : Array (Option (DefaultClause n))}
    {second : List (Action n)} (h : checkTwo start first checkpoint second = true) :
    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start) := by
  simp only [checkTwo, Bool.and_eq_true] at h
  exact limplies_unsat (DefaultFormula.ofArray checkpoint) (DefaultFormula.ofArray start)
    (checkRebase_sound h.1) (checkTerminal_sound h.2)

namespace TextIngress

private def digitValue : Char → Option Nat
  | '0' => some 0
  | '1' => some 1
  | '2' => some 2
  | '3' => some 3
  | '4' => some 4
  | '5' => some 5
  | '6' => some 6
  | '7' => some 7
  | '8' => some 8
  | '9' => some 9
  | _ => none

private def parseNatDigits : List Char → Nat → Option Nat
  | [], value => some value
  | char :: rest, value => do
      let digit ← digitValue char
      parseNatDigits rest (10 * value + digit)

private def parseNatChars : List Char → Option Nat
  | [] => none
  | ['0'] => some 0
  | '0' :: _ => none
  | chars => parseNatDigits chars 0

/-- Parse a natural number only when it has canonical decimal spelling. -/
def parseNatCanonical (text : String) : Option Nat :=
  parseNatChars text.toList

private def parseIntChars : List Char → Option Int
  | '-' :: digits => do
      let value ← parseNatChars digits
      if value = 0 then none else some (-Int.ofNat value)
  | digits => Int.ofNat <$> parseNatChars digits

/-- Parse an integer only when it has canonical decimal spelling. -/
def parseIntCanonical (text : String) : Option Int :=
  parseIntChars text.toList

private def parsePositiveNat (chars : List Char) : Option Nat := do
  let value ← parseNatChars chars
  if value = 0 then none else some value

private def parseLiteral {n : Nat} (chars : List Char) :
    Option (Literal (PosFin n)) := do
  let (variableIndex, polarity) ←
    match chars with
    | '-' :: digits => do
        let value ← parsePositiveNat digits
        pure (value, false)
    | digits => do
        let value ← parsePositiveNat digits
        pure (value, true)
  if hzero : 0 < variableIndex then
    if hrange : variableIndex < n then
      some (⟨variableIndex, hzero, hrange⟩, polarity)
    else
      none
  else
    none

private def parseLinesAux :
    List Char → List Char → List (List Char) → Option (List (List Char))
  | [], [], reversed => some reversed.reverse
  | [], _ :: _, _ => none
  | '\r' :: _, _, _ => none
  | '\n' :: _, [], _ => none
  | '\n' :: rest, reversedLine, reversed =>
      parseLinesAux rest [] (reversedLine.reverse :: reversed)
  | char :: rest, reversedLine, reversed =>
      parseLinesAux rest (char :: reversedLine) reversed

private def parseLines (text : String) : Option (List (List Char)) :=
  match text.toList with
  | [] => none
  | chars => parseLinesAux chars [] []

private def parseFieldsAux :
    List Char → List Char → List (List Char) → Option (List (List Char))
  | [], [], _ => none
  | [], reversedField, reversed =>
      some (reversedField.reverse :: reversed).reverse
  | ' ' :: _, [], _ => none
  | ' ' :: rest, reversedField, reversed =>
      parseFieldsAux rest [] (reversedField.reverse :: reversed)
  | char :: rest, reversedField, reversed =>
      parseFieldsAux rest (char :: reversedField) reversed

private def parseFields (line : List Char) : Option (List (List Char)) :=
  parseFieldsAux line [] []

private def splitAtZero :
    List (List Char) → Option (List (List Char) × List (List Char))
  | [] => none
  | ['0'] :: rest => some ([], rest)
  | field :: rest => do
      let (before, after) ← splitAtZero rest
      pure (field :: before, after)

private theorem pairwiseVariable_nodupkey {n : Nat}
    {literals : List (Literal (PosFin n))}
    (h : List.Pairwise (fun a b => a.1 ≠ b.1) literals) :
    ∀ l, ¬(l, true) ∈ literals ∨ ¬(l, false) ∈ literals := by
  induction literals with
  | nil => simp
  | cons head rest ih =>
      rw [List.pairwise_cons] at h
      intro l
      by_cases hv : head.1 = l
      · rcases head with ⟨v, polarity⟩
        simp only at hv
        subst v
        cases polarity with
        | false =>
            left
            have noPosRest : ¬(l, true) ∈ rest := by
              intro hmem
              exact h.1 (l, true) hmem rfl
            simp [noPosRest]
        | true =>
            right
            have noNegRest : ¬(l, false) ∈ rest := by
              intro hmem
              exact h.1 (l, false) hmem rfl
            simp [noNegRest]
      · rcases ih h.2 l with hpos | hneg
        · left
          have hhead : (l, true) ≠ head := by
            intro heq
            exact hv (congrArg Prod.fst heq).symm
          simp [hhead, hpos]
        · right
          have hhead : (l, false) ≠ head := by
            intro heq
            exact hv (congrArg Prod.fst heq).symm
          simp [hhead, hneg]

private theorem pairwiseVariable_nodup {n : Nat}
    {literals : List (Literal (PosFin n))}
    (h : List.Pairwise (fun a b => a.1 ≠ b.1) literals) :
    List.Nodup literals := by
  rw [List.nodup_iff_pairwise_ne]
  exact h.imp (fun hab heq => hab (congrArg Prod.fst heq))

private def parseClauseLiterals {n : Nat} (fields : List (List Char)) :
    Option (DefaultClause n) := do
  let literals ← fields.mapM parseLiteral
  if h : List.Pairwise (fun a b => a.1 ≠ b.1) literals then
    some
      { clause := literals
        nodupkey := pairwiseVariable_nodupkey h
        nodup := pairwiseVariable_nodup h }
  else
    none

private def parseClauseLine {n : Nat} (line : List Char) :
    Option (DefaultClause n) := do
  let fields ← parseFields line
  let (literalFields, trailing) ← splitAtZero fields
  if !trailing.isEmpty then none else parseClauseLiterals literalFields

/--
Parse the materializer's canonical DIMACS subset.

`n` is one more than the DIMACS variable count because `PosFin n` contains
the positive indices strictly below `n`. Clause identifier zero is represented
by the leading `none`.
-/
def parseDimacs {n : Nat} (text : String) :
    Option (Array (Option (DefaultClause n))) := do
  let lines ← parseLines text
  match lines with
  | [] => none
  | header :: clauseLines =>
      let headerFields ← parseFields header
      match headerFields with
      | [['p'], ['c', 'n', 'f'], variableText, clauseText] =>
          let variableCount ← parseNatChars variableText
          let clauseCount ← parseNatChars clauseText
          if variableCount + 1 != n || clauseCount != clauseLines.length then
            none
          else
            let clauses ← clauseLines.mapM parseClauseLine
            pure (#[none] ++ (clauses.map some).toArray)
      | _ => none

private def parseActionLine {n : Nat} (expectedId : Nat) (line : List Char) :
    Option (Action n × Nat) := do
  let fields ← parseFields line
  match fields with
  | ['1'] :: ['d'] :: rest =>
      let (idFields, trailing) ← splitAtZero rest
      if !trailing.isEmpty then
        none
      else
        let ids ← idFields.mapM parsePositiveNat
        pure (.del ids.toArray, expectedId)
  | actionText :: rest =>
      let actionId ← parsePositiveNat actionText
      if actionId != expectedId then
        none
      else
        let (literalFields, afterClause) ← splitAtZero rest
        let (hintFields, trailing) ← splitAtZero afterClause
        if !trailing.isEmpty then
          none
        else
          let clause ← parseClauseLiterals literalFields
          let hints ← hintFields.mapM parsePositiveNat
          pure (.add clause hints.toArray, expectedId + 1)
  | _ => none

private def parseActionLines {n : Nat} :
    Nat → List (List Char) → Option (List (Action n))
  | _, [] => some []
  | expectedId, line :: rest => do
      let (action, nextId) ← parseActionLine expectedId line
      let actions ← parseActionLines nextId rest
      pure (action :: actions)

/--
Parse canonical pure-RUP LRAT actions, requiring dense addition identifiers.
Deletion lines use the normalized materializer spelling `1 d ... 0`.
-/
def parseActions {n : Nat} (firstAdditionId : Nat) (text : String) :
    Option (List (Action n)) := do
  let lines ← parseLines text
  parseActionLines firstAdditionId lines

/-- The four semantic inputs recovered from a two-shard text package. -/
structure Package (n : Nat) where
  start : Array (Option (DefaultClause n))
  first : List (Action n)
  checkpoint : Array (Option (DefaultClause n))
  second : List (Action n)

/-- The parsed inputs needed to check only the checkpoint-producing shard. -/
structure RebasePackage (n : Nat) where
  start : Array (Option (DefaultClause n))
  actions : List (Action n)
  checkpoint : Array (Option (DefaultClause n))

/-- Parse the original CNF, first shard, and compact checkpoint. -/
def parseRebasePackage {n : Nat} (startText actionText checkpointText : String) :
    Option (RebasePackage n) := do
  let start ← parseDimacs startText
  let actions ← parseActions start.size actionText
  let checkpoint ← parseDimacs checkpointText
  pure { start, actions, checkpoint }

/-- Parse and check only the checkpoint-producing shard. -/
def checkRebaseText {n : Nat} (startText actionText checkpointText : String) : Bool :=
  match parseRebasePackage (n := n) startText actionText checkpointText with
  | none => false
  | some package => checkRebase package.start package.actions package.checkpoint

/-- A successful first-shard text replay proves implication of its checkpoint. -/
theorem checkRebaseText_sound {n : Nat} {startText actionText checkpointText : String}
    (h : checkRebaseText (n := n) startText actionText checkpointText = true) :
    ∃ package,
      parseRebasePackage (n := n) startText actionText checkpointText = some package ∧
        Limplies (PosFin n) (DefaultFormula.ofArray package.start)
          (DefaultFormula.ofArray package.checkpoint) := by
  cases hpackage :
      parseRebasePackage (n := n) startText actionText checkpointText with
  | none => simp [checkRebaseText, hpackage] at h
  | some package =>
      simp only [checkRebaseText, hpackage] at h
      exact ⟨package, rfl, checkRebase_sound h⟩

/--
Expose a successful rebase replay at caller-named parsed endpoints. Window
modules can export this implication, and a coordinator can compose the
imported implications without parsing or replaying any window.
-/
theorem checkRebaseText_sound_of_parse {n : Nat}
    {startText actionText checkpointText : String}
    {start checkpoint : Array (Option (DefaultClause n))}
    (hStart : parseDimacs (n := n) startText = some start)
    (hCheckpoint : parseDimacs (n := n) checkpointText = some checkpoint)
    (h : checkRebaseText (n := n) startText actionText checkpointText = true) :
    Limplies (PosFin n) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray checkpoint) := by
  obtain ⟨package, hpackage, himp⟩ := checkRebaseText_sound h
  cases hActions : parseActions (n := n) start.size actionText with
  | none =>
      simp [parseRebasePackage, hStart, hActions] at hpackage
  | some actions =>
      simp [parseRebasePackage, hStart, hActions, hCheckpoint] at hpackage
      subst package
      exact himp

/-- The parsed inputs needed to check only the terminal shard. -/
structure TerminalPackage (n : Nat) where
  start : Array (Option (DefaultClause n))
  actions : List (Action n)

/-- Parse a checkpoint CNF and its locally numbered terminal shard. -/
def parseTerminalPackage {n : Nat} (startText actionText : String) :
    Option (TerminalPackage n) := do
  let start ← parseDimacs startText
  let actions ← parseActions start.size actionText
  pure { start, actions }

/-- Parse and check only the empty-clause-producing terminal shard. -/
def checkTerminalText {n : Nat} (startText actionText : String) : Bool :=
  match parseTerminalPackage (n := n) startText actionText with
  | none => false
  | some package => checkTerminal package.start package.actions

/-- A successful terminal-shard text replay proves its checkpoint unsatisfiable. -/
theorem checkTerminalText_sound {n : Nat} {startText actionText : String}
    (h : checkTerminalText (n := n) startText actionText = true) :
    ∃ package,
      parseTerminalPackage (n := n) startText actionText = some package ∧
        Unsatisfiable (PosFin n) (DefaultFormula.ofArray package.start) := by
  cases hpackage : parseTerminalPackage (n := n) startText actionText with
  | none => simp [checkTerminalText, hpackage] at h
  | some package =>
      simp only [checkTerminalText, hpackage] at h
      exact ⟨package, rfl, checkTerminal_sound h⟩

/--
Expose a successful terminal replay at a caller-named parsed endpoint. A final
window module can export this theorem for a replay-free coordinator.
-/
theorem checkTerminalText_sound_of_parse {n : Nat} {startText actionText : String}
    {start : Array (Option (DefaultClause n))}
    (hStart : parseDimacs (n := n) startText = some start)
    (h : checkTerminalText (n := n) startText actionText = true) :
    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start) := by
  obtain ⟨package, hpackage, hunsat⟩ := checkTerminalText_sound h
  cases hActions : parseActions (n := n) start.size actionText with
  | none =>
      simp [parseTerminalPackage, hStart, hActions] at hpackage
  | some actions =>
      simp [parseTerminalPackage, hStart, hActions] at hpackage
      subst package
      exact hunsat

/--
Compose two imported rebase-window implications. This theorem performs no
parsing and no certificate replay.
-/
theorem composeRebase {n : Nat}
    {start middle finish : Array (Option (DefaultClause n))}
    (hFirst :
      Limplies (PosFin n) (DefaultFormula.ofArray start)
        (DefaultFormula.ofArray middle))
    (hSecond :
      Limplies (PosFin n) (DefaultFormula.ofArray middle)
        (DefaultFormula.ofArray finish)) :
    Limplies (PosFin n) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray finish) :=
  Limplies.trans (DefaultFormula.ofArray start) (DefaultFormula.ofArray middle)
    (DefaultFormula.ofArray finish) hFirst hSecond

/--
Transfer a terminal window's unsatisfiability through an imported rebase
implication. This theorem performs no parsing and no certificate replay.
-/
theorem closeRebase {n : Nat}
    {start checkpoint : Array (Option (DefaultClause n))}
    (hRebase :
      Limplies (PosFin n) (DefaultFormula.ofArray start)
        (DefaultFormula.ofArray checkpoint))
    (hTerminal : Unsatisfiable (PosFin n) (DefaultFormula.ofArray checkpoint)) :
    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start) :=
  limplies_unsat (DefaultFormula.ofArray checkpoint) (DefaultFormula.ofArray start)
    hRebase hTerminal

/-- Parse both DIMACS formulas and both locally numbered pure-RUP shards. -/
def parsePackage {n : Nat} (startText firstText checkpointText secondText : String) :
    Option (Package n) := do
  let start ← parseDimacs startText
  let first ← parseActions start.size firstText
  let checkpoint ← parseDimacs checkpointText
  let second ← parseActions checkpoint.size secondText
  pure { start, first, checkpoint, second }

/-- Parse and run the sound two-shard checker, failing closed on malformed text. -/
def checkTwoText {n : Nat} (startText firstText checkpointText secondText : String) : Bool :=
  match parsePackage (n := n) startText firstText checkpointText secondText with
  | none => false
  | some package =>
      checkTwo package.start package.first package.checkpoint package.second

/--
The combined text checker is exactly the conjunction of the independently
replayable first- and second-shard checkers.
-/
theorem checkTwoText_eq_separate {n : Nat}
    (startText firstText checkpointText secondText : String) :
    checkTwoText (n := n) startText firstText checkpointText secondText =
      (checkRebaseText (n := n) startText firstText checkpointText &&
        checkTerminalText (n := n) checkpointText secondText) := by
  cases hStart : parseDimacs (n := n) startText with
  | none => simp [checkTwoText, checkRebaseText, parsePackage, parseRebasePackage, hStart]
  | some start =>
      cases hFirst : parseActions (n := n) start.size firstText with
      | none =>
          simp [checkTwoText, checkRebaseText, parsePackage, parseRebasePackage,
            hStart, hFirst]
      | some first =>
          cases hCheckpoint : parseDimacs (n := n) checkpointText with
          | none =>
              simp [checkTwoText, checkRebaseText, checkTerminalText, parsePackage,
                parseRebasePackage, parseTerminalPackage, hStart, hCheckpoint]
          | some checkpoint =>
              cases hSecond : parseActions (n := n) checkpoint.size secondText with
              | none =>
                  simp [checkTwoText, checkRebaseText, checkTerminalText, parsePackage,
                    parseRebasePackage, parseTerminalPackage, hStart, hFirst,
                    hCheckpoint, hSecond]
              | some second =>
                  simp [checkTwoText, checkRebaseText, checkTerminalText, parsePackage,
                    parseRebasePackage, parseTerminalPackage, checkTwo, hStart, hFirst,
                    hCheckpoint, hSecond]

/-- Successful text ingress produces a parsed package whose starting formula is unsatisfiable. -/
theorem checkTwoText_sound {n : Nat} {startText firstText checkpointText secondText : String}
    (h : checkTwoText (n := n) startText firstText checkpointText secondText = true) :
    ∃ package,
      parsePackage (n := n) startText firstText checkpointText secondText = some package ∧
        Unsatisfiable (PosFin n) (DefaultFormula.ofArray package.start) := by
  cases hpackage :
      parsePackage (n := n) startText firstText checkpointText secondText with
  | none => simp [checkTwoText, hpackage] at h
  | some package =>
      simp only [checkTwoText, hpackage] at h
      exact ⟨package, rfl, checkTwo_sound h⟩

/--
Successful first- and second-shard replays may be kernel-checked in separate
modules and composed without replaying either shard in the composition module.
-/
theorem checkSeparateText_sound {n : Nat}
    {startText firstText checkpointText secondText : String}
    (hFirst : checkRebaseText (n := n) startText firstText checkpointText = true)
    (hSecond : checkTerminalText (n := n) checkpointText secondText = true) :
    ∃ package,
      parsePackage (n := n) startText firstText checkpointText secondText = some package ∧
        Unsatisfiable (PosFin n) (DefaultFormula.ofArray package.start) := by
  apply checkTwoText_sound
  rw [checkTwoText_eq_separate]
  simp [hFirst, hSecond]

private example : (parseLines "p cnf 2 1\n1 0\n").isSome = true := by decide

private example : (parseFields "1 -2 0".toList).isSome = true := by decide

end TextIngress

namespace SelfTest

private def x : PosFin 3 := ⟨1, by omega⟩
private def y : PosFin 3 := ⟨2, by omega⟩

private theorem x_ne_y : x ≠ y := by
  intro h
  have hv := congrArg Subtype.val h
  simp [x, y] at hv

private def xClause : DefaultClause 3 := DefaultClause.unit (x, true)

private def notXOrY : DefaultClause 3 where
  clause := [(x, false), (y, true)]
  nodupkey := by
    intro literal
    by_cases h : literal = x
    · left
      simp [h, x_ne_y]
    · right
      simp [h]
  nodup := by simp [x_ne_y]

private def notYClause : DefaultClause 3 := DefaultClause.unit (y, false)
private def yClause : DefaultClause 3 := DefaultClause.unit (y, true)

private def start : Array (Option (DefaultClause 3)) :=
  #[none, some xClause, some notXOrY, some notYClause]

private def first : List (Action 3) :=
  [.add yClause #[1, 2], .del #[1, 2]]

private def checkpoint : Array (Option (DefaultClause 3)) :=
  #[none, some notYClause, some yClause]

private def second : List (Action 3) :=
  [.add DefaultClause.empty #[1, 2]]

/-- The synthetic proof exercises RUP addition, deletion, rebasing, and final RUP. -/
example : checkTwo start first checkpoint second = true := by decide

/-- A checkpoint missing an active clause is rejected. -/
example : checkRebase start first #[none, some yClause] = false := by decide

/-- Kernel-checked unsatisfiability obtained by composing the two synthetic shards. -/
theorem selfTest_unsat : Unsatisfiable (PosFin 3) (DefaultFormula.ofArray start) :=
  checkTwo_sound (start := start) (first := first) (checkpoint := checkpoint)
    (second := second) (by decide)

private def startText := "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
private def firstText := "4 2 0 1 2 0\n1 d 1 2 0\n"
private def checkpointText := "p cnf 2 2\n-2 0\n2 0\n"
private def secondText := "3 0 1 2 0\n"

/-- Canonical decimal parsing is kernel-reducible. -/
example : TextIngress.parseNatCanonical "12" = some 12 := by decide

/-- Canonical DIMACS parsing is kernel-reducible. -/
example : (TextIngress.parseDimacs (n := 3) startText).isSome = true := by
  unfold startText
  decide

/-- Canonical action parsing is kernel-reducible. -/
example : (TextIngress.parseActions (n := 3) 4 firstText).isSome = true := by
  unfold firstText
  decide

/-- Duplicate literals fail closed during kernel-reducible DIMACS parsing. -/
example : (TextIngress.parseDimacs (n := 3) "p cnf 2 1\n1 1 0\n").isNone = true := by
  decide

/-- Tautological clauses fail closed during kernel-reducible DIMACS parsing. -/
example : (TextIngress.parseDimacs (n := 3) "p cnf 2 1\n1 -1 0\n").isNone = true := by
  decide

/-- The first text shard is accepted by kernel reduction, without native code. -/
example :
    TextIngress.checkRebaseText (n := 3) startText firstText checkpointText = true := by
  unfold startText firstText checkpointText
  decide

/-- The second text shard is accepted by kernel reduction, without native code. -/
example :
    TextIngress.checkTerminalText (n := 3) checkpointText secondText = true := by
  unfold checkpointText secondText
  decide

/-- Both text shards compose after their independent kernel reductions. -/
example :
    ∃ package,
      TextIngress.parsePackage (n := 3) startText firstText checkpointText secondText =
          some package ∧
        Unsatisfiable (PosFin 3) (DefaultFormula.ofArray package.start) :=
  TextIngress.checkSeparateText_sound
    (by unfold startText firstText checkpointText; decide)
    (by unfold checkpointText secondText; decide)

-- Bounded executable ingress smoke tests.
#eval TextIngress.checkTwoText (n := 3) startText firstText checkpointText secondText
#eval TextIngress.checkRebaseText (n := 3) startText firstText checkpointText
#eval TextIngress.checkTerminalText (n := 3) checkpointText secondText
#eval (TextIngress.parseDimacs (n := 3) "p cnf 2 1\n1 1 0\n").isNone
#eval (TextIngress.parseDimacs (n := 3) "p cnf 2 1\n1 -1 0\n").isNone

end SelfTest

end Problem97.CheckpointedRup
