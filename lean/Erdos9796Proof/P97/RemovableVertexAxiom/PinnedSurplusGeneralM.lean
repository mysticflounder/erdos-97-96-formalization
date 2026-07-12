/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusProducer
import Erdos9796Proof.P97.Census554.PinnedCarrierBridge
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.U3ToU5DangerousTriple
import Erdos9796Proof.P97.U3ToU5Terminal

/-!
# General-m pinned-surplus reduction

This shard contains the non-label-complete pinned-surplus reduction and avoids
importing the generated row-zero bank. It is the active edit-cycle target for
`isM44PinnedSurplusGeneralMResidualsExcluded`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- In the non-label-complete regime, the strict interior of the surplus cap
contains at least four carrier points. -/
theorem SurplusCapPacket.surplusInterior_card_ge_four_of_card_gt_five
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hgt : 5 < S.surplusCap.card) :
    4 ≤ (S.capInteriorByIndex S.surplusIdx).card := by
  rcases hi : S.surplusIdx with ⟨idx, hidx⟩
  interval_cases idx
  · have hcap : 5 < S.partition.C1.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hgt
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1]
    omega
  · have hcap : 5 < S.partition.C2.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hgt
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2]
    omega
  · have hcap : 5 < S.partition.C3.card := by
      simpa [SurplusCapPacket.surplusCap, hi] using hgt
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 := by
      exact Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    simp only [SurplusCapPacket.capInteriorByIndex]
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3]
    omega

/-- Every positive-radius K4 class centered at a Moser apex contains at least
two points from the strict interior of its opposite cap. The two adjacent
one-hit bounds leave room for at most two class members outside that
interior. -/
theorem SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : 4 ≤
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card) :
    2 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.capInteriorByIndex i).card := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hcardT : 4 ≤ T.card := by
    simpa [T] using hcard
  change 2 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

/-- A right-pinned row can be coupled to a K4 row at the surplus apex through
a surplus-interior point outside the pinned row. -/
theorem SurplusCapPacket.exists_surplusApexK4Class_point_not_mem_pinnedRight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ rho : ℝ, ∃ y : ℝ²,
      0 < rho ∧
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho).card ∧
      y ∈ S.capInteriorByIndex S.surplusIdx ∧
      y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho ∧
      y ≠ x ∧
      y ∉ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius := by
  classical
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
      hK4 (S.oppositeVertexByIndex_mem S.surplusIdx) with
    ⟨rho, hrho, hcard⟩
  let I :=
    SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) rho ∩
      S.capInteriorByIndex S.surplusIdx
  have hIcard : 2 ≤ I.card := by
    simpa [I] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv S.surplusIdx hrho hcard
  have hexists : ∃ y : ℝ², y ∈ I ∧ y ≠ x := by
    by_contra hnone
    push_neg at hnone
    have hIsub : I ⊆ ({x} : Finset ℝ²) := by
      intro y hy
      simp [hnone y hy]
    have hle := Finset.card_le_card hIsub
    simp only [Finset.card_singleton] at hle
    omega
  rcases hexists with ⟨y, hyI, hyx⟩
  have hyClass :
      y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho :=
    (Finset.mem_inter.mp hyI).1
  have hyInterior : y ∈ S.capInteriorByIndex S.surplusIdx :=
    (Finset.mem_inter.mp hyI).2
  have hyNotPinned :
      y ∉ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex1) radius := by
    intro hyPinned
    exact hyx
      ((S.pinnedRightSurplusResidual_surplusInterior_mem_selectedClass_iff
        hpinned hyInterior).mp hyPinned)
  exact
    ⟨rho, y, hrho, hcard, hyInterior, hyClass, hyx, hyNotPinned⟩

