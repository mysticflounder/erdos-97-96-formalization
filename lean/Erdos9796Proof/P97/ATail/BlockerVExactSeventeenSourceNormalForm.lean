/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Exact-seventeen BlockerV source normal form

This file defines the finite source model used by the exact-seventeen cap-nine
Lean-to-SAT route and proves source-side constructors for its realizations.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceNormalForm

/-- Canonical labels for the exact-seventeen source model. -/
abbrev Label := Fin 17

/-- The two source-forced orders of the seven named strict-cap points. -/
abbrev NamedOrder := Fin 2

/-- The eight labels outside the distinguished nine-point cap. -/
def outsideLabels : Finset Label := {1, 3, 4, 5, 13, 14, 15, 16}

/-- The five labels in the selected physical class. -/
def physicalLabels : Finset Label := {6, 7, 8, 9, 10}

/-- The labels in the distinguished nine-point cap. -/
def secondCapLabels : Finset Label := {0, 2, 6, 7, 8, 9, 10, 11, 12}

/-- Centers of the four old exact rows, in the source order used by the
exact-cover split. -/
def oldCenter (row : Fin 4) : Label :=
  match row.1 with
  | 0 => 8
  | 1 => 9
  | 2 => 10
  | _ => 11

/-- First certified cap hit of each old row. -/
def oldFixedHit₁ (row : Fin 4) : Label :=
  match row.1 with
  | 0 => 6
  | 1 => 6
  | 2 => 8
  | _ => 8

/-- Second certified cap hit of each old row. -/
def oldFixedHit₂ (row : Fin 4) : Label :=
  match row.1 with
  | 0 => 9
  | 1 => 7
  | 2 => 9
  | _ => 10

/-- Position of a canonical label in either source-forced cyclic order.

The first nine positions are the cap block.  Labels `15` and `16` name the
first two boundary points after that block; the remaining six outside labels
are deliberately anonymous.  This removes the old Python-only choice of two
positions among eight and leaves only the two genuine named-cap orders. -/
def position (order : NamedOrder) (point : Label) : Label :=
  if order = 0 then
    match point.1 with
    | 0 => 0
    | 1 => 14
    | 2 => 8
    | 3 => 11
    | 4 => 12
    | 5 => 13
    | 6 => 1
    | 7 => 7
    | 8 => 2
    | 9 => 5
    | 10 => 4
    | 11 => 3
    | 12 => 6
    | 13 => 15
    | 14 => 16
    | 15 => 9
    | _ => 10
  else
    match point.1 with
    | 0 => 0
    | 1 => 14
    | 2 => 8
    | 3 => 11
    | 4 => 12
    | 5 => 13
    | 6 => 1
    | 7 => 7
    | 8 => 2
    | 9 => 6
    | 10 => 4
    | 11 => 3
    | 12 => 5
    | 13 => 15
    | 14 => 16
    | 15 => 9
    | _ => 10

/-- Canonical label occupying a given boundary position.  This executable
inverse table is used by the checked theorem-bank clause generator. -/
def labelAtPosition (order : NamedOrder) (index : Label) : Label :=
  if order = 0 then
    match index.1 with
    | 0 => 0 | 1 => 6 | 2 => 8 | 3 => 11 | 4 => 10 | 5 => 9
    | 6 => 12 | 7 => 7 | 8 => 2 | 9 => 15 | 10 => 16 | 11 => 3
    | 12 => 4 | 13 => 5 | 14 => 1 | 15 => 13 | _ => 14
  else
    match index.1 with
    | 0 => 0 | 1 => 6 | 2 => 8 | 3 => 11 | 4 => 10 | 5 => 12
    | 6 => 9 | 7 => 7 | 8 => 2 | 9 => 15 | 10 => 16 | 11 => 3
    | 12 => 4 | 13 => 5 | 14 => 1 | 15 => 13 | _ => 14

@[simp] theorem position_labelAtPosition (order : NamedOrder) (index : Label) :
    position order (labelAtPosition order index) = index := by
  fin_cases order <;> fin_cases index <;> decide

@[simp] theorem labelAtPosition_position (order : NamedOrder) (point : Label) :
    labelAtPosition order (position order point) = point := by
  fin_cases order <;> fin_cases point <;> decide

/-- The two orientations in which the canonical order can sit in a fixed CCW
boundary enumeration. -/
inductive Orientation where
  | forward
  | reverse
deriving DecidableEq

/-- Strict comparison of boundary indices in the selected orientation. -/
def OrientedLt {n : ℕ} (orientation : Orientation)
    (labelIndex : Label → Fin n) (point₁ point₂ : Label) : Prop :=
  match orientation with
  | .forward => labelIndex point₁ < labelIndex point₂
  | .reverse => labelIndex point₂ < labelIndex point₁

/-- The canonical labels respect one of the two named orders in a boundary
enumeration. -/
def PositionEmbedding {n : ℕ} (orientation : Orientation)
    (order : NamedOrder) (labelIndex : Label → Fin n) : Prop :=
  ∀ point₁ point₂,
    position order point₁ < position order point₂ →
      OrientedLt orientation labelIndex point₁ point₂

