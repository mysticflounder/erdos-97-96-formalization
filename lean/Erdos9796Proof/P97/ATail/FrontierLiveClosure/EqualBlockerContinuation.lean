/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.SharedFrontierHelpers

/-!
# Equal-blocker continuation producer

The equal-blocker two-deletion branch has a saturated two-point carrier
bisector and a strict-cap source escaping the common selected row.  This file
retains that escaped source, chooses an original deleted source omitted by its
row, builds the resulting source-exact common-deletion packet, and exposes the
complete nine-way continuation split.

The declarations here are producer-side reductions.  They do not assert that
any continuation constructor is already contradictory.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

noncomputable def b1CommonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : ℝ² :=
  (lateFirstApexSystem C.R).centerAt
    C.first.deleted.1 C.first.deleted.2

noncomputable def b1CommonRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Finset ℝ² :=
  ((lateFirstApexSystem C.R).selectedAt
    C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support

/-- The no-third-deletion branch, retaining both that negative provenance and
the resulting exact five/six physical-class cover by the two known deletions
and the two live-row slices. -/
def B1PhysicalClassFiveSixNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  (¬ ∃ third : ExactFourMutualOmissionJointDeletion
        C.R C.rho C.u C.v,
      third.deleted ≠ C.first.deleted ∧
      third.deleted ≠ C.second.deleted) ∧
    (physicalClass.card = 5 ∨ physicalClass.card = 6) ∧
      physicalClass =
        {C.first.deleted.1, C.second.deleted.1} ∪ (uSlice ∪ vSlice)

/-- A third joint deletion has an actual blocker distinct from the blocker
shared by the two canonical deletions. -/
theorem b1_third_actualBlocker_ne_common
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (third : ExactFourMutualOmissionJointDeletion
      C.R C.rho C.u C.v)
    (hthirdFirst : third.deleted ≠ C.first.deleted)
    (hthirdSecond : third.deleted ≠ C.second.deleted) :
    (lateFirstApexSystem C.R).centerAt
        third.deleted.1 third.deleted.2 ≠
      b1CommonBlocker C := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  have hnormal :=
    b1_live_normalForm C.R C.hcard C.surface C.rho C.hrho C.hfive
      C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted C.huOmitted
      C.first C.second C.hdeletedNe C.hblockersEq
  have hdeletedValuesNe :
      C.first.deleted.1 ≠ C.second.deleted.1 := by
    intro h
    exact C.hdeletedNe (Subtype.ext h)
  have hpairSubset :
      ({C.first.deleted.1, C.second.deleted.1} : Finset ℝ²) ⊆
        b1CommonRow C ∩ physicalClass := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_inter.mpr
        ⟨by
          simpa [b1CommonRow] using
            ((lateFirstApexSystem C.R).selectedAt
              C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.q_mem_support,
         by simpa [physicalClass] using C.first.deleted_mem_class⟩
    · have hx' : x = C.second.deleted.1 := Finset.mem_singleton.mp hx
      subst x
      exact Finset.mem_inter.mpr
        ⟨by simpa [b1CommonRow] using hnormal.2.2.1,
         by simpa [physicalClass] using C.second.deleted_mem_class⟩
  have hcommonInter :
      b1CommonRow C ∩ physicalClass =
        {C.first.deleted.1, C.second.deleted.1} := by
    refine (Finset.eq_of_subset_of_card_le hpairSubset ?_).symm
    simpa [b1CommonRow, physicalClass, hdeletedValuesNe] using
      le_of_eq hnormal.2.2.2
  have hthirdNotCommonRow :
      third.deleted.1 ∉ b1CommonRow C := by
    intro hthirdRow
    have hthirdPair :
        third.deleted.1 ∈
          ({C.first.deleted.1, C.second.deleted.1} : Finset ℝ²) := by
      rw [← hcommonInter]
      exact Finset.mem_inter.mpr
        ⟨hthirdRow, by
          simpa [physicalClass] using third.deleted_mem_class⟩
    rcases Finset.mem_insert.mp hthirdPair with hfirst | hsecond
    · exact hthirdFirst (Subtype.ext hfirst)
    · exact hthirdSecond
        (Subtype.ext (Finset.mem_singleton.mp hsecond))
  have hcommonSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase third.deleted.1) (b1CommonBlocker C) := by
    have hsurvives :=
      (cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem C.R) C.first.deleted.2).mpr
        (by simpa [b1CommonRow] using hthirdNotCommonRow)
    simpa [b1CommonBlocker] using hsurvives
  exact
    ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
      (lateFirstApexSystem C.R) third.deleted.2 hcommonSurvives

