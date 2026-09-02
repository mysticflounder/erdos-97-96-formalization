/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555FiniteConfiguration
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Balanced555KalmansonNoGood
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221TerminalBankConsumer
import Erdos9796Proof.P97.Certificate.CheckpointedRupSemanticBoundary

/-!
# Exact Boolean formula for the balanced `(5, 5, 5)` branch

This module is the Lean mirror of `scripts/generate_balanced555_finite_cnf.py`.
It defines the complete ordered signed-DIMACS ledger without embedding its 50,113
clauses as source text.  Kalmanson clauses retain the subset, dihedral placement,
three required row pairs, and two ordered quadruples from which they were derived.

Variables `1..132` encode off-diagonal selected-row incidence, `133..138` encode
the six lexicographic assignments of the three first-interior roles, and `139..148`
encode the possible middle label.  Consequently the compact RUP checker uses
`PosFin 149`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.EqualityCore
open Census554.CoverCnf
open CheckpointedRup.SemanticBoundary
open ExactTwelveRigid221Ingress.TerminalBankConsumer
open GenericRowNogoodCertificate

namespace Balanced555FiniteFormula

open Std.Tactic.BVDecide.LRAT.Internal

/-- The checker bound whose positive inhabitants are exactly variables `1..148`. -/
def variableBound : Nat := 149

/-- The twelve boundary labels in increasing order. -/
def labels : List (Fin 12) := List.finRange 12

private def fin12 (value : Nat) : Fin 12 :=
  ⟨value % 12, Nat.mod_lt _ (by omega)⟩

/-- Reflection of the cyclic labels across the zero cut: `p ↦ -p mod 12`. -/
def reflectLabel (label : Fin 12) : Fin 12 := fin12 (12 - label.val)

@[simp] theorem reflectLabel_involutive (label : Fin 12) :
    reflectLabel (reflectLabel label) = label := by
  fin_cases label <;> rfl

/-- Python-`itertools.combinations` order: include the head before omitting it. -/
def combinations : List α → Nat → List (List α)
  | _, 0 => [[]]
  | [], _ + 1 => []
  | x :: xs, k + 1 =>
      (combinations xs k).map (fun rest ↦ x :: rest) ++ combinations xs (k + 1)

/-- The one-based row-incidence variable used by the DIMACS generator. -/
def rowVariable (center point : Fin 12) : Nat :=
  center.val * 11 + (if point.val < center.val then point.val else point.val - 1) + 1

/-- Positive signed-DIMACS literal. -/
def positiveLiteral (atom : Nat) : Int := atom

/-- Negative signed-DIMACS literal. -/
def negativeLiteral (atom : Nat) : Int := -(atom : Int)

/-- The three fixed boundary arcs, in generator order. -/
def boundaryCaps : List (List (Fin 12)) :=
  [[0, 1, 2, 3, 4], [4, 5, 6, 7, 8], [0, 8, 9, 10, 11]]

/-- The strict interior opposite the surplus apex. -/
def surplusInterior : List (Fin 12) := [5, 6, 7]

/-- The strict interior opposite the first named apex. -/
def firstInterior : Balanced555Orientation → List (Fin 12)
  | .direct => [9, 10, 11]
  | .mirror => [1, 2, 3]

/-- The strict interior opposite the second named apex. -/
def secondInterior : Balanced555Orientation → List (Fin 12)
  | .direct => [1, 2, 3]
  | .mirror => [9, 10, 11]

/-- The labels allowed for the middle row, in selector order. -/
def middleLabels (orientation : Balanced555Orientation) : List (Fin 12) :=
  labels.filter fun label ↦
    decide (label ≠ orientation.firstApex ∧ label ≠ orientation.secondApex)

/-- The six lexicographic permutations of the first-interior role triple. -/
def roleTriples (orientation : Balanced555Orientation) :
    List (Fin 12 × Fin 12 × Fin 12) :=
  match firstInterior orientation with
  | [a, b, c] => [(a, b, c), (a, c, b), (b, a, c), (b, c, a), (c, a, b), (c, b, a)]
  | _ => []

/-- Clause families in the exact generator ledger. -/
inductive ClauseFamily where
  | rowCardAtMost
  | rowCardAtLeast
  | capUpper
  | apexOppositeInterior
  | apexAdjacentCap
  | roleExactOne
  | middleExactOne
  | tightMembership
  | intersection
  | cover
  | sharedAlternation
  | kalmanson
  deriving Repr, DecidableEq

/-- The five Kalmanson obstruction schemas, in generator order. -/
inductive KalmansonSchema where
  | s5a
  | s5b
  | s6a
  | s6b
  | s6c
  deriving Repr, DecidableEq

/-- One row-center and its two required selected points. -/
structure RowPairRequirement where
  center : Fin 12
  first : Fin 12
  second : Fin 12
  deriving Repr, DecidableEq

/-- One cyclic K1/K2 quadruple exactly as emitted by the Python generator.

After a nonzero dihedral offset this list need not be increasing in `Fin 12`.
It must therefore be canonically reordered, with its form transported, before
it is used as `GenericRowNogoodCertificate.OrderedQuadData`. -/
structure OrderedQuadruple where
  kind : Nat
  points : List (Fin 12)
  deriving Repr, DecidableEq, Inhabited

/-- Complete source metadata for one effective Kalmanson occurrence. -/
structure KalmansonOccurrence where
  schema : KalmansonSchema
  subset : List (Fin 12)
  offset : Nat
  reflected : Bool
  rowRequirements : List RowPairRequirement
  orderedRows : List OrderedQuadruple
  deriving Repr, DecidableEq

/-- One ordered clause together with its source family and optional occurrence. -/
structure Clause where
  family : ClauseFamily
  literals : List Int
  occurrence : Option KalmansonOccurrence := none
  deriving Repr, DecidableEq

private def plainClause (family : ClauseFamily) (literals : List Int) : Clause :=
  { family, literals }

def offDiagonalLabels (center : Fin 12) : List (Fin 12) :=
  labels.filter fun point ↦ decide (point ≠ center)

private def interCard (left right : List (Fin 12)) : Nat :=
  (left.filter fun point ↦ decide (point ∈ right)).length

def apexAdjacentCaps (orientation : Balanced555Orientation)
    (center : Fin 12) : List (List (Fin 12)) :=
  if center = 0 then
    [boundaryCaps[0]!, boundaryCaps[2]!]
  else if center = orientation.firstApex then
    match orientation with
    | .direct => [boundaryCaps[0]!, boundaryCaps[1]!]
    | .mirror => [boundaryCaps[1]!, boundaryCaps[2]!]
  else
    match orientation with
    | .direct => [boundaryCaps[1]!, boundaryCaps[2]!]
    | .mirror => [boundaryCaps[0]!, boundaryCaps[1]!]

