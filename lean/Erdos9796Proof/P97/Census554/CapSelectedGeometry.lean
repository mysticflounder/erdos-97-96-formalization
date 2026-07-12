/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode
import Erdos9796Proof.P97.Census554.GeometryBridge
import Erdos9796Proof.P97.Census554.SeparationMirror
import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Geometric labeling surface for the cap-selected card-eleven branch

The forced `(6,4,4)` branch uses a different block profile from the existing
card-eleven `(5,5,4)` separation certificate. This file records only the common
boundary contract: canonical labels occur in the order encoded by
`CapSelectedFiniteCode.hullIndex`, or in its reflection about the surplus-apex
cut.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace CapSelectedGeometry

open CapSelectedFiniteCode
open SeparationCore

/-- A CCW boundary realizing the canonical `(6,4,4)` labels in either
orientation. -/
structure CanonicalHull (pointOf : Label -> ℝ²) where
  boundary : Label -> ℝ²
  boundary_injective : Function.Injective boundary
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  point_eq :
    (∀ label, boundary (hullIndex label) = pointOf label) ∨
    (∀ label, boundary (card11BoundaryReflection (hullIndex label)) =
      pointOf label)

theorem hullIndex_injective : Function.Injective hullIndex := by
  intro left right h
  fin_cases left <;> fin_cases right <;> simp_all [hullIndex]

theorem CanonicalHull.point_eq_direct_or_mirror
    {pointOf : Label -> ℝ²} (H : CanonicalHull pointOf) :
    (∀ label, H.boundary (hullIndex label) = pointOf label) ∨
    (∀ label, H.boundary (card11BoundaryReflection (hullIndex label)) =
      pointOf label) :=
  H.point_eq

/-- Index zero in a nonempty ambient boundary enumeration. -/
def zeroIndex {n : Nat} (hn : 0 < n) : Fin n :=
  ⟨0, hn⟩

/-- The three strict-interior blocks in the direct zero-cut order
`U, O2, V, S, W, O1`. -/
structure DirectBoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : Nat} (boundary : Fin n -> ℝ²) (hn : 0 < n)
    (iv iw : Fin n) : Prop where
  apex_order : zeroIndex hn < iv ∧ iv < iw
  opp2_between :
    ∀ x ∈ S.oppInterior2,
      ∃ q : Fin n, zeroIndex hn < q ∧ q < iv ∧ boundary q = x
  surplus_between :
    ∀ x ∈ S.capInteriorByIndex S.surplusIdx,
      ∃ q : Fin n, iv < q ∧ q < iw ∧ boundary q = x
  opp1_after :
    ∀ x ∈ S.oppInterior1,
      ∃ q : Fin n, iw < q ∧ boundary q = x

/-- The three strict-interior blocks in the reflected zero-cut order
`U, O1, W, S, V, O2`. -/
structure MirrorBoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A)
    {n : Nat} (boundary : Fin n -> ℝ²) (hn : 0 < n)
    (iv iw : Fin n) : Prop where
  apex_order : zeroIndex hn < iw ∧ iw < iv
  opp1_between :
    ∀ x ∈ S.oppInterior1,
      ∃ q : Fin n, zeroIndex hn < q ∧ q < iw ∧ boundary q = x
  surplus_between :
    ∀ x ∈ S.capInteriorByIndex S.surplusIdx,
      ∃ q : Fin n, iw < q ∧ q < iv ∧ boundary q = x
  opp2_after :
    ∀ x ∈ S.oppInterior2,
      ∃ q : Fin n, iv < q ∧ boundary q = x

