/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle

/-!
# Scratch: retained matching source-return radius split

The source-return arm of the retained matching walk is a genuine mutual-omission
two-cycle.  This file keeps the complete retained first-apex radius class and
uses the two-circle intersection bound for both actual critical shells.

The resulting split is exact.  Either one retained-radius source is omitted by
both critical shells, hence its deletion preserves K4 at the first apex and at
both distinct actual blockers, or the retained class has cardinality exactly
four and the two shells cut it into two disjoint two-point pieces.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMatchingSourceReturnTerminalScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiberRow
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A retained-radius source whose deletion survives at the first apex and at
both actual blockers of a source-return pair.  The two packaged common-deletion
rows retain those three concrete, pairwise-distinct centers. -/
structure RetainedSourceReturnJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type where
  sourceReturn : W.next = W.first
  source : ℝ²
  source_mem_radius :
    source ∈ SelectedClass D.A S.oppApex1 radius
  source_ne_first : source ≠ W.first
  source_ne_second : source ≠ W.second
  source_not_mem_firstShell :
    source ∉
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support
  source_not_mem_secondShell :
    source ∉
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support
  firstBlocker_ne_secondBlocker :
    H.centerAt W.first W.first_mem_A ≠
      H.centerAt W.second W.second_mem_A
  firstPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt W.first W.first_mem_A)
  secondPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt W.second W.second_mem_A)

/-- U5-facing form of a joint deletion.  It retains a dangerous triple on
the original first-apex radius, the two q-deleted rows at the distinct
blockers, and the source's own exact q-critical row. -/
structure RetainedSourceReturnJointU5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (J : RetainedSourceReturnJointDeletion W) : Type where
  third : ℝ²
  third_mem_radius : third ∈ SelectedClass D.A S.oppApex1 radius
  third_ne_source : third ≠ J.source
  third_ne_first : third ≠ W.first
  third_ne_second : third ≠ W.second
  dangerous : U5DangerousTriple D J.source S.oppApex1
    {W.first, W.second, third}
  firstBlockerRow :
    U5QDeletedK4Class D J.source
      (H.centerAt W.first W.first_mem_A)
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support
  secondBlockerRow :
    U5QDeletedK4Class D J.source
      (H.centerAt W.second W.second_mem_A)
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support
  actualCriticalRow :
    U5QCriticalTripleClass D J.source
      (H.centerAt J.source
        (mem_selectedClass.mp J.source_mem_radius).1)
      ((H.selectedAt J.source
        (mem_selectedClass.mp J.source_mem_radius).1).toCriticalFourShell.support.erase
          J.source)

/-- Exact-card-four complement of joint omission.  The two actual shells meet
the retained first-apex class in disjoint pairs, one rooted at each original
source. -/
structure RetainedSourceReturnExactFourPartition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type where
  sourceReturn : W.next = W.first
  class_card_eq_four :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  firstPartner : ℝ²
  secondPartner : ℝ²
  firstPartner_ne_first : firstPartner ≠ W.first
  secondPartner_ne_second : secondPartner ≠ W.second
  firstPartner_ne_second : firstPartner ≠ W.second
  secondPartner_ne_first : secondPartner ≠ W.first
  partners_ne : firstPartner ≠ secondPartner
  firstHits_eq :
    (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius =
      {W.first, firstPartner}
  secondHits_eq :
    (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius =
      {W.second, secondPartner}
  hits_disjoint :
    Disjoint
      ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius)
      ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius)
  hits_union_eq_class :
    ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius) ∪
        ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex1 radius) =
      SelectedClass D.A S.oppApex1 radius