/-- Exact boundary index assigned to a canonical label.  Retaining this
formula, rather than only its order-theoretic consequence, is what lets the
checked CNF instantiate theorem-bank clauses in cyclic windows crossing index
zero. -/
def expectedLabelIndex (orientation : Orientation) (order : NamedOrder) :
    Label → Fin 17 :=
  match orientation with
  | .forward => position order
  | .reverse => fun point => Fin.rev (position order point)

/-- Each canonical position table is a permutation. -/
theorem position_injective (order : NamedOrder) :
    Function.Injective (position order) := by
  fin_cases order <;> decide

/-- A position-respecting label map is injective. -/
theorem labelIndex_injective_of_positionEmbedding {n : ℕ}
    (orientation : Orientation) (order : NamedOrder)
    (labelIndex : Label → Fin n)
    (hposition : PositionEmbedding orientation order labelIndex) :
    Function.Injective labelIndex := by
  intro point₁ point₂ heq
  by_contra hne
  have hposne : position order point₁ ≠ position order point₂ := by
    intro h
    exact hne (position_injective order h)
  rcases lt_or_gt_of_ne hposne with hlt | hgt
  · cases orientation with
    | forward => exact (ne_of_lt (hposition point₁ point₂ hlt)) heq
    | reverse => exact (ne_of_gt (hposition point₁ point₂ hlt)) heq
  · cases orientation with
    | forward => exact (ne_of_gt (hposition point₂ point₁ hgt)) heq
    | reverse => exact (ne_of_lt (hposition point₂ point₁ hgt)) heq

/-- Finite semantic surface that the checked exact-seventeen CNF must encode.
It intentionally contains only Boolean row facts; metric forbidden-pattern
clauses are added separately, each through a named Lean consumer. -/
structure SourceModel where
  order : NamedOrder
  selected : Label → Finset Label
  nextCenter : Label
  row_card : ∀ center, (selected center).card = 4
  center_not_mem : ∀ center, center ∉ selected center
  cover : ∀ source, ∃ center, source ∈ selected center
  pair_inter_le_two : ∀ center₁ center₂,
    center₁ ≠ center₂ → (selected center₁ ∩ selected center₂).card ≤ 2
  old_cap_slice : ∀ row,
    selected (oldCenter row) ∩ secondCapLabels =
      {oldFixedHit₁ row, oldFixedHit₂ row}
  old_outside_multiplicity_one : ∀ point, point ∈ outsideLabels →
    (Finset.univ.filter fun row : Fin 4 =>
      point ∈ selected (oldCenter row)).card = 1
  nextCenter_not_old : nextCenter ∉
    ({oldCenter 0, oldCenter 1, oldCenter 2, oldCenter 3} : Finset Label)
  next_source_mem : 11 ∈ selected nextCenter
  next_physical_hits : (selected nextCenter ∩ physicalLabels).card ≤ 1

/-- The thirteen labels that can serve as the next center after excluding the
four old row centers. -/
def legalNextCenterLabels : List Label :=
  [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16]

/-- Membership in the explicit next-center table is exactly nonmembership in
the four old row centers. -/
theorem legalNextCenterLabels_spec :
    ∀ center : Label,
      center ∈ legalNextCenterLabels ↔
        center ∉ ({oldCenter 0, oldCenter 1, oldCenter 2, oldCenter 3} : Finset Label) := by
  decide

/-- Every source model belongs to one of the thirteen next-center cells. -/
theorem SourceModel.nextCenter_mem_legalNextCenterLabels (model : SourceModel) :
    model.nextCenter ∈ legalNextCenterLabels :=
  (legalNextCenterLabels_spec model.nextCenter).2 model.nextCenter_not_old

/-- The explicit next-center table has exactly thirteen entries. -/
theorem legalNextCenterLabels_length : legalNextCenterLabels.length = 13 := by
  decide

/-- The explicit next-center table has no duplicate label. -/
theorem legalNextCenterLabels_nodup : legalNextCenterLabels.Nodup := by
  decide

/-- The three named finite regions are pairwise as intended and cover all
seventeen labels.  This is a regression theorem for the checked encoder's
literal tables. -/
theorem label_regions_regression :
    outsideLabels ∩ secondCapLabels = ∅ ∧
      outsideLabels ∪ secondCapLabels = Finset.univ ∧
      physicalLabels ⊆ secondCapLabels := by
  native_decide

/-- Pull a geometric support back to the canonical seventeen labels. -/
def pullback {α : Type*} [DecidableEq α]
    (point : Label → α) (support : Finset α) : Finset Label :=
  Finset.univ.filter fun label => point label ∈ support

/-- Every labeled boundary point belongs to the carrier enumerated by the
boundary map. -/
theorem boundaryLabel_mem {A : Finset ℝ²} (boundary : Fin 17 → ℝ²)
    (himage : Finset.univ.image boundary = A) (labelIndex : Label → Fin 17)
    (label : Label) : boundary (labelIndex label) ∈ A := by
  rw [← himage]
  exact Finset.mem_image.mpr ⟨labelIndex label, by simp, rfl⟩