private def oppositeInterior (orientation : Balanced555Orientation)
    (center : Fin 12) : List (Fin 12) :=
  if center = 0 then surplusInterior
  else if center = orientation.firstApex then firstInterior orientation
  else secondInterior orientation

/-- Exact local-domain predicate used when filtering Kalmanson occurrences. -/
def localSupportOK (orientation : Balanced555Orientation)
    (center : Fin 12) (support : List (Fin 12)) : Bool :=
  if center = 0 ∨ center = orientation.firstApex ∨ center = orientation.secondApex then
    decide (2 ≤ interCard support (oppositeInterior orientation center)) &&
      (apexAdjacentCaps orientation center).all fun cap ↦
        decide (interCard support cap ≤ 1)
  else
    (boundaryCaps.filter fun cap ↦ decide (center ∈ cap)).all fun cap ↦
      decide (interCard support cap ≤ 2)

/-- All four-point local supports, retaining the Python combination order. -/
def localDomain (orientation : Balanced555Orientation)
    (center : Fin 12) : List (List (Fin 12)) :=
  (combinations (offDiagonalLabels center) 4).filter fun support ↦
    localSupportOK orientation center support

private structure KalmansonSchemaData where
  schema : KalmansonSchema
  size : Nat
  rowPairs : List (Nat × Nat × Nat)
  orderedRows : List (Nat × List Nat)

private def schemaData : List KalmansonSchemaData :=
  [ { schema := .s5a, size := 5,
      rowPairs := [(0, 1, 2), (1, 2, 3), (4, 1, 3)],
      orderedRows := [(2, [0, 1, 2, 3]), (1, [0, 1, 3, 4])] },
    { schema := .s5b, size := 5,
      rowPairs := [(0, 1, 2), (1, 2, 4), (3, 1, 4)],
      orderedRows := [(2, [0, 1, 2, 3]), (1, [0, 1, 3, 4])] },
    { schema := .s6a, size := 6,
      rowPairs := [(0, 1, 2), (3, 2, 5), (4, 1, 5)],
      orderedRows := [(1, [0, 1, 2, 3]), (1, [1, 3, 4, 5])] },
    { schema := .s6b, size := 6,
      rowPairs := [(0, 1, 2), (4, 1, 3), (5, 2, 3)],
      orderedRows := [(1, [0, 1, 2, 5]), (2, [1, 3, 4, 5])] },
    { schema := .s6c, size := 6,
      rowPairs := [(0, 1, 3), (4, 1, 2), (5, 2, 3)],
      orderedRows := [(1, [0, 1, 2, 4]), (1, [0, 2, 3, 5])] } ]

private def imagePosition (subset : List (Fin 12)) (offset : Nat)
    (reflected : Bool) (position : Nat) : Fin 12 :=
  let size := subset.length
  let index :=
    if reflected then (offset + size - position % size) % size
    else (offset + position) % size
  subset[index]!

private def occurrenceRequirements (data : KalmansonSchemaData)
    (subset : List (Fin 12)) (offset : Nat) (reflected : Bool) :
    List RowPairRequirement :=
  data.rowPairs.map fun (center, first, second) ↦
    { center := imagePosition subset offset reflected center
      first := imagePosition subset offset reflected first
      second := imagePosition subset offset reflected second }

private def occurrenceOrderedRows (data : KalmansonSchemaData)
    (subset : List (Fin 12)) (offset : Nat) (reflected : Bool) :
    List OrderedQuadruple :=
  data.orderedRows.map fun (kind, positions) ↦
    { kind
      points := positions.map (imagePosition subset offset reflected) }

private def requirementExtendable (domains : List (List (List (Fin 12))))
    (requirement : RowPairRequirement) : Bool :=
  domains[requirement.center.val]!.any fun support ↦
    decide (requirement.first ∈ support ∧ requirement.second ∈ support)

/-- Effective Kalmanson occurrences, in schema/subset/offset/reflection order. -/
def kalmansonOccurrences (orientation : Balanced555Orientation) : List KalmansonOccurrence :=
  let domains := labels.map (localDomain orientation)
  schemaData.flatMap fun data ↦
    (combinations labels data.size).flatMap fun subset ↦
      (List.range data.size).flatMap fun offset ↦
        [false, true].filterMap fun reflected ↦
          let requirements := occurrenceRequirements data subset offset reflected
          if requirements.all (requirementExtendable domains) then
            some
              { schema := data.schema
                subset
                offset
                reflected
                rowRequirements := requirements
                orderedRows := occurrenceOrderedRows data subset offset reflected }
          else none

/- ## Transport to the checked Kalmanson no-good interface -/

private def checkedRowPair (requirement : RowPairRequirement) :
    Balanced555RequiredRowPair :=
  { center := requirement.center
    first := requirement.first
    second := requirement.second }

private def defaultCheckedRowPair : Balanced555RequiredRowPair :=
  { center := 0, first := 0, second := 0 }

private def sortedOrderedQuad (quad : OrderedQuadruple) : OrderedQuadData (Fin 12) :=
  let points := quad.points.mergeSort fun left right ↦ decide (left < right)
  { a := points[0]!
    b := points[1]!
    c := points[2]!
    d := points[3]! }

private def transportedKinds : List Balanced555KalmansonKind := [.k1, .k2]

private def permutationCandidates : List Permutation4Data :=
  (List.finRange 4).flatMap fun image0 ↦
    (List.finRange 4).flatMap fun image1 ↦
      (List.finRange 4).flatMap fun image2 ↦
        (List.finRange 4).filterMap fun image3 ↦
          let permutation : Permutation4Data := { image0, image1, image2, image3 }
          if permutation.check then some permutation else none

private def rowClosureSteps (rows : List Balanced555RequiredRowPair)
    (edge : Edge (Fin 12)) : List (PrimitiveEqualityStep (Fin 12)) :=
  rows.flatMap fun row ↦
    if edge = (row.center, row.first) then
      [.row row.center row.first row.second]
    else if edge = (row.center, row.second) then
      [.row row.center row.second row.first]
    else []

private def outgoingClosureSteps (rows : List Balanced555RequiredRowPair)
    (edge : Edge (Fin 12)) : List (PrimitiveEqualityStep (Fin 12)) :=
  .flip edge.1 edge.2 :: rowClosureSteps rows edge

private def firstSome (f : α → Option β) : List α → Option β
  | [] => none
  | value :: values =>
      match f value with
      | some result => some result
      | none => firstSome f values

