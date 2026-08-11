/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221StaticRelationSemantics
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221NextRowCompiledJob

/-!
# Exact finite layout of the exact-twelve static relation variables

The Python static-parent compiler enumerates the 66 undirected edges of
`Fin 12` in lexicographic order and then the 2,145 unordered pairs of those
edges in lexicographic order.  This file reconstructs that layout and values
each relation variable by equality of the two decoded geometric distances.

The finite decoder theorem is deliberately independent of the point
realization.  Geometry enters only through `relationAssign` and the final
metric-equality bridge.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace StaticRelationLayout

open Census554.EqualityCore
open StaticRelationSemantics
open scoped EuclideanGeometry

abbrev Label := ExactTwelveCarrierIngress.Label

/-- The compiler's 66 undirected carrier edges, represented by endpoint
values in Python `itertools.combinations(range(12), 2)` order. -/
def edgeKeys : List (Nat × Nat) := SafeCoverCnf.allPairs

/-- The compiler's 2,145 unordered edge-index pairs, again in Python
`itertools.combinations` order. -/
def relationKeys : List (Nat × Nat) :=
  (List.range 66).flatMap fun i =>
    ((List.range 66).drop (i + 1)).map fun j => (i, j)

/-- Canonical endpoint-value key of an oriented edge. -/
def edgeKey (e : Edge Label) : Nat × Nat :=
  if e.1.val < e.2.val then (e.1.val, e.2.val) else (e.2.val, e.1.val)

/-- Zero-based position of an edge in the 66-edge compiler table.  A loop
gets the out-of-range sentinel `66`. -/
def edgeIndex (e : Edge Label) : Nat := edgeKeys.idxOf (edgeKey e)

/-- Canonical key of two edge indices. -/
def relationKey (e f : Edge Label) : Nat × Nat :=
  if edgeIndex e < edgeIndex f then (edgeIndex e, edgeIndex f)
  else (edgeIndex f, edgeIndex e)

/-- First static relation variable.  Variables through `42,730` belong to
the source-faithful next-row prefix. -/
def firstRelationVar : Nat := 42731

/-- Exact compiler variable of a pair of distinct non-loop edges.  Invalid
or repeated-edge keys totalize to zero and therefore cannot name a DIMACS
variable. -/
def relationVar (e f : Edge Label) : Nat :=
  if edgeIndex e < 66 && edgeIndex f < 66 && edgeIndex e != edgeIndex f then
    firstRelationVar + relationKeys.idxOf (relationKey e f)
  else 0

/-- Safe conversion used only after reading the fixed finite compiler table. -/
def fin12 (n : Nat) : Label := ⟨n % 12, by omega⟩

/-- Decode one compiler edge index. -/
def edgeAt (i : Nat) : Edge Label :=
  let key := edgeKeys.getD i (0, 1)
  (fin12 key.1, fin12 key.2)

/-- Decode one static relation variable to its pair of edge indices. -/
def relationKeyAt (v : Nat) : Nat × Nat :=
  relationKeys.getD (v - firstRelationVar) (0, 1)

/-- Normalize an oriented edge without changing its geometric length. -/
def normalizeEdge (e : Edge Label) : Edge Label :=
  if e.1.val < e.2.val then e else (e.2, e.1)

theorem edgeDist_normalizeEdge (pointOf : Label → ℝ²) (e : Edge Label) :
    edgeDist pointOf (normalizeEdge e) = edgeDist pointOf e := by
  by_cases h : e.1.val < e.2.val
  · simp [normalizeEdge, h]
  · simp [normalizeEdge, h, edgeDist, dist_comm]

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- Closed finite audit of the exact layout: every positive relation variable
decodes to the two normalized input edges, possibly in swapped order. -/
theorem relationEdgesAt_relationVar :
    ∀ e f : Edge Label, 0 < relationVar e f →
      let key := relationKeyAt (relationVar e f)
      (edgeAt key.1 = normalizeEdge e ∧ edgeAt key.2 = normalizeEdge f) ∨
      (edgeAt key.1 = normalizeEdge f ∧ edgeAt key.2 = normalizeEdge e) := by
  native_decide

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
/-- Executable anchors matching the Python v3 static-parent layout. -/
theorem layoutAnchors :
    edgeKeys.length = 66 ∧
    relationKeys.length = 2145 ∧
    relationVar (⟨0, by omega⟩, ⟨1, by omega⟩)
        (⟨0, by omega⟩, ⟨2, by omega⟩) = 42731 ∧
    relationVar (⟨10, by omega⟩, ⟨11, by omega⟩)
        (⟨9, by omega⟩, ⟨11, by omega⟩) = 44875 := by
  native_decide

/-- Geometric valuation of the static relation-variable interval. -/
noncomputable def relationAssign (pointOf : Label → ℝ²) (v : Nat) : Bool :=
  let key := relationKeyAt v
  if edgeDist pointOf (edgeAt key.1) = edgeDist pointOf (edgeAt key.2) then
    true
  else false

/-- The exact compiler layout valued by realized distance equality satisfies
the abstract metric relation contract. -/
theorem relationAssign_encodesMetricEquality (pointOf : Label → ℝ²) :
    EncodesMetricEquality (relationAssign pointOf) relationVar pointOf := by
  intro e f hpositive
  obtain hdecode | hdecode := relationEdgesAt_relationVar e f hpositive
  · rcases hdecode with ⟨hleft, hright⟩
    simp only [relationAssign]
    rw [hleft, hright, edgeDist_normalizeEdge, edgeDist_normalizeEdge]
    simp
  · rcases hdecode with ⟨hleft, hright⟩
    simp only [relationAssign]
    rw [hleft, hright, edgeDist_normalizeEdge, edgeDist_normalizeEdge]
    simp [eq_comm]

end StaticRelationLayout
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
