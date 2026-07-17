import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle

/-!
# Exact-five mutual-omission criss-cross normal form

One mutual omission edge gives two origin-tagged common-deletion packets.
Deleting either source preserves K4 both at the physical apex and at the
other source's actual blocker.  Criticality and exact-five uniqueness make
all four selected supports canonical.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveMutualOmissionClosureScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveCommonDeletionNormalForm
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

/-- A deleted row at an actual blocker is forced to be the retained selected
critical support. -/
theorem commonDeletion_blockerRow_eq_actualCriticalSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted source otherCenter : ℝ²} {hsource : source ∈ D.A}
    (C : CommonDeletionTwoCenterPacket D H deleted
      (H.centerAt source hsource) otherCenter) :
    C.B₁ = (H.selectedAt source hsource).toCriticalFourShell.support := by
  have hnormal := cross_survival_unique_radius_and_exact_support
    H hsource C.survives₁
  have hsub := qDeleted_support_subset_selectedClass C.row₁
  have hradius :
      C.row₁.radius =
        (H.selectedAt source hsource).toCriticalFourShell.radius := by
    apply hnormal.2 C.row₁.radius C.row₁.radius_pos
    exact C.row₁.card_four.trans (Finset.card_le_card hsub)
  rw [hradius, hnormal.1] at hsub
  apply Finset.eq_of_subset_of_card_le hsub
  rw [(H.selectedAt source hsource).toCriticalFourShell.support_card,
    C.B₁_card]

/-- A deleted row at the physical apex is forced to be the complete
exact-five physical class with the deleted source erased. -/
theorem commonDeletion_physicalRow_eq_exactFiveClass_erase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {deleted otherCenter : ℝ²}
    (hdeleted : deleted ∈
      SelectedClass D.A S.oppApex2 profile.radius)
    (C : CommonDeletionTwoCenterPacket D H deleted
      otherCenter S.oppApex2) :
    C.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase deleted := by
  have hsubAmbient := qDeleted_support_subset_ambientSelectedClass C.row₂
  have hradius : C.row₂.radius = profile.radius := by
    apply profile.unique_K4_radius C.row₂.radius C.row₂.radius_pos
    exact C.row₂.card_four.trans (Finset.card_le_card hsubAmbient)
  have hsubErase := qDeleted_support_subset_selectedClass C.row₂
  rw [hradius, selectedClass_erase_eq] at hsubErase
  apply Finset.eq_of_subset_of_card_le hsubErase
  rw [Finset.card_erase_of_mem hdeleted, profile.class_card_eq_five,
    C.B₂_card]

/-- The complete source-faithful local normal form of one mutual-omission
edge.  The current deletion survives at the successor blocker and physical
apex; the successor deletion survives at the current blocker and physical
apex.  All four selected supports are retained explicitly. -/
structure MutualOmissionCrissCrossNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) where
  currentPacket :
    CommonDeletionTwoCenterPacket D H
      (K.source E.index).1
      (H.centerAt (K.source (K.successorIndex E.index)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex E.index))))
      S.oppApex2
  successorPacket :
    CommonDeletionTwoCenterPacket D H
      (K.source (K.successorIndex E.index)).1
      (H.centerAt (K.source E.index).1
        (PhysicalVertex.mem_A (K.source E.index)))
      S.oppApex2
  current_blockerRow_eq :
    currentPacket.B₁ =
      (H.selectedAt (K.source (K.successorIndex E.index)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex E.index)))).toCriticalFourShell.support
  current_physicalRow_eq :
    currentPacket.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase
        (K.source E.index).1
  successor_blockerRow_eq :
    successorPacket.B₁ =
      (H.selectedAt (K.source E.index).1
        (PhysicalVertex.mem_A
          (K.source E.index))).toCriticalFourShell.support
  successor_physicalRow_eq :
    successorPacket.B₂ =
      (SelectedClass D.A S.oppApex2 profile.radius).erase
        (K.source (K.successorIndex E.index)).1