/-- Either a genuinely new joint deletion exists, with a new actual blocker,
or the physical second-apex class is in the exact five/six live-row normal
form. -/
theorem b1_thirdJointDeletion_or_physicalClassFiveSixNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    (∃ third : ExactFourMutualOmissionJointDeletion
          C.R C.rho C.u C.v,
        third.deleted ≠ C.first.deleted ∧
        third.deleted ≠ C.second.deleted ∧
        (lateFirstApexSystem C.R).centerAt
            third.deleted.1 third.deleted.2 ≠
          b1CommonBlocker C) ∨
      B1PhysicalClassFiveSixNormalForm C := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  let deletedPair : Finset ℝ² :=
    {C.first.deleted.1, C.second.deleted.1}
  by_cases hthird :
      ∃ third : ExactFourMutualOmissionJointDeletion
          C.R C.rho C.u C.v,
        third.deleted ≠ C.first.deleted ∧
        third.deleted ≠ C.second.deleted
  · rcases hthird with ⟨third, hthirdFirst, hthirdSecond⟩
    exact Or.inl
      ⟨third, hthirdFirst, hthirdSecond,
        b1_third_actualBlocker_ne_common C third
          hthirdFirst hthirdSecond⟩
  · right
    have huTwo : uSlice.card ≤ 2 := by
      simpa [uSlice, physicalClass] using
        actualLateRow_secondClass_card_le_two C.R C.surface C.u
    have hvTwo : vSlice.card ≤ 2 := by
      simpa [vSlice, physicalClass] using
        actualLateRow_secondClass_card_le_two C.R C.surface C.v
    have hpairCard : deletedPair.card = 2 := by
      have hdeletedValuesNe :
          C.first.deleted.1 ≠ C.second.deleted.1 := by
        intro h
        exact C.hdeletedNe (Subtype.ext h)
      simp [deletedPair, hdeletedValuesNe]
    have hcover :
        physicalClass = deletedPair ∪ (uSlice ∪ vSlice) := by
      apply Finset.Subset.antisymm
      · intro x hxClass
        by_cases hxPair : x ∈ deletedPair
        · exact Finset.mem_union_left _ hxPair
        by_cases hxU :
            x ∈ ((lateFirstApexSystem C.R).selectedAt
              C.u.1 C.u.2).toCriticalFourShell.support
        · exact Finset.mem_union_right _
            (Finset.mem_union_left _
              (Finset.mem_inter.mpr ⟨hxU, hxClass⟩))
        by_cases hxV :
            x ∈ ((lateFirstApexSystem C.R).selectedAt
              C.v.1 C.v.2).toCriticalFourShell.support
        · exact Finset.mem_union_right _
            (Finset.mem_union_right _
              (Finset.mem_inter.mpr ⟨hxV, hxClass⟩))
        have hxA : x ∈ D.A := (mem_selectedClass.mp hxClass).1
        let w : CarrierVertex D.A := ⟨x, hxA⟩
        obtain ⟨K, hK⟩ :=
          exactFourMutualOmissionJointDeletion_of_prescribed
            C.R C.surface C.rho C.u C.v w
            (by simpa [w, physicalClass] using hxClass)
            (by simpa [w] using hxU)
            (by simpa [w] using hxV)
            C.first.blockers_ne
        have hKFirst : K.deleted ≠ C.first.deleted := by
          intro hEq
          apply hxPair
          have hx : x = C.first.deleted.1 := by
            calc
              x = w.1 := rfl
              _ = K.deleted.1 := congrArg Subtype.val hK.symm
              _ = C.first.deleted.1 := congrArg Subtype.val hEq
          simp [deletedPair, hx]
        have hKSecond : K.deleted ≠ C.second.deleted := by
          intro hEq
          apply hxPair
          have hx : x = C.second.deleted.1 := by
            calc
              x = w.1 := rfl
              _ = K.deleted.1 := congrArg Subtype.val hK.symm
              _ = C.second.deleted.1 := congrArg Subtype.val hEq
          simp [deletedPair, hx]
        exact (hthird ⟨K, hKFirst, hKSecond⟩).elim
      · intro x hx
        rcases Finset.mem_union.mp hx with hxPair | hxRows
        · rcases Finset.mem_insert.mp hxPair with rfl | hxSecond
          · simpa [physicalClass] using C.first.deleted_mem_class
          · have hx : x = C.second.deleted.1 :=
              Finset.mem_singleton.mp hxSecond
            subst x
            simpa [physicalClass] using C.second.deleted_mem_class
        · rcases Finset.mem_union.mp hxRows with hxU | hxV
          · exact (Finset.mem_inter.mp hxU).2
          · exact (Finset.mem_inter.mp hxV).2
    have hclassLe : physicalClass.card ≤ 6 := by
      rw [hcover]
      calc
        (deletedPair ∪ (uSlice ∪ vSlice)).card
            ≤ deletedPair.card + (uSlice ∪ vSlice).card :=
          Finset.card_union_le _ _
        _ ≤ deletedPair.card + (uSlice.card + vSlice.card) := by
          exact Nat.add_le_add_left (Finset.card_union_le _ _) _
        _ ≤ 6 := by omega
    have hclassGe : 5 ≤ physicalClass.card := by
      simpa [physicalClass] using C.hfive
    have hclassCard :
        physicalClass.card = 5 ∨ physicalClass.card = 6 := by
      omega
    simpa [B1PhysicalClassFiveSixNormalForm,
      physicalClass, uSlice, vSlice, deletedPair] using
      And.intro hthird (And.intro hclassCard hcover)

