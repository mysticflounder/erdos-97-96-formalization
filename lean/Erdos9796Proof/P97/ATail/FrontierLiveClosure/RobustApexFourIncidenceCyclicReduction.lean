/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RobustApexCommonDeletion
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Four-incidence cyclic reduction for robust-apex rows

The generic robust-apex continuation tests five cross-incidences before its
saturated tetrahedron contradiction.  Convex cyclic order gives a stronger
cut: four of those incidences already force two incompatible shared-pair
separations.  This module retains the positive prefix of those four tests and
returns the first missing incidence together with its source-faithful
common-deletion packet.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCommonDeletionTwoCenter
open ATailRobustApexCommonDeletion
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- Explicit-row form of shared-pair separation.  Two selected rows at
distinct carrier centers that contain the same two distinct carrier points
separate those points in every boundary indexing. -/
theorem selectedFourClasses_shared_pair_separated
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {firstCenter secondCenter firstPoint secondPoint : CarrierLabel A}
    (firstRow : SelectedFourClass A firstCenter.1)
    (secondRow : SelectedFourClass A secondCenter.1)
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (hfirstPoint_first : firstPoint.1 ∈ firstRow.support)
    (hsecondPoint_first : secondPoint.1 ∈ firstRow.support)
    (hfirstPoint_second : firstPoint.1 ∈ secondRow.support)
    (hsecondPoint_second : secondPoint.1 ∈ secondRow.support) :
    separatedPair
      (B.indexOf firstCenter) (B.indexOf secondCenter)
      (B.indexOf firstPoint) (B.indexOf secondPoint) := by
  have hsecondPoint_ne_firstCenter : secondPoint ≠ firstCenter := by
    intro h
    subst secondPoint
    exact firstRow.center_not_mem hsecondPoint_first
  have hsecondPoint_ne_secondCenter : secondPoint ≠ secondCenter := by
    intro h
    subst secondPoint
    exact secondRow.center_not_mem hsecondPoint_second
  have hfirst :
      dist (B.boundary (B.indexOf firstPoint))
          (B.boundary (B.indexOf firstCenter)) =
        dist (B.boundary (B.indexOf secondPoint))
          (B.boundary (B.indexOf firstCenter)) := by
    simpa only [B.point_eq, pointOf, dist_comm] using
      (firstRow.support_eq_radius firstPoint.1 hfirstPoint_first).trans
        (firstRow.support_eq_radius secondPoint.1 hsecondPoint_first).symm
  have hsecond :
      dist (B.boundary (B.indexOf firstPoint))
          (B.boundary (B.indexOf secondCenter)) =
        dist (B.boundary (B.indexOf secondPoint))
          (B.boundary (B.indexOf secondCenter)) := by
    simpa only [B.point_eq, pointOf, dist_comm] using
      (secondRow.support_eq_radius firstPoint.1 hfirstPoint_second).trans
        (secondRow.support_eq_radius secondPoint.1 hsecondPoint_second).symm
  apply SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
  · exact B.index_injective.ne hcenters
  · exact B.index_injective.ne hsecondPoint_ne_firstCenter
  · exact B.index_injective.ne hsecondPoint_ne_secondCenter
  · exact hfirst
  · exact hsecond
  · exact B.boundary_injective.ne (B.index_injective.ne hpoints)

/-- The four source positions left after cyclic separation eliminates their
all-positive branch.  Each constructor records the positive tests preceding
its first missing incidence. -/
inductive RobustApexFourIncidenceContinuation
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} (S : RobustApexThreeRowSurface D O c₁ c₂ a) : Type
  | firstCenter_not_mem_robustRow
      (hmissing : c₁ ∉ S.row₀.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₁)
  | robustCenter_not_mem_firstRow
      (hc₁K₀ : c₁ ∈ S.row₀.support)
      (hmissing : O ∉ S.row₁.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₁)
  | robustCenter_not_mem_secondRow
      (hc₁K₀ : c₁ ∈ S.row₀.support)
      (hOK₁ : O ∈ S.row₁.support)
      (hmissing : O ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H O O c₂)
  | firstCenter_not_mem_secondRow
      (hc₁K₀ : c₁ ∈ S.row₀.support)
      (hOK₁ : O ∈ S.row₁.support)
      (hOK₂ : O ∈ S.row₂.support)
      (hmissing : c₁ ∉ S.row₂.support)
      (packet : CommonDeletionTwoCenterPacket D H c₁ O c₂)

