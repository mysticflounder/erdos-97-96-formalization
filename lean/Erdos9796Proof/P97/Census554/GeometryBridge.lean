/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1OppositeCapLowerBounds
import Erdos9796Proof.P97.MultiCenter.CapProfile
import Erdos9796Proof.P97.Census554.Space
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.SurplusM44Packet

/-!
# Census554 geometry bridge

Bank-independent cardinality, labeling, and geometric necessity facts for the
card-11 branch. This file constructs the canonical selected Census554 cube and
proves its complete `CubeOk` predicate. It does not consume a finite-census
result or an open Front-A leaf.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

open U1LargeCapRouteBTailMetricResidualTarget

/-- The Moser vertex opposite the cap with index `i`. -/
def apexAt {A : Finset ℝ²} (M : MoserTriangle A) (i : Fin 3) : ℝ² :=
  match i with
  | ⟨0, _⟩ => M.v1
  | ⟨1, _⟩ => M.v2
  | _ => M.v3

theorem apexAt_mem {A : Finset ℝ²} (M : MoserTriangle A) (i : Fin 3) :
    apexAt M i ∈ A := by
  fin_cases i
  · simpa [apexAt] using M.v1_mem
  · simpa [apexAt] using M.v2_mem
  · simpa [apexAt] using M.v3_mem

theorem apexAt_mem_verts {A : Finset ℝ²} (M : MoserTriangle A)
    (i : Fin 3) :
    apexAt M i ∈ M.verts := by
  fin_cases i <;> simp [apexAt, MoserTriangle.verts]

theorem apexAt_injective {A : Finset ℝ²} (M : MoserTriangle A) :
    Function.Injective (apexAt M) := by
  intro i j hij
  fin_cases i <;> fin_cases j
  · rfl
  · exact (M.v12_ne (by simpa [apexAt] using hij)).elim
  · exact (M.v13_ne (by simpa [apexAt] using hij)).elim
  · exact (M.v12_ne (by simpa [apexAt] using hij.symm)).elim
  · rfl
  · exact (M.v23_ne (by simpa [apexAt] using hij)).elim
  · exact (M.v13_ne (by simpa [apexAt] using hij.symm)).elim
  · exact (M.v23_ne (by simpa [apexAt] using hij.symm)).elim
  · rfl

