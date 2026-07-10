/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusProducer
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U3ToU5DangerousTriple

/-!
# Pinned-surplus row-zero consumer

This shard keeps the generated row-zero bank import out of producer-side edit
loops.  It should be built only when validating the certificate handoff from the
metric-shadow producer.
-/

open scoped EuclideanGeometry

namespace Problem97

private theorem surplusInterior_card_ge_four_of_surplus_card_gt_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hgt : 5 < S.surplusCap.card) :
    4 ≤ (S.capInteriorByIndex S.surplusIdx).card := by
  have hclosed : 6 ≤ S.surplusCap.card := by omega
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · have hcap : 6 ≤ S.partition.C1.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hclosed
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1]
    omega
  · have hcap : 6 ≤ S.partition.C2.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hclosed
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2]
    omega
  · have hcap : 6 ≤ S.partition.C3.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hclosed
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3]
    omega

private theorem exists_surplusInterior_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hgt : 5 < S.surplusCap.card) (x : ℝ²) :
    ∃ y : ℝ²,
      y ∈ S.capInteriorByIndex S.surplusIdx ∧ y ≠ x := by
  classical
  rcases Finset.exists_subset_card_eq
      (surplusInterior_card_ge_four_of_surplus_card_gt_five S hgt) with
    ⟨U, hUsub, hUcard⟩
  have hexists : ∃ y : ℝ², y ∈ U ∧ y ≠ x := by
    by_contra hnone
    push Not at hnone
    have hUsubSingleton : U ⊆ ({x} : Finset ℝ²) := by
      intro y hy
      simp [hnone y hy]
    have hcard := Finset.card_le_card hUsubSingleton
    simp [hUcard] at hcard
  rcases hexists with ⟨y, hyU, hyx⟩
  exact ⟨y, hUsub hyU, hyx⟩

private theorem exists_surplusInterior_not_mem_pinnedRightClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hgt : 5 < S.surplusCap.card) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ y : ℝ²,
      y ∈ S.capInteriorByIndex S.surplusIdx ∧
      y ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius := by
  classical
  rcases exists_surplusInterior_ne S hgt x with ⟨y, hyI, hyx⟩
  have hyRightInterior :
      y ∈ S.rightAdjacentInteriorByIndex S.oppIndex1 := by
    rw [S.rightAdjacentInteriorByIndex_oppIndex1_eq_surplusInterior]
    exact hyI
  have hyRight : y ∈ S.rightAdjacentCapByIndex S.oppIndex1 :=
    S.rightAdjacentInteriorByIndex_subset_rightAdjacentCapByIndex
      S.oppIndex1 hyRightInterior
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hleft, _hx,
      _hxSurplus, _hleftEq, hrightEq, _hright_ne, _hleft_ne⟩
  refine ⟨y, hyI, ?_⟩
  intro hyT
  have hyInter :
      y ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
        S.rightAdjacentCapByIndex S.oppIndex1 :=
    Finset.mem_inter.mpr ⟨hyT, hyRight⟩
  have hySingleton : y ∈ ({x} : Finset ℝ²) := by
    rw [← hrightEq]
    exact hyInter
  exact hyx (by simpa using hySingleton)

private theorem exists_surplusInterior_not_mem_pinnedLeftClass
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hgt : 5 < S.surplusCap.card) {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ y : ℝ²,
      y ∈ S.capInteriorByIndex S.surplusIdx ∧
      y ∉ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius := by
  classical
  rcases exists_surplusInterior_ne S hgt x with ⟨y, hyI, hyx⟩
  have hyLeftInterior :
      y ∈ S.leftAdjacentInteriorByIndex S.oppIndex2 := by
    rw [S.leftAdjacentInteriorByIndex_oppIndex2_eq_surplusInterior]
    exact hyI
  have hyLeft : y ∈ S.leftAdjacentCapByIndex S.oppIndex2 :=
    S.leftAdjacentInteriorByIndex_subset_leftAdjacentCapByIndex
      S.oppIndex2 hyLeftInterior
  rcases hpinned with
    ⟨_p₁, _p₂, _hpne, _hpair, _hcard, _hsub, _hright, _hx,
      _hxSurplus, hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
  refine ⟨y, hyI, ?_⟩
  intro hyT
  have hyInter :
      y ∈ SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) radius ∩
        S.leftAdjacentCapByIndex S.oppIndex2 :=
    Finset.mem_inter.mpr ⟨hyT, hyLeft⟩
  have hySingleton : y ∈ ({x} : Finset ℝ²) := by
    rw [← hleftEq]
    exact hyInter
  exact hyx (by simpa using hySingleton)