private def closureSteps? (rows : List Balanced555RequiredRowPair) :
    Nat → Edge (Fin 12) → Edge (Fin 12) → Option (List (PrimitiveEqualityStep (Fin 12)))
  | 0, first, last => if first = last then some [] else none
  | fuel + 1, first, last =>
      if first = last then some []
      else
        firstSome
          (fun step ↦
            (closureSteps? rows fuel step.target last).map (fun steps ↦ step :: steps))
          (outgoingClosureSteps rows first)

/-- The finite template search needs at most three primitive equality steps. -/
private def closurePath (rows : List Balanced555RequiredRowPair)
    (first last : Edge (Fin 12)) : ClosurePathData (Fin 12) :=
  { first
    steps := (closureSteps? rows 3 first last).getD []
    last }

private def transportedCandidate (occurrence : KalmansonOccurrence)
    (firstKind secondKind : Balanced555KalmansonKind)
    (permutation : Permutation4Data) : Balanced555KalmansonOccurrenceData :=
  let rows := occurrence.rowRequirements.map checkedRowPair
  let row0 := rows[0]?.getD defaultCheckedRowPair
  let row1 := rows[1]?.getD defaultCheckedRowPair
  let row2 := rows[2]?.getD defaultCheckedRowPair
  let firstQuad := sortedOrderedQuad occurrence.orderedRows[0]!
  let secondQuad := sortedOrderedQuad occurrence.orderedRows[1]!
  let leftEdges : List (Edge (Fin 12)) :=
    [firstQuad.leftEdge0 firstKind.form, firstQuad.leftEdge1 firstKind.form,
      secondQuad.leftEdge0 secondKind.form, secondQuad.leftEdge1 secondKind.form]
  let rightEdges : List (Edge (Fin 12)) :=
    [firstQuad.rightEdge0, firstQuad.rightEdge1,
      secondQuad.rightEdge0, secondQuad.rightEdge1]
  { row0
    row1
    row2
    firstQuad
    firstKind
    secondQuad
    secondKind
    permutation
    path0 := closurePath rows leftEdges[0]! rightEdges[(permutation.apply 0).val]!
    path1 := closurePath rows leftEdges[1]! rightEdges[(permutation.apply 1).val]!
    path2 := closurePath rows leftEdges[2]! rightEdges[(permutation.apply 2).val]!
    path3 := closurePath rows leftEdges[3]! rightEdges[(permutation.apply 3).val]! }

private def transportedCandidates (occurrence : KalmansonOccurrence) :
    List Balanced555KalmansonOccurrenceData :=
  transportedKinds.flatMap fun firstKind ↦
    transportedKinds.flatMap fun secondKind ↦
      permutationCandidates.map fun permutation ↦
        transportedCandidate occurrence firstKind secondKind permutation

private def firstValidTransport :
    List Balanced555KalmansonOccurrenceData → Option Balanced555KalmansonOccurrenceData
  | [] => none
  | data :: candidates =>
      if data.cancellationData.check data.rowChoices then some data
      else firstValidTransport candidates

private structure TransportChoice where
  firstKind : Balanced555KalmansonKind
  secondKind : Balanced555KalmansonKind
  permutation : Permutation4Data

private def defaultTransportChoice : TransportChoice :=
  { firstKind := .k1
    secondKind := .k1
    permutation := { image0 := 0, image1 := 1, image2 := 2, image3 := 3 } }

private def choiceOfData (data : Balanced555KalmansonOccurrenceData) : TransportChoice :=
  { firstKind := data.firstKind
    secondKind := data.secondKind
    permutation := data.permutation }

private def canonicalOccurrence (data : KalmansonSchemaData)
    (offset : Nat) (reflected : Bool) : KalmansonOccurrence :=
  let subset := (List.range data.size).map fin12
  { schema := data.schema
    subset
    offset
    reflected
    rowRequirements := occurrenceRequirements data subset offset reflected
    orderedRows := occurrenceOrderedRows data subset offset reflected }

private structure TransportTableEntry where
  schema : KalmansonSchema
  offset : Nat
  reflected : Bool
  choice : TransportChoice

/-- The 56 schema/offset/reflection witnesses.  The table is a closed value, so
the exhaustive form/permutation search is shared instead of repeated for every
concrete five- or six-subset. -/
private def transportTable : List TransportTableEntry :=
  schemaData.flatMap fun data ↦
    (List.range data.size).flatMap fun offset ↦
      [false, true].map fun reflected ↦
        let canonical := canonicalOccurrence data offset reflected
        let choice :=
          (firstValidTransport (transportedCandidates canonical)).map choiceOfData
        { schema := data.schema
          offset
          reflected
          choice := choice.getD defaultTransportChoice }

private def transportChoice (occurrence : KalmansonOccurrence) : TransportChoice :=
  ((transportTable.find? fun entry ↦
      entry.schema == occurrence.schema && entry.offset == occurrence.offset &&
        entry.reflected == occurrence.reflected).map TransportTableEntry.choice).getD
    defaultTransportChoice

/-- Sort the two cyclic quadruples, transport their Kalmanson forms, and select
the first checked cancellation permutation and its four shortest closure paths. -/
def transportedOccurrenceData (occurrence : KalmansonOccurrence) :
    Balanced555KalmansonOccurrenceData :=
  let choice := transportChoice occurrence
  transportedCandidate occurrence choice.firstKind choice.secondKind choice.permutation

/-- Executable audit of every retained occurrence for one orientation. -/
def transportedOccurrencesValid (orientation : Balanced555Orientation) : Bool :=
  (kalmansonOccurrences orientation).all fun occurrence ↦
    let data := transportedOccurrenceData occurrence
    data.cancellationData.check data.rowChoices

set_option linter.style.nativeDecide false in
/-- The exhaustive 56-template search succeeds for every retained occurrence.

The computation is performed once for each concrete orientation.  Its dependency
closure is ordinary verified Lean code; `native_decide` supplies the repository's
approved `Lean.ofReduceBool`/compiler-trust boundary for this finite census. -/
theorem transportedOccurrencesValid_eq_true (orientation : Balanced555Orientation) :
    transportedOccurrencesValid orientation = true := by
  cases orientation <;> native_decide

/-- Any occurrence retained by the generator constructs a checker-valid geometric
no-good occurrence. -/
def checkedKalmansonOccurrence (orientation : Balanced555Orientation)
    (occurrence : KalmansonOccurrence)
    (hoccurrence : occurrence ∈ kalmansonOccurrences orientation) :
    Balanced555KalmansonOccurrence :=
  { data := transportedOccurrenceData occurrence
    valid := by
      have hall := transportedOccurrencesValid_eq_true orientation
      rw [transportedOccurrencesValid, List.all_eq_true] at hall
      exact hall occurrence hoccurrence }