/-- A common CCW boundary for the forced card-eleven branch, with exact
strict-interior cardinalities and all three cap blocks located in the direct
or reflected zero-cut order. -/
structure BoundaryBlocks {A : Finset ℝ²} (S : SurplusCapPacket A) where
  n : Nat
  hn : 0 < n
  boundary : Fin n -> ℝ²
  opp1Index : Fin n
  opp2Index : Fin n
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  zero_eq :
    boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx
  opp1_eq :
    boundary opp1Index =
      S.oppositeVertexByIndex S.oppIndex1
  opp2_eq :
    boundary opp2Index =
      S.oppositeVertexByIndex S.oppIndex2
  carrier_card : A.card = 11
  surplusInterior_card :
    (S.capInteriorByIndex S.surplusIdx).card = 4
  oppInterior1_card : S.oppInterior1.card = 2
  oppInterior2_card : S.oppInterior2.card = 2
  orientation :
    DirectBoundaryBlocks S boundary hn opp1Index opp2Index ∨
      MirrorBoundaryBlocks S boundary hn opp1Index opp2Index

/-- The ambient boundary enumeration in a card-eleven block packet itself has
eleven indices. -/
theorem BoundaryBlocks.n_eq_eleven
    {A : Finset ℝ²} {S : SurplusCapPacket A} (B : BoundaryBlocks S) :
    B.n = 11 := by
  have hcard := congrArg Finset.card B.boundary_image
  rw [Finset.card_image_of_injective _ B.boundary_injective,
    Finset.card_univ, Fintype.card_fin, B.carrier_card] at hcard
  exact hcard

/-- The fixed cap-index frame used by the `(6,4,4)` finite code. -/
def capSelectedFrame {A : Finset ℝ²} (S : SurplusCapPacket A) :
    MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1 where
  rest := S.oppIndex2
  rest_ne_surplus := S.surplusIdx_ne_oppIndex2.symm
  rest_ne_second := S.oppIndex1_ne_oppIndex2.symm

@[simp] theorem capSelectedFrame_rest
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (capSelectedFrame S).rest = S.oppIndex2 := rfl

/-- A canonical card-eleven carrier labeling for the `(6,4,4)` branch. The
three strict cap interiors are exactly the finite-code blocks, and the carrier
lies in the direct or reflected hull order used by the classifier. -/
structure CanonicalLabeling {A : Finset ℝ²} (S : SurplusCapPacket A)
    extends Card11Labeling S.triangle (capSelectedFrame S) where
  surplusInterior_eq :
    toCard11Labeling.labelsOf
        (S.capInteriorByIndex S.surplusIdx) = intS
  oppInterior1_eq :
    toCard11Labeling.labelsOf S.oppInterior1 = intO1
  oppInterior2_eq :
    toCard11Labeling.labelsOf S.oppInterior2 = intO2
  canonicalHull : CanonicalHull toCard11Labeling.pointOf

namespace CanonicalLabeling

theorem point_zero_eq_opposite {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) :
    L.pointOf 0 = S.oppositeVertexByIndex S.surplusIdx := by
  exact L.toCard11Labeling.point_zero.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.surplusIdx)

theorem point_one_eq_opposite {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) :
    L.pointOf 1 = S.oppositeVertexByIndex S.oppIndex1 := by
  exact L.toCard11Labeling.point_one.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex1)

theorem point_two_eq_opposite {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) :
    L.pointOf 2 = S.oppositeVertexByIndex S.oppIndex2 := by
  exact L.toCard11Labeling.point_two.trans
    (Card11SelectedCube.apexAt_eq_oppositeVertexByIndex S S.oppIndex2)

end CanonicalLabeling

private def openIndices (left right : Fin 11) : Finset (Fin 11) :=
  Finset.univ.filter fun index => left < index ∧ index < right

private def afterIndices (left : Fin 11) : Finset (Fin 11) :=
  Finset.univ.filter fun index => left < index

/-- Exact block sizes force the two non-surplus apices to positions three and
eight after cutting the eleven-point boundary at the surplus apex. -/
private theorem forcedBlockEndpoints :
    ∀ left right : Fin 11,
      (0 : Fin 11) < left ∧ left < right →
      2 ≤ (openIndices 0 left).card →
      4 ≤ (openIndices left right).card →
      2 ≤ (afterIndices right).card →
      left = 3 ∧ right = 8 := by
  decide

