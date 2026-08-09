/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CoverCnf

/-!
# Exact-twelve source-safe Rigid221 cover CNF

This module ports the exact-twelve source-faithful Python cover instance to
Lean.  Its candidate table contains exactly the rows admitted by
`FrozenSafeCandidateAt`; in particular, it does not contain the unsupported
historical mixed Moser/same-cap cut or any probe-only physical constraint.

The frozen label profile is the theorem-facing `(5, 4, 6)` profile.  The
Python model records its final two caps in the opposite order and therefore
names the same profile `(5, 6, 4)`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SafeCoverCnf

open Census554.CoverCnf

/-- Twelve-bit intersection cardinality. -/
def interCard12 (m₁ m₂ : Nat) : Nat :=
  ((List.range 12).filter fun b => (m₁ &&& m₂).testBit b).length

/-- The six source-proved Moser one-hit inequalities in bitmask form. -/
def oneHitOkB (p m : Nat) : Bool :=
  (p != 0 ||
    (decide (interCard12 m 3075 ≤ 1) && decide (interCard12 m 965 ≤ 1))) &&
  (p != 1 ||
    (decide (interCard12 m 62 ≤ 1) && decide (interCard12 m 3075 ≤ 1))) &&
  (p != 2 ||
    (decide (interCard12 m 965 ≤ 1) && decide (interCard12 m 62 ≤ 1)))

/-- The three source-proved own-cap inequalities in bitmask form. -/
def sameCapOkB (p m : Nat) : Bool :=
  (!(3 ≤ p && p ≤ 5) || decide (interCard12 m 56 ≤ 2)) &&
  (!(10 ≤ p && p ≤ 11) || decide (interCard12 m 3072 ≤ 2)) &&
  (!(6 ≤ p && p ≤ 9) || decide (interCard12 m 960 ≤ 2))

/-- Exactly the source-proved per-center candidate rules not already forced by
enumerating four-subsets of the center complement. -/
def safeCandidateOkB (p m : Nat) : Bool :=
  oneHitOkB p m &&
    decide (interCard12 m 7 ≤ 2) &&
    sameCapOkB p m

/-- Candidate masks in Python `itertools.combinations` order. -/
def candTable : List (List Nat) :=
  (List.range 12).map fun p =>
    ((combos 4 ((List.range 12).filter fun q => q != p)).map maskOf).filter
      (safeCandidateOkB p)

def candMasks (p : Nat) : List Nat := candTable.getD p []

def candCounts : List Nat := candTable.map List.length

def candCount (p : Nat) : Nat := candCounts.getD p 0

/-- Total number of candidate-choice variables. -/
def nX : Nat := candCounts.sum

/-- First one-based candidate-choice variable for center `p`. -/
def xOffset (p : Nat) : Nat := 1 + (candCounts.take p).sum

def xVar (p i : Nat) : Nat := xOffset p + i

/-- Base variable count immediately before the one-hot Sinz block at `p`. -/
def aux1Base (p : Nat) : Nat := nX + (candCounts.take p).sum

/-- One-hot clauses, in the exact Python emission order. -/
def onehotClauses : List (List Int) :=
  (List.range 12).flatMap fun p =>
    let xs := (List.range (candCount p)).map (xVar p)
    (xs.map Int.ofNat) :: sinzClauses xs 1 (aux1Base p)

/-- Unordered pairs of exact-twelve labels. -/
def allPairs : List (Nat × Nat) :=
  (List.range 12).flatMap fun a =>
    ((List.range 12).drop (a + 1)).map fun b => (a, b)

/-- Pairwise-row-intersection (`C2`) clauses. -/
def c2Clauses : List (List Int) :=
  allPairs.flatMap fun pq =>
    let mp := candMasks pq.1
    let mq := candMasks pq.2
    (List.range mp.length).flatMap fun i =>
      (List.range mq.length).filterMap fun j =>
        if 2 < interCard12 (mp.getD i 0) (mq.getD j 0) then
          some [-(Int.ofNat (xVar pq.1 i)), -(Int.ofNat (xVar pq.2 j))]
        else none

/-- Candidate-choice variables whose row contains both labels. -/
def incidentVars (a b : Nat) : List Nat :=
  (List.range 12).flatMap fun p =>
    (List.range (candCount p)).filterMap fun i =>
      let m := (candMasks p).getD i 0
      if m.testBit a && m.testBit b then some (xVar p i) else none

/-- One pair-multiplicity (`C4`) Sinz clause step.  Naming the step keeps the
proof-side fold abstract instead of forcing Lean to normalize all 66 pairs. -/
def c4ClauseStep (acc : Nat × List (List Int)) (pq : Nat × Nat) :
    Nat × List (List Int) :=
  let xs := incidentVars pq.1 pq.2
  (acc.1 + sinzVarCount xs.length 2,
    acc.2 ++ sinzClauses xs 2 acc.1)

/-- Pair-multiplicity (`C4`) Sinz fold. -/
def c4Fold : Nat × List (List Int) :=
  allPairs.foldl c4ClauseStep (nX + nX, ([] : List (List Int)))

def c4Clauses : List (List Int) := c4Fold.2

def baseNumVars : Nat := c4Fold.1

def baseDimacs : List (List Int) :=
  onehotClauses ++ c2Clauses ++ c4Clauses

def baseCnf : Std.Sat.CNF Nat :=
  baseDimacs.map fun c => c.map toLit

/- ## Executable encoding anchors -/

set_option maxHeartbeats 0 in
-- Native evaluation materializes the frozen 368,075-clause encoding once.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- A single native evaluation anchors the complete Python/Lean layout.  The
projection theorems below avoid rebuilding the 368,075-clause value once per
anchor. -/
theorem encodingAnchors :
    candCounts = [53, 101, 20, 322, 322, 322, 314, 314, 314, 314, 322, 322] ∧
    nX = 3040 ∧
    baseNumVars = 42560 ∧
    baseDimacs.length = 368075 ∧
    c2Clauses.length = 268031 := by
  native_decide

theorem candCounts_eq :
    candCounts = [53, 101, 20, 322, 322, 322, 314, 314, 314, 314, 322, 322] :=
  encodingAnchors.1

theorem nX_eq : nX = 3040 := encodingAnchors.2.1

theorem baseNumVars_eq : baseNumVars = 42560 := encodingAnchors.2.2.1

theorem baseDimacs_length : baseDimacs.length = 368075 :=
  encodingAnchors.2.2.2.1

theorem c2Clauses_length : c2Clauses.length = 268031 :=
  encodingAnchors.2.2.2.2

end SafeCoverCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