def rowCardinalityClauses : List Clause :=
  labels.flatMap fun center ↦
    let candidates := offDiagonalLabels center
    ((combinations candidates 5).map fun subset ↦
      plainClause .rowCardAtMost
        (subset.map fun point ↦ negativeLiteral (rowVariable center point)))
    ++
    ((combinations candidates 8).map fun subset ↦
      plainClause .rowCardAtLeast
        (subset.map fun point ↦ positiveLiteral (rowVariable center point)))

def capUpperClauses : List Clause :=
  boundaryCaps.flatMap fun cap ↦
    cap.flatMap fun center ↦
      let candidates := cap.filter fun point ↦ decide (point ≠ center)
      (combinations candidates 3).map fun subset ↦
        plainClause .capUpper (subset.map fun point ↦ negativeLiteral (rowVariable center point))

def apexClauses (orientation : Balanced555Orientation) : List Clause :=
  let apexes := [(0 : Fin 12), orientation.firstApex, orientation.secondApex]
  let interiors := [surplusInterior, firstInterior orientation, secondInterior orientation]
  (apexes.zip interiors).flatMap fun (center, interior) ↦
    (combinations interior 2).map (fun subset ↦
      plainClause .apexOppositeInterior
        (subset.map fun point ↦ positiveLiteral (rowVariable center point)))
    ++
    (apexAdjacentCaps orientation center).flatMap fun cap ↦
      let candidates := cap.filter fun point ↦ decide (point ≠ center)
      (combinations candidates 2).map fun subset ↦
        plainClause .apexAdjacentCap
          (subset.map fun point ↦ negativeLiteral (rowVariable center point))

def lowerPairs (count : Nat) : List (Nat × Nat) :=
  (List.range count).flatMap fun first ↦
    (List.range first).map fun second ↦ (first, second)

def selectorClauses : List Clause :=
  [plainClause .roleExactOne ((List.range 6).map fun index ↦ positiveLiteral (133 + index))]
  ++ (lowerPairs 6).map (fun (first, second) ↦
      plainClause .roleExactOne [negativeLiteral (133 + first), negativeLiteral (133 + second)])
  ++ [plainClause .middleExactOne ((List.range 10).map fun index ↦ positiveLiteral (139 + index))]
  ++ (lowerPairs 10).map (fun (first, second) ↦
      plainClause .middleExactOne [negativeLiteral (139 + first), negativeLiteral (139 + second)])

def fixedRoleClauses (orientation : Balanced555Orientation) : List Clause :=
  (roleTriples orientation).zipIdx.flatMap fun ((deleted, retained, third), index) ↦
    let role := 133 + index
    let facts : List (Fin 12 × Fin 12 × Bool) :=
      [ (orientation.firstApex, deleted, false),
        (orientation.secondApex, deleted, false),
        (orientation.firstApex, retained, true),
        (orientation.secondApex, retained, false),
        (orientation.firstApex, third, true) ]
    facts.map fun (center, point, polarity) ↦
      let literal :=
        if polarity then positiveLiteral (rowVariable center point)
        else negativeLiteral (rowVariable center point)
      plainClause .tightMembership [negativeLiteral role, literal]

def middleRoleClauses (orientation : Balanced555Orientation) : List Clause :=
  (roleTriples orientation).zipIdx.flatMap fun ((deleted, retained, _third), roleIndex) ↦
    let role := 133 + roleIndex
    (middleLabels orientation).zipIdx.flatMap fun (middle, middleIndex) ↦
      let middleSelector := 139 + middleIndex
      (if middle ≠ deleted then
          [plainClause .tightMembership
            [negativeLiteral role, negativeLiteral middleSelector,
              negativeLiteral (rowVariable middle deleted)]]
        else [])
      ++
      (if middle ≠ retained then
          [plainClause .tightMembership
            [negativeLiteral role, negativeLiteral middleSelector,
              positiveLiteral (rowVariable middle retained)]]
        else
          [plainClause .tightMembership [negativeLiteral role, negativeLiteral middleSelector]])

def intersectionClauses (orientation : Balanced555Orientation) : List Clause :=
  let firstSecond :=
    (labels.filter fun point ↦
      decide (point ≠ orientation.firstApex ∧ point ≠ orientation.secondApex)).map
      fun point ↦
        plainClause .intersection
          [negativeLiteral (rowVariable orientation.firstApex point),
            negativeLiteral (rowVariable orientation.secondApex point)]
  let middleSecond :=
    (middleLabels orientation).zipIdx.flatMap fun (middle, middleIndex) ↦
      labels.filterMap fun point ↦
        if point ≠ middle ∧ point ≠ orientation.secondApex then
          some <| plainClause .intersection
            [negativeLiteral (139 + middleIndex), negativeLiteral (rowVariable middle point),
              negativeLiteral (rowVariable orientation.secondApex point)]
        else none
  let firstMiddle :=
    (roleTriples orientation).zipIdx.flatMap fun ((_deleted, retained, _third), roleIndex) ↦
      (middleLabels orientation).zipIdx.flatMap fun (middle, middleIndex) ↦
        labels.filterMap fun point ↦
          if point ≠ orientation.firstApex ∧ point ≠ middle ∧ point ≠ retained then
            some <| plainClause .intersection
              [ negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex),
                negativeLiteral (rowVariable orientation.firstApex point),
                negativeLiteral (rowVariable middle point) ]
          else none
  firstSecond ++ middleSecond ++ firstMiddle

def coverClauses (orientation : Balanced555Orientation) : List Clause :=
  (roleTriples orientation).zipIdx.flatMap fun ((deleted, _retained, _third), roleIndex) ↦
    (middleLabels orientation).zipIdx.flatMap fun (middle, middleIndex) ↦
      labels.filterMap fun point ↦
        if point = deleted then none
        else
          let literals := [negativeLiteral (133 + roleIndex), negativeLiteral (139 + middleIndex)]
            ++ (if point ≠ orientation.firstApex then
                  [positiveLiteral (rowVariable orientation.firstApex point)] else [])
            ++ (if point ≠ middle then [positiveLiteral (rowVariable middle point)] else [])
            ++ (if point ≠ orientation.secondApex then
                  [positiveLiteral (rowVariable orientation.secondApex point)] else [])
          some <| plainClause .cover literals

def alternatingCenters (four centers : List (Fin 12)) : Bool :=
  match four with
  | [first, second, third, fourth] =>
      decide (centers = [first, third] ∨ centers = [second, fourth])
  | _ => false

