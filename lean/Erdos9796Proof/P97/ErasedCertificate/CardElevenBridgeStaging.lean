/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.BridgeCarrier
import Erdos9796Proof.P97.WitnessPacketInterface

/-!
# ERASE card-eleven bridge staging

Geometry-to-`Fin 11` transport shared by the twenty ERASE row residuals and
the two ERASE P4 residuals.  This module is independent of the native
classifier verdict: it constructs a faithful carrier pattern with the erased
pin's exact four-class prescribed at its canonical center and transports row
intersections back to geometric selected-class intersections.
-/

namespace Problem97

open scoped EuclideanGeometry InnerProductSpace

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedGeometry
open Census554.CapSelectedCarrierBridge

namespace ErasedCertificate

/-- A first-opposite-cap exact count row with total four reconstructs the
erased-pin triple needed by the carrier prescription. -/
theorem erasedPinTriple_of_rightCountRow
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    {m s l r : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) = r)
    (hsum : m + s + l + r = 4) :
    ErasedPinTriple A x p := by
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex1)
  have hradius : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have hcard : (SelectedClass A p (dist p x)).card = 4 := by
    rw [S.selectedClass_card_eq_groupSum S.oppIndex1 hradius,
      hm, hs, hl, hr, hsum]
  exact erasedPinTriple_of_exact_erased_pin hradius hcard
    (mem_selectedClass.mpr ⟨hxA, rfl⟩)

/-- A second-opposite-cap exact count row with total four reconstructs the
erased-pin triple needed by the carrier prescription. -/
theorem erasedPinTriple_of_leftCountRow
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x p : ℝ²}
    {m s l r : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = r)
    (hsum : m + s + l + r = 4) :
    ErasedPinTriple A x p := by
  have hp_ne_x : p ≠ x :=
    S.capInteriorByIndex_ne_of_mem_of_mem_ne hp hx
      (Ne.symm S.surplusIdx_ne_oppIndex2)
  have hradius : 0 < dist p x := dist_pos.mpr hp_ne_x
  have hxA : x ∈ A :=
    S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hx)
  have hcard : (SelectedClass A p (dist p x)).card = 4 := by
    rw [S.selectedClass_card_eq_groupSum S.oppIndex2 hradius,
      hm, hs, hl, hr, hsum]
  exact erasedPinTriple_of_exact_erased_pin hradius hcard
    (mem_selectedClass.mpr ⟨hxA, rfl⟩)

/-- The canonical labels of the three Moser vertices are exactly
`{0, 1, 2}`. -/
theorem labelsOf_triangle_verts_eq_moser
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) :
    L.toCard11Labeling.labelsOf S.triangle.verts = moser := by
  apply Finset.eq_of_subset_of_card_le
  · intro label hlabel
    rw [L.toCard11Labeling.mem_labelsOf] at hlabel
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hlabel with
      hzero | hone | htwo
    · have : label = 0 :=
        L.injective (hzero.trans L.point_zero_eq_opposite.symm)
      subst label
      simp [moser]
    · have : label = 1 :=
        L.injective (hone.trans L.point_one_eq_opposite.symm)
      subst label
      simp [moser]
    · have : label = 2 :=
        L.injective (htwo.trans L.point_two_eq_opposite.symm)
      subst label
      simp [moser]
  · rw [L.toCard11Labeling.labelsOf_card_eq S.triangle.verts_subset,
      S.triangle.verts_card]
    decide

/-- Transport a prescribed support equation from a geometric center to its
canonical label. -/
theorem classAt_support_at_labelOf
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    (F.classAt (L.pointOf (L.labelOf p))
      (L.mem_carrier (L.labelOf p))).support =
        SelectedClass A p (dist p x) := by
  have gen : ∀ (z : ℝ²) (hz : z ∈ A), z = p →
      (F.classAt z hz).support = SelectedClass A p (dist p x) := by
    intro z hz hzp
    subst z
    exact hF hz
  exact gen _ _ (L.pointOf_labelOf hpA)

