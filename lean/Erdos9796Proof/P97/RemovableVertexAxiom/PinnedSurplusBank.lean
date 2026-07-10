/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusProducer
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Bank
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U3ToU5DangerousTriple
import Erdos9796Proof.P97.U3ToU5Terminal

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

/-- A localized no-q-free packet and its fixed triple give the exact named
critical shell at the blocker center.  In particular, the full ambient radius
class is precisely the deleted source together with the surviving triple. -/
theorem U3LocalizedNoQFreePacket.exists_criticalSelectedFourClass
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (F : U3FixedTriplePacket D q p t1 t2 t3) :
    Nonempty (CriticalSelectedFourClass D.A q p) := by
  classical
  let T : Finset ℝ² := {t1, t2, t3}
  let C : Finset ℝ² :=
    ((D.skeleton q).erase p).filter fun z => dist p z = dist p q
  have hTsubC : T ⊆ C := by
    intro z hz
    simp only [T, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact Finset.mem_filter.mpr ⟨F.t1_mem, F.t1_same_radius⟩
    · exact Finset.mem_filter.mpr ⟨F.t2_mem, F.t2_same_radius⟩
    · exact Finset.mem_filter.mpr ⟨F.t3_mem, F.t3_same_radius⟩
  have hTcard : T.card = 3 := by
    simp [T, F.t1_ne_t2, F.t1_ne_t3, F.t2_ne_t3]
  have hCcard : C.card = 3 := by
    simpa [C] using P.exact_radius_class_card_eq_three F
  have hTC : T = C := by
    exact Finset.eq_of_subset_of_card_le hTsubC (by
      rw [hCcard, hTcard])
  have hfull :
      insert q T = D.A.filter fun z => dist p z = dist p q := by
    ext z
    constructor
    · intro hz
      rcases Finset.mem_insert.mp hz with rfl | hzT
      · exact Finset.mem_filter.mpr ⟨F.q_mem, rfl⟩
      · have hzC : z ∈ C := by
          rw [← hTC]
          exact hzT
        rcases Finset.mem_filter.mp hzC with ⟨hzErase, hzdist⟩
        have hzSkeleton : z ∈ D.skeleton q :=
          (Finset.mem_erase.mp hzErase).2
        have hzA : z ∈ D.A := by
          change z ∈ D.A.erase q at hzSkeleton
          exact (Finset.mem_erase.mp hzSkeleton).2
        exact Finset.mem_filter.mpr ⟨hzA, hzdist⟩
    · intro hz
      rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
      by_cases hzq : z = q
      · exact Finset.mem_insert.mpr (Or.inl hzq)
      · have hzSkeleton : z ∈ D.skeleton q := by
          change z ∈ D.A.erase q
          exact Finset.mem_erase.mpr ⟨hzq, hzA⟩
        have hzp : z ≠ p := by
          intro h
          subst z
          have hzero : dist p q = 0 := by simpa using hzdist.symm
          linarith [F.q_radius_pos, hzero]
        have hzC : z ∈ C :=
          Finset.mem_filter.mpr
            ⟨Finset.mem_erase.mpr ⟨hzp, hzSkeleton⟩, hzdist⟩
        have hzT : z ∈ T := by
          rw [hTC]
          exact hzC
        exact Finset.mem_insert.mpr (Or.inr hzT)
  refine ⟨
    { toCriticalFourShell :=
        { center_mem := by
            simpa [CounterexampleData.skeleton] using P.p_mem_skeleton
          radius := dist p q
          radius_pos := F.q_radius_pos
          support := insert q T
          support_eq := hfull
          support_card := by
            simp [T, F.q_ne_t1, F.q_ne_t2, F.q_ne_t3,
              F.t1_ne_t2, F.t1_ne_t3, F.t2_ne_t3]
          q_mem_support := by simp }
      l1 := q
      l2 := t1
      l3 := t2
      l4 := t3
      l1_ne_l2 := F.q_ne_t1
      l1_ne_l3 := F.q_ne_t2
      l1_ne_l4 := F.q_ne_t3
      l2_ne_l3 := F.t1_ne_t2
      l2_ne_l4 := F.t1_ne_t3
      l3_ne_l4 := F.t2_ne_t3
      support_eq_labels := rfl }⟩

private noncomputable def selectedFourClassOfExactSelectedClass
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : (SelectedClass A center radius).card = 4) :
    SelectedFourClass A center :=
  { support := SelectedClass A center radius
    support_subset_A := by
      intro z hz
      exact (mem_selectedClass.mp hz).1
    support_card := hcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := by
      intro z hz
      exact (mem_selectedClass.mp hz).2
    center_not_mem := by
      intro hcenter
      have hdist := (mem_selectedClass.mp hcenter).2
      have hradiusZero : radius = 0 := by simpa using hdist.symm
      exact (ne_of_gt hradius) hradiusZero }