def sharedAlternationClauses : List Clause :=
  (combinations labels 4).flatMap fun four ↦
    (combinations four 2).filterMap fun centers ↦
      if alternatingCenters four centers then none
      else
        let points := four.filter fun point ↦ decide (point ∉ centers)
        some <| plainClause .sharedAlternation <|
          centers.flatMap fun center ↦
            points.map fun point ↦ negativeLiteral (rowVariable center point)

/-- The six-negative signed clause represented by source occurrence metadata. -/
def signedClauseOfOccurrence (occurrence : KalmansonOccurrence) : List Int :=
  occurrence.rowRequirements.flatMap fun requirement ↦
    [ negativeLiteral (rowVariable requirement.center requirement.first),
      negativeLiteral (rowVariable requirement.center requirement.second) ]

/-- Encode a typed selected-row literal as a signed-DIMACS literal. -/
def encodeSelectedLiteral (literal : (Fin 12 × Fin 12) × Bool) : Int :=
  if literal.2 then positiveLiteral (rowVariable literal.1.1 literal.1.2)
  else negativeLiteral (rowVariable literal.1.1 literal.1.2)

/-- Signed-DIMACS encoding of the geometric checker's typed no-good clause. -/
def encodedNoGoodClause (data : Balanced555KalmansonOccurrenceData) : List Int :=
  data.noGoodClause.map encodeSelectedLiteral

/-- All Kalmanson clauses, in exact generator order. -/
def kalmansonSignedClauses (orientation : Balanced555Orientation) : List (List Int) :=
  (kalmansonOccurrences orientation).map signedClauseOfOccurrence

private def transportedOccurrencesExact (orientation : Balanced555Orientation) : Bool :=
  (kalmansonOccurrences orientation).all fun occurrence ↦
    let data := transportedOccurrenceData occurrence
    decide (encodedNoGoodClause data = signedClauseOfOccurrence occurrence) &&
      data.positiveAtoms.all fun atom ↦ decide (atom.1 ≠ atom.2)

set_option linter.style.nativeDecide false in
/-- The transported checker data preserves the source clause exactly and every
encoded row atom is off-diagonal. -/
theorem transportedOccurrencesExact_eq_true (orientation : Balanced555Orientation) :
    transportedOccurrencesExact orientation = true := by
  cases orientation <;> native_decide

theorem transportedOccurrence_exact_and_offDiagonal
    (orientation : Balanced555Orientation) (occurrence : KalmansonOccurrence)
    (hoccurrence : occurrence ∈ kalmansonOccurrences orientation) :
    encodedNoGoodClause (transportedOccurrenceData occurrence) =
        signedClauseOfOccurrence occurrence ∧
      ∀ atom ∈ (transportedOccurrenceData occurrence).positiveAtoms, atom.1 ≠ atom.2 := by
  have hall := transportedOccurrencesExact_eq_true orientation
  rw [transportedOccurrencesExact, List.all_eq_true] at hall
  have hoccurrenceExact := hall occurrence hoccurrence
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hoccurrenceExact
  refine ⟨hoccurrenceExact.1, ?_⟩
  rw [List.all_eq_true] at hoccurrenceExact
  intro atom hatom
  exact of_decide_eq_true (hoccurrenceExact.2 atom hatom)

/-- The checked occurrences corresponding one-for-one to the source ledger. -/
def checkedKalmansonOccurrences (orientation : Balanced555Orientation) :
    List Balanced555KalmansonOccurrence :=
  (kalmansonOccurrences orientation).attach.map fun occurrence ↦
    checkedKalmansonOccurrence orientation occurrence.1 occurrence.2

/-- Every generated Kalmanson clause is exactly the encoded no-good clause of a
checker-valid occurrence, with only off-diagonal row atoms. -/
theorem exists_checkedOccurrence_of_mem_kalmansonSignedClauses
    (orientation : Balanced555Orientation) (clause : List Int)
    (hclause : clause ∈ kalmansonSignedClauses orientation) :
    ∃ occurrence : Balanced555KalmansonOccurrence,
      encodedNoGoodClause occurrence.data = clause ∧
        ∀ atom ∈ occurrence.data.positiveAtoms, atom.1 ≠ atom.2 := by
  obtain ⟨source, hsource, rfl⟩ := List.mem_map.mp hclause
  let occurrence := checkedKalmansonOccurrence orientation source hsource
  exact ⟨occurrence, transportedOccurrence_exact_and_offDiagonal orientation source hsource⟩

private def kalmansonClauses (orientation : Balanced555Orientation) : List Clause :=
  (kalmansonOccurrences orientation).map fun occurrence ↦
    { family := .kalmanson
      literals := signedClauseOfOccurrence occurrence
      occurrence := some occurrence }

/-- The 11,131 non-Kalmanson clauses, in the exact generator order. -/
def structuralClauses (orientation : Balanced555Orientation) : List Clause :=
  rowCardinalityClauses ++ capUpperClauses ++ apexClauses orientation ++ selectorClauses ++
    fixedRoleClauses orientation ++ middleRoleClauses orientation ++
    intersectionClauses orientation ++ coverClauses orientation ++ sharedAlternationClauses

/-- The complete 50,113-clause metadata ledger. -/
def clauseLedger (orientation : Balanced555Orientation) : List Clause :=
  structuralClauses orientation ++ kalmansonClauses orientation

/-- The exact signed-DIMACS clause list consumed by compact RUP ingress. -/
def clauses (orientation : Balanced555Orientation) : List (List Int) :=
  (clauseLedger orientation).map Clause.literals

/-- Expected clause inventory, recorded independently of executable reduction. -/
def expectedPositiveControlCount : Nat := 9151

/-- Expected complete clause count for either orientation. -/
def expectedClauseCount : Nat := 50113

/-- The structural positive-control fragment omits Kalmanson and shared-pair cuts. -/
def positiveControlClauses (orientation : Balanced555Orientation) : List (List Int) :=
  ((rowCardinalityClauses ++ capUpperClauses ++ apexClauses orientation ++ selectorClauses ++
    fixedRoleClauses orientation ++ middleRoleClauses orientation ++
    intersectionClauses orientation ++ coverClauses orientation).map Clause.literals)

/-- The complete formula splits into its structural prefix and exact Kalmanson suffix. -/
theorem clauses_eq_structural_append_kalmansonSignedClauses
    (orientation : Balanced555Orientation) :
    clauses orientation =
      (structuralClauses orientation).map Clause.literals ++
        kalmansonSignedClauses orientation := by
  simp [clauses, clauseLedger, kalmansonClauses, kalmansonSignedClauses,
    signedClauseOfOccurrence]