theorem apexAt_mem_capAt_of_ne {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {i j : Fin 3} (hji : j ≠ i) :
    apexAt M j ∈ CP.capAt i := by
  fin_cases i <;> fin_cases j
  · exact (hji rfl).elim
  · exact CP.v2_mem_C1
  · exact CP.v3_mem_C1
  · exact CP.v1_mem_C2
  · exact (hji rfl).elim
  · exact CP.v3_mem_C2
  · exact CP.v1_mem_C3
  · exact CP.v2_mem_C3
  · exact (hji rfl).elim

/-- The cap order `(surplus, second, rest)` used by the Census554 labels
`(U,V,W)`. -/
def frameIndex {surplus second : Fin 3}
    (frame : MultiCenter.JointCapIndexFrame surplus second) : Fin 3 → Fin 3
  | 0 => surplus
  | 1 => second
  | _ => frame.rest

theorem frameIndex_injective {surplus second : Fin 3}
    (hsecond : second ≠ surplus)
    (frame : MultiCenter.JointCapIndexFrame surplus second) :
    Function.Injective (frameIndex frame) := by
  intro i j hij
  fin_cases i <;> fin_cases j
  · rfl
  · exact (hsecond (by simpa [frameIndex] using hij.symm)).elim
  · exact (frame.rest_ne_surplus
      (by simpa [frameIndex] using hij.symm)).elim
  · exact (hsecond (by simpa [frameIndex] using hij)).elim
  · rfl
  · exact (frame.rest_ne_second
      (by simpa [frameIndex] using hij.symm)).elim
  · exact (frame.rest_ne_surplus
      (by simpa [frameIndex] using hij)).elim
  · exact (frame.rest_ne_second
      (by simpa [frameIndex] using hij)).elim
  · rfl

/-- A card-11 labeling whose first three labels are the apices opposite the
surplus, second, and remaining caps. The map is a bijection onto the carrier;
the two directional fields are explicit so downstream geometric proofs do not
have to recover surjectivity from a cardinality argument. -/
structure Card11Labeling {A : Finset ℝ²} (M : MoserTriangle A)
    {surplus second : Fin 3}
    (frame : MultiCenter.JointCapIndexFrame surplus second) where
  pointOf : Fin 11 → ℝ²
  injective : Function.Injective pointOf
  mem_carrier : ∀ p, pointOf p ∈ A
  carrier_surjective : ∀ x ∈ A, ∃ p, pointOf p = x
  point_zero : pointOf 0 = apexAt M surplus
  point_one : pointOf 1 = apexAt M second
  point_two : pointOf 2 = apexAt M frame.rest

namespace Card11Labeling

theorem range_eq_carrier {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) :
    Set.range L.pointOf = (A : Set ℝ²) := by
  ext x
  constructor
  · rintro ⟨p, rfl⟩
    exact L.mem_carrier p
  · intro hx
    rcases L.carrier_surjective x hx with ⟨p, hp⟩
    exact ⟨p, hp⟩

/-- Every card-11 carrier admits a labeling with the three cap apices in the
fixed Census554 positions `0`, `1`, and `2`. -/
theorem nonempty_of_card_eq_eleven
    {A : Finset ℝ²} (M : MoserTriangle A)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : MultiCenter.JointCapIndexFrame surplus second)
    (hcard : A.card = 11) :
    Nonempty (Card11Labeling M frame) := by
  classical
  let rest : Finset ℝ² := A \ M.verts
  have hrestCard : rest.card = 8 := by
    rw [show rest = A \ M.verts by rfl,
      Finset.card_sdiff_of_subset M.verts_subset, M.verts_card, hcard]
  let tailEquiv : Fin 8 ≃ rest :=
    (Finset.equivFinOfCardEq hrestCard).symm
  let head : Fin 3 → ℝ² := fun i => apexAt M (frameIndex frame i)
  let sumPoint : Fin 3 ⊕ Fin 8 → ℝ²
    | Sum.inl i => head i
    | Sum.inr i => tailEquiv i
  let split : Fin 11 ≃ Fin 3 ⊕ Fin 8 :=
    (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm
  let pointOf : Fin 11 → ℝ² := fun p => sumPoint (split p)
  have hhead : Function.Injective head :=
    (apexAt_injective M).comp (frameIndex_injective hsecond frame)
  have hsum : Function.Injective sumPoint := by
    intro a b hab
    cases a with
    | inl i =>
        cases b with
        | inl j =>
            exact congrArg Sum.inl (hhead hab)
        | inr j =>
            exfalso
            change head i = (tailEquiv j : ℝ²) at hab
            have hmem : head i ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame i)
            have hnot : (tailEquiv j : ℝ²) ∉ M.verts :=
              (Finset.mem_sdiff.mp (tailEquiv j).property).2
            exact hnot (hab ▸ hmem)
    | inr i =>
        cases b with
        | inl j =>
            exfalso
            change (tailEquiv i : ℝ²) = head j at hab
            have hmem : head j ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame j)
            have hnot : (tailEquiv i : ℝ²) ∉ M.verts :=
              (Finset.mem_sdiff.mp (tailEquiv i).property).2
            exact hnot (hab.symm ▸ hmem)
        | inr j =>
            exact congrArg Sum.inr (tailEquiv.injective (Subtype.ext hab))
  have hpoint : Function.Injective pointOf := hsum.comp split.injective
  have hframeSurj : Function.Surjective (frameIndex frame) :=
    Finite.surjective_of_injective (frameIndex_injective hsecond frame)
  refine ⟨{
    pointOf := pointOf
    injective := hpoint
    mem_carrier := ?_
    carrier_surjective := ?_
    point_zero := ?_
    point_one := ?_
    point_two := ?_ }⟩
  · intro p
    cases hsplit : split p with
    | inl i =>
        change sumPoint (split p) ∈ A
        rw [hsplit]
        exact apexAt_mem M (frameIndex frame i)
    | inr i =>
        change sumPoint (split p) ∈ A
        rw [hsplit]
        exact (Finset.mem_sdiff.mp (tailEquiv i).property).1
  · intro x hxA
    by_cases hxVerts : x ∈ M.verts
    · have hapex : ∃ i : Fin 3, apexAt M i = x := by
        simp only [MoserTriangle.verts, Finset.mem_insert,
          Finset.mem_singleton] at hxVerts
        rcases hxVerts with rfl | rfl | rfl
        · exact ⟨0, by simp [apexAt]⟩
        · exact ⟨1, by simp [apexAt]⟩
        · exact ⟨2, by simp [apexAt]⟩
      rcases hapex with ⟨i, hi⟩
      rcases hframeSurj i with ⟨p, hp⟩
      refine ⟨(finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11) (Sum.inl p), ?_⟩
      change sumPoint (split ((finSumFinEquiv :
        Fin 3 ⊕ Fin 8 ≃ Fin 11) (Sum.inl p))) = x
      rw [show split ((finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11)
        (Sum.inl p)) = Sum.inl p by
          exact (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm_apply_apply _]
      change apexAt M (frameIndex frame p) = x
      rw [hp, hi]
    · have hxRest : x ∈ rest := Finset.mem_sdiff.mpr ⟨hxA, hxVerts⟩
      rcases tailEquiv.surjective ⟨x, hxRest⟩ with ⟨i, hi⟩
      refine ⟨(finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11) (Sum.inr i), ?_⟩
      change sumPoint (split ((finSumFinEquiv :
        Fin 3 ⊕ Fin 8 ≃ Fin 11) (Sum.inr i))) = x
      rw [show split ((finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11)
        (Sum.inr i)) = Sum.inr i by
          exact (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm_apply_apply _]
      exact congrArg Subtype.val hi
  · change sumPoint (split 0) = apexAt M surplus
    have hz : split 0 = Sum.inl 0 := by
      change (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm 0 = Sum.inl 0
      exact finSumFinEquiv_symm_apply_castAdd 0
    rw [hz]
    rfl
  · change sumPoint (split 1) = apexAt M second
    have ho : split 1 = Sum.inl 1 := by
      change (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm 1 = Sum.inl 1
      exact finSumFinEquiv_symm_apply_castAdd 1
    rw [ho]
    rfl
  · change sumPoint (split 2) = apexAt M frame.rest
    have ht : split 2 = Sum.inl 2 := by
      change (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm 2 = Sum.inl 2
      exact finSumFinEquiv_symm_apply_castAdd 2
    rw [ht]
    rfl

/-- Labels whose carrier points lie in a specified subset. -/
noncomputable def labelsOf {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) (S : Finset ℝ²) : Finset (Fin 11) :=
  Finset.univ.filter fun p => L.pointOf p ∈ S

theorem mem_labelsOf {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) {S : Finset ℝ²} {p : Fin 11} :
    p ∈ L.labelsOf S ↔ L.pointOf p ∈ S := by
  simp [labelsOf]

/-- Restricting the carrier labeling to a subset of the carrier maps onto
exactly that subset. -/
theorem image_labelsOf_eq {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) {S : Finset ℝ²} (hS : S ⊆ A) :
    (L.labelsOf S).image L.pointOf = S := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨p, hp, rfl⟩
    exact (L.mem_labelsOf).mp hp
  · intro hx
    rcases L.carrier_surjective x (hS hx) with ⟨p, hp⟩
    refine Finset.mem_image.mpr ⟨p, ?_, hp⟩
    exact (L.mem_labelsOf).mpr (hp ▸ hx)

theorem labelsOf_card_eq {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) {S : Finset ℝ²} (hS : S ⊆ A) :
    (L.labelsOf S).card = S.card := by
  calc
    (L.labelsOf S).card = ((L.labelsOf S).image L.pointOf).card :=
      (Finset.card_image_of_injective _ L.injective).symm
    _ = S.card := congrArg Finset.card (L.image_labelsOf_eq hS)

theorem capInteriorAt_subset {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) :
    U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt CP i ⊆ A := by
  intro x hx
  fin_cases i
  · change x ∈ (CP.C1.erase M.v2).erase M.v3 at hx
    exact CP.C1_subset
      (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx))
  · change x ∈ (CP.C2.erase M.v3).erase M.v1 at hx
    exact CP.C2_subset
      (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx))
  · change x ∈ (CP.C3.erase M.v1).erase M.v2 at hx
    exact CP.C3_subset
      (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx))

theorem capInteriorAt_subset_capAt {A : Finset ℝ²}
    {M : MoserTriangle A} (CP : CapTriple A M) (i : Fin 3) :
    capInteriorAt CP i ⊆ CP.capAt i := by
  intro x hx
  fin_cases i
  · change x ∈ (CP.C1.erase M.v2).erase M.v3 at hx
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
  · change x ∈ (CP.C2.erase M.v3).erase M.v1 at hx
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
  · change x ∈ (CP.C3.erase M.v1).erase M.v2 at hx
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)

theorem not_mem_verts_of_mem_capInteriorAt {A : Finset ℝ²}
    {M : MoserTriangle A} (CP : CapTriple A M) {i : Fin 3} {x : ℝ²}
    (hx : x ∈ capInteriorAt CP i) :
    x ∉ M.verts := by
  fin_cases i
  · change x ∈ (CP.C1.erase M.v2).erase M.v3 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    simp only [MoserTriangle.verts, Finset.mem_insert,
      Finset.mem_singleton]
    rintro (rfl | rfl | rfl)
    · exact CP.v1_notin_C1 hx.2.2
    · exact hx.2.1 rfl
    · exact hx.1 rfl
  · change x ∈ (CP.C2.erase M.v3).erase M.v1 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    simp only [MoserTriangle.verts, Finset.mem_insert,
      Finset.mem_singleton]
    rintro (rfl | rfl | rfl)
    · exact hx.1 rfl
    · exact CP.v2_notin_C2 hx.2.2
    · exact hx.2.1 rfl
  · change x ∈ (CP.C3.erase M.v1).erase M.v2 at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    simp only [MoserTriangle.verts, Finset.mem_insert,
      Finset.mem_singleton]
    rintro (rfl | rfl | rfl)
    · exact hx.2.1 rfl
    · exact hx.1 rfl
    · exact CP.v3_notin_C3 hx.2.2

theorem not_mem_capAt_of_mem_capInteriorAt_of_ne {A : Finset ℝ²}
    {M : MoserTriangle A} (CP : CapTriple A M) {i j : Fin 3}
    (hji : j ≠ i) {x : ℝ²} (hx : x ∈ capInteriorAt CP i) :
    x ∉ CP.capAt j := by
  have hxA : x ∈ A := capInteriorAt_subset CP i hx
  have hxVerts : x ∉ M.verts := not_mem_verts_of_mem_capInteriorAt CP hx
  have hxI : x ∈ CP.capAt i := capInteriorAt_subset_capAt CP i hx
  have hone := CP.nonmoser_in_one x hxA hxVerts
  intro hxJ
  fin_cases i <;> fin_cases j
  · exact (hji rfl).elim
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · exact (hji rfl).elim
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · simp only [CapTriple.capAt] at hxI hxJ
    simp only [if_pos hxI, if_pos hxJ] at hone
    omega
  · exact (hji rfl).elim

theorem capInteriorAt_disjoint_of_ne {A : Finset ℝ²}
    {M : MoserTriangle A} (CP : CapTriple A M) {i j : Fin 3}
    (hij : i ≠ j) :
    Disjoint (capInteriorAt CP i) (capInteriorAt CP j) := by
  rw [Finset.disjoint_left]
  intro x hxi hxj
  exact not_mem_capAt_of_mem_capInteriorAt_of_ne CP hij.symm hxi
    (capInteriorAt_subset_capAt CP j hxj)

/-- Canonical Census554 label blocks for the three strict cap interiors. -/
def capSInteriorLabels : Finset (Fin 11) := {3, 4, 5}

def capO1InteriorLabels : Finset (Fin 11) := {6, 7, 8}

def capO2InteriorLabels : Finset (Fin 11) := {9, 10}

/-- Decomposition of the eleven labels into the three apices followed by
strict-interior blocks of sizes `3`, `3`, and `2`. -/
abbrev Card11LabelPart := Fin 3 ⊕ (Fin 3 ⊕ (Fin 3 ⊕ Fin 2))

def card11LabelSplit : Fin 11 ≃ Card11LabelPart :=
  (finSumFinEquiv : Fin 3 ⊕ Fin 8 ≃ Fin 11).symm |>.trans
    (Equiv.sumCongr (Equiv.refl (Fin 3))
      ((finSumFinEquiv : Fin 3 ⊕ Fin 5 ≃ Fin 8).symm |>.trans
        (Equiv.sumCongr (Equiv.refl (Fin 3))
          (finSumFinEquiv : Fin 3 ⊕ Fin 2 ≃ Fin 5).symm)))

@[simp] theorem card11LabelSplit_zero :
    card11LabelSplit 0 = Sum.inl 0 := by decide

@[simp] theorem card11LabelSplit_one :
    card11LabelSplit 1 = Sum.inl 1 := by decide

@[simp] theorem card11LabelSplit_two :
    card11LabelSplit 2 = Sum.inl 2 := by decide

@[simp] theorem card11LabelSplit_three :
    card11LabelSplit 3 = Sum.inr (Sum.inl 0) := by decide

@[simp] theorem card11LabelSplit_four :
    card11LabelSplit 4 = Sum.inr (Sum.inl 1) := by decide

@[simp] theorem card11LabelSplit_five :
    card11LabelSplit 5 = Sum.inr (Sum.inl 2) := by decide

@[simp] theorem card11LabelSplit_six :
    card11LabelSplit 6 = Sum.inr (Sum.inr (Sum.inl 0)) := by decide

@[simp] theorem card11LabelSplit_seven :
    card11LabelSplit 7 = Sum.inr (Sum.inr (Sum.inl 1)) := by decide

@[simp] theorem card11LabelSplit_eight :
    card11LabelSplit 8 = Sum.inr (Sum.inr (Sum.inl 2)) := by decide

@[simp] theorem card11LabelSplit_nine :
    card11LabelSplit 9 = Sum.inr (Sum.inr (Sum.inr 0)) := by decide

@[simp] theorem card11LabelSplit_ten :
    card11LabelSplit 10 = Sum.inr (Sum.inr (Sum.inr 1)) := by decide

/-- Labels assigned by `L` to the strict interior of cap `i`. -/
noncomputable def interiorLabels {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) (CP : CapTriple A M)
    (i : Fin 3) : Finset (Fin 11) :=
  L.labelsOf (U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt CP i)

theorem image_interiorLabels_eq {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) (CP : CapTriple A M) (i : Fin 3) :
    (L.interiorLabels CP i).image L.pointOf =
      U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt CP i :=
  L.image_labelsOf_eq (capInteriorAt_subset CP i)

theorem interiorLabels_card_eq {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) (CP : CapTriple A M) (i : Fin 3) :
    (L.interiorLabels CP i).card =
      (U1LargeCapRouteBTailMetricResidualTarget.capInteriorAt CP i).card :=
  L.labelsOf_card_eq (capInteriorAt_subset CP i)

/-- In the card-11 two-large-cap branch, the labeling restricts bijectively to
strict cap interiors with label counts `(3,3,2)`. -/
theorem interiorLabels_card_eq_332_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : MultiCenter.JointCapIndexFrame surplus second)
    (L : Card11Labeling M frame)
    (hsurplus : 4 < (CP.capAt surplus).card)
    (hsecond5 : 5 ≤ (CP.capAt second).card)
    (hcard11 : D.A.card = 11) :
    (L.interiorLabels CP surplus).card = 3 ∧
      (L.interiorLabels CP second).card = 3 ∧
        (L.interiorLabels CP frame.rest).card = 2 := by
  have hprofile :=
    capInteriorProfile_eq_332_of_card_eq_eleven
      MT hCirc CP hM hsecond hsurplus hsecond5 hcard11
  refine ⟨?_, ?_, ?_⟩
  · rw [L.interiorLabels_card_eq CP]
    exact hprofile.1
  · rw [L.interiorLabels_card_eq CP]
    exact hprofile.2.1
  · rw [L.interiorLabels_card_eq CP]
    exact hprofile.2.2 frame.rest frame.rest_ne_surplus
      frame.rest_ne_second