private noncomputable def U3FixedTriplePacket.toSelectedFourClass
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F : U3FixedTriplePacket D q p t1 t2 t3) :
    SelectedFourClass D.A p :=
  { support := {q, t1, t2, t3}
    support_subset_A := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl | rfl
      · exact F.q_mem
      · have hzSkeleton : z ∈ D.skeleton q :=
          (Finset.mem_erase.mp F.t1_mem).2
        change z ∈ D.A.erase q at hzSkeleton
        exact (Finset.mem_erase.mp hzSkeleton).2
      · have hzSkeleton : z ∈ D.skeleton q :=
          (Finset.mem_erase.mp F.t2_mem).2
        change z ∈ D.A.erase q at hzSkeleton
        exact (Finset.mem_erase.mp hzSkeleton).2
      · have hzSkeleton : z ∈ D.skeleton q :=
          (Finset.mem_erase.mp F.t3_mem).2
        change z ∈ D.A.erase q at hzSkeleton
        exact (Finset.mem_erase.mp hzSkeleton).2
    support_card := by
      simp [F.q_ne_t1, F.q_ne_t2, F.q_ne_t3,
        F.t1_ne_t2, F.t1_ne_t3, F.t2_ne_t3]
    radius := dist p q
    radius_pos := F.q_radius_pos
    support_eq_radius := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl | rfl
      · rfl
      · exact F.t1_same_radius
      · exact F.t2_same_radius
      · exact F.t3_same_radius
    center_not_mem := by
      simp [F.p_ne_q, F.p_ne_t1, F.p_ne_t2, F.p_ne_t3] }

