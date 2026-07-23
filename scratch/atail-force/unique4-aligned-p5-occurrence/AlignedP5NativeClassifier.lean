/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifier
import Mathlib.Tactic

/-!
# Native classifier for the aligned card-eleven exact-four surface

This is the executable half of the aligned-p5 occurrence theorem.  It keeps
only the source fields used by the compact external core:

* one selected nonself four-row at every boundary point;
* the exact first-apex row through boundary points `5`, `6`, and `7`;
* the selected-row bounds on every closed cap;
* equality closure of the selected distance equalities;
* the two-circle, perpendicular-bisector, and cyclic-alternation constraints;
* the four surviving strict-Kalmanson occurrence schemas.

The proof-facing source adapter and semantic coverage theorem live in separate
files.  This module contains no geometric assumptions and proves only a closed
finite Boolean identity.
-/

namespace Problem97
namespace ATailAlignedP5NativeClassifierScratch

open Census554.CapSelectedNativeClassifier

abbrev RowMask := Census554.CapSelectedNativeClassifier.RowMask
abbrev Row := Census554.CapSelectedNativeClassifier.Row
abbrev Domain := Census554.CapSelectedNativeClassifier.Domain

def labels : List Nat := List.range 11

def firstCap : List Nat := [0, 1, 2, 3, 4]
def alignedCap : List Nat := [4, 5, 6, 7, 8]
def shortCap : List Nat := [8, 9, 10, 0]

def firstCapEndpoints : List Nat := [0, 4]
def alignedCapEndpoints : List Nat := [4, 8]
def shortCapEndpoints : List Nat := [8, 0]

def capBoundOK (cap endpoints : List Nat) (center : Nat) (support : RowMask) : Bool :=
  if cap.contains center then
    countPoints support cap ≤ 2 &&
      if endpoints.contains center then countPoints support cap ≤ 1 else true
  else
    true

def ownCapOK (center : Nat) (support : RowMask) : Bool :=
  capBoundOK firstCap firstCapEndpoints center support &&
    capBoundOK alignedCap alignedCapEndpoints center support &&
      capBoundOK shortCap shortCapEndpoints center support

def alignedClassOK (center : Nat) (support : RowMask) : Bool :=
  if center = 0 then has support 5 && has support 6 && has support 7 else true

def localCandidateOK (center : Nat) (support : RowMask) : Bool :=
  countPoints support labels = 4 &&
    !has support center &&
      ownCapOK center support &&
        alignedClassOK center support

def candidateRows (center : Nat) : List Row :=
  (List.range 2048).filterMap fun support =>
    if localCandidateOK center support then some { center, support } else none

def cyclicOffset (left right : Nat) : Nat :=
  (right + 11 - left) % 11

def cyclicBetween (left right point : Nat) : Bool :=
  let pointOffset := cyclicOffset left point
  let rightOffset := cyclicOffset left right
  decide (0 < pointOffset && pointOffset < rightOffset)

def cyclicSeparated (left right first second : Nat) : Bool :=
  cyclicBetween left right first != cyclicBetween left right second

def crossSeparationOK (left right : Row) : Bool :=
  match commonPoints left.support right.support with
  | first :: second :: rest =>
      rest.isEmpty && cyclicSeparated left.center right.center first second
  | _ => true

def rowsCompatible (left right : Row) : Bool :=
  crossSeparationOK left right

def compatibleWith (assigned : List Row) (row : Row) : Bool :=
  pairBoundOK assigned row &&
    assigned.all fun previous => rowsCompatible row previous

def restrictDomain (assigned : List Row) (domain : Domain) : Domain :=
  { domain with rows := domain.rows.filter fun row => compatibleWith assigned row }

def insertDomain (domain : Domain) : List Domain → List Domain
  | [] => [domain]
  | next :: rest =>
      if domain.rows.length ≤ next.rows.length then
        domain :: next :: rest
      else
        next :: insertDomain domain rest

def sortDomains (domains : List Domain) : List Domain :=
  domains.foldr insertDomain []