noncomputable def b1EscapeBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (t : CarrierVertex D.A) : ℝ² :=
  (lateFirstApexSystem C.R).centerAt t.1 t.2

noncomputable def b1EscapeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (t : CarrierVertex D.A) : Finset ℝ² :=
  ((lateFirstApexSystem C.R).selectedAt t.1 t.2).toCriticalFourShell.support

/-- The concrete strict-cap source escaping the saturated common row. -/
structure B1EscapeWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  source : CarrierVertex D.A
  source_mem_class :
    source.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  source_mem_interior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_ne_first : source ≠ C.first.deleted
  source_ne_second : source ≠ C.second.deleted
  source_not_mem_commonRow : source.1 ∉ b1CommonRow C
  commonBlocker_survives_source_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase source.1) (b1CommonBlocker C)
  escapeBlocker_ne_common :
    b1EscapeBlocker C source ≠ b1CommonBlocker C
  escapeBlocker_ne_apex :
    b1EscapeBlocker C source ≠ S.oppApex2
  overlap_le_two :
    ((b1EscapeRow C source ∩ b1CommonRow C).card ≤ 2)

/-- The existing live escape theorem fills the source-faithful witness. -/
theorem nonempty_b1EscapeWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    Nonempty (B1EscapeWitness C) := by
  classical
  rcases
      b1_live_escape_small_overlap C.R C.hcard C.surface C.rho C.hrho
        C.hfive C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted
        C.huOmitted C.first C.second C.hdeletedNe C.hblockersEq with
    ⟨t, ht, htFirst, htSecond, htNotRow, htSurvives, htBlockerNe,
      hsmall⟩
  have htClass : t ∈ SelectedClass D.A S.oppApex2 C.rho :=
    (Finset.mem_inter.mp ht).1
  have htInterior : t ∈ S.capInteriorByIndex S.oppIndex2 :=
    (Finset.mem_inter.mp ht).2
  have htA : t ∈ D.A := (mem_selectedClass.mp htClass).1
  let source : CarrierVertex D.A := ⟨t, htA⟩
  refine ⟨{
    source := source
    source_mem_class := by simpa [source] using htClass
    source_mem_interior := by simpa [source] using htInterior
    source_ne_first := ?_
    source_ne_second := ?_
    source_not_mem_commonRow := by
      simpa [source, b1CommonRow] using htNotRow
    commonBlocker_survives_source_deletion := by
      simpa [source, b1CommonBlocker] using htSurvives
    escapeBlocker_ne_common := by
      simpa [source, b1EscapeBlocker, b1CommonBlocker] using htBlockerNe
    escapeBlocker_ne_apex :=
      C.surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem C.R) source.1 source.2
    overlap_le_two := by
      simpa [source, b1EscapeRow, b1CommonRow] using hsmall }⟩
  · intro h
    apply htFirst
    simpa [source] using congrArg Subtype.val h
  · intro h
    apply htSecond
    simpa [source] using congrArg Subtype.val h