private theorem hasFourAfterErasePointAndCenter
    {A : Finset ℝ²} {y center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hy : y ∉ SelectedClass A center radius)
    (hcard : (SelectedClass A center radius).card = 4) :
    HasNEquidistantPointsAt 4 ((A.erase y).erase center) center := by
  have hyCard :
      (SelectedClass (A.erase y) center radius).card = 4 := by
    rw [selectedClass_erase_card_eq_of_not_mem hy, hcard]
  have hcenter : center ∉ SelectedClass (A.erase y) center radius := by
    intro hmem
    have hdist := (mem_selectedClass.mp hmem).2
    have hradiusZero : radius = 0 := by simpa using hdist.symm
    exact (ne_of_gt hradius) hradiusZero
  have hcenterCard :
      (SelectedClass ((A.erase y).erase center) center radius).card = 4 := by
    rw [selectedClass_erase_card_eq_of_not_mem hcenter, hyCard]
  refine ⟨radius, hradius, ?_⟩
  have hle :
      4 ≤ (SelectedClass ((A.erase y).erase center) center radius).card := by
    omega
  simpa [SelectedClass] using hle

/-- A general-`m` right-pinned residual and minimality produce the concrete
extra-point critical packet that any larger-regime contradiction must consume.
The blocker center is distinct from the pinned non-surplus apex because the
pinned four-class survives deletion of the extra surplus point there. -/
theorem CounterexampleData.exists_pinnedRightExtraCriticalPacket
    (D : CounterexampleData) (hmin : D.Minimal)
    (hgt : 5 < D.packet.surplusCap.card)
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x) :
    ∃ y p t1 t2 t3 : ℝ²,
      y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx ∧
      y ∉ SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius ∧
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) ∧
      p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1 ∧
      U3LocalizedNoQFreePacket D y p ∧
      U3FixedTriplePacket D y p t1 t2 t3 := by
  rcases exists_surplusInterior_not_mem_pinnedRightClass
      D.packet hgt hpinned with ⟨y, hyI, hyClass⟩
  have hyA : y ∈ D.A :=
    D.packet.capInteriorByIndex_subset D.packet.surplusIdx hyI
  have hnrem : ¬ IsRemovableVertex D.A y :=
    D.not_isRemovableVertex_of_minimal hmin y
  rcases exists_localizedNoQFreePacket_of_not_removable_mem hyA hnrem with
    ⟨p, P⟩
  have hradius : 0 < radius :=
    D.packet.pinnedRightSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hleft, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  have hsurvives :
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) := by
    simpa [CounterexampleData.skeleton] using
      (hasFourAfterErasePointAndCenter hradius hyClass hcard)
  have hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1 := by
    intro hp
    subst p
    exact P.no_qfree hsurvives
  rcases P.exists_fixedTriplePacket with ⟨t1, t2, t3, F⟩
  exact ⟨y, p, t1, t2, t3, hyI, hyClass, hsurvives, hpne, P, F⟩

/-- Left-oriented mirror of
`CounterexampleData.exists_pinnedRightExtraCriticalPacket`. -/
theorem CounterexampleData.exists_pinnedLeftExtraCriticalPacket
    (D : CounterexampleData) (hmin : D.Minimal)
    (hgt : 5 < D.packet.surplusCap.card)
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x) :
    ∃ y p t1 t2 t3 : ℝ²,
      y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx ∧
      y ∉ SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius ∧
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) ∧
      p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex2 ∧
      U3LocalizedNoQFreePacket D y p ∧
      U3FixedTriplePacket D y p t1 t2 t3 := by
  rcases exists_surplusInterior_not_mem_pinnedLeftClass
      D.packet hgt hpinned with ⟨y, hyI, hyClass⟩
  have hyA : y ∈ D.A :=
    D.packet.capInteriorByIndex_subset D.packet.surplusIdx hyI
  have hnrem : ¬ IsRemovableVertex D.A y :=
    D.not_isRemovableVertex_of_minimal hmin y
  rcases exists_localizedNoQFreePacket_of_not_removable_mem hyA hnrem with
    ⟨p, P⟩
  have hradius : 0 < radius :=
    D.packet.pinnedLeftSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hright, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  have hsurvives :
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) := by
    simpa [CounterexampleData.skeleton] using
      (hasFourAfterErasePointAndCenter hradius hyClass hcard)
  have hpne : p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex2 := by
    intro hp
    subst p
    exact P.no_qfree hsurvives
  rcases P.exists_fixedTriplePacket with ⟨t1, t2, t3, F⟩
  exact ⟨y, p, t1, t2, t3, hyI, hyClass, hsurvives, hpne, P, F⟩