/-- Pull back the global selected carrier row at each labeled center. -/
noncomputable def selectedOfPattern {A : Finset ℝ²}
    (pattern : FaithfulCarrierPattern A) (boundary : Fin 17 → ℝ²)
    (himage : Finset.univ.image boundary = A) (labelIndex : Label → Fin 17)
    (center : Label) : Finset Label :=
  pullback (fun label => boundary (labelIndex label))
    (pattern.classAt (boundary (labelIndex center))
      (boundaryLabel_mem boundary himage labelIndex center)).support

/-- A source-authenticated realization of the finite model.  Besides the
Boolean row table, it records that the labels enumerate the entire carrier in
one of the two source-forced cyclic orders and that every finite row is the
pullback of a genuine selected carrier circle. -/
structure SourceRealization (A : Finset ℝ²) where
  pattern : FaithfulCarrierPattern A
  carrier_convexIndep : ConvexIndep A
  model : SourceModel
  orientation : Orientation
  boundary : Fin 17 → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  labelIndex : Label → Fin 17
  labelIndex_eq : labelIndex = expectedLabelIndex orientation model.order
  position_embedding :
    PositionEmbedding orientation model.order labelIndex
  row_eq : ∀ center,
    model.selected center =
      selectedOfPattern pattern boundary boundary_image labelIndex center

namespace SourceRealization

/-- The boundary carried by a source realization certifies the exact carrier
cardinality without appealing to a separate cardinality hypothesis. -/
theorem card_eq {A : Finset ℝ²} (r : SourceRealization A) : A.card = 17 := by
  have h := congrArg Finset.card r.boundary_image
  rw [Finset.card_image_of_injective _ r.boundary_injective,
    Finset.card_univ, Fintype.card_fin] at h
  exact h.symm

/-- Reindex the canonical `Fin 17` boundary by the cardinality type required
by the general cyclic-order consumers. -/
def cardBoundary {A : Finset ℝ²} (r : SourceRealization A) :
    Fin A.card → ℝ² :=
  fun i => r.boundary (Fin.cast r.card_eq i)

/-- Embed a canonical exact-seventeen index into the carrier-cardinality
boundary type. -/
def toCardIndex {A : Finset ℝ²} (r : SourceRealization A)
    (i : Fin 17) : Fin A.card :=
  Fin.cast r.card_eq.symm i

@[simp] theorem cardBoundary_toCardIndex {A : Finset ℝ²}
    (r : SourceRealization A) (i : Fin 17) :
    r.cardBoundary (r.toCardIndex i) = r.boundary i := rfl

theorem toCardIndex_lt {A : Finset ℝ²} (r : SourceRealization A)
    {i j : Fin 17} (h : i < j) : r.toCardIndex i < r.toCardIndex j := by
  simpa only [toCardIndex, Fin.lt_def, Fin.val_cast] using h

@[simp] theorem toCardIndex_add {A : Finset ℝ²} (r : SourceRealization A)
    (i j : Fin 17) :
    r.toCardIndex (i + j) = r.toCardIndex i + r.toCardIndex j := by
  apply Fin.ext
  simp [toCardIndex, Fin.add_def, r.card_eq]

theorem cardBoundary_injective {A : Finset ℝ²} (r : SourceRealization A) :
    Function.Injective r.cardBoundary := by
  intro i j hij
  apply Fin.cast_injective r.card_eq
  exact r.boundary_injective hij

theorem cardBoundary_image {A : Finset ℝ²} (r : SourceRealization A) :
    Finset.univ.image r.cardBoundary = A := by
  calc
    Finset.univ.image r.cardBoundary = Finset.univ.image r.boundary := by
      apply Finset.Subset.antisymm
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast r.card_eq i, Finset.mem_univ _, rfl⟩
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast r.card_eq.symm i, Finset.mem_univ _, by
            simp [cardBoundary]⟩
    _ = A := r.boundary_image

theorem cardBoundary_ccw {A : Finset ℝ²} (r : SourceRealization A) :
    EuclideanGeometry.IsCcwConvexPolygon r.cardBoundary := by
  intro i j k hij hjk
  apply r.boundary_ccw
  · simpa using hij
  · simpa using hjk

/-- Genuine selected carrier row represented by a finite source center. -/
noncomputable def selectedRow {A : Finset ℝ²} (r : SourceRealization A)
    (center : Label) :
    SelectedFourClass A (r.boundary (r.labelIndex center)) :=
  r.pattern.classAt (r.boundary (r.labelIndex center))
    (boundaryLabel_mem r.boundary r.boundary_image r.labelIndex center)