/-- Support-only form of `classAt_support_at_labelOf`, for prescribed rows
whose target class is not presented with radius `dist p x`. -/
theorem classAt_support_at_labelOf_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {p : ℝ²} (hpA : p ∈ A) (C : Finset ℝ²)
    (hF : ∀ hp' : p ∈ A, (F.classAt p hp').support = C) :
    (F.classAt (L.pointOf (L.labelOf p))
      (L.mem_carrier (L.labelOf p))).support = C := by
  have gen : ∀ (z : ℝ²) (hz : z ∈ A), z = p →
      (F.classAt z hz).support = C := by
    intro z hz hzp
    subst z
    exact hF hz
  exact gen _ _ (L.pointOf_labelOf hpA)

/-- Global K4 preserves three selected four-classes at pairwise distinct
centers in one faithful carrier pattern. -/
theorem exists_faithfulCarrierPattern_with_three_classes
    {A : Finset ℝ²} {c₁ c₂ c₃ : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hc₁ : c₁ ∈ A) (_hc₂ : c₂ ∈ A) (_hc₃ : c₃ ∈ A)
    (hc₁₂ : c₁ ≠ c₂) (hc₁₃ : c₁ ≠ c₃) (hc₂₃ : c₂ ≠ c₃)
    (K₁ : SelectedFourClass A c₁)
    (K₂ : SelectedFourClass A c₂)
    (K₃ : SelectedFourClass A c₃) :
    ∃ F : FaithfulCarrierPattern A,
      (∀ hc₁' : c₁ ∈ A, (F.classAt c₁ hc₁').support = K₁.support) ∧
      (∀ hc₂' : c₂ ∈ A, (F.classAt c₂ hc₂').support = K₂.support) ∧
      (∀ hc₃' : c₃ ∈ A, (F.classAt c₃ hc₃').support = K₃.support) := by
  classical
  let classAt : ∀ c : ℝ², c ∈ A → SelectedFourClass A c :=
    fun c hc =>
      if h₁ : c = c₁ then
        h₁ ▸ K₁
      else if h₂ : c = c₂ then
        h₂ ▸ K₂
      else if h₃ : c = c₃ then
        h₃ ▸ K₃
      else
        Classical.choice (exists_selectedFourClass_of_globalK4 hK4 hc)
  have hclass₁ : ∀ hc₁' : c₁ ∈ A,
      (classAt c₁ hc₁').support = K₁.support := by
    intro hc₁'
    simp [classAt]
  have hclass₂ : ∀ hc₂' : c₂ ∈ A,
      (classAt c₂ hc₂').support = K₂.support := by
    intro hc₂'
    simp [classAt, hc₁₂.symm]
  have hclass₃ : ∀ hc₃' : c₃ ∈ A,
      (classAt c₃ hc₃').support = K₃.support := by
    intro hc₃'
    simp [classAt, hc₁₃.symm, hc₂₃.symm]
  rcases K₁.support_nonempty with ⟨q, hq⟩
  refine ⟨{
    gaugeCenter := c₁
    gaugeCenter_mem := hc₁
    classAt := classAt
    gaugeWitness := q
    gaugeWitness_mem := ?_
  }, hclass₁, hclass₂, hclass₃⟩
  rw [hclass₁ hc₁]
  exact hq

/-- In the P4-U branch, one faithful carrier can preserve the erased class at
the surplus-opposite apex together with the two exact non-surplus cap rows
forced by Moser-cap containment. -/
theorem exists_faithfulCarrierPattern_with_p4uClasses
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²} (hxA : x ∈ A)
    (htriple : ErasedPinTriple A x
      (S.oppositeVertexByIndex S.surplusIdx)) :
    ∃ F : FaithfulCarrierPattern A,
      (∀ hp' : S.oppositeVertexByIndex S.surplusIdx ∈ A,
        (F.classAt (S.oppositeVertexByIndex S.surplusIdx) hp').support =
          SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
            (dist (S.oppositeVertexByIndex S.surplusIdx) x)) ∧
      row (patternCode L F) 0 =
        L.toCard11Labeling.labelsOf
          (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
            (dist (S.oppositeVertexByIndex S.surplusIdx) x)) ∧
      row (patternCode L F) 1 = capO1 ∧
      row (patternCode L F) 2 = capO2 := by
  classical
  let p₀ := S.oppositeVertexByIndex S.surplusIdx
  let p₁ := S.oppositeVertexByIndex S.oppIndex1
  let p₂ := S.oppositeVertexByIndex S.oppIndex2
  have hp₀A : p₀ ∈ A := S.oppositeVertexByIndex_mem S.surplusIdx
  have hp₁A : p₁ ∈ A := S.oppositeVertexByIndex_mem S.oppIndex1
  have hp₂A : p₂ ∈ A := S.oppositeVertexByIndex_mem S.oppIndex2
  rcases exact_erased_pin_of_erasedPinTriple hxA htriple with
    ⟨hr₀, hcard₀, _hxClass⟩
  rcases hM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment
      hK4 hcontain with
    ⟨d, hd, _h12, _h23, _h31, hexact₁, hexact₂⟩
  have hcard₁ : (SelectedClass A p₁ d).card = 4 := by
    rw [show SelectedClass A p₁ d = S.capByIndex S.oppIndex1 by
      simpa [p₁] using hexact₁, hM44.oppIndex1_cap_card_eq_four]
  have hcard₂ : (SelectedClass A p₂ d).card = 4 := by
    rw [show SelectedClass A p₂ d = S.capByIndex S.oppIndex2 by
      simpa [p₂] using hexact₂, hM44.oppIndex2_cap_card_eq_four]
  let K₀ : SelectedFourClass A p₀ :=
    SelectedFourClass.ofSelectedClass hr₀ hcard₀
  let K₁ : SelectedFourClass A p₁ :=
    SelectedFourClass.ofSelectedClass hd hcard₁
  let K₂ : SelectedFourClass A p₂ :=
    SelectedFourClass.ofSelectedClass hd hcard₂
  obtain ⟨F, hF₀, hF₁, hF₂⟩ :=
    exists_faithfulCarrierPattern_with_three_classes hK4
      hp₀A hp₁A hp₂A
      (S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex1)
      (S.oppositeVertexByIndex_ne_of_ne S.surplusIdx_ne_oppIndex2)
      (S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2)
      K₀ K₁ K₂
  have hprescribed₀ : ∀ hp' : p₀ ∈ A,
      (F.classAt p₀ hp').support =
        SelectedClass A p₀ (dist p₀ x) := by
    intro hp'
    simpa [K₀] using hF₀ hp'
  have hrow₀ : row (patternCode L F) 0 =
      L.toCard11Labeling.labelsOf (SelectedClass A p₀ (dist p₀ x)) := by
    have hp₀label : L.labelOf p₀ = 0 := by
      rw [show p₀ = L.pointOf 0 by
        exact L.point_zero_eq_opposite.symm]
      exact L.labelOf_pointOf 0
    rw [← hp₀label, row_patternCode_eq_labelsOf,
      classAt_support_at_labelOf L F hp₀A hprescribed₀]
  have hrow₁ : row (patternCode L F) 1 = capO1 := by
    have hprescribed₁ : ∀ hp' : p₁ ∈ A,
        (F.classAt p₁ hp').support = SelectedClass A p₁ d := by
      intro hp'
      simpa [K₁] using hF₁ hp'
    have hp₁label : L.labelOf p₁ = 1 := by
      rw [show p₁ = L.pointOf 1 by exact L.point_one_eq_opposite.symm]
      exact L.labelOf_pointOf 1
    rw [← hp₁label, row_patternCode_eq_labelsOf,
      classAt_support_at_labelOf_eq L F hp₁A _ hprescribed₁]
    rw [show SelectedClass A p₁ d = S.capByIndex S.oppIndex1 by
      simpa [p₁] using hexact₁]
    exact labelsOf_oppCap1_eq_capO1 L hM44.oppIndex1_cap_card_eq_four
  have hrow₂ : row (patternCode L F) 2 = capO2 := by
    have hprescribed₂ : ∀ hp' : p₂ ∈ A,
        (F.classAt p₂ hp').support = SelectedClass A p₂ d := by
      intro hp'
      simpa [K₂] using hF₂ hp'
    have hp₂label : L.labelOf p₂ = 2 := by
      rw [show p₂ = L.pointOf 2 by exact L.point_two_eq_opposite.symm]
      exact L.labelOf_pointOf 2
    rw [← hp₂label, row_patternCode_eq_labelsOf,
      classAt_support_at_labelOf_eq L F hp₂A _ hprescribed₂]
    rw [show SelectedClass A p₂ d = S.capByIndex S.oppIndex2 by
      simpa [p₂] using hexact₂]
    exact labelsOf_oppCap2_eq_capO2 L hM44.oppIndex2_cap_card_eq_four
  refine ⟨F, ?_, ?_, hrow₁, hrow₂⟩
  · simpa [p₀] using hprescribed₀
  · simpa [p₀] using hrow₀

/-- The surplus-opposite selected row contains the two other Moser vertices
together.  This is the proof-side restriction that removes the 32 one-Moser
P4-U masks from the native gate. -/
theorem p4uRow_moserPair_of_nonSurplusMoserCapContainment
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hM44 : S.IsM44) (hcontain : S.NonSurplusMoserCapContainment)
    {x : ℝ²}
    (hrow : row (patternCode L F) 0 =
      L.toCard11Labeling.labelsOf
        (SelectedClass A (S.oppositeVertexByIndex S.surplusIdx)
          (dist (S.oppositeVertexByIndex S.surplusIdx) x))) :
    1 ∈ row (patternCode L F) 0 ↔ 2 ∈ row (patternCode L F) 0 := by
  let p₀ := S.oppositeVertexByIndex S.surplusIdx
  let p₁ := S.oppositeVertexByIndex S.oppIndex1
  let p₂ := S.oppositeVertexByIndex S.oppIndex2
  rcases hM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment
      hK4 hcontain with
    ⟨d, _hd, h12, h23, h31, _hexact₁, _hexact₂⟩
  have hp₀p₁ : dist p₀ p₁ = d := by
    rcases hi : S.surplusIdx with ⟨i, hi_lt⟩
    interval_cases i <;>
      simp [p₀, p₁, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi, dist_comm] at h12 h23 h31 ⊢ <;>
      aesop
  have hp₀p₂ : dist p₀ p₂ = d := by
    rcases hi : S.surplusIdx with ⟨i, hi_lt⟩
    interval_cases i <;>
      simp [p₀, p₂, SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex2, hi, dist_comm] at h12 h23 h31 ⊢ <;>
      aesop
  rw [hrow]
  constructor
  · intro h₁
    have hp₁Sel := L.toCard11Labeling.mem_labelsOf.mp h₁
    rw [L.point_one_eq_opposite] at hp₁Sel
    apply L.toCard11Labeling.mem_labelsOf.mpr
    rw [L.point_two_eq_opposite]
    apply mem_selectedClass.mpr
    refine ⟨S.oppositeVertexByIndex_mem S.oppIndex2, ?_⟩
    calc
      dist p₀ p₂ = d := hp₀p₂
      _ = dist p₀ p₁ := hp₀p₁.symm
      _ = dist p₀ x := (mem_selectedClass.mp hp₁Sel).2
  · intro h₂
    have hp₂Sel := L.toCard11Labeling.mem_labelsOf.mp h₂
    rw [L.point_two_eq_opposite] at hp₂Sel
    apply L.toCard11Labeling.mem_labelsOf.mpr
    rw [L.point_one_eq_opposite]
    apply mem_selectedClass.mpr
    refine ⟨S.oppositeVertexByIndex_mem S.oppIndex1, ?_⟩
    calc
      dist p₀ p₁ = d := hp₀p₁
      _ = dist p₀ p₂ := hp₀p₂.symm
      _ = dist p₀ x := (mem_selectedClass.mp hp₂Sel).2

/-- An erased-pin triple prescribes its exact selected four-class in a global
faithful carrier pattern.  The second conclusion records the pulled-back row
at the canonical label of the pin center. -/
theorem exists_faithfulCarrierPattern_with_erasedPinClass
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (hK4 : HasNEquidistantProperty 4 A)
    {x p : ℝ²} (hxA : x ∈ A) (hpA : p ∈ A)
    (htriple : ErasedPinTriple A x p) :
    ∃ F : FaithfulCarrierPattern A,
      (∀ hp' : p ∈ A,
        (F.classAt p hp').support = SelectedClass A p (dist p x)) ∧
      row (patternCode L F) (L.labelOf p) =
        L.toCard11Labeling.labelsOf (SelectedClass A p (dist p x)) := by
  rcases exact_erased_pin_of_erasedPinTriple hxA htriple with
    ⟨hradius, hcard, _hxClass⟩
  let K : SelectedFourClass A p :=
    SelectedFourClass.ofSelectedClass hradius hcard
  obtain ⟨F, hF⟩ :=
    EndpointCertificate.exists_faithfulCarrierPattern_with_class hK4 hpA K
  have hprescribed : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x) := by
    intro hp'
    simpa [K] using hF hp'
  refine ⟨F, hprescribed, ?_⟩
  · rw [row_patternCode_eq_labelsOf]
    exact congrArg L.toCard11Labeling.labelsOf
      (classAt_support_at_labelOf L F hpA hprescribed)

/-- A prescribed carrier row preserves intersection cardinality with every
geometric subset of the ambient carrier. -/
theorem prescribedErasedPinRow_inter_labelsOf_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x))
    (C : Finset ℝ²) (hC : C ⊆ A) :
    (row (patternCode L F) (L.labelOf p) ∩
        L.toCard11Labeling.labelsOf C).card =
      (SelectedClass A p (dist p x) ∩ C).card := by
  calc
    _ = ((F.classAt (L.pointOf (L.labelOf p))
          (L.mem_carrier (L.labelOf p))).support ∩ C).card :=
      row_inter_labelsOf_card_eq L F (L.labelOf p) C hC
    _ = _ := by rw [classAt_support_at_labelOf L F hpA hF]

/-- The erased point's canonical label belongs to the prescribed finite row. -/
theorem labelOf_mem_prescribedErasedPinRow
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hxA : x ∈ A) (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    L.labelOf x ∈ row (patternCode L F) (L.labelOf p) := by
  rw [mem_row_patternCode_iff, L.pointOf_labelOf hxA,
    classAt_support_at_labelOf L F hpA hF]
  exact mem_selectedClass.mpr ⟨hxA, rfl⟩

/-- Positive erased-pin radius makes the canonical center and pin labels
distinct. -/
theorem labelOf_center_ne_labelOf_pin
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {x p : ℝ²}
    (hxA : x ∈ A) (hpA : p ∈ A) (htriple : ErasedPinTriple A x p) :
    L.labelOf p ≠ L.labelOf x := by
  intro hlabel
  have hpoint := congrArg L.pointOf hlabel
  rw [L.pointOf_labelOf hpA, L.pointOf_labelOf hxA] at hpoint
  have hradius : 0 < dist p x := htriple.1
  subst x
  rw [dist_self] at hradius
  exact (lt_irrefl 0) hradius

/-- The canonical label of a surplus-interior point lies in `intS`. -/
theorem labelOf_mem_intS_of_mem_surplusInterior
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {x : ℝ²}
    (hxA : x ∈ A) (hx : x ∈ S.capInteriorByIndex S.surplusIdx) :
    L.labelOf x ∈ intS := by
  rw [mem_intS_iff_point_mem_surplusInterior, L.pointOf_labelOf hxA]
  exact hx

/-- The canonical label of a first opposite-cap interior point lies in
`intO1`. -/
theorem labelOf_mem_intO1_of_mem_oppInterior1
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {p : ℝ²}
    (hpA : p ∈ A) (hp : p ∈ S.capInteriorByIndex S.oppIndex1) :
    L.labelOf p ∈ intO1 := by
  rw [mem_intO1_iff_point_mem_oppInterior1, L.pointOf_labelOf hpA]
  exact hp

/-- The canonical label of a second opposite-cap interior point lies in
`intO2`. -/
theorem labelOf_mem_intO2_of_mem_oppInterior2
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) {p : ℝ²}
    (hpA : p ∈ A) (hp : p ∈ S.capInteriorByIndex S.oppIndex2) :
    L.labelOf p ∈ intO2 := by
  rw [mem_intO2_iff_point_mem_oppInterior2, L.pointOf_labelOf hpA]
  exact hp

/-- The finite Moser bucket count of a prescribed erased-pin row is the
geometric `moserCount`. -/
theorem prescribedErasedPinRow_moser_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    (row (patternCode L F) (L.labelOf p) ∩ moser).card =
      S.moserCount p (dist p x) := by
  rw [← labelsOf_triangle_verts_eq_moser L]
  exact prescribedErasedPinRow_inter_labelsOf_card_eq L F hpA hF
    S.triangle.verts S.triangle.verts_subset

/-- The finite surplus-interior bucket count of a prescribed row is the
corresponding geometric selected-class intersection count. -/
theorem prescribedErasedPinRow_intS_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    (row (patternCode L F) (L.labelOf p) ∩ intS).card =
      (SelectedClass A p (dist p x) ∩
        S.capInteriorByIndex S.surplusIdx).card := by
  rw [← L.surplusInterior_eq]
  exact prescribedErasedPinRow_inter_labelsOf_card_eq L F hpA hF _
    (fun _ hz => S.capByIndex_subset S.surplusIdx
      (S.capInteriorByIndex_subset_capByIndex S.surplusIdx hz))

/-- The finite first opposite-interior bucket count of a prescribed row is
the corresponding geometric selected-class intersection count. -/
theorem prescribedErasedPinRow_intO1_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    (row (patternCode L F) (L.labelOf p) ∩ intO1).card =
      (SelectedClass A p (dist p x) ∩
        S.capInteriorByIndex S.oppIndex1).card := by
  rw [← L.oppInterior1_eq]
  exact prescribedErasedPinRow_inter_labelsOf_card_eq L F hpA hF _
    (fun _ hz => S.capByIndex_subset S.oppIndex1
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hz))

/-- The finite second opposite-interior bucket count of a prescribed row is
the corresponding geometric selected-class intersection count. -/
theorem prescribedErasedPinRow_intO2_card_eq
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x)) :
    (row (patternCode L F) (L.labelOf p) ∩ intO2).card =
      (SelectedClass A p (dist p x) ∩
        S.capInteriorByIndex S.oppIndex2).card := by
  rw [← L.oppInterior2_eq]
  exact prescribedErasedPinRow_inter_labelsOf_card_eq L F hpA hF _
    (fun _ hz => S.capByIndex_subset S.oppIndex2
      (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hz))

