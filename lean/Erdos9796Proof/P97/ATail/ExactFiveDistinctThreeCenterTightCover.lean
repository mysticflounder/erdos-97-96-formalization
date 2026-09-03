/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterContinuation
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.ATail.LargeCapUniqueFive
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Exact-five three-center tight-cover consequences

The exact-twelve branch contains three four-point rows whose union has eleven
points.  The retained source lies in the first two rows and outside the third.
This forces the retained source to be the only repeated row point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveDistinctThreeCenterTightCover

open ATailCommonDeletionTwoCenter
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailFiveCenterDeletionBoundary
open ATailLargeCapUniqueFive
open ATailPhysicalSecondApexCommonDeletion
open ATailThreeCenterCommonDeletion
open ATailUniqueRowProducerScratch
open ExactFiveDistinctThreeCenterContinuation
open FirstApexUniqueRadiusResidual

/-- Three four-point sets with an eleven-point union and one named overlap
have no other overlap. -/
theorem intersections_of_card_four_union_card_eleven
    {α : Type*} [DecidableEq α] (K₀ K₁ K₂ : Finset α) (retained : α)
    (hK₀ : K₀.card = 4) (hK₁ : K₁.card = 4) (hK₂ : K₂.card = 4)
    (hretainedK₀ : retained ∈ K₀) (hretainedK₁ : retained ∈ K₁)
    (hunion : ((K₀ ∪ K₁) ∪ K₂).card = 11) :
    K₀ ∩ K₁ = {retained} ∧ Disjoint K₀ K₂ ∧ Disjoint K₁ K₂ := by
  have hretainedInter : retained ∈ K₀ ∩ K₁ := by
    exact Finset.mem_inter_of_mem hretainedK₀ hretainedK₁
  have hinterPos : 1 ≤ (K₀ ∩ K₁).card :=
    Finset.one_le_card.mpr ⟨retained, hretainedInter⟩
  have hcard₀₁ := Finset.card_union_add_card_inter K₀ K₁
  have hcard₀₁₂ := Finset.card_union_add_card_inter (K₀ ∪ K₁) K₂
  rw [hK₀, hK₁] at hcard₀₁
  rw [hunion, hK₂] at hcard₀₁₂
  have hcardUnion₀₁ : (K₀ ∪ K₁).card = 7 := by omega
  have hcardInter₀₁ : (K₀ ∩ K₁).card = 1 := by omega
  have hcardInter₀₁₂ : ((K₀ ∪ K₁) ∩ K₂).card = 0 := by omega
  have hinterEq : K₀ ∩ K₁ = {retained} := by
    obtain ⟨point, hinter⟩ := Finset.card_eq_one.mp hcardInter₀₁
    have hretainedPoint : retained = point := by
      rw [hinter] at hretainedInter
      simpa using hretainedInter
    simpa [hretainedPoint] using hinter
  have hdisjointUnion : Disjoint (K₀ ∪ K₁) K₂ := by
    rw [Finset.disjoint_iff_inter_eq_empty]
    exact Finset.card_eq_zero.mp hcardInter₀₁₂
  have hdisjoint₀₂ : Disjoint K₀ K₂ := by
    rw [Finset.disjoint_left]
    intro point hpoint₀ hpoint₂
    exact Finset.disjoint_left.mp hdisjointUnion
      (Finset.mem_union_left K₁ hpoint₀) hpoint₂
  have hdisjoint₁₂ : Disjoint K₁ K₂ := by
    rw [Finset.disjoint_left]
    intro point hpoint₁ hpoint₂
    exact Finset.disjoint_left.mp hdisjointUnion
      (Finset.mem_union_right K₀ hpoint₁) hpoint₂
  exact ⟨hinterEq, hdisjoint₀₂, hdisjoint₁₂⟩

/-- Removing the unique shared point leaves disjoint blocks of cardinalities
three, three, and four, which partition the other ten union points. -/
theorem residual_partition_of_card_four_union_card_eleven
    {α : Type*} [DecidableEq α] (K₀ K₁ K₂ : Finset α) (retained : α)
    (hK₀ : K₀.card = 4) (hK₁ : K₁.card = 4) (hK₂ : K₂.card = 4)
    (hretainedK₀ : retained ∈ K₀) (hretainedK₁ : retained ∈ K₁)
    (hunion : ((K₀ ∪ K₁) ∪ K₂).card = 11) :
    (K₀.erase retained).card = 3 ∧
      (K₁.erase retained).card = 3 ∧
      Disjoint (K₀.erase retained) (K₁.erase retained) ∧
      Disjoint (K₀.erase retained) K₂ ∧
      Disjoint (K₁.erase retained) K₂ ∧
      (((K₀.erase retained) ∪ (K₁.erase retained)) ∪ K₂).card = 10 ∧
      (K₀ ∪ K₁) ∪ K₂ =
        insert retained
          (((K₀.erase retained) ∪ (K₁.erase retained)) ∪ K₂) := by
  rcases intersections_of_card_four_union_card_eleven
      K₀ K₁ K₂ retained hK₀ hK₁ hK₂ hretainedK₀ hretainedK₁ hunion with
    ⟨hinter, hdisjoint₀₂, hdisjoint₁₂⟩
  have hcard₀ : (K₀.erase retained).card = 3 := by
    rw [Finset.card_erase_of_mem hretainedK₀, hK₀]
  have hcard₁ : (K₁.erase retained).card = 3 := by
    rw [Finset.card_erase_of_mem hretainedK₁, hK₁]
  have hdisjoint₀₁ :
      Disjoint (K₀.erase retained) (K₁.erase retained) := by
    rw [Finset.disjoint_left]
    intro point hpoint₀ hpoint₁
    have hpoint₀' := Finset.mem_erase.mp hpoint₀
    have hpoint₁' := Finset.mem_erase.mp hpoint₁
    have hpointInter : point ∈ K₀ ∩ K₁ :=
      Finset.mem_inter_of_mem hpoint₀'.2 hpoint₁'.2
    rw [hinter] at hpointInter
    exact hpoint₀'.1 (by simpa using hpointInter)
  have hdisjointErase₀₂ : Disjoint (K₀.erase retained) K₂ := by
    rw [Finset.disjoint_left]
    intro point hpoint₀ hpoint₂
    exact Finset.disjoint_left.mp hdisjoint₀₂
      (Finset.mem_erase.mp hpoint₀).2 hpoint₂
  have hdisjointErase₁₂ : Disjoint (K₁.erase retained) K₂ := by
    rw [Finset.disjoint_left]
    intro point hpoint₁ hpoint₂
    exact Finset.disjoint_left.mp hdisjoint₁₂
      (Finset.mem_erase.mp hpoint₁).2 hpoint₂
  have hdisjointUnion₂ :
      Disjoint ((K₀.erase retained) ∪ (K₁.erase retained)) K₂ := by
    rw [Finset.disjoint_left]
    intro point hpoint hpoint₂
    rcases Finset.mem_union.mp hpoint with hpoint₀ | hpoint₁
    · exact Finset.disjoint_left.mp hdisjointErase₀₂ hpoint₀ hpoint₂
    · exact Finset.disjoint_left.mp hdisjointErase₁₂ hpoint₁ hpoint₂
  have hcardResidual :
      (((K₀.erase retained) ∪ (K₁.erase retained)) ∪ K₂).card = 10 := by
    rw [Finset.card_union_of_disjoint hdisjointUnion₂,
      Finset.card_union_of_disjoint hdisjoint₀₁, hcard₀, hcard₁, hK₂]
  have hunionPartition :
      (K₀ ∪ K₁) ∪ K₂ =
        insert retained
          (((K₀.erase retained) ∪ (K₁.erase retained)) ∪ K₂) := by
    ext point
    by_cases hpoint : point = retained
    · subst point
      simp [hretainedK₀]
    · simp [hpoint]
  exact ⟨hcard₀, hcard₁, hdisjoint₀₁, hdisjointErase₀₂,
    hdisjointErase₁₂, hcardResidual, hunionPartition⟩

/-- In the tight-union branch, the retained source is the sole overlap among
the three selected four-class supports. -/
theorem tightPhysical_support_intersections
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11) :
    N.firstApexClass.support ∩ N.blockerClass.support = {N.retained} ∧
      Disjoint N.firstApexClass.support N.secondApexClass.support ∧
      Disjoint N.blockerClass.support N.secondApexClass.support := by
  exact intersections_of_card_four_union_card_eleven
    N.firstApexClass.support N.blockerClass.support
    N.secondApexClass.support N.retained
    N.firstApexClass.support_card N.blockerClass.support_card
    N.secondApexClass.support_card N.retained_mem_firstApexClass
    N.retained_mem_blockerClass hunion

/-- The exact union cardinality already forces the retained source outside
the second-apex support. -/
theorem tightPhysical_retained_not_mem_second
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11) :
    N.retained ∉ N.secondApexClass.support := by
  have hdisjoint := (tightPhysical_support_intersections N hunion).2.1
  intro hretained
  exact Finset.disjoint_left.mp hdisjoint
    N.retained_mem_firstApexClass hretained

/-- The two oriented interior sources are distinct members of the exact
five-point first-apex radius class. -/
theorem tightPhysical_deleted_retained_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ∈ SelectedClass D.A S.oppApex1 radius ∧
      N.retained ∈ SelectedClass D.A S.oppApex1 radius ∧
      deleted ≠ N.retained := by
  rcases N.orientation with horientation | horientation
  · rcases horientation with ⟨rfl, hretained, _⟩
    exact ⟨
      (Finset.mem_inter.mp R.interior.w_mem_interior).1,
      hretained.symm ▸ (Finset.mem_inter.mp R.interior.q_mem_interior).1,
      fun heq => R.interior.frontier.pair.q_ne_w
        (hretained.symm.trans heq.symm)⟩
  · rcases horientation with ⟨rfl, hretained, _⟩
    exact ⟨
      (Finset.mem_inter.mp R.interior.q_mem_interior).1,
      hretained.symm ▸ (Finset.mem_inter.mp R.interior.w_mem_interior).1,
      fun heq => R.interior.frontier.pair.q_ne_w
        (heq.trans hretained)⟩

