/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.Dumitrescu.L5
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Mathlib.Geometry.Euclidean.Sphere.Ptolemy

/-!
# Generic geometry adapters for selected four-rows

This module records two conditional consumers of a `SelectedFourClass`:

* two row points in a cap, with the row center outside that cap, form a genuine
  Dumitrescu cap-witness pair;
* a boundary indexing canonically sorts the four row points in boundary order;
* four named row points are cospherical, so Mathlib's Ptolemy equality applies
  once an independent crossing/order argument supplies its angle hypotheses.

The boundary-order adapter does not identify an arbitrary named pairing of the
four points, and none of the adapters produces cap placement.
-/

namespace Problem97

open scoped EuclideanGeometry
open Census554.GeneralCarrierBridge

/-- A pair selected from one exact four-row and placed in a cap whose exterior
contains the row center.  The placement fields are the source-side data needed
before cap-witness geometry can be applied. -/
structure SelectedFourCapWitnessPacket
    (A C : Finset ℝ²) (center : ℝ²)
    (K : SelectedFourClass A center) where
  pair : Finset ℝ²
  pair_subset_support : pair ⊆ K.support
  pair_subset_cap : pair ⊆ C
  pair_card : pair.card = 2
  center_mem_carrier : center ∈ A
  center_outside_cap : center ∉ C

namespace SelectedFourCapWitnessPacket

/-- Forgetting the selected-row provenance yields exactly Dumitrescu's cap
witness-pair predicate. -/
theorem isCapWitnessPair
    {A C : Finset ℝ²} {center : ℝ²}
    {K : SelectedFourClass A center}
    (W : SelectedFourCapWitnessPacket A C center K) :
    Dumitrescu.IsCapWitnessPair A C W.pair := by
  refine ⟨W.pair_subset_cap, W.pair_card, center,
    W.center_mem_carrier, W.center_outside_cap, K.radius, ?_⟩
  intro q hq
  exact K.support_eq_radius q (W.pair_subset_support hq)

end SelectedFourCapWitnessPacket

namespace Census554.GeneralCarrierBridge.BoundaryIndexing

/-- The four boundary indices occupied by one exact selected row. -/
noncomputable def selectedFourSupportIndices
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center : ℝ²} (K : SelectedFourClass A center) :
    Finset (Fin B.n) :=
  K.support.attach.image fun z ↦
    B.indexOf ⟨z.1, K.support_subset_A z.2⟩

theorem selectedFourSupportIndices_card
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center : ℝ²} (K : SelectedFourClass A center) :
    (B.selectedFourSupportIndices K).card = 4 := by
  classical
  have hinj : Function.Injective (fun z : K.support ↦
      B.indexOf ⟨z.1, K.support_subset_A z.2⟩) := by
    intro a b hab
    have hlabel := B.index_injective hab
    apply Subtype.ext
    exact congrArg (fun label : CarrierLabel A ↦ label.1) hlabel
  rw [selectedFourSupportIndices, Finset.card_image_of_injective _ hinj]
  simpa using K.support_card

/-- The canonical increasing boundary order of an exact selected row. -/
noncomputable def selectedFourSupportOrder
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center : ℝ²} (K : SelectedFourClass A center) :
    Fin 4 ↪o Fin B.n :=
  (B.selectedFourSupportIndices K).orderEmbOfFin
    (B.selectedFourSupportIndices_card K)

/-- Every canonically ordered boundary position is a selected-row point. -/
theorem boundary_selectedFourSupportOrder_mem
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center : ℝ²} (K : SelectedFourClass A center) (i : Fin 4) :
    B.boundary (B.selectedFourSupportOrder K i) ∈ K.support := by
  classical
  have hi : B.selectedFourSupportOrder K i ∈
      B.selectedFourSupportIndices K :=
    Finset.orderEmbOfFin_mem _ (B.selectedFourSupportIndices_card K) i
  rw [selectedFourSupportIndices] at hi
  rcases Finset.mem_image.mp hi with ⟨z, _hz, hzi⟩
  have hpoint := B.point_eq
    (⟨z.1, K.support_subset_A z.2⟩ : CarrierLabel A)
  rw [hzi] at hpoint
  rw [hpoint]
  exact z.2

