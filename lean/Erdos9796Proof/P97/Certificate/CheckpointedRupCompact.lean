/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Certificate.CheckpointedRup

/-!
# Compact ingress for checkpointed RUP windows

This module adds a pure, fail-closed binary ingress layer to
`Problem97.CheckpointedRup`. It does not add a new proof checker: successful
compact replays are reduced directly to `checkRebase_sound` or
`checkTerminal_sound`.

## ASCII85 envelope

Every compact argument is a raw canonical ASCII85 string:

* the only accepted characters are `!` through `u`;
* whitespace, Adobe delimiters, and the `z` abbreviation are rejected;
* a full five-character group denotes one big-endian 32-bit word;
* a final group may contain two, three, or four characters and denotes one,
  two, or three bytes respectively, using the standard `u` padding rule;
* a one-character final group, a value above `2^32 - 1`, and a noncanonical
  final group are rejected.

## Binary grammar

All integers below are canonical unsigned LEB128 values limited to 64 bits.
A multi-byte value must have a nonzero payload in its final byte. Signed
literals use zigzag coding: `0, -1, 1, -2, 2, ...` map to
`0, 1, 2, 3, 4, ...`.

A formula, where `variable-count + 1` must equal the external type parameter
`n`, is:

```text
"CPF1" variable-count clause-count
  repeat clause-count times:
    literal-count zigzag-literal[literal-count]
```

Clause identifier zero is reconstructed as a leading `none`; subsequent
clauses are dense `some` entries in source order. Zero literals and repeated
variables in a clause are rejected.

An action stream is:

```text
"CPA1" action-count
  repeat action-count times:
    0 literal-count zigzag-literal[literal-count]
      hint-count positive-uvaruint[hint-count]       -- RUP addition
  | 1 deletion-count positive-uvaruint[deletion-count] -- deletion
```

Addition identifiers are deliberately omitted. They are reconstructed densely,
starting at the supplied formula array's `size`; `ParsedActions.nextAdditionId`
records the first unused reconstructed identifier. No RAT action has a tag.
Every top-level parser requires exact end-of-input, so trailing bytes fail.
-/

set_option warningAsError true

open Std.Sat
open Std.Tactic.BVDecide
open Std.Tactic.BVDecide.LRAT
open Std.Tactic.BVDecide.LRAT.Internal

namespace Problem97.CheckpointedRup.CompactIngress

open Problem97.CheckpointedRup

private def maxUInt32 : Nat := 4294967295

private def maxVarUInt : Nat := 18446744073709551615

private def varUIntModulus : Nat := 18446744073709551616

private def byteAt? (bytes : ByteArray) (index : Nat) : Option Nat :=
  if h : index < bytes.size then
    some (bytes.get index h).toNat
  else
    none

private def ascii85DigitAt? (bytes : ByteArray) (index : Nat) : Option Nat := do
  let value ← byteAt? bytes index
  if value < 33 ∨ 117 < value then none else some (value - 33)

private def ascii85Digit (word position : Nat) : Nat :=
  let divisor :=
    match position with
    | 0 => 52200625
    | 1 => 614125
    | 2 => 7225
    | 3 => 85
    | _ => 1
  word / divisor % 85

private def canonicalPartialWord (word groupLength : Nat) : Nat :=
  let first := word / 16777216
  let second := word / 65536 % 256
  let third := word / 256 % 256
  match groupLength with
  | 2 => first * 16777216
  | 3 => first * 16777216 + second * 65536
  | 4 => first * 16777216 + second * 65536 + third * 256
  | _ => word

private def partialGroupIsCanonical
    (word groupLength d0 d1 d2 d3 : Nat) : Bool :=
  let canonical := canonicalPartialWord word groupLength
  match groupLength with
  | 2 =>
      d0 == ascii85Digit canonical 0 &&
        d1 == ascii85Digit canonical 1
  | 3 =>
      d0 == ascii85Digit canonical 0 &&
        d1 == ascii85Digit canonical 1 &&
        d2 == ascii85Digit canonical 2
  | 4 =>
      d0 == ascii85Digit canonical 0 &&
        d1 == ascii85Digit canonical 1 &&
        d2 == ascii85Digit canonical 2 &&
        d3 == ascii85Digit canonical 3
  | _ => true