def exactFirstClassCore (rows : List Row) (roots : Array Nat) : Bool :=
  match rows.find? (fun row => row.center = 0) with
  | none => false
  | some row =>
      match supportPoints row.support with
      | [] => false
      | first :: _ =>
          labels.any fun point =>
            !has row.support point && point != 0 &&
              edgesEqual roots 0 first 0 point

def fullClassNonalternatingCore (roots : Array Nat) : Bool :=
  labels.any fun left =>
    labels.any fun right =>
      left < right &&
        labels.any fun first =>
          first != left && first != right &&
            labels.any fun second =>
              first < second && second != left && second != right &&
                edgesEqual roots left first left second &&
                  edgesEqual roots right first right second &&
                    !cyclicSeparated left right first second

abbrev Membership := Nat × Nat

def schema1 : List Membership :=
  [(0, 1), (0, 3), (4, 2), (4, 3), (5, 1), (5, 2)]

def schema4 : List Membership :=
  [(0, 1), (0, 3), (2, 3), (2, 4), (3, 1), (3, 4)]

def schema6 : List Membership :=
  [(0, 3), (0, 4), (1, 0), (1, 4), (2, 0), (2, 3)]

def schema9 : List Membership :=
  [(0, 1), (0, 3), (0, 5), (4, 1), (4, 2), (5, 2), (5, 3)]

def rowHas (rows : List Row) (center point : Nat) : Bool :=
  match rows.find? (fun row => row.center = center) with
  | none => false
  | some row => has row.support point

def rolePoint (targets : List Nat) (role : Nat) : Nat :=
  targets[role]!

def schemaAt (rows : List Row) (targets : List Nat)
    (schema : List Membership) : Bool :=
  schema.all fun membership =>
    rowHas rows (rolePoint targets membership.1) (rolePoint targets membership.2)

def reflectSchema (roleCount : Nat) (schema : List Membership) : List Membership :=
  schema.map fun membership =>
    (roleCount - 1 - membership.1, roleCount - 1 - membership.2)

def increasingTargets (roleCount : Nat) : List (List Nat) :=
  labels.sublists.filter fun targets =>
    targets.length = roleCount

def schemaOccurs (rows : List Row) (roleCount : Nat)
    (schema : List Membership) : Bool :=
  (increasingTargets roleCount).any fun targets =>
    schemaAt rows targets schema ||
      schemaAt rows targets (reflectSchema roleCount schema)

def kalmansonCore (rows : List Row) : Bool :=
  schemaOccurs rows 6 schema1 ||
    schemaOccurs rows 5 schema4 ||
      schemaOccurs rows 6 schema6 ||
        schemaOccurs rows 6 schema9

def metricCore (rows : List Row) : Bool :=
  let roots := normalizedRoots (equalityClosure rows)
  exactFirstClassCore rows roots ||
    duplicateCenterCore roots ||
      perpendicularBisectorCore roots ||
        fullClassNonalternatingCore roots

def hasPrefixCore (rows : List Row) : Bool :=
  metricCore rows || kalmansonCore rows

def allKilled : Nat → List Row → List Domain → Bool
  | 0, assigned, _ => hasPrefixCore assigned
  | fuel + 1, assigned, domains =>
      if hasPrefixCore assigned then
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
                  allKilled fuel nextAssigned nextDomains
              else
                true

def alignedExtraPoints : List Nat := [1, 2, 3, 4, 8, 9, 10]

def fixedFirstRow (extra : Nat) : Row :=
  { center := 0
    support := 2 ^ 5 + 2 ^ 6 + 2 ^ 7 + 2 ^ extra }

def variableCenters : List Nat := [4, 8, 1, 2, 3, 5, 6, 7, 9, 10]

def placementCheckForExtra (extra : Nat) : Bool :=
  let fixed := fixedFirstRow extra
  if !alignedExtraPoints.contains extra ||
      !localCandidateOK fixed.center fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := variableCenters.map fun center =>
      restrictDomain assigned { center, rows := candidateRows center }
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilled variableCenters.length assigned domains

def placementCheck : Bool :=
  alignedExtraPoints.all placementCheckForExtra

end ATailAlignedP5NativeClassifierScratch
end Problem97