/-- Mirror surplus-apex coupling for a left-pinned row. -/
theorem SurplusCapPacket.exists_surplusApexK4Class_point_not_mem_pinnedLeft
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ rho : ℝ, ∃ y : ℝ²,
      0 < rho ∧
      4 ≤ (SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho).card ∧
      y ∈ S.capInteriorByIndex S.surplusIdx ∧
      y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho ∧
      y ≠ x ∧
      y ∉ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius := by
  classical
  rcases exists_selectedClass_card_ge_four_of_hasNEquidistantProperty
      hK4 (S.oppositeVertexByIndex_mem S.surplusIdx) with
    ⟨rho, hrho, hcard⟩
  let I :=
    SelectedClass A (S.oppositeVertexByIndex S.surplusIdx) rho ∩
      S.capInteriorByIndex S.surplusIdx
  have hIcard : 2 ≤ I.card := by
    simpa [I] using
      S.selectedClass_capInteriorByIndex_card_ge_two
        hconv S.surplusIdx hrho hcard
  have hexists : ∃ y : ℝ², y ∈ I ∧ y ≠ x := by
    by_contra hnone
    push_neg at hnone
    have hIsub : I ⊆ ({x} : Finset ℝ²) := by
      intro y hy
      simp [hnone y hy]
    have hle := Finset.card_le_card hIsub
    simp only [Finset.card_singleton] at hle
    omega
  rcases hexists with ⟨y, hyI, hyx⟩
  have hyClass :
      y ∈ SelectedClass A
        (S.oppositeVertexByIndex S.surplusIdx) rho :=
    (Finset.mem_inter.mp hyI).1
  have hyInterior : y ∈ S.capInteriorByIndex S.surplusIdx :=
    (Finset.mem_inter.mp hyI).2
  have hyNotPinned :
      y ∉ SelectedClass A
        (S.oppositeVertexByIndex S.oppIndex2) radius := by
    intro hyPinned
    exact hyx
      ((S.pinnedLeftSurplusResidual_surplusInterior_mem_selectedClass_iff
        hpinned hyInterior).mp hyPinned)
  exact
    ⟨rho, y, hrho, hcard, hyInterior, hyClass, hyx, hyNotPinned⟩

private noncomputable def selectedFourClassOfSubpacket
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ} {T : Finset ℝ²}
    (hradius : 0 < radius)
    (hTsub : T ⊆ SelectedClass A center radius)
    (hTcard : T.card = 4) :
    SelectedFourClass A center :=
  { support := T
    support_subset_A := fun _ hz => (mem_selectedClass.mp (hTsub hz)).1
    support_card := hTcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := fun _ hz => (mem_selectedClass.mp (hTsub hz)).2
    center_not_mem := by
      intro hcenter
      have hdist := (mem_selectedClass.mp (hTsub hcenter)).2
      have : radius = 0 := by simpa using hdist.symm
      exact (ne_of_gt hradius) this }

/-- Four-point-row form of the right surplus-apex coupling. -/
theorem SurplusCapPacket.exists_surplusApexSelectedFourClass_point_not_mem_pinnedRight
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedRightSurplusResidualAt radius x) :
    ∃ y : ℝ²,
      ∃ K : SelectedFourClass A
          (S.oppositeVertexByIndex S.surplusIdx),
        y ∈ S.capInteriorByIndex S.surplusIdx ∧
        y ∈ K.support ∧
        y ≠ x ∧
        y ∉ SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex1) radius := by
  rcases S.exists_surplusApexK4Class_point_not_mem_pinnedRight
      hK4 hconv hpinned with
    ⟨rho, y, hrho, hcard, hyInterior, hyClass, hyx, hyNotPinned⟩
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_point_of_selected_card_ge_four
        hyClass hcard with
    ⟨T, hyT, hTsub, hTcard⟩
  let K : SelectedFourClass A
      (S.oppositeVertexByIndex S.surplusIdx) :=
    selectedFourClassOfSubpacket hrho hTsub hTcard
  exact ⟨y, K, hyInterior, hyT, hyx, hyNotPinned⟩