/-- Every positive hit atom in the finite source model transports to genuine
membership in the corresponding selected carrier row. -/
theorem mem_selectedRow_of_mem_model {A : Finset ℝ²}
    (r : SourceRealization A) {center point : Label}
    (h : point ∈ r.model.selected center) :
    r.boundary (r.labelIndex point) ∈ (r.selectedRow center).support := by
  rw [r.row_eq center] at h
  simpa [selectedOfPattern, selectedRow, pullback] using h

end SourceRealization

@[simp] theorem mem_pullback {α : Type*} [DecidableEq α]
    (point : Label → α) (support : Finset α) (label : Label) :
    label ∈ pullback point support ↔ point label ∈ support := by
  simp [pullback]

/-- Pullback commutes with intersection. -/
theorem pullback_inter {α : Type*} [DecidableEq α]
    (point : Label → α) (support₁ support₂ : Finset α) :
    pullback point (support₁ ∩ support₂) =
      pullback point support₁ ∩ pullback point support₂ := by
  ext label
  simp

/-- An injective labeling pulls a two-point support back to the corresponding
two labels. -/
theorem pullback_pair {α : Type*} [DecidableEq α]
    (point : Label → α) (hinjective : Function.Injective point)
    (a b : Label) :
    pullback point {point a, point b} = {a, b} := by
  ext label
  simp only [mem_pullback, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · intro h
    rcases h with h | h
    · exact Or.inl (hinjective h)
    · exact Or.inr (hinjective h)
  · intro h
    rcases h with rfl | rfl
    · exact Or.inl rfl
    · exact Or.inr rfl

/-- A bijective labeling recovers every supported carrier point. -/
theorem image_pullback_eq {α : Type*} [DecidableEq α]
    (point : Label → α) (carrier support : Finset α)
    (himage : Finset.univ.image point = carrier)
    (hsubset : support ⊆ carrier) :
    (pullback point support).image point = support := by
  ext x
  constructor
  · simp only [Finset.mem_image, mem_pullback]
    rintro ⟨label, hlabel, rfl⟩
    exact hlabel
  · intro hx
    have hxCarrier : x ∈ carrier := hsubset hx
    rw [← himage] at hxCarrier
    rcases Finset.mem_image.mp hxCarrier with ⟨label, -, rfl⟩
    exact Finset.mem_image.mpr ⟨label, mem_pullback point support label |>.2 hx, rfl⟩

/-- Pullback preserves cardinality for supports inside a bijectively labeled
carrier. -/
theorem card_pullback_eq {α : Type*} [DecidableEq α]
    (point : Label → α) (carrier support : Finset α)
    (hinjective : Function.Injective point)
    (himage : Finset.univ.image point = carrier)
    (hsubset : support ⊆ carrier) :
    (pullback point support).card = support.card := by
  calc
    (pullback point support).card =
        ((pullback point support).image point).card :=
      (Finset.card_image_iff.mpr hinjective.injOn).symm
    _ = support.card := congrArg Finset.card
      (image_pullback_eq point carrier support himage hsubset)

/-- Two distinct certified members exhaust a finite set whose cardinality is at
most two.  This is the finite-set adapter used to turn the geometric cap-hit
bound into the exact two-label slices consumed by the source model. -/
theorem eq_pair_of_card_le_two {α : Type*} [DecidableEq α]
    (support : Finset α) (a b : α)
    (hcard : support.card ≤ 2)
    (ha : a ∈ support) (hb : b ∈ support) (hab : a ≠ b) :
    support = {a, b} := by
  have hpair : {a, b} ⊆ support := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact ha
    · exact hb
  have heq : {a, b} = support :=
    Finset.eq_of_subset_of_card_le hpair (by simpa [hab] using hcard)
  apply Finset.Subset.antisymm
  · intro x hx
    rw [heq]
    exact hx
  · exact hpair

/-- Generic source-to-finite bridge.  Once the branch-specific labeling has
identified the four old cap slices and the actual next blocker center, the
global K4 pattern and critical-shell minimality supply every remaining
Boolean clause of `SourceModel`. -/
theorem exists_sourceRealization_of_faithfulPattern
    {A : Finset ℝ²} (H : CriticalShellSystem A) (hconv : ConvexIndep A)
    (pattern : FaithfulCarrierPattern A) (order : NamedOrder)
    (orientation : Orientation) (boundary : Fin 17 → ℝ²)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (labelIndex : Label → Fin 17)
    (hlabelIndex : labelIndex = expectedLabelIndex orientation order)
    (hposition : PositionEmbedding orientation order labelIndex)
    (nextCenter : Label)
    (hnextCenter :
      boundary (labelIndex nextCenter) =
        H.centerAt (boundary (labelIndex 11))
          (boundaryLabel_mem boundary hboundaryImage labelIndex 11))
    (holdCap : ∀ row,
      selectedOfPattern pattern boundary hboundaryImage labelIndex
          (oldCenter row) ∩ secondCapLabels =
        {oldFixedHit₁ row, oldFixedHit₂ row})
    (holdMultiplicity : ∀ point, point ∈ outsideLabels →
      (Finset.univ.filter fun row : Fin 4 =>
        point ∈ selectedOfPattern pattern boundary hboundaryImage labelIndex
          (oldCenter row)).card = 1)
    (hnextPhysical :
      (selectedOfPattern pattern boundary hboundaryImage labelIndex nextCenter ∩
        physicalLabels).card ≤ 1) :
    Nonempty (SourceRealization A) := by
  classical
  let point : Label → ℝ² := fun label => boundary (labelIndex label)
  have hlabelInjective : Function.Injective labelIndex :=
    labelIndex_injective_of_positionEmbedding orientation order labelIndex hposition
  have hlabelSurjective : Function.Surjective labelIndex :=
    Finite.injective_iff_surjective.mp hlabelInjective
  have hpointInjective : Function.Injective point :=
    hboundaryInjective.comp hlabelInjective
  have hpointImage : Finset.univ.image point = A := by
    ext x
    constructor
    · rintro hx
      rcases Finset.mem_image.mp hx with ⟨label, -, rfl⟩
      exact boundaryLabel_mem boundary hboundaryImage labelIndex label
    · intro hx
      rw [← hboundaryImage] at hx
      rcases Finset.mem_image.mp hx with ⟨index, -, rfl⟩
      obtain ⟨label, hlabel⟩ := hlabelSurjective index
      exact Finset.mem_image.mpr ⟨label, by simp, by simp [point, hlabel]⟩
  let selected : Label → Finset Label :=
    selectedOfPattern pattern boundary hboundaryImage labelIndex
  have hrowCard : ∀ center, (selected center).card = 4 := by
    intro center
    dsimp only [selected, selectedOfPattern]
    exact (card_pullback_eq point A
      (pattern.classAt (point center)
        (boundaryLabel_mem boundary hboundaryImage labelIndex center)).support
      hpointInjective hpointImage
      (pattern.classAt (point center)
        (boundaryLabel_mem boundary hboundaryImage labelIndex center)).support_subset_A).trans
      (pattern.classAt (point center)
        (boundaryLabel_mem boundary hboundaryImage labelIndex center)).support_card
  have hcenterNotMem : ∀ center, center ∉ selected center := by
    intro center hmem
    have hgeom : point center ∈
        (pattern.classAt (point center)
          (boundaryLabel_mem boundary hboundaryImage labelIndex center)).support := by
      simpa only [selected, selectedOfPattern, mem_pullback] using hmem
    exact (pattern.classAt (point center)
      (boundaryLabel_mem boundary hboundaryImage labelIndex center)).center_not_mem hgeom
  have hcover : ∀ source, ∃ center, source ∈ selected center := by
    intro source
    have hsourceA : point source ∈ A :=
      boundaryLabel_mem boundary hboundaryImage labelIndex source
    have hcenterA : H.centerAt (point source) hsourceA ∈ A :=
      (Finset.mem_erase.mp
        (H.selectedAt (point source) hsourceA).toCriticalFourShell.center_mem).2
    have hcenterInImage :
        H.centerAt (point source) hsourceA ∈ Finset.univ.image point := by
      rw [hpointImage]
      exact hcenterA
    rcases Finset.mem_image.mp hcenterInImage with ⟨center, -, hcenter⟩
    refine ⟨center, ?_⟩
    let Kactual := pattern.classAt (H.centerAt (point source) hsourceA) hcenterA
    let Klabel := pattern.classAt (point center)
      (boundaryLabel_mem boundary hboundaryImage labelIndex center)
    have hsourceRow : point source ∈ Kactual.support :=
      H.source_mem_selectedFourClass (point source) hsourceA Kactual
    have hsupport : Kactual.support = Klabel.support :=
      pattern.classAt_support_congr hcenterA
        (boundaryLabel_mem boundary hboundaryImage labelIndex center) hcenter.symm
    rw [hsupport] at hsourceRow
    simpa only [selected, selectedOfPattern, mem_pullback, Klabel] using hsourceRow
  have hinter : ∀ center₁ center₂,
      center₁ ≠ center₂ → (selected center₁ ∩ selected center₂).card ≤ 2 := by
    intro center₁ center₂ hne
    let K₁ := pattern.classAt (point center₁)
      (boundaryLabel_mem boundary hboundaryImage labelIndex center₁)
    let K₂ := pattern.classAt (point center₂)
      (boundaryLabel_mem boundary hboundaryImage labelIndex center₂)
    have hcenters : point center₁ ≠ point center₂ := fun h => hne (hpointInjective h)
    have hgeom : (K₁.support ∩ K₂.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two K₁ K₂ hcenters
    have hpull :
        (pullback point K₁.support ∩ pullback point K₂.support).card =
          (K₁.support ∩ K₂.support).card := by
      rw [← pullback_inter]
      exact card_pullback_eq point A (K₁.support ∩ K₂.support)
        hpointInjective hpointImage (by
          intro x hx
          exact K₁.support_subset_A (Finset.mem_inter.mp hx).1)
    simpa only [selected, selectedOfPattern, K₁, K₂] using hpull.le.trans hgeom
  have hnextSource : 11 ∈ selected nextCenter := by
    have hsourceA : point 11 ∈ A :=
      boundaryLabel_mem boundary hboundaryImage labelIndex 11
    have hnextActualA : H.centerAt (point 11) hsourceA ∈ A := by
      rw [← hnextCenter]
      exact boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter
    let Kactual := pattern.classAt (H.centerAt (point 11) hsourceA) hnextActualA
    let Klabel := pattern.classAt (point nextCenter)
      (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)
    have hmem : point 11 ∈ Kactual.support :=
      H.source_mem_selectedFourClass (point 11) hsourceA Kactual
    have hsupport : Kactual.support = Klabel.support :=
      pattern.classAt_support_congr hnextActualA
        (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)
        hnextCenter.symm
    rw [hsupport] at hmem
    simpa only [selected, selectedOfPattern, mem_pullback, Klabel] using hmem
  have hnextNotOld : nextCenter ∉
      ({oldCenter 0, oldCenter 1, oldCenter 2, oldCenter 3} : Finset Label) := by
    intro hnextOld
    simp only [Finset.mem_insert, Finset.mem_singleton] at hnextOld
    rcases hnextOld with hnextOld | hnextOld | hnextOld | hnextOld
    · have hmem : 11 ∈ selected (oldCenter 0) ∩ secondCapLabels :=
        Finset.mem_inter.mpr ⟨by simpa only [hnextOld] using hnextSource, by decide⟩
      rw [holdCap 0] at hmem
      norm_num [oldFixedHit₁, oldFixedHit₂] at hmem
      simp at hmem
    · have hmem : 11 ∈ selected (oldCenter 1) ∩ secondCapLabels :=
        Finset.mem_inter.mpr ⟨by simpa only [hnextOld] using hnextSource, by decide⟩
      rw [holdCap 1] at hmem
      norm_num [oldFixedHit₁, oldFixedHit₂] at hmem
      simp at hmem
    · have hmem : 11 ∈ selected (oldCenter 2) ∩ secondCapLabels :=
        Finset.mem_inter.mpr ⟨by simpa only [hnextOld] using hnextSource, by decide⟩
      rw [holdCap 2] at hmem
      norm_num [oldFixedHit₁, oldFixedHit₂] at hmem
      simp at hmem
    · have hmem : 11 ∈ selected (oldCenter 3) ∩ secondCapLabels :=
        Finset.mem_inter.mpr ⟨by simpa only [hnextOld] using hnextSource, by decide⟩
      rw [holdCap 3] at hmem
      norm_num [oldFixedHit₁, oldFixedHit₂] at hmem
      simp at hmem
  let model : SourceModel :=
    { order := order
      selected := selected
      nextCenter := nextCenter
      row_card := hrowCard
      center_not_mem := hcenterNotMem
      cover := hcover
      pair_inter_le_two := hinter
      old_cap_slice := by simpa only [selected] using holdCap
      old_outside_multiplicity_one := by
        simpa only [selected] using holdMultiplicity
      nextCenter_not_old := hnextNotOld
      next_source_mem := hnextSource
      next_physical_hits := by simpa only [selected] using hnextPhysical }
  exact ⟨
    { pattern := pattern
      carrier_convexIndep := hconv
      model := model
      orientation := orientation
      boundary := boundary
      boundary_injective := hboundaryInjective
      boundary_image := hboundaryImage
      boundary_ccw := hboundaryCcw
      labelIndex := labelIndex
      labelIndex_eq := by simpa only [model] using hlabelIndex
      position_embedding := by simpa only [model] using hposition
      row_eq := by intro center; rfl }⟩

/-- A four-point row with two distinct certified cap hits and at most two cap
hits has exactly two points outside the cap. -/
theorem outsideSlice_card_eq_two {α : Type*} [DecidableEq α]
    (support cap : Finset α) (a b : α)
    (hsupport : support.card = 4)
    (hcap : (support ∩ cap).card ≤ 2)
    (ha : a ∈ support ∩ cap) (hb : b ∈ support ∩ cap)
    (hab : a ≠ b) :
    (support \ cap).card = 2 := by
  have hpair : {a, b} ⊆ support ∩ cap := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact ha
    · exact hb
  have htwo : 2 ≤ (support ∩ cap).card := by
    calc
      2 = ({a, b} : Finset α).card := by simp [hab]
      _ ≤ (support ∩ cap).card := Finset.card_le_card hpair
  have hinter : (support ∩ cap).card = 2 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter support cap
  omega

/-- The bag of incidences between four distinguished rows and an outside set. -/
def incidenceBag {α : Type*} [DecidableEq α]
    (outside : Finset α) (row : Fin 4 → Finset α) : Multiset α :=
  (row 0 ∩ outside).1 + (row 1 ∩ outside).1 +
    (row 2 ∩ outside).1 + (row 3 ∩ outside).1

/-- Four two-point outside slices either omit an outside point, or form an
exact partition of an eight-point outside set.  The latter conclusion is
recorded as a duplicate-free incidence bag whose support is exactly
`outside`; this representation is convenient for the subsequent finite
normal-form relabeling. -/
theorem unused_or_exactCover {α : Type*} [DecidableEq α]
    (outside : Finset α) (row : Fin 4 → Finset α)
    (houtside : outside.card = 8)
    (hrow : ∀ i, (row i ∩ outside).card = 2) :
    (∃ x ∈ outside, ∀ i, x ∉ row i) ∨
      (incidenceBag outside row).Nodup ∧
        (incidenceBag outside row).toFinset = outside := by
  classical
  by_cases hunused : ∃ x ∈ outside, ∀ i, x ∉ row i
  · exact Or.inl hunused
  · right
    have hsupport : (incidenceBag outside row).toFinset = outside := by
      ext x
      simp only [incidenceBag, Multiset.mem_toFinset, Multiset.mem_add,
        Finset.mem_val, Finset.mem_inter]
      constructor
      · aesop
      · intro hxoutside
        push_neg at hunused
        obtain ⟨i, hxi⟩ := hunused x hxoutside
        fin_cases i <;> simp_all
    have hbagCard : (incidenceBag outside row).card = 8 := by
      simp only [incidenceBag, Multiset.card_add]
      change (row 0 ∩ outside).card + (row 1 ∩ outside).card +
        (row 2 ∩ outside).card + (row 3 ∩ outside).card = 8
      rw [hrow 0, hrow 1, hrow 2, hrow 3]
    have hcardEq :
        (incidenceBag outside row).toFinset.card =
          (incidenceBag outside row).card := by
      rw [hsupport, houtside, hbagCard]
    exact ⟨Multiset.toFinset_card_eq_card_iff_nodup.mp hcardEq, hsupport⟩

/-- In an exact four-row cover, every outside point occurs in exactly one row.
This is the pointwise form consumed by the checked finite encoder. -/
theorem row_multiplicity_eq_one_of_exactCover
    {α : Type*} [DecidableEq α]
    (outside : Finset α) (row : Fin 4 → Finset α)
    (hnodup : (incidenceBag outside row).Nodup)
    (hsupport : (incidenceBag outside row).toFinset = outside)
    {point : α} (hpoint : point ∈ outside) :
    (Finset.univ.filter fun index : Fin 4 => point ∈ row index).card = 1 := by
  have hbag : point ∈ incidenceBag outside row := by
    rw [← Multiset.mem_toFinset, hsupport]
    exact hpoint
  have hcount : Multiset.count point (incidenceBag outside row) = 1 :=
    Multiset.count_eq_one_of_mem hnodup hbag
  have hinterCount (i : Fin 4) :
      Multiset.count point (row i ∩ outside).1 =
        if point ∈ row i then 1 else 0 := by
    by_cases h : point ∈ row i
    · rw [if_pos h]
      have hi : point ∈ row i ∩ outside := Finset.mem_inter.mpr ⟨h, hpoint⟩
      exact Multiset.count_eq_one_of_mem (row i ∩ outside).2 (by
        simpa only [Finset.mem_val] using hi)
    · rw [if_neg h]
      exact Multiset.count_eq_zero.mpr (by simp [h])
  simp only [incidenceBag, Multiset.count_add] at hcount
  rw [hinterCount 0, hinterCount 1, hinterCount 2, hinterCount 3] at hcount
  rw [Finset.card_filter, Fin.sum_univ_four]
  exact hcount

/-- Package a geometric exact-cover packet into the finite source realization.
This is the branch-independent landing adapter: the caller identifies the four
old selected rows, the distinguished cap, and the selected physical class;
the generic faithful-pattern bridge supplies all remaining carrier-wide rows. -/
theorem exists_sourceRealization_of_geometricExactCover
    {A : Finset ℝ²} (H : CriticalShellSystem A) (hconv : ConvexIndep A)
    (pattern : FaithfulCarrierPattern A) (order : NamedOrder)
    (orientation : Orientation) (boundary : Fin 17 → ℝ²)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (labelIndex : Label → Fin 17)
    (hlabelIndex : labelIndex = expectedLabelIndex orientation order)
    (hposition : PositionEmbedding orientation order labelIndex)
    (rowSupport : Fin 4 → Finset ℝ²)
    (holdRows : ∀ row,
      selectedOfPattern pattern boundary hboundaryImage labelIndex
          (oldCenter row) =
        pullback (fun label => boundary (labelIndex label)) (rowSupport row))
    (cap : Finset ℝ²)
    (hcapPullback :
      pullback (fun label => boundary (labelIndex label)) cap =
        secondCapLabels)
    (holdCapGeom : ∀ row,
      rowSupport row ∩ cap =
        {boundary (labelIndex (oldFixedHit₁ row)),
          boundary (labelIndex (oldFixedHit₂ row))})
    (hnodup : (incidenceBag (A \ cap) rowSupport).Nodup)
    (hsupport : (incidenceBag (A \ cap) rowSupport).toFinset = A \ cap)
    (nextCenter : Label)
    (hnextCenter :
      boundary (labelIndex nextCenter) =
        H.centerAt (boundary (labelIndex 11))
          (boundaryLabel_mem boundary hboundaryImage labelIndex 11))
    (physical : Finset ℝ²)
    (hphysicalPullback :
      pullback (fun label => boundary (labelIndex label)) physical =
        physicalLabels)
    (hnextPhysicalGeom :
      ((pattern.classAt (boundary (labelIndex nextCenter))
          (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support ∩
        physical).card ≤ 1) :
    Nonempty (SourceRealization A) := by
  classical
  let point : Label → ℝ² := fun label => boundary (labelIndex label)
  have hlabelInjective : Function.Injective labelIndex :=
    labelIndex_injective_of_positionEmbedding orientation order labelIndex hposition
  have hpointInjective : Function.Injective point :=
    hboundaryInjective.comp hlabelInjective
  have hlabelSurjective : Function.Surjective labelIndex :=
    Finite.injective_iff_surjective.mp hlabelInjective
  have hpointImage : Finset.univ.image point = A := by
    ext x
    constructor
    · rintro hx
      rcases Finset.mem_image.mp hx with ⟨label, -, rfl⟩
      exact boundaryLabel_mem boundary hboundaryImage labelIndex label
    · intro hx
      rw [← hboundaryImage] at hx
      rcases Finset.mem_image.mp hx with ⟨index, -, rfl⟩
      obtain ⟨label, hlabel⟩ := hlabelSurjective index
      exact Finset.mem_image.mpr ⟨label, by simp, by simp [point, hlabel]⟩
  have holdCap : ∀ row,
      selectedOfPattern pattern boundary hboundaryImage labelIndex
          (oldCenter row) ∩ secondCapLabels =
        {oldFixedHit₁ row, oldFixedHit₂ row} := by
    intro row
    rw [holdRows row, ← hcapPullback, ← pullback_inter, holdCapGeom row]
    exact pullback_pair point hpointInjective _ _
  have holdMultiplicity : ∀ label, label ∈ outsideLabels →
      (Finset.univ.filter fun row : Fin 4 =>
        label ∈ selectedOfPattern pattern boundary hboundaryImage labelIndex
          (oldCenter row)).card = 1 := by
    intro label hlabelOutside
    have hregionsDisjoint : Disjoint outsideLabels secondCapLabels :=
      Finset.disjoint_iff_inter_eq_empty.mpr label_regions_regression.1
    have hlabelNotCap : label ∉ secondCapLabels :=
      Finset.disjoint_left.mp hregionsDisjoint hlabelOutside
    have hpointOutside : point label ∈ A \ cap := by
      rw [Finset.mem_sdiff]
      refine ⟨boundaryLabel_mem boundary hboundaryImage labelIndex label, ?_⟩
      intro hpointCap
      apply hlabelNotCap
      rw [← hcapPullback]
      exact (mem_pullback point cap label).2 hpointCap
    have hmultiplicity := row_multiplicity_eq_one_of_exactCover
      (A \ cap) rowSupport hnodup hsupport hpointOutside
    have hfilter :
        (Finset.univ.filter fun row : Fin 4 =>
          label ∈ selectedOfPattern pattern boundary hboundaryImage labelIndex
            (oldCenter row)) =
        Finset.univ.filter fun row : Fin 4 => point label ∈ rowSupport row := by
      ext row
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      rw [holdRows row]
      exact mem_pullback point (rowSupport row) label
    rw [hfilter]
    exact hmultiplicity
  have hnextPhysical :
      (selectedOfPattern pattern boundary hboundaryImage labelIndex nextCenter ∩
        physicalLabels).card ≤ 1 := by
    let nextSupport :=
      (pattern.classAt (boundary (labelIndex nextCenter))
        (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support
    calc
      (selectedOfPattern pattern boundary hboundaryImage labelIndex nextCenter ∩
          physicalLabels).card =
          (pullback point nextSupport ∩ pullback point physical).card := by
            rw [hphysicalPullback]
            rfl
      _ = (pullback point (nextSupport ∩ physical)).card := by
            rw [pullback_inter]
      _ = (nextSupport ∩ physical).card :=
        card_pullback_eq point A (nextSupport ∩ physical) hpointInjective
          hpointImage (by
            intro x hx
            exact (pattern.classAt (boundary (labelIndex nextCenter))
              (boundaryLabel_mem boundary hboundaryImage labelIndex nextCenter)).support_subset_A
                (Finset.mem_inter.mp hx).1)
      _ ≤ 1 := hnextPhysicalGeom
  exact exists_sourceRealization_of_faithfulPattern H hconv pattern order orientation
    boundary hboundaryInjective hboundaryImage hboundaryCcw labelIndex hlabelIndex hposition
    nextCenter hnextCenter holdCap holdMultiplicity hnextPhysical

end ATailBlockerVExactSeventeenSourceNormalForm
end Problem97
