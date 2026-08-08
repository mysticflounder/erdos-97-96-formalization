/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ConcreteRowsBridge
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Global boundary-order ingress for the exact-twelve Rigid221 branch

The ordered metric search enumerates linear boundary orders of the twelve
frozen labels.  This file supplies the missing source contract: one common
zero-cut CCW boundary indexing places all three strict cap interiors in the
direct or reflected block order.  It does not assert that the present ordered
certificate bank covers every such order.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

/-- The direct zero-cut order on frozen labels:
`0, second-opposite, 2, surplus, 1, first-opposite`. -/
structure FrozenDirectBoundaryOrder (position : Label → Nat) : Prop where
  apex_order : position 0 < position 2 ∧ position 2 < position 1
  secondOpposite_between :
    ∀ label ∈ secondOppositeInteriorLabels,
      position 0 < position label ∧ position label < position 2
  surplus_between :
    ∀ label ∈ surplusInteriorLabels,
      position 2 < position label ∧ position label < position 1
  firstOpposite_after :
    ∀ label ∈ firstOppositeInteriorLabels,
      position 1 < position label

/-- The reflected zero-cut order on frozen labels:
`0, first-opposite, 1, surplus, 2, second-opposite`. -/
structure FrozenMirrorBoundaryOrder (position : Label → Nat) : Prop where
  apex_order : position 0 < position 1 ∧ position 1 < position 2
  firstOpposite_between :
    ∀ label ∈ firstOppositeInteriorLabels,
      position 0 < position label ∧ position label < position 1
  surplus_between :
    ∀ label ∈ surplusInteriorLabels,
      position 1 < position label ∧ position label < position 2
  secondOpposite_after :
    ∀ label ∈ secondOppositeInteriorLabels,
      position 2 < position label

/-- A permutation of the twelve frozen labels induced by one common CCW
boundary enumeration, together with its direct-or-reflected cap-block order.

The boundary realization is retained, rather than erased to positions, so an
ordered metric certificate can recover its signed-area hypotheses from the
same enumeration that supplied the cap blocks. -/
structure FrozenBoundaryOrder (pointOf : Label → ℝ²) where
  n : Nat
  n_eq_twelve : n = 12
  boundary : Fin n → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  index : Label → Fin n
  index_injective : Function.Injective index
  point_eq : ∀ label, boundary (index label) = pointOf label
  blocks :
    FrozenDirectBoundaryOrder (fun label => (index label).val) ∨
      FrozenMirrorBoundaryOrder (fun label => (index label).val)

def FrozenBoundaryOrder.position {pointOf : Label → ℝ²}
    (order : FrozenBoundaryOrder pointOf) : Label → Nat :=
  fun label => (order.index label).val

theorem FrozenBoundaryOrder.position_lt_twelve {pointOf : Label → ℝ²}
    (order : FrozenBoundaryOrder pointOf) (label : Label) :
    order.position label < 12 := by
  rw [FrozenBoundaryOrder.position, ← order.n_eq_twelve]
  exact (order.index label).isLt

theorem FrozenBoundaryOrder.position_injective {pointOf : Label → ℝ²}
    (order : FrozenBoundaryOrder pointOf) :
    Function.Injective order.position := by
  intro left right heq
  apply order.index_injective
  apply Fin.ext
  exact heq