end Card11Labeling

/-- A card-11 labeling whose canonical interior label blocks map exactly to
the strict interiors of the surplus, second, and remaining caps. -/
structure Card11CapLabeling {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {surplus second : Fin 3}
    (frame : MultiCenter.JointCapIndexFrame surplus second)
    extends Card11Labeling M frame where
  surplusInterior_eq :
    toCard11Labeling.interiorLabels CP surplus =
      Card11Labeling.capSInteriorLabels
  secondInterior_eq :
    toCard11Labeling.interiorLabels CP second =
      Card11Labeling.capO1InteriorLabels
  restInterior_eq :
    toCard11Labeling.interiorLabels CP frame.rest =
      Card11Labeling.capO2InteriorLabels

namespace Card11CapLabeling

open Card11Labeling

/-- Assemble a cap-aware card-11 labeling from the exact strict-interior
cardinalities. -/
theorem nonempty_of_interior_card_eq
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : MultiCenter.JointCapIndexFrame surplus second)
    (hcard : A.card = 11)
    (hSurplus : (capInteriorAt CP surplus).card = 3)
    (hSecond : (capInteriorAt CP second).card = 3)
    (hRest : (capInteriorAt CP frame.rest).card = 2) :
    Nonempty (Card11CapLabeling CP frame) := by
  classical
  let eSurplus : Fin 3 ≃ capInteriorAt CP surplus :=
    (Finset.equivFinOfCardEq hSurplus).symm
  let eSecond : Fin 3 ≃ capInteriorAt CP second :=
    (Finset.equivFinOfCardEq hSecond).symm
  let eRest : Fin 2 ≃ capInteriorAt CP frame.rest :=
    (Finset.equivFinOfCardEq hRest).symm
  let head : Fin 3 → ℝ² := fun i => apexAt M (frameIndex frame i)
  let partPoint : Card11LabelPart → ℝ²
    | Sum.inl i => head i
    | Sum.inr (Sum.inl i) => eSurplus i
    | Sum.inr (Sum.inr (Sum.inl i)) => eSecond i
    | Sum.inr (Sum.inr (Sum.inr i)) => eRest i
  let pointOf : Fin 11 → ℝ² := fun p => partPoint (card11LabelSplit p)
  have hhead : Function.Injective head :=
    (apexAt_injective M).comp (frameIndex_injective hsecond frame)
  have hSurplusSecond :
      Disjoint (capInteriorAt CP surplus) (capInteriorAt CP second) :=
    Card11Labeling.capInteriorAt_disjoint_of_ne CP hsecond.symm
  have hSurplusRest :
      Disjoint (capInteriorAt CP surplus) (capInteriorAt CP frame.rest) :=
    Card11Labeling.capInteriorAt_disjoint_of_ne CP
      frame.rest_ne_surplus.symm
  have hSecondRest :
      Disjoint (capInteriorAt CP second) (capInteriorAt CP frame.rest) :=
    Card11Labeling.capInteriorAt_disjoint_of_ne CP
      frame.rest_ne_second.symm
  have hpart : Function.Injective partPoint := by
    intro a b hab
    rcases a with i | a
    · rcases b with j | b
      · exact congrArg Sum.inl (hhead hab)
      · rcases b with j | b
        · exfalso
          change head i = (eSurplus j : ℝ²) at hab
          have hmem : head i ∈ M.verts :=
            apexAt_mem_verts M (frameIndex frame i)
          exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
            (eSurplus j).property) (hab ▸ hmem)
        · rcases b with j | j
          · exfalso
            change head i = (eSecond j : ℝ²) at hab
            have hmem : head i ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame i)
            exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
              (eSecond j).property) (hab ▸ hmem)
          · exfalso
            change head i = (eRest j : ℝ²) at hab
            have hmem : head i ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame i)
            exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
              (eRest j).property) (hab ▸ hmem)
    · rcases a with i | a
      · rcases b with j | b
        · exfalso
          change (eSurplus i : ℝ²) = head j at hab
          have hmem : head j ∈ M.verts :=
            apexAt_mem_verts M (frameIndex frame j)
          exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
            (eSurplus i).property) (hab.symm ▸ hmem)
        · rcases b with j | b
          · exact congrArg (fun k => Sum.inr (Sum.inl k))
              (eSurplus.injective (Subtype.ext hab))
          · rcases b with j | j
            · exfalso
              change (eSurplus i : ℝ²) = (eSecond j : ℝ²) at hab
              exact Finset.disjoint_left.mp hSurplusSecond
                (eSurplus i).property (hab ▸ (eSecond j).property)
            · exfalso
              change (eSurplus i : ℝ²) = (eRest j : ℝ²) at hab
              exact Finset.disjoint_left.mp hSurplusRest
                (eSurplus i).property (hab ▸ (eRest j).property)
      · rcases a with i | i
        · rcases b with j | b
          · exfalso
            change (eSecond i : ℝ²) = head j at hab
            have hmem : head j ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame j)
            exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
              (eSecond i).property) (hab.symm ▸ hmem)
          · rcases b with j | b
            · exfalso
              change (eSecond i : ℝ²) = (eSurplus j : ℝ²) at hab
              exact Finset.disjoint_left.mp hSurplusSecond.symm
                (eSecond i).property (hab ▸ (eSurplus j).property)
            · rcases b with j | j
              · exact congrArg (fun k => Sum.inr (Sum.inr (Sum.inl k)))
                  (eSecond.injective (Subtype.ext hab))
              · exfalso
                change (eSecond i : ℝ²) = (eRest j : ℝ²) at hab
                exact Finset.disjoint_left.mp hSecondRest
                  (eSecond i).property (hab ▸ (eRest j).property)
        · rcases b with j | b
          · exfalso
            change (eRest i : ℝ²) = head j at hab
            have hmem : head j ∈ M.verts :=
              apexAt_mem_verts M (frameIndex frame j)
            exact (Card11Labeling.not_mem_verts_of_mem_capInteriorAt CP
              (eRest i).property) (hab.symm ▸ hmem)
          · rcases b with j | b
            · exfalso
              change (eRest i : ℝ²) = (eSurplus j : ℝ²) at hab
              exact Finset.disjoint_left.mp hSurplusRest.symm
                (eRest i).property (hab ▸ (eSurplus j).property)
            · rcases b with j | j
              · exfalso
                change (eRest i : ℝ²) = (eSecond j : ℝ²) at hab
                exact Finset.disjoint_left.mp hSecondRest.symm
                  (eRest i).property (hab ▸ (eSecond j).property)
              · exact congrArg (fun k => Sum.inr (Sum.inr (Sum.inr k)))
                  (eRest.injective (Subtype.ext hab))
  have hpoint : Function.Injective pointOf :=
    hpart.comp card11LabelSplit.injective
  have hmem : ∀ p, pointOf p ∈ A := by
    intro p
    cases hsplit : card11LabelSplit p with
    | inl i =>
        change partPoint (card11LabelSplit p) ∈ A
        rw [hsplit]
        exact apexAt_mem M (frameIndex frame i)
    | inr tail =>
        cases tail with
        | inl i =>
            change partPoint (card11LabelSplit p) ∈ A
            rw [hsplit]
            exact Card11Labeling.capInteriorAt_subset CP surplus
              (eSurplus i).property
        | inr tail =>
            cases tail with
            | inl i =>
                change partPoint (card11LabelSplit p) ∈ A
                rw [hsplit]
                exact Card11Labeling.capInteriorAt_subset CP second
                  (eSecond i).property
            | inr i =>
                change partPoint (card11LabelSplit p) ∈ A
                rw [hsplit]
                exact Card11Labeling.capInteriorAt_subset CP frame.rest
                  (eRest i).property
  have himageSubset : Finset.univ.image pointOf ⊆ A := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨p, _hp, rfl⟩
    exact hmem p
  have himageCard : (Finset.univ.image pointOf).card = 11 := by
    rw [Finset.card_image_of_injective _ hpoint, Finset.card_univ,
      Fintype.card_fin]
  have himageEq : Finset.univ.image pointOf = A := by
    apply Finset.eq_of_subset_of_card_le himageSubset
    rw [himageCard, hcard]
  have hsurj : ∀ x ∈ A, ∃ p, pointOf p = x := by
    intro x hx
    have hxImage : x ∈ Finset.univ.image pointOf := himageEq.symm ▸ hx
    rcases Finset.mem_image.mp hxImage with ⟨p, _hp, hp⟩
    exact ⟨p, hp⟩
  have hzero : pointOf 0 = apexAt M surplus := by
    change partPoint (card11LabelSplit 0) = apexAt M surplus
    rw [Card11Labeling.card11LabelSplit_zero]
    rfl
  have hone : pointOf 1 = apexAt M second := by
    change partPoint (card11LabelSplit 1) = apexAt M second
    rw [Card11Labeling.card11LabelSplit_one]
    rfl
  have htwo : pointOf 2 = apexAt M frame.rest := by
    change partPoint (card11LabelSplit 2) = apexAt M frame.rest
    rw [Card11Labeling.card11LabelSplit_two]
    rfl
  let L : Card11Labeling M frame :=
    { pointOf := pointOf
      injective := hpoint
      mem_carrier := hmem
      carrier_surjective := hsurj
      point_zero := hzero
      point_one := hone
      point_two := htwo }
  have hSurplusSubset :
      Card11Labeling.capSInteriorLabels ⊆
        L.interiorLabels CP surplus := by
    intro p hp
    simp only [Card11Labeling.capSInteriorLabels, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 3) ∈ capInteriorAt CP surplus
      rw [Card11Labeling.card11LabelSplit_three]
      exact (eSurplus 0).property
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 4) ∈ capInteriorAt CP surplus
      rw [Card11Labeling.card11LabelSplit_four]
      exact (eSurplus 1).property
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 5) ∈ capInteriorAt CP surplus
      rw [Card11Labeling.card11LabelSplit_five]
      exact (eSurplus 2).property
  have hSecondSubset :
      Card11Labeling.capO1InteriorLabels ⊆
        L.interiorLabels CP second := by
    intro p hp
    simp only [Card11Labeling.capO1InteriorLabels, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 6) ∈ capInteriorAt CP second
      rw [Card11Labeling.card11LabelSplit_six]
      exact (eSecond 0).property
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 7) ∈ capInteriorAt CP second
      rw [Card11Labeling.card11LabelSplit_seven]
      exact (eSecond 1).property
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 8) ∈ capInteriorAt CP second
      rw [Card11Labeling.card11LabelSplit_eight]
      exact (eSecond 2).property
  have hRestSubset :
      Card11Labeling.capO2InteriorLabels ⊆
        L.interiorLabels CP frame.rest := by
    intro p hp
    simp only [Card11Labeling.capO2InteriorLabels, Finset.mem_insert,
      Finset.mem_singleton] at hp
    rcases hp with rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 9) ∈ capInteriorAt CP frame.rest
      rw [Card11Labeling.card11LabelSplit_nine]
      exact (eRest 0).property
    · apply (Card11Labeling.mem_labelsOf L).mpr
      change partPoint (card11LabelSplit 10) ∈ capInteriorAt CP frame.rest
      rw [Card11Labeling.card11LabelSplit_ten]
      exact (eRest 1).property
  have hSurplusEq :
      L.interiorLabels CP surplus =
        Card11Labeling.capSInteriorLabels := by
    symm
    apply Finset.eq_of_subset_of_card_le hSurplusSubset
    rw [L.interiorLabels_card_eq CP, hSurplus]
    decide
  have hSecondEq :
      L.interiorLabels CP second =
        Card11Labeling.capO1InteriorLabels := by
    symm
    apply Finset.eq_of_subset_of_card_le hSecondSubset
    rw [L.interiorLabels_card_eq CP, hSecond]
    decide
  have hRestEq :
      L.interiorLabels CP frame.rest =
        Card11Labeling.capO2InteriorLabels := by
    symm
    apply Finset.eq_of_subset_of_card_le hRestSubset
    rw [L.interiorLabels_card_eq CP, hRest]
    decide
  exact ⟨{
    toCard11Labeling := L
    surplusInterior_eq := hSurplusEq
    secondInterior_eq := hSecondEq
    restInterior_eq := hRestEq }
  ⟩