/-- The escaped selected row omits at least one original deleted source. -/
theorem b1_escapeRow_crossOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (E : B1EscapeWitness C) :
    C.first.deleted.1 ∉ b1EscapeRow C E.source ∨
      C.second.deleted.1 ∉ b1EscapeRow C E.source := by
  classical
  by_cases hfirst : C.first.deleted.1 ∈ b1EscapeRow C E.source
  · right
    intro hsecond
    have hcA : b1EscapeBlocker C E.source ∈ D.A := by
      exact (Finset.mem_erase.mp
        ((lateFirstApexSystem C.R).selectedAt
          E.source.1 E.source.2).toCriticalFourShell.center_mem).2
    have hcBisects :
        dist (b1EscapeBlocker C E.source) C.first.deleted.1 =
          dist (b1EscapeBlocker C E.source) C.second.deleted.1 := by
      exact
        (((lateFirstApexSystem C.R).selectedAt
          E.source.1 E.source.2).toCriticalFourShell.support_eq_radius
            C.first.deleted.1 hfirst).trans
        ((((lateFirstApexSystem C.R).selectedAt
          E.source.1 E.source.2).toCriticalFourShell.support_eq_radius
            C.second.deleted.1 hsecond).symm)
    have hcFilter :
        b1EscapeBlocker C E.source ∈
          D.A.filter (fun p ↦
            dist p C.first.deleted.1 = dist p C.second.deleted.1) :=
      Finset.mem_filter.mpr ⟨hcA, hcBisects⟩
    have hfiber :=
      b1_live_bisectorSet_eq_pair C.R C.hcard C.surface C.rho C.hrho
        C.hfive C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted
        C.huOmitted C.first C.second C.hdeletedNe C.hblockersEq
    rw [hfiber] at hcFilter
    rcases Finset.mem_insert.mp hcFilter with hcCommon | hcApex
    · exact E.escapeBlocker_ne_common (by
        simpa [b1CommonBlocker] using hcCommon)
    · exact E.escapeBlocker_ne_apex (Finset.mem_singleton.mp hcApex)
  · exact Or.inl hfirst

/-- An escaped source together with one omitted original deletion and its
source-exact common-deletion packet. -/
structure B1EscapeCrossDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  escape : B1EscapeWitness C
  deleted : CarrierVertex D.A
  deleted_eq : deleted = C.first.deleted ∨ deleted = C.second.deleted
  deleted_not_mem_escapeRow : deleted.1 ∉ b1EscapeRow C escape.source
  commonDeletion :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem C.R) deleted.1
      (b1EscapeBlocker C escape.source) S.oppApex2

