/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceSafeIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalBankConsumer

/-!
# Exact-twelve five-omission CNF

This module mirrors the finite formula emitted by
`census.card_head.source_faithful_five_omission`.  It extends the frozen
source-safe exact-twelve `C1/C2/C4` base with selectors for one deleted label,
one blocker, and exactly five omission centers, followed by the role and
selected-row incidence clauses.

The per-shard deleted-label unit is appended after the common five-omission
formula, exactly as in the Python CEGAR runner.  Learned clauses are appended
after that unit.  The definitions here do not assert that any shard is UNSAT
and do not close a source residual.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FiveOmissionCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge

/- ## Frozen variable allocation -/

def deletedVar (p : Nat) : Nat :=
  SafeCoverCnf.baseNumVars + p + 1

def blockerVar (p : Nat) : Nat :=
  SafeCoverCnf.baseNumVars + 12 + p + 1

def centerVar (p : Nat) : Nat :=
  SafeCoverCnf.baseNumVars + 24 + p + 1

def deletedVars : List Nat :=
  (List.range 12).map deletedVar

def blockerVars : List Nat :=
  (List.range 12).map blockerVar

def centerVars : List Nat :=
  (List.range 12).map centerVar

/-- All 36 semantic selector variables are allocated before any selector
Sinz auxiliary, matching the Python constructor. -/
def deletedSinzBase : Nat :=
  SafeCoverCnf.baseNumVars + 36

def blockerSinzBase : Nat :=
  deletedSinzBase + sinzVarCount deletedVars.length 1

def centerSinzBase : Nat :=
  blockerSinzBase + sinzVarCount blockerVars.length 1

def numVars : Nat :=
  centerSinzBase + sinzVarCount centerVars.length 5

/- ## Frozen clause order -/

def deletedSelectorClauses : List (List Int) :=
  (deletedVars.map Int.ofNat) ::
    sinzClauses deletedVars 1 deletedSinzBase

def blockerSelectorClauses : List (List Int) :=
  (blockerVars.map Int.ofNat) ::
    sinzClauses blockerVars 1 blockerSinzBase

/-- Positive eight-selector clauses encode at least five selected centers:
among twelve labels, no eight center selectors may all be false. -/
def centerAtLeastFiveClauses : List (List Int) :=
  (combos 8 centerVars).map fun xs => xs.map Int.ofNat

def centerSelectorClauses : List (List Int) :=
  sinzClauses centerVars 5 centerSinzBase ++ centerAtLeastFiveClauses

/-- The blocker differs from the deleted label and from every omission center.
There is intentionally no deleted/center exclusion: the live source packet
does not provide it, and the Python formula does not encode it. -/
def roleDistinctnessClauses : List (List Int) :=
  (List.range 12).flatMap fun p =>
    [[-(Int.ofNat (deletedVar p)), -(Int.ofNat (blockerVar p))],
      [-(Int.ofNat (blockerVar p)), -(Int.ofNat (centerVar p))]]

/-- One source-faithful boundary clause.  If candidate row `i` at center `p`
contains deleted label `d`, it cannot be selected when `p` is an omission
center.  If it omits `d`, it cannot be selected when `p` is the blocker. -/
def boundaryClause (d p i : Nat) : List Int :=
  let x := Int.ofNat (SafeCoverCnf.xVar p i)
  if ((SafeCoverCnf.candMasks p).getD i 0).testBit d then
    [-(Int.ofNat (deletedVar d)), -(Int.ofNat (centerVar p)), -x]
  else
    [-(Int.ofNat (deletedVar d)), -(Int.ofNat (blockerVar p)), -x]

/-- Boundary clauses in Python's nested order: deleted label, row center,
candidate index. -/
def boundaryClauses : List (List Int) :=
  (List.range 12).flatMap fun d =>
    (List.range 12).flatMap fun p =>
      (List.range (SafeCoverCnf.candCount p)).map fun i =>
        boundaryClause d p i

/-- Common formula constructed before a shard fixes its deleted label. -/
def fiveOmissionDimacs : List (List Int) :=
  [SafeCoverCnf.baseDimacs,
    deletedSelectorClauses,
    blockerSelectorClauses,
    centerSelectorClauses,
    roleDistinctnessClauses,
    boundaryClauses].flatten

/-- Formula passed to a deleted-label shard before learned clauses. -/
def shardDimacs (deleted : Label) : List (List Int) :=
  fiveOmissionDimacs ++ [[Int.ofNat (deletedVar deleted.val)]]

/-- Complete terminal formula for one deleted-label shard and a
duplicate-center learned bank.  A mixed-detector journal requires a separate
mixed-bank definition and consumer; it must not be coerced into this type. -/
def terminalDuplicateCenterDimacs (deleted : Label)
    (bank : List (DuplicateCenterNogood Label)) : List (List Int) :=
  shardDimacs deleted ++
    bank.map fun nogood => learnedClause nogood.choices

/- ## Executable layout anchors -/

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Exact allocation and clause-count anchors for the current Python emitter.
The common constructor has 405,266 clauses; `_new_instance` appends one shard
unit, producing the 405,267-clause base recorded by the CEGAR summaries. -/
theorem encodingAnchors :
    deletedVars.head? = some 42561 ∧
    blockerVars.head? = some 42573 ∧
    centerVars.head? = some 42585 ∧
    deletedSinzBase = 42596 ∧
    blockerSinzBase = 42608 ∧
    centerSinzBase = 42620 ∧
    numVars = 42680 ∧
    centerAtLeastFiveClauses.length = 495 ∧
    boundaryClauses.length = 36480 ∧
    fiveOmissionDimacs.length = 405266 := by
  native_decide

theorem numVars_eq : numVars = 42680 :=
  encodingAnchors.2.2.2.2.2.2.1

theorem fiveOmissionDimacs_length : fiveOmissionDimacs.length = 405266 :=
  encodingAnchors.2.2.2.2.2.2.2.2.2

theorem shardDimacs_length (deleted : Label) :
    (shardDimacs deleted).length = 405267 := by
  unfold shardDimacs
  rw [List.length_append, fiveOmissionDimacs_length]
  rfl

end FiveOmissionCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