/-- The exact card-11 `(5,5,4)` profile constructs the cap-aware canonical
labeling required by the finite census. -/
theorem nonempty_of_card_eq_eleven
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    {surplus second : Fin 3} (hsecond : second ≠ surplus)
    (frame : MultiCenter.JointCapIndexFrame surplus second)
    (hsurplus : 4 < (CP.capAt surplus).card)
    (hsecond5 : 5 ≤ (CP.capAt second).card)
    (hcard11 : D.A.card = 11) :
    Nonempty (Card11CapLabeling CP frame) := by
  have hprofile :=
    capInteriorProfile_eq_332_of_card_eq_eleven
      MT hCirc CP hM hsecond hsurplus hsecond5 hcard11
  exact nonempty_of_interior_card_eq CP hsecond frame hcard11
    hprofile.1 hprofile.2.1
    (hprofile.2.2 frame.rest frame.rest_ne_surplus frame.rest_ne_second)

end Card11CapLabeling

namespace Card11CapLabeling

theorem labelsOf_surplusCap_eq_capS
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) (hsecond : second ≠ surplus)
    (hcap : (CP.capAt surplus).card = 5) :
    L.toCard11Labeling.labelsOf (CP.capAt surplus) = capS := by
  have hsub : capS ⊆ L.toCard11Labeling.labelsOf (CP.capAt surplus) := by
    intro p hp
    simp only [capS, Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_one]
      exact apexAt_mem_capAt_of_ne CP hsecond
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_two]
      exact apexAt_mem_capAt_of_ne CP
        frame.rest_ne_surplus
    · have hp : (3 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP surplus := by
        rw [L.surplusInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP surplus
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
    · have hp : (4 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP surplus := by
        rw [L.surplusInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP surplus
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
    · have hp : (5 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP surplus := by
        rw [L.surplusInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP surplus
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
  symm
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Card11Labeling.labelsOf_card_eq L.toCard11Labeling
    (CP.capAt_subset_A surplus), hcap]
  decide

theorem labelsOf_secondCap_eq_capO1
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) (hsecond : second ≠ surplus)
    (hcap : (CP.capAt second).card = 5) :
    L.toCard11Labeling.labelsOf (CP.capAt second) = capO1 := by
  have hsub : capO1 ⊆ L.toCard11Labeling.labelsOf (CP.capAt second) := by
    intro p hp
    simp only [capO1, Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_zero]
      exact apexAt_mem_capAt_of_ne CP hsecond.symm
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_two]
      exact apexAt_mem_capAt_of_ne CP
        frame.rest_ne_second
    · have hp : (6 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP second := by
        rw [L.secondInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP second
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
    · have hp : (7 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP second := by
        rw [L.secondInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP second
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
    · have hp : (8 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP second := by
        rw [L.secondInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP second
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
  symm
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Card11Labeling.labelsOf_card_eq L.toCard11Labeling
    (CP.capAt_subset_A second), hcap]
  decide

theorem labelsOf_restCap_eq_capO2
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame)
    (hcap : (CP.capAt frame.rest).card = 4) :
    L.toCard11Labeling.labelsOf (CP.capAt frame.rest) = capO2 := by
  have hsub : capO2 ⊆ L.toCard11Labeling.labelsOf (CP.capAt frame.rest) := by
    intro p hp
    simp only [capO2, Finset.mem_insert, Finset.mem_singleton] at hp
    rcases hp with rfl | rfl | rfl | rfl
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_zero]
      exact apexAt_mem_capAt_of_ne CP
        frame.rest_ne_surplus.symm
    · apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
      rw [L.point_one]
      exact apexAt_mem_capAt_of_ne CP
        frame.rest_ne_second.symm
    · have hp : (9 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP frame.rest := by
        rw [L.restInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP frame.rest
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
    · have hp : (10 : Fin 11) ∈
          L.toCard11Labeling.interiorLabels CP frame.rest := by
        rw [L.restInterior_eq]
        decide
      exact (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
        (Card11Labeling.capInteriorAt_subset_capAt CP frame.rest
          ((Card11Labeling.mem_labelsOf L.toCard11Labeling).mp hp))
  symm
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Card11Labeling.labelsOf_card_eq L.toCard11Labeling
    (CP.capAt_subset_A frame.rest), hcap]
  decide

end Card11CapLabeling

/-- One selected four-point same-radius class at every center of a canonical
card-11 cap labeling. -/
structure Card11SelectedCube {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame) where
  classAt : ∀ p, SelectedFourClass A (L.pointOf p)

namespace Card11SelectedCube

/-- Global `K4` chooses one selected four-class at every labeled center. -/
noncomputable def ofGlobalK4
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11CapLabeling CP frame)
    (hK4 : HasNEquidistantProperty 4 A) :
    Card11SelectedCube L where
  classAt := fun p =>
    Classical.choice
      (exists_selectedFourClass_of_globalK4 hK4 (L.mem_carrier p))

/-- Pull each geometric support back through the carrier labeling. -/
noncomputable def cube
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) : Cube := fun p =>
  L.toCard11Labeling.labelsOf (S.classAt p).support

theorem mem_cube_iff
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) {p q : Fin 11} :
    q ∈ S.cube p ↔ L.pointOf q ∈ (S.classAt p).support :=
  Card11Labeling.mem_labelsOf L.toCard11Labeling

theorem image_cube_eq_support
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) (p : Fin 11) :
    (S.cube p).image L.pointOf = (S.classAt p).support :=
  Card11Labeling.image_labelsOf_eq L.toCard11Labeling
    (S.classAt p).support_subset_A

theorem cube_card
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) (p : Fin 11) :
    (S.cube p).card = 4 := by
  rw [cube, Card11Labeling.labelsOf_card_eq L.toCard11Labeling
    (S.classAt p).support_subset_A, (S.classAt p).support_card]

theorem center_not_mem_cube
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) (p : Fin 11) :
    p ∉ S.cube p := by
  intro hp
  exact (S.classAt p).center_not_mem ((S.mem_cube_iff).mp hp)

theorem cube_inter_card_le_two
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) {p q : Fin 11} (hpq : p ≠ q) :
    (S.cube p ∩ S.cube q).card ≤ 2 := by
  have hinter :
      S.cube p ∩ S.cube q =
        L.toCard11Labeling.labelsOf
          ((S.classAt p).support ∩ (S.classAt q).support) := by
    ext r
    simp only [Finset.mem_inter, S.mem_cube_iff,
      Card11Labeling.mem_labelsOf]
  rw [hinter, Card11Labeling.labelsOf_card_eq L.toCard11Labeling]
  · exact SelectedFourClass.inter_card_le_two
      (S.classAt p) (S.classAt q) (fun h => hpq (L.injective h))
  · exact fun x hx =>
      (S.classAt p).support_subset_A (Finset.mem_inter.mp hx).1

/-- Every selected cube realizes its support masks as same-radius classes. -/
theorem equidist_of_mem_cube
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L)
    (p a b : Fin 11) (ha : a ∈ S.cube p) (hb : b ∈ S.cube p) :
    dist (L.pointOf p) (L.pointOf a) =
      dist (L.pointOf p) (L.pointOf b) := by
  rw [(S.classAt p).support_eq_radius _ ((S.mem_cube_iff).mp ha),
    (S.classAt p).support_eq_radius _ ((S.mem_cube_iff).mp hb)]

