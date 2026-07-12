/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.U3ToU5DangerousTriple

/-!
# Pinned and dangerous carrier alignment

This file aligns the exact pinned row, a surplus-apex selected row containing
the deleted source, and one extracted dangerous critical row inside a single
`CriticalShellSystem` and `FaithfulCarrierPattern`. It supplies the three-row
input for the arbitrary-cardinality metric-core producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge

/-- A selected four-class at the center of a named critical shell is that
shell whenever it contains the deleted source. -/
theorem selectedFourClass_support_eq_criticalShell_of_source_mem
    {A : Finset ℝ²} {q center : ℝ²}
    (C : CriticalSelectedFourClass A q center)
    (K : SelectedFourClass A center)
    (hqK : q ∈ K.support) :
    K.support = C.toCriticalFourShell.support := by
  have hradius :
      K.radius = C.toCriticalFourShell.radius := by
    exact (K.support_eq_radius q hqK).symm.trans
      (C.toCriticalFourShell.support_eq_radius q
        C.toCriticalFourShell.q_mem_support)
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    apply C.toCriticalFourShell.off_row_named_label_forbidden
      (K.support_subset_A hz)
    exact (K.support_eq_radius z hz).trans hradius
  · rw [C.toCriticalFourShell.support_card, K.support_card]

/-- Global K4 can preserve three prescribed rows at pairwise distinct
centers in one faithful carrier pattern. -/
private theorem exists_faithfulCarrierPattern_with_three_classes
    {A : Finset ℝ²} {c₁ c₂ c₃ : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hc₁ : c₁ ∈ A) (hc₂ : c₂ ∈ A) (hc₃ : c₃ ∈ A)
    (hc₁₂ : c₁ ≠ c₂) (hc₁₃ : c₁ ≠ c₃) (hc₂₃ : c₂ ≠ c₃)
    (K₁ : SelectedFourClass A c₁)
    (K₂ : SelectedFourClass A c₂)
    (K₃ : SelectedFourClass A c₃) :
    ∃ F : FaithfulCarrierPattern A,
      (F.classAt c₁ hc₁).support = K₁.support ∧
      (F.classAt c₂ hc₂).support = K₂.support ∧
      (F.classAt c₃ hc₃).support = K₃.support := by
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
  have hclass₁ : (classAt c₁ hc₁).support = K₁.support := by
    simp [classAt]
  have hclass₂ : (classAt c₂ hc₂).support = K₂.support := by
    simp [classAt, hc₁₂.symm]
  have hclass₃ : (classAt c₃ hc₃).support = K₃.support := by
    simp [classAt, hc₁₃.symm, hc₂₃.symm]
  rcases K₁.support_nonempty with ⟨q, hq⟩
  have hqClass : q ∈ (classAt c₁ hc₁).support := by
    rw [hclass₁]
    exact hq
  refine ⟨{
    gaugeCenter := c₁
    gaugeCenter_mem := hc₁
    classAt := classAt
    gaugeWitness := q
    gaugeWitness_mem := hqClass
  }, hclass₁, hclass₂, hclass₃⟩