private theorem mem_image_iff_of_injective
    {alpha beta : Type*} [DecidableEq beta]
    {f : alpha -> beta} (hf : Function.Injective f)
    {s : Finset alpha} {x : alpha} :
    f x ∈ s.image f ↔ x ∈ s := by
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨y, hy, hyx⟩
    have hxy : y = x := hf hyx
    simpa [hxy] using hy
  · intro hx
    exact Finset.mem_image.mpr ⟨x, hx, rfl⟩

private theorem hullIndex_surjective : Function.Surjective hullIndex :=
  Finite.surjective_of_injective hullIndex_injective

private theorem reflectedHullIndex_surjective :
    Function.Surjective (fun label =>
      card11BoundaryReflection (hullIndex label)) :=
  Finite.surjective_of_injective
    (card11BoundaryReflection.injective.comp hullIndex_injective)

private theorem direct_opp2_membership :
    ∀ label : Label,
      hullIndex label ∈ openIndices 0 3 ↔ label ∈ intO2 := by
  decide

private theorem direct_surplus_membership :
    ∀ label : Label,
      hullIndex label ∈ openIndices 3 8 ↔ label ∈ intS := by
  decide

private theorem direct_opp1_membership :
    ∀ label : Label,
      hullIndex label ∈ afterIndices 8 ↔ label ∈ intO1 := by
  decide

private theorem mirror_opp1_membership :
    ∀ label : Label,
      card11BoundaryReflection (hullIndex label) ∈ openIndices 0 3 ↔
        label ∈ intO1 := by
  decide

private theorem mirror_surplus_membership :
    ∀ label : Label,
      card11BoundaryReflection (hullIndex label) ∈ openIndices 3 8 ↔
        label ∈ intS := by
  decide

private theorem mirror_opp2_membership :
    ∀ label : Label,
      card11BoundaryReflection (hullIndex label) ∈ afterIndices 8 ↔
        label ∈ intO2 := by
  decide