private def pushWordPrefix (output : ByteArray) (word groupLength : Nat) : ByteArray :=
  let output := output.push (UInt8.ofNat (word / 16777216))
  if groupLength = 2 then
    output
  else
    let output := output.push (UInt8.ofNat (word / 65536 % 256))
    if groupLength = 3 then
      output
    else
      let output := output.push (UInt8.ofNat (word / 256 % 256))
      if groupLength = 4 then output else output.push (UInt8.ofNat (word % 256))

private def decodeAscii85Group (input : ByteArray) (position groupLength : Nat)
    (output : ByteArray) : Option ByteArray := do
  let d0 ← ascii85DigitAt? input position
  let d1 ← ascii85DigitAt? input (position + 1)
  let d2 ← if 2 < groupLength then ascii85DigitAt? input (position + 2) else some 84
  let d3 ← if 3 < groupLength then ascii85DigitAt? input (position + 3) else some 84
  let d4 ← if 4 < groupLength then ascii85DigitAt? input (position + 4) else some 84
  let word := ((((d0 * 85 + d1) * 85 + d2) * 85 + d3) * 85 + d4)
  if maxUInt32 < word then
    none
  else if groupLength < 5 &&
      !partialGroupIsCanonical word groupLength d0 d1 d2 d3 then
    none
  else
    some (pushWordPrefix output word groupLength)

private def decodeAscii85Aux (input : ByteArray) (position : Nat) :
    Nat → ByteArray → Option ByteArray
  | 0, _ => none
  | fuel + 1, output =>
      let remaining := input.size - position
      if remaining = 0 then
        some output
      else if remaining = 1 then
        none
      else
        let groupLength := min remaining 5
        match decodeAscii85Group input position groupLength output with
        | none => none
        | some next =>
            if remaining ≤ 5 then
              some next
            else
              decodeAscii85Aux input (position + 5) fuel next

/--
Decode the strict raw ASCII85 envelope described in this module's grammar.
The empty string decodes to the empty byte array; binary parsers still reject
it because it lacks their required magic.
-/
def decodeAscii85 (text : String) : Option ByteArray :=
  let input := text.toUTF8
  decodeAscii85Aux input 0 (input.size / 5 + 1) ByteArray.empty

private structure Cursor where
  bytes : ByteArray
  position : Nat

private def Cursor.atEnd (cursor : Cursor) : Bool :=
  cursor.position == cursor.bytes.size

private def Cursor.readByte (cursor : Cursor) : Option (UInt8 × Cursor) :=
  if h : cursor.position < cursor.bytes.size then
    some (cursor.bytes.get cursor.position h,
      { cursor with position := cursor.position + 1 })
  else
    none

private def Cursor.readExpected : Cursor → List Nat → Option Cursor
  | cursor, [] => some cursor
  | cursor, expected :: rest => do
      let (byte, next) ← cursor.readByte
      if byte.toNat = expected then next.readExpected rest else none

private def readVarUIntAux :
    Nat → Nat → Nat → Nat → Cursor → Option (Nat × Cursor)
  | 0, _, _, _, _ => none
  | fuel + 1, used, multiplier, value, cursor => do
      let (byte, next) ← cursor.readByte
      let raw := byte.toNat
      let payload := raw % 128
      let candidate := value + payload * multiplier
      if maxVarUInt < candidate then
        none
      else if raw < 128 then
        if 0 < used ∧ payload = 0 then none else some (candidate, next)
      else
        readVarUIntAux fuel (used + 1) (multiplier * 128) candidate next

