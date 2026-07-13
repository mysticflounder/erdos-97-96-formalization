/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier
import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode

/-!
# ERASE card-eleven native classifier

Proof-bearing finite search kernel and shell contracts for the card-eleven
ERASE lane.  The search is the committed cap-selected DFS with the seed-center
literal parameterized.  P4-U additionally fixes the two exact short-cap rows
forced by non-surplus Moser-cap containment.

This module contains no verdict theorems.  Native placement certificates and
their semantic transport live in separate modules.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedFiniteCode

/-- The ten variable centers of a one-row seed placement. -/
def variableCentersAt (c₀ : Nat) : List Nat :=
  labels.filter fun center => center != c₀

/-- Exact off-circle detector keyed to the parameterized seed center. -/
def exactSeedOffCircleCoreAt (c₀ : Nat) (roots : Array Nat)
    (seed : RowMask) : Bool :=
  labels.any fun onCircle =>
    has seed onCircle && labels.any fun offCircle =>
      !has seed offCircle && edgesEqual roots c₀ onCircle c₀ offCircle

/-- Prefix detector with the exact-row core keyed to `c₀`. -/
def hasPrefixCoreAt (c₀ : Nat) (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  let seed := rows.find? (fun row => row.center == c₀)
  duplicateCenterCore roots ||
    (match seed with
      | some row => exactSeedOffCircleCoreAt c₀ roots row.support
      | none => false) ||
    perpendicularBisectorCore roots ||
    convexFivePointCore roots

/-- Parameterized DFS using `hasPrefixCoreAt` at every node. -/
def allKilledAt (c₀ : Nat) : Nat → List Row → List Domain → Bool
  | 0, assigned, _ => hasPrefixCoreAt c₀ assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCoreAt c₀ assigned then
        true
      else
        match sortDomains domains with
        | [] => false
        | domain :: rest =>
            domain.rows.all fun row =>
              if compatibleWith assigned row then
                let nextAssigned := row :: assigned
                let nextDomains := rest.map (restrictDomain nextAssigned)
                if nextDomains.any fun next => next.rows.isEmpty then
                  true
                else
                  allKilledAt c₀ fuel nextAssigned nextDomains
              else
                true

/-- One-row ERASE placement check, used by P2 and P4-S. -/
def erasedPlacementCheckAt (c₀ support deleted : Nat) : Bool :=
  let fixed : Row := { center := c₀, support := support }
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := (variableCentersAt c₀).map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledAt c₀ (variableCentersAt c₀).length assigned domains

/-- Canonical exact first short-cap row `{0,2,7,8}`. -/
def firstOppExactCapRow : Row :=
  { center := 1, support := 2 ^ 0 + 2 ^ 2 + 2 ^ 7 + 2 ^ 8 }

/-- Canonical exact second short-cap row `{0,1,9,10}`. -/
def secondOppExactCapRow : Row :=
  { center := 2, support := 2 ^ 0 + 2 ^ 1 + 2 ^ 9 + 2 ^ 10 }

/-- Centers left after fixing the P4-U row and both exact short-cap rows. -/
def p4uVariableCenters : List Nat := [3, 4, 5, 6, 7, 8, 9, 10]

/-- Containment-specialized P4-U placement check. -/
def erasedP4UPlacementCheck (support deleted : Nat) : Bool :=
  let seed : Row := { center := 0, support := support }
  if !localCandidateOK seed.center deleted seed.support then
    false
  else if !localCandidateOK firstOppExactCapRow.center deleted
      firstOppExactCapRow.support then
    false
  else if !localCandidateOK secondOppExactCapRow.center deleted
      secondOppExactCapRow.support then
    false
  else if !compatibleWith [seed] firstOppExactCapRow then
    true
  else if !compatibleWith [firstOppExactCapRow, seed] secondOppExactCapRow then
    true
  else
    let assigned := [secondOppExactCapRow, firstOppExactCapRow, seed]
    let domains := p4uVariableCenters.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center deleted }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledAt 0 p4uVariableCenters.length assigned domains

/-- Native values of the surplus-interior labels. -/
def intSNats : List Nat := [3, 4, 5, 6]

/-- All eleven-label four-point masks. -/
def fourPointMasks : List RowMask :=
  (List.range 2048).filter fun support => countPoints support labels == 4

/-- Complete containment-compatible P4-U support domain. -/
def p4uSupports : List RowMask :=
  fourPointMasks.filter fun support =>
    !has support 0 && moserOneHitOK 0 support &&
      (has support 1 == has support 2)

/- ## Finite shell contracts -/

/-- Common ERASE shell contract.  Unlike the pinned and endpoint contracts,
it does not require `blocker deleted ≠ c₀`; that condition is unused by the
closure consumer and is false for valid P4-U seeds. -/
def ErasedSeedShellOK (P : PatternCode) (blocker : Label → Label)
    (centerBucket : Finset Label) (c₀ pin deleted : Label) : Prop :=
  c₀ ∈ centerBucket ∧
    pin ∈ intS ∧
    pin ∈ row P c₀ ∧
    pin ≠ c₀ ∧
    deleted ∈ intS ∧
    deleted ∈ row P 0 ∧
    (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
    (∀ q, q ∈ row P c₀ → blocker q = c₀)

/-- Count-row ERASE shell over orientation-specific buckets. -/
def ErasedRowShellOK (P : PatternCode) (blocker : Label → Label)
    (centerBucket sameBucket leftBucket rightBucket : Finset Label)
    (c₀ pin deleted : Label) (m s l r : Nat) : Prop :=
  ErasedSeedShellOK P blocker centerBucket c₀ pin deleted ∧
    (row P c₀ ∩ moser).card = m ∧
    (row P c₀ ∩ sameBucket).card = s ∧
    (row P c₀ ∩ leftBucket).card = l ∧
    (row P c₀ ∩ rightBucket).card = r

/-- First-opposite-center count-row orientation. -/
abbrev RightErasedRowShellOK (P : PatternCode) (blocker : Label → Label)
    (c₀ pin deleted : Label) (m s l r : Nat) : Prop :=
  ErasedRowShellOK P blocker intO1 intO1 intO2 intS
    c₀ pin deleted m s l r

/-- Second-opposite-center count-row orientation. -/
abbrev LeftErasedRowShellOK (P : PatternCode) (blocker : Label → Label)
    (c₀ pin deleted : Label) (m s l r : Nat) : Prop :=
  ErasedRowShellOK P blocker intO2 intO2 intS intO1
    c₀ pin deleted m s l r

/-- P4-U shell with the two exact short-cap rows and Moser-pair restriction
that justify the containment-specialized search. -/
def P4UErasedShellOK (P : PatternCode) (blocker : Label → Label)
    (pin deleted : Label) : Prop :=
  ErasedSeedShellOK P blocker {0} 0 pin deleted ∧
    row P 1 = capO1 ∧
    row P 2 = capO2 ∧
    (1 ∈ row P 0 ↔ 2 ∈ row P 0)

/-- P4-S shell at a surplus-interior center. -/
abbrev P4SErasedShellOK (P : PatternCode) (blocker : Label → Label)
    (c₀ pin deleted : Label) : Prop :=
  ErasedSeedShellOK P blocker intS c₀ pin deleted

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