/-- Every production mutual-omission edge reaches the exact criss-cross
normal form without an additional producer premise. -/
theorem nonempty_mutualOmissionCrissCrossNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    Nonempty (MutualOmissionCrissCrossNormalForm E) := by
  let i := E.index
  let j := K.successorIndex i
  let q := (K.source i).1
  let w := (K.source j).1
  let bq := H.centerAt q (PhysicalVertex.mem_A (K.source i))
  let bw := H.centerAt w (PhysicalVertex.mem_A (K.source j))
  have hqA : q ∈ D.A := PhysicalVertex.mem_A (K.source i)
  have hwA : w ∈ D.A := PhysicalVertex.mem_A (K.source j)
  have hbqA : bq ∈ D.A := blocker_mem_A H hqA
  have hbwA : bw ∈ D.A := blocker_mem_A H hwA
  have hpA : S.oppApex2 ∈ D.A := oppApex2_mem_A S
  have hbw_ne_p : bw ≠ S.oppApex2 := by
    simpa [bw, w, j] using K.actualBlocker_ne_physicalApex j
  have hbq_ne_p : bq ≠ S.oppApex2 := by
    simpa [bq, q, i] using K.actualBlocker_ne_physicalApex i
  have hq_bw : HasNEquidistantPointsAt 4 (D.A.erase q) bw := by
    simpa [q, bw, w, i, j] using E.reverse_deletion_survives_actualBlocker
  have hq_p : HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2 := by
    simpa [q, i] using K.physicalApex_survives_sourceDeletion i
  have hw_bq : HasNEquidistantPointsAt 4 (D.A.erase w) bq := by
    simpa [w, bq, q, i, j] using
      K.successor_deletion_survives_actualBlocker i
  have hw_p : HasNEquidistantPointsAt 4 (D.A.erase w) S.oppApex2 := by
    simpa [w, j] using K.physicalApex_survives_sourceDeletion j
  rcases nonempty_commonDeletionTwoCenterPacket H hqA hbwA hpA
      hbw_ne_p hq_bw hq_p with ⟨currentPacket⟩
  rcases nonempty_commonDeletionTwoCenterPacket H hwA hbqA hpA
      hbq_ne_p hw_bq hw_p with ⟨successorPacket⟩
  refine ⟨{
    currentPacket := currentPacket
    successorPacket := successorPacket
    current_blockerRow_eq := ?_
    current_physicalRow_eq := ?_
    successor_blockerRow_eq := ?_
    successor_physicalRow_eq := ?_ }⟩
  · exact commonDeletion_blockerRow_eq_actualCriticalSupport currentPacket
  · apply commonDeletion_physicalRow_eq_exactFiveClass_erase
    exact PhysicalVertex.mem_radiusClass (K.source i)
  · exact commonDeletion_blockerRow_eq_actualCriticalSupport successorPacket
  · apply commonDeletion_physicalRow_eq_exactFiveClass_erase
    exact PhysicalVertex.mem_radiusClass (K.source j)

/-- Deleting any ambient source leaves a K4 witness at the physical apex,
because its displayed ambient radius class has cardinality five. -/
private theorem physicalApex_survives_erase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (deleted : ℝ²) :
    HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
  refine ⟨profile.radius, profile.radius_pos, ?_⟩
  have hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 profile.radius).card := by
    rw [profile.class_card_eq_five]
  have hfour := selectedClass_erase_card_ge_of_succ_le
    (A := D.A) (x := deleted) (s := S.oppApex2)
    (d := profile.radius) (n := 4) hfive
  simpa [SelectedClass] using hfour

/-- No source in the total critical system can have the exact-five physical
apex as its actual blocker. -/
theorem actualBlocker_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    {source : ℝ²} (hsource : source ∈ D.A) :
    H.centerAt source hsource ≠ S.oppApex2 :=
  ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
    H hsource (physicalApex_survives_erase profile source)

/-- If both prescribed deletions fail at an actual blocker, its selected
critical support contains both deleted points, so that blocker bisects the
pair. -/
private theorem actualBlocker_dist_eq_of_both_deletions_blocked
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q w source : ℝ²} (hsource : source ∈ D.A)
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source hsource))
    (hwBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source hsource)) :
    dist (H.centerAt source hsource) q =
      dist (H.centerAt source hsource) w := by
  let R := (H.selectedAt source hsource).toCriticalFourShell
  have hqR : q ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlocked
  have hwR : w ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hwBlocked
  exact (R.support_eq_radius q hqR).trans
    (R.support_eq_radius w hwR).symm

