/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenUniqueFourCoverage
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.SeparationGeometry
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvatureRows

/-!
# Boundary normalization for the aligned card-eleven exact-four branch

The card-eleven aligned branch has cap profile `(5,5,4)`.  This file packages
the direct CCW orientation after cutting at the first non-surplus apex:

```
first apex, surplus-cap interior, second apex,
first-opposite-cap interior, surplus apex, second-opposite-cap interior.
```

Thus the three apices have indices `0`, `4`, and `8`; the closed cap blocks
are `{0,1,2,3,4}`, `{4,5,6,7,8}`, and `{8,9,10,0}`.  The aligned source
theorems imply that all three points at indices `5,6,7` belong to the exact
first-apex class.

The production boundary theorem supplies a direct-or-mirror dichotomy.  The
reflected CCW order cannot be cyclically re-cut to the same `0,4,8` roles:
cutting it at the first apex puts the surplus and second apices at `3` and
`7`, and the exact-class interior at `4,5,6`.  The file therefore exposes
both fully normalized packets and a finite no-recut theorem for the
incompatible `0,4,8` mirror request.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourAlignedP5BoundaryScratch

open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourCardElevenLiftScratch
open ATailUniqueFourClassCapDistributionScratch
open Census554
open Census554.GeneralCarrierBridge
open Census554.SeparationCore
open ShellCurvatureRows

attribute [local instance] Classical.propDecidable

/-- The cap frame `(surplus, first opposite, second opposite)`. -/
def alignedFrame {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1 where
  rest := S.oppIndex2
  rest_ne_surplus := S.surplusIdx_ne_oppIndex2.symm
  rest_ne_second := S.oppIndex1_ne_oppIndex2.symm

@[simp] theorem alignedFrame_rest {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (alignedFrame S).rest = S.oppIndex2 := rfl

/-- Boundary positions in the closed cap opposite the surplus apex. -/
def surplusClosedIndices : Finset (Fin 11) := {0, 1, 2, 3, 4}

/-- Boundary positions in the closed cap opposite the first apex. -/
def firstOppositeClosedIndices : Finset (Fin 11) := {4, 5, 6, 7, 8}

/-- Boundary positions in the closed cap opposite the second apex. -/
def secondOppositeClosedIndices : Finset (Fin 11) := {8, 9, 10, 0}

/-- The three strict points in the cap opposite the first apex. -/
def firstOppositeInteriorIndices : Finset (Fin 11) := {5, 6, 7}

/-- Mirror-order positions in the closed cap opposite the second apex. -/
def mirrorSecondOppositeClosedIndices : Finset (Fin 11) := {0, 1, 2, 3}

/-- Mirror-order positions in the closed cap opposite the first apex. -/
def mirrorFirstOppositeClosedIndices : Finset (Fin 11) := {3, 4, 5, 6, 7}

/-- Mirror-order positions in the closed cap opposite the surplus apex. -/
def mirrorSurplusClosedIndices : Finset (Fin 11) := {7, 8, 9, 10, 0}

/-- Mirror-order strict first-opposite positions. -/
def mirrorFirstOppositeInteriorIndices : Finset (Fin 11) := {4, 5, 6}

/-- Positions `1,2,3` in the surplus-cap interior. -/
def surplusInteriorIndex (i : Fin 3) : Fin 11 := ⟨1 + i, by omega⟩

/-- Positions `5,6,7` in the strict first-opposite cap. -/
def firstOppositeInteriorIndex (i : Fin 3) : Fin 11 := ⟨5 + i, by omega⟩

/-- Positions `9,10` in the strict second-opposite cap. -/
def secondOppositeInteriorIndex (i : Fin 2) : Fin 11 := ⟨9 + i, by omega⟩

/-- In the mirror order cut at the first apex, the second-opposite interior
occupies positions `1,2`. -/
def mirrorSecondOppositeInteriorIndex (i : Fin 2) : Fin 11 :=
  ⟨1 + i, by omega⟩

/-- In the mirror order cut at the first apex, the first-opposite interior
occupies positions `4,5,6`. -/
def mirrorFirstOppositeInteriorIndex (i : Fin 3) : Fin 11 :=
  ⟨4 + i, by omega⟩

/-- In the mirror order cut at the first apex, the surplus-cap interior
occupies positions `8,9,10`. -/
def mirrorSurplusInteriorIndex (i : Fin 3) : Fin 11 :=
  ⟨8 + i, by omega⟩

private def reverseFin2 (i : Fin 2) : Fin 2 := ⟨1 - i, by omega⟩

private def reverseFin3 (i : Fin 3) : Fin 3 := ⟨2 - i, by omega⟩

@[simp] theorem image_firstOppositeInteriorIndex :
    Finset.univ.image firstOppositeInteriorIndex =
      firstOppositeInteriorIndices := by
  decide

/-- No cyclic recut of the mirror macro positions can put the first apex,
second apex, and surplus apex simultaneously at `0`, `4`, and `8`. -/
theorem no_mirror_cyclicCut_roles_zero_four_eight :
    ¬ ∃ cut : Fin 11,
      (0 : Fin 11) + cut = 8 ∧
        (4 : Fin 11) + cut = 4 ∧
          (8 : Fin 11) + cut = 0 := by
  decide

/-- The aligned card-eleven profile makes the strict first-opposite cap a
three-point set. -/
theorem firstOppositeInterior_card_eq_three
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    (S.capInteriorByIndex S.oppIndex1).card = 3 := by
  have hcap :
      (S.capByIndex S.oppIndex1).card = 5 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppCap1, hi] using profile.2.1
  have hinterior := capInteriorByIndex_card_add_two S S.oppIndex1
  omega

/-- In the aligned p5 branch, the exact first-apex class contains the whole
strict first-opposite cap. -/
theorem firstOppositeInterior_subset_exactClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) :
    S.capInteriorByIndex S.oppIndex1 ⊆
      SelectedClass D.A S.oppApex1 radius := by
  classical
  let T := SelectedClass D.A S.oppApex1 radius
  let I := S.capInteriorByIndex S.oppIndex1
  have hcardI : I.card = 3 := by
    simpa [I] using firstOppositeInterior_card_eq_three
      (S := S) profile
  have hcardInter : (T ∩ I).card = I.card := by
    have hle : (T ∩ I).card ≤ I.card :=
      Finset.card_le_card Finset.inter_subset_right
    have hthree : 3 ≤ (T ∩ I).card := by
      simpa [T, I] using P.three_strict_hits
    omega
  have heq : T ∩ I = I :=
    Finset.eq_of_subset_of_card_le Finset.inter_subset_right
      (by simp [hcardInter])
  intro x hx
  have : x ∈ T ∩ I := by simpa [heq] using hx
  exact (Finset.mem_inter.mp this).1

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

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hji : j ≠ i) :
    S.oppositeVertexByIndex j ∈ S.capByIndex i := by
  rw [Card11SelectedCube.capByIndex_eq_capAt]
  rw [← Card11SelectedCube.apexAt_eq_oppositeVertexByIndex]
  exact apexAt_mem_capAt_of_ne S.partition hji

