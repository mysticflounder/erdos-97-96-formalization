/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5BoundaryPacket

/-!
# Boundary packets for the card-eleven exact-two branches

This file packages the two exact-two constructors of
`CardElevenUniqueFourCoverage` without choosing an unsupported row or boundary
orientation.

For the `(5,4,5)` profile, the cap-aware labeling uses the second opposite
apex as its three-interior-point cap, leaving the first opposite cap as the
two-interior-point remainder.  For the `(5,5,4)` profile, the existing
aligned-p5 boundary normalization is reused.

Each of the four direct/mirror packets carries:

* an injective CCW `Fin 11` boundary whose image is the complete carrier;
* a global `FaithfulCarrierPattern`;
* the complete exact four-point first-apex class as its first-apex row; and
* the exact two boundary indices where that row meets the strict first
  opposite cap.

The last item is defined as a filtered boundary preimage.  It has cardinality
two by `ExactTwoStrictHitDistribution`; no ordering of the two hits is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourExactTwoBoundaryScratch

open ATailCriticalPairFrontier
open ATailCapApexRadiusRigidity
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourAlignedP5BoundaryScratch
open ATailUniqueFourCardElevenLiftScratch
open ATailUniqueFourClassCapDistributionScratch
open Census554
open Census554.GeneralCarrierBridge
open Census554.SeparationCore

attribute [local instance] Classical.propDecidable