/-- The two oriented sources remain named members of the first opposite
strict cap interior. -/
theorem tightPhysical_deleted_retained_mem_firstCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    deleted ∈ S.capInteriorByIndex S.oppIndex1 ∧
      N.retained ∈ S.capInteriorByIndex S.oppIndex1 ∧
      deleted ≠ N.retained := by
  have hne := (tightPhysical_deleted_retained_mem_firstApexClass N).2.2
  rcases N.orientation with horientation | horientation
  · rcases horientation with ⟨rfl, hretained, _⟩
    exact ⟨
      (Finset.mem_inter.mp R.interior.w_mem_interior).2,
      hretained.symm ▸ (Finset.mem_inter.mp R.interior.q_mem_interior).2,
      hne⟩
  · rcases horientation with ⟨rfl, hretained, _⟩
    exact ⟨
      (Finset.mem_inter.mp R.interior.q_mem_interior).2,
      hretained.symm ▸ (Finset.mem_inter.mp R.interior.w_mem_interior).2,
      hne⟩

/-- The blocker parameter is the critical-shell center selected at the
retained source. -/
theorem tightPhysical_blocker_eq_centerAt_retained
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    blocker = H.centerAt N.retained N.retained_mem_A := by
  rcases N.orientation with horientation | horientation
  · rcases horientation with ⟨_, hretained, hblocker⟩
    simpa only [hretained] using hblocker
  · rcases horientation with ⟨_, hretained, hblocker⟩
    simpa only [hretained] using hblocker

/-- The blocker normal row is the full exact critical shell selected at the
retained source, rather than an arbitrary four-subset. -/
theorem tightPhysical_blockerClass_support_eq_retainedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    N.blockerClass.support =
      (H.selectedAt N.retained N.retained_mem_A).toCriticalFourShell.support := by
  calc
    N.blockerClass.support = C.B₁ := N.blockerClass_support_eq
    _ = (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.support :=
      firstRow_support_eq_criticalShell_of_center_eq C N.retained_mem_A
        (tightPhysical_blocker_eq_centerAt_retained N)

/-- Exact selected-class form of the retained source's blocker row. -/
theorem tightPhysical_blockerClass_eq_exactSelectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    N.blockerClass.support =
      SelectedClass D.A
        (H.centerAt N.retained N.retained_mem_A)
        (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.radius := by
  let shell :=
    (H.selectedAt N.retained N.retained_mem_A).toCriticalFourShell
  calc
    N.blockerClass.support = shell.support := by
      exact tightPhysical_blockerClass_support_eq_retainedCriticalShell N
    _ = D.A.filter
        (fun point => dist (H.centerAt N.retained N.retained_mem_A) point =
          shell.radius) := shell.support_eq
    _ = SelectedClass D.A
        (H.centerAt N.retained N.retained_mem_A) shell.radius := rfl

/-- Pointwise exactness of the retained source's blocker row. -/
theorem tightPhysical_mem_blockerClass_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker point : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hpointA : point ∈ D.A) :
    point ∈ N.blockerClass.support ↔
      dist (H.centerAt N.retained N.retained_mem_A) point =
        (H.selectedAt N.retained
          N.retained_mem_A).toCriticalFourShell.radius := by
  rw [tightPhysical_blockerClass_eq_exactSelectedClass N,
    mem_selectedClass]
  simp only [hpointA, true_and]

/-- Re-inserting the deleted source into the first selected support recovers
the exact five-point first-apex radius class. -/
theorem tightPhysical_firstApexClass_eq_insert_deleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    SelectedClass D.A S.oppApex1 radius =
      insert deleted N.firstApexClass.support := by
  have hdeleted :=
    (tightPhysical_deleted_retained_mem_firstApexClass N).1
  calc
    SelectedClass D.A S.oppApex1 radius =
        insert deleted
          ((SelectedClass D.A S.oppApex1 radius).erase deleted) :=
      (Finset.insert_erase hdeleted).symm
    _ = insert deleted N.firstApexClass.support := by
      rw [← N.firstApexClass_support_eq]

/-- Pointwise exactness of the five-point first-apex radius class. -/
theorem tightPhysical_mem_firstApexFive_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker point : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hpointA : point ∈ D.A) :
    point ∈ insert deleted N.firstApexClass.support ↔
      dist S.oppApex1 point = radius := by
  rw [← tightPhysical_firstApexClass_eq_insert_deleted N,
    mem_selectedClass]
  simp only [hpointA, true_and]

/-- At cardinality twelve, robustness at both physical apexes saturates the
cap budget: all three closed caps have cardinality five and both opposite
strict interiors have cardinality three. -/
theorem tightPhysical_exact_cap_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12) :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧
      S.oppCap2.card = 5 ∧
      (S.capInteriorByIndex S.oppIndex1).card = 3 ∧
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
  have hcapEq₁ : S.capByIndex S.oppIndex1 = S.oppCap1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppCap1, hi]
  have hcapEq₂ : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  have hfirstInterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    firstApex_cardFive_interior_card_ge_three D S
      R.interior.frontier.radius_pos R.class_card_eq_five
  have hfirstInteriorCap :
      3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
    hfirstInterior.trans (Finset.card_le_card Finset.inter_subset_right)
  have hfirstCapSum :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex1
  have hfirst : 5 ≤ S.oppCap1.card := by
    rw [hcapEq₁] at hfirstCapSum
    omega
  have hsecond : 5 ≤ S.oppCap2.card :=
    ATailBiApexRobustCapBounds.second_oppCap_card_ge_five
      N.secondApex_robust
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hsurplusEq : S.surplusCap.card = 5 := by omega
  have hfirstEq : S.oppCap1.card = 5 := by omega
  have hsecondEq : S.oppCap2.card = 5 := by omega
  have hfirstInteriorEq :
      (S.capInteriorByIndex S.oppIndex1).card = 3 := by
    rw [hcapEq₁, hfirstEq] at hfirstCapSum
    omega
  have hsecondCapSum :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  have hsecondInteriorEq :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    rw [hcapEq₂, hsecondEq] at hsecondCapSum
    omega
  exact ⟨hsurplusEq, hfirstEq, hsecondEq,
    hfirstInteriorEq, hsecondInteriorEq⟩

/-- A five-point second opposite cap and full deletion robustness force a
unique positive K4 radius at the second physical apex, with complete ambient
radius class of cardinality five. -/
theorem nonempty_tightPhysical_secondApexUniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12) :
    Nonempty (LargeCapUniqueFiveSecondApexRadius D S) := by
  classical
  have hcenterEq :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, hi]
  have hcapEq : S.capByIndex S.oppIndex2 = S.oppCap2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppCap2, hi]
  have hsecondEq := (tightPhysical_exact_cap_profile N hcard).2.2.1
  have hcapByIndex : (S.capByIndex S.oppIndex2).card = 5 := by
    rw [hcapEq, hsecondEq]
  obtain ⟨secondRadius, hsecondRadiusPos, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 C.center₂_mem_A)
  have hclassLeFive :
      (SelectedClass D.A S.oppApex2 secondRadius).card ≤ 5 := by
    have hle :=
      oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
        S D.convex S.oppIndex2 hcapByIndex hsecondRadiusPos
    simpa only [← hcenterEq] using hle
  have hclassEqFive :
      (SelectedClass D.A S.oppApex2 secondRadius).card = 5 := by
    by_contra hnotFive
    have hclassEqFour :
        (SelectedClass D.A S.oppApex2 secondRadius).card = 4 := by
      omega
    obtain ⟨source, hsourceClass⟩ :=
      Finset.card_pos.mp (by omega :
        0 < (SelectedClass D.A S.oppApex2 secondRadius).card)
    have hsourceA : source ∈ D.A :=
      (mem_selectedClass.mp hsourceClass).1
    obtain ⟨otherRadius, hotherRadiusPos, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (N.secondApex_robust.survives source hsourceA)
    have hfourOther :
        4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans
        (Finset.card_le_card (Finset.erase_subset _ _))
    by_cases hsame : otherRadius = secondRadius
    · subst otherRadius
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hsourceClass,
        hclassEqFour] at hfourErase
      omega
    · have hlarge :=
        oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
          S D.convex S.oppIndex2 hotherRadiusPos hsecondRadiusPos
          (by simpa only [← hcenterEq] using hfourOther)
          (by simpa only [← hcenterEq] using hfour) hsame
      rw [hcapEq, hsecondEq] at hlarge
      omega
  have hunique : ∀ otherRadius : ℝ, 0 < otherRadius →
      4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card →
      otherRadius = secondRadius := by
    intro otherRadius hotherRadiusPos hfourOther
    by_contra hne
    have hlarge :=
      oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
        S D.convex S.oppIndex2 hotherRadiusPos hsecondRadiusPos
        (by simpa only [← hcenterEq] using hfourOther)
        (by simpa only [← hcenterEq] using hfour) hne
    rw [hcapEq, hsecondEq] at hlarge
    omega
  exact ⟨{
    radius := secondRadius
    radius_pos := hsecondRadiusPos
    class_card_eq_five := hclassEqFive
    unique_K4_radius := hunique }⟩

/-- The unique five-point second-apex radius class fills the whole
three-point strict interior of the second opposite cap. -/
theorem tightPhysical_secondApexFive_inter_capInterior_eq_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 =
      S.capInteriorByIndex S.oppIndex2 := by
  refine Finset.eq_of_subset_of_card_le Finset.inter_subset_right ?_
  have hinterior := three_le_capInterior_hits_of_largeCapUniqueFive profile
  have hprofile := tightPhysical_exact_cap_profile N hcard
  omega

/-- The normal second-apex row lies in the complete unique five-point radius
class, independently of any retained-deletion packet witness. -/
theorem tightPhysical_normalSecond_subset_uniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    N.secondApexClass.support ⊆
      SelectedClass D.A S.oppApex2 profile.radius := by
  have hnormalAtOwnRadius :
      N.secondApexClass.support ⊆
        SelectedClass D.A S.oppApex2 N.secondApexClass.radius := by
    intro point hpoint
    exact mem_selectedClass.mpr
      ⟨N.secondApexClass.support_subset_A hpoint,
        N.secondApexClass.support_eq_radius point hpoint⟩
  have hnormalFour :
      4 ≤ (SelectedClass D.A S.oppApex2
        N.secondApexClass.radius).card := by
    calc
      4 = N.secondApexClass.support.card :=
        N.secondApexClass.support_card.symm
      _ ≤ (SelectedClass D.A S.oppApex2
          N.secondApexClass.radius).card :=
        Finset.card_le_card hnormalAtOwnRadius
  have hnormalRadius : N.secondApexClass.radius = profile.radius :=
    profile.unique_K4_radius N.secondApexClass.radius
      N.secondApexClass.radius_pos hnormalFour
  simpa only [hnormalRadius] using hnormalAtOwnRadius