/-- General-`m` pinned-surplus residuals are the remaining branch after the
label-complete `m = 5` row-zero handoff.  The exact ten-label bank does not
claim this regime. -/
theorem isM44PinnedSurplusGeneralMResidualsExcluded :
      IsM44PinnedSurplusGeneralMResidualsExcludedStatement := by
  intro A hne hconv hK4 _hgt hMin S _hM44 hsurplusCard
  let D : CounterexampleData :=
    { A := A
      nonempty := hne
      convex := hconv
      K4 := hK4
      packet := S }
  have hDmin : D.Minimal := by
    intro B hBne hBconv hBK4
    change A.card ≤ B.card
    by_contra hnot
    exact hMin B (Nat.lt_of_not_ge hnot) hBne hBconv hBK4
  have hcritical : Nonempty (CriticalShellSystem A) := by
    simpa [D] using D.exists_criticalShellSystem_of_minimal hDmin
  have hrightPacket :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x →
          ∃ y p t1 t2 t3 : ℝ²,
            y ∈ S.capInteriorByIndex S.surplusIdx ∧
            y ∉ SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∧
            HasNEquidistantPointsAt 4
              ((A.erase y).erase
                (S.oppositeVertexByIndex S.oppIndex1))
              (S.oppositeVertexByIndex S.oppIndex1) ∧
            p ≠ S.oppositeVertexByIndex S.oppIndex1 ∧
            U3LocalizedNoQFreePacket D y p ∧
            U3FixedTriplePacket D y p t1 t2 t3 := by
    intro radius x hpinned
    simpa [D, CounterexampleData.skeleton] using
      D.exists_pinnedRightExtraCriticalPacket hDmin hsurplusCard hpinned
  have hleftPacket :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedLeftSurplusResidualAt radius x →
          ∃ y p t1 t2 t3 : ℝ²,
            y ∈ S.capInteriorByIndex S.surplusIdx ∧
            y ∉ SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex2) radius ∧
            HasNEquidistantPointsAt 4
              ((A.erase y).erase
                (S.oppositeVertexByIndex S.oppIndex2))
              (S.oppositeVertexByIndex S.oppIndex2) ∧
            p ≠ S.oppositeVertexByIndex S.oppIndex2 ∧
            U3LocalizedNoQFreePacket D y p ∧
            U3FixedTriplePacket D y p t1 t2 t3 := by
    intro radius x hpinned
    simpa [D, CounterexampleData.skeleton] using
      D.exists_pinnedLeftExtraCriticalPacket hDmin hsurplusCard hpinned
  -- The remaining obstruction must consume `hcritical` together with the
  -- orientation-specific extra critical packet; no U2/containment input is
  -- available here without circularity.
  sorry

/-- Pinned surplus-family residuals are impossible in the `IsM44` branch.  The
certificate/row-zero contradiction closes the label-complete `m = 5` regime;
the larger regime is delegated to the explicitly named general-`m` residual. -/
theorem isM44PinnedSurplusResidualsExcluded :
      IsM44PinnedSurplusResidualsExcludedStatement := by
  intro hbridge A hne hconv hK4 hgt hMin S hM44
  by_cases hsurplusCard : S.surplusCap.card = 5
  · rcases isM44PinnedSurplusMetricShadowProducer A hne hconv hK4 hgt
        hMin S hM44 hsurplusCard with ⟨hright, hleft⟩
    constructor
    · intro radius x hpinned
      rcases hright hpinned with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
          hvalid, hmetric⟩
      let pointOf :=
        SurplusCOMPGBank.rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hin :
          SurplusCOMPGBank.shadowInBank
            (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) =
              true :=
        hbridge sstar
          (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
          (by simpa [pointOf] using hvalid)
      exact
        SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow
          (pointOf := pointOf) (centerClass := centerClass)
          hin (by simpa [pointOf] using hmetric)
    · intro radius x hpinned
      rcases hleft hpinned with
        ⟨p₁, p₂, q₁, q₂, s1, s2, s3, centerClass, sstar,
          hvalid, hmetric⟩
      let pointOf :=
        SurplusCOMPGBank.leftPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
      have hin :
          SurplusCOMPGBank.shadowInBank
            (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass) =
              true :=
        hbridge sstar
          (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
          (by simpa [pointOf] using hvalid)
      exact
        SurplusCertificate.RelaxedSplit.Bank.RowZeros.false_of_shadowInBank_of_metricShadow
          (pointOf := pointOf) (centerClass := centerClass)
          hin (by simpa [pointOf] using hmetric)
  · apply isM44PinnedSurplusGeneralMResidualsExcluded A hne hconv hK4 hgt
      hMin S hM44
    have hsurplusCardGe : 5 ≤ S.surplusCap.card :=
      hM44.surplus_card_ge_five
    omega


end Problem97