/-- The cap frame used for the `(5,4,5)` branch: the five-point second
opposite cap is the canonical `second` block and the four-point first
opposite cap is the two-point remainder block. -/
def p4Frame {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex2 where
  rest := S.oppIndex1
  rest_ne_surplus := S.surplusIdx_ne_oppIndex1.symm
  rest_ne_second := S.oppIndex1_ne_oppIndex2

@[simp] theorem p4Frame_rest {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (p4Frame S).rest = S.oppIndex1 := rfl

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex1_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem image_directBoundary
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {L : Card11CapLabeling S.partition (p4Frame S)}
    (B : Card11MacroCcwLabeling L.pointOf) :
    Finset.univ.image B.boundary = A := by
  apply Finset.Subset.antisymm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hix⟩
    have hlabel := B.point_eq ((card11IndexEquiv B.order).symm i)
    rw [Equiv.apply_symm_apply] at hlabel
    rw [hlabel] at hix
    exact hix ▸ L.mem_carrier _
  · intro x hx
    rcases L.carrier_surjective x hx with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨card11IndexEquiv B.order label, Finset.mem_univ _, B.point_eq label⟩

private theorem image_mirrorBoundary
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    {L : Card11CapLabeling S.partition (p4Frame S)}
    (B : Card11MirrorMacroCcwLabeling L.pointOf) :
    Finset.univ.image B.boundary = A := by
  apply Finset.Subset.antisymm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hix⟩
    have hlabel := B.point_eq ((card11MirrorIndexEquiv B.order).symm i)
    rw [Equiv.apply_symm_apply] at hlabel
    rw [hlabel] at hix
    exact hix ▸ L.mem_carrier _
  · intro x hx
    rcases L.carrier_surjective x hx with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨card11MirrorIndexEquiv B.order label, Finset.mem_univ _,
        B.point_eq label⟩

/-- The direct `(5,4,5)` macro boundary, re-cut at the first opposite apex.
Its apex positions are `0 = first`, `4 = surplus`, and `7 = second`. -/
structure DirectP4Boundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type where
  labeling : Card11CapLabeling S.partition (p4Frame S)
  direct : Card11MacroCcwLabeling labeling.pointOf

namespace DirectP4Boundary

def boundary {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) : Fin 11 → ℝ² :=
  fun i => B.direct.boundary (i + 7)

theorem boundary_injective {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) :
    Function.Injective B.boundary :=
  injective_cyclicShift B.direct.boundary_injective 7

theorem boundary_ccw {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) :
    EuclideanGeometry.IsCcwConvexPolygon B.boundary :=
  isCcwConvexPolygon_cyclicShift B.direct.boundary_injective
    B.direct.boundary_ccw 7

theorem boundary_image {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) :
    Finset.univ.image B.boundary = A := by
  change Finset.univ.image (fun i : Fin 11 =>
    B.direct.boundary (i + 7)) = A
  rw [image_univ_cyclicShift]
  exact image_directBoundary B.direct

theorem boundary_zero {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectP4Boundary S) :
    B.boundary 0 = S.oppApex1 := by
  have hidx :
      card11IndexEquiv B.direct.order (2 : Fin 11) = 7 := by
    rfl
  have hpoint := B.direct.point_eq (2 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_two.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex1)
  change B.direct.boundary 7 = S.oppApex1
  exact hpoint.trans (hlabel.trans (oppApex1_eq_indexedVertex S).symm)

end DirectP4Boundary

/-- The reflected `(5,4,5)` macro boundary, re-cut at the first opposite
apex. Its apex positions are `0 = first`, `4 = second`, and `7 = surplus`. -/
structure MirrorP4Boundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type where
  labeling : Card11CapLabeling S.partition (p4Frame S)
  mirror : Card11MirrorMacroCcwLabeling labeling.pointOf

namespace MirrorP4Boundary

def boundary {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorP4Boundary S) : Fin 11 → ℝ² :=
  fun i => B.mirror.boundary (i + 4)

theorem boundary_injective {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorP4Boundary S) :
    Function.Injective B.boundary :=
  injective_cyclicShift B.mirror.boundary_injective 4

theorem boundary_ccw {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorP4Boundary S) :
    EuclideanGeometry.IsCcwConvexPolygon B.boundary :=
  isCcwConvexPolygon_cyclicShift B.mirror.boundary_injective
    B.mirror.boundary_ccw 4

theorem boundary_image {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorP4Boundary S) :
    Finset.univ.image B.boundary = A := by
  change Finset.univ.image (fun i : Fin 11 =>
    B.mirror.boundary (i + 4)) = A
  rw [image_univ_cyclicShift]
  exact image_mirrorBoundary B.mirror

theorem boundary_zero {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorP4Boundary S) :
    B.boundary 0 = S.oppApex1 := by
  have hidx :
      card11MirrorIndexEquiv B.mirror.order (2 : Fin 11) = 4 := by
    rfl
  have hpoint := B.mirror.point_eq (2 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_two.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex1)
  change B.mirror.boundary 4 = S.oppApex1
  exact hpoint.trans (hlabel.trans (oppApex1_eq_indexedVertex S).symm)

end MirrorP4Boundary

/-- A cap-aware `(5,4,5)` labeling in either CCW macro orientation. -/
inductive P4SourceBoundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type
  | direct
      (labeling : Card11CapLabeling S.partition (p4Frame S))
      (boundary : Card11MacroCcwLabeling labeling.pointOf)
  | mirror
      (labeling : Card11CapLabeling S.partition (p4Frame S))
      (boundary : Card11MirrorMacroCcwLabeling labeling.pointOf)

/-- The source `(5,4,5)` profile reaches the direct or reflected macro
surface. -/
theorem nonempty_p4SourceBoundary
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5) :
    Nonempty (P4SourceBoundary S) := by
  have hcard : D.A.card = 11 := by
    have hsum := S.capSum
    omega
  have hsurplusInterior :
      (S.capInteriorByIndex S.surplusIdx).card = 3 := by
    have h := capInteriorByIndex_card_add_two S S.surplusIdx
    rw [capByIndex_surplusIdx_eq_surplusCap] at h
    omega
  have hopp2Interior :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    have h := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2] at h
    omega
  have hopp1Interior :
      (S.capInteriorByIndex S.oppIndex1).card = 2 := by
    have h := capInteriorByIndex_card_add_two S S.oppIndex1
    rw [capByIndex_oppIndex1_eq_oppCap1] at h
    omega
  have hcapInterior (i : Fin 3) :
      S.capInteriorByIndex i =
        U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt
          S.partition i := by
    fin_cases i <;> rfl
  rcases Card11CapLabeling.nonempty_of_interior_card_eq
      S.partition S.surplusIdx_ne_oppIndex2.symm (p4Frame S)
      hcard
      (by simpa only [← hcapInterior] using hsurplusInterior)
      (by simpa only [← hcapInterior] using hopp2Interior)
      (by simpa only [p4Frame_rest, ← hcapInterior] using
        hopp1Interior) with
    ⟨L⟩
  rcases L.nonempty_directOrMirrorMacroCcwLabeling
      S D.convex D.K4 S.surplusIdx_ne_oppIndex2.symm
      (p4Frame S) with ⟨B⟩
  cases B with
  | direct direct =>
      exact ⟨P4SourceBoundary.direct L direct⟩
  | mirror mirror =>
      exact ⟨P4SourceBoundary.mirror L mirror⟩