/-- Exact boundary blocks produce the canonical finite labeling in either
orientation. -/
theorem BoundaryBlocks.nonempty_canonicalLabeling
    {A : Finset ℝ²} {S : SurplusCapPacket A} (B : BoundaryBlocks S) :
    Nonempty (CanonicalLabeling S) := by
  classical
  rcases B with
    ⟨n, hn, boundary, opp1Index, opp2Index, hboundary, hboundaryImage,
      hccw, hzero, hopp1, hopp2, hcarrierCard, hsurplusCard, hopp1Card,
      hopp2Card, horientation⟩
  have hn11 : n = 11 := by
    have hcard := congrArg Finset.card hboundaryImage
    rw [Finset.card_image_of_injective _ hboundary, Finset.card_univ,
      Fintype.card_fin, hcarrierCard] at hcard
    exact hcard
  subst n
  let frame := capSelectedFrame S
  rcases horientation with hdirect | hmirror
  · let qO2 := openIndices 0 opp1Index
    let qS := openIndices opp1Index opp2Index
    let qO1 := afterIndices opp2Index
    have hO2subset : S.oppInterior2 ⊆ qO2.image boundary := by
      intro x hx
      rcases hdirect.opp2_between x hx with ⟨q, hq0, hq1, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq0, hq1⟩, hqx⟩
    have hSsubset :
        S.capInteriorByIndex S.surplusIdx ⊆ qS.image boundary := by
      intro x hx
      rcases hdirect.surplus_between x hx with ⟨q, hq1, hq2, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq1, hq2⟩, hqx⟩
    have hO1subset : S.oppInterior1 ⊆ qO1.image boundary := by
      intro x hx
      rcases hdirect.opp1_after x hx with ⟨q, hq2, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq2⟩, hqx⟩
    have hO2le : 2 ≤ qO2.card := by
      calc
        2 = S.oppInterior2.card := hopp2Card.symm
        _ ≤ (qO2.image boundary).card := Finset.card_le_card hO2subset
        _ ≤ qO2.card := Finset.card_image_le
    have hSle : 4 ≤ qS.card := by
      calc
        4 = (S.capInteriorByIndex S.surplusIdx).card := hsurplusCard.symm
        _ ≤ (qS.image boundary).card := Finset.card_le_card hSsubset
        _ ≤ qS.card := Finset.card_image_le
    have hO1le : 2 ≤ qO1.card := by
      calc
        2 = S.oppInterior1.card := hopp1Card.symm
        _ ≤ (qO1.image boundary).card := Finset.card_le_card hO1subset
        _ ≤ qO1.card := Finset.card_image_le
    have hindices := forcedBlockEndpoints opp1Index opp2Index
      hdirect.apex_order hO2le hSle hO1le
    rcases hindices with ⟨rfl, rfl⟩
    have hO2eq :
        S.oppInterior2 = (openIndices 0 3).image boundary := by
      apply Finset.eq_of_subset_of_card_le hO2subset
      rw [Finset.card_image_of_injective _ hboundary, hopp2Card]
      decide
    have hSeq :
        S.capInteriorByIndex S.surplusIdx =
          (openIndices 3 8).image boundary := by
      apply Finset.eq_of_subset_of_card_le hSsubset
      rw [Finset.card_image_of_injective _ hboundary, hsurplusCard]
      decide
    have hO1eq :
        S.oppInterior1 = (afterIndices 8).image boundary := by
      apply Finset.eq_of_subset_of_card_le hO1subset
      rw [Finset.card_image_of_injective _ hboundary, hopp1Card]
      decide
    let pointOf : Label -> ℝ² := fun label => boundary (hullIndex label)
    have hpoint : Function.Injective pointOf :=
      hboundary.comp hullIndex_injective
    let L : Card11Labeling S.triangle frame :=
      { pointOf := pointOf
        injective := hpoint
        mem_carrier := by
          intro label
          have hmem : boundary (hullIndex label) ∈
              Finset.univ.image boundary :=
            Finset.mem_image.mpr ⟨hullIndex label, Finset.mem_univ _, rfl⟩
          simpa [pointOf, hboundaryImage] using hmem
        carrier_surjective := by
          intro x hx
          have hxImage : x ∈ Finset.univ.image boundary := by
            simpa [hboundaryImage] using hx
          rcases Finset.mem_image.mp hxImage with ⟨index, _hindex, hix⟩
          rcases hullIndex_surjective index with ⟨label, hlabel⟩
          exact ⟨label, by simpa [pointOf, hlabel] using hix⟩
        point_zero := by
          simpa [pointOf, hullIndex, zeroIndex,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hzero
        point_one := by
          simpa [pointOf, hullIndex,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hopp1
        point_two := by
          simpa [pointOf, hullIndex,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hopp2 }
    have hSlabels :
        L.labelsOf (S.capInteriorByIndex S.surplusIdx) = intS := by
      ext label
      rw [L.mem_labelsOf, hSeq]
      change boundary (hullIndex label) ∈
          (openIndices 3 8).image boundary ↔ label ∈ intS
      rw [mem_image_iff_of_injective hboundary]
      exact direct_surplus_membership label
    have hO1labels : L.labelsOf S.oppInterior1 = intO1 := by
      ext label
      rw [L.mem_labelsOf, hO1eq]
      change boundary (hullIndex label) ∈
          (afterIndices 8).image boundary ↔ label ∈ intO1
      rw [mem_image_iff_of_injective hboundary]
      exact direct_opp1_membership label
    have hO2labels : L.labelsOf S.oppInterior2 = intO2 := by
      ext label
      rw [L.mem_labelsOf, hO2eq]
      change boundary (hullIndex label) ∈
          (openIndices 0 3).image boundary ↔ label ∈ intO2
      rw [mem_image_iff_of_injective hboundary]
      exact direct_opp2_membership label
    exact ⟨{
      toCard11Labeling := L
      surplusInterior_eq := hSlabels
      oppInterior1_eq := hO1labels
      oppInterior2_eq := hO2labels
      canonicalHull := {
        boundary := boundary
        boundary_injective := hboundary
        boundary_ccw := hccw
        point_eq := Or.inl (fun _ => rfl) } }⟩
  · let qO1 := openIndices 0 opp2Index
    let qS := openIndices opp2Index opp1Index
    let qO2 := afterIndices opp1Index
    have hO1subset : S.oppInterior1 ⊆ qO1.image boundary := by
      intro x hx
      rcases hmirror.opp1_between x hx with ⟨q, hq0, hq2, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq0, hq2⟩, hqx⟩
    have hSsubset :
        S.capInteriorByIndex S.surplusIdx ⊆ qS.image boundary := by
      intro x hx
      rcases hmirror.surplus_between x hx with ⟨q, hq2, hq1, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq2, hq1⟩, hqx⟩
    have hO2subset : S.oppInterior2 ⊆ qO2.image boundary := by
      intro x hx
      rcases hmirror.opp2_after x hx with ⟨q, hq1, hqx⟩
      exact Finset.mem_image.mpr
        ⟨q, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq1⟩, hqx⟩
    have hO1le : 2 ≤ qO1.card := by
      calc
        2 = S.oppInterior1.card := hopp1Card.symm
        _ ≤ (qO1.image boundary).card := Finset.card_le_card hO1subset
        _ ≤ qO1.card := Finset.card_image_le
    have hSle : 4 ≤ qS.card := by
      calc
        4 = (S.capInteriorByIndex S.surplusIdx).card := hsurplusCard.symm
        _ ≤ (qS.image boundary).card := Finset.card_le_card hSsubset
        _ ≤ qS.card := Finset.card_image_le
    have hO2le : 2 ≤ qO2.card := by
      calc
        2 = S.oppInterior2.card := hopp2Card.symm
        _ ≤ (qO2.image boundary).card := Finset.card_le_card hO2subset
        _ ≤ qO2.card := Finset.card_image_le
    have hindices := forcedBlockEndpoints opp2Index opp1Index
      hmirror.apex_order hO1le hSle hO2le
    rcases hindices with ⟨rfl, rfl⟩
    have hO1eq :
        S.oppInterior1 = (openIndices 0 3).image boundary := by
      apply Finset.eq_of_subset_of_card_le hO1subset
      rw [Finset.card_image_of_injective _ hboundary, hopp1Card]
      decide
    have hSeq :
        S.capInteriorByIndex S.surplusIdx =
          (openIndices 3 8).image boundary := by
      apply Finset.eq_of_subset_of_card_le hSsubset
      rw [Finset.card_image_of_injective _ hboundary, hsurplusCard]
      decide
    have hO2eq :
        S.oppInterior2 = (afterIndices 8).image boundary := by
      apply Finset.eq_of_subset_of_card_le hO2subset
      rw [Finset.card_image_of_injective _ hboundary, hopp2Card]
      decide
    let pointOf : Label -> ℝ² := fun label =>
      boundary (card11BoundaryReflection (hullIndex label))
    have hpoint : Function.Injective pointOf :=
      hboundary.comp
        (card11BoundaryReflection.injective.comp hullIndex_injective)
    let L : Card11Labeling S.triangle frame :=
      { pointOf := pointOf
        injective := hpoint
        mem_carrier := by
          intro label
          have hmem :
              boundary (card11BoundaryReflection (hullIndex label)) ∈
                Finset.univ.image boundary :=
            Finset.mem_image.mpr
              ⟨card11BoundaryReflection (hullIndex label),
                Finset.mem_univ _, rfl⟩
          simpa [pointOf, hboundaryImage] using hmem
        carrier_surjective := by
          intro x hx
          have hxImage : x ∈ Finset.univ.image boundary := by
            simpa [hboundaryImage] using hx
          rcases Finset.mem_image.mp hxImage with ⟨index, _hindex, hix⟩
          rcases reflectedHullIndex_surjective index with ⟨label, hlabel⟩
          exact ⟨label, by simpa [pointOf, hlabel] using hix⟩
        point_zero := by
          simpa [pointOf, hullIndex, card11BoundaryReflection, zeroIndex,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hzero
        point_one := by
          simpa [pointOf, hullIndex, card11BoundaryReflection,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hopp1
        point_two := by
          simpa [pointOf, hullIndex, card11BoundaryReflection,
            Card11SelectedCube.apexAt_eq_oppositeVertexByIndex] using hopp2 }
    have hSlabels :
        L.labelsOf (S.capInteriorByIndex S.surplusIdx) = intS := by
      ext label
      rw [L.mem_labelsOf, hSeq]
      change boundary (card11BoundaryReflection (hullIndex label)) ∈
          (openIndices 3 8).image boundary ↔ label ∈ intS
      rw [mem_image_iff_of_injective hboundary]
      exact mirror_surplus_membership label
    have hO1labels : L.labelsOf S.oppInterior1 = intO1 := by
      ext label
      rw [L.mem_labelsOf, hO1eq]
      change boundary (card11BoundaryReflection (hullIndex label)) ∈
          (openIndices 0 3).image boundary ↔ label ∈ intO1
      rw [mem_image_iff_of_injective hboundary]
      exact mirror_opp1_membership label
    have hO2labels : L.labelsOf S.oppInterior2 = intO2 := by
      ext label
      rw [L.mem_labelsOf, hO2eq]
      change boundary (card11BoundaryReflection (hullIndex label)) ∈
          (afterIndices 8).image boundary ↔ label ∈ intO2
      rw [mem_image_iff_of_injective hboundary]
      exact mirror_opp2_membership label
    exact ⟨{
      toCard11Labeling := L
      surplusInterior_eq := hSlabels
      oppInterior1_eq := hO1labels
      oppInterior2_eq := hO2labels
      canonicalHull := {
        boundary := boundary
        boundary_injective := hboundary
        boundary_ccw := hccw
        point_eq := Or.inr (fun _ => rfl) } }⟩

private theorem capInteriorByIndex_card_eq_four_of_cap_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 6) :
    (S.capInteriorByIndex i).card = 4 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 :
        S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 :
        S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 :
        S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

/-- The `(6,4,4)` equality case has a common zero-cut boundary whose strict
interiors form exact blocks of sizes `(4,2,2)` in one of the two canonical
orientations. -/
theorem exists_boundaryBlocks_of_isM44_surplus_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    Nonempty (BoundaryBlocks S) := by
  classical
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      hne hconv hK4 with
    ⟨n, hn, boundary, iv, iw, hboundary, hboundaryImage, hccw,
      hu, hv, hw, horder⟩
  have hu' :
      boundary (zeroIndex hn) =
        S.oppositeVertexByIndex S.surplusIdx := by
    simpa [zeroIndex] using hu
  have hsurplusCapByIndex :
      (S.capByIndex S.surplusIdx).card = 6 := by
    rcases hi : S.surplusIdx with ⟨idx, hidx⟩
    interval_cases idx <;>
      simpa [SurplusCapPacket.surplusCap,
        SurplusCapPacket.capByIndex, hi] using hsurplusCard
  have hsurplusInteriorCard :
      (S.capInteriorByIndex S.surplusIdx).card = 4 :=
    capInteriorByIndex_card_eq_four_of_cap_card_eq_six
      S S.surplusIdx hsurplusCapByIndex
  have hoppInterior1Card : S.oppInterior1.card = 2 := by
    simpa [SurplusCapPacket.oppInterior1] using
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex1
        hM44.oppIndex1_cap_card_eq_four
  have hoppInterior2Card : S.oppInterior2.card = 2 := by
    simpa [SurplusCapPacket.oppInterior2] using
      S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four S.oppIndex2
        hM44.oppIndex2_cap_card_eq_four
  have hcarrierCard : A.card = 11 := by
    have hsum := hM44.surplus_card_eq
    omega
  have huSurplusV1 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.surplusIdx).v1 :=
    hu'.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.surplusIdx).symm
  have hvSurplusV2 :
      boundary iv = (S.triangleByIndex S.surplusIdx).v2 :=
    hv.trans
      S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hwSurplusV3 :
      boundary iw = (S.triangleByIndex S.surplusIdx).v3 :=
    hw.trans
      S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hvOpp1V1 :
      boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hv.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hwOpp1V2 :
      boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hw.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have huOpp1V3 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex1).v3 :=
    hu'.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hwOpp2V1 :
      boundary iw = (S.triangleByIndex S.oppIndex2).v1 :=
    hw.trans
      (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
  have huOpp2V2 :
      boundary (zeroIndex hn) =
        (S.triangleByIndex S.oppIndex2).v2 :=
    hu'.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hvOpp2V3 :
      boundary iv = (S.triangleByIndex S.oppIndex2).v3 :=
    hv.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have horientation :
      DirectBoundaryBlocks S boundary hn iv iw ∨
        MirrorBoundaryBlocks S boundary hn iv iw := by
    rcases horder with hdirect | hmirror
    · left
      refine
        { apex_order := hdirect
          opp2_between := ?_
          surplus_between := ?_
          opp1_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.oppIndex2 hccw hboundary hboundaryImage hdirect.1
          (Or.inr hdirect.2) hwOpp2V1 huOpp2V2 hvOpp2V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hdirect.2
          (Or.inl hdirect.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        rcases S.capInteriorByIndex_open_reverse_complement_interval_of_global_indices
            S.oppIndex1 hccw hboundary hboundaryImage hdirect.1
            hdirect.2 hvOpp1V1 hwOpp1V2 huOpp1V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
    · right
      refine
        { apex_order := hmirror
          opp1_between := ?_
          surplus_between := ?_
          opp2_after := ?_ }
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex1 at hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.oppIndex1 hccw hboundary hboundaryImage hmirror.1
          (Or.inr hmirror.2) hvOpp1V1 hwOpp1V2 huOpp1V3 hx
      · intro x hx
        exact S.capInteriorByIndex_open_reverse_interval_of_global_indices
          S.surplusIdx hccw hboundary hboundaryImage hmirror.2
          (Or.inl hmirror.1) huSurplusV1 hvSurplusV2 hwSurplusV3 hx
      · intro x hx
        change x ∈ S.capInteriorByIndex S.oppIndex2 at hx
        rcases S.capInteriorByIndex_open_complement_interval_of_global_indices
            S.oppIndex2 hccw hboundary hboundaryImage hmirror.1
            hmirror.2 hwOpp2V1 huOpp2V2 hvOpp2V3 hx with
          ⟨q, hq | hq, hqx⟩
        · have hnot : ¬ q < zeroIndex hn := by
            apply not_lt_of_ge
            change 0 ≤ q.val
            omega
          exact (hnot hq).elim
        · exact ⟨q, hq, hqx⟩
  exact
    ⟨{
      n := n
      hn := hn
      boundary := boundary
      opp1Index := iv
      opp2Index := iw
      boundary_injective := hboundary
      boundary_image := hboundaryImage
      boundary_ccw := hccw
      zero_eq := hu'
      opp1_eq := hv
      opp2_eq := hw
      carrier_card := hcarrierCard
      surplusInterior_card := hsurplusInteriorCard
      oppInterior1_card := hoppInterior1Card
      oppInterior2_card := hoppInterior2Card
      orientation := horientation }⟩

/-- The live `(6,4,4)` hypotheses produce the canonical finite labeling and
its direct-or-reflected hull witness in one step. -/
theorem exists_canonicalLabeling_of_isM44_surplus_card_eq_six
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) (hM44 : S.IsM44)
    (hsurplusCard : S.surplusCap.card = 6) :
    Nonempty (CanonicalLabeling S) := by
  rcases exists_boundaryBlocks_of_isM44_surplus_card_eq_six
      S hne hconv hK4 hM44 hsurplusCard with ⟨B⟩
  exact B.nonempty_canonicalLabeling

end CapSelectedGeometry
end Census554
end Problem97