/-- The two dual U5 ingress packets forced by an exact-four partition.  On
each side the partner is the deleted point, the shell on its own side is
q-critical, the opposite shell is q-free, and the first apex supplies a
second q-free row. -/
structure RetainedSourceReturnExactFourU5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) : Type where
  firstPhysicalB : Finset ℝ²
  secondPhysicalB : Finset ℝ²
  firstDangerous :
    U5DangerousTriple D P.firstPartner S.oppApex1
      ((SelectedClass D.A S.oppApex1 radius).erase P.firstPartner)
  secondDangerous :
    U5DangerousTriple D P.secondPartner S.oppApex1
      ((SelectedClass D.A S.oppApex1 radius).erase P.secondPartner)
  firstCriticalAtFirstBlocker :
    U5QCriticalTripleClass D P.firstPartner
      (H.centerAt W.first W.first_mem_A)
      ((H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support.erase
        P.firstPartner)
  firstDeletedAtSecondBlocker :
    U5QDeletedK4Class D P.firstPartner
      (H.centerAt W.second W.second_mem_A)
      (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support
  firstDeletedAtPhysical :
    U5QDeletedK4Class D P.firstPartner S.oppApex1 firstPhysicalB
  secondCriticalAtSecondBlocker :
    U5QCriticalTripleClass D P.secondPartner
      (H.centerAt W.second W.second_mem_A)
      ((H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support.erase
        P.secondPartner)
  secondDeletedAtFirstBlocker :
    U5QDeletedK4Class D P.secondPartner
      (H.centerAt W.first W.first_mem_A)
      (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support
  secondDeletedAtPhysical :
    U5QDeletedK4Class D P.secondPartner S.oppApex1 secondPhysicalB

/-- Exact source-return classification on the complete retained radius class. -/
inductive RetainedSourceReturnRadiusOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R) : Type
  | jointDeletion (data : RetainedSourceReturnJointDeletion W)
  | exactFourPartition (data : RetainedSourceReturnExactFourPartition W)

private theorem source_ne_of_not_mem_ownShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source z : ℝ²} {hsource : source ∈ D.A}
    (hz : z ∉
      (H.selectedAt source hsource).toCriticalFourShell.support) :
    z ≠ source := by
  intro h
  subst z
  exact hz
    (H.selectedAt source hsource).toCriticalFourShell.q_mem_support

private theorem exists_partner_of_card_two
    {A : Finset ℝ²} {source : ℝ²}
    (hcard : A.card = 2) (hsource : source ∈ A) :
    ∃ partner : ℝ², partner ≠ source ∧ A = {source, partner} := by
  have herase : (A.erase source).card = 1 := by
    rw [Finset.card_erase_of_mem hsource, hcard]
  rw [Finset.card_eq_one] at herase
  rcases herase with ⟨partner, hpartner⟩
  have hpartnerErase : partner ∈ A.erase source := by simp [hpartner]
  refine ⟨partner, (Finset.mem_erase.mp hpartnerErase).1, ?_⟩
  calc
    A = insert source (A.erase source) := (Finset.insert_erase hsource).symm
    _ = {source, partner} := by rw [hpartner]

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private def criticalShellToQAllowedK4Class
    {D : CounterexampleData} {source center : ℝ²}
    (K : CriticalFourShell D.A source center) :
    U5QAllowedK4Class D center K.support where
  subset := by
    intro z hz
    exact Finset.mem_erase.mpr
      ⟨fun hzc ↦ K.center_not_mem_support (hzc ▸ hz), K.support_subset_A hz⟩
  card_four := by rw [K.support_card]
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

private theorem dangerousTriple_of_exactFourClass
    {D : CounterexampleData} {p q : ℝ²} {radius : ℝ}
    (hpA : p ∈ D.A) (hradiusPos : 0 < radius)
    (hcard : (SelectedClass D.A p radius).card = 4)
    (hq : q ∈ SelectedClass D.A p radius) :
    U5DangerousTriple D q p
      ((SelectedClass D.A p radius).erase q) := by
  let C := SelectedClass D.A p radius
  have hqA : q ∈ D.A := (mem_selectedClass.mp hq).1
  have hpqRadius : dist p q = radius := (mem_selectedClass.mp hq).2
  have hpq : p ≠ q := by
    intro h
    rw [h, dist_self] at hpqRadius
    linarith
  have hEraseCard : (C.erase q).card = 3 := by
    rw [Finset.card_erase_of_mem (by simpa [C] using hq)]
    simpa [C] using hcard
  have hEraseSubA : C.erase q ⊆ D.A := by
    intro z hz
    exact (mem_selectedClass.mp (Finset.mem_erase.mp hz).2).1
  refine {
    q_mem := hqA
    p_mem := hpA
    p_ne_q := hpq
    T_subset := ?_
    T_card := hEraseCard
    T_noncollinear :=
      (D.convex.mono hEraseSubA).not_collinear_of_card_ge_three (by omega)
    q_radius_pos := by simpa only [hpqRadius] using hradiusPos
    T_same_radius := ?_ }
  · intro z hz
    have hzErase := Finset.mem_erase.mp hz
    have hzC : z ∈ C := hzErase.2
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzC).1
    have hzp : z ≠ p := by
      intro h
      have hzero := (mem_selectedClass.mp hzC).2
      rw [h, dist_self] at hzero
      linarith
    change z ∈ (D.A.erase q).erase p
    exact Finset.mem_erase.mpr
      ⟨hzp, Finset.mem_erase.mpr ⟨hzErase.1, hzA⟩⟩
  · intro z hz
    have hzC : z ∈ C := (Finset.mem_erase.mp hz).2
    calc
      dist p z = radius := (mem_selectedClass.mp hzC).2
      _ = dist p q := hpqRadius.symm

/-- The joint-deletion branch already lands on the correct U5 mining object:
one dangerous first-apex triple, two source-exact q-deleted blocker rows, and
the actual q-critical row selected by the global critical system. -/
theorem RetainedSourceReturnJointDeletion.nonempty_u5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (J : RetainedSourceReturnJointDeletion W) :
    Nonempty (RetainedSourceReturnJointU5Ingress J) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  have hsourceA : J.source ∈ D.A := (mem_selectedClass.mp J.source_mem_radius).1
  have hfirstNeApex : W.first ≠ S.oppApex1 := by
    have happ := oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
    simpa only [happ] using
      S.capInteriorByIndex_ne_oppositeVertexByIndex
        W.first_mem_capInterior
  have hradiusPos : 0 < radius := by
    have hdistPos : 0 < dist S.oppApex1 W.first :=
      dist_pos.mpr hfirstNeApex.symm
    have hdistRadius : dist S.oppApex1 W.first = radius := by
      simpa only [dist_comm] using
        (mem_selectedClass.mp W.first_mem_radius).2
    simpa only [hdistRadius] using hdistPos
  have hsourceNeApex : J.source ≠ S.oppApex1 := by
    intro h
    have hzero := (mem_selectedClass.mp J.source_mem_radius).2
    rw [h, dist_self] at hzero
    linarith
  have hfirstC : W.first ∈ C := by simpa [C] using W.first_mem_radius
  have hsecondC : W.second ∈ C := by simpa [C] using W.second_mem_radius
  have hsourceC : J.source ∈ C := by simpa [C] using J.source_mem_radius
  have hthreeCard : ({J.source, W.first, W.second} : Finset ℝ²).card = 3 := by
    simp [J.source_ne_first, J.source_ne_second, W.first_ne_second]
  have hthird :
      ∃ third ∈ C, third ∉ ({J.source, W.first, W.second} : Finset ℝ²) := by
    by_contra hnone
    push_neg at hnone
    have hsub : C ⊆ ({J.source, W.first, W.second} : Finset ℝ²) := by
      intro z hz
      exact hnone z hz
    have hcard := Finset.card_le_card hsub
    have hCfour : 4 ≤ C.card := by
      simpa [C] using R.frontierRadius_class_card_ge_four
    rw [hthreeCard] at hcard
    omega
  rcases hthird with ⟨third, hthirdC, hthirdFresh⟩
  have hthirdNeSource : third ≠ J.source := by
    intro h
    apply hthirdFresh
    simp [h]
  have hthirdNeFirst : third ≠ W.first := by
    intro h
    apply hthirdFresh
    simp [h]
  have hthirdNeSecond : third ≠ W.second := by
    intro h
    apply hthirdFresh
    simp [h]
  let T : Finset ℝ² := {W.first, W.second, third}
  have hfirstNotTail :
      W.first ∉ ({W.second, third} : Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨W.first_ne_second, hthirdNeFirst.symm⟩
  have hsecondNotThird : W.second ∉ ({third} : Finset ℝ²) := by
    simpa only [Finset.mem_singleton] using hthirdNeSecond.symm
  have hTcard : T.card = 3 := by
    simp only [T, Finset.card_insert_of_notMem hfirstNotTail,
      Finset.card_insert_of_notMem hsecondNotThird, Finset.card_singleton]
  have hTsubA : T ⊆ D.A := by
    intro z hz
    simp only [T, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact W.first_mem_A
    · exact W.second_mem_A
    · exact (mem_selectedClass.mp hthirdC).1
  have hTnoncollinear : ¬ Collinear ℝ (T : Set ℝ²) := by
    exact (D.convex.mono hTsubA).not_collinear_of_card_ge_three (by omega)
  have hTsubsetSkeleton : T ⊆ (D.skeleton J.source).erase S.oppApex1 := by
    intro z hz
    have hzC : z ∈ C := by
      simp only [T, Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact hfirstC
      · exact hsecondC
      · exact hthirdC
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzC).1
    have hzNeSource : z ≠ J.source := by
      simp only [T, Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact J.source_ne_first.symm
      · exact J.source_ne_second.symm
      · exact hthirdNeSource
    have hzNeApex : z ≠ S.oppApex1 := by
      intro h
      have hzero := (mem_selectedClass.mp hzC).2
      rw [h, dist_self] at hzero
      linarith
    change z ∈ (D.A.erase J.source).erase S.oppApex1
    exact Finset.mem_erase.mpr
      ⟨hzNeApex, Finset.mem_erase.mpr ⟨hzNeSource, hzA⟩⟩
  let dangerous : U5DangerousTriple D J.source S.oppApex1 T := {
    q_mem := hsourceA
    p_mem := J.firstPacket.center₁_mem_A
    p_ne_q := hsourceNeApex.symm
    T_subset := hTsubsetSkeleton
    T_card := hTcard
    T_noncollinear := hTnoncollinear
    q_radius_pos := dist_pos.mpr hsourceNeApex.symm
    T_same_radius := by
      intro z hz
      have hzC : z ∈ C := by
        simp only [T, Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl | rfl
        · exact hfirstC
        · exact hsecondC
        · exact hthirdC
      calc
        dist S.oppApex1 z = radius := (mem_selectedClass.mp hzC).2
        _ = dist S.oppApex1 J.source :=
          (mem_selectedClass.mp J.source_mem_radius).2.symm }
  let actualShell :=
    (H.selectedAt J.source hsourceA).toCriticalFourShell
  have hactualCritical :
      Nonempty (U5QCriticalTripleClass D J.source
        (H.centerAt J.source hsourceA) (actualShell.support.erase J.source)) :=
    (criticalShellToQAllowedK4Class actualShell).qCriticalTriple_of_mem_q
      actualShell.support_card actualShell.q_mem_support
  rcases hactualCritical with ⟨actualCritical⟩
  exact ⟨{
    third := third
    third_mem_radius := by simpa [C] using hthirdC
    third_ne_source := hthirdNeSource
    third_ne_first := hthirdNeFirst
    third_ne_second := hthirdNeSecond
    dangerous := by simpa [T] using dangerous
    firstBlockerRow :=
      (criticalShellToQAllowedK4Class
        (H.selectedAt W.first W.first_mem_A).toCriticalFourShell)
      |>.toQDeletedK4Class_of_not_mem_q J.source_not_mem_firstShell
    secondBlockerRow :=
      (criticalShellToQAllowedK4Class
        (H.selectedAt W.second W.second_mem_A).toCriticalFourShell)
      |>.toQDeletedK4Class_of_not_mem_q J.source_not_mem_secondShell
    actualCriticalRow := by simpa [actualShell] using actualCritical }⟩

/-- The exact-four partition exposes two dual, source-valid U5 mining
surfaces.  This is the correct finite incidence object; it is not itself a
terminal incompatibility. -/
theorem RetainedSourceReturnExactFourPartition.nonempty_u5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    (P : RetainedSourceReturnExactFourPartition W) :
    Nonempty (RetainedSourceReturnExactFourU5Ingress P) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  let K₁ := (H.selectedAt W.first W.first_mem_A).toCriticalFourShell
  let K₂ := (H.selectedAt W.second W.second_mem_A).toCriticalFourShell
  have hfirstPartnerI₁ : P.firstPartner ∈ K₁.support ∩ C := by
    rw [P.firstHits_eq]
    simp
  have hsecondPartnerI₂ : P.secondPartner ∈ K₂.support ∩ C := by
    rw [P.secondHits_eq]
    simp
  have hfirstPartnerC : P.firstPartner ∈ C :=
    (Finset.mem_inter.mp hfirstPartnerI₁).2
  have hsecondPartnerC : P.secondPartner ∈ C :=
    (Finset.mem_inter.mp hsecondPartnerI₂).2
  have hfirstPartnerK₁ : P.firstPartner ∈ K₁.support :=
    (Finset.mem_inter.mp hfirstPartnerI₁).1
  have hsecondPartnerK₂ : P.secondPartner ∈ K₂.support :=
    (Finset.mem_inter.mp hsecondPartnerI₂).1
  have hfirstPartnerNotK₂ : P.firstPartner ∉ K₂.support := by
    intro h
    exact (Finset.disjoint_left.mp P.hits_disjoint)
      hfirstPartnerI₁ (Finset.mem_inter.mpr ⟨h, hfirstPartnerC⟩)
  have hsecondPartnerNotK₁ : P.secondPartner ∉ K₁.support := by
    intro h
    exact (Finset.disjoint_left.mp P.hits_disjoint)
      (Finset.mem_inter.mpr ⟨h, hsecondPartnerC⟩) hsecondPartnerI₂
  have hfirstPartnerA : P.firstPartner ∈ D.A :=
    (mem_selectedClass.mp hfirstPartnerC).1
  have hsecondPartnerA : P.secondPartner ∈ D.A :=
    (mem_selectedClass.mp hsecondPartnerC).1
  have hfirstNeApex : W.first ≠ S.oppApex1 := by
    have happ := oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
    simpa only [happ] using
      S.capInteriorByIndex_ne_oppositeVertexByIndex
        W.first_mem_capInterior
  have hradiusPos : 0 < radius := by
    have hdistPos : 0 < dist S.oppApex1 W.first :=
      dist_pos.mpr hfirstNeApex.symm
    have hdistRadius : dist S.oppApex1 W.first = radius := by
      simpa only [dist_comm] using
        (mem_selectedClass.mp W.first_mem_radius).2
    simpa only [hdistRadius] using hdistPos
  have firstDangerous :
      U5DangerousTriple D P.firstPartner S.oppApex1
        ((SelectedClass D.A S.oppApex1 radius).erase P.firstPartner) :=
    dangerousTriple_of_exactFourClass W.firstPacket.center₁_mem_A hradiusPos
      P.class_card_eq_four (by simpa [C] using hfirstPartnerC)
  have secondDangerous :
      U5DangerousTriple D P.secondPartner S.oppApex1
        ((SelectedClass D.A S.oppApex1 radius).erase P.secondPartner) :=
    dangerousTriple_of_exactFourClass W.firstPacket.center₁_mem_A hradiusPos
      P.class_card_eq_four (by simpa [C] using hsecondPartnerC)
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      (D := D) (q := P.firstPartner) (center := S.oppApex1)
      (by
        simpa [CounterexampleData.skeleton] using
          R.firstApexFullyDeletionRobust.survives
            P.firstPartner hfirstPartnerA) with
    ⟨firstPhysicalB, ⟨firstPhysicalRow⟩, _⟩
  rcases U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
      (D := D) (q := P.secondPartner) (center := S.oppApex1)
      (by
        simpa [CounterexampleData.skeleton] using
          R.firstApexFullyDeletionRobust.survives
            P.secondPartner hsecondPartnerA) with
    ⟨secondPhysicalB, ⟨secondPhysicalRow⟩, _⟩
  have firstCritical :
      Nonempty (U5QCriticalTripleClass D P.firstPartner
        (H.centerAt W.first W.first_mem_A)
        (K₁.support.erase P.firstPartner)) :=
    (criticalShellToQAllowedK4Class K₁).qCriticalTriple_of_mem_q
      K₁.support_card hfirstPartnerK₁
  have secondCritical :
      Nonempty (U5QCriticalTripleClass D P.secondPartner
        (H.centerAt W.second W.second_mem_A)
        (K₂.support.erase P.secondPartner)) :=
    (criticalShellToQAllowedK4Class K₂).qCriticalTriple_of_mem_q
      K₂.support_card hsecondPartnerK₂
  rcases firstCritical with ⟨firstCriticalRow⟩
  rcases secondCritical with ⟨secondCriticalRow⟩
  exact ⟨{
    firstPhysicalB := firstPhysicalB
    secondPhysicalB := secondPhysicalB
    firstDangerous := firstDangerous
    secondDangerous := secondDangerous
    firstCriticalAtFirstBlocker := by simpa [K₁] using firstCriticalRow
    firstDeletedAtSecondBlocker :=
      (criticalShellToQAllowedK4Class K₂).toQDeletedK4Class_of_not_mem_q
        hfirstPartnerNotK₂
    firstDeletedAtPhysical := firstPhysicalRow
    secondCriticalAtSecondBlocker := by simpa [K₂] using secondCriticalRow
    secondDeletedAtFirstBlocker :=
      (criticalShellToQAllowedK4Class K₁).toQDeletedK4Class_of_not_mem_q
        hsecondPartnerNotK₁
    secondDeletedAtPhysical := secondPhysicalRow }⟩

/-- The source-return arm either renews one deletion at three concrete
pairwise-distinct centers, or leaves an exact complementary two-by-two cut of
the retained radius class. -/
theorem nonempty_sourceReturnRadiusOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (W : RetainedMatchingTwoStepCommonDeletionWalk R)
    (hreturn : W.next = W.first) :
    Nonempty (RetainedSourceReturnRadiusOutcome W) := by
  classical
  let C := SelectedClass D.A S.oppApex1 radius
  let I₁ :=
    (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support ∩ C
  let I₂ :=
    (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support ∩ C
  have hI₁Two : I₁.card ≤ 2 := by
    simpa [I₁, C] using
      criticalShell_inter_frontierRadiusClass_card_le_two
        R W.first W.first_mem_A
  have hI₂Two : I₂.card ≤ 2 := by
    simpa [I₂, C] using
      criticalShell_inter_frontierRadiusClass_card_le_two
        R W.second W.second_mem_A
  have hfirstI₁ : W.first ∈ I₁ := by
    exact Finset.mem_inter.mpr
      ⟨(H.selectedAt W.first W.first_mem_A).toCriticalFourShell.q_mem_support,
        W.first_mem_radius⟩
  have hsecondI₂ : W.second ∈ I₂ := by
    exact Finset.mem_inter.mpr
      ⟨(H.selectedAt W.second W.second_mem_A).toCriticalFourShell.q_mem_support,
        W.second_mem_radius⟩
  have hsecondNotI₁ : W.second ∉ I₁ := by
    intro h
    exact W.second_not_mem_first_shell (Finset.mem_inter.mp h).1
  have hfirstNotI₂ : W.first ∉ I₂ := by
    intro h
    have hnextNot := W.next_not_mem_second_shell
    rw [hreturn] at hnextNot
    exact hnextNot (Finset.mem_inter.mp h).1
  by_cases hjoint : (C \ (I₁ ∪ I₂)).Nonempty
  · rcases hjoint with ⟨source, hsource⟩
    have hsourceC : source ∈ C := (Finset.mem_sdiff.mp hsource).1
    have hsourceNotUnion : source ∉ I₁ ∪ I₂ :=
      (Finset.mem_sdiff.mp hsource).2
    have hsourceNotI₁ : source ∉ I₁ := by
      intro h
      exact hsourceNotUnion (Finset.mem_union_left I₂ h)
    have hsourceNotI₂ : source ∉ I₂ := by
      intro h
      exact hsourceNotUnion (Finset.mem_union_right I₁ h)
    have hsourceNotShell₁ :
        source ∉
          (H.selectedAt W.first W.first_mem_A).toCriticalFourShell.support := by
      intro h
      exact hsourceNotI₁ (Finset.mem_inter.mpr ⟨h, hsourceC⟩)
    have hsourceNotShell₂ :
        source ∉
          (H.selectedAt W.second W.second_mem_A).toCriticalFourShell.support := by
      intro h
      exact hsourceNotI₂ (Finset.mem_inter.mpr ⟨h, hsourceC⟩)
    have hsourceA : source ∈ D.A := (mem_selectedClass.mp hsourceC).1
    have hsourceNeFirst : source ≠ W.first :=
      source_ne_of_not_mem_ownShell hsourceNotShell₁
    have hsourceNeSecond : source ≠ W.second :=
      source_ne_of_not_mem_ownShell hsourceNotShell₂
    have hsurvivesFirstApex :
        HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
      R.firstApexFullyDeletionRobust.survives source hsourceA
    have hsurvivesFirstBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt W.first W.first_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H W.first_mem_A).mpr hsourceNotShell₁
    have hsurvivesSecondBlocker :
        HasNEquidistantPointsAt 4 (D.A.erase source)
          (H.centerAt W.second W.second_mem_A) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H W.second_mem_A).mpr hsourceNotShell₂
    rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        W.firstPacket.center₁_mem_A W.firstPacket.center₂_mem_A
        W.firstPacket.centers_ne hsurvivesFirstApex hsurvivesFirstBlocker with
      ⟨firstPacket⟩
    rcases nonempty_commonDeletionTwoCenterPacket H hsourceA
        W.secondPacket.center₁_mem_A W.secondPacket.center₂_mem_A
        W.secondPacket.centers_ne hsurvivesFirstApex hsurvivesSecondBlocker with
      ⟨secondPacket⟩
    exact ⟨RetainedSourceReturnRadiusOutcome.jointDeletion {
      sourceReturn := hreturn
      source := source
      source_mem_radius := hsourceC
      source_ne_first := hsourceNeFirst
      source_ne_second := hsourceNeSecond
      source_not_mem_firstShell := hsourceNotShell₁
      source_not_mem_secondShell := hsourceNotShell₂
      firstBlocker_ne_secondBlocker :=
        (W.secondBlocker_ne_firstBlocker).symm
      firstPacket := firstPacket
      secondPacket := secondPacket }⟩
  · have hCsub : C ⊆ I₁ ∪ I₂ := by
      intro z hzC
      by_contra hzUnion
      exact hjoint ⟨z, Finset.mem_sdiff.mpr ⟨hzC, hzUnion⟩⟩
    have hUnionSub : I₁ ∪ I₂ ⊆ C := by
      intro z hz
      rcases Finset.mem_union.mp hz with hzI₁ | hzI₂
      · exact (Finset.mem_inter.mp hzI₁).2
      · exact (Finset.mem_inter.mp hzI₂).2
    have hUnion : I₁ ∪ I₂ = C :=
      Finset.Subset.antisymm hUnionSub hCsub
    have hCfour : C.card = 4 := by
      have hUnionCard : C.card ≤ I₁.card + I₂.card := by
        rw [← hUnion]
        exact Finset.card_union_le I₁ I₂
      have hCge : 4 ≤ C.card := by
        simpa [C] using R.frontierRadius_class_card_ge_four
      omega
    have hI₁Card : I₁.card = 2 := by
      have hUnionCard : C.card ≤ I₁.card + I₂.card := by
        rw [← hUnion]
        exact Finset.card_union_le I₁ I₂
      have hI₁Pos : 0 < I₁.card := Finset.card_pos.mpr ⟨W.first, hfirstI₁⟩
      omega
    have hI₂Card : I₂.card = 2 := by
      have hUnionCard : C.card ≤ I₁.card + I₂.card := by
        rw [← hUnion]
        exact Finset.card_union_le I₁ I₂
      have hI₂Pos : 0 < I₂.card := Finset.card_pos.mpr ⟨W.second, hsecondI₂⟩
      omega
    have hInterEmpty : I₁ ∩ I₂ = ∅ := by
      apply Finset.card_eq_zero.mp
      have hcardIdentity := Finset.card_union_add_card_inter I₁ I₂
      rw [hUnion, hCfour, hI₁Card, hI₂Card] at hcardIdentity
      omega
    have hDisjoint : Disjoint I₁ I₂ := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact hInterEmpty
    rcases exists_partner_of_card_two hI₁Card hfirstI₁ with
      ⟨firstPartner, hfirstPartnerNe, hI₁Eq⟩
    rcases exists_partner_of_card_two hI₂Card hsecondI₂ with
      ⟨secondPartner, hsecondPartnerNe, hI₂Eq⟩
    have hfirstPartnerI₁ : firstPartner ∈ I₁ := by simp [hI₁Eq]
    have hsecondPartnerI₂ : secondPartner ∈ I₂ := by simp [hI₂Eq]
    have hfirstPartnerNeSecond : firstPartner ≠ W.second := by
      intro h
      subst firstPartner
      exact hsecondNotI₁ hfirstPartnerI₁
    have hsecondPartnerNeFirst : secondPartner ≠ W.first := by
      intro h
      subst secondPartner
      exact hfirstNotI₂ hsecondPartnerI₂
    have hpartnersNe : firstPartner ≠ secondPartner := by
      intro h
      subst secondPartner
      exact (Finset.disjoint_left.mp hDisjoint)
        hfirstPartnerI₁ hsecondPartnerI₂
    exact ⟨RetainedSourceReturnRadiusOutcome.exactFourPartition {
      sourceReturn := hreturn
      class_card_eq_four := by simpa [C] using hCfour
      firstPartner := firstPartner
      secondPartner := secondPartner
      firstPartner_ne_first := hfirstPartnerNe
      secondPartner_ne_second := hsecondPartnerNe
      firstPartner_ne_second := hfirstPartnerNeSecond
      secondPartner_ne_first := hsecondPartnerNeFirst
      partners_ne := hpartnersNe
      firstHits_eq := by simpa [I₁, C] using hI₁Eq
      secondHits_eq := by simpa [I₂, C] using hI₂Eq
      hits_disjoint := by simpa [I₁, I₂, C] using hDisjoint
      hits_union_eq_class := by simpa [I₁, I₂, C] using hUnion }⟩

#print axioms nonempty_sourceReturnRadiusOutcome
#print axioms RetainedSourceReturnJointDeletion.nonempty_u5Ingress
#print axioms RetainedSourceReturnExactFourPartition.nonempty_u5Ingress

end

end ATailMatchingSourceReturnTerminalScratch
end Problem97