private theorem oppApex1_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_indexedVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- A cap-aware aligned-p5 labeling in either CCW macro orientation. -/
inductive AlignedP5SourceBoundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type
  | direct
      (labeling : Card11CapLabeling S.partition (alignedFrame S))
      (boundary : Card11MacroCcwLabeling labeling.pointOf)
  | mirror
      (labeling : Card11CapLabeling S.partition (alignedFrame S))
      (boundary : Card11MirrorMacroCcwLabeling labeling.pointOf)

/-- The aligned `(5,5,4)` source profile reaches one of the two exact finite
CCW macro surfaces. -/
theorem nonempty_alignedP5SourceBoundary
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4) :
    Nonempty (AlignedP5SourceBoundary S) := by
  have hcard : D.A.card = 11 := by
    have hsum := S.capSum
    omega
  have hsurplusInterior :
      (S.capInteriorByIndex S.surplusIdx).card = 3 := by
    have h := capInteriorByIndex_card_add_two S S.surplusIdx
    rw [capByIndex_surplusIdx_eq_surplusCap] at h
    omega
  have hopp1Interior :
      (S.capInteriorByIndex S.oppIndex1).card = 3 :=
    firstOppositeInterior_card_eq_three (S := S) profile
  have hopp2Interior :
      (S.capInteriorByIndex S.oppIndex2).card = 2 := by
    have h := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2] at h
    omega
  have hcapInterior (i : Fin 3) :
      S.capInteriorByIndex i =
        U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt
          S.partition i := by
    fin_cases i <;> rfl
  rcases Card11CapLabeling.nonempty_of_interior_card_eq
      S.partition S.surplusIdx_ne_oppIndex1.symm (alignedFrame S)
      hcard
      (by simpa only [← hcapInterior] using hsurplusInterior)
      (by simpa only [← hcapInterior] using hopp1Interior)
      (by simpa only [alignedFrame_rest, ← hcapInterior] using
        hopp2Interior) with
    ⟨L⟩
  rcases L.nonempty_directOrMirrorMacroCcwLabeling
      S D.convex D.K4 S.surplusIdx_ne_oppIndex1.symm
      (alignedFrame S) with ⟨B⟩
  cases B with
  | direct direct =>
      exact ⟨AlignedP5SourceBoundary.direct L direct⟩
  | mirror mirror =>
      exact ⟨AlignedP5SourceBoundary.mirror L mirror⟩

/-- A cap-aware labeling together with the direct CCW macro orientation.
This is the exact orientation hypothesis still needed to obtain the fixed
`0,4,8` role normalization. -/
structure DirectAlignedBoundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type where
  labeling : Card11CapLabeling S.partition (alignedFrame S)
  direct : Card11MacroCcwLabeling labeling.pointOf

namespace DirectAlignedBoundary

private theorem oppApex1_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem capInteriorByIndex_eq_capInteriorAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capInteriorByIndex i =
      U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt
        S.partition i := by
  fin_cases i <;> rfl

/-- Re-cut the direct macro order by three positions, at the first apex. -/
def boundary {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) : Fin 11 → ℝ² :=
  fun i => B.direct.boundary (i + 3)

private def surplusInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) : Fin 11 :=
  ⟨3 + B.direct.order.2.1.symm i, by omega⟩

private def firstOppositeInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) : Fin 11 :=
  ⟨6 + B.direct.order.2.2.symm i, by omega⟩

private def secondOppositeInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 2) : Fin 11 :=
  ⟨9 + B.direct.order.1.symm i, by omega⟩

