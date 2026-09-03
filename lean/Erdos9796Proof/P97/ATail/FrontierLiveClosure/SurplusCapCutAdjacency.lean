/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Cut-side transport inside one strict Moser-cap block

The zero-cut boundary places each strict cap interior in one contiguous order
block.  This module records the small source-facing consequence needed by the
exact-five source-swap lane: two points of `oppInterior1` have the same `btw`
bit across the cut joining the two opposite apices.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The named first opposite apex is the zero-cut vertex at `oppIndex1`. -/
theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The named second opposite apex is the zero-cut vertex at `oppIndex2`. -/
theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The indexed closed cap at `oppIndex2` is the named second opposite cap. -/
theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex,
      SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex2, hi]

/-- In either zero-cut cap-block orientation, two indices whose boundary
points lie in `oppInterior1` occupy the same side of the cut `(oppApex1,
oppApex2)`. -/
theorem oppInterior1_indices_cyclicAdjacent
    {A : Finset ℝ²} (S : SurplusCapPacket A) (B : BoundaryIndexing A)
    (hn : 0 < B.n) (iv iw : Fin B.n)
    (hblocks :
      DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw)
    {p q : Fin B.n}
    (hp : B.boundary p ∈ S.oppInterior1)
    (hq : B.boundary q ∈ S.oppInterior1) :
    cyclicAdjacent iv iw p q := by
  rcases hblocks with hdirect | hmirror
  · rcases hdirect.opp1_after (B.boundary p) hp with
      ⟨p', hp', hboundaryP⟩
    rcases hdirect.opp1_after (B.boundary q) hq with
      ⟨q', hq', hboundaryQ⟩
    have hpEq : p' = p := B.boundary_injective hboundaryP
    have hqEq : q' = q := B.boundary_injective hboundaryQ
    subst p'
    subst q'
    have hivw : iv < iw := hdirect.apex_order.2
    have hpNot : ¬ SurplusCOMPGBank.btw iv iw p := by
      rintro (⟨_, hpRight⟩ | ⟨_, hpLeft⟩) <;> omega
    have hqNot : ¬ SurplusCOMPGBank.btw iv iw q := by
      rintro (⟨_, hqRight⟩ | ⟨_, hqLeft⟩) <;> omega
    exact ⟨fun hpBetween ↦ (hpNot hpBetween).elim,
      fun hqBetween ↦ (hqNot hqBetween).elim⟩
  · rcases hmirror.opp1_between (B.boundary p) hp with
      ⟨p', _hpZero, hp', hboundaryP⟩
    rcases hmirror.opp1_between (B.boundary q) hq with
      ⟨q', _hqZero, hq', hboundaryQ⟩
    have hpEq : p' = p := B.boundary_injective hboundaryP
    have hqEq : q' = q := B.boundary_injective hboundaryQ
    subst p'
    subst q'
    have hwiv : iw < iv := hmirror.apex_order.2
    have hpNot : ¬ SurplusCOMPGBank.btw iv iw p := by
      rintro (⟨hpLeft, _⟩ | ⟨_, hpRight⟩) <;> omega
    have hqNot : ¬ SurplusCOMPGBank.btw iv iw q := by
      rintro (⟨hqLeft, _⟩ | ⟨_, hqRight⟩) <;> omega
    exact ⟨fun hpBetween ↦ (hpNot hpBetween).elim,
      fun hqBetween ↦ (hqNot hqBetween).elim⟩

/-- Source-facing form of `oppInterior1_indices_cyclicAdjacent`, with the cut
and the two interior points expressed through a retained `BoundaryIndexing`.
The equalities `hiv` and `hiw` are exactly those returned by
`ZeroCutBoundaryIndexing.exists_with_capBlocks`. -/
theorem oppInterior1_cyclicAdjacent_across_oppApex1_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) (B : BoundaryIndexing A)
    (hn : 0 < B.n) (iv iw : Fin B.n)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hblocks :
      DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw)
    {a d : ℝ²}
    (ha : a ∈ S.oppInterior1) (hd : d ∈ S.oppInterior1) :
    cyclicAdjacent
      (B.indexOf
        ⟨S.oppApex1, by
          rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1]
          exact S.oppositeVertexByIndex_mem S.oppIndex1⟩)
      (B.indexOf
        ⟨S.oppApex2, by
          rw [oppApex2_eq_oppositeVertexByIndex_oppIndex2]
          exact S.oppositeVertexByIndex_mem S.oppIndex2⟩)
      (B.indexOf ⟨a, S.capInteriorByIndex_subset S.oppIndex1 ha⟩)
      (B.indexOf ⟨d, S.capInteriorByIndex_subset S.oppIndex1 hd⟩) := by
  let firstApex : CarrierLabel A :=
    ⟨S.oppApex1, by
      rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1]
      exact S.oppositeVertexByIndex_mem S.oppIndex1⟩
  let secondApex : CarrierLabel A :=
    ⟨S.oppApex2, by
      rw [oppApex2_eq_oppositeVertexByIndex_oppIndex2]
      exact S.oppositeVertexByIndex_mem S.oppIndex2⟩
  let aLabel : CarrierLabel A :=
    ⟨a, S.capInteriorByIndex_subset S.oppIndex1 ha⟩
  let dLabel : CarrierLabel A :=
    ⟨d, S.capInteriorByIndex_subset S.oppIndex1 hd⟩
  have hfirstIndex : B.indexOf firstApex = iv := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf firstApex) = pointOf firstApex :=
        B.point_eq firstApex
      _ = S.oppApex1 := rfl
      _ = S.oppositeVertexByIndex S.oppIndex1 :=
        oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
      _ = B.boundary iv := hiv.symm
  have hsecondIndex : B.indexOf secondApex = iw := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf secondApex) = pointOf secondApex :=
        B.point_eq secondApex
      _ = S.oppApex2 := rfl
      _ = S.oppositeVertexByIndex S.oppIndex2 :=
        oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
      _ = B.boundary iw := hiw.symm
  have haBoundary : B.boundary (B.indexOf aLabel) ∈ S.oppInterior1 := by
    rw [B.point_eq]
    simpa [aLabel, pointOf] using ha
  have hdBoundary : B.boundary (B.indexOf dLabel) ∈ S.oppInterior1 := by
    rw [B.point_eq]
    simpa [dLabel, pointOf] using hd
  change cyclicAdjacent (B.indexOf firstApex) (B.indexOf secondApex)
    (B.indexOf aLabel) (B.indexOf dLabel)
  rw [hfirstIndex, hsecondIndex]
  exact oppInterior1_indices_cyclicAdjacent S B hn iv iw hblocks
    haBoundary hdBoundary

end ATailFrontierLiveClosure
end Problem97