theorem pair_hit_centers_card_le_two
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) (hconv : ConvexIndep A)
    {a b : Fin 11} (hab : a ≠ b) :
    ((Finset.univ : Finset (Fin 11)).filter
      fun p => a ∈ S.cube p ∧ b ∈ S.cube p).card ≤ 2 := by
  let hits : Finset (Fin 11) :=
    Finset.univ.filter fun p => a ∈ S.cube p ∧ b ∈ S.cube p
  let target : Finset ℝ² :=
    A.filter fun x => dist x (L.pointOf a) = dist x (L.pointOf b)
  have hmaps : Set.MapsTo L.pointOf (↑hits) (↑target) := by
    intro p hp
    have hp' : a ∈ S.cube p ∧ b ∈ S.cube p := by
      simpa [hits] using hp
    exact Finset.mem_filter.mpr
      ⟨L.mem_carrier p, S.equidist_of_mem_cube p a b hp'.1 hp'.2⟩
  have hinjOn : Set.InjOn L.pointOf (↑hits) := by
    intro p _hp q _hq hpq
    exact L.injective hpq
  have hle : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn L.pointOf hmaps hinjOn
  have hpoint_ne : L.pointOf a ≠ L.pointOf b := by
    intro h
    exact hab (L.injective h)
  have htarget : target.card ≤ 2 := by
    simpa [target] using
      (Dumitrescu.perpBisector_apex_bound hconv
        (L.mem_carrier a) (L.mem_carrier b) hpoint_ne)
  change hits.card ≤ 2
  exact hle.trans htarget