/-- Both source-selected second-apex rows lie in the same complete five-point
radius class forced by exact-twelve robustness. -/
theorem tightPhysical_secondRows_subset_uniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    N.secondApexClass.support ⊆
        SelectedClass D.A S.oppApex2 profile.radius ∧
      P.B₂ ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
  have hpacketAtOwnRadius :
      P.B₂ ⊆ SelectedClass D.A S.oppApex2 P.row₂.radius := by
    intro point hpoint
    have hpointSkeleton := P.row₂.toQAllowedK4Class.subset hpoint
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp hpointSkeleton).2,
        P.row₂.same_radius point hpoint⟩
  have hpacketFour :
      4 ≤ (SelectedClass D.A S.oppApex2 P.row₂.radius).card := by
    calc
      4 = P.B₂.card := P.B₂_card.symm
      _ ≤ (SelectedClass D.A S.oppApex2 P.row₂.radius).card :=
        Finset.card_le_card hpacketAtOwnRadius
  have hpacketRadius : P.row₂.radius = profile.radius :=
    profile.unique_K4_radius P.row₂.radius P.row₂.radius_pos hpacketFour
  constructor
  · exact tightPhysical_normalSecond_subset_uniqueFive N profile
  · simpa only [hpacketRadius] using hpacketAtOwnRadius

/-- The normal and physical retained-deletion rows at the second apex share
at least three sources: each is a four-subset of the same five-point class. -/
theorem tightPhysical_secondRows_inter_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    3 ≤ (N.secondApexClass.support ∩ P.B₂).card := by
  rcases nonempty_tightPhysical_secondApexUniqueFive N hcard with
    ⟨profile⟩
  have hsub := tightPhysical_secondRows_subset_uniqueFive N profile P
  have hunionSub :
      N.secondApexClass.support ∪ P.B₂ ⊆
        SelectedClass D.A S.oppApex2 profile.radius :=
    Finset.union_subset hsub.1 hsub.2
  have hunionCard := Finset.card_le_card hunionSub
  have hsum := Finset.card_union_add_card_inter
    N.secondApexClass.support P.B₂
  rw [profile.class_card_eq_five] at hunionCard
  rw [N.secondApexClass.support_card, P.B₂_card] at hsum
  omega

/-- The only remaining second-apex row freedom is the sharp four-of-five
dichotomy: the two rows coincide, or their intersection has cardinality three
and their union is the complete unique five-point radius class. -/
theorem exists_tightPhysical_secondRows_eq_or_union_uniqueFive
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    ∃ profile : LargeCapUniqueFiveSecondApexRadius D S,
      N.secondApexClass.support = P.B₂ ∨
        (N.secondApexClass.support ∩ P.B₂).card = 3 ∧
          N.secondApexClass.support ∪ P.B₂ =
            SelectedClass D.A S.oppApex2 profile.radius := by
  rcases nonempty_tightPhysical_secondApexUniqueFive N hcard with
    ⟨profile⟩
  refine ⟨profile, ?_⟩
  by_cases hrows : N.secondApexClass.support = P.B₂
  · exact Or.inl hrows
  · right
    have hsub := tightPhysical_secondRows_subset_uniqueFive N profile P
    have hunionSub :
        N.secondApexClass.support ∪ P.B₂ ⊆
          SelectedClass D.A S.oppApex2 profile.radius :=
      Finset.union_subset hsub.1 hsub.2
    have hunionCardLe := Finset.card_le_card hunionSub
    rw [profile.class_card_eq_five] at hunionCardLe
    have hsum := Finset.card_union_add_card_inter
      N.secondApexClass.support P.B₂
    rw [N.secondApexClass.support_card, P.B₂_card] at hsum
    have hinterGe :
        3 ≤ (N.secondApexClass.support ∩ P.B₂).card := by
      omega
    have hinterLe :
        (N.secondApexClass.support ∩ P.B₂).card ≤ 4 := by
      have hle := Finset.card_le_card
        (Finset.inter_subset_left :
          N.secondApexClass.support ∩ P.B₂ ⊆
            N.secondApexClass.support)
      simpa only [N.secondApexClass.support_card] using hle
    have hinterNeFour :
        (N.secondApexClass.support ∩ P.B₂).card ≠ 4 := by
      intro hinterFour
      have hinterEqNormal :
          N.secondApexClass.support ∩ P.B₂ =
            N.secondApexClass.support := by
        refine Finset.eq_of_subset_of_card_le Finset.inter_subset_left ?_
        rw [N.secondApexClass.support_card, hinterFour]
      have hnormalSubPacket : N.secondApexClass.support ⊆ P.B₂ := by
        intro point hpoint
        have hpointInter :
            point ∈ N.secondApexClass.support ∩ P.B₂ := by
          rw [hinterEqNormal]
          exact hpoint
        exact (Finset.mem_inter.mp hpointInter).2
      exact hrows (Finset.eq_of_subset_of_card_le hnormalSubPacket (by
        rw [N.secondApexClass.support_card, P.B₂_card]))
    have hinterEq :
        (N.secondApexClass.support ∩ P.B₂).card = 3 := by
      omega
    have hunionCardEq :
        (N.secondApexClass.support ∪ P.B₂).card = 5 := by
      omega
    have hunionEq :
        N.secondApexClass.support ∪ P.B₂ =
          SelectedClass D.A S.oppApex2 profile.radius := by
      refine Finset.eq_of_subset_of_card_le hunionSub ?_
      rw [profile.class_card_eq_five, hunionCardEq]
    exact ⟨hinterEq, hunionEq⟩

/-- The retained two-center packet is already implied by the normal form's
full deletion robustness at the two physical apexes.  Its presence in the
tight-cover endpoint contributes witness choices, not an additional survival
hypothesis. -/
theorem nonempty_retainedPacket_of_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    Nonempty (CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) := by
  have hfirstApexA : S.oppApex1 ∈ D.A := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem
  have hsecondApexA : S.oppApex2 ∈ D.A := C.center₂_mem_A
  have hapices : S.oppApex1 ≠ S.oppApex2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
        hi] using S.triangle.v23_ne
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
        hi] using S.triangle.v13_ne.symm
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
        hi] using S.triangle.v12_ne
  exact nonempty_commonDeletionTwoCenterPacket H
    N.retained_mem_A hfirstApexA hsecondApexA hapices
    (R.firstApex_fullyDeletionRobust.survives
      N.retained N.retained_mem_A)
    (N.secondApex_robust.survives N.retained N.retained_mem_A)

/-- In the exact-twelve branch the five-point first-apex radius class fills
the whole three-point strict interior of the first opposite cap. -/
theorem tightPhysical_firstApexFive_inter_capInterior_eq_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12) :
    SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 =
      S.capInteriorByIndex S.oppIndex1 := by
  refine Finset.eq_of_subset_of_card_le Finset.inter_subset_right ?_
  have hinterior :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    firstApex_cardFive_interior_card_ge_three D S
      R.interior.frontier.radius_pos R.class_card_eq_five
  have hprofile := tightPhysical_exact_cap_profile N hcard
  omega

/-- Convex cap counting forces a third strict-interior source in the first
normal row, beyond the deleted and retained interior pair. -/
theorem exists_firstApexResidual_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    ∃ third,
      third ∈ N.firstApexClass.support.erase N.retained ∧
        third ∈ S.capInteriorByIndex S.oppIndex1 := by
  let interiorClass :=
    SelectedClass D.A S.oppApex1 radius ∩
      S.capInteriorByIndex S.oppIndex1
  have hsources := tightPhysical_deleted_retained_mem_firstApexClass N
  have hcapSources :=
    tightPhysical_deleted_retained_mem_firstCapInterior N
  have hdeletedMem : deleted ∈ interiorClass :=
    Finset.mem_inter.mpr ⟨hsources.1, hcapSources.1⟩
  have hretainedMem : N.retained ∈ interiorClass :=
    Finset.mem_inter.mpr ⟨hsources.2.1, hcapSources.2.1⟩
  have hretainedErase : N.retained ∈ interiorClass.erase deleted :=
    Finset.mem_erase.mpr ⟨hsources.2.2.symm, hretainedMem⟩
  have hcard : 3 ≤ interiorClass.card := by
    exact firstApex_cardFive_interior_card_ge_three D S
      R.interior.frontier.radius_pos R.class_card_eq_five
  have hcardEraseDeleted := Finset.card_erase_of_mem hdeletedMem
  have hcardEraseBoth := Finset.card_erase_of_mem hretainedErase
  have hnonempty :
      ((interiorClass.erase deleted).erase N.retained).Nonempty := by
    exact Finset.card_pos.mp (by omega)
  rcases hnonempty with ⟨third, hthird⟩
  have hthirdRetained := Finset.mem_erase.mp hthird
  have hthirdDeleted := Finset.mem_erase.mp hthirdRetained.2
  have hthirdClass := (Finset.mem_inter.mp hthirdDeleted.2).1
  have hthirdInterior := (Finset.mem_inter.mp hthirdDeleted.2).2
  have hthirdSupport : third ∈ N.firstApexClass.support := by
    rw [tightPhysical_firstApexClass_eq_insert_deleted N] at hthirdClass
    rcases Finset.mem_insert.mp hthirdClass with hthirdEq | hthirdSupport
    · exact False.elim (hthirdDeleted.1 hthirdEq)
    · exact hthirdSupport
  exact ⟨third,
    Finset.mem_erase.mpr ⟨hthirdRetained.1, hthirdSupport⟩,
    hthirdInterior⟩

