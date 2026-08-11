/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain
import Erdos9796Proof.P97.ATail.PerpBisectorEqualityChainSchemas

/-!
# Perpendicular-bisector equality-chain clauses for exact seventeen

This module extends the checked equality-chain child by every cyclic placement
of the cardinality-independent six-row obstruction

```text
A : P,X    X : A,Y    Y : X,B
B : Y,P    Q : A,B    R : A,B
```

on seven boundary positions `X < P < B < Q < Y < A < R`.  The first four
rows transport the equality `dist P A = dist P B`; the last two rows give the
same equality for `Q` and `R`.  Convex independence forbids three distinct
carrier points on the perpendicular bisector of the distinct foci `A,B`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChain

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenSourceCnfCdefg
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircle
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRow
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijk
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleaved
open ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChain
open PerpBisectorEqualityChainBridge
open Census554.EqualityCore

/-- Twelve selected-row hits for the perpendicular-bisector equality chain. -/
def perpBisectorChainHits (order : NamedOrder) (direction : Orientation)
    (cut : Label) (offsets : List Label) : List Hit :=
  match offsets with
  | [p, b, q, y, a, r] =>
      let z := placedLabel order direction cut
      [(z a, z p), (z a, z 0),
        (z 0, z a), (z 0, z y),
        (z y, z 0), (z y, z b),
        (z b, z y), (z b, z p),
        (z q, z a), (z q, z b),
        (z r, z a), (z r, z b)]
  | _ => []

private theorem placedLabel_injective (order : NamedOrder)
    (direction : Orientation) (cut : Label) :
    Function.Injective (placedLabel order direction cut) := by
  intro i j hij
  have hpos := congrArg (position order) hij
  simp only [placedLabel, position_labelAtPosition] at hpos
  cases direction with
  | forward => exact add_left_cancel hpos
  | reverse => exact sub_right_inj.mp hpos

private theorem false_of_perpBisectorChain_at {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut p b q y a r : Label)
    (hpb : p < b) (hbq : b < q)
    (hqy : q < y) (hya : y < a) (har : a < r)
    (hpA : placedLabel order direction cut p ∈
      source.model.selected (placedLabel order direction cut a))
    (hxA : placedLabel order direction cut 0 ∈
      source.model.selected (placedLabel order direction cut a))
    (haX : placedLabel order direction cut a ∈
      source.model.selected (placedLabel order direction cut 0))
    (hyX : placedLabel order direction cut y ∈
      source.model.selected (placedLabel order direction cut 0))
    (hxY : placedLabel order direction cut 0 ∈
      source.model.selected (placedLabel order direction cut y))
    (hbY : placedLabel order direction cut b ∈
      source.model.selected (placedLabel order direction cut y))
    (hyB : placedLabel order direction cut y ∈
      source.model.selected (placedLabel order direction cut b))
    (hpB : placedLabel order direction cut p ∈
      source.model.selected (placedLabel order direction cut b))
    (haQ : placedLabel order direction cut a ∈
      source.model.selected (placedLabel order direction cut q))
    (hbQ : placedLabel order direction cut b ∈
      source.model.selected (placedLabel order direction cut q))
    (haR : placedLabel order direction cut a ∈
      source.model.selected (placedLabel order direction cut r))
    (hbR : placedLabel order direction cut b ∈
      source.model.selected (placedLabel order direction cut r)) : False := by
  let P : RowPattern Label := source.model.selected
  have hreal : Realizes P
      (fun label => source.boundary (source.labelIndex label)) := by
    refine ⟨?_, source.boundary_injective.comp
      (labelIndex_injective_of_positionEmbedding source.orientation
        source.model.order source.labelIndex source.position_embedding)⟩
    intro center x hx y hy
    exact
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hx)).trans
      ((source.selectedRow center).support_eq_radius _
        (source.mem_selectedRow_of_mem_model hy)).symm
  have hplaced := placedLabel_injective order direction cut
  let core : PerpBisectorEqualityChainBridge.Core P := {
    a := placedLabel order direction cut a
    b := placedLabel order direction cut b
    p := placedLabel order direction cut p
    q := placedLabel order direction cut q
    r := placedLabel order direction cut r
    x := placedLabel order direction cut 0
    y := placedLabel order direction cut y
    hab := hplaced.ne (ne_of_gt (hbq.trans (hqy.trans hya)))
    hpq := hplaced.ne (ne_of_lt (hpb.trans hbq))
    hpr := hplaced.ne
      (ne_of_lt (hpb.trans (hbq.trans (hqy.trans (hya.trans har)))))
    hqr := hplaced.ne (ne_of_lt (hqy.trans (hya.trans har)))
    p_mem_a := hpA
    x_mem_a := hxA
    a_mem_x := haX
    y_mem_x := hyX
    x_mem_y := hxY
    b_mem_y := hbY
    y_mem_b := hyB
    p_mem_b := hpB
    a_mem_q := haQ
    b_mem_q := hbQ
    a_mem_r := haR
    b_mem_r := hbR }
  exact false_of_core hreal source.carrier_convexIndep
    (fun label => boundaryLabel_mem source.boundary source.boundary_image
      source.labelIndex label)
    core