private def Cursor.readVarUInt (cursor : Cursor) : Option (Nat × Cursor) :=
  readVarUIntAux 10 0 1 0 cursor

/--
Decode exactly one canonical unsigned 64-bit LEB128 value. Missing bytes,
overflow, nonminimal encodings, and trailing bytes are rejected.
-/
def decodeVarUInt (bytes : ByteArray) : Option Nat := do
  let (value, cursor) ← Cursor.readVarUInt { bytes, position := 0 }
  if cursor.atEnd then some value else none

private def zigZagValue (value : Nat) : Int :=
  if value % 2 = 0 then
    Int.ofNat (value / 2)
  else
    -(Int.ofNat (value / 2)) - 1

private def Cursor.readZigZag (cursor : Cursor) : Option (Int × Cursor) := do
  let (value, next) ← cursor.readVarUInt
  some (zigZagValue value, next)

/--
Decode exactly one canonical unsigned varuint and interpret it as a zigzag
signed integer. The accepted range is `[-2^63, 2^63 - 1]`.
-/
def decodeZigZag (bytes : ByteArray) : Option Int := do
  let (value, cursor) ← Cursor.readVarUInt { bytes, position := 0 }
  if cursor.atEnd then some (zigZagValue value) else none

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

private def Cursor.readLiteral {n : Nat} (cursor : Cursor) :
    Option (Literal (PosFin n) × Cursor) := do
  let (signed, next) ← cursor.readZigZag
  let variableIndex := signed.natAbs
  if hzero : 0 < variableIndex then
    if hrange : variableIndex < n then
      let polarity := if 0 < signed then true else false
      some ((⟨variableIndex, hzero, hrange⟩, polarity), next)
    else
      none
  else
    none

private def readLiteralsAux {n : Nat} :
    Nat → Cursor → List (Literal (PosFin n)) →
      Option (List (Literal (PosFin n)) × Cursor)
  | 0, cursor, reversed => some (reversed.reverse, cursor)
  | count + 1, cursor, reversed => do
      let (literal, next) ← cursor.readLiteral
      readLiteralsAux count next (literal :: reversed)

private def Cursor.readClause {n : Nat} (cursor : Cursor) :
    Option (DefaultClause n × Cursor) := do
  let (literalCount, afterCount) ← cursor.readVarUInt
  let (literals, next) ← readLiteralsAux literalCount afterCount []
  if h : List.Pairwise (fun a b => a.1 ≠ b.1) literals then
    some
      ({ clause := literals
         nodupkey := pairwiseVariable_nodupkey h
         nodup := pairwiseVariable_nodup h },
       next)
  else
    none

private def readClausesAux {n : Nat} :
    Nat → Cursor → Array (Option (DefaultClause n)) →
      Option (Array (Option (DefaultClause n)) × Cursor)
  | 0, cursor, clauses => some (clauses, cursor)
  | count + 1, cursor, clauses => do
      let (clause, next) ← cursor.readClause
      readClausesAux count next (clauses.push (some clause))

private def parseFormulaBytes {n : Nat} (bytes : ByteArray) :
    Option (Array (Option (DefaultClause n))) := do
  let cursor ← (Cursor.mk bytes 0).readExpected [67, 80, 70, 49]
  let (variableCount, afterVariables) ← cursor.readVarUInt
  if variableCount + 1 != n then
    none
  else
    let (clauseCount, afterCount) ← afterVariables.readVarUInt
    let (clauses, done) ← readClausesAux clauseCount afterCount #[none]
    if done.atEnd then some clauses else none

/--
Decode a compact formula and reconstruct its dense clause array, including
the reserved `none` entry at identifier zero.
-/
def parseFormula {n : Nat} (text : String) :
    Option (Array (Option (DefaultClause n))) := do
  let bytes ← decodeAscii85 text
  parseFormulaBytes bytes

private def readPositiveVarUInt (cursor : Cursor) : Option (Nat × Cursor) := do
  let (value, next) ← cursor.readVarUInt
  if value = 0 then none else some (value, next)