/-- Common source-faithful payload of an exact-two boundary packet. -/
structure ExactTwoBoundaryCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  boundary : Fin 11 → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_zero : boundary 0 = S.oppApex1
  carrierPattern : FaithfulCarrierPattern D.A
  firstApex_mem : S.oppApex1 ∈ D.A
  firstApex_row_eq :
    (carrierPattern.classAt S.oppApex1 firstApex_mem).support =
      SelectedClass D.A S.oppApex1 radius

namespace ExactTwoBoundaryCore

/-- The boundary positions where the actual selected first-apex row meets
the strict first opposite cap. -/
noncomputable def strictHitIndices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : ExactTwoBoundaryCore R distribution) : Finset (Fin 11) :=
  Finset.univ.filter fun i =>
    Q.boundary i ∈
        (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support ∧
      Q.boundary i ∈ S.capInteriorByIndex S.oppIndex1

/-- The two recorded indices map exactly to the geometric first-apex row
intersection with the strict first opposite cap. -/
theorem strictHitIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : ExactTwoBoundaryCore R distribution) :
    Q.strictHitIndices.image Q.boundary =
      SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    rcases Finset.mem_filter.mp hi with ⟨_hi, hrow, hinterior⟩
    rw [Q.firstApex_row_eq] at hrow
    exact Finset.mem_inter.mpr ⟨hrow, hinterior⟩
  · intro hx
    rcases Finset.mem_inter.mp hx with ⟨hclass, hinterior⟩
    have hxA : x ∈ D.A :=
      (mem_selectedClass.mp hclass).1
    have hxImage : x ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact hxA
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, hix⟩
    subst x
    apply Finset.mem_image.mpr
    refine ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩, rfl⟩
    rw [Q.firstApex_row_eq]
    exact ⟨hclass, hinterior⟩

/-- Exactly two boundary positions are strict first-cap hits of the actual
selected first-apex row. -/
theorem strictHitIndices_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : ExactTwoBoundaryCore R distribution) :
    Q.strictHitIndices.card = 2 := by
  rw [← distribution.strict_hit_eq_two, ← Q.strictHitIndices_image,
    Finset.card_image_of_injective _ Q.boundary_injective]

end ExactTwoBoundaryCore

private theorem firstApex_mem_of_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {boundary : Fin 11 → ℝ²}
    (hzero : boundary 0 = S.oppApex1)
    (himage : Finset.univ.image boundary = D.A) :
    S.oppApex1 ∈ D.A := by
  have hmem : boundary 0 ∈ Finset.univ.image boundary :=
    Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
  rw [himage] at hmem
  simpa only [hzero] using hmem

private theorem exists_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (distribution : ExactTwoStrictHitDistribution R)
    (boundary : Fin 11 → ℝ²)
    (hinjective : Function.Injective boundary)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (himage : Finset.univ.image boundary = D.A)
    (hzero : boundary 0 = S.oppApex1) :
    ∃ core : ExactTwoBoundaryCore R distribution,
      core.boundary = boundary := by
  classical
  have hfirst : S.oppApex1 ∈ D.A :=
    firstApex_mem_of_boundary hzero himage
  let K : SelectedFourClass D.A S.oppApex1 :=
    SelectedFourClass.ofSelectedClass
      (frontier_radius_pos F) R.class_card_eq_four
  rcases exists_faithfulCarrierPattern_with_classAt
      D.K4 hfirst K with ⟨carrierPattern, hrow⟩
  refine ⟨{
    boundary := boundary
    boundary_injective := hinjective
    boundary_ccw := hccw
    boundary_image := himage
    boundary_zero := hzero
    carrierPattern := carrierPattern
    firstApex_mem := hfirst
    firstApex_row_eq := by
      simpa [K, SelectedFourClass.ofSelectedClass] using hrow }, rfl⟩

