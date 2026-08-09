/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Exact-twelve carrier ingress for generic row certificates

This module is the cardinality and relabeling layer between a source-faithful
carrier pattern and an exact-twelve finite row search.  Distinguished finite
labels may be pinned to source points once their injectivity has been proved.
After relabeling, the complete selected row at every label is still realized
geometrically and is available through `RowsMatch`.

The theorem does not encode the pentagon-off-class source constraints, choose
a particular placement of the distinguished roles, or prove finite coverage.
Those are separate obligations of the source-to-CNF adapter and terminal
certificate.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveCarrierIngress

open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate
open scoped EuclideanGeometry

/-- Frozen finite label type for the exact-twelve lane. -/
abbrev Label := Fin 12

/-- Labels whose carrier points lie in a specified geometric subset.  This is
the exact-twelve analogue of the card-eleven `labelsOf` construction, kept
independent of any cap profile. -/
noncomputable def labelsOf {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Label) (S : Finset ℝ²) : Finset Label :=
  Finset.univ.filter fun label => (e.symm label).1 ∈ S

@[simp] theorem mem_labelsOf_iff {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Label) (S : Finset ℝ²) (label : Label) :
    label ∈ labelsOf e S ↔ (e.symm label).1 ∈ S := by
  simp [labelsOf]

/-- Relabeling preserves the cardinality of every subset of the carrier. -/
theorem labelsOf_card_eq {A : Finset ℝ²}
    (e : CarrierLabel A ≃ Label) {S : Finset ℝ²} (hS : S ⊆ A) :
    (labelsOf e S).card = S.card := by
  classical
  let point : Label → ℝ² := fun label => (e.symm label).1
  have hinjective : Function.Injective point := by
    intro left right hpoint
    exact e.symm.injective (Subtype.ext hpoint)
  have himage : (labelsOf e S).image point = S := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
      exact (mem_labelsOf_iff e S label).mp hlabel
    · intro hx
      let source : CarrierLabel A := ⟨x, hS hx⟩
      let label : Label := e source
      refine Finset.mem_image.mpr ⟨label, ?_, ?_⟩
      · apply (mem_labelsOf_iff e S label).mpr
        simpa [label, source] using hx
      · simp [point, label, source]
  calc
    (labelsOf e S).card = ((labelsOf e S).image point).card :=
      (Finset.card_image_of_injective _ hinjective).symm
    _ = S.card := congrArg Finset.card himage

/-- Relabel every selected source row by an exact-twelve carrier labeling. -/
noncomputable def labeledRowPattern {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label) :
    RowPattern Label :=
  reindexRowPattern e (rowPattern F)

/-- The complete proof-facing row assignment after exact-twelve relabeling. -/
noncomputable def labeledRows {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label) :
    List (RowChoice Label) :=
  allRowChoices (labeledRowPattern F e)

/-- Finite row membership is exactly membership in the corresponding selected
geometric support.  This is the pointwise semantic contract needed by a
source-to-CNF adapter. -/
@[simp] theorem mem_labeledRowPattern_iff {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label)
    (center point : Label) :
    point ∈ labeledRowPattern F e center ↔
      (e.symm point).1 ∈
        (F.classAt (e.symm center).1 (e.symm center).2).support := by
  rw [labeledRowPattern, mem_reindexRowPattern_iff,
    Census554.GeneralCarrierBridge.mem_rowPattern_iff]

/-- Relabeling preserves the exact four-point row cardinality. -/
theorem labeledRowPattern_card {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label)
    (center : Label) :
    (labeledRowPattern F e center).card = 4 := by
  classical
  simpa [labeledRowPattern, reindexRowPattern] using
    Census554.GeneralCarrierBridge.rowPattern_card F (e.symm center)