private def readPositiveArrayAux :
    Nat → Cursor → Array Nat → Option (Array Nat × Cursor)
  | 0, cursor, values => some (values, cursor)
  | count + 1, cursor, values => do
      let (value, next) ← readPositiveVarUInt cursor
      readPositiveArrayAux count next (values.push value)

private def Cursor.readAction {n : Nat} (cursor : Cursor) :
    Option (Action n × Bool × Cursor) := do
  let (tag, afterTag) ← cursor.readByte
  match tag.toNat with
  | 0 =>
      let (clause, afterClause) ← afterTag.readClause
      let (hintCount, afterCount) ← afterClause.readVarUInt
      let (hints, next) ← readPositiveArrayAux hintCount afterCount #[]
      some (.add clause hints, true, next)
  | 1 =>
      let (deletionCount, afterCount) ← afterTag.readVarUInt
      let (ids, next) ← readPositiveArrayAux deletionCount afterCount #[]
      some (.del ids, false, next)
  | _ => none

private def readActionsAux {n : Nat} :
    Nat → Nat → Cursor → List (Action n) →
      Option (List (Action n) × Nat × Cursor)
  | 0, nextAdditionId, cursor, reversed =>
      some (reversed.reverse, nextAdditionId, cursor)
  | count + 1, nextAdditionId, cursor, reversed => do
      let (action, isAddition, next) ← cursor.readAction
      if isAddition then
        if nextAdditionId < varUIntModulus then
          readActionsAux count (nextAdditionId + 1) next (action :: reversed)
        else
          none
      else
        readActionsAux count nextAdditionId next (action :: reversed)

/--
An action stream together with the first unused dense addition identifier.
The first addition, when present, has the caller-supplied starting identifier.
-/
structure ParsedActions (n : Nat) where
  actions : List (Action n)
  nextAdditionId : Nat

private def parseActionsBytes {n : Nat} (firstAdditionId : Nat) (bytes : ByteArray) :
    Option (ParsedActions n) := do
  if varUIntModulus ≤ firstAdditionId then
    none
  else
    let cursor ← (Cursor.mk bytes 0).readExpected [67, 80, 65, 49]
    let (actionCount, afterCount) ← cursor.readVarUInt
    let (actions, nextAdditionId, done) ←
      readActionsAux actionCount firstAdditionId afterCount []
    if done.atEnd then some { actions, nextAdditionId } else none

/--
Decode compact pure-RUP actions, reconstructing dense addition identifiers
from `firstAdditionId`. Unknown tags, RAT data, and trailing bytes fail.
-/
def parseActions {n : Nat} (firstAdditionId : Nat) (text : String) :
    Option (ParsedActions n) := do
  let bytes ← decodeAscii85 text
  parseActionsBytes firstAdditionId bytes

/-- The parsed compact inputs needed for a checkpoint-producing shard. -/
structure RebasePackage (n : Nat) where
  start : Array (Option (DefaultClause n))
  actions : List (Action n)
  checkpoint : Array (Option (DefaultClause n))

/-- Parse a compact start formula, action stream, and checkpoint formula. -/
def parseRebasePackage {n : Nat}
    (startText actionText checkpointText : String) : Option (RebasePackage n) := do
  let start ← parseFormula startText
  let parsedActions ← parseActions start.size actionText
  let checkpoint ← parseFormula checkpointText
  some { start, actions := parsedActions.actions, checkpoint }

/-- Parse and check one compact checkpoint-producing shard. -/
def checkRebaseCompact {n : Nat}
    (startText actionText checkpointText : String) : Bool :=
  match parseRebasePackage (n := n) startText actionText checkpointText with
  | none => false
  | some package => checkRebase package.start package.actions package.checkpoint