/-- At cardinality twelve the deleted source, retained source, and one
residual first-row source are exactly the first opposite cap interior. -/
theorem exists_firstCapInterior_eq_triple
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12) :
    ∃ third,
      third ∈ N.firstApexClass.support.erase N.retained ∧
        S.capInteriorByIndex S.oppIndex1 =
          ({deleted, N.retained, third} : Finset ℝ²) := by
  rcases exists_firstApexResidual_mem_capInterior N with
    ⟨third, hthirdResidual, hthirdInterior⟩
  have hcapSources :=
    tightPhysical_deleted_retained_mem_firstCapInterior N
  have hthirdErase := Finset.mem_erase.mp hthirdResidual
  have hdeletedNotSupport : deleted ∉ N.firstApexClass.support := by
    rw [N.firstApexClass_support_eq]
    simp
  have hdeletedNeThird : deleted ≠ third := by
    intro hEq
    exact hdeletedNotSupport (hEq.symm ▸ hthirdErase.2)
  have hretainedNeThird : N.retained ≠ third := hthirdErase.1.symm
  have hnamedCard :
      ({deleted, N.retained, third} : Finset ℝ²).card = 3 :=
    Finset.card_eq_three.mpr ⟨deleted, N.retained, third,
      hcapSources.2.2, hdeletedNeThird, hretainedNeThird, rfl⟩
  have hnamedSubset :
      ({deleted, N.retained, third} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex1 := by
    intro point hpoint
    simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
    rcases hpoint with rfl | rfl | rfl
    · exact hcapSources.1
    · exact hcapSources.2.1
    · exact hthirdInterior
  have hinteriorCard :=
    (tightPhysical_exact_cap_profile N hcard).2.2.2.1
  have hnamedEq :
      ({deleted, N.retained, third} : Finset ℝ²) =
        S.capInteriorByIndex S.oppIndex1 := by
    exact Finset.eq_of_subset_of_card_le hnamedSubset (by omega)
  exact ⟨third, hthirdResidual, hnamedEq.symm⟩

/-- Uniqueness of the first-apex four-class radius fixes the physical
retained-deletion packet's first row: it is the deleted source together with
the first normal row's residual triple. -/
theorem tightPhysical_retainedPacket_firstRow_eq_insert_deleted_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    P.B₁ = insert deleted
      (N.firstApexClass.support.erase N.retained) := by
  have hsource := tightPhysical_deleted_retained_mem_firstApexClass N
  have hclassEq := tightPhysical_firstApexClass_eq_insert_deleted N
  have hpacketSubset :
      P.B₁ ⊆ SelectedClass D.A S.oppApex1 P.row₁.radius := by
    intro point hpoint
    have hpointSkeleton :=
      (Finset.mem_erase.mp (P.row₁.subset hpoint)).2
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp hpointSkeleton).2,
        P.row₁.same_radius point hpoint⟩
  have hpacketClassCard :
      4 ≤ (SelectedClass D.A S.oppApex1 P.row₁.radius).card := by
    rw [← P.B₁_card]
    exact Finset.card_le_card hpacketSubset
  have hpacketRadius : P.row₁.radius = radius :=
    R.unique_fourClass_radius P.row₁.radius P.row₁.radius_pos
      hpacketClassCard
  have hpacketSubsetErase :
      P.B₁ ⊆ (SelectedClass D.A S.oppApex1 radius).erase N.retained := by
    intro point hpoint
    refine Finset.mem_erase.mpr ⟨?_, ?_⟩
    · exact fun hpointRetained => P.row₁.q_not_mem (hpointRetained ▸ hpoint)
    · rw [← hpacketRadius]
      exact hpacketSubset hpoint
  have hpacketEq :
      P.B₁ = (SelectedClass D.A S.oppApex1 radius).erase N.retained := by
    apply Finset.eq_of_subset_of_card_le hpacketSubsetErase
    rw [Finset.card_erase_of_mem hsource.2.1, R.class_card_eq_five,
      P.B₁_card]
  calc
    P.B₁ = (SelectedClass D.A S.oppApex1 radius).erase N.retained :=
      hpacketEq
    _ = (insert deleted N.firstApexClass.support).erase N.retained := by
      rw [hclassEq]
    _ = insert deleted
        (N.firstApexClass.support.erase N.retained) := by
      exact Finset.erase_insert_of_ne hsource.2.2

/-- The retained-deletion packet's first row contains the original deleted
source, but not the fresh source from the three-center continuation.  The
first assertion is the packet decomposition above; the second is the
fresh-row omission transported through the residual triple. -/
theorem tightPhysical_retainedPacket_fresh_not_mem_and_deleted_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2)
    (fresh : ℝ²) (fresh_ne_deleted : fresh ≠ deleted)
    (packet :
      ThreeCenterCommonDeletionExactRows D fresh
        S.oppApex1 blocker S.oppApex2
        N.firstApexClass.support N.blockerClass.support
        N.secondApexClass.support) :
    fresh ∉ P.B₁ ∧ deleted ∈ P.B₁ := by
  have hrow := tightPhysical_retainedPacket_firstRow_eq_insert_deleted_residual N P
  have hfreshResidual : fresh ∉ N.firstApexClass.support.erase N.retained := by
    intro hfresh
    exact packet.row₀.q_not_mem (Finset.mem_erase.mp hfresh).2
  constructor
  · rw [hrow]
    intro hfresh
    rcases Finset.mem_insert.mp hfresh with hdeleted | hfreshResidual'
    · exact fresh_ne_deleted hdeleted
    · exact hfreshResidual hfreshResidual'
  · rw [hrow]
    exact Finset.mem_insert.mpr (Or.inl rfl)

/-- In the tight union branch, the fixed first row of the retained-deletion
packet is disjoint from both other normal-form rows. -/
theorem tightPhysical_retainedPacket_firstRow_disjoint_normalOthers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    Disjoint P.B₁ N.blockerClass.support ∧
      Disjoint P.B₁ N.secondApexClass.support := by
  have hpacket :=
    tightPhysical_retainedPacket_firstRow_eq_insert_deleted_residual N P
  have hnormal := tightPhysical_support_intersections N hunion
  rw [hpacket]
  constructor
  · rw [Finset.disjoint_left]
    intro point hpointPacket hpointBlocker
    rcases Finset.mem_insert.mp hpointPacket with rfl | hpointResidual
    · rw [N.blockerClass_support_eq] at hpointBlocker
      exact C.row₁.q_not_mem hpointBlocker
    · have hpointErase := Finset.mem_erase.mp hpointResidual
      have hpointInter : point ∈
          N.firstApexClass.support ∩ N.blockerClass.support :=
        Finset.mem_inter_of_mem hpointErase.2 hpointBlocker
      rw [hnormal.1] at hpointInter
      exact hpointErase.1 (by simpa using hpointInter)
  · rw [Finset.disjoint_left]
    intro point hpointPacket hpointSecond
    rcases Finset.mem_insert.mp hpointPacket with rfl | hpointResidual
    · rw [N.secondApexClass_support_eq] at hpointSecond
      exact C.row₂.q_not_mem hpointSecond
    · exact Finset.disjoint_left.mp hnormal.2.1
        (Finset.mem_erase.mp hpointResidual).2 hpointSecond

/-- The tight branch decomposes its eleven row-union points into the retained
source and three disjoint residual blocks of cardinalities three, three, and
four. -/
theorem tightPhysical_support_partition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11) :
    (N.firstApexClass.support.erase N.retained).card = 3 ∧
      (N.blockerClass.support.erase N.retained).card = 3 ∧
      Disjoint (N.firstApexClass.support.erase N.retained)
        (N.blockerClass.support.erase N.retained) ∧
      Disjoint (N.firstApexClass.support.erase N.retained)
        N.secondApexClass.support ∧
      Disjoint (N.blockerClass.support.erase N.retained)
        N.secondApexClass.support ∧
      (((N.firstApexClass.support.erase N.retained) ∪
          (N.blockerClass.support.erase N.retained)) ∪
        N.secondApexClass.support).card = 10 ∧
      (N.firstApexClass.support ∪ N.blockerClass.support) ∪
          N.secondApexClass.support =
        insert N.retained
          (((N.firstApexClass.support.erase N.retained) ∪
              (N.blockerClass.support.erase N.retained)) ∪
            N.secondApexClass.support) := by
  exact residual_partition_of_card_four_union_card_eleven
    N.firstApexClass.support N.blockerClass.support
    N.secondApexClass.support N.retained
    N.firstApexClass.support_card N.blockerClass.support_card
    N.secondApexClass.support_card N.retained_mem_firstApexClass
    N.retained_mem_blockerClass hunion

/-- The deleted source and retained source extend the three residual row
blocks to a partition of the full twelve-point carrier. -/
theorem tightPhysical_carrier_eq_insert_deleted_partition
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11)
    (herase :
      D.A.erase deleted =
        (N.firstApexClass.support ∪ N.blockerClass.support) ∪
          N.secondApexClass.support) :
    deleted ∉
        insert N.retained
          (((N.firstApexClass.support.erase N.retained) ∪
              (N.blockerClass.support.erase N.retained)) ∪
            N.secondApexClass.support) ∧
      D.A =
        insert deleted
          (insert N.retained
            (((N.firstApexClass.support.erase N.retained) ∪
                (N.blockerClass.support.erase N.retained)) ∪
              N.secondApexClass.support)) := by
  rcases tightPhysical_support_partition N hunion with
    ⟨_, _, _, _, _, _, hpartition⟩
  constructor
  · rw [← hpartition, ← herase]
    simp
  · calc
      D.A = insert deleted (D.A.erase deleted) :=
        (Finset.insert_erase C.q_mem_A).symm
      _ = insert deleted
          ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
            N.secondApexClass.support) := by rw [herase]
      _ = insert deleted
          (insert N.retained
            (((N.firstApexClass.support.erase N.retained) ∪
                (N.blockerClass.support.erase N.retained)) ∪
              N.secondApexClass.support)) := by rw [hpartition]