/-- Relabeling preserves the cardinality of the intersection between a
selected row and any geometric subset.  This is the finite/source adapter
used by cap-profile candidate filters: its left side is stated entirely in
the frozen label vocabulary, while its right side is the source-selected
geometric row. -/
theorem labeledRowPattern_inter_labelsOf_card_eq
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (e : CarrierLabel A ≃ Label) (center : Label) (S : Finset ℝ²) :
    (labeledRowPattern F e center ∩ labelsOf e S).card =
      ((F.classAt (e.symm center).1 (e.symm center).2).support ∩ S).card := by
  classical
  let point : Label → ℝ² := fun label => (e.symm label).1
  let finiteIntersection := labeledRowPattern F e center ∩ labelsOf e S
  let sourceIntersection :=
    (F.classAt (e.symm center).1 (e.symm center).2).support ∩ S
  have hinjective : Function.Injective point := by
    intro left right hpoint
    exact e.symm.injective (Subtype.ext hpoint)
  have himage : finiteIntersection.image point = sourceIntersection := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨label, hlabel, rfl⟩
      have hrow := (Finset.mem_inter.mp hlabel).1
      have hsubset := (Finset.mem_inter.mp hlabel).2
      exact Finset.mem_inter.mpr
        ⟨(mem_labeledRowPattern_iff F e center label).mp hrow,
          (mem_labelsOf_iff e S label).mp hsubset⟩
    · intro hx
      have hrow := (Finset.mem_inter.mp hx).1
      have hsubset := (Finset.mem_inter.mp hx).2
      have hxA : x ∈ A :=
        (F.classAt (e.symm center).1 (e.symm center).2).support_subset_A hrow
      let source : CarrierLabel A := ⟨x, hxA⟩
      let label : Label := e source
      refine Finset.mem_image.mpr ⟨label, ?_, ?_⟩
      · apply Finset.mem_inter.mpr
        constructor
        · apply (mem_labeledRowPattern_iff F e center label).mpr
          simpa [label, source] using hrow
        · apply (mem_labelsOf_iff e S label).mpr
          simpa [label, source] using hsubset
      · simp [point, label, source]
  calc
    (labeledRowPattern F e center ∩ labelsOf e S).card =
        finiteIntersection.card := rfl
    _ = (finiteIntersection.image point).card :=
      (Finset.card_image_of_injective _ hinjective).symm
    _ = sourceIntersection.card := by rw [himage]
    _ = ((F.classAt (e.symm center).1 (e.symm center).2).support ∩ S).card := rfl

/-- The relabeled rows are exact by construction. -/
theorem rowsMatch_labeledRows {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label) :
    RowsMatch (labeledRowPattern F e) (labeledRows F e) := by
  exact rowsMatch_allRowChoices (labeledRowPattern F e)

/-- The relabeled faithful carrier remains geometrically realized. -/
theorem realizes_labeledRowPattern {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label) :
    Realizes (labeledRowPattern F e)
      (fun i => pointOf (e.symm i)) := by
  exact realizes_reindexRowPattern e
    (Census554.GeneralCarrierBridge.realizes F)

/-- The source-faithful part of the finite `C1/C2/C4` cube contract.

This deliberately excludes every cap-profile and post-`SUB2` candidate cut.
Those cuts require their own source-to-CNF proofs; bundling them here would make
the generic geometric ingress appear stronger than it is. -/
structure SourceCubeOK (P : RowPattern Label) : Prop where
  row_card : ∀ center, (P center).card = 4
  center_not_mem : ∀ center, center ∉ P center
  row_inter_card_le_two :
    ∀ ⦃left right⦄, left ≠ right →
      (P left ∩ P right).card ≤ 2
  pair_center_count_le_two :
    ∀ ⦃left right⦄, left ≠ right →
      ((Finset.univ : Finset Label).filter fun center =>
        left ∈ P center ∧ right ∈ P center).card ≤ 2

/-- A relabeled faithful carrier row never contains its own center. -/
theorem center_not_mem_labeledRowPattern {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label)
    (center : Label) :
    center ∉ labeledRowPattern F e center := by
  intro hcenter
  exact (F.classAt (e.symm center).1 (e.symm center).2).center_not_mem
    ((mem_labeledRowPattern_iff F e center center).mp hcenter)

/-- Distinct relabeled selected rows overlap in at most two labels. -/
theorem labeledRowPattern_inter_card_le_two {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label)
    {left right : Label} (hne : left ≠ right) :
    (labeledRowPattern F e left ∩ labeledRowPattern F e right).card ≤ 2 := by
  classical
  let sourceLeft := e.symm left
  let sourceRight := e.symm right
  let Kleft := F.classAt sourceLeft.1 sourceLeft.2
  let Kright := F.classAt sourceRight.1 sourceRight.2
  have hsourceNe : sourceLeft.1 ≠ sourceRight.1 := by
    intro hpoint
    apply hne
    apply e.symm.injective
    exact Subtype.ext hpoint
  have himage :
      ((rowPattern F sourceLeft ∩ rowPattern F sourceRight).image
        (pointOf (A := A))) = Kleft.support ∩ Kright.support := by
    ext z
    simp only [Finset.mem_image, Finset.mem_inter]
    constructor
    · rintro ⟨source, ⟨hleft, hright⟩, rfl⟩
      exact ⟨
        (Census554.GeneralCarrierBridge.mem_rowPattern_iff F sourceLeft source).mp
          hleft,
        (Census554.GeneralCarrierBridge.mem_rowPattern_iff F sourceRight source).mp
          hright⟩
    · rintro ⟨hleft, hright⟩
      have hzA : z ∈ A := Kleft.support_subset_A hleft
      let source : CarrierLabel A := ⟨z, hzA⟩
      exact ⟨source, ⟨
        (Census554.GeneralCarrierBridge.mem_rowPattern_iff F sourceLeft source).mpr
          hleft,
        (Census554.GeneralCarrierBridge.mem_rowPattern_iff F sourceRight source).mpr
          hright⟩, rfl⟩
  calc
    (labeledRowPattern F e left ∩ labeledRowPattern F e right).card =
        (rowPattern F sourceLeft ∩ rowPattern F sourceRight).card := by
      simp [labeledRowPattern, reindexRowPattern, sourceLeft, sourceRight,
        ← Finset.map_inter]
    _ = ((rowPattern F sourceLeft ∩ rowPattern F sourceRight).image
          (pointOf (A := A))).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ = (Kleft.support ∩ Kright.support).card := by rw [himage]
    _ ≤ 2 := SelectedFourClass.inter_card_le_two Kleft Kright hsourceNe