private theorem boundary_surplusInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) :
    B.boundary (surplusInteriorIndex i) =
      B.labeling.pointOf (B.surplusInteriorLabel i) := by
  have hidx := card11IndexEquiv_surplusInterior B.direct.order
    (B.direct.order.2.1.symm i)
  have hidx' :
      card11IndexEquiv B.direct.order (B.surplusInteriorLabel i) =
        ⟨4 + i, by omega⟩ := by
    rw [show B.surplusInteriorLabel i =
      ⟨3 + B.direct.order.2.1.symm i, by omega⟩ by rfl]
    exact hidx.trans (Fin.ext (by simp))
  have hpoint := B.direct.point_eq (B.surplusInteriorLabel i)
  rw [hidx'] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

private theorem boundary_firstOppositeInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) :
    B.boundary (firstOppositeInteriorIndex i) =
      B.labeling.pointOf (B.firstOppositeInteriorLabel i) := by
  have hidx := card11IndexEquiv_firstOtherInterior B.direct.order
    (B.direct.order.2.2.symm i)
  have hidx' :
      card11IndexEquiv B.direct.order
          (B.firstOppositeInteriorLabel i) =
        ⟨8 + i, by omega⟩ := by
    rw [show B.firstOppositeInteriorLabel i =
      ⟨6 + B.direct.order.2.2.symm i, by omega⟩ by rfl]
    exact hidx.trans (Fin.ext (by simp))
  have hpoint := B.direct.point_eq (B.firstOppositeInteriorLabel i)
  rw [hidx'] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

private theorem boundary_secondOppositeInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 2) :
    B.boundary (secondOppositeInteriorIndex i) =
      B.labeling.pointOf (B.secondOppositeInteriorLabel i) := by
  have hidx := card11IndexEquiv_secondOtherInterior B.direct.order
    (B.direct.order.1.symm i)
  have hidx' :
      card11IndexEquiv B.direct.order
          (B.secondOppositeInteriorLabel i) =
        ⟨1 + i, by omega⟩ := by
    rw [show B.secondOppositeInteriorLabel i =
      ⟨9 + B.direct.order.1.symm i, by omega⟩ by rfl]
    exact hidx.trans (Fin.ext (by simp))
  have hpoint := B.direct.point_eq (B.secondOppositeInteriorLabel i)
  rw [hidx'] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

theorem boundary_injective {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    Function.Injective B.boundary :=
  injective_cyclicShift B.direct.boundary_injective 3

theorem boundary_ccw {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    EuclideanGeometry.IsCcwConvexPolygon B.boundary :=
  isCcwConvexPolygon_cyclicShift B.direct.boundary_injective
    B.direct.boundary_ccw 3

theorem boundary_image {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    Finset.univ.image B.boundary = A := by
  change Finset.univ.image (fun i : Fin 11 =>
    B.direct.boundary (i + 3)) = A
  rw [image_univ_cyclicShift]
  apply Finset.Subset.antisymm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hix⟩
    have hlabel := B.direct.point_eq
      ((card11IndexEquiv B.direct.order).symm i)
    rw [Equiv.apply_symm_apply] at hlabel
    rw [hlabel] at hix
    exact hix ▸ B.labeling.mem_carrier _
  · intro x hx
    rcases B.labeling.carrier_surjective x hx with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨card11IndexEquiv B.direct.order label, Finset.mem_univ _,
        B.direct.point_eq label⟩

theorem boundary_zero {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    B.boundary 0 = S.oppApex1 := by
  have hidx :
      card11IndexEquiv B.direct.order (1 : Fin 11) = 3 := by
    rfl
  have hpoint := B.direct.point_eq (1 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_one.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex1)
  change B.direct.boundary 3 = S.oppApex1
  exact hpoint.trans (hlabel.trans
    (oppApex1_eq_oppositeVertexByIndex S).symm)

theorem boundary_four {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    B.boundary 4 = S.oppApex2 := by
  have hidx :
      card11IndexEquiv B.direct.order (2 : Fin 11) = 7 := by
    rfl
  have hpoint := B.direct.point_eq (2 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_two.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex2)
  change B.direct.boundary 7 = S.oppApex2
  exact hpoint.trans (hlabel.trans
    (oppApex2_eq_oppositeVertexByIndex S).symm)

theorem boundary_eight {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) :
    B.boundary 8 = S.oppositeVertexByIndex S.surplusIdx := by
  have hidx :
      card11IndexEquiv B.direct.order (0 : Fin 11) = 0 := by
    rfl
  have hpoint := B.direct.point_eq (0 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_zero.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.surplusIdx)
  change B.direct.boundary 0 =
    S.oppositeVertexByIndex S.surplusIdx
  exact hpoint.trans hlabel

theorem boundary_surplusInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) :
    B.boundary (surplusInteriorIndex i) ∈
      S.capInteriorByIndex S.surplusIdx := by
  rw [B.boundary_surplusInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.surplusInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition S.surplusIdx
  rw [B.labeling.surplusInterior_eq]
  generalize hj : B.direct.order.2.1.symm i = j
  fin_cases j <;>
    simp [surplusInteriorLabel, hj, Card11Labeling.capSInteriorLabels]

theorem boundary_firstOppositeInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 3) :
    B.boundary (firstOppositeInteriorIndex i) ∈
      S.capInteriorByIndex S.oppIndex1 := by
  rw [B.boundary_firstOppositeInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.firstOppositeInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition S.oppIndex1
  rw [B.labeling.secondInterior_eq]
  generalize hj : B.direct.order.2.2.symm i = j
  fin_cases j <;>
    simp [firstOppositeInteriorLabel, hj,
      Card11Labeling.capO1InteriorLabels]

theorem boundary_secondOppositeInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : DirectAlignedBoundary S) (i : Fin 2) :
    B.boundary (secondOppositeInteriorIndex i) ∈
      S.capInteriorByIndex S.oppIndex2 := by
  rw [B.boundary_secondOppositeInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.secondOppositeInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition
      (alignedFrame S).rest
  rw [B.labeling.restInterior_eq]
  generalize hj : B.direct.order.1.symm i = j
  fin_cases j <;>
    simp [secondOppositeInteriorLabel, hj,
      Card11Labeling.capO2InteriorLabels]

end DirectAlignedBoundary

/-- A cap-aware labeling together with the reflected CCW macro orientation. -/
structure MirrorAlignedBoundary
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Type where
  labeling : Card11CapLabeling S.partition (alignedFrame S)
  mirror : Card11MirrorMacroCcwLabeling labeling.pointOf

namespace MirrorAlignedBoundary

/-- Re-cut the reflected macro order by eight positions, at the first apex. -/
def boundary {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) : Fin 11 → ℝ² :=
  fun i => B.mirror.boundary (i + 8)

private def surplusInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) : Fin 11 :=
  ⟨3 + B.mirror.order.2.1.symm (reverseFin3 i), by omega⟩

private def firstOppositeInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) : Fin 11 :=
  ⟨6 + B.mirror.order.2.2.symm (reverseFin3 i), by omega⟩

private def secondOppositeInteriorLabel
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 2) : Fin 11 :=
  ⟨9 + B.mirror.order.1.symm (reverseFin2 i), by omega⟩

theorem boundary_injective {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    Function.Injective B.boundary :=
  injective_cyclicShift B.mirror.boundary_injective 8

theorem boundary_ccw {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    EuclideanGeometry.IsCcwConvexPolygon B.boundary :=
  isCcwConvexPolygon_cyclicShift B.mirror.boundary_injective
    B.mirror.boundary_ccw 8

theorem boundary_image {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    Finset.univ.image B.boundary = A := by
  change Finset.univ.image (fun i : Fin 11 =>
    B.mirror.boundary (i + 8)) = A
  rw [image_univ_cyclicShift]
  apply Finset.Subset.antisymm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hix⟩
    have hlabel := B.mirror.point_eq
      ((card11MirrorIndexEquiv B.mirror.order).symm i)
    rw [Equiv.apply_symm_apply] at hlabel
    rw [hlabel] at hix
    exact hix ▸ B.labeling.mem_carrier _
  · intro x hx
    rcases B.labeling.carrier_surjective x hx with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨card11MirrorIndexEquiv B.mirror.order label, Finset.mem_univ _,
        B.mirror.point_eq label⟩

theorem boundary_zero {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    B.boundary 0 = S.oppApex1 := by
  have hidx :
      card11MirrorIndexEquiv B.mirror.order (1 : Fin 11) = 8 := by
    rfl
  have hpoint := B.mirror.point_eq (1 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_one.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex1)
  change B.mirror.boundary 8 = S.oppApex1
  exact hpoint.trans (hlabel.trans
    (oppApex1_eq_indexedVertex S).symm)

theorem boundary_three {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    B.boundary 3 = S.oppositeVertexByIndex S.surplusIdx := by
  have hidx :
      card11MirrorIndexEquiv B.mirror.order (0 : Fin 11) = 0 := by
    rfl
  have hpoint := B.mirror.point_eq (0 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_zero.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.surplusIdx)
  change B.mirror.boundary 0 =
    S.oppositeVertexByIndex S.surplusIdx
  exact hpoint.trans hlabel

theorem boundary_seven {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) :
    B.boundary 7 = S.oppApex2 := by
  have hidx :
      card11MirrorIndexEquiv B.mirror.order (2 : Fin 11) = 4 := by
    rfl
  have hpoint := B.mirror.point_eq (2 : Fin 11)
  rw [hidx] at hpoint
  have hlabel := B.labeling.point_two.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex2)
  change B.mirror.boundary 4 = S.oppApex2
  exact hpoint.trans (hlabel.trans
    (oppApex2_eq_indexedVertex S).symm)

private theorem boundary_surplusInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) :
    B.boundary (mirrorSurplusInteriorIndex i) =
      B.labeling.pointOf (B.surplusInteriorLabel i) := by
  have hdirect := card11IndexEquiv_surplusInterior B.mirror.order
    (B.mirror.order.2.1.symm (reverseFin3 i))
  have hdirect' :
      card11IndexEquiv B.mirror.order (B.surplusInteriorLabel i) =
        ⟨4 + reverseFin3 i, by omega⟩ := by
    rw [show B.surplusInteriorLabel i =
      ⟨3 + B.mirror.order.2.1.symm (reverseFin3 i), by omega⟩ by rfl]
    exact hdirect.trans (Fin.ext (by simp))
  have hmirror :
      card11MirrorIndexEquiv B.mirror.order
          (B.surplusInteriorLabel i) =
        ⟨5 + i, by omega⟩ := by
    change card11BoundaryReflection
      (card11IndexEquiv B.mirror.order (B.surplusInteriorLabel i)) =
        ⟨5 + i, by omega⟩
    rw [hdirect']
    apply Fin.ext
    fin_cases i <;> rfl
  have hpoint := B.mirror.point_eq (B.surplusInteriorLabel i)
  rw [hmirror] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

private theorem boundary_firstOppositeInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) :
    B.boundary (mirrorFirstOppositeInteriorIndex i) =
      B.labeling.pointOf (B.firstOppositeInteriorLabel i) := by
  have hdirect := card11IndexEquiv_firstOtherInterior B.mirror.order
    (B.mirror.order.2.2.symm (reverseFin3 i))
  have hdirect' :
      card11IndexEquiv B.mirror.order
          (B.firstOppositeInteriorLabel i) =
        ⟨8 + reverseFin3 i, by omega⟩ := by
    rw [show B.firstOppositeInteriorLabel i =
      ⟨6 + B.mirror.order.2.2.symm (reverseFin3 i), by omega⟩ by rfl]
    exact hdirect.trans (Fin.ext (by simp))
  have hmirror :
      card11MirrorIndexEquiv B.mirror.order
          (B.firstOppositeInteriorLabel i) =
        ⟨1 + i, by omega⟩ := by
    change card11BoundaryReflection
      (card11IndexEquiv B.mirror.order
        (B.firstOppositeInteriorLabel i)) =
          ⟨1 + i, by omega⟩
    rw [hdirect']
    apply Fin.ext
    fin_cases i <;> rfl
  have hpoint := B.mirror.point_eq (B.firstOppositeInteriorLabel i)
  rw [hmirror] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

private theorem boundary_secondOppositeInteriorIndex_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 2) :
    B.boundary (mirrorSecondOppositeInteriorIndex i) =
      B.labeling.pointOf (B.secondOppositeInteriorLabel i) := by
  have hdirect := card11IndexEquiv_secondOtherInterior B.mirror.order
    (B.mirror.order.1.symm (reverseFin2 i))
  have hdirect' :
      card11IndexEquiv B.mirror.order
          (B.secondOppositeInteriorLabel i) =
        ⟨1 + reverseFin2 i, by omega⟩ := by
    rw [show B.secondOppositeInteriorLabel i =
      ⟨9 + B.mirror.order.1.symm (reverseFin2 i), by omega⟩ by rfl]
    exact hdirect.trans (Fin.ext (by simp))
  have hmirror :
      card11MirrorIndexEquiv B.mirror.order
          (B.secondOppositeInteriorLabel i) =
        ⟨9 + i, by omega⟩ := by
    change card11BoundaryReflection
      (card11IndexEquiv B.mirror.order
        (B.secondOppositeInteriorLabel i)) =
          ⟨9 + i, by omega⟩
    rw [hdirect']
    apply Fin.ext
    fin_cases i <;> rfl
  have hpoint := B.mirror.point_eq (B.secondOppositeInteriorLabel i)
  rw [hmirror] at hpoint
  rw [boundary]
  convert hpoint using 1
  congr 1
  fin_cases i <;> rfl

private theorem capInteriorByIndex_eq_capInteriorAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capInteriorByIndex i =
      U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt
        S.partition i := by
  fin_cases i <;> rfl

theorem boundary_surplusInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) :
    B.boundary (mirrorSurplusInteriorIndex i) ∈
      S.capInteriorByIndex S.surplusIdx := by
  rw [B.boundary_surplusInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.surplusInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition S.surplusIdx
  rw [B.labeling.surplusInterior_eq]
  generalize hj : B.mirror.order.2.1.symm (reverseFin3 i) = j
  fin_cases j <;>
    simp [surplusInteriorLabel, hj, Card11Labeling.capSInteriorLabels]

theorem boundary_firstOppositeInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 3) :
    B.boundary (mirrorFirstOppositeInteriorIndex i) ∈
      S.capInteriorByIndex S.oppIndex1 := by
  rw [B.boundary_firstOppositeInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.firstOppositeInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition S.oppIndex1
  rw [B.labeling.secondInterior_eq]
  generalize hj : B.mirror.order.2.2.symm (reverseFin3 i) = j
  fin_cases j <;>
    simp [firstOppositeInteriorLabel, hj,
      Card11Labeling.capO1InteriorLabels]

theorem boundary_secondOppositeInteriorIndex_mem
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (B : MirrorAlignedBoundary S) (i : Fin 2) :
    B.boundary (mirrorSecondOppositeInteriorIndex i) ∈
      S.capInteriorByIndex S.oppIndex2 := by
  rw [B.boundary_secondOppositeInteriorIndex_eq]
  rw [capInteriorByIndex_eq_capInteriorAt]
  apply (Card11Labeling.mem_labelsOf B.labeling.toCard11Labeling).mp
  change B.secondOppositeInteriorLabel i ∈
    B.labeling.toCard11Labeling.interiorLabels S.partition
      (alignedFrame S).rest
  rw [B.labeling.restInterior_eq]
  generalize hj : B.mirror.order.1.symm (reverseFin2 i) = j
  fin_cases j <;>
    simp [secondOppositeInteriorLabel, hj,
      Card11Labeling.capO2InteriorLabels]

end MirrorAlignedBoundary

/-- The source-aligned p5 packet with a global selected-row pattern preserving
the complete exact first-apex class. -/
structure AlignedP5BoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) : Type where
  orientedBoundary : DirectAlignedBoundary S
  carrierPattern : FaithfulCarrierPattern D.A
  firstApex_mem : S.oppApex1 ∈ D.A
  firstApex_row_eq :
    (carrierPattern.classAt S.oppApex1 firstApex_mem).support =
      SelectedClass D.A S.oppApex1 radius

/-- The reflected CCW normalization, cut at the first apex.  Its apex roles
are necessarily `0 = first`, `3 = surplus`, and `7 = second`. -/
structure AlignedP5MirrorBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) : Type where
  orientedBoundary : MirrorAlignedBoundary S
  carrierPattern : FaithfulCarrierPattern D.A
  firstApex_mem : S.oppApex1 ∈ D.A
  firstApex_row_eq :
    (carrierPattern.classAt S.oppApex1 firstApex_mem).support =
      SelectedClass D.A S.oppApex1 radius

/-- A direct source boundary supplies the normalized packet, while global K4
chooses all remaining rows without changing the exact first-apex class. -/
theorem nonempty_alignedP5BoundaryPacket_of_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R)
    (B : DirectAlignedBoundary S) :
    Nonempty (AlignedP5BoundaryPacket R profile P) := by
  classical
  have hfirst : S.oppApex1 ∈ D.A := by
    have hzero :
        B.boundary 0 ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
    rw [B.boundary_image] at hzero
    simpa only [B.boundary_zero] using hzero
  let K : SelectedFourClass D.A S.oppApex1 :=
    SelectedFourClass.ofSelectedClass
      (frontier_radius_pos F) R.class_card_eq_four
  rcases exists_faithfulCarrierPattern_with_classAt
      D.K4 hfirst K with ⟨carrierPattern, hrow⟩
  exact ⟨{
    orientedBoundary := B
    carrierPattern := carrierPattern
    firstApex_mem := hfirst
    firstApex_row_eq := by
      simpa [K, SelectedFourClass.ofSelectedClass] using hrow }⟩

/-- A reflected source boundary supplies the sharp mirror packet while
preserving the complete exact first-apex row. -/
theorem nonempty_alignedP5MirrorBoundaryPacket_of_mirror
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R)
    (B : MirrorAlignedBoundary S) :
    Nonempty (AlignedP5MirrorBoundaryPacket R profile P) := by
  classical
  have hfirst : S.oppApex1 ∈ D.A := by
    have hzero :
        B.boundary 0 ∈ Finset.univ.image B.boundary :=
      Finset.mem_image.mpr ⟨0, Finset.mem_univ _, rfl⟩
    rw [B.boundary_image] at hzero
    simpa only [B.boundary_zero] using hzero
  let K : SelectedFourClass D.A S.oppApex1 :=
    SelectedFourClass.ofSelectedClass
      (frontier_radius_pos F) R.class_card_eq_four
  rcases exists_faithfulCarrierPattern_with_classAt
      D.K4 hfirst K with ⟨carrierPattern, hrow⟩
  exact ⟨{
    orientedBoundary := B
    carrierPattern := carrierPattern
    firstApex_mem := hfirst
    firstApex_row_eq := by
      simpa [K, SelectedFourClass.ofSelectedClass] using hrow }⟩

/-- Fully source-level reachability: either the fixed-role direct packet is
available, or the sharp reflected packet is available. -/
theorem nonempty_alignedP5BoundaryPacket_or_mirror
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4)
    (P : AlignedInteriorFrontier R) :
    Nonempty (AlignedP5BoundaryPacket R profile P) ∨
      Nonempty (AlignedP5MirrorBoundaryPacket R profile P) := by
  rcases nonempty_alignedP5SourceBoundary S profile with ⟨B⟩
  cases B with
  | direct labeling boundary =>
      exact Or.inl <| nonempty_alignedP5BoundaryPacket_of_direct
        R profile P ⟨labeling, boundary⟩
  | mirror labeling boundary =>
      exact Or.inr <| nonempty_alignedP5MirrorBoundaryPacket_of_mirror
        R profile P ⟨labeling, boundary⟩

namespace AlignedP5BoundaryPacket

abbrev boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) : Fin 11 → ℝ² :=
  Q.orientedBoundary.boundary

theorem boundary_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Function.Injective Q.boundary :=
  Q.orientedBoundary.boundary_injective

theorem boundary_ccw
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    EuclideanGeometry.IsCcwConvexPolygon Q.boundary :=
  Q.orientedBoundary.boundary_ccw

theorem boundary_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Finset.univ.image Q.boundary = D.A :=
  Q.orientedBoundary.boundary_image

/-- The inverse boundary index of a canonical carrier label. -/
noncomputable def boundaryIndexOf
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P)
    (label : GeneralCarrierBridge.CarrierLabel D.A) : Fin 11 :=
  Classical.choose <| by
    have hmem : label.1 ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩

