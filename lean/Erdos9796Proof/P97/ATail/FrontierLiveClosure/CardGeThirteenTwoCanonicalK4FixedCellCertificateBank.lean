/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTwoCanonicalK4FixedCellData

/-!
# Checked cancellation bank for the two-canonical-K4 fixed cell

This module constructs equality paths and edge pairings transparently from the
fixed rows and Kalmanson terms.  A finite breadth-first search uses only row
steps and edge reversal.  A deterministic greedy matcher pairs the two edge
multisets inside their equality-closure components.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenTwoCanonicalK4FixedCellCertificateBank

open GenericRowNogoodCertificate
open CardGeThirteenTwoCanonicalK4FixedCellData
open Census554.EqualityCore

abbrev Label := Fin 13

private abbrev SearchNode :=
  Edge Label × List (PrimitiveEqualityStep Label)

/-- The labels in their canonical finite order. -/
private def labels : List Label :=
  List.ofFn fun point : Label => point

/-- All one-step equality moves out of an oriented edge. -/
private def equalitySteps (choices : List (RowChoice Label))
    (edge : Edge Label) : List (PrimitiveEqualityStep Label) :=
  .flip edge.1 edge.2 ::
    choices.flatMap fun choice =>
      if choice.center = edge.1 ∧ edge.2 ∈ choice.support then
        (labels.filter fun point => point ∈ choice.support) |>.map fun point =>
          .row choice.center edge.2 point
      else
        []

/-- Add previously unseen one-step continuations to a breadth-first frontier. -/
private def enqueueSteps
    (reversePath : List (PrimitiveEqualityStep Label))
    (steps : List (PrimitiveEqualityStep Label))
    (initial : List SearchNode × Finset (Edge Label)) :
    List SearchNode × Finset (Edge Label) :=
  steps.foldl (fun state step =>
    let endpoint := step.target
    if endpoint ∈ state.2 then
      state
    else
      (state.1 ++ [(endpoint, step :: reversePath)],
        insert endpoint state.2)) initial

/-- Fuel-bounded breadth-first search on the 169 oriented edges of `Fin 13`. -/
private def findStepsAux (choices : List (RowChoice Label))
    (last : Edge Label) :
    Nat → List SearchNode → Finset (Edge Label) →
      Option (List (PrimitiveEqualityStep Label))
  | 0, _, _ => none
  | _ + 1, [], _ => none
  | fuel + 1, (first, reversePath) :: queue, seen =>
      if first = last then
        some reversePath.reverse
      else
        let state := enqueueSteps reversePath (equalitySteps choices first)
          (queue, seen)
        findStepsAux choices last fuel state.1 state.2

/-- Find a checked equality path between two oriented edges when one exists. -/
private def findSteps (choices : List (RowChoice Label))
    (first last : Edge Label) :
    Option (List (PrimitiveEqualityStep Label)) :=
  findStepsAux choices last 169 [(first, [])] {first}

/-- Choose the first right edge in the same equality component as `left`. -/
private def firstPairing? (choices : List (RowChoice Label))
    (left : Edge Label) :
    List (Edge Label) → Option (WeightedEdgePairingData Label)
  | [] => none
  | right :: rights =>
      match findSteps choices left right with
      | some steps =>
          some
            { left := left
              right := right
              path := { first := left, steps := steps, last := right } }
      | none => firstPairing? choices left rights

/-- Greedily match equal-component edges, consuming each right edge once. -/
private def pairEdges (choices : List (RowChoice Label)) :
    List (Edge Label) → List (Edge Label) →
      List (WeightedEdgePairingData Label)
  | [], _ => []
  | left :: lefts, rights =>
      match firstPairing? choices left rights with
      | some pairing =>
          pairing :: pairEdges choices lefts (rights.erase pairing.right)
      | none =>
          { left := left
            right := left
            path := { first := left, steps := [], last := left } } ::
            pairEdges choices lefts rights

/-- Construct a weighted cancellation from its terms and equality rows. -/
private def cancellationData (choices : List (RowChoice Label))
    (terms : List (WeightedKalmansonTerm Label)) :
    WeightedKalmansonCancellationData Label :=
  { terms := terms
    pairings := pairEdges choices
      (terms.flatMap WeightedKalmansonTerm.leftEdges)
      (terms.flatMap WeightedKalmansonTerm.rightEdges) }