/-- Four-point-row form of the left surplus-apex coupling. -/
theorem SurplusCapPacket.exists_surplusApexSelectedFourClass_point_not_mem_pinnedLeft
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hK4 : HasNEquidistantProperty 4 A) (hconv : ConvexIndep A)
    {radius : ℝ} {x : ℝ²}
    (hpinned : S.PinnedLeftSurplusResidualAt radius x) :
    ∃ y : ℝ²,
      ∃ K : SelectedFourClass A
          (S.oppositeVertexByIndex S.surplusIdx),
        y ∈ S.capInteriorByIndex S.surplusIdx ∧
        y ∈ K.support ∧
        y ≠ x ∧
        y ∉ SelectedClass A
          (S.oppositeVertexByIndex S.oppIndex2) radius := by
  rcases S.exists_surplusApexK4Class_point_not_mem_pinnedLeft
      hK4 hconv hpinned with
    ⟨rho, y, hrho, hcard, hyInterior, hyClass, hyx, hyNotPinned⟩
  rcases
      FiniteEndpointShell.exists_fourSubpacket_preserving_point_of_selected_card_ge_four
        hyClass hcard with
    ⟨T, hyT, hTsub, hTcard⟩
  let K : SelectedFourClass A
      (S.oppositeVertexByIndex S.surplusIdx) :=
    selectedFourClassOfSubpacket hrho hTsub hTcard
  exact ⟨y, K, hyInterior, hyT, hyx, hyNotPinned⟩

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
    SelectedFourClass.ofSelectedClass hradius hcard
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
      ∃ K : SelectedFourClass D.A
          (D.packet.oppositeVertexByIndex D.packet.surplusIdx),
      y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx ∧
      y ∉ SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius ∧
      y ∈ K.support ∧
      4 ≤ (D.packet.capInteriorByIndex D.packet.surplusIdx).card ∧
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) ∧
      p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex1 ∧
      (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
        t ∉ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius) ∧
      ∃ C : CriticalSelectedFourClass D.A y p,
        Census554.GeneralCarrierBridge.RightPinnedSurplusAlignedCarrierData
          D radius y p K C ∧
        Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
        (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
          ¬ H.RowwiseConfinedQDeletedClasses) ∧
        U3LocalizedNoQFreePacket D y p ∧
        U3FixedTriplePacket D y p t1 t2 t3 := by
  rcases
      D.packet.exists_surplusApexSelectedFourClass_point_not_mem_pinnedRight
        D.K4 D.convex hpinned with
    ⟨y, K, hyI, hyK, _hyx, hyClass⟩
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
  rcases P.exists_criticalSelectedFourClass F with ⟨C⟩
  have haligned :=
    Census554.GeneralCarrierBridge.exists_rightPinnedSurplusAlignedCarrier
      hmin hM44 hpinned hyClass hpne K hyK C P
  have hinterior :=
    D.packet.surplusInterior_card_ge_four_of_card_gt_five hgt
  exact
    ⟨y, p, t1, t2, t3, K, hyI, hyClass, hyK,
      hinterior, hsurvives, hpne, htOutside, C, haligned,
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
      ∃ K : SelectedFourClass D.A
          (D.packet.oppositeVertexByIndex D.packet.surplusIdx),
      y ∈ D.packet.capInteriorByIndex D.packet.surplusIdx ∧
      y ∉ SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius ∧
      y ∈ K.support ∧
      4 ≤ (D.packet.capInteriorByIndex D.packet.surplusIdx).card ∧
      HasNEquidistantPointsAt 4
        ((D.skeleton y).erase
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2))
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) ∧
      p ≠ D.packet.oppositeVertexByIndex D.packet.oppIndex2 ∧
      (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
        t ∉ SelectedClass D.A
          (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius) ∧
      ∃ C : CriticalSelectedFourClass D.A y p,
        Census554.GeneralCarrierBridge.LeftPinnedSurplusAlignedCarrierData
          D radius y p K C ∧
        Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
        (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
          ¬ H.RowwiseConfinedQDeletedClasses) ∧
        U3LocalizedNoQFreePacket D y p ∧
        U3FixedTriplePacket D y p t1 t2 t3 := by
  rcases
      D.packet.exists_surplusApexSelectedFourClass_point_not_mem_pinnedLeft
        D.K4 D.convex hpinned with
    ⟨y, K, hyI, hyK, _hyx, hyClass⟩
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
  rcases P.exists_criticalSelectedFourClass F with ⟨C⟩
  have haligned :=
    Census554.GeneralCarrierBridge.exists_leftPinnedSurplusAlignedCarrier
      hmin hM44 hpinned hyClass hpne K hyK C P
  have hinterior :=
    D.packet.surplusInterior_card_ge_four_of_card_gt_five hgt
  exact
    ⟨y, p, t1, t2, t3, K, hyI, hyClass, hyK,
      hinterior, hsurvives, hpne, htOutside, C, haligned,
      P.exists_fixedTripleAuditFrame F hM44,
      (fun H => H.false_of_rowwiseConfinedQDeletedClasses), P, F⟩

/-- Minimality's critical-shell system can be chosen so every member of a
right-pinned exact class uses the pinned apex as its blocker center. -/
theorem CounterexampleData.exists_pinnedRightCriticalShellSystem
    (D : CounterexampleData) (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedRightSurplusResidualAt radius x) :
    ∃ H : CriticalShellSystem D.A,
      ∀ q : ℝ², ∀ hqA : q ∈ D.A,
        q ∈ SelectedClass D.A
            (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius →
          H.centerAt q hqA =
            D.packet.oppositeVertexByIndex D.packet.oppIndex1 := by
  rcases D.exists_criticalShellSystem_of_minimal hmin with ⟨H₀⟩
  have hradius : 0 < radius :=
    D.packet.pinnedRightSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex1) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hleft, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  let H := H₀.overrideExactSelectedClass
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
    hradius hcard
    (fun q hq =>
      hM44.pinnedRightSurplusResidual_no_qfree_of_mem
        D.convex hpinned hq)
  refine ⟨H, ?_⟩
  intro q hqA hqClass
  exact H₀.overrideExactSelectedClass_centerAt
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex1)
    hradius hcard
    (fun z hz =>
      hM44.pinnedRightSurplusResidual_no_qfree_of_mem
        D.convex hpinned hz)
    hqA hqClass