/-- Package either original deleted source once its omission from the escaped
row has been selected. -/
theorem nonempty_b1EscapeCrossDeletionPacket_of_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (E : B1EscapeWitness C)
    (deleted : CarrierVertex D.A)
    (hdeleted : deleted = C.first.deleted ∨ deleted = C.second.deleted)
    (homitted : deleted.1 ∉ b1EscapeRow C E.source) :
    Nonempty (B1EscapeCrossDeletionPacket C) := by
  have hcA : b1EscapeBlocker C E.source ∈ D.A := by
    exact (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        E.source.1 E.source.2).toCriticalFourShell.center_mem).2
  have haA : S.oppApex2 ∈ D.A := C.first.uPacket.center₂_mem_A
  have hcSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
        (b1EscapeBlocker C E.source) := by
    exact
      (cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem C.R) E.source.2).mpr homitted
  have haSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1) S.oppApex2 :=
    C.surface.secondApex_robust.survives deleted.1 deleted.2
  rcases
      nonempty_commonDeletionTwoCenterPacket
        (lateFirstApexSystem C.R) deleted.2 hcA haA
        E.escapeBlocker_ne_apex hcSurvives haSurvives with
    ⟨commonDeletion⟩
  exact ⟨{
    escape := E
    deleted := deleted
    deleted_eq := hdeleted
    deleted_not_mem_escapeRow := homitted
    commonDeletion := commonDeletion }⟩

/-- Every equal-blocker context produces a source-exact escaped deletion. -/
theorem nonempty_b1EscapeCrossDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    Nonempty (B1EscapeCrossDeletionPacket C) := by
  rcases nonempty_b1EscapeWitness C with ⟨E⟩
  rcases b1_escapeRow_crossOmission C E with hfirst | hsecond
  · exact nonempty_b1EscapeCrossDeletionPacket_of_omission C E
      C.first.deleted (Or.inl rfl) hfirst
  · exact nonempty_b1EscapeCrossDeletionPacket_of_omission C E
      C.second.deleted (Or.inr rfl) hsecond

namespace B1EscapeCrossDeletionPacket

theorem deleted_mem_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    P.deleted.1 ∈ SelectedClass D.A S.oppApex2 C.rho := by
  rcases P.deleted_eq with h | h
  · simpa [h] using C.first.deleted_mem_class
  · simpa [h] using C.second.deleted_mem_class

theorem deleted_ne_apex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    P.deleted.1 ≠ S.oppApex2 := by
  intro h
  have hdist : dist S.oppApex2 P.deleted.1 = C.rho :=
    (mem_selectedClass.mp P.deleted_mem_class).2
  rw [h, dist_self] at hdist
  linarith [C.hrho]

theorem deleted_blocker_eq_common
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    (lateFirstApexSystem C.R).centerAt P.deleted.1 P.deleted.2 =
      b1CommonBlocker C := by
  rcases P.deleted_eq with h | h
  · simp [h, b1CommonBlocker]
  · simpa [h, b1CommonBlocker] using C.hblockersEq.symm

theorem deleted_row_eq_commonRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    ((lateFirstApexSystem C.R).selectedAt
      P.deleted.1 P.deleted.2).toCriticalFourShell.support =
      b1CommonRow C := by
  have hcenters :
      (lateFirstApexSystem C.R).centerAt P.deleted.1 P.deleted.2 =
        (lateFirstApexSystem C.R).centerAt
          C.first.deleted.1 C.first.deleted.2 := by
    simpa [b1CommonBlocker] using P.deleted_blocker_eq_common
  simpa [b1CommonRow] using
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem C.R) P.deleted.2 C.first.deleted.2 hcenters

theorem deleted_mem_commonRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    P.deleted.1 ∈ b1CommonRow C := by
  rw [← P.deleted_row_eq_commonRow]
  exact ((lateFirstApexSystem C.R).selectedAt
    P.deleted.1 P.deleted.2).toCriticalFourShell.q_mem_support

theorem deleted_survives_uBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    HasNEquidistantPointsAt 4 (D.A.erase P.deleted.1)
      ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2) := by
  rcases P.deleted_eq with h | h
  · simpa [h] using C.first.uPacket.survives₁
  · simpa [h] using C.second.uPacket.survives₁