/-- Erasing a positive-radius selected class's center from the other factor of
an intersection does not change the intersection. -/
private theorem selectedClass_inter_erase_center_eq
    {A : Finset ℝ²} {p : ℝ²} {radius : ℝ} (hradius : 0 < radius)
    (C : Finset ℝ²) :
    SelectedClass A p radius ∩ C.erase p = SelectedClass A p radius ∩ C := by
  ext q
  simp only [Finset.mem_inter, Finset.mem_erase]
  constructor
  · rintro ⟨hqClass, _hqp, hqC⟩
    exact ⟨hqClass, hqC⟩
  · rintro ⟨hqClass, hqC⟩
    refine ⟨hqClass, ?_, hqC⟩
    intro hqp
    subst q
    have hdist := (mem_selectedClass.mp hqClass).2
    rw [dist_self] at hdist
    exact hradius.ne' hdist.symm

/-- For a center in the first non-surplus interior, the finite buckets
`(moser, intO1, intO2, intS)` reproduce the geometric
`(moser, same, left, right)` counts in that order. -/
theorem prescribedErasedPinRow_rightBucketCounts
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x))
    (htriple : ErasedPinTriple A x p) :
    (row (patternCode L F) (L.labelOf p) ∩ moser).card =
        S.moserCount p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intO1).card =
        S.sameCapCount S.oppIndex1 p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intO2).card =
        S.leftAdjCount S.oppIndex1 p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intS).card =
        S.rightAdjCount S.oppIndex1 p (dist p x) := by
  refine ⟨prescribedErasedPinRow_moser_card_eq L F hpA hF, ?_, ?_, ?_⟩
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.oppIndex1).card :=
        prescribedErasedPinRow_intO1_card_eq L F hpA hF
      _ = (SelectedClass A p (dist p x) ∩
          (S.capInteriorByIndex S.oppIndex1).erase p).card := by
        rw [selectedClass_inter_erase_center_eq htriple.1]
      _ = S.sameCapCount S.oppIndex1 p (dist p x) := rfl
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.oppIndex2).card :=
        prescribedErasedPinRow_intO2_card_eq L F hpA hF
      _ = S.leftAdjCount S.oppIndex1 p (dist p x) := by
        rw [SurplusCapPacket.leftAdjCount,
          S.leftAdjacentInteriorByIndex_oppIndex1_eq_oppInterior2,
          SurplusCapPacket.oppInterior2]
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.surplusIdx).card :=
        prescribedErasedPinRow_intS_card_eq L F hpA hF
      _ = S.rightAdjCount S.oppIndex1 p (dist p x) := by
        rw [SurplusCapPacket.rightAdjCount,
          S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]