/-- Transport one supplied zero-cut boundary and its three cap blocks into the
frozen twelve-label vocabulary.  Keeping the boundary explicit lets later
consumers attach additional order facts proved in that same indexing. -/
noncomputable def FrozenRoleLabeling.frozenBoundaryOrder_of_capBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (hcard : D.A.card = 12)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    FrozenBoundaryOrder (fun label => (labeling.e.symm label).1) := by
  classical
  have hnTwelve : B.n = 12 := by
    have h := congrArg Finset.card B.boundary_image
    rw [Finset.card_image_of_injective _ B.boundary_injective,
      Finset.card_univ, hcard] at h
    simpa using h
  let position : Label → Nat :=
    fun label => (B.indexOf (labeling.e.symm label)).val
  have hzeroIndex :
      B.indexOf (labeling.e.symm 0) = zeroIndex hn := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf (labeling.e.symm 0)) =
          (labeling.e.symm 0).1 := B.point_eq _
      _ = S.surplusApex := labeling.surplusApex
      _ = S.oppositeVertexByIndex S.surplusIdx :=
        (ATailApexRichClassStructure.oppositeVertexByIndex_surplusIdx S).symm
      _ = B.boundary (zeroIndex hn) := hzero.symm
  have hfirstIndex :
      B.indexOf (labeling.e.symm 2) = iv := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf (labeling.e.symm 2)) =
          (labeling.e.symm 2).1 := B.point_eq _
      _ = S.oppApex1 := labeling.firstApex
      _ = S.oppositeVertexByIndex S.oppIndex1 :=
        (ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex1 S).symm
      _ = B.boundary iv := hiv.symm
  have hsecondIndex :
      B.indexOf (labeling.e.symm 1) = iw := by
    apply B.boundary_injective
    calc
      B.boundary (B.indexOf (labeling.e.symm 1)) =
          (labeling.e.symm 1).1 := B.point_eq _
      _ = S.oppApex2 := labeling.secondApex
      _ = S.oppositeVertexByIndex S.oppIndex2 :=
        (ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex2 S).symm
      _ = B.boundary iw := hiw.symm
  let index : Label → Fin B.n :=
    fun label => B.indexOf (labeling.e.symm label)
  have index_injective : Function.Injective index := by
    intro left right heq
    apply labeling.e.symm.injective
    apply B.index_injective
    exact heq
  refine
    { n := B.n
      n_eq_twelve := hnTwelve
      boundary := B.boundary
      boundary_injective := B.boundary_injective
      boundary_ccw := B.boundary_ccw
      index := index
      index_injective := index_injective
      point_eq := ?_
      blocks := ?_ }
  · intro label
    exact B.point_eq (labeling.e.symm label)
  rcases hblocks with direct | mirror
  · left
    refine
      { apex_order := ?_
        secondOpposite_between := ?_
        surplus_between := ?_
        firstOpposite_after := ?_ }
    · constructor
      · simpa only [position, index, hzeroIndex, hfirstIndex] using
          direct.apex_order.1
      · simpa only [position, index, hfirstIndex, hsecondIndex] using
          direct.apex_order.2
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.oppIndex2 :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) label).mp <| by
            simpa only [interiors.secondOppositeInterior_eq] using hlabel
      rcases direct.opp2_between _ hsource with ⟨q, hq0, hqiv, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      constructor
      · simpa only [position, index, hzeroIndex, hq] using hq0
      · simpa only [position, index, hfirstIndex, hq] using hqiv
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.surplusIdx :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.surplusIdx) label).mp <| by
            simpa only [interiors.surplusInterior_eq] using hlabel
      rcases direct.surplus_between _ hsource with
        ⟨q, hivq, hqiw, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      constructor
      · simpa only [position, index, hfirstIndex, hq] using hivq
      · simpa only [position, index, hsecondIndex, hq] using hqiw
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.oppIndex1 :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex1) label).mp <| by
            simpa only [interiors.firstOppositeInterior_eq] using hlabel
      rcases direct.opp1_after _ hsource with ⟨q, hiwq, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      simpa only [position, index, hsecondIndex, hq] using hiwq
  · right
    refine
      { apex_order := ?_
        firstOpposite_between := ?_
        surplus_between := ?_
        secondOpposite_after := ?_ }
    · constructor
      · simpa only [position, index, hzeroIndex, hsecondIndex] using
          mirror.apex_order.1
      · simpa only [position, index, hsecondIndex, hfirstIndex] using
          mirror.apex_order.2
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.oppIndex1 :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex1) label).mp <| by
            simpa only [interiors.firstOppositeInterior_eq] using hlabel
      rcases mirror.opp1_between _ hsource with ⟨q, hq0, hqiw, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      constructor
      · simpa only [position, index, hzeroIndex, hq] using hq0
      · simpa only [position, index, hsecondIndex, hq] using hqiw
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.surplusIdx :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.surplusIdx) label).mp <| by
            simpa only [interiors.surplusInterior_eq] using hlabel
      rcases mirror.surplus_between _ hsource with
        ⟨q, hiwq, hqiv, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      constructor
      · simpa only [position, index, hsecondIndex, hq] using hiwq
      · simpa only [position, index, hfirstIndex, hq] using hqiv
    · intro label hlabel
      have hsource :
          (labeling.e.symm label).1 ∈
            S.capInteriorByIndex S.oppIndex2 :=
        (mem_labelsOf_iff labeling.e
          (S.capInteriorByIndex S.oppIndex2) label).mp <| by
            simpa only [interiors.secondOppositeInterior_eq] using hlabel
      rcases mirror.opp2_after _ hsource with ⟨q, hivq, hqpoint⟩
      have hq : q = B.indexOf (labeling.e.symm label) := by
        apply B.boundary_injective
        exact hqpoint.trans (B.point_eq _).symm
      simpa only [position, index, hfirstIndex, hq] using hivq

/-- An exact interior profile transports a cardinality-independent geometric
zero-cut indexing to the frozen twelve-label vocabulary. -/
noncomputable def FrozenRoleLabeling.frozenBoundaryOrder
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    {Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet}
    {carrierPattern : FaithfulCarrierPattern D.A}
    (labeling : FrozenRoleLabeling Q carrierPattern)
    (interiors : FrozenInteriorProfile labeling)
    (hcard : D.A.card = 12) :
    FrozenBoundaryOrder (fun label => (labeling.e.symm label).1) := by
  classical
  apply Classical.choice
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks⟩
  exact ⟨labeling.frozenBoundaryOrder_of_capBlocks interiors hcard B hn iv iw
    hzero hiv hiw hblocks⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