theorem capByIndex_eq_capAt {A : Finset ℝ²}
    (SP : SurplusCapPacket A) (i : Fin 3) :
    SP.capByIndex i = SP.partition.capAt i := by
  fin_cases i <;> rfl

theorem apexAt_eq_oppositeVertexByIndex {A : Finset ℝ²}
    (SP : SurplusCapPacket A) (i : Fin 3) :
    apexAt SP.triangle i = SP.oppositeVertexByIndex i := by
  fin_cases i <;> rfl

/-- A selected support centered at an indexed Moser apex meets either other
closed cap in at most one point. -/
theorem support_inter_capByIndex_card_le_one
    {A : Finset ℝ²} (SP : SurplusCapPacket A)
    (hconv : ConvexIndep A) {center : ℝ²}
    (K : SelectedFourClass A center) {i j : Fin 3} (hji : j ≠ i)
    (hcenter : center = SP.oppositeVertexByIndex i) :
    (K.support ∩ SP.capByIndex j).card ≤ 1 := by
  have hsub :
      K.support ∩ SP.capByIndex j ⊆
        SelectedClass A (SP.oppositeVertexByIndex i) K.radius ∩
          SP.capByIndex j := by
    intro x hx
    rw [Finset.mem_inter] at hx ⊢
    refine ⟨?_, hx.2⟩
    rw [mem_selectedClass]
    refine ⟨K.support_subset_A hx.1, ?_⟩
    rw [← hcenter]
    exact K.support_eq_radius x hx.1
  have hbound :
      (SelectedClass A (SP.oppositeVertexByIndex i) K.radius ∩
        SP.capByIndex j).card ≤ 1 := by
    fin_cases i <;> fin_cases j
    · exact (hji rfl).elim
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 0 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 0 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 1 K.radius
    · exact (hji rfl).elim
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 1 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 2 K.radius
    · simpa [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex] using
        SP.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          hconv 2 K.radius
    · exact (hji rfl).elim
  exact (Finset.card_le_card hsub).trans hbound