/-- For a center in the second non-surplus interior, the finite buckets
`(moser, intO2, intS, intO1)` reproduce the geometric
`(moser, same, left, right)` counts in that order. -/
theorem prescribedErasedPinRow_leftBucketCounts
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (L : CanonicalLabeling S) (F : FaithfulCarrierPattern A)
    {x p : ℝ²} (hpA : p ∈ A)
    (hF : ∀ hp' : p ∈ A,
      (F.classAt p hp').support = SelectedClass A p (dist p x))
    (htriple : ErasedPinTriple A x p) :
    (row (patternCode L F) (L.labelOf p) ∩ moser).card =
        S.moserCount p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intO2).card =
        S.sameCapCount S.oppIndex2 p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intS).card =
        S.leftAdjCount S.oppIndex2 p (dist p x) ∧
      (row (patternCode L F) (L.labelOf p) ∩ intO1).card =
        S.rightAdjCount S.oppIndex2 p (dist p x) := by
  refine ⟨prescribedErasedPinRow_moser_card_eq L F hpA hF, ?_, ?_, ?_⟩
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.oppIndex2).card :=
        prescribedErasedPinRow_intO2_card_eq L F hpA hF
      _ = (SelectedClass A p (dist p x) ∩
          (S.capInteriorByIndex S.oppIndex2).erase p).card := by
        rw [selectedClass_inter_erase_center_eq htriple.1]
      _ = S.sameCapCount S.oppIndex2 p (dist p x) := rfl
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.surplusIdx).card :=
        prescribedErasedPinRow_intS_card_eq L F hpA hF
      _ = S.leftAdjCount S.oppIndex2 p (dist p x) := by
        rw [SurplusCapPacket.leftAdjCount,
          S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
  · calc
      _ = (SelectedClass A p (dist p x) ∩
          S.capInteriorByIndex S.oppIndex1).card :=
        prescribedErasedPinRow_intO1_card_eq L F hpA hF
      _ = S.rightAdjCount S.oppIndex2 p (dist p x) := by
        rw [SurplusCapPacket.rightAdjCount,
          S.rightAdjacentInteriorByIndex_oppIndex2_eq_oppInterior1,
          SurplusCapPacket.oppInterior1]

end ErasedCertificate

end Problem97