/-- Every selected-row point occurs at one canonical boundary position. -/
theorem exists_selectedFourSupportOrder_boundary_eq
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center z : ℝ²} (K : SelectedFourClass A center)
    (hz : z ∈ K.support) :
    ∃ i : Fin 4, B.boundary (B.selectedFourSupportOrder K i) = z := by
  classical
  let label : CarrierLabel A := ⟨z, K.support_subset_A hz⟩
  have hindex : B.indexOf label ∈ B.selectedFourSupportIndices K := by
    rw [selectedFourSupportIndices]
    exact Finset.mem_image.mpr ⟨⟨z, hz⟩, Finset.mem_attach _ _, rfl⟩
  have hrange : B.indexOf label ∈ Set.range (B.selectedFourSupportOrder K) := by
    simpa [selectedFourSupportOrder] using hindex
  rcases hrange with ⟨i, hi⟩
  refine ⟨i, ?_⟩
  rw [hi]
  exact B.point_eq label

/-- The canonical four boundary positions enumerate the row support exactly. -/
theorem image_boundary_selectedFourSupportOrder
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {center : ℝ²} (K : SelectedFourClass A center) :
    Finset.univ.image (fun i : Fin 4 ↦
      B.boundary (B.selectedFourSupportOrder K i)) = K.support := by
  classical
  ext z
  constructor
  · intro hz
    rcases Finset.mem_image.mp hz with ⟨i, _hi, rfl⟩
    exact B.boundary_selectedFourSupportOrder_mem K i
  · intro hz
    rcases B.exists_selectedFourSupportOrder_boundary_eq K hz with ⟨i, hi⟩
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ i, hi⟩

end Census554.GeneralCarrierBridge.BoundaryIndexing

namespace SelectedFourClass

/-- If at least two witnesses of an exact four-row lie in one cap and the row
center lies outside it, those two witnesses form a cap-witness packet.

This is an extraction theorem, not a cap-placement theorem: the cardinality
and center-side hypotheses must be proved by the source geometry. -/
theorem nonempty_capWitnessPacket_of_two_mem
    {A C : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center)
    (hcenterA : center ∈ A) (hcenterOutside : center ∉ C)
    (htwo : 2 ≤ (K.support ∩ C).card) :
    Nonempty (SelectedFourCapWitnessPacket A C center K) := by
  classical
  rcases Finset.exists_subset_card_eq htwo with
    ⟨pair, hpairSub, hpairCard⟩
  refine ⟨
    { pair := pair
      pair_subset_support := ?_
      pair_subset_cap := ?_
      pair_card := hpairCard
      center_mem_carrier := hcenterA
      center_outside_cap := hcenterOutside }⟩
  · intro q hq
    exact (Finset.mem_inter.mp (hpairSub hq)).1
  · intro q hq
    exact (Finset.mem_inter.mp (hpairSub hq)).2

/-- Four named members of one selected row are cospherical around its center. -/
theorem cospherical_of_mem
    {A : Finset ℝ²} {center a b c d : ℝ²}
    (K : SelectedFourClass A center)
    (ha : a ∈ K.support) (hb : b ∈ K.support)
    (hc : c ∈ K.support) (hd : d ∈ K.support) :
    EuclideanGeometry.Cospherical ({a, b, c, d} : Set ℝ²) := by
  refine ⟨center, K.radius, ?_⟩
  intro q hq
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hq
  rcases hq with rfl | rfl | rfl | rfl
  all_goals simpa [dist_comm] using K.support_eq_radius _ ‹_›

/-- Ptolemy's equality for four selected-row points, conditional on the two
opposite-angle hypotheses supplied by an independent crossing/order packet. -/
theorem ptolemy_of_opposite_angles
    {A : Finset ℝ²} {center a b c d p : ℝ²}
    (K : SelectedFourClass A center)
    (ha : a ∈ K.support) (hb : b ∈ K.support)
    (hc : c ∈ K.support) (hd : d ∈ K.support)
    (hapc : ∠ a p c = Real.pi) (hbpd : ∠ b p d = Real.pi) :
    dist a b * dist c d + dist b c * dist d a =
      dist a c * dist b d :=
  EuclideanGeometry.mul_dist_add_mul_dist_eq_mul_dist_of_cospherical
    (a := a) (b := b) (c := c) (d := d) (p := p)
    (K.cospherical_of_mem ha hb hc hd) hapc hbpd

end SelectedFourClass

end Problem97