theorem cube_inter_labelsOf_card_eq
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) (p : Fin 11)
    (C : Finset ℝ²) (hC : C ⊆ A) :
    (S.cube p ∩ L.toCard11Labeling.labelsOf C).card =
      ((S.classAt p).support ∩ C).card := by
  have hinter :
      S.cube p ∩ L.toCard11Labeling.labelsOf C =
        L.toCard11Labeling.labelsOf ((S.classAt p).support ∩ C) := by
    ext q
    simp only [Finset.mem_inter, S.mem_cube_iff,
      Card11Labeling.mem_labelsOf]
  rw [hinter, Card11Labeling.labelsOf_card_eq L.toCard11Labeling]
  exact fun x hx => hC (Finset.mem_inter.mp hx).2

private theorem inter_erase_card_le_one
    {α : Type*} [DecidableEq α] (X Y : Finset α) (p : α)
    (h : (X ∩ Y).card ≤ 1) :
    (X ∩ Y.erase p).card ≤ 1 := by
  apply (Finset.card_le_card ?_).trans h
  intro x hx
  rw [Finset.mem_inter] at hx ⊢
  exact ⟨hx.1, Finset.mem_of_mem_erase hx.2⟩

/-- The two selected classes at the opposite apices satisfy exactly the H1
one-hit predicate used by the finite Census554 space. -/
theorem onehitOk_of_capProfile
    {A : Finset ℝ²} (SP : SurplusCapPacket A)
    (hconv : ConvexIndep A) {second : Fin 3}
    (hsecond : second ≠ SP.surplusIdx)
    (frame : MultiCenter.JointCapIndexFrame SP.surplusIdx second)
    (L : Card11CapLabeling SP.partition frame)
    (S : Card11SelectedCube L)
    (hSurplus : (SP.partition.capAt SP.surplusIdx).card = 5)
    (hSecond : (SP.partition.capAt second).card = 5)
    (hRest : (SP.partition.capAt frame.rest).card = 4) :
    ∀ p, OnehitOk p (S.cube p) := by
  intro p
  constructor
  · intro hp
    have hp1 : p = (1 : Fin 11) := by simpa [apexV] using hp
    subst p
    have hcenter : L.pointOf 1 = SP.oppositeVertexByIndex second :=
      L.point_one.trans (apexAt_eq_oppositeVertexByIndex SP second)
    have hGeomSurplus :=
      support_inter_capByIndex_card_le_one SP hconv (S.classAt 1)
        hsecond.symm hcenter
    rw [capByIndex_eq_capAt SP] at hGeomSurplus
    have hCubeSurplus : (S.cube 1 ∩ capS).card ≤ 1 := by
      rw [← L.labelsOf_surplusCap_eq_capS hsecond hSurplus,
        S.cube_inter_labelsOf_card_eq 1
          (SP.partition.capAt SP.surplusIdx)
          (SP.partition.capAt_subset_A SP.surplusIdx)]
      exact hGeomSurplus
    have hGeomRest :=
      support_inter_capByIndex_card_le_one SP hconv (S.classAt 1)
        frame.rest_ne_second hcenter
    rw [capByIndex_eq_capAt SP] at hGeomRest
    have hCubeRest : (S.cube 1 ∩ capO2).card ≤ 1 := by
      rw [← L.labelsOf_restCap_eq_capO2 hRest,
        S.cube_inter_labelsOf_card_eq 1
          (SP.partition.capAt frame.rest)
          (SP.partition.capAt_subset_A frame.rest)]
      exact hGeomRest
    exact ⟨inter_erase_card_le_one _ _ apexV hCubeSurplus,
      inter_erase_card_le_one _ _ apexV hCubeRest⟩
  · intro hp
    have hp2 : p = (2 : Fin 11) := by simpa [apexW] using hp
    subst p
    have hcenter : L.pointOf 2 = SP.oppositeVertexByIndex frame.rest :=
      L.point_two.trans (apexAt_eq_oppositeVertexByIndex SP frame.rest)
    have hGeomSurplus :=
      support_inter_capByIndex_card_le_one SP hconv (S.classAt 2)
        frame.rest_ne_surplus.symm hcenter
    rw [capByIndex_eq_capAt SP] at hGeomSurplus
    have hCubeSurplus : (S.cube 2 ∩ capS).card ≤ 1 := by
      rw [← L.labelsOf_surplusCap_eq_capS hsecond hSurplus,
        S.cube_inter_labelsOf_card_eq 2
          (SP.partition.capAt SP.surplusIdx)
          (SP.partition.capAt_subset_A SP.surplusIdx)]
      exact hGeomSurplus
    have hGeomSecond :=
      support_inter_capByIndex_card_le_one SP hconv (S.classAt 2)
        frame.rest_ne_second.symm hcenter
    rw [capByIndex_eq_capAt SP] at hGeomSecond
    have hCubeSecond : (S.cube 2 ∩ capO1).card ≤ 1 := by
      rw [← L.labelsOf_secondCap_eq_capO1 hsecond hSecond,
        S.cube_inter_labelsOf_card_eq 2
          (SP.partition.capAt second)
          (SP.partition.capAt_subset_A second)]
      exact hGeomSecond
    exact ⟨inter_erase_card_le_one _ _ apexW hCubeSurplus,
      inter_erase_card_le_one _ _ apexW hCubeSecond⟩