theorem deleted_survives_vBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C) :
    HasNEquidistantPointsAt 4 (D.A.erase P.deleted.1)
      ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2) := by
  rcases P.deleted_eq with h | h
  · simpa [h] using C.first.vPacket.survives₁
  · simpa [h] using C.second.vPacket.survives₁

theorem reverse_survives_of_not_mem_commonRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1EscapeCrossDeletionPacket C)
    {x : ℝ²} (hx : x ∉ b1CommonRow C) :
    HasNEquidistantPointsAt 4 (D.A.erase x) (b1CommonBlocker C) := by
  have hxOwn :
      x ∉ ((lateFirstApexSystem C.R).selectedAt
        P.deleted.1 P.deleted.2).toCriticalFourShell.support := by
    simpa [P.deleted_row_eq_commonRow] using hx
  have hsurvives :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem C.R) P.deleted.2).mpr hxOwn
  simpa [P.deleted_blocker_eq_common] using hsurvives

end B1EscapeCrossDeletionPacket

/-- The nine source-faithful continuations after the escaped deletion packet
has been chosen. -/
inductive B1ContinuationCase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (P : B1EscapeCrossDeletionPacket C) : Prop where
  | escapeBlocker_eq_u
      (h : b1EscapeBlocker C P.escape.source =
        (lateFirstApexSystem C.R).centerAt C.u.1 C.u.2)
  | escapeBlocker_eq_v
      (h : b1EscapeBlocker C P.escape.source =
        (lateFirstApexSystem C.R).centerAt C.v.1 C.v.2)
  | deleted_eq_uBlocker
      (h : P.deleted.1 =
        (lateFirstApexSystem C.R).centerAt C.u.1 C.u.2)
  | deleted_eq_vBlocker
      (h : P.deleted.1 =
        (lateFirstApexSystem C.R).centerAt C.v.1 C.v.2)
  | deleted_eq_escapeBlocker
      (h : P.deleted.1 = b1EscapeBlocker C P.escape.source)
  | apex_pair
      (forward : HasNEquidistantPointsAt 4
        (D.A.erase P.deleted.1) S.oppApex2)
      (reverse : HasNEquidistantPointsAt 4
        (D.A.erase S.oppApex2) (b1CommonBlocker C))
  | uBlocker_pair
      (forward : HasNEquidistantPointsAt 4 (D.A.erase P.deleted.1)
        ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2))
      (reverse : HasNEquidistantPointsAt 4
        (D.A.erase ((lateFirstApexSystem C.R).centerAt C.u.1 C.u.2))
        (b1CommonBlocker C))
  | vBlocker_pair
      (forward : HasNEquidistantPointsAt 4 (D.A.erase P.deleted.1)
        ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2))
      (reverse : HasNEquidistantPointsAt 4
        (D.A.erase ((lateFirstApexSystem C.R).centerAt C.v.1 C.v.2))
        (b1CommonBlocker C))
  | escapeBlocker_pair
      (forward : HasNEquidistantPointsAt 4 (D.A.erase P.deleted.1)
        (b1EscapeBlocker C P.escape.source))
      (reverse : HasNEquidistantPointsAt 4
        (D.A.erase (b1EscapeBlocker C P.escape.source))
        (b1CommonBlocker C))