/-- Every generated perpendicular-bisector chain clause is true under a
source realization. -/
theorem sourceAssign_perpBisectorChainClause {A : Finset ℝ²}
    (source : SourceRealization A) (order : NamedOrder)
    (direction : Orientation) (cut : Label) (offsets : List Label)
    (hoffsets : offsets ∈ sixOffsetChoices) :
    Std.Sat.CNF.Clause.eval (sourceAssign source.model)
      (nogoodClause order
        (perpBisectorChainHits order direction cut offsets)) = true := by
  obtain ⟨p, b, q, y, a, r, rfl, h0p, hpb, hbq, hqy, hya, har⟩ :=
    sixOffsetChoices_shape offsets hoffsets
  apply sourceAssign_nogoodClause
  intro _horder hall
  have get (center point : Label)
      (hmem : (placedLabel order direction cut center,
          placedLabel order direction cut point) ∈
        perpBisectorChainHits order direction cut [p, b, q, y, a, r]) :
      placedLabel order direction cut point ∈
        source.model.selected (placedLabel order direction cut center) :=
    hall _ hmem
  exact false_of_perpBisectorChain_at source order direction cut p b q y a r
    hpb hbq hqy hya har
    (get a p (by simp [perpBisectorChainHits]))
    (get a 0 (by simp [perpBisectorChainHits]))
    (get 0 a (by simp [perpBisectorChainHits]))
    (get 0 y (by simp [perpBisectorChainHits]))
    (get y 0 (by simp [perpBisectorChainHits]))
    (get y b (by simp [perpBisectorChainHits]))
    (get b y (by simp [perpBisectorChainHits]))
    (get b p (by simp [perpBisectorChainHits]))
    (get q a (by simp [perpBisectorChainHits]))
    (get q b (by simp [perpBisectorChainHits]))
    (get r a (by simp [perpBisectorChainHits]))
    (get r b (by simp [perpBisectorChainHits]))

/-- Complete guarded cyclic orbit of the perpendicular-bisector equality
chain. -/
def perpBisectorChainClauses : Std.Sat.CNF Atom :=
  namedOrders.flatMap fun order =>
    directions.flatMap fun direction =>
      labels.flatMap fun cut =>
        sixOffsetChoices.map fun offsets =>
          nogoodClause order
            (perpBisectorChainHits order direction cut offsets)

/-- Every source realization satisfies the complete perpendicular-bisector
chain family. -/
theorem sourceAssign_perpBisectorChainClauses {A : Finset ℝ²}
    (source : SourceRealization A) :
    ∀ clause ∈ perpBisectorChainClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [perpBisectorChainClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection,
    cut, _hcut, offsets, hoffsets, rfl⟩ := hclause
  exact sourceAssign_perpBisectorChainClause source order direction cut offsets
    hoffsets

/-- Lean-authoritative child root after the perpendicular-bisector chain
family. -/
def extendedPerpBisectorChainCnf : Std.Sat.CNF Atom :=
  extendedEqualityChainCnf ++ perpBisectorChainClauses

/-- Exact size of the complete perpendicular-bisector chain family. -/
theorem perpBisectorChainClauses_length :
    perpBisectorChainClauses.length = 544544 := by
  native_decide

/-- Exact clause count of the Lean-authoritative perpendicular-bisector child
root. -/
theorem extendedPerpBisectorChainCnf_clause_count :
    extendedPerpBisectorChainCnf.length = 4756988 := by
  simp [extendedPerpBisectorChainCnf, extendedEqualityChainCnf_clause_count,
    perpBisectorChainClauses_length]

/-- Gate B for the complete perpendicular-bisector chain child root. -/
theorem sourceAssign_extendedPerpBisectorChainCnf {A : Finset ℝ²}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedPerpBisectorChainCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedPerpBisectorChainCnf, List.mem_append] at hclause
  rcases hclause with hold | hnew
  · have h := sourceAssign_extendedEqualityChainCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hold
  · exact sourceAssign_perpBisectorChainClauses source clause hnew

/-- Certificate-to-source landing contract for the perpendicular-bisector
chain child root. -/
theorem false_of_sourceRealization_of_extendedPerpBisectorChainCnf_unsat
    {A : Finset ℝ²} (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedPerpBisectorChainCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model, sourceAssign_extendedPerpBisectorChainCnf source⟩

end ATailBlockerVExactSeventeenSourceCnfCdefgEqualK4TwoCircleThreeRowHijkInterleavedEqualityChainPerpBisectorChain
end Problem97