/-- The physical apex already occupies one carrier point on the pair's
perpendicular bisector.  Hence convex independence permits at most one
distinct actual-blocker center at which both deletions fail. -/
private theorem actualBlockers_eq_of_both_deletions_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {q w : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A) (hqw : q ≠ w)
    (hpEq : dist S.oppApex2 q = dist S.oppApex2 w)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ D.A) (hsource₂ : source₂ ∈ D.A)
    (hqBlocked₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source₁ hsource₁))
    (hwBlocked₁ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source₁ hsource₁))
    (hqBlocked₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
        (H.centerAt source₂ hsource₂))
    (hwBlocked₂ :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source₂ hsource₂)) :
    H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂ := by
  let z₁ := H.centerAt source₁ hsource₁
  let z₂ := H.centerAt source₂ hsource₂
  have hz₁A : z₁ ∈ D.A := blocker_mem_A H hsource₁
  have hz₂A : z₂ ∈ D.A := blocker_mem_A H hsource₂
  have hpA : S.oppApex2 ∈ D.A := oppApex2_mem_A S
  have hz₁p : z₁ ≠ S.oppApex2 := by
    simpa [z₁] using actualBlocker_ne_physicalApex H profile hsource₁
  have hz₂p : z₂ ≠ S.oppApex2 := by
    simpa [z₂] using actualBlocker_ne_physicalApex H profile hsource₂
  have hz₁Eq : dist z₁ q = dist z₁ w := by
    simpa [z₁] using actualBlocker_dist_eq_of_both_deletions_blocked
      hsource₁ hqBlocked₁ hwBlocked₁
  have hz₂Eq : dist z₂ q = dist z₂ w := by
    simpa [z₂] using actualBlocker_dist_eq_of_both_deletions_blocked
      hsource₂ hqBlocked₂ hwBlocked₂
  by_contra hz₁z₂
  have hpFilter :
      S.oppApex2 ∈ D.A.filter (fun center ↦ dist center q = dist center w) :=
    Finset.mem_filter.mpr ⟨hpA, hpEq⟩
  have hz₁Filter :
      z₁ ∈ D.A.filter (fun center ↦ dist center q = dist center w) :=
    Finset.mem_filter.mpr ⟨hz₁A, hz₁Eq⟩
  have hz₂Filter :
      z₂ ∈ D.A.filter (fun center ↦ dist center q = dist center w) :=
    Finset.mem_filter.mpr ⟨hz₂A, hz₂Eq⟩
  have hthree :
      2 < (D.A.filter (fun center ↦ dist center q = dist center w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppApex2, hpFilter, z₁, hz₁Filter, z₂, hz₂Filter,
      hz₁p.symm, hz₂p.symm, hz₁z₂⟩
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hqA hwA hqw
  omega

/-- Strongest global actual-blocker consequence of the mutual physical pair.
Either every actual blocker preserves at least one of the two deletions, or
there is one unique exceptional blocker center at which both fail.  This
uses the full total critical map and convexity, not just the two local rows. -/
theorem allActualBlockers_crossSurvive_or_uniqueDoubleBlockingCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    (∀ (source : ℝ²) (hsource : source ∈ D.A),
      HasNEquidistantPointsAt 4
          (D.A.erase (K.source E.index).1)
          (H.centerAt source hsource) ∨
        HasNEquidistantPointsAt 4
          (D.A.erase (K.source (K.successorIndex E.index)).1)
          (H.centerAt source hsource)) ∨
      ∃ (exceptionalCenter : ℝ²),
        exceptionalCenter ∈ D.A ∧
        exceptionalCenter ≠ S.oppApex2 ∧
        (¬ HasNEquidistantPointsAt 4
          (D.A.erase (K.source E.index).1) exceptionalCenter) ∧
        (¬ HasNEquidistantPointsAt 4
          (D.A.erase (K.source (K.successorIndex E.index)).1)
            exceptionalCenter) ∧
        ∀ (source : ℝ²) (hsource : source ∈ D.A),
          HasNEquidistantPointsAt 4
              (D.A.erase (K.source E.index).1)
              (H.centerAt source hsource) ∨
            HasNEquidistantPointsAt 4
              (D.A.erase (K.source (K.successorIndex E.index)).1)
              (H.centerAt source hsource) ∨
            H.centerAt source hsource = exceptionalCenter := by
  classical
  let q := (K.source E.index).1
  let w := (K.source (K.successorIndex E.index)).1
  have hqA : q ∈ D.A := PhysicalVertex.mem_A (K.source E.index)
  have hwA : w ∈ D.A :=
    PhysicalVertex.mem_A (K.source (K.successorIndex E.index))
  have hqw : q ≠ w := by
    intro h
    apply K.successor_source_ne E.index
    apply Subtype.ext
    exact h.symm
  have hpEq : dist S.oppApex2 q = dist S.oppApex2 w := by
    have hqRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass (K.source E.index)) |>.2
    have hwRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass
        (K.source (K.successorIndex E.index))) |>.2
    simpa only [dist_comm] using hqRadius.trans hwRadius.symm
  by_cases hexception :
      ∃ (source : ℝ²) (hsource : source ∈ D.A),
        (¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt source hsource)) ∧
        (¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source hsource))
  · right
    rcases hexception with
      ⟨source₀, hsource₀, hqBlocked₀, hwBlocked₀⟩
    let z := H.centerAt source₀ hsource₀
    refine ⟨z, blocker_mem_A H hsource₀, ?_, ?_, ?_, ?_⟩
    · simpa [z] using actualBlocker_ne_physicalApex H profile hsource₀
    · simpa [z] using hqBlocked₀
    · simpa [z] using hwBlocked₀
    · intro source hsource
      by_cases hqSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase q)
            (H.centerAt source hsource)
      · exact Or.inl hqSurvives
      · by_cases hwSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase w)
            (H.centerAt source hsource)
        · exact Or.inr (Or.inl hwSurvives)
        · exact Or.inr (Or.inr (by
            simpa [z] using
              actualBlockers_eq_of_both_deletions_blocked
                (profile := profile)
                hqA hwA hqw hpEq hsource hsource₀
                hqSurvives hwSurvives hqBlocked₀ hwBlocked₀))
  · left
    intro source hsource
    by_cases hqSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt source hsource)
    · exact Or.inl hqSurvives
    · by_cases hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source hsource)
      · exact Or.inr hwSurvives
      · exact False.elim (hexception
          ⟨source, hsource, hqSurvives, hwSurvives⟩)