/-- The challenged center-2 pair support selected by one bank entry. -/
def center2PairSupport (index : Fin 18) : Finset Label :=
  {(center2PairEndpoints index).1, (center2PairEndpoints index).2}

/-- Base rows together with one center-2 two-point challenged row. -/
def center2PairChoices (index : Fin 18) : List (RowChoice Label) :=
  baseChoices ++
    [{ center := rawToPos 2, support := center2PairSupport index }]

/-- The checked weighted cancellation attached to a center-2 challenged pair. -/
def center2PairCertificate (index : Fin 18) :
    WeightedKalmansonCancellationData Label :=
  cancellationData (center2PairChoices index) (center2PairTerms index)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction runs the transparent path finder on all eighteen entries.
/-- Every center-2 pair-bank cancellation passes the kernel-reduced checker. -/
theorem center2PairCertificate_check (index : Fin 18) :
    (center2PairCertificate index).check (center2PairChoices index) = true := by
  revert index
  decide

/-- The challenged center-5 pair support selected by one bank entry. -/
def center5PairSupport (index : Fin 27) : Finset Label :=
  {(center5PairEndpoints index).1, (center5PairEndpoints index).2}

/-- Base rows together with one center-5 two-point challenged row. -/
def center5PairChoices (index : Fin 27) : List (RowChoice Label) :=
  baseChoices ++
    [{ center := rawToPos 5, support := center5PairSupport index }]

/-- The checked weighted cancellation attached to a center-5 challenged pair. -/
def center5PairCertificate (index : Fin 27) :
    WeightedKalmansonCancellationData Label :=
  cancellationData (center5PairChoices index) (center5PairTerms index)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction runs the transparent path finder on all twenty-seven entries.
/-- Every center-5 pair-bank cancellation passes the kernel-reduced checker. -/
theorem center5PairCertificate_check (index : Fin 27) :
    (center5PairCertificate index).check (center5PairChoices index) = true := by
  revert index
  decide

/-- Common center-2 support over every residual cell routed to one certificate. -/
def jointCenter2Core (certificate : Fin 63) : Finset Label :=
  Finset.univ.filter fun point =>
    ∀ index2 : Fin 27, ∀ index5 : Fin 16,
      jointRoute index2 index5 = certificate →
        point ∈ center2Domain index2

/-- Common center-5 support over every residual cell routed to one certificate. -/
def jointCenter5Core (certificate : Fin 63) : Finset Label :=
  Finset.univ.filter fun point =>
    ∀ index2 : Fin 27, ∀ index5 : Fin 16,
      jointRoute index2 index5 = certificate →
        point ∈ center5Domain index5

/-- The center-2 common core lies in every support of its route fiber. -/
theorem jointCenter2Core_subset (index2 : Fin 27) (index5 : Fin 16) :
    jointCenter2Core (jointRoute index2 index5) ⊆ center2Domain index2 := by
  intro point hpoint
  exact (Finset.mem_filter.mp hpoint).2 index2 index5 rfl

/-- The center-5 common core lies in every support of its route fiber. -/
theorem jointCenter5Core_subset (index2 : Fin 27) (index5 : Fin 16) :
    jointCenter5Core (jointRoute index2 index5) ⊆ center5Domain index5 := by
  intro point hpoint
  exact (Finset.mem_filter.mp hpoint).2 index2 index5 rfl

/-- Base rows together with the two route-fiber common challenged rows. -/
def jointChoices (certificate : Fin 63) : List (RowChoice Label) :=
  baseChoices ++
    [{ center := rawToPos 2, support := jointCenter2Core certificate }] ++
    [{ center := rawToPos 5, support := jointCenter5Core certificate }]

/-- The weighted cancellation attached to one joint route-fiber certificate. -/
def jointCertificate (certificate : Fin 63) :
    WeightedKalmansonCancellationData Label :=
  cancellationData (jointChoices certificate) (jointTerms certificate)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction runs the transparent path finder on all sixty-three entries.
/-- Every joint-bank cancellation passes the kernel-reduced checker. -/
theorem jointCertificate_check (certificate : Fin 63) :
    (jointCertificate certificate).check (jointChoices certificate) = true := by
  revert certificate
  decide

end CardGeThirteenTwoCanonicalK4FixedCellCertificateBank
end ATailFrontierLiveClosure
end Problem97