/-- The retained-deletion packet's two rows meet every normal-form row at a
different center in at most two points. -/
theorem tightPhysical_retainedPacket_cross_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : CommonDeletionTwoCenterPacket D H N.retained
      S.oppApex1 S.oppApex2) :
    (P.B₁ ∩ N.blockerClass.support).card ≤ 2 ∧
      (P.B₁ ∩ N.secondApexClass.support).card ≤ 2 ∧
      (P.B₂ ∩ N.firstApexClass.support).card ≤ 2 ∧
      (P.B₂ ∩ N.blockerClass.support).card ≤ 2 := by
  let P₀ : SelectedFourClass D.A S.oppApex1 :=
    qDeletedK4ClassToSelectedFourClass P.row₁ P.B₁_card
  let P₂ : SelectedFourClass D.A S.oppApex2 :=
    qDeletedK4ClassToSelectedFourClass P.row₂ P.B₂_card
  have h₀₁ : (P₀.support ∩ N.blockerClass.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two P₀ N.blockerClass
      N.freshThreeCenter.center₀_ne_center₁
  have h₀₂ : (P₀.support ∩ N.secondApexClass.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two P₀ N.secondApexClass
      N.freshThreeCenter.center₀_ne_center₂
  have h₂₀ : (P₂.support ∩ N.firstApexClass.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two P₂ N.firstApexClass
      N.freshThreeCenter.center₀_ne_center₂.symm
  have h₂₁ : (P₂.support ∩ N.blockerClass.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two P₂ N.blockerClass
      N.freshThreeCenter.center₁_ne_center₂.symm
  simpa [P₀, P₂, qDeletedK4ClassToSelectedFourClass] using
    ⟨h₀₁, h₀₂, h₂₀, h₂₁⟩

/-- Source-invariant normal form for the remaining balanced tight-cover
branch.  It intentionally omits the retained common-deletion packet: that
packet is reconstructible from robustness and its stored rows are witness
choices rather than invariant incidence data. -/
structure BalancedTightCoverInvariant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) : Type where
  carrier_card_eq_twelve : D.A.card = 12
  union_card_eq_eleven :
    ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
      N.secondApexClass.support).card = 11
  carrier_erase_deleted_eq_union :
    D.A.erase deleted =
      (N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support
  retained_not_mem_second : N.retained ∉ N.secondApexClass.support
  support_intersections :
    N.firstApexClass.support ∩ N.blockerClass.support = {N.retained} ∧
      Disjoint N.firstApexClass.support N.secondApexClass.support ∧
      Disjoint N.blockerClass.support N.secondApexClass.support
  support_partition :
    (N.firstApexClass.support.erase N.retained).card = 3 ∧
      (N.blockerClass.support.erase N.retained).card = 3 ∧
      Disjoint (N.firstApexClass.support.erase N.retained)
        (N.blockerClass.support.erase N.retained) ∧
      Disjoint (N.firstApexClass.support.erase N.retained)
        N.secondApexClass.support ∧
      Disjoint (N.blockerClass.support.erase N.retained)
        N.secondApexClass.support ∧
      (((N.firstApexClass.support.erase N.retained) ∪
          (N.blockerClass.support.erase N.retained)) ∪
        N.secondApexClass.support).card = 10 ∧
      (N.firstApexClass.support ∪ N.blockerClass.support) ∪
          N.secondApexClass.support =
        insert N.retained
          (((N.firstApexClass.support.erase N.retained) ∪
              (N.blockerClass.support.erase N.retained)) ∪
            N.secondApexClass.support)
  carrier_partition :
    deleted ∉
        insert N.retained
          (((N.firstApexClass.support.erase N.retained) ∪
              (N.blockerClass.support.erase N.retained)) ∪
            N.secondApexClass.support) ∧
      D.A =
        insert deleted
          (insert N.retained
            (((N.firstApexClass.support.erase N.retained) ∪
                (N.blockerClass.support.erase N.retained)) ∪
              N.secondApexClass.support))
  blocker_support_eq :
    N.blockerClass.support =
      (H.selectedAt N.retained
        N.retained_mem_A).toCriticalFourShell.support
  cap_profile :
    S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧
      S.oppCap2.card = 5 ∧
      (S.capInteriorByIndex S.oppIndex1).card = 3 ∧
      (S.capInteriorByIndex S.oppIndex2).card = 3
  firstInteriorThird : ℝ²
  firstInteriorThird_mem :
    firstInteriorThird ∈
      N.firstApexClass.support.erase N.retained
  firstInterior_eq :
    S.capInteriorByIndex S.oppIndex1 =
      ({deleted, N.retained, firstInteriorThird} : Finset ℝ²)
  secondApexProfile : LargeCapUniqueFiveSecondApexRadius D S
  normalSecond_subset_profile :
    N.secondApexClass.support ⊆
      SelectedClass D.A S.oppApex2 secondApexProfile.radius
  secondInterior_eq :
    SelectedClass D.A S.oppApex2 secondApexProfile.radius ∩
        S.capInteriorByIndex S.oppIndex2 =
      S.capInteriorByIndex S.oppIndex2

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem surplusApex_eq_oppositeVertexByIndex_surplusIdx
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem mem_capByIndex_endpoint_or_interior
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) {point : ℝ²}
    (hpoint : point ∈ S.capByIndex i) :
    point = (S.triangleByIndex i).v2 ∨
      point = (S.triangleByIndex i).v3 ∨
      point ∈ S.capInteriorByIndex i := by
  fin_cases i
  · by_cases hsecond : point = S.triangle.v2
    · exact Or.inl hsecond
    by_cases hthird : point = S.triangle.v3
    · exact Or.inr <| Or.inl hthird
    · exact Or.inr <| Or.inr <| Finset.mem_erase.mpr
        ⟨hthird, Finset.mem_erase.mpr ⟨hsecond, hpoint⟩⟩
  · by_cases hsecond : point = S.triangle.v3
    · exact Or.inl hsecond
    by_cases hthird : point = S.triangle.v1
    · exact Or.inr <| Or.inl hthird
    · exact Or.inr <| Or.inr <| Finset.mem_erase.mpr
        ⟨hthird, Finset.mem_erase.mpr ⟨hsecond, hpoint⟩⟩
  · by_cases hsecond : point = S.triangle.v1
    · exact Or.inl hsecond
    by_cases hthird : point = S.triangle.v2
    · exact Or.inr <| Or.inl hthird
    · exact Or.inr <| Or.inr <| Finset.mem_erase.mpr
        ⟨hthird, Finset.mem_erase.mpr ⟨hsecond, hpoint⟩⟩

private theorem mem_roleEnvelope_of_mem_not_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {point : ℝ²}
    (hpointA : point ∈ A) (hpointNotSurplus : point ∉ S.surplusCap)
    (hpointNeOpp1 : point ≠ S.oppApex1)
    (hpointNeOpp2 : point ≠ S.oppApex2) :
    point ∈ insert S.surplusApex
      (S.capInteriorByIndex S.oppIndex1 ∪
        S.capInteriorByIndex S.oppIndex2) := by
  classical
  rcases S.exists_mem_capByIndex_of_mem hpointA with ⟨i, hpointCap⟩
  rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
    rfl | rfl | rfl
  · exact False.elim (hpointNotSurplus (by
      rw [← capByIndex_surplusIdx_eq_surplusCap S]
      exact hpointCap))
  · rcases mem_capByIndex_endpoint_or_interior S S.oppIndex1 hpointCap with
      hsecond | hthird | hinterior
    · have hsecondEq :
          (S.triangleByIndex S.oppIndex1).v2 = S.oppApex2 := by
        calc
          (S.triangleByIndex S.oppIndex1).v2 =
              S.oppositeVertexByIndex S.oppIndex2 :=
            S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2
          _ = S.oppApex2 :=
            (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
      exact False.elim (hpointNeOpp2 (hsecond.trans hsecondEq))
    · have hthirdEq :
          (S.triangleByIndex S.oppIndex1).v3 = S.surplusApex := by
        calc
          (S.triangleByIndex S.oppIndex1).v3 =
              S.oppositeVertexByIndex S.surplusIdx :=
            S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx
          _ = S.surplusApex :=
            (surplusApex_eq_oppositeVertexByIndex_surplusIdx S).symm
      exact Finset.mem_insert.mpr <| Or.inl <| hthird.trans hthirdEq
    · exact Finset.mem_insert.mpr <| Or.inr <|
        Finset.mem_union.mpr <| Or.inl hinterior
  · rcases mem_capByIndex_endpoint_or_interior S S.oppIndex2 hpointCap with
      hsecond | hthird | hinterior
    · have hsecondEq :
          (S.triangleByIndex S.oppIndex2).v2 = S.surplusApex := by
        calc
          (S.triangleByIndex S.oppIndex2).v2 =
              S.oppositeVertexByIndex S.surplusIdx :=
            S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx
          _ = S.surplusApex :=
            (surplusApex_eq_oppositeVertexByIndex_surplusIdx S).symm
      exact Finset.mem_insert.mpr <| Or.inl <| hsecond.trans hsecondEq
    · have hthirdEq :
          (S.triangleByIndex S.oppIndex2).v3 = S.oppApex1 := by
        calc
          (S.triangleByIndex S.oppIndex2).v3 =
              S.oppositeVertexByIndex S.oppIndex1 :=
            S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1
          _ = S.oppApex1 :=
            (oppApex1_eq_oppositeVertexByIndex_oppIndex1' S).symm
      exact False.elim (hpointNeOpp1 (hthird.trans hthirdEq))
    · exact Finset.mem_insert.mpr <| Or.inr <|
        Finset.mem_union.mpr <| Or.inr hinterior

private theorem firstResidual_inter_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    ((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap).card ≤ 1 := by
  classical
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertexByIndex_oppIndex1' S
  have hcap :
      S.rightAdjacentCapByIndex S.oppIndex1 = S.surplusCap := by
    calc
      S.rightAdjacentCapByIndex S.oppIndex1 =
          S.rightAdjacentCapByIndex
            (SurplusCapPacket.leftAdjacentIndex S.surplusIdx) :=
        congrArg S.rightAdjacentCapByIndex
          S.oppIndex1_eq_leftAdjacentIndex_surplusIdx
      _ = S.capByIndex S.surplusIdx :=
        S.rightAdjacentCapByIndex_leftAdjacentIndex S.surplusIdx
      _ = S.surplusCap := capByIndex_surplusIdx_eq_surplusCap S
  have hone :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 N.firstApexClass.radius
  apply le_trans (Finset.card_le_card ?_) hone
  intro point hpoint
  rcases Finset.mem_inter.mp hpoint with ⟨hpointSupport, hpointCap⟩
  have hpointSupport' : point ∈ N.firstApexClass.support :=
    (Finset.mem_erase.mp hpointSupport).2
  apply Finset.mem_inter.mpr
  constructor
  · rw [← hcenter]
    exact mem_selectedClass.mpr
      ⟨N.firstApexClass.support_subset_A hpointSupport',
        N.firstApexClass.support_eq_radius point hpointSupport'⟩
  · rw [hcap]
    exact hpointCap

private theorem secondRow_inter_surplusCap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    (N.secondApexClass.support ∩ S.surplusCap).card ≤ 1 := by
  classical
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
  have hcap :
      S.leftAdjacentCapByIndex S.oppIndex2 = S.surplusCap := by
    calc
      S.leftAdjacentCapByIndex S.oppIndex2 =
          S.leftAdjacentCapByIndex
            (SurplusCapPacket.rightAdjacentIndex S.surplusIdx) :=
        congrArg S.leftAdjacentCapByIndex
          S.oppIndex2_eq_rightAdjacentIndex_surplusIdx
      _ = S.capByIndex S.surplusIdx :=
        S.leftAdjacentCapByIndex_rightAdjacentIndex S.surplusIdx
      _ = S.surplusCap := capByIndex_surplusIdx_eq_surplusCap S
  have hone :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex2 N.secondApexClass.radius
  apply le_trans (Finset.card_le_card ?_) hone
  intro point hpoint
  rcases Finset.mem_inter.mp hpoint with ⟨hpointSupport, hpointCap⟩
  apply Finset.mem_inter.mpr
  constructor
  · rw [← hcenter]
    exact mem_selectedClass.mpr
      ⟨N.secondApexClass.support_subset_A hpointSupport,
        N.secondApexClass.support_eq_radius point hpointSupport⟩
  · rw [hcap]
    exact hpointCap

private theorem deleted_not_mem_surplusCap_of_balancedTightCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    deleted ∉ S.surplusCap := by
  have hdeletedInterior :
      deleted ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [I.firstInterior_eq]
    simp
  rw [← capByIndex_surplusIdx_eq_surplusCap S]
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hdeletedInterior
    S.surplusIdx_ne_oppIndex1.symm

private theorem retained_not_mem_surplusCap_of_balancedTightCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    N.retained ∉ S.surplusCap := by
  have hretainedInterior :
      N.retained ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [I.firstInterior_eq]
    simp
  rw [← capByIndex_surplusIdx_eq_surplusCap S]
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hretainedInterior
    S.surplusIdx_ne_oppIndex1.symm

private theorem firstInteriorThird_not_mem_surplusCap_of_balancedTightCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    I.firstInteriorThird ∉ S.surplusCap := by
  have hthirdInterior :
      I.firstInteriorThird ∈ S.capInteriorByIndex S.oppIndex1 := by
    rw [I.firstInterior_eq]
    simp
  rw [← capByIndex_surplusIdx_eq_surplusCap S]
  exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hthirdInterior
    S.surplusIdx_ne_oppIndex1.symm

private theorem surplusCap_subset_balancedTightCover_rowIntersections
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    S.surplusCap ⊆
      ((((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap) ∪
          ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap)) ∪
        (N.secondApexClass.support ∩ S.surplusCap)) := by
  classical
  have hsurplusSubsetA : S.surplusCap ⊆ D.A := by
    rw [← capByIndex_surplusIdx_eq_surplusCap S]
    exact S.capByIndex_subset S.surplusIdx
  have hdeletedNotSurplus :=
    deleted_not_mem_surplusCap_of_balancedTightCover I
  have hretainedNotSurplus :=
    retained_not_mem_surplusCap_of_balancedTightCover I
  intro point hpointCap
  have hpointA := hsurplusSubsetA hpointCap
  rw [I.carrier_partition.2] at hpointA
  simp only [Finset.mem_insert] at hpointA
  rcases hpointA with hpointDeleted | hpointRetained | hpointRows
  · subst point
    exact False.elim (hdeletedNotSurplus hpointCap)
  · subst point
    exact False.elim (hretainedNotSurplus hpointCap)
  · rcases Finset.mem_union.mp hpointRows with hpointFirstBlocker | hpointSecond
    · rcases Finset.mem_union.mp hpointFirstBlocker with hpointFirst | hpointBlocker
      · exact Finset.mem_union.mpr <| Or.inl <|
          Finset.mem_union.mpr <| Or.inl <|
            Finset.mem_inter.mpr ⟨hpointFirst, hpointCap⟩
      · exact Finset.mem_union.mpr <| Or.inl <|
          Finset.mem_union.mpr <| Or.inr <|
            Finset.mem_inter.mpr ⟨hpointBlocker, hpointCap⟩
    · exact Finset.mem_union.mpr <| Or.inr <|
        Finset.mem_inter.mpr ⟨hpointSecond, hpointCap⟩

private theorem blockerResidual_inter_surplusCap_eq_blockerInter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    (N.blockerClass.support.erase N.retained) ∩ S.surplusCap =
      N.blockerClass.support ∩ S.surplusCap := by
  classical
  have hretainedNotSurplus :=
    retained_not_mem_surplusCap_of_balancedTightCover I
  ext point
  constructor
  · intro hpoint
    exact Finset.mem_inter.mpr
      ⟨(Finset.mem_erase.mp (Finset.mem_inter.mp hpoint).1).2,
        (Finset.mem_inter.mp hpoint).2⟩
  · intro hpoint
    rcases Finset.mem_inter.mp hpoint with ⟨hpointSupport, hpointCap⟩
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_erase.mpr
        ⟨fun hEq => hretainedNotSurplus (hEq ▸ hpointCap), hpointSupport⟩,
        hpointCap⟩

/-- In a balanced tight cover, the retained blocker row contains exactly
three points of the surplus cap.  This uses only the tight carrier cover and
the one-hit bounds at the two physical apexes; it does not assume a fixed
four-of-five choice for the second-apex row. -/
theorem balancedTightCover_blockerClass_inter_surplusCap_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    (N.blockerClass.support ∩ S.surplusCap).card = 3 := by
  classical
  have hcover := surplusCap_subset_balancedTightCover_rowIntersections I
  have hcoverCard := Finset.card_le_card hcover
  have hunionCardLe :
      (((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap) ∪
          ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap) ∪
        (N.secondApexClass.support ∩ S.surplusCap)).card ≤
        ((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap).card +
          ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card +
          (N.secondApexClass.support ∩ S.surplusCap).card := by
    calc
      _ ≤
          ((((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap) ∪
              ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap)).card +
            (N.secondApexClass.support ∩ S.surplusCap).card) :=
        Finset.card_union_le _ _
      _ ≤ _ := Nat.add_le_add_right
        (Finset.card_union_le _ _) _
  have hfirstLe := firstResidual_inter_surplusCap_card_le_one N
  have hsecondLe := secondRow_inter_surplusCap_card_le_one N
  have hblockerLe :
      ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card ≤ 3 := by
    have hsubset := Finset.card_le_card
      (Finset.inter_subset_left :
        (N.blockerClass.support.erase N.retained) ∩ S.surplusCap ⊆
          N.blockerClass.support.erase N.retained)
    rw [I.support_partition.2.1] at hsubset
    exact hsubset
  have hblockerEq :
      ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card = 3 := by
    have hsurplusCard := I.cap_profile.1
    omega
  have heraseInter :=
    blockerResidual_inter_surplusCap_eq_blockerInter I
  rw [← heraseInter]
  exact hblockerEq

/-- Each physical apex row uses exactly one point of the surplus cap.  The
three-point blocker intersection and the five-point cap leave no slack in the
two one-hit bounds. -/
theorem balancedTightCover_apexRows_inter_surplusCap_card_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    ((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap).card = 1 ∧
      (N.secondApexClass.support ∩ S.surplusCap).card = 1 := by
  have hcover := surplusCap_subset_balancedTightCover_rowIntersections I
  have hcoverCard := Finset.card_le_card hcover
  have hunionCardLe :
      (((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap) ∪
          ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap) ∪
        (N.secondApexClass.support ∩ S.surplusCap)).card ≤
        ((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap).card +
          ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card +
          (N.secondApexClass.support ∩ S.surplusCap).card := by
    calc
      _ ≤
          ((((N.firstApexClass.support.erase N.retained) ∩ S.surplusCap) ∪
              ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap)).card +
            (N.secondApexClass.support ∩ S.surplusCap).card) :=
        Finset.card_union_le _ _
      _ ≤ _ := Nat.add_le_add_right
        (Finset.card_union_le _ _) _
  have hfirstLe := firstResidual_inter_surplusCap_card_le_one N
  have hsecondLe := secondRow_inter_surplusCap_card_le_one N
  have hblockerEq :
      ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card = 3 := by
    rw [blockerResidual_inter_surplusCap_eq_blockerInter I]
    exact balancedTightCover_blockerClass_inter_surplusCap_card_eq_three I
  have hsurplusCard := I.cap_profile.1
  constructor <;> omega

/-- The normal second-apex four-row contains at least two points of the
three-point second opposite interior.  Both sets lie in the same complete
five-point radius class, so their cardinalities force a two-point overlap. -/
theorem balancedTightCover_secondRow_inter_secondInterior_card_ge_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    2 ≤ (N.secondApexClass.support ∩
      S.capInteriorByIndex S.oppIndex2).card := by
  have hinteriorSubsetProfile :
      S.capInteriorByIndex S.oppIndex2 ⊆
        SelectedClass D.A S.oppApex2 I.secondApexProfile.radius := by
    intro point hpoint
    have hpointInter :
        point ∈ SelectedClass D.A S.oppApex2 I.secondApexProfile.radius ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [I.secondInterior_eq]
      exact hpoint
    exact (Finset.mem_inter.mp hpointInter).1
  have hunionSubsetProfile :
      N.secondApexClass.support ∪ S.capInteriorByIndex S.oppIndex2 ⊆
        SelectedClass D.A S.oppApex2 I.secondApexProfile.radius := by
    intro point hpoint
    rcases Finset.mem_union.mp hpoint with hpointRow | hpointInterior
    · exact I.normalSecond_subset_profile hpointRow
    · exact hinteriorSubsetProfile hpointInterior
  have hunionCardLe := Finset.card_le_card hunionSubsetProfile
  have hcardIdentity := Finset.card_union_add_card_inter
    N.secondApexClass.support (S.capInteriorByIndex S.oppIndex2)
  have hrowCard := N.secondApexClass.support_card
  have hinteriorCard := I.cap_profile.2.2.2.2
  have hprofileCard := I.secondApexProfile.class_card_eq_five
  omega

/-- The balanced cover canonically exposes the two distinct surplus-cap hits
of the physical apex rows.  The retained blocker row is exactly the retained
source together with the other three points of the surplus cap. -/
theorem exists_balancedTightCover_surplusCap_rowHits_blocker_eq_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    ∃ firstHit secondHit : ℝ²,
      firstHit ∈ S.surplusCap ∧
      secondHit ∈ S.surplusCap ∧
      (N.firstApexClass.support.erase N.retained) ∩ S.surplusCap =
        {firstHit} ∧
      N.secondApexClass.support ∩ S.surplusCap = {secondHit} ∧
      firstHit ≠ secondHit ∧
      N.blockerClass.support =
        insert N.retained (S.surplusCap \ {firstHit, secondHit}) := by
  classical
  rcases Finset.card_eq_one.mp
      (balancedTightCover_apexRows_inter_surplusCap_card_eq_one I).1 with
    ⟨firstHit, hfirstHitEq⟩
  rcases Finset.card_eq_one.mp
      (balancedTightCover_apexRows_inter_surplusCap_card_eq_one I).2 with
    ⟨secondHit, hsecondHitEq⟩
  have hfirstHitInter :
      firstHit ∈
        (N.firstApexClass.support.erase N.retained) ∩ S.surplusCap := by
    rw [hfirstHitEq]
    simp
  have hsecondHitInter :
      secondHit ∈ N.secondApexClass.support ∩ S.surplusCap := by
    rw [hsecondHitEq]
    simp
  have hfirstHitCap := (Finset.mem_inter.mp hfirstHitInter).2
  have hsecondHitCap := (Finset.mem_inter.mp hsecondHitInter).2
  have hfirstHitNeSecondHit : firstHit ≠ secondHit := by
    intro hEq
    have hfirstHitSecond : firstHit ∈ N.secondApexClass.support := by
      simpa [hEq] using (Finset.mem_inter.mp hsecondHitInter).1
    exact Finset.disjoint_left.mp I.support_partition.2.2.2.1
      (Finset.mem_inter.mp hfirstHitInter).1 hfirstHitSecond
  have hblockerResidualInterCard :
      ((N.blockerClass.support.erase N.retained) ∩ S.surplusCap).card = 3 := by
    rw [blockerResidual_inter_surplusCap_eq_blockerInter I]
    exact balancedTightCover_blockerClass_inter_surplusCap_card_eq_three I
  have hblockerResidualInterEq :
      (N.blockerClass.support.erase N.retained) ∩ S.surplusCap =
        N.blockerClass.support.erase N.retained := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    have hblockerResidualCard := I.support_partition.2.1
    omega
  have hblockerResidualSubsetCap :
      N.blockerClass.support.erase N.retained ⊆ S.surplusCap := by
    intro point hpoint
    have hpointInter :
        point ∈
          (N.blockerClass.support.erase N.retained) ∩ S.surplusCap := by
      rw [hblockerResidualInterEq]
      exact hpoint
    exact (Finset.mem_inter.mp hpointInter).2
  have hcover := surplusCap_subset_balancedTightCover_rowIntersections I
  have hblockerSupportEq :
      N.blockerClass.support =
        insert N.retained (S.surplusCap \ {firstHit, secondHit}) := by
    ext point
    constructor
    · intro hpointBlocker
      by_cases hpointRetained : point = N.retained
      · exact Finset.mem_insert.mpr <| Or.inl hpointRetained
      · have hpointResidual :
            point ∈ N.blockerClass.support.erase N.retained :=
          Finset.mem_erase.mpr ⟨hpointRetained, hpointBlocker⟩
        have hpointCap := hblockerResidualSubsetCap hpointResidual
        have hpointNeFirstHit : point ≠ firstHit := by
          intro hEq
          subst point
          exact Finset.disjoint_left.mp I.support_partition.2.2.1
            (Finset.mem_inter.mp hfirstHitInter).1 hpointResidual
        have hpointNeSecondHit : point ≠ secondHit := by
          intro hEq
          subst point
          exact Finset.disjoint_left.mp I.support_partition.2.2.2.2.1
            hpointResidual (Finset.mem_inter.mp hsecondHitInter).1
        exact Finset.mem_insert.mpr <| Or.inr <|
          Finset.mem_sdiff.mpr
            ⟨hpointCap, by simp [hpointNeFirstHit, hpointNeSecondHit]⟩
    · intro hpoint
      rcases Finset.mem_insert.mp hpoint with hpointRetained | hpointDiff
      · subst point
        exact N.retained_mem_blockerClass
      · rcases Finset.mem_sdiff.mp hpointDiff with ⟨hpointCap, hpointNotHits⟩
        have hpointNeFirstHit : point ≠ firstHit := by
          intro hEq
          apply hpointNotHits
          simp [hEq]
        have hpointNeSecondHit : point ≠ secondHit := by
          intro hEq
          apply hpointNotHits
          simp [hEq]
        rcases Finset.mem_union.mp (hcover hpointCap) with
            hpointFirstBlocker | hpointSecond
        · rcases Finset.mem_union.mp hpointFirstBlocker with
            hpointFirst | hpointBlocker
          · have hpointEq : point = firstHit := by
              rw [hfirstHitEq] at hpointFirst
              exact Finset.mem_singleton.mp hpointFirst
            exact False.elim (hpointNeFirstHit hpointEq)
          · exact (Finset.mem_erase.mp (Finset.mem_inter.mp hpointBlocker).1).2
        · have hpointEq : point = secondHit := by
            rw [hsecondHitEq] at hpointSecond
            exact Finset.mem_singleton.mp hpointSecond
          exact False.elim (hpointNeSecondHit hpointEq)
  exact ⟨firstHit, secondHit, hfirstHitCap, hsecondHitCap,
    hfirstHitEq, hsecondHitEq, hfirstHitNeSecondHit, hblockerSupportEq⟩

/-- A source-faithful role packet for the balanced exact-twelve cover.  It
records every decomposition forced by the current hypotheses without choosing
unsupported geometric labels for the two flexible row points. -/
structure BalancedTightCoverFlexibleRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) where
  firstHit : ℝ²
  secondHit : ℝ²
  firstOther : ℝ²
  secondRemainder : Finset ℝ²
  firstHit_mem_surplusCap : firstHit ∈ S.surplusCap
  secondHit_mem_surplusCap : secondHit ∈ S.surplusCap
  firstHit_ne_secondHit : firstHit ≠ secondHit
  firstInteriorThird_ne_firstHit : I.firstInteriorThird ≠ firstHit
  firstOther_ne_firstInteriorThird : firstOther ≠ I.firstInteriorThird
  firstOther_ne_firstHit : firstOther ≠ firstHit
  firstOther_not_mem_surplusCap : firstOther ∉ S.surplusCap
  firstResidual_inter_surplusCap_eq :
    (N.firstApexClass.support.erase N.retained) ∩ S.surplusCap = {firstHit}
  firstResidual_eq :
    N.firstApexClass.support.erase N.retained =
      {I.firstInteriorThird, firstHit, firstOther}
  secondRow_inter_surplusCap_eq :
    N.secondApexClass.support ∩ S.surplusCap = {secondHit}
  secondRemainder_eq :
    secondRemainder = N.secondApexClass.support \ S.surplusCap
  secondRemainder_card_eq_three : secondRemainder.card = 3
  secondRemainder_disjoint_surplusCap : Disjoint secondRemainder S.surplusCap
  secondRow_eq :
    N.secondApexClass.support = insert secondHit secondRemainder
  secondInterior_hits_ge_two :
    2 ≤ (N.secondApexClass.support ∩
      S.capInteriorByIndex S.oppIndex2).card
  blockerSupport_eq :
    N.blockerClass.support =
      insert N.retained (S.surplusCap \ {firstHit, secondHit})

/-- The balanced exact-twelve invariant produces a flexible role packet with
an exact first-row split, an exact second-row cap-complement split, and the
forced two-of-three second-interior incidence. -/
theorem nonempty_balancedTightCoverFlexibleRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    Nonempty (BalancedTightCoverFlexibleRolePacket I) := by
  classical
  rcases exists_balancedTightCover_surplusCap_rowHits_blocker_eq_complement I with
    ⟨firstHit, secondHit, hfirstHitCap, hsecondHitCap, hfirstHitEq,
      hsecondHitEq, hfirstHitNeSecondHit, hblockerSupportEq⟩
  have hfirstHitInter :
      firstHit ∈
        (N.firstApexClass.support.erase N.retained) ∩ S.surplusCap := by
    rw [hfirstHitEq]
    simp
  have hfirstHitResidual :
      firstHit ∈ N.firstApexClass.support.erase N.retained :=
    (Finset.mem_inter.mp hfirstHitInter).1
  have hthirdResidual :
      I.firstInteriorThird ∈ N.firstApexClass.support.erase N.retained :=
    I.firstInteriorThird_mem
  have hthirdNotCap : I.firstInteriorThird ∉ S.surplusCap :=
    firstInteriorThird_not_mem_surplusCap_of_balancedTightCover I
  have hthirdNeFirstHit : I.firstInteriorThird ≠ firstHit := by
    intro hEq
    apply hthirdNotCap
    rw [hEq]
    exact hfirstHitCap
  have hfirstResidualCard :
      (N.firstApexClass.support.erase N.retained).card = 3 :=
    I.support_partition.1
  have hfirstEraseThirdCard :
      ((N.firstApexClass.support.erase N.retained).erase
        I.firstInteriorThird).card = 2 := by
    rw [Finset.card_erase_of_mem hthirdResidual, hfirstResidualCard]
  have hfirstHitEraseThird :
      firstHit ∈
        (N.firstApexClass.support.erase N.retained).erase
          I.firstInteriorThird :=
    Finset.mem_erase.mpr ⟨hthirdNeFirstHit.symm, hfirstHitResidual⟩
  have hremainingCard :
      (((N.firstApexClass.support.erase N.retained).erase
        I.firstInteriorThird).erase firstHit).card = 1 := by
    rw [Finset.card_erase_of_mem hfirstHitEraseThird, hfirstEraseThirdCard]
  rcases Finset.card_eq_one.mp hremainingCard with
    ⟨firstOther, hremainingEq⟩
  have hfirstOtherDoubleErase :
      firstOther ∈
        ((N.firstApexClass.support.erase N.retained).erase
          I.firstInteriorThird).erase firstHit := by
    rw [hremainingEq]
    simp
  have hfirstOtherEraseThird :
      firstOther ∈
        (N.firstApexClass.support.erase N.retained).erase
          I.firstInteriorThird :=
    (Finset.mem_erase.mp hfirstOtherDoubleErase).2
  have hfirstOtherNeFirstHit : firstOther ≠ firstHit :=
    (Finset.mem_erase.mp hfirstOtherDoubleErase).1
  have hfirstOtherResidual :
      firstOther ∈ N.firstApexClass.support.erase N.retained :=
    (Finset.mem_erase.mp hfirstOtherEraseThird).2
  have hfirstOtherNeThird : firstOther ≠ I.firstInteriorThird :=
    (Finset.mem_erase.mp hfirstOtherEraseThird).1
  have hfirstResidualEq :
      N.firstApexClass.support.erase N.retained =
        {I.firstInteriorThird, firstHit, firstOther} := by
    ext point
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro hpointResidual
      by_cases hpointThird : point = I.firstInteriorThird
      · exact Or.inl hpointThird
      by_cases hpointFirstHit : point = firstHit
      · exact Or.inr <| Or.inl hpointFirstHit
      · have hpointDoubleErase :
            point ∈
              ((N.firstApexClass.support.erase N.retained).erase
                I.firstInteriorThird).erase firstHit :=
          Finset.mem_erase.mpr ⟨hpointFirstHit,
            Finset.mem_erase.mpr ⟨hpointThird, hpointResidual⟩⟩
        rw [hremainingEq] at hpointDoubleErase
        exact Or.inr <| Or.inr <| Finset.mem_singleton.mp hpointDoubleErase
    · intro hpoint
      rcases hpoint with hpointThird | hpointFirstHit | hpointOther
      · simpa [hpointThird] using hthirdResidual
      · simpa [hpointFirstHit] using hfirstHitResidual
      · simpa [hpointOther] using hfirstOtherResidual
  have hfirstOtherNotCap : firstOther ∉ S.surplusCap := by
    intro hfirstOtherCap
    have hfirstOtherInter :
        firstOther ∈
          (N.firstApexClass.support.erase N.retained) ∩ S.surplusCap :=
      Finset.mem_inter.mpr ⟨hfirstOtherResidual, hfirstOtherCap⟩
    rw [hfirstHitEq] at hfirstOtherInter
    exact hfirstOtherNeFirstHit (Finset.mem_singleton.mp hfirstOtherInter)
  let secondRemainder := N.secondApexClass.support \ S.surplusCap
  have hsecondRemainderCard : secondRemainder.card = 3 := by
    have hrowCard := N.secondApexClass.support_card
    have hpartition :=
      Finset.card_sdiff_add_card_inter
        N.secondApexClass.support S.surplusCap
    have hinterCard :
        (N.secondApexClass.support ∩ S.surplusCap).card = 1 := by
      rw [hsecondHitEq]
      simp
    dsimp [secondRemainder]
    omega
  have hsecondHitSupport : secondHit ∈ N.secondApexClass.support := by
    have hsecondHitInter :
        secondHit ∈ N.secondApexClass.support ∩ S.surplusCap := by
      rw [hsecondHitEq]
      simp
    exact (Finset.mem_inter.mp hsecondHitInter).1
  have hsecondRemainderDisjoint : Disjoint secondRemainder S.surplusCap := by
    rw [Finset.disjoint_left]
    intro point hpointRemainder hpointCap
    exact (Finset.mem_sdiff.mp hpointRemainder).2 hpointCap
  have hsecondRowEq :
      N.secondApexClass.support = insert secondHit secondRemainder := by
    ext point
    constructor
    · intro hpointRow
      by_cases hpointCap : point ∈ S.surplusCap
      · have hpointInter :
            point ∈ N.secondApexClass.support ∩ S.surplusCap :=
          Finset.mem_inter.mpr ⟨hpointRow, hpointCap⟩
        rw [hsecondHitEq] at hpointInter
        exact Finset.mem_insert.mpr <| Or.inl <|
          Finset.mem_singleton.mp hpointInter
      · exact Finset.mem_insert.mpr <| Or.inr <|
          Finset.mem_sdiff.mpr ⟨hpointRow, hpointCap⟩
    · intro hpoint
      rcases Finset.mem_insert.mp hpoint with hpointHit | hpointRemainder
      · simpa [hpointHit] using hsecondHitSupport
      · exact (Finset.mem_sdiff.mp hpointRemainder).1
  exact ⟨⟨firstHit, secondHit, firstOther, secondRemainder,
    hfirstHitCap, hsecondHitCap, hfirstHitNeSecondHit,
    hthirdNeFirstHit, hfirstOtherNeThird, hfirstOtherNeFirstHit,
    hfirstOtherNotCap, hfirstHitEq, hfirstResidualEq, hsecondHitEq,
    rfl, hsecondRemainderCard, hsecondRemainderDisjoint, hsecondRowEq,
    balancedTightCover_secondRow_inter_secondInterior_card_ge_two I,
    hblockerSupportEq⟩⟩

/-- The blocker center cannot lie in the surplus cap: its selected four-row
has three surplus-cap points, whereas a positive-radius row centered in that
cap can contain at most two. -/
theorem balancedTightCover_blocker_not_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    blocker ∉ S.surplusCap := by
  intro hblocker
  have hcapEq : S.capByIndex S.surplusIdx = S.surplusCap :=
    capByIndex_surplusIdx_eq_surplusCap S
  have hblockerCap : blocker ∈ S.capByIndex S.surplusIdx := by
    rw [hcapEq]
    exact hblocker
  have hle :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.surplusIdx N.blockerClass hblockerCap
  rw [hcapEq] at hle
  have heq := balancedTightCover_blockerClass_inter_surplusCap_card_eq_three I
  omega

/-- The tight-cover blocker center lies in the six-location source envelope:
the surplus apex, one of the two non-retained first-opposite interior points,
or one of the three second-opposite interior points. -/
theorem balancedTightCover_blocker_mem_roleEnvelope
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    (I : BalancedTightCoverInvariant R C N) :
    blocker ∈ insert S.surplusApex
      ((S.capInteriorByIndex S.oppIndex1).erase N.retained ∪
        S.capInteriorByIndex S.oppIndex2) := by
  classical
  have hblockerEq := tightPhysical_blocker_eq_centerAt_retained N
  have hblockerA : blocker ∈ D.A := by
    rw [hblockerEq]
    exact (Finset.mem_erase.mp
      (H.selectedAt N.retained N.retained_mem_A).toCriticalFourShell.center_mem).2
  have hblockerNotSurplus := balancedTightCover_blocker_not_mem_surplusCap I
  have hblockerNeOpp1 : blocker ≠ S.oppApex1 :=
    N.freshThreeCenter.center₀_ne_center₁.symm
  have hblockerNeOpp2 : blocker ≠ S.oppApex2 :=
    N.freshThreeCenter.center₁_ne_center₂
  have hblockerNeRetained : blocker ≠ N.retained := by
    intro hEq
    apply N.blockerClass.center_not_mem
    simpa only [hEq] using N.retained_mem_blockerClass
  have henvelope := mem_roleEnvelope_of_mem_not_surplusCap S hblockerA
    hblockerNotSurplus hblockerNeOpp1 hblockerNeOpp2
  rcases Finset.mem_insert.mp henvelope with hsurplusApex | hinteriors
  · exact Finset.mem_insert.mpr <| Or.inl hsurplusApex
  · rcases Finset.mem_union.mp hinteriors with hfirstInterior | hsecondInterior
    · exact Finset.mem_insert.mpr <| Or.inr <|
        Finset.mem_union.mpr <| Or.inl <|
          Finset.mem_erase.mpr ⟨hblockerNeRetained, hfirstInterior⟩
    · exact Finset.mem_insert.mpr <| Or.inr <|
        Finset.mem_union.mpr <| Or.inr hsecondInterior

/-- The exact-twelve tight-union hypotheses produce the invariant packet
without using either the explicit retained-omission proof or the retained
common-deletion witness from the historical endpoint. -/
theorem nonempty_balancedTightCoverInvariant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (hcard : D.A.card = 12)
    (hunion :
      ((N.firstApexClass.support ∪ N.blockerClass.support) ∪
        N.secondApexClass.support).card = 11)
    (herase :
      D.A.erase deleted =
        (N.firstApexClass.support ∪ N.blockerClass.support) ∪
          N.secondApexClass.support) :
    Nonempty (BalancedTightCoverInvariant R C N) := by
  have hintersections := tightPhysical_support_intersections N hunion
  have hpartition := tightPhysical_support_partition N hunion
  have hcarrier :=
    tightPhysical_carrier_eq_insert_deleted_partition N hunion herase
  have hblocker :=
    tightPhysical_blockerClass_support_eq_retainedCriticalShell N
  have hcap := tightPhysical_exact_cap_profile N hcard
  rcases exists_firstCapInterior_eq_triple N hcard with
    ⟨third, hthird, hfirstInterior⟩
  rcases nonempty_tightPhysical_secondApexUniqueFive N hcard with
    ⟨secondProfile⟩
  exact ⟨{
    carrier_card_eq_twelve := hcard
    union_card_eq_eleven := hunion
    carrier_erase_deleted_eq_union := herase
    retained_not_mem_second :=
      tightPhysical_retained_not_mem_second N hunion
    support_intersections := hintersections
    support_partition := hpartition
    carrier_partition := hcarrier
    blocker_support_eq := hblocker
    cap_profile := hcap
    firstInteriorThird := third
    firstInteriorThird_mem := hthird
    firstInterior_eq := hfirstInterior
    secondApexProfile := secondProfile
    normalSecond_subset_profile :=
      tightPhysical_normalSecond_subset_uniqueFive N secondProfile
    secondInterior_eq :=
      tightPhysical_secondApexFive_inter_capInterior_eq_capInterior
        N hcard secondProfile }⟩

end ExactFiveDistinctThreeCenterTightCover
end Problem97