/-- Soundness of successful compact checkpoint ingress. -/
theorem checkRebaseCompact_sound {n : Nat}
    {startText actionText checkpointText : String}
    (h : checkRebaseCompact (n := n) startText actionText checkpointText = true) :
    ∃ package,
      parseRebasePackage (n := n) startText actionText checkpointText = some package ∧
        Limplies (PosFin n) (DefaultFormula.ofArray package.start)
          (DefaultFormula.ofArray package.checkpoint) := by
  cases hpackage :
      parseRebasePackage (n := n) startText actionText checkpointText with
  | none => simp [checkRebaseCompact, hpackage] at h
  | some package =>
      simp only [checkRebaseCompact, hpackage] at h
      exact ⟨package, rfl, checkRebase_sound h⟩

/--
Expose a successful compact replay at caller-named decoded endpoints.
-/
theorem checkRebaseCompact_sound_of_parse {n : Nat}
    {startText actionText checkpointText : String}
    {start checkpoint : Array (Option (DefaultClause n))}
    (hStart : parseFormula (n := n) startText = some start)
    (hCheckpoint : parseFormula (n := n) checkpointText = some checkpoint)
    (h : checkRebaseCompact (n := n) startText actionText checkpointText = true) :
    Limplies (PosFin n) (DefaultFormula.ofArray start)
      (DefaultFormula.ofArray checkpoint) := by
  obtain ⟨package, hpackage, himp⟩ := checkRebaseCompact_sound h
  cases hActions : parseActions (n := n) start.size actionText with
  | none =>
      simp [parseRebasePackage, hStart, hActions] at hpackage
  | some actions =>
      simp [parseRebasePackage, hStart, hActions, hCheckpoint] at hpackage
      subst package
      exact himp

/-- The parsed compact inputs needed for a terminal shard. -/
structure TerminalPackage (n : Nat) where
  start : Array (Option (DefaultClause n))
  actions : List (Action n)

/-- Parse a compact formula and its locally numbered terminal action stream. -/
def parseTerminalPackage {n : Nat}
    (startText actionText : String) : Option (TerminalPackage n) := do
  let start ← parseFormula startText
  let parsedActions ← parseActions start.size actionText
  some { start, actions := parsedActions.actions }

/-- Parse and check one compact empty-clause-producing shard. -/
def checkTerminalCompact {n : Nat} (startText actionText : String) : Bool :=
  match parseTerminalPackage (n := n) startText actionText with
  | none => false
  | some package => checkTerminal package.start package.actions

/-- Soundness of successful compact terminal ingress. -/
theorem checkTerminalCompact_sound {n : Nat} {startText actionText : String}
    (h : checkTerminalCompact (n := n) startText actionText = true) :
    ∃ package,
      parseTerminalPackage (n := n) startText actionText = some package ∧
        Unsatisfiable (PosFin n) (DefaultFormula.ofArray package.start) := by
  cases hpackage : parseTerminalPackage (n := n) startText actionText with
  | none => simp [checkTerminalCompact, hpackage] at h
  | some package =>
      simp only [checkTerminalCompact, hpackage] at h
      exact ⟨package, rfl, checkTerminal_sound h⟩

/-- Expose a successful compact terminal replay at a caller-named endpoint. -/
theorem checkTerminalCompact_sound_of_parse {n : Nat}
    {startText actionText : String}
    {start : Array (Option (DefaultClause n))}
    (hStart : parseFormula (n := n) startText = some start)
    (h : checkTerminalCompact (n := n) startText actionText = true) :
    Unsatisfiable (PosFin n) (DefaultFormula.ofArray start) := by
  obtain ⟨package, hpackage, hunsat⟩ := checkTerminalCompact_sound h
  cases hActions : parseActions (n := n) start.size actionText with
  | none =>
      simp [parseTerminalPackage, hStart, hActions] at hpackage
  | some actions =>
      simp [parseTerminalPackage, hStart, hActions] at hpackage
      subst package
      exact hunsat

end Problem97.CheckpointedRup.CompactIngress