/-- The selected geometric cube satisfies the complete finite Census554
predicate: C1, H1, C2, and C4. -/
theorem cubeOk
    {A : Finset ℝ²} (SP : SurplusCapPacket A)
    (hconv : ConvexIndep A) {second : Fin 3}
    (hsecond : second ≠ SP.surplusIdx)
    (frame : MultiCenter.JointCapIndexFrame SP.surplusIdx second)
    (L : Card11CapLabeling SP.partition frame)
    (S : Card11SelectedCube L)
    (hSurplus : (SP.partition.capAt SP.surplusIdx).card = 5)
    (hSecond : (SP.partition.capAt second).card = 5)
    (hRest : (SP.partition.capAt frame.rest).card = 4) :
    CubeOk S.cube := by
  have honehit := S.onehitOk_of_capProfile SP hconv hsecond frame L
    hSurplus hSecond hRest
  refine ⟨?_, ?_, ?_⟩
  · intro p
    exact ⟨S.cube_card p, S.center_not_mem_cube p, honehit p⟩
  · intro p q hpq
    exact S.cube_inter_card_le_two hpq
  · intro a b hab
    exact S.pair_hit_centers_card_le_two hconv hab

end Card11SelectedCube

/-- The geometric card-11 two-large-cap branch produces a canonical selected
cube satisfying every finite Census554 constraint. -/
theorem exists_card11SelectedCube_cubeOk
    {D : CounterexampleData}
    (SP : SurplusCapPacket D.A) {second : Fin 3}
    (hsecond : second ≠ SP.surplusIdx)
    (hsecond5 : 5 ≤ (SP.partition.capAt second).card)
    (hcard11 : D.A.card = 11) :
    ∃ frame : MultiCenter.JointCapIndexFrame SP.surplusIdx second,
      ∃ L : Card11CapLabeling SP.partition frame,
        ∃ S : Card11SelectedCube L, CubeOk S.cube := by
  let frame := Classical.choice
    (MultiCenter.JointCapIndexFrame.nonempty_of_ne hsecond)
  have hprofile :=
    capProfile_eq_554_of_card_eq_eleven
      SP.triangleNonObtuse SP.hCirc SP.partition rfl hsecond
      SP.surplus hsecond5 hcard11
  rcases Card11CapLabeling.nonempty_of_card_eq_eleven
      SP.triangleNonObtuse SP.hCirc SP.partition rfl hsecond frame
      SP.surplus hsecond5 hcard11 with ⟨L⟩
  let S : Card11SelectedCube L :=
    Card11SelectedCube.ofGlobalK4 L D.K4
  refine ⟨frame, L, S, ?_⟩
  exact S.cubeOk SP D.convex hsecond frame L hprofile.1 hprofile.2.1
    (hprofile.2.2 frame.rest frame.rest_ne_surplus
      frame.rest_ne_second)

/-- If two distinct caps have at least five points and the remaining cap has
the generic four-point lower bound, then the cap-sum identity forces the
ambient carrier to have at least eleven points. -/
theorem card_ge_eleven_of_twoLargeCaps
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card) :
    11 ≤ A.card := by
  have hlower :
      4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      CP hconv hnoncol hK4 P
  have hi5 : 5 ≤ (CP.capAt i).card := by omega
  have hsum := CP.cap_sum_identity
  fin_cases i <;> fin_cases j <;>
    simp_all [CapTriple.capAt] <;> omega

end Census554
end Problem97