/-- Source-faithful four-way packet, retaining the original support identities,
common-point incidences, and the boundary indexing used to exclude the
all-positive branch. -/
structure RobustApexFourIncidenceContinuationPacket
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    (O c₁ c₂ a : ℝ²) (B₀ B₁ B₂ : Finset ℝ²) : Type where
  boundaryIndexing : BoundaryIndexing D.A
  surface : RobustApexThreeRowSurface D O c₁ c₂ a
  row₀_support_eq : surface.row₀.support = B₀
  row₁_support_eq : surface.row₁.support = B₁
  row₂_support_eq : surface.row₂.support = B₂
  a_mem_row₁ : a ∈ surface.row₁.support
  a_mem_row₂ : a ∈ surface.row₂.support
  continuation : RobustApexFourIncidenceContinuation D H surface

/-- A five-incidence packet reduces to four prefix-preserving source
positions.  The unused `c₂ ∈ row₁` test is unnecessary: if the other four
cross-incidences are positive, `row₀,row₂` share `a,c₁`, while `row₁,row₂`
share `a,O`; the resulting rotated separations are incompatible. -/
theorem nonempty_robustApexFourIncidenceContinuation
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (B : BoundaryIndexing D.A)
    (P : RobustApexFiveIncidenceContinuationPacket
      D H O c₁ c₂ a B₀ B₁ B₂) :
    Nonempty (RobustApexFourIncidenceContinuation D H P.surface) := by
  let OLabel : CarrierLabel D.A := ⟨O, P.surface.O_mem_A⟩
  let c₁Label : CarrierLabel D.A := ⟨c₁, P.surface.c₁_mem_A⟩
  let c₂Label : CarrierLabel D.A := ⟨c₂, P.surface.c₂_mem_A⟩
  let aLabel : CarrierLabel D.A :=
    ⟨a, P.surface.row₀.support_subset_A P.surface.a_mem_row₀⟩
  have hO_ne_c₁ : OLabel ≠ c₁Label := by
    intro h
    exact P.surface.O_ne_c₁ (congrArg Subtype.val h)
  have hO_ne_c₂ : OLabel ≠ c₂Label := by
    intro h
    exact P.surface.O_ne_c₂ (congrArg Subtype.val h)
  have hc₁_ne_c₂ : c₁Label ≠ c₂Label := by
    intro h
    exact P.surface.c₁_ne_c₂ (congrArg Subtype.val h)
  have ha_ne_O : aLabel ≠ OLabel := by
    intro h
    have haO : a = O := congrArg Subtype.val h
    exact P.surface.row₀.center_not_mem (by
      simpa only [haO] using P.surface.a_mem_row₀)
  have ha_ne_c₁ : aLabel ≠ c₁Label := by
    intro h
    have hac₁ : a = c₁ := congrArg Subtype.val h
    exact P.surface.row₁.center_not_mem (by
      simpa only [hac₁] using P.a_mem_row₁)
  by_cases hc₁K₀ : c₁ ∈ P.surface.row₀.support
  · by_cases hOK₁ : O ∈ P.surface.row₁.support
    · by_cases hOK₂ : O ∈ P.surface.row₂.support
      · by_cases hc₁K₂ : c₁ ∈ P.surface.row₂.support
        · have hsep02 :
              separatedPair
                (B.indexOf OLabel) (B.indexOf c₂Label)
                (B.indexOf aLabel) (B.indexOf c₁Label) :=
            selectedFourClasses_shared_pair_separated B
              P.surface.row₀ P.surface.row₂ hO_ne_c₂ ha_ne_c₁
              P.surface.a_mem_row₀ hc₁K₀ P.a_mem_row₂ hc₁K₂
          have hsep12 :
              separatedPair
                (B.indexOf c₁Label) (B.indexOf c₂Label)
                (B.indexOf aLabel) (B.indexOf OLabel) :=
            selectedFourClasses_shared_pair_separated B
              P.surface.row₁ P.surface.row₂ hc₁_ne_c₂ ha_ne_O
              P.a_mem_row₁ hOK₁ P.a_mem_row₂ hOK₂
          exact ((separatedPair_rotated_incompatible
            (B.index_injective.ne hO_ne_c₁) hsep02) hsep12).elim
        · rcases
              nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
                H P.surface.c₁_mem_A P.surface.O_mem_A P.surface.c₂_mem_A
                  P.surface.O_ne_c₂ P.surface.robustO P.surface.row₂ hc₁K₂
            with ⟨packet⟩
          exact ⟨.firstCenter_not_mem_secondRow
            hc₁K₀ hOK₁ hOK₂ hc₁K₂ packet⟩
      · rcases
            nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
              H P.surface.O_mem_A P.surface.O_mem_A P.surface.c₂_mem_A
                P.surface.O_ne_c₂ P.surface.robustO P.surface.row₂ hOK₂
          with ⟨packet⟩
        exact ⟨.robustCenter_not_mem_secondRow hc₁K₀ hOK₁ hOK₂ packet⟩
    · rcases
          nonempty_commonDeletionTwoCenterPacket_of_fullyDeletionRobustAt_and_omitted_selectedFourClass
            H P.surface.O_mem_A P.surface.O_mem_A P.surface.c₁_mem_A
              P.surface.O_ne_c₁ P.surface.robustO P.surface.row₁ hOK₁
        with ⟨packet⟩
      exact ⟨.robustCenter_not_mem_firstRow hc₁K₀ hOK₁ packet⟩
  · rcases
        nonempty_commonDeletionTwoCenterPacket_of_two_omitted_selectedFourClasses
          H P.surface.c₁_mem_A P.surface.O_mem_A P.surface.c₁_mem_A
            P.surface.O_ne_c₁ P.surface.row₀ P.surface.row₁ hc₁K₀
              P.surface.row₁.center_not_mem
      with ⟨packet⟩
    exact ⟨.firstCenter_not_mem_robustRow hc₁K₀ packet⟩

/-- Package the four-way cyclic reduction while preserving the support names
used by source-specific callers. -/
theorem nonempty_robustApexFourIncidenceContinuationPacket
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {O c₁ c₂ a : ℝ²} {B₀ B₁ B₂ : Finset ℝ²}
    (P : RobustApexFiveIncidenceContinuationPacket
      D H O c₁ c₂ a B₀ B₁ B₂) :
    Nonempty (RobustApexFourIncidenceContinuationPacket
      D H O c₁ c₂ a B₀ B₁ B₂) := by
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by
      have hcard := D.card_gt_four
      omega)
  rcases exists_boundaryIndexing D.convex hncol with ⟨B⟩
  rcases nonempty_robustApexFourIncidenceContinuation H B P with ⟨continuation⟩
  exact ⟨{
    boundaryIndexing := B
    surface := P.surface
    row₀_support_eq := P.row₀_support_eq
    row₁_support_eq := P.row₁_support_eq
    row₂_support_eq := P.row₂_support_eq
    a_mem_row₁ := P.a_mem_row₁
    a_mem_row₂ := P.a_mem_row₂
    continuation := continuation }⟩

end ATailFrontierLiveClosure
end Problem97