theorem boundary_boundaryIndexOf
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P)
    (label : GeneralCarrierBridge.CarrierLabel D.A) :
    Q.boundary (Q.boundaryIndexOf label) = label.1 :=
  Classical.choose_spec <| by
    have hmem : label.1 ∈ Finset.univ.image Q.boundary := by
      rw [Q.boundary_image]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩

theorem boundaryIndexOf_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Function.Injective Q.boundaryIndexOf := by
  intro a b hab
  apply Subtype.ext
  calc
    a.1 = Q.boundary (Q.boundaryIndexOf a) :=
      (Q.boundary_boundaryIndexOf a).symm
    _ = Q.boundary (Q.boundaryIndexOf b) := congrArg Q.boundary hab
    _ = b.1 := Q.boundary_boundaryIndexOf b

/-- The normalized enumeration as the generic Census554 carrier boundary. -/
noncomputable def toBoundaryIndexing
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    GeneralCarrierBridge.BoundaryIndexing D.A where
  n := 11
  boundary := Q.boundary
  indexOf := Q.boundaryIndexOf
  boundary_injective := Q.boundary_injective
  boundary_image := Q.boundary_image
  boundary_ccw := Q.boundary_ccw
  index_injective := Q.boundaryIndexOf_injective
  point_eq := Q.boundary_boundaryIndexOf