/-- A right-pinned exact row and a distinct dangerous critical row can be
preserved simultaneously.  The shell system uses the pinned apex for every
source on the pinned row and the dangerous center for the deleted source. -/
theorem exists_rightPinnedAlignedCarrier
    {D : CounterexampleData} (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1)
    (C : CriticalSelectedFourClass D.A y p)
    (P : U3LocalizedNoQFreePacket D y p) :
    ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
      (∀ q : ℝ², ∀ hqA : q ∈ D.A,
        q ∈ SelectedClass D.A
            (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius →
          H.centerAt q hqA =
            D.packet.oppositeVertexByIndex D.packet.oppIndex1) ∧
      H.centerAt y C.toCriticalFourShell.q_mem_A = p ∧
      (F.classAt
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1)
          (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)).support =
        SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius ∧
      (F.classAt p
          (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2).support =
        C.toCriticalFourShell.support := by
  rcases D.exists_criticalShellSystem_of_minimal hmin with ⟨Hbase⟩
  have hradius : 0 < radius :=
    D.packet.pinnedRightSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hleft, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard'
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase y) p := by
    apply not_hasNEquidistantPointsAt_of_no_erase_center
    simpa [CounterexampleData.skeleton] using P.no_qfree
  let Hpin := Hbase.overrideExactSelectedClass
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
    hradius hcard
    (fun q hq =>
      hM44.pinnedRightSurplusResidual_no_qfree_of_mem
        D.convex hpinned hq)
  let H := Hpin.overrideAt C hblocked
  rcases exists_faithfulCarrierPattern_with_exact_and_critical D.K4
      (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
      hradius hcard C hpne.symm with ⟨F, hFpin, hFcritical⟩
  refine ⟨H, F, ?_, ?_, hFpin, hFcritical⟩
  · intro q hqA hqClass
    have hqne : q ≠ y := by
      intro hqy
      subst q
      exact hyNot hqClass
    change (Hpin.overrideAt C hblocked).centerAt q hqA =
      D.packet.oppositeVertexByIndex D.packet.oppIndex1
    rw [Hpin.overrideAt_centerAt_of_ne C hblocked hqA hqne]
    exact Hbase.overrideExactSelectedClass_centerAt
      (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
      hradius hcard
      (fun z hz =>
        hM44.pinnedRightSurplusResidual_no_qfree_of_mem
          D.convex hpinned hz)
      hqA hqClass
  · change (Hpin.overrideAt C hblocked).centerAt y
      C.toCriticalFourShell.q_mem_A = p
    exact Hpin.overrideAt_centerAt C hblocked
      C.toCriticalFourShell.q_mem_A

/-- Mirror alignment for a left-pinned exact row. -/
theorem exists_leftPinnedAlignedCarrier
    {D : CounterexampleData} (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex2)
    (C : CriticalSelectedFourClass D.A y p)
    (P : U3LocalizedNoQFreePacket D y p) :
    ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
      (∀ q : ℝ², ∀ hqA : q ∈ D.A,
        q ∈ SelectedClass D.A
            (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius →
          H.centerAt q hqA =
            D.packet.oppositeVertexByIndex D.packet.oppIndex2) ∧
      H.centerAt y C.toCriticalFourShell.q_mem_A = p ∧
      (F.classAt
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2)
          (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)).support =
        SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius ∧
      (F.classAt p
          (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2).support =
        C.toCriticalFourShell.support := by
  rcases D.exists_criticalShellSystem_of_minimal hmin with ⟨Hbase⟩
  have hradius : 0 < radius :=
    D.packet.pinnedLeftSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hright, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard'
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase y) p := by
    apply not_hasNEquidistantPointsAt_of_no_erase_center
    simpa [CounterexampleData.skeleton] using P.no_qfree
  let Hpin := Hbase.overrideExactSelectedClass
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
    hradius hcard
    (fun q hq =>
      hM44.pinnedLeftSurplusResidual_no_qfree_of_mem
        D.convex hpinned hq)
  let H := Hpin.overrideAt C hblocked
  rcases exists_faithfulCarrierPattern_with_exact_and_critical D.K4
      (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
      hradius hcard C hpne.symm with ⟨F, hFpin, hFcritical⟩
  refine ⟨H, F, ?_, ?_, hFpin, hFcritical⟩
  · intro q hqA hqClass
    have hqne : q ≠ y := by
      intro hqy
      subst q
      exact hyNot hqClass
    change (Hpin.overrideAt C hblocked).centerAt q hqA =
      D.packet.oppositeVertexByIndex D.packet.oppIndex2
    rw [Hpin.overrideAt_centerAt_of_ne C hblocked hqA hqne]
    exact Hbase.overrideExactSelectedClass_centerAt
      (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
      hradius hcard
      (fun z hz =>
        hM44.pinnedLeftSurplusResidual_no_qfree_of_mem
          D.convex hpinned hz)
      hqA hqClass
  · change (Hpin.overrideAt C hblocked).centerAt y
      C.toCriticalFourShell.q_mem_A = p
    exact Hpin.overrideAt_centerAt C hblocked
      C.toCriticalFourShell.q_mem_A

/-- The simultaneous shell-system and faithful-pattern invariant exported by
the right-oriented three-row carrier construction. -/
def RightPinnedSurplusAlignedCarrierData
    (D : CounterexampleData) (radius : ℝ) (y p : ℝ²)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (C : CriticalSelectedFourClass D.A y p) : Prop :=
  ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
    (∀ q : ℝ², ∀ hqA : q ∈ D.A,
      q ∈ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius →
        H.centerAt q hqA =
          D.packet.oppositeVertexByIndex D.packet.oppIndex1) ∧
    H.centerAt y C.toCriticalFourShell.q_mem_A = p ∧
    (F.classAt
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1)
        (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)).support =
      SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius ∧
    (F.classAt
        (D.packet.oppositeVertexByIndex D.packet.surplusIdx)
        (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)).support =
      K.support ∧
    (F.classAt p
        (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2).support =
      C.toCriticalFourShell.support

/-- Left-oriented mirror of `RightPinnedSurplusAlignedCarrierData`. -/
def LeftPinnedSurplusAlignedCarrierData
    (D : CounterexampleData) (radius : ℝ) (y p : ℝ²)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (C : CriticalSelectedFourClass D.A y p) : Prop :=
  ∃ (H : CriticalShellSystem D.A) (F : FaithfulCarrierPattern D.A),
    (∀ q : ℝ², ∀ hqA : q ∈ D.A,
      q ∈ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius →
        H.centerAt q hqA =
          D.packet.oppositeVertexByIndex D.packet.oppIndex2) ∧
    H.centerAt y C.toCriticalFourShell.q_mem_A = p ∧
    (F.classAt
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2)
        (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)).support =
      SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius ∧
    (F.classAt
        (D.packet.oppositeVertexByIndex D.packet.surplusIdx)
        (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)).support =
      K.support ∧
    (F.classAt p
        (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2).support =
      C.toCriticalFourShell.support

/-- A right-pinned row, the surplus-apex row containing the deleted source,
and its dangerous critical row can be preserved simultaneously. If the
dangerous center is the surplus apex, exact-shell uniqueness identifies the
last two rows. -/
theorem exists_rightPinnedSurplusAlignedCarrier
    {D : CounterexampleData} (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (hyK : y ∈ K.support)
    (C : CriticalSelectedFourClass D.A y p)
    (P : U3LocalizedNoQFreePacket D y p) :
    RightPinnedSurplusAlignedCarrierData D radius y p K C := by
  unfold RightPinnedSurplusAlignedCarrierData
  rcases exists_rightPinnedAlignedCarrier hmin hM44 hpinned hyNot hpne C P with
    ⟨H, F₀, hHpin, hHy, hFpin, hFcritical⟩
  by_cases hpSurplus :
      p = D.packet.oppositeVertexByIndex D.packet.surplusIdx
  · subst p
    have hKC : K.support = C.toCriticalFourShell.support :=
      selectedFourClass_support_eq_criticalShell_of_source_mem C K hyK
    refine ⟨H, F₀, hHpin, hHy, hFpin, ?_, hFcritical⟩
    exact hFcritical.trans hKC.symm
  · have hradius : 0 < radius :=
      D.packet.pinnedRightSurplusResidual_radius_pos hpinned
    have hcard :
        (SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius).card = 4 := by
      rcases hpinned with
        ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hleft, _hx,
          _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
      exact hcard'
    let Kpin : SelectedFourClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) :=
      SelectedFourClass.ofSelectedClass hradius hcard
    let Kcritical : SelectedFourClass D.A p := C.toSelectedFourClass
    have hpinSurplus :
        D.packet.oppositeVertexByIndex D.packet.oppIndex1 ≠
          D.packet.oppositeVertexByIndex D.packet.surplusIdx :=
      (D.packet.oppositeVertexByIndex_ne_of_ne
        D.packet.surplusIdx_ne_oppIndex1).symm
    have hpinnedP :
        D.packet.oppositeVertexByIndex D.packet.oppIndex1 ≠ p := hpne.symm
    have hsurplusP :
        D.packet.oppositeVertexByIndex D.packet.surplusIdx ≠ p :=
      Ne.symm hpSurplus
    rcases exists_faithfulCarrierPattern_with_three_classes D.K4
        (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
        (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)
        (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
        hpinSurplus hpinnedP hsurplusP Kpin K Kcritical with
      ⟨F, hFpin', hFK, hFC⟩
    refine ⟨H, F, hHpin, hHy, ?_, hFK, ?_⟩
    · simpa [Kpin, SelectedFourClass.ofSelectedClass] using hFpin'
    · simpa [Kcritical, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using hFC

/-- Left-oriented mirror of `exists_rightPinnedSurplusAlignedCarrier`. -/
theorem exists_leftPinnedSurplusAlignedCarrier
    {D : CounterexampleData} (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x y p : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x)
    (hyNot : y ∉ SelectedClass D.A
      (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius)
    (hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex2)
    (K : SelectedFourClass D.A
      (D.packet.oppositeVertexByIndex D.packet.surplusIdx))
    (hyK : y ∈ K.support)
    (C : CriticalSelectedFourClass D.A y p)
    (P : U3LocalizedNoQFreePacket D y p) :
    LeftPinnedSurplusAlignedCarrierData D radius y p K C := by
  unfold LeftPinnedSurplusAlignedCarrierData
  rcases exists_leftPinnedAlignedCarrier hmin hM44 hpinned hyNot hpne C P with
    ⟨H, F₀, hHpin, hHy, hFpin, hFcritical⟩
  by_cases hpSurplus :
      p = D.packet.oppositeVertexByIndex D.packet.surplusIdx
  · subst p
    have hKC : K.support = C.toCriticalFourShell.support :=
      selectedFourClass_support_eq_criticalShell_of_source_mem C K hyK
    refine ⟨H, F₀, hHpin, hHy, hFpin, ?_, hFcritical⟩
    exact hFcritical.trans hKC.symm
  · have hradius : 0 < radius :=
      D.packet.pinnedLeftSurplusResidual_radius_pos hpinned
    have hcard :
        (SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius).card = 4 := by
      rcases hpinned with
        ⟨_p₁, _p₂, _hpne, _hpair, hcard', _hsub, _hright, _hx,
          _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
      exact hcard'
    let Kpin : SelectedFourClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) :=
      SelectedFourClass.ofSelectedClass hradius hcard
    let Kcritical : SelectedFourClass D.A p := C.toSelectedFourClass
    have hpinSurplus :
        D.packet.oppositeVertexByIndex D.packet.oppIndex2 ≠
          D.packet.oppositeVertexByIndex D.packet.surplusIdx :=
      (D.packet.oppositeVertexByIndex_ne_of_ne
        D.packet.surplusIdx_ne_oppIndex2).symm
    have hpinnedP :
        D.packet.oppositeVertexByIndex D.packet.oppIndex2 ≠ p := hpne.symm
    have hsurplusP :
        D.packet.oppositeVertexByIndex D.packet.surplusIdx ≠ p :=
      Ne.symm hpSurplus
    rcases exists_faithfulCarrierPattern_with_three_classes D.K4
        (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
        (D.packet.oppositeVertexByIndex_mem D.packet.surplusIdx)
        (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
        hpinSurplus hpinnedP hsurplusP Kpin K Kcritical with
      ⟨F, hFpin', hFK, hFC⟩
    refine ⟨H, F, hHpin, hHy, ?_, hFK, ?_⟩
    · simpa [Kpin, SelectedFourClass.ofSelectedClass] using hFpin'
    · simpa [Kcritical, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using hFC

end GeneralCarrierBridge
end Census554
end Problem97