/-- A source whose actual blocker blocks both mutual-edge deletions cannot lie
in the physical cap.  The two physical sources localize its blocker into that
cap; the source plus the pair would then give three same-cap points in one
selected four-row. -/
theorem doubleBlockingActualSource_not_mem_physicalCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1)
        (H.centerAt source hsource))
    (hwBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase (K.source (K.successorIndex E.index)).1)
        (H.centerAt source hsource)) :
    source ∉ S.capByIndex S.oppIndex2 := by
  classical
  let q := (K.source E.index).1
  let w := (K.source (K.successorIndex E.index)).1
  let z := H.centerAt source hsource
  let R := (H.selectedAt source hsource).toCriticalFourShell
  have hqA : q ∈ D.A := PhysicalVertex.mem_A (K.source E.index)
  have hwA : w ∈ D.A :=
    PhysicalVertex.mem_A (K.source (K.successorIndex E.index))
  have hqw : q ≠ w := by
    intro h
    apply K.successor_source_ne E.index
    apply Subtype.ext
    exact h.symm
  have hqCapInterior : q ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [q] using K.source_mem_capInterior E.index
  have hwCapInterior : w ∈ S.capInteriorByIndex S.oppIndex2 := by
    simpa [w] using
      K.source_mem_capInterior (K.successorIndex E.index)
  have hzA : z ∈ D.A := blocker_mem_A H hsource
  have hzp : z ≠ S.oppApex2 := by
    simpa [z] using actualBlocker_ne_physicalApex H profile hsource
  have hzEq : dist z q = dist z w := by
    simpa [z, q, w] using
      actualBlocker_dist_eq_of_both_deletions_blocked
        hsource hqBlocked hwBlocked
  have hpEq : dist S.oppApex2 q = dist S.oppApex2 w := by
    have hqRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass (K.source E.index)) |>.2
    have hwRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass
        (K.source (K.successorIndex E.index))) |>.2
    simpa only [dist_comm] using hqRadius.trans hwRadius.symm
  have hzInterior : z ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hzA hzp hqCapInterior hwCapInterior hqw hzEq hpEq
  have hzCap : z ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hzInterior
  have hqR : q ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlocked
  have hwR : w ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hwBlocked
  have hsource_ne_q : source ≠ q := by
    intro h
    subst source
    apply hwBlocked
    simpa [q, w] using K.successor_deletion_survives_actualBlocker E.index
  have hsource_ne_w : source ≠ w := by
    intro h
    subst source
    apply hqBlocked
    simpa [q, w] using E.reverse_deletion_survives_actualBlocker
  intro hsourceCap
  have htripleSubset :
      ({source, q, w} : Finset ℝ²) ⊆
        R.support ∩ S.capByIndex S.oppIndex2 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨R.q_mem_support, hsourceCap⟩
    · exact Finset.mem_inter.mpr
        ⟨hqR, S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          hqCapInterior⟩
    · exact Finset.mem_inter.mpr
        ⟨hwR, S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          hwCapInterior⟩
  have htripleCard : ({source, q, w} : Finset ℝ²).card = 3 := by
    simp [hsource_ne_q, hsource_ne_w, hqw]
  have hthree : 3 ≤ (R.support ∩ S.capByIndex S.oppIndex2).card := by
    calc
      3 = ({source, q, w} : Finset ℝ²).card := htripleCard.symm
      _ ≤ (R.support ∩ S.capByIndex S.oppIndex2).card :=
        Finset.card_le_card htripleSubset
  have htwo : (R.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [R] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 R.toSelectedFourClass hzCap
  omega

/-- Source-indexed critical supports are extensionally equal whenever their
actual blocker centers are equal. -/
private theorem selectedSupport_eq_of_actualBlocker_eq
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {source₁ source₂ : ℝ²}
    (hsource₁ : source₁ ∈ D.A) (hsource₂ : source₂ ∈ D.A)
    (hcenter :
      H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let R₁ := (H.selectedAt source₁ hsource₁).toCriticalFourShell
  let R₂ := (H.selectedAt source₂ hsource₂).toCriticalFourShell
  have hsource₁R₂ : source₁ ∈ R₂.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source₂ hsource₂) (by
        intro hsurvives
        apply H.no_qfree_at source₁ hsource₁
        simpa only [hcenter] using hsurvives)
  have hradii : R₁.radius = R₂.radius := by
    calc
      R₁.radius = dist (H.centerAt source₁ hsource₁) source₁ :=
        (R₁.support_eq_radius source₁ R₁.q_mem_support).symm
      _ = dist (H.centerAt source₂ hsource₂) source₁ :=
        congrArg (fun center ↦ dist center source₁) hcenter
      _ = R₂.radius := R₂.support_eq_radius source₁ hsource₁R₂
  ext x
  constructor
  · intro hx
    apply R₂.off_row_named_label_forbidden (R₁.support_subset_A hx)
    calc
      dist (H.centerAt source₂ hsource₂) x =
          dist (H.centerAt source₁ hsource₁) x :=
        (congrArg (fun center ↦ dist center x) hcenter).symm
      _ = R₁.radius := R₁.support_eq_radius x hx
      _ = R₂.radius := hradii
  · intro hx
    apply R₁.off_row_named_label_forbidden (R₂.support_subset_A hx)
    calc
      dist (H.centerAt source₁ hsource₁) x =
          dist (H.centerAt source₂ hsource₂) x :=
        congrArg (fun center ↦ dist center x) hcenter
      _ = R₂.radius := R₂.support_eq_radius x hx
      _ = R₁.radius := hradii.symm

/-- The source fiber of one actual blocker. -/
noncomputable def actualBlockerFiber
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {source : ℝ²} (hsource : source ∈ D.A) :
    Finset (CriticalShellSystem.CarrierVertex D.A) :=
  Finset.univ.filter fun other ↦
    H.blockerVertex other = H.blockerVertex ⟨source, hsource⟩

/-- If one actual blocker blocks both mutual-edge deletions, at most two
ambient sources can be assigned to it.  All sources in that fiber lie in the
same exact four-support, while the two physical sources already occupy its
two allowable same-cap slots. -/
theorem doubleBlockingActualBlockerFiber_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase (K.source E.index).1)
        (H.centerAt source hsource))
    (hwBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase (K.source (K.successorIndex E.index)).1)
        (H.centerAt source hsource)) :
    (actualBlockerFiber H hsource).card ≤ 2 := by
  classical
  let q := (K.source E.index).1
  let w := (K.source (K.successorIndex E.index)).1
  let R := (H.selectedAt source hsource).toCriticalFourShell
  let outsideCap := R.support \ S.capByIndex S.oppIndex2
  let points : Finset ℝ² :=
    (actualBlockerFiber H hsource).image fun other ↦ other.1
  have hqR : q ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlocked
  have hwR : w ∈ R.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hwBlocked
  have hqCap : q ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior E.index)
  have hwCap : w ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior (K.successorIndex E.index))
  have hqw : q ≠ w := by
    intro h
    apply K.successor_source_ne E.index
    apply Subtype.ext
    exact h.symm
  have hinterTwo :
      2 ≤ (R.support ∩ S.capByIndex S.oppIndex2).card := by
    have hone :
        1 < (R.support ∩ S.capByIndex S.oppIndex2).card := by
      rw [Finset.one_lt_card]
      exact ⟨q, Finset.mem_inter.mpr ⟨hqR, hqCap⟩,
        w, Finset.mem_inter.mpr ⟨hwR, hwCap⟩, hqw⟩
    omega
  have houtsideTwo : outsideCap.card ≤ 2 := by
    have hsplit := Finset.card_sdiff_add_card_inter
      R.support (S.capByIndex S.oppIndex2)
    change (R.support \ S.capByIndex S.oppIndex2).card ≤ 2
    rw [R.support_card] at hsplit
    omega
  have hpoints : points ⊆ outsideCap := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨other, hotherFiber, rfl⟩
    have hblockerVertex := (Finset.mem_filter.mp hotherFiber).2
    have hcenter :
        H.centerAt other.1 other.2 = H.centerAt source hsource :=
      congrArg Subtype.val hblockerVertex
    have hsupports :=
      selectedSupport_eq_of_actualBlocker_eq H other.2 hsource hcenter
    have hotherSupport : other.1 ∈ R.support := by
      rw [← hsupports]
      exact (H.selectedAt other.1 other.2).toCriticalFourShell.q_mem_support
    have hqOther :
        q ∈ (H.selectedAt other.1 other.2).toCriticalFourShell.support := by
      rw [hsupports]
      exact hqR
    have hwOther :
        w ∈ (H.selectedAt other.1 other.2).toCriticalFourShell.support := by
      rw [hsupports]
      exact hwR
    have hqBlockedOther :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt other.1 other.2) := by
      intro hsurvives
      exact ((cross_deletion_survives_iff_not_mem_selected_support
        H other.2).mp hsurvives) hqOther
    have hwBlockedOther :
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt other.1 other.2) := by
      intro hsurvives
      exact ((cross_deletion_survives_iff_not_mem_selected_support
        H other.2).mp hsurvives) hwOther
    have hotherNotCap : other.1 ∉ S.capByIndex S.oppIndex2 :=
      doubleBlockingActualSource_not_mem_physicalCap
        E other.2 hqBlockedOther hwBlockedOther
    exact Finset.mem_sdiff.mpr ⟨hotherSupport, hotherNotCap⟩
  calc
    (actualBlockerFiber H hsource).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ outsideCap.card := Finset.card_le_card hpoints
    _ ≤ 2 := houtsideTwo