/-- The same normalized enumeration in the successor-indexed shell boundary
interface. -/
noncomputable def toShellBoundaryIndexing
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    ShellBoundaryIndexing D.A where
  n := 10
  three_le := by omega
  boundary := Q.boundary
  indexOf := Q.boundaryIndexOf
  boundary_injective := Q.boundary_injective
  boundary_image := Q.boundary_image
  boundary_ccw := Q.boundary_ccw
  index_injective := Q.boundaryIndexOf_injective
  point_eq := Q.boundary_boundaryIndexOf

theorem boundary_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Q.boundary 0 = S.oppApex1 :=
  Q.orientedBoundary.boundary_zero

theorem boundary_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Q.boundary 4 = S.oppApex2 :=
  Q.orientedBoundary.boundary_four

theorem boundary_eight
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    Q.boundary 8 = S.oppositeVertexByIndex S.surplusIdx :=
  Q.orientedBoundary.boundary_eight

/-- The normalized strict positions `5,6,7` all belong to the complete exact
first-apex class. -/
theorem boundary_firstOppositeInteriorIndex_mem_exactClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) (i : Fin 3) :
    Q.boundary (firstOppositeInteriorIndex i) ∈
      SelectedClass D.A S.oppApex1 radius :=
  firstOppositeInterior_subset_exactClass profile P
    (Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem i)