/-- Direct `(5,4,5)` source packet. -/
structure P4DirectBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  orientedBoundary : DirectP4Boundary S
  core : ExactTwoBoundaryCore R distribution
  boundary_eq : core.boundary = orientedBoundary.boundary

/-- Reflected `(5,4,5)` source packet. -/
structure P4MirrorBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  orientedBoundary : MirrorP4Boundary S
  core : ExactTwoBoundaryCore R distribution
  boundary_eq : core.boundary = orientedBoundary.boundary

/-- Direct `(5,5,4)` exact-two source packet. -/
structure P5DirectBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  orientedBoundary : DirectAlignedBoundary S
  core : ExactTwoBoundaryCore R distribution
  boundary_eq : core.boundary = orientedBoundary.boundary

/-- Reflected `(5,5,4)` exact-two source packet. -/
structure P5MirrorBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  orientedBoundary : MirrorAlignedBoundary S
  core : ExactTwoBoundaryCore R distribution
  boundary_eq : core.boundary = orientedBoundary.boundary

/-- Every `(5,4,5)` exact-two source reaches one of its two source-faithful
CCW packet orientations. -/
theorem nonempty_p4DirectBoundaryPacket_or_mirror
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) :
    Nonempty (P4DirectBoundaryPacket R profile distribution) ∨
      Nonempty (P4MirrorBoundaryPacket R profile distribution) := by
  rcases nonempty_p4SourceBoundary S profile with ⟨B⟩
  cases B with
  | direct labeling direct =>
      let O : DirectP4Boundary S := ⟨labeling, direct⟩
      rcases exists_core R distribution O.boundary O.boundary_injective
          O.boundary_ccw O.boundary_image O.boundary_zero with
        ⟨core, hcore⟩
      exact Or.inl ⟨⟨O, core, hcore⟩⟩
  | mirror labeling mirror =>
      let O : MirrorP4Boundary S := ⟨labeling, mirror⟩
      rcases exists_core R distribution O.boundary O.boundary_injective
          O.boundary_ccw O.boundary_image O.boundary_zero with
        ⟨core, hcore⟩
      exact Or.inr ⟨⟨O, core, hcore⟩⟩

/-- Every `(5,5,4)` exact-two source reaches one of its two source-faithful
CCW packet orientations. -/
theorem nonempty_p5DirectBoundaryPacket_or_mirror
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (distribution : ExactTwoStrictHitDistribution R) :
    Nonempty (P5DirectBoundaryPacket R profile distribution) ∨
      Nonempty (P5MirrorBoundaryPacket R profile distribution) := by
  rcases nonempty_alignedP5SourceBoundary S profile with ⟨B⟩
  cases B with
  | direct labeling direct =>
      let O : DirectAlignedBoundary S := ⟨labeling, direct⟩
      rcases exists_core R distribution O.boundary O.boundary_injective
          O.boundary_ccw O.boundary_image O.boundary_zero with
        ⟨core, hcore⟩
      exact Or.inl ⟨⟨O, core, hcore⟩⟩
  | mirror labeling mirror =>
      let O : MirrorAlignedBoundary S := ⟨labeling, mirror⟩
      rcases exists_core R distribution O.boundary O.boundary_injective
          O.boundary_ccw O.boundary_image O.boundary_zero with
        ⟨core, hcore⟩
      exact Or.inr ⟨⟨O, core, hcore⟩⟩

end ATailUniqueFourExactTwoBoundaryScratch
end Problem97

#print axioms
  Problem97.ATailUniqueFourExactTwoBoundaryScratch.ExactTwoBoundaryCore.strictHitIndices_image
#print axioms
  Problem97.ATailUniqueFourExactTwoBoundaryScratch.ExactTwoBoundaryCore.strictHitIndices_card_eq_two
#print axioms
  Problem97.ATailUniqueFourExactTwoBoundaryScratch.nonempty_p4DirectBoundaryPacket_or_mirror
#print axioms
  Problem97.ATailUniqueFourExactTwoBoundaryScratch.nonempty_p5DirectBoundaryPacket_or_mirror