/-- A fixed pair of distinct labels occurs in relabeled faithful rows at at
most two centers. -/
theorem labeledRowPattern_pair_center_count_le_two
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (F : FaithfulCarrierPattern A) (e : CarrierLabel A ≃ Label)
    {left right : Label} (hne : left ≠ right) :
    ((Finset.univ : Finset Label).filter fun center =>
      left ∈ labeledRowPattern F e center ∧
        right ∈ labeledRowPattern F e center).card ≤ 2 := by
  classical
  let hits : Finset Label :=
    Finset.univ.filter fun center =>
      left ∈ labeledRowPattern F e center ∧
        right ∈ labeledRowPattern F e center
  let target : Finset ℝ² :=
    A.filter fun center =>
      dist center (pointOf (e.symm left)) =
        dist center (pointOf (e.symm right))
  let carrierPoint : Label → ℝ² := fun center => pointOf (e.symm center)
  have hmaps : Set.MapsTo carrierPoint (↑hits) (↑target) := by
    intro center hcenter
    have hrows :
        left ∈ labeledRowPattern F e center ∧
          right ∈ labeledRowPattern F e center := by
      simpa [hits] using hcenter
    have hleft := (mem_labeledRowPattern_iff F e center left).mp hrows.1
    have hright := (mem_labeledRowPattern_iff F e center right).mp hrows.2
    exact Finset.mem_filter.mpr ⟨(e.symm center).2, by
      exact
        ((F.classAt (e.symm center).1 (e.symm center).2).support_eq_radius
          _ hleft).trans
        ((F.classAt (e.symm center).1 (e.symm center).2).support_eq_radius
          _ hright).symm⟩
  have hinjOn : Set.InjOn carrierPoint (↑hits) := by
    intro first _hfirst second _hsecond hpoint
    exact e.symm.injective (Subtype.ext hpoint)
  have hhitsTarget : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn carrierPoint hmaps hinjOn
  have hpointNe : pointOf (e.symm left) ≠ pointOf (e.symm right) := by
    intro hpoint
    exact hne (e.symm.injective (Subtype.ext hpoint))
  have htarget : target.card ≤ 2 := by
    simpa [target, dist_comm] using
      Dumitrescu.perpBisector_apex_bound hconv
        (e.symm left).2 (e.symm right).2 hpointNe
  change hits.card ≤ 2
  exact hhitsTarget.trans htarget

/-- Every exact-twelve relabeling of a faithful carrier pattern satisfies the
source-entitled `C1/C2/C4` cube constraints used by the base SAT encoding. -/
theorem sourceCubeOK_labeledRowPattern {A : Finset ℝ²}
    (hconv : ConvexIndep A) (F : FaithfulCarrierPattern A)
    (e : CarrierLabel A ≃ Label) :
    SourceCubeOK (labeledRowPattern F e) := by
  exact ⟨labeledRowPattern_card F e,
    center_not_mem_labeledRowPattern F e,
    fun _ _ hne => labeledRowPattern_inter_card_le_two F e hne,
    fun _ _ hne => labeledRowPattern_pair_center_count_le_two hconv F e hne⟩

/-- An exact-twelve carrier admits any injective finite role pinning.  The
result packages the exact complete rows and their geometric realization; it
does not assert that a particular pinning is source-valid. -/
theorem exists_pinned_labeling
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (hcard : A.card = 12) {S : Finset Label}
    {pins : Label → CarrierLabel A} (hpins : Set.InjOn pins S) :
    ∃ e : CarrierLabel A ≃ Label,
      (∀ i ∈ S, e.symm i = pins i) ∧
        RowsMatch (labeledRowPattern F e) (labeledRows F e) ∧
        Realizes (labeledRowPattern F e)
          (fun i => pointOf (e.symm i)) := by
  have hcarrierCard : Fintype.card (CarrierLabel A) = 12 := by
    simpa [CarrierLabel] using hcard
  obtain ⟨e, hpinned⟩ :=
    exists_equiv_with_pinned_inverse hcarrierCard hpins
  exact ⟨e, hpinned, rowsMatch_labeledRows F e,
    realizes_labeledRowPattern F e⟩

end ExactTwelveCarrierIngress
end ATailFrontierLiveClosure
end Problem97