/-- All independently specified formula census anchors. -/
def finiteCensusOK (orientation : Balanced555Orientation) : Bool :=
  decide ((structuralClauses orientation).length = 11131) &&
    decide ((kalmansonSignedClauses orientation).length = 38982) &&
    decide ((clauses orientation).length = expectedClauseCount) &&
    decide ((positiveControlClauses orientation).length = expectedPositiveControlCount)

set_option linter.style.nativeDecide false in
/-- The compact executable definitions reproduce the Python generator's clause counts. -/
theorem finiteCensusOK_eq_true (orientation : Balanced555Orientation) :
    finiteCensusOK orientation = true := by
  cases orientation <;> native_decide

/-- Decode the center of a row-incidence atom. -/
def rowCenter (atom : Nat) : Fin 12 := fin12 ((atom - 1) / 11)

/-- Decode the selected point of a row-incidence atom. -/
def rowPoint (atom : Nat) : Fin 12 :=
  let center := (atom - 1) / 11
  let offset := (atom - 1) % 11
  fin12 (if offset < center then offset else offset + 1)

theorem rowVariable_pos (center point : Fin 12) :
    1 ≤ rowVariable center point := by
  simp [rowVariable]

theorem rowVariable_le (center point : Fin 12) :
    rowVariable center point ≤ 132 := by
  simp only [rowVariable]
  split <;> omega

@[simp] theorem rowCenter_rowVariable (center point : Fin 12) (hne : center ≠ point) :
    rowCenter (rowVariable center point) = center := by
  fin_cases center <;> fin_cases point <;>
    simp [rowCenter, rowVariable, fin12] at hne ⊢

@[simp] theorem rowPoint_rowVariable (center point : Fin 12) (hne : center ≠ point) :
    rowPoint (rowVariable center point) = point := by
  fin_cases center <;> fin_cases point <;>
    simp [rowPoint, rowVariable, fin12] at hne ⊢

/-- The role-selector index induced by cyclic reflection. -/
def reflectRoleIndex (index : Nat) : Nat := 5 - index

/-- The middle-selector index induced by cyclic reflection. -/
def reflectMiddleIndex (index : Nat) : Nat := if index = 0 then 0 else 10 - index

/-- Reflection reverses the six role selectors in lexicographic order. -/
theorem reflect_roleTriple (index : Fin 6) :
    let direct := (roleTriples .direct)[index.val]!
    (roleTriples .mirror)[reflectRoleIndex index.val]! =
      (reflectLabel direct.1, reflectLabel direct.2.1, reflectLabel direct.2.2) := by
  fin_cases index <;> rfl

/-- Reflection fixes the zero middle selector and reverses the other nine. -/
theorem reflect_middleLabel (index : Fin 10) :
    (middleLabels .mirror)[reflectMiddleIndex index.val]! =
      reflectLabel (middleLabels .direct)[index.val]! := by
  fin_cases index <;> rfl

/-- Reflection of all three variable blocks.  Values outside `1..148` are fixed. -/
def reflectVariable (atom : Nat) : Nat :=
  if 1 ≤ atom ∧ atom ≤ 132 then
    rowVariable (reflectLabel (rowCenter atom)) (reflectLabel (rowPoint atom))
  else if 133 ≤ atom ∧ atom ≤ 138 then
    133 + reflectRoleIndex (atom - 133)
  else if 139 ≤ atom ∧ atom ≤ 148 then
    139 + reflectMiddleIndex (atom - 139)
  else atom

@[simp] theorem reflectVariable_rowVariable (center point : Fin 12) (hne : center ≠ point) :
    reflectVariable (rowVariable center point) =
      rowVariable (reflectLabel center) (reflectLabel point) := by
  have hbounds :
      1 ≤ rowVariable center point ∧ rowVariable center point ≤ 132 :=
    ⟨rowVariable_pos center point, rowVariable_le center point⟩
  simp [reflectVariable, hbounds, rowCenter_rowVariable center point hne,
    rowPoint_rowVariable center point hne]

@[simp] theorem reflectVariable_roleSelector (index : Fin 6) :
    reflectVariable (133 + index.val) = 133 + reflectRoleIndex index.val := by
  have hnotRow : ¬(1 ≤ 133 + index.val ∧ 133 + index.val ≤ 132) := by omega
  have hrole : 133 ≤ 133 + index.val ∧ 133 + index.val ≤ 138 := by omega
  simp [reflectVariable, hnotRow, hrole]

@[simp] theorem reflectVariable_middleSelector (index : Fin 10) :
    reflectVariable (139 + index.val) = 139 + reflectMiddleIndex index.val := by
  have hnotRow : ¬(1 ≤ 139 + index.val ∧ 139 + index.val ≤ 132) := by omega
  have hnotRole : ¬(133 ≤ 139 + index.val ∧ 139 + index.val ≤ 138) := by omega
  have hmiddle : 139 ≤ 139 + index.val ∧ 139 + index.val ≤ 148 := by omega
  simp [reflectVariable, hnotRow, hnotRole, hmiddle]

theorem reflectVariable_pos {atom : Nat} (hpos : 0 < atom) :
    0 < reflectVariable atom := by
  unfold reflectVariable
  split
  · exact rowVariable_pos _ _
  split
  · omega
  split <;> omega

/-- Preserve polarity while reflecting the variable of a signed literal. -/
def reflectLiteral : Int → Int
  | .ofNat atom => positiveLiteral (reflectVariable atom)
  | .negSucc predecessor => negativeLiteral (reflectVariable (predecessor + 1))

/-- Reflect every literal of a signed-DIMACS clause. -/
def reflectClause (clause : List Int) : List Int := clause.map reflectLiteral

/-- Mirror-oriented clauses obtained from the direct ledger by cyclic reflection. -/
def reflectedDirectClauses : List (List Int) :=
  (clauses .direct).map reflectClause

/-- Canonical literal order used to compare clauses modulo literal permutation. -/
def normalizeClause (clause : List Int) : List Int :=
  clause.mergeSort fun left right ↦ decide (left < right)

private def clauseLess : List Int → List Int → Bool
  | [], [] => false
  | [], _ :: _ => true
  | _ :: _, [] => false
  | left :: lefts, right :: rights =>
      if left < right then true
      else if left = right then clauseLess lefts rights
      else false

/-- Canonical clause and formula order for comparing CNFs modulo both clause and
literal permutation. -/
def normalizeFormula (formula : List (List Int)) : List (List Int) :=
  (formula.map normalizeClause).mergeSort clauseLess

set_option linter.style.nativeDecide false in
/-- Cyclic reflection takes the direct formula to the exact mirror clause set.