/-- Consolidated theorem-facing endpoint for the mutual-omission arm.  It
retains the two canonical crossed packets and the strongest global total-map
split: either every actual blocker preserves one deletion, or one named
double-blocking source determines the unique exceptional center and that
center's entire source fiber has cardinality at most two. -/
theorem nonempty_mutualOmissionGlobalNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    Nonempty (MutualOmissionCrissCrossNormalForm E) ∧
      ((∀ (source : ℝ²) (hsource : source ∈ D.A),
        HasNEquidistantPointsAt 4
            (D.A.erase (K.source E.index).1)
            (H.centerAt source hsource) ∨
          HasNEquidistantPointsAt 4
            (D.A.erase (K.source (K.successorIndex E.index)).1)
            (H.centerAt source hsource)) ∨
        ∃ (source : ℝ²) (hsource : source ∈ D.A),
          (¬ HasNEquidistantPointsAt 4
            (D.A.erase (K.source E.index).1)
            (H.centerAt source hsource)) ∧
          (¬ HasNEquidistantPointsAt 4
            (D.A.erase (K.source (K.successorIndex E.index)).1)
            (H.centerAt source hsource)) ∧
          (∀ (other : ℝ²) (hother : other ∈ D.A),
            HasNEquidistantPointsAt 4
                (D.A.erase (K.source E.index).1)
                (H.centerAt other hother) ∨
              HasNEquidistantPointsAt 4
                (D.A.erase (K.source (K.successorIndex E.index)).1)
                (H.centerAt other hother) ∨
              H.centerAt other hother = H.centerAt source hsource) ∧
          (actualBlockerFiber H hsource).card ≤ 2) := by
  classical
  refine ⟨nonempty_mutualOmissionCrissCrossNormalForm E, ?_⟩
  let q := (K.source E.index).1
  let w := (K.source (K.successorIndex E.index)).1
  have hqA : q ∈ D.A := PhysicalVertex.mem_A (K.source E.index)
  have hwA : w ∈ D.A :=
    PhysicalVertex.mem_A (K.source (K.successorIndex E.index))
  have hqw : q ≠ w := by
    intro h
    apply K.successor_source_ne E.index
    apply Subtype.ext
    exact h.symm
  have hpEq : dist S.oppApex2 q = dist S.oppApex2 w := by
    have hqRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass (K.source E.index)) |>.2
    have hwRadius := mem_selectedClass.mp
      (PhysicalVertex.mem_radiusClass
        (K.source (K.successorIndex E.index))) |>.2
    simpa only [dist_comm] using hqRadius.trans hwRadius.symm
  by_cases hexception :
      ∃ (source : ℝ²) (hsource : source ∈ D.A),
        (¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt source hsource)) ∧
        (¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source hsource))
  · right
    rcases hexception with
      ⟨source, hsource, hqBlocked, hwBlocked⟩
    refine ⟨source, hsource, hqBlocked, hwBlocked, ?_,
      doubleBlockingActualBlockerFiber_card_le_two
        E hsource hqBlocked hwBlocked⟩
    intro other hother
    by_cases hqSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt other hother)
    · exact Or.inl hqSurvives
    · by_cases hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt other hother)
      · exact Or.inr (Or.inl hwSurvives)
      · exact Or.inr (Or.inr
          (actualBlockers_eq_of_both_deletions_blocked
            (profile := profile) hqA hwA hqw hpEq hother hsource
            hqSurvives hwSurvives hqBlocked hwBlocked))
  · left
    intro source hsource
    by_cases hqSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt source hsource)
    · exact Or.inl hqSurvives
    · by_cases hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source hsource)
      · exact Or.inr hwSurvives
      · exact False.elim
          (hexception ⟨source, hsource, hqSurvives, hwSurvives⟩)

#print axioms commonDeletion_blockerRow_eq_actualCriticalSupport
#print axioms commonDeletion_physicalRow_eq_exactFiveClass_erase
#print axioms nonempty_mutualOmissionCrissCrossNormalForm
#print axioms actualBlocker_ne_physicalApex
#print axioms allActualBlockers_crossSurvive_or_uniqueDoubleBlockingCenter
#print axioms doubleBlockingActualSource_not_mem_physicalCap
#print axioms doubleBlockingActualBlockerFiber_card_le_two
#print axioms nonempty_mutualOmissionGlobalNormalForm

end ATailExactFiveMutualOmissionClosureScratch
end Problem97