/-- Mirror customized critical-shell system for a left-pinned exact class. -/
theorem CounterexampleData.exists_pinnedLeftCriticalShellSystem
    (D : CounterexampleData) (hmin : D.Minimal) (hM44 : D.IsM44)
    {radius : ℝ} {x : ℝ²}
    (hpinned : D.packet.PinnedLeftSurplusResidualAt radius x) :
    ∃ H : CriticalShellSystem D.A,
      ∀ q : ℝ², ∀ hqA : q ∈ D.A,
        q ∈ SelectedClass D.A
            (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius →
          H.centerAt q hqA =
            D.packet.oppositeVertexByIndex D.packet.oppIndex2 := by
  rcases D.exists_criticalShellSystem_of_minimal hmin with ⟨H₀⟩
  have hradius : 0 < radius :=
    D.packet.pinnedLeftSurplusResidual_radius_pos hpinned
  have hcard :
      (SelectedClass D.A
        (D.packet.oppositeVertexByIndex D.packet.oppIndex2) radius).card = 4 := by
    rcases hpinned with
      ⟨_p₁, _p₂, _hpne, _hpair, hcard, _hsub, _hright, _hx,
        _hxSurplus, _hleftEq, _hrightEq, _hright_ne, _hleft_ne⟩
    exact hcard
  let H := H₀.overrideExactSelectedClass
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
    hradius hcard
    (fun q hq =>
      hM44.pinnedLeftSurplusResidual_no_qfree_of_mem
        D.convex hpinned hq)
  refine ⟨H, ?_⟩
  intro q hqA hqClass
  exact H₀.overrideExactSelectedClass_centerAt
    (D.packet.oppositeVertexByIndex_mem D.packet.oppIndex2)
    hradius hcard
    (fun z hz =>
      hM44.pinnedLeftSurplusResidual_no_qfree_of_mem
        D.convex hpinned hz)
    hqA hqClass

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
  have hcard11 : A.card = 11 :=
    CapSelectedRowCounting.SurplusCapPacket.card_eq_eleven_of_surplus_card_gt_five
      S hconv hK4 hM44 hsurplusCard
  have hcritical : Nonempty (CriticalShellSystem A) := by
    simpa [D] using D.exists_criticalShellSystem_of_minimal hDmin
  have hrightPacket :
      ∀ {radius : ℝ} {x : ℝ²},
        S.PinnedRightSurplusResidualAt radius x →
          ∃ y p t1 t2 t3 : ℝ²,
            ∃ K : SelectedFourClass A
                (S.oppositeVertexByIndex S.surplusIdx),
            y ∈ S.capInteriorByIndex S.surplusIdx ∧
            y ∉ SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex1) radius ∧
            y ∈ K.support ∧
            4 ≤ (S.capInteriorByIndex S.surplusIdx).card ∧
            HasNEquidistantPointsAt 4
              ((A.erase y).erase
                (S.oppositeVertexByIndex S.oppIndex1))
              (S.oppositeVertexByIndex S.oppIndex1) ∧
            p ≠ S.oppositeVertexByIndex S.oppIndex1 ∧
            (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
              t ∉ SelectedClass A
                (S.oppositeVertexByIndex S.oppIndex1) radius) ∧
            ∃ C : CriticalSelectedFourClass A y p,
              Census554.GeneralCarrierBridge.RightPinnedSurplusAlignedCarrierData
                D radius y p K C ∧
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
            ∃ K : SelectedFourClass A
                (S.oppositeVertexByIndex S.surplusIdx),
            y ∈ S.capInteriorByIndex S.surplusIdx ∧
            y ∉ SelectedClass A
              (S.oppositeVertexByIndex S.oppIndex2) radius ∧
            y ∈ K.support ∧
            4 ≤ (S.capInteriorByIndex S.surplusIdx).card ∧
            HasNEquidistantPointsAt 4
              ((A.erase y).erase
                (S.oppositeVertexByIndex S.oppIndex2))
              (S.oppositeVertexByIndex S.oppIndex2) ∧
            p ≠ S.oppositeVertexByIndex S.oppIndex2 ∧
            (∃ t ∈ ({t1, t2, t3} : Finset ℝ²),
              t ∉ SelectedClass A
                (S.oppositeVertexByIndex S.oppIndex2) radius) ∧
            ∃ C : CriticalSelectedFourClass A y p,
              Census554.GeneralCarrierBridge.LeftPinnedSurplusAlignedCarrierData
                D radius y p K C ∧
              Nonempty (U3FixedTripleAuditFrame D y p t1 t2 t3) ∧
              (∀ H : U3FixedTripleAuditFrame D y p t1 t2 t3,
                ¬ H.RowwiseConfinedQDeletedClasses) ∧
              U3LocalizedNoQFreePacket D y p ∧
              U3FixedTriplePacket D y p t1 t2 t3 := by
    intro radius x hpinned
    simpa [D, CounterexampleData.skeleton] using
      D.exists_pinnedLeftExtraCriticalPacket hDmin hDIsM44
        hsurplusCard hpinned
  -- The cap double count has reduced the branch to the finite `(6,4,4)`
  -- equality case `A.card = 11`. The remaining obstruction must consume that
  -- equality together with `hcritical` and the orientation-specific packet;
  -- no U2/containment input is available here without circularity.
  sorry

end Problem97