The two Python ledgers intentionally have different clause and literal orders, so
the theorem compares their canonical sorted forms. -/
theorem normalized_reflectedDirectClauses_eq_mirror :
    normalizeFormula reflectedDirectClauses = normalizeFormula (clauses .mirror) := by
  native_decide

/-- The concrete obligation needed to reuse the direct RUP payload for the mirror formula.

Only the first direction is needed for unsatisfiability transfer: each reflected
direct clause must occur in the mirror ledger after canonicalizing literal order.
The Python reconstruction checks this for all 50,113 clauses, but the proof is
intentionally not discharged here by a native reduction shortcut. -/
def DirectReflectionCoveredByMirror : Prop :=
  ∀ clause ∈ reflectedDirectClauses,
    normalizeClause clause ∈ (clauses .mirror).map normalizeClause

/-- Concrete normalized-clause coverage, derived from the checked formula census. -/
theorem directReflectionCoveredByMirror : DirectReflectionCoveredByMirror := by
  intro clause hclause
  have hnormalized : normalizeClause clause ∈ normalizeFormula reflectedDirectClauses := by
    simp only [normalizeFormula, List.mem_mergeSort]
    exact List.mem_map.mpr ⟨clause, hclause, rfl⟩
  rw [normalized_reflectedDirectClauses_eq_mirror] at hnormalized
  simpa only [normalizeFormula, List.mem_mergeSort] using hnormalized

/-- Literal permutation does not change proposition-valued clause satisfaction. -/
theorem clauseSat_normalizeClause_iff (valuation : Nat → Prop) (clause : List Int) :
    clauseSat valuation (normalizeClause clause) ↔ clauseSat valuation clause := by
  simp [clauseSat, normalizeClause, List.mem_mergeSort]

theorem evalLiteral_reflectLiteral (valuation : Nat → Bool) (literal : Int) :
    evalLitD valuation (reflectLiteral literal) =
      evalLitD (fun atom ↦ valuation (reflectVariable atom)) literal := by
  cases literal with
  | ofNat atom =>
      cases atom with
      | zero => rfl
      | succ predecessor =>
          have hpos : 0 < reflectVariable (predecessor + 1) :=
            reflectVariable_pos (by omega)
          norm_num [reflectLiteral, positiveLiteral, evalLitD, hpos]
          congr 2
  | negSucc predecessor =>
      have hpos : 0 < reflectVariable (predecessor + 1) :=
        reflectVariable_pos (by omega)
      norm_num [reflectLiteral, negativeLiteral, evalLitD, hpos]
      have hnegative : ¬(reflectVariable (predecessor + 1) : Int) < 0 := by
        omega
      rw [show decide ((reflectVariable (predecessor + 1) : Int) < 0) = false by
        simp [hnegative]]
      cases valuation (reflectVariable (predecessor + 1)) <;> rfl

theorem evalClause_reflectClause (valuation : Nat → Bool) (clause : List Int) :
    evalClauseD valuation (reflectClause clause) =
      evalClauseD (fun atom ↦ valuation (reflectVariable atom)) clause := by
  induction clause with
  | nil => rfl
  | cons literal clause ih =>
      change
        (evalLitD valuation (reflectLiteral literal) ||
            evalClauseD valuation (reflectClause clause)) =
          (evalLitD (fun atom ↦ valuation (reflectVariable atom)) literal ||
            evalClauseD (fun atom ↦ valuation (reflectVariable atom)) clause)
      rw [evalLiteral_reflectLiteral, ih]

theorem evalClause_normalizeClause (valuation : Nat → Bool) (clause : List Int) :
    evalClauseD valuation (normalizeClause clause) = evalClauseD valuation clause := by
  rw [Bool.eq_iff_iff]
  simp [evalClauseD, List.any_eq_true, normalizeClause, List.mem_mergeSort]

/-- A direct UNSAT proof transfers across the explicit atom reflection. -/
theorem reflectedDirect_unsatisfiable
    (hdirect : DimacsUnsatisfiable (clauses .direct)) :
    DimacsUnsatisfiable reflectedDirectClauses := by
  rintro ⟨valuation, hvaluation⟩
  apply hdirect
  refine ⟨fun atom ↦ valuation (reflectVariable atom), ?_⟩
  intro clause hclause
  have hreflected := hvaluation (reflectClause clause)
    (List.mem_map.mpr ⟨clause, hclause, rfl⟩)
  simpa [evalClause_reflectClause] using hreflected

/-- Once literal-permutation coverage is proved, the direct RUP payload also
rules out the exact Python-order mirror formula. -/
theorem mirror_unsatisfiable_of_direct
    (hcoverage : DirectReflectionCoveredByMirror)
    (hdirect : DimacsUnsatisfiable (clauses .direct)) :
    DimacsUnsatisfiable (clauses .mirror) := by
  have hreflected := reflectedDirect_unsatisfiable hdirect
  rintro ⟨valuation, hvaluation⟩
  apply hreflected
  refine ⟨valuation, ?_⟩
  intro reflectedClause hreflectedClause
  have hnormalized := hcoverage reflectedClause hreflectedClause
  obtain ⟨mirrorClause, hmirrorClause, hnormalize⟩ := List.mem_map.mp hnormalized
  have hmirror := hvaluation mirrorClause hmirrorClause
  rw [← evalClause_normalizeClause valuation mirrorClause] at hmirror
  rw [hnormalize] at hmirror
  rwa [evalClause_normalizeClause] at hmirror

/-- The checked reflection census lets a single direct RUP payload rule out both
orientations. -/
theorem mirror_unsatisfiable_of_direct_checked
    (hdirect : DimacsUnsatisfiable (clauses .direct)) :
    DimacsUnsatisfiable (clauses .mirror) :=
  mirror_unsatisfiable_of_direct directReflectionCoveredByMirror hdirect

@[simp] theorem labels_length : labels.length = 12 := by
  decide

@[simp] theorem boundaryCaps_length : boundaryCaps.length = 3 := by
  decide

@[simp] theorem roleTriples_length (orientation : Balanced555Orientation) :
    (roleTriples orientation).length = 6 := by
  cases orientation <;> decide

@[simp] theorem middleLabels_length (orientation : Balanced555Orientation) :
    (middleLabels orientation).length = 10 := by
  cases orientation <;> decide

def roleAtom (configuration : Balanced555FiniteConfiguration)
    (index : Nat) : Prop :=
  match (roleTriples configuration.orientation)[index]? with
  | some (deleted, retained, third) =>
      configuration.deleted = deleted ∧ configuration.retained = retained ∧
        configuration.third = third
  | none => False

def middleAtom (configuration : Balanced555FiniteConfiguration)
    (index : Nat) : Prop :=
  match (middleLabels configuration.orientation)[index]? with
  | some middle => configuration.middle = middle
  | none => False