private theorem b1_four_mem_card_four_split
    {α : Type*}
    {K : Finset α} {q a b c d : α}
    (hKcard : K.card = 4)
    (hq : q ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    q = a ∨ q = b ∨ q = c ∨ q = d ∨
      a ∉ K ∨ b ∉ K ∨ c ∉ K ∨ d ∉ K := by
  classical
  by_cases hqa : q = a
  · exact Or.inl hqa
  by_cases hqb : q = b
  · exact Or.inr (Or.inl hqb)
  by_cases hqc : q = c
  · exact Or.inr (Or.inr (Or.inl hqc))
  by_cases hqd : q = d
  · exact Or.inr (Or.inr (Or.inr (Or.inl hqd)))
  by_cases ha : a ∈ K
  · by_cases hb : b ∈ K
    · by_cases hc : c ∈ K
      · by_cases hd : d ∈ K
        · exfalso
          have hsub : ({q, a, b, c, d} : Finset α) ⊆ K := by
            simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
              using And.intro hq
                (And.intro ha (And.intro hb (And.intro hc hd)))
          have hcardFive : ({q, a, b, c, d} : Finset α).card = 5 := by
            simp [hqa, hqb, hqc, hqd, hab, hac, had, hbc, hbd, hcd]
          have hle := Finset.card_le_card hsub
          omega
        · exact Or.inr (Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inr (Or.inr hd))))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr
          (Or.inr (Or.inr (Or.inl hc))))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (Or.inr (Or.inl hb)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ha))))

/-- Every escaped deletion packet lands in one of the nine continuation
constructors. -/
theorem b1ContinuationCase_of_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (P : B1EscapeCrossDeletionPacket C) :
    B1ContinuationCase C P := by
  classical
  by_cases hcu : b1EscapeBlocker C P.escape.source =
      (lateFirstApexSystem C.R).centerAt C.u.1 C.u.2
  · exact .escapeBlocker_eq_u hcu
  by_cases hcv : b1EscapeBlocker C P.escape.source =
      (lateFirstApexSystem C.R).centerAt C.v.1 C.v.2
  · exact .escapeBlocker_eq_v hcv
  have hcard : (b1CommonRow C).card = 4 := by
    simpa [b1CommonRow] using
      ((lateFirstApexSystem C.R).selectedAt
        C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.support_card
  have hsplit :=
    b1_four_mem_card_four_split
      (K := b1CommonRow C)
      (q := P.deleted.1)
      (a := S.oppApex2)
      (b := (lateFirstApexSystem C.R).centerAt C.u.1 C.u.2)
      (c := (lateFirstApexSystem C.R).centerAt C.v.1 C.v.2)
      (d := b1EscapeBlocker C P.escape.source)
      hcard P.deleted_mem_commonRow
      C.first.uPacket.centers_ne.symm
      C.first.vPacket.centers_ne.symm
      P.escape.escapeBlocker_ne_apex.symm
      C.first.blockers_ne
      (Ne.symm hcu) (Ne.symm hcv)
  rcases hsplit with hqa | hqu | hqv | hqe | ha | hu | hv | he
  · exact (P.deleted_ne_apex hqa).elim
  · exact .deleted_eq_uBlocker hqu
  · exact .deleted_eq_vBlocker hqv
  · exact .deleted_eq_escapeBlocker hqe
  · exact .apex_pair P.commonDeletion.survives₂
      (P.reverse_survives_of_not_mem_commonRow ha)
  · exact .uBlocker_pair P.deleted_survives_uBlocker
      (P.reverse_survives_of_not_mem_commonRow hu)
  · exact .vBlocker_pair P.deleted_survives_vBlocker
      (P.reverse_survives_of_not_mem_commonRow hv)
  · exact .escapeBlocker_pair P.commonDeletion.survives₁
      (P.reverse_survives_of_not_mem_commonRow he)

/-- Source-clean exhaustive producer for the equal-blocker continuation. -/
theorem b1ContinuationCase_of_counterexample
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) :
    ∃ P : B1EscapeCrossDeletionPacket C, B1ContinuationCase C P := by
  rcases nonempty_b1EscapeCrossDeletionPacket C with ⟨P⟩
  exact ⟨P, b1ContinuationCase_of_packet C P⟩

/-- The exact global interface still needed after the exhaustive producer.
Supplying a consumer for every source-faithful continuation rules out the
equal-blocker transport context. -/
theorem false_of_b1ContinuationConsumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hconsume : ∀ P : B1EscapeCrossDeletionPacket C,
      B1ContinuationCase C P → False) :
    False := by
  rcases b1ContinuationCase_of_counterexample C with ⟨P, hcase⟩
  exact hconsume P hcase

end ATailFrontierLiveClosure
end Problem97