/-- Canonical carrier label at a normalized boundary position. -/
noncomputable def carrierLabelAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) (i : Fin 11) :
    GeneralCarrierBridge.CarrierLabel D.A :=
  ⟨Q.boundary i, by
    have hmem : Q.boundary i ∈ Finset.univ.image Q.boundary :=
      Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    simpa only [Q.boundary_image] using hmem⟩

/-- The labels at positions `5,6,7` lie in the pulled-back exact first-apex
row of the global faithful carrier pattern. -/
theorem carrierLabelAt_firstOppositeInteriorIndex_mem_rowPattern
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) (i : Fin 3) :
    Q.carrierLabelAt (firstOppositeInteriorIndex i) ∈
      GeneralCarrierBridge.rowPattern Q.carrierPattern
        (Q.carrierLabelAt 0) := by
  have hcenter :
      Q.carrierLabelAt 0 =
        (⟨S.oppApex1, Q.firstApex_mem⟩ :
          GeneralCarrierBridge.CarrierLabel D.A) := by
    apply Subtype.ext
    exact Q.boundary_zero
  rw [hcenter]
  apply (GeneralCarrierBridge.mem_rowPattern_iff
    Q.carrierPattern
      (⟨S.oppApex1, Q.firstApex_mem⟩ :
        GeneralCarrierBridge.CarrierLabel D.A)
      (Q.carrierLabelAt (firstOppositeInteriorIndex i))).mpr
  change Q.boundary (firstOppositeInteriorIndex i) ∈
    (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support
  rw [Q.firstApex_row_eq]
  exact Q.boundary_firstOppositeInteriorIndex_mem_exactClass i

/-- Set form of the exact membership of positions `5,6,7`. -/
theorem firstOppositeInterior_image_subset_exactClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    firstOppositeInteriorIndices.image Q.boundary ⊆
      SelectedClass D.A S.oppApex1 radius := by
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨index, hindex, rfl⟩
  rw [← image_firstOppositeInteriorIndex] at hindex
  rcases Finset.mem_image.mp hindex with ⟨i, _hi, rfl⟩
  exact Q.boundary_firstOppositeInteriorIndex_mem_exactClass i

/-- The literal block `{0,1,2,3,4}` maps exactly to the closed surplus cap. -/
theorem surplusClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    surplusClosedIndices.image Q.boundary = S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [surplusClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [Q.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [surplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    · rw [Q.boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
  · rw [profile.1, Finset.card_image_of_injective _ Q.boundary_injective]
    decide

/-- The literal block `{4,5,6,7,8}` maps exactly to the closed cap opposite
the first apex. -/
theorem firstOppositeClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    firstOppositeClosedIndices.image Q.boundary = S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [firstOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [Q.boundary_four, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [firstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (2 : Fin 3)
    · rw [Q.boundary_eight, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
  · rw [profile.2.1,
      Finset.card_image_of_injective _ Q.boundary_injective]
    decide

/-- The literal wraparound block `{8,9,10,0}` maps exactly to the closed cap
opposite the second apex. -/
theorem secondOppositeClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5BoundaryPacket R profile P) :
    secondOppositeClosedIndices.image Q.boundary = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [secondOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl
    · rw [Q.boundary_eight, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [secondOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [secondOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    · rw [Q.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
  · rw [profile.2.2,
      Finset.card_image_of_injective _ Q.boundary_injective]
    decide

end AlignedP5BoundaryPacket

namespace AlignedP5MirrorBoundaryPacket

abbrev boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) : Fin 11 → ℝ² :=
  Q.orientedBoundary.boundary

theorem boundary_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    Function.Injective Q.boundary :=
  Q.orientedBoundary.boundary_injective

theorem boundary_ccw
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    EuclideanGeometry.IsCcwConvexPolygon Q.boundary :=
  Q.orientedBoundary.boundary_ccw

theorem boundary_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    Finset.univ.image Q.boundary = D.A :=
  Q.orientedBoundary.boundary_image

theorem boundary_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    Q.boundary 0 = S.oppApex1 :=
  Q.orientedBoundary.boundary_zero

theorem boundary_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    Q.boundary 3 = S.oppositeVertexByIndex S.surplusIdx :=
  Q.orientedBoundary.boundary_three

theorem boundary_seven
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    Q.boundary 7 = S.oppApex2 :=
  Q.orientedBoundary.boundary_seven

/-- The mirror-order positions `4,5,6` are exactly the three normalized
strict first-opposite points, hence all lie in the exact first-apex class. -/
theorem boundary_firstOppositeInteriorIndex_mem_exactClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) (i : Fin 3) :
    Q.boundary (mirrorFirstOppositeInteriorIndex i) ∈
      SelectedClass D.A S.oppApex1 radius :=
  firstOppositeInterior_subset_exactClass profile P
    (Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem i)

/-- Canonical carrier label at a reflected normalized boundary position. -/
noncomputable def carrierLabelAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) (i : Fin 11) :
    GeneralCarrierBridge.CarrierLabel D.A :=
  ⟨Q.boundary i, by
    have hmem : Q.boundary i ∈ Finset.univ.image Q.boundary :=
      Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    simpa only [Q.boundary_image] using hmem⟩

/-- The reflected positions `4,5,6` lie in the pulled-back exact first-apex
row of the global faithful carrier pattern. -/
theorem carrierLabelAt_firstOppositeInteriorIndex_mem_rowPattern
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) (i : Fin 3) :
    Q.carrierLabelAt (mirrorFirstOppositeInteriorIndex i) ∈
      GeneralCarrierBridge.rowPattern Q.carrierPattern
        (Q.carrierLabelAt 0) := by
  have hcenter :
      Q.carrierLabelAt 0 =
        (⟨S.oppApex1, Q.firstApex_mem⟩ :
          GeneralCarrierBridge.CarrierLabel D.A) := by
    apply Subtype.ext
    exact Q.boundary_zero
  rw [hcenter]
  apply (GeneralCarrierBridge.mem_rowPattern_iff
    Q.carrierPattern
      (⟨S.oppApex1, Q.firstApex_mem⟩ :
        GeneralCarrierBridge.CarrierLabel D.A)
      (Q.carrierLabelAt (mirrorFirstOppositeInteriorIndex i))).mpr
  change Q.boundary (mirrorFirstOppositeInteriorIndex i) ∈
    (Q.carrierPattern.classAt S.oppApex1 Q.firstApex_mem).support
  rw [Q.firstApex_row_eq]
  exact Q.boundary_firstOppositeInteriorIndex_mem_exactClass i

theorem mirrorSecondOppositeClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    mirrorSecondOppositeClosedIndices.image Q.boundary = S.oppCap2 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorSecondOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl
    · rw [Q.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSecondOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_secondOppositeInteriorIndex_mem (0 : Fin 2)
    · rw [← capByIndex_oppIndex2_eq_oppCap2]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSecondOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_secondOppositeInteriorIndex_mem (1 : Fin 2)
    · rw [Q.boundary_three, ← capByIndex_oppIndex2_eq_oppCap2]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2
  · rw [profile.2.2,
      Finset.card_image_of_injective _ Q.boundary_injective]
    decide

theorem mirrorFirstOppositeClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    mirrorFirstOppositeClosedIndices.image Q.boundary = S.oppCap1 := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorFirstOppositeClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [Q.boundary_three, ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_oppIndex1_eq_oppCap1]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorFirstOppositeInteriorIndex] using
        Q.orientedBoundary.boundary_firstOppositeInteriorIndex_mem (2 : Fin 3)
    · rw [Q.boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_oppIndex1_eq_oppCap1]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
  · rw [profile.2.1,
      Finset.card_image_of_injective _ Q.boundary_injective]
    decide

theorem mirrorSurplusClosedIndices_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {P : AlignedInteriorFrontier R}
    (Q : AlignedP5MirrorBoundaryPacket R profile P) :
    mirrorSurplusClosedIndices.image Q.boundary = S.surplusCap := by
  apply Finset.eq_of_subset_of_card_le
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    simp only [mirrorSurplusClosedIndices, Finset.mem_insert,
      Finset.mem_singleton] at hi
    rcases hi with rfl | rfl | rfl | rfl | rfl
    · rw [Q.boundary_seven, oppApex2_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex2.symm
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (0 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (1 : Fin 3)
    · rw [← capByIndex_surplusIdx_eq_surplusCap]
      apply S.capInteriorByIndex_subset_capByIndex
      simpa [mirrorSurplusInteriorIndex] using
        Q.orientedBoundary.boundary_surplusInteriorIndex_mem (2 : Fin 3)
    · rw [Q.boundary_zero, oppApex1_eq_indexedVertex,
        ← capByIndex_surplusIdx_eq_surplusCap]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.surplusIdx_ne_oppIndex1.symm
  · rw [profile.1, Finset.card_image_of_injective _ Q.boundary_injective]
    decide

end AlignedP5MirrorBoundaryPacket

end ATailUniqueFourAlignedP5BoundaryScratch
end Problem97
