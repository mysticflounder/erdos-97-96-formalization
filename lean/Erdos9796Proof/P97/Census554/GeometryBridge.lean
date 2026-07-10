/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1OppositeCapLowerBounds
import Erdos9796Proof.P97.MultiCenter.CapProfile

/-!
# Census554 geometry bridge

Bank-independent cardinality facts used to isolate the card-11 branch before
constructing a Census554 cube. The theorem in this file does not consume any
finite-census result or any open Front-A leaf.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

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

end Card11Labeling

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