/-- Proposition-valued interpretation of all 148 variables from a source configuration. -/
def configurationAtom (configuration : Balanced555FiniteConfiguration)
    (atom : Nat) : Prop :=
  if 1 ≤ atom ∧ atom ≤ 132 then
    rowPoint atom ∈ configuration.selectedAt (rowCenter atom)
  else if 133 ≤ atom ∧ atom ≤ 138 then
    roleAtom configuration (atom - 133)
  else if 139 ≤ atom ∧ atom ≤ 148 then
    middleAtom configuration (atom - 139)
  else False

/-- Boolean form of `configurationAtom`, for the signed-DIMACS evaluator. -/
noncomputable def configurationValuation
    (configuration : Balanced555FiniteConfiguration) : Nat → Bool :=
  fun atom ↦ @decide (configurationAtom configuration atom) (Classical.propDecidable _)

/-- The Boolean valuation exposes exactly the proposition-valued atom interpretation. -/
theorem configurationValuation_eq_true_iff
    (configuration : Balanced555FiniteConfiguration) (atom : Nat) :
    configurationValuation configuration atom = true ↔
      configurationAtom configuration atom := by
  simp [configurationValuation]

/-- Row variables evaluate to the corresponding selected-row incidence. -/
theorem configurationAtom_rowVariable
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) :
    configurationAtom configuration (rowVariable center point) ↔
      point ∈ configuration.selectedAt center := by
  have hbounds :
      1 ≤ rowVariable center point ∧ rowVariable center point ≤ 132 :=
    ⟨rowVariable_pos center point, rowVariable_le center point⟩
  simp [configurationAtom, hbounds, rowCenter_rowVariable center point hne,
    rowPoint_rowVariable center point hne]

/-- The DIMACS row valuation agrees with the typed assignment used by the
geometric no-good checker. -/
theorem configurationValuation_rowVariable_eq_selectedAssignment
    (configuration : Balanced555FiniteConfiguration) (center point : Fin 12)
    (hne : center ≠ point) :
    configurationValuation configuration (rowVariable center point) =
      Balanced555KalmansonOccurrence.selectedAssignment configuration (center, point) := by
  rw [Bool.eq_iff_iff, configurationValuation_eq_true_iff,
    configurationAtom_rowVariable configuration center point hne]
  simp [Balanced555KalmansonOccurrence.selectedAssignment]

private theorem evalLitD_encodeSelectedLiteral
    (configuration : Balanced555FiniteConfiguration)
    (literal : (Fin 12 × Fin 12) × Bool) (hne : literal.1.1 ≠ literal.1.2) :
    evalLitD (configurationValuation configuration) (encodeSelectedLiteral literal) =
      (Balanced555KalmansonOccurrence.selectedAssignment configuration literal.1 == literal.2) := by
  rcases literal with ⟨⟨center, point⟩, polarity⟩
  have hpos : 0 < rowVariable center point := rowVariable_pos center point
  have hnotNegative : ¬(rowVariable center point : Int) < 0 := by omega
  have hvalue :=
    configurationValuation_rowVariable_eq_selectedAssignment configuration center point hne
  cases polarity <;>
    simp [encodeSelectedLiteral, evalLitD, positiveLiteral, negativeLiteral, hpos,
      hnotNegative, hvalue]

private theorem evalEncodedNoGoodAtoms
    (configuration : Balanced555FiniteConfiguration) (atoms : List (Fin 12 × Fin 12))
    (hoffDiagonal : ∀ atom ∈ atoms, atom.1 ≠ atom.2) :
    evalClauseD (configurationValuation configuration)
        (atoms.map fun atom ↦ encodeSelectedLiteral (atom, false)) =
      Std.Sat.CNF.Clause.eval
        (Balanced555KalmansonOccurrence.selectedAssignment configuration)
        (atoms.map fun atom ↦ (atom, false)) := by
  induction atoms with
  | nil => rfl
  | cons atom atoms ih =>
      have hhead : atom.1 ≠ atom.2 := hoffDiagonal atom (by simp)
      have htail : ∀ other ∈ atoms, other.1 ≠ other.2 := by
        intro other hother
        exact hoffDiagonal other (by simp [hother])
      change
        (evalLitD (configurationValuation configuration) (encodeSelectedLiteral (atom, false)) ||
            evalClauseD (configurationValuation configuration)
              (atoms.map fun other ↦ encodeSelectedLiteral (other, false))) =
          ((Balanced555KalmansonOccurrence.selectedAssignment configuration atom == false) ||
            Std.Sat.CNF.Clause.eval
              (Balanced555KalmansonOccurrence.selectedAssignment configuration)
              (atoms.map fun other ↦ (other, false)))
      rw [evalLitD_encodeSelectedLiteral configuration (atom, false) hhead, ih htail]

/-- Typed no-good evaluation and its signed-DIMACS encoding agree. -/
theorem evalClauseD_encodedNoGoodClause
    (configuration : Balanced555FiniteConfiguration)
    (data : Balanced555KalmansonOccurrenceData)
    (hoffDiagonal : ∀ atom ∈ data.positiveAtoms, atom.1 ≠ atom.2) :
    evalClauseD (configurationValuation configuration) (encodedNoGoodClause data) =
      Std.Sat.CNF.Clause.eval
        (Balanced555KalmansonOccurrence.selectedAssignment configuration) data.noGoodClause := by
  simpa only [encodedNoGoodClause, Balanced555KalmansonOccurrenceData.noGoodClause,
    List.map_map] using evalEncodedNoGoodAtoms configuration data.positiveAtoms hoffDiagonal

/-- Every generated Kalmanson clause is true under the valuation induced by a
balanced finite configuration. -/
theorem configurationValuation_satisfies_kalmansonSignedClause
    (configuration : Balanced555FiniteConfiguration) (clause : List Int)
    (hclause : clause ∈ kalmansonSignedClauses configuration.orientation) :
    evalClauseD (configurationValuation configuration) clause = true := by
  obtain ⟨occurrence, hencoded, hoffDiagonal⟩ :=
    exists_checkedOccurrence_of_mem_kalmansonSignedClauses
      configuration.orientation clause hclause
  rw [← hencoded,
    evalClauseD_encodedNoGoodClause configuration occurrence.data hoffDiagonal]
  exact Balanced555KalmansonOccurrence.noGoodClause_eval configuration occurrence

/-- A generated clause list has the checker variable type `PosFin 149`. -/
abbrev Variable := PosFin variableBound

end Balanced555FiniteFormula
end ATailFrontierLiveClosure
end Problem97