/-- A fixed triple at `p` cannot be wholly contained in an exact selected
four-class at a distinct center: three shared points would violate the
two-circle intersection bound. -/
theorem U3FixedTriplePacket.exists_triplePoint_not_mem_selectedClass
    {D : CounterexampleData} {q p t1 t2 t3 center : ℝ²} {radius : ℝ}
    (F : U3FixedTriplePacket D q p t1 t2 t3)
    (hpcenter : p ≠ center)
    (hradius : 0 < radius)
    (hcard : (SelectedClass D.A center radius).card = 4) :
    ∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
      t ∉ SelectedClass D.A center radius := by
  classical
  let T : Finset ℝ² := {t1, t2, t3}
  let Kp : SelectedFourClass D.A p := F.toSelectedFourClass
  let Kcenter : SelectedFourClass D.A center :=
    selectedFourClassOfExactSelectedClass hradius hcard
  have hinter : (Kp.support ∩ Kcenter.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Kp Kcenter hpcenter
  by_contra hnone
  have hall : ∀ z ∈ T, z ∈ SelectedClass D.A center radius := by
    intro z hzT
    by_contra hznot
    exact hnone ⟨z, hzT, hznot⟩
  have hTsub : T ⊆ Kp.support ∩ Kcenter.support := by
    intro z hzT
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · change z ∈ ({q, t1, t2, t3} : Finset ℝ²)
      exact Finset.mem_insert_of_mem hzT
    · exact hall z hzT
  have hTcard : T.card = 3 := by
    simp [T, F.t1_ne_t2, F.t1_ne_t3, F.t2_ne_t3]
  have hthree_le := Finset.card_le_card hTsub
  omega

/-- A general-`m` right-pinned residual and minimality produce the concrete
extra-point critical packet that any larger-regime contradiction must consume.
The blocker center is distinct from the pinned non-surplus apex because the
pinned four-class survives deletion of the extra surplus point there. -/
theorem CounterexampleData.exists_pinnedRightExtraCriticalPacket
    (D : CounterexampleData) (hmin : D.Minimal) (hM44 : D.IsM44)
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
      (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
        t ∉ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius) ∧
      Nonempty (CriticalSelectedFourClass D.A y p) ∧
      Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
      (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
        ¬ H.RowwiseConfinedQDeletedClasses) ∧
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
  have htOutside := F.exists_triplePoint_not_mem_selectedClass
    hpne hradius hcard
  exact
    ⟨y, p, t1, t2, t3, hyI, hyClass, hsurvives, hpne,
      htOutside, P.exists_criticalSelectedFourClass F,
      P.exists_fixedTripleAuditFrame F hM44,
      (fun H => H.false_of_rowwiseConfinedQDeletedClasses), P, F⟩

/-- Left-oriented mirror of
`CounterexampleData.exists_pinnedRightExtraCriticalPacket`. -/
theorem CounterexampleData.exists_pinnedLeftExtraCriticalPacket
    (D : CounterexampleData) (hmin : D.Minimal) (hM44 : D.IsM44)
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
      (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
        t ∉ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius) ∧
      Nonempty (CriticalSelectedFourClass D.A y p) ∧
      Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
      (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
        ¬ H.RowwiseConfinedQDeletedClasses) ∧
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
  have htOutside := F.exists_triplePoint_not_mem_selectedClass
    hpne hradius hcard
  exact
    ⟨y, p, t1, t2, t3, hyI, hyClass, hsurvives, hpne,
      htOutside, P.exists_criticalSelectedFourClass F,
      P.exists_fixedTripleAuditFrame F hM44,
      (fun H => H.false_of_rowwiseConfinedQDeletedClasses), P, F⟩

/-- General-`m` pinned-surplus residuals are the remaining branch after the
label-complete `m = 5` row-zero handoff.  The exact ten-label bank does not
claim this regime. -/
theorem isM44PinnedSurplusGeneralMResidualsExcluded :
      IsM44PinnedSurplusGeneralMResidualsExcludedStatement := by
  intro A hne hconv hK4 _hgt hMin S hM44 hsurplusCard
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
  have hDIsM44 : D.IsM44 := by
    simpa [CounterexampleData.IsM44, D] using hM44
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
            (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
              t ∉ SelectedClass A
                (S.oppositeVertexByIndex S.oppIndex1) radius) ∧
            Nonempty (CriticalSelectedFourClass A y p) ∧
            Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
            (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
              ¬ H.RowwiseConfinedQDeletedClasses) ∧
            U3LocalizedNoQFreePacket D y p ∧
            U3FixedTriplePacket D y p t1 t2 t3 := by
    intro radius x hpinned
    simpa [D, CounterexampleData.skeleton] using
      D.exists_pinnedRightExtraCriticalPacket hDmin hDIsM44
        hsurplusCard hpinned
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
            (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
              t ∉ SelectedClass A
                (S.oppositeVertexByIndex S.oppIndex2) radius) ∧
            Nonempty (CriticalSelectedFourClass A y p) ∧
            Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
            (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
              ¬ H.RowwiseConfinedQDeletedClasses) ∧
            U3LocalizedNoQFreePacket D y p ∧
            U3FixedTriplePacket D y p t1 t2 t3 := by
    intro radius x hpinned
    simpa [D, CounterexampleData.skeleton] using
      D.exists_pinnedLeftExtraCriticalPacket hDmin hDIsM44
        hsurplusCard hpinned
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
