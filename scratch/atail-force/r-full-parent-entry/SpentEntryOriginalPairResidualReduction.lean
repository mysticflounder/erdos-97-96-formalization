/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SpentEntryCommonDeletionReduction
import SelfCenteredCommonDeletionClassifier
import ActualBlockerTerminalHitConsumer

/-!
# The two spent-entry original-pair residuals

The cycle residual does not require a separate two-radius foreclosure.  On any
source-exact actual-blocker cycle, the successor is the predecessor's selected
row center.  Deleting that center preserves the predecessor's exact row, while
a robust pair sourced at the successor preserves the second-apex row.  Thus
every cycle, including one which returns to the original frontier pair, gives
a source-preserving self-centered common-deletion packet.

For the terminal residual, the actual-blocker HIT row and the original
frontier pair leave a sharper dichotomy.  Either one of the original points is
omitted by the opposite critical row, giving common deletion, or the robust
predecessor is exactly the original pair in one orientation and the two
original points lie in each other's selected rows with one common blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailPrescribedDeletionEdge
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem selectedClass_mono_originalPairResidual
    {A B : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hBA : B ⊆ A) :
    SelectedClass B center radius ⊆ SelectedClass A center radius := by
  intro x hx
  rcases mem_selectedClass.mp hx with ⟨hxB, hxdist⟩
  exact mem_selectedClass.mpr ⟨hBA hxB, hxdist⟩

private theorem oppApex2_mem_A_originalPairResidual
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem hasNEquidistantPointsAt_mono_originalPairResidual
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

/-- A spent certificate can coexist only with the double-deletion arm of the
frontier's first-apex split.  The unique-radius arm is contradicted by the
positive alternate radius already present on the twice-erased carrier. -/
theorem FrontierRadiusSpentAtEntry.firstApexDouble
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1 := by
  rcases F.firstApexSplit with hdouble | hunique
  · exact hdouble
  · exfalso
    have hpostSub :
        (D.A.erase F.pair.q).erase F.pair.w ⊆ D.A := by
      intro z hz
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
    have halternateAmbient :
        4 ≤ (SelectedClass D.A S.oppApex1 E.alternateRadius).card :=
      le_trans E.alternateRadius_four
        (Finset.card_le_card
          (selectedClass_mono_originalPairResidual hpostSub))
    exact E.alternateRadius_ne
      (hunique.2 E.alternateRadius E.alternateRadius_pos halternateAmbient)

/-- An exact critical row, viewed after deleting its own center.  This is the
source-preserving form of the otherwise automatic self-centered K4 survival. -/
def CriticalFourShell.selfCenteredOmissionExactRowPacket
    {D : CounterexampleData} {source deleted : ℝ²}
    (R : CriticalFourShell D.A source deleted) :
    ActualBlockerOmissionExactRowPacket
      D source deleted deleted R.support := by
  have hdeleted_ne_source : deleted ≠ source :=
    (Finset.mem_erase.mp R.center_mem).1
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) deleted :=
    deletion_survives_of_not_mem_selected_support
      R.toSelectedFourClass R.center_not_mem_support
  exact
    { blocker_mem_erase_source := R.center_mem
      source_mem_A := R.q_mem_A
      mate_mem_A := (Finset.mem_erase.mp R.center_mem).2
      source_ne_mate := hdeleted_ne_source.symm
      blocker_ne_source := hdeleted_ne_source
      support_subset_A := R.support_subset_A
      support_card := R.support_card
      source_mem_support := R.q_mem_support
      mate_not_mem_support := R.center_not_mem_support
      blocker_not_mem_support := R.center_not_mem_support
      radius := R.radius
      radius_pos := R.radius_pos
      support_eq_radiusClass := R.support_eq
      support_eq_radius := R.support_eq_radius
      source_eq_radius := R.support_eq_radius source R.q_mem_support
      mate_ne_radius := by
        simpa using (ne_of_lt R.radius_pos)
      deletion_survives := hsurvives
      mate_radius_ne_source_radius := by
        simpa [R.support_eq_radius source R.q_mem_support] using
          (ne_of_lt R.radius_pos)
      qDeletedClass :=
        criticalFourShellToU5QDeletedK4ClassOfNotMem
          R R.center_not_mem_support }

/-- Every source-exact actual-blocker cycle yields a self-centered
common-deletion packet while retaining the predecessor's exact selected row.
No fixed-radius or cap-localization hypothesis is used. -/
theorem SourceExactMinimalActualBlockerCycle.exists_sourcePreservingSelfCenteredCommonDeletion_general
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ source deleted : ℝ²,
      ∃ (B₁ : Finset ℝ²)
          (R : ActualBlockerOmissionExactRowPacket
            D source deleted deleted B₁)
          (Cpacket : CommonDeletionTwoCenterPacket
            D H deleted deleted S.oppApex2),
        source = (K.source
            ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩).1 ∧
          deleted = (K.source ⟨1, K.two_le_period⟩).1 ∧
          H.centerAt source R.source_mem_A = deleted ∧
          Cpacket.B₁ = B₁ ∧
          source ∈ Cpacket.B₁ ∧
          deleted ∉ Cpacket.B₁ ∧
          Cpacket.B₁ = D.A.filter fun z => dist deleted z = R.radius := by
  classical
  let i₀ : Fin K.period :=
    ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
  let i₁ : Fin K.period := ⟨1, K.two_le_period⟩
  let source := (K.source i₀).1
  let deleted := (K.source i₁).1
  have hedge : H.blockerVertex (K.source i₀) = K.source i₁ := by
    simp [i₀, i₁, SourceExactMinimalActualBlockerCycle.source]
  have hcenter :
      H.centerAt source (K.source i₀).2 = deleted := by
    have hvalue := congrArg Subtype.val hedge
    simpa [source, deleted, CriticalShellSystem.blockerVertex] using hvalue
  let shell := (H.selectedAt source (K.source i₀).2).toCriticalFourShell
  have R : ActualBlockerOmissionExactRowPacket
      D source deleted deleted shell.support := by
    have R₀ :=
      Problem97.ATailRFullParentEntryScratch.CriticalFourShell.selfCenteredOmissionExactRowPacket
        shell
    simpa [shell, hcenter] using R₀
  rcases K.exists_pair_at_source_at i₀ with ⟨rho₀, P₀, hsource₀⟩
  have hdeleted_ne_second : deleted ≠ S.oppApex2 := by
    have hblocker_ne_second :=
      AmbientRobustHistoryPair.sourceBlocker_ne_oppApex2 P₀ H
    simpa [source, hsource₀, hcenter] using hblocker_ne_second
  rcases K.exists_pair_at_source_at i₁ with ⟨rho₁, P₁, hsource₁⟩
  have hsurvivesSecond :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2 := by
    apply hasNEquidistantPointsAt_mono_originalPairResidual
      (h := P₁.second_double)
    intro z hz
    rcases Finset.mem_erase.mp hz with ⟨_hzMate, hzEraseSource⟩
    rcases Finset.mem_erase.mp hzEraseSource with ⟨hzSource, hzA⟩
    exact Finset.mem_erase.mpr
      ⟨by simpa [deleted, hsource₁] using hzSource, hzA⟩
  rcases R.exists_selfCenteredCommonDeletion
      (H := H) (oppApex2_mem_A_originalPairResidual S)
      hdeleted_ne_second hsurvivesSecond with
    ⟨Cpacket, hB₁, hsourceB₁, hdeletedB₁, hrow⟩
  exact ⟨source, deleted, shell.support, R, Cpacket,
    rfl, rfl, hcenter, hB₁, hsourceB₁, hdeletedB₁, hrow⟩

/-- Bare consumer form of the preceding source-preserving cycle theorem. -/
theorem SourceExactMinimalActualBlockerCycle.exists_selfCenteredCommonDeletion_general
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    ∃ deleted : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted deleted S.oppApex2) := by
  rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_sourcePreservingSelfCenteredCommonDeletion_general
        K with
    ⟨_source, deleted, _B₁, _R, Cpacket, _⟩
  exact ⟨deleted, ⟨Cpacket⟩⟩

/- ## Terminal original-pair HIT -/

/-- The non-common-deletion core of the terminal original-pair HIT residual.
The robust predecessor is exactly the frontier pair in one orientation; both
directed cross incidences occur; their chosen blockers coincide; and that
common blocker is retained in the terminal carrier. -/
structure SpentEntryTerminalOriginalPairMutualHitPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H) : Type where
  predecessor_orientation :
    (K.predecessorPair.x = F.pair.q ∧
      K.predecessorPair.y = F.pair.w) ∨
    (K.predecessorPair.x = F.pair.w ∧
      K.predecessorPair.y = F.pair.q)
  predecessorRadius_eq : K.predecessorRadius = radius
  source_actualBlocker_hit : ActualBlockerHitOutcome K.predecessorPair H
  w_mem_q_row :
    F.pair.w ∈
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support
  q_mem_w_row :
    F.pair.q ∈
      (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell.support
  blocker_centers_eq :
    H.centerAt F.pair.q F.pair.q_mem_A =
      H.centerAt F.pair.w F.pair.w_mem_A
  common_blocker_mem_terminal :
    H.centerAt F.pair.q F.pair.q_mem_A ∈ T.terminal.carrier

private theorem predecessorRadius_eq_frontierRadius_of_source_eq_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (hxq : K.predecessorPair.x = F.pair.q) :
    K.predecessorRadius = radius := by
  have hxPred := (mem_selectedClass.mp K.predecessorPair.x_mem_class).2
  have hqFrontier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  calc
    K.predecessorRadius = dist S.oppApex1 K.predecessorPair.x := hxPred.symm
    _ = dist F.pair.q S.oppApex1 := by rw [hxq, dist_comm]
    _ = radius := hqFrontier

private theorem predecessorRadius_eq_frontierRadius_of_source_eq_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (hxw : K.predecessorPair.x = F.pair.w) :
    K.predecessorRadius = radius := by
  have hxPred := (mem_selectedClass.mp K.predecessorPair.x_mem_class).2
  have hwFrontier :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  calc
    K.predecessorRadius = dist S.oppApex1 K.predecessorPair.x := hxPred.symm
    _ = dist F.pair.w S.oppApex1 := by rw [hxw, dist_comm]
    _ = radius := hwFrontier

private theorem selectedShell_support_eq_of_source_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x y : ℝ²} (hx : x ∈ A) (hy : y ∈ A) (hxy : x = y) :
    (H.selectedAt x hx).toCriticalFourShell.support =
      (H.selectedAt y hy).toCriticalFourShell.support := by
  subst y
  have hproof : hx = hy := Subsingleton.elim _ _
  cases hproof
  rfl

private theorem centerAt_eq_of_source_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x y : ℝ²} (hx : x ∈ A) (hy : y ∈ A) (hxy : x = y) :
    H.centerAt x hx = H.centerAt y hy := by
  subst y
  have hproof : hx = hy := Subsingleton.elim _ _
  cases hproof
  rfl

private theorem exists_commonDeletion_of_omitted_at_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {source deleted : ℝ²}
    (hsourceA : source ∈ D.A)
    (hdeletedA : deleted ∈ D.A)
    (homitted :
      deleted ∉
        (H.selectedAt source hsourceA).toCriticalFourShell.support)
    (hcenterNeSecond : H.centerAt source hsourceA ≠ S.oppApex2)
    (hsecond :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) S.oppApex2) :
    ∃ center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2) := by
  let center₁ := H.centerAt source hsourceA
  let shell := (H.selectedAt source hsourceA).toCriticalFourShell
  have hcenter₁A : center₁ ∈ D.A := by
    simpa [center₁, shell] using
      (Finset.mem_erase.mp shell.center_mem).2
  have hcenters : center₁ ≠ S.oppApex2 := by
    simpa [center₁] using hcenterNeSecond
  have hsurvives₁ :
      HasNEquidistantPointsAt 4 (D.A.erase deleted) center₁ := by
    exact deletion_survives_of_not_mem_selected_support
      shell.toSelectedFourClass (by simpa [shell] using homitted)
  exact ⟨center₁,
    nonempty_commonDeletionTwoCenterPacket H
      hdeletedA hcenter₁A (oppApex2_mem_A_originalPairResidual S)
      hcenters hsurvives₁ hsecond⟩

/-- The terminal original-pair HIT residual reduces to common deletion unless
the original frontier pair is the predecessor pair and its two critical rows
have one common retained blocker. -/
theorem LeastPositiveTerminalHitPredecessor.exists_commonDeletion_or_originalPairMutualHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : LeastPositiveTerminalHitPredecessor P H)
    (hresidual :
      SpentEntryTerminalPredecessorHitsOriginalPairAndActualBlockerHit K) :
    (∃ deleted center₁ : ℝ²,
      Nonempty (CommonDeletionTwoCenterPacket
        D H deleted center₁ S.oppApex2)) ∨
      Nonempty (SpentEntryTerminalOriginalPairMutualHitPacket K) := by
  rcases hresidual with ⟨hxq | hxw, hhit⟩
  · have hradius :=
      predecessorRadius_eq_frontierRadius_of_source_eq_q K hxq
    let hxA := (mem_selectedClass.mp K.predecessorPair.x_mem_class).1
    have hqSupportEq :=
      selectedShell_support_eq_of_source_eq
        H hxA F.pair.q_mem_A hxq
    let qShell :=
      (H.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell
    have hyQSupport : K.predecessorPair.y ∈ qShell.support := by
      rw [← hqSupportEq]
      exact hhit.1
    have hwClassPred :
        F.pair.w ∈
          SelectedClass D.A S.oppApex1 K.predecessorRadius := by
      have hwClassRadius :
          F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
        exact mem_selectedClass.mpr
          ⟨F.pair.w_mem_A, by
            simpa [dist_comm] using
              (Finset.mem_filter.mp
                (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2⟩
      simpa [hradius] using hwClassRadius
    by_cases hwQSupport : F.pair.w ∈ qShell.support
    · have hyw : K.predecessorPair.y = F.pair.w := by
        by_contra hyw
        have hwPredSupport :
            F.pair.w ∈
              (H.selectedAt K.predecessorPair.x hxA).toCriticalFourShell.support := by
          rw [hqSupportEq]
          exact hwQSupport
        exact AmbientRobustHistoryPair.false_of_actualBlocker_hit_thirdCommonPoint
          K.predecessorPair H hhit.1 hwPredSupport hwClassPred
          (by simpa [hxq] using F.pair.q_ne_w.symm)
          (fun h => hyw h.symm)
      by_cases hqWSupport :
          F.pair.q ∈
            (H.selectedAt F.pair.w
              F.pair.w_mem_A).toCriticalFourShell.support
      · right
        have hcenters :=
          (blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives
            F.pair E.firstApexDouble).2 ⟨hwQSupport, hqWSupport⟩
        have hretainedSource :
            H.centerAt F.pair.q F.pair.q_mem_A ∈ T.terminal.carrier := by
          rw [← centerAt_eq_of_source_eq H hxA F.pair.q_mem_A hxq]
          exact K.predecessor_blocker_mem_terminal
        exact ⟨{
          predecessor_orientation := Or.inl ⟨hxq, hyw⟩
          predecessorRadius_eq := hradius
          source_actualBlocker_hit := hhit
          w_mem_q_row := hwQSupport
          q_mem_w_row := hqWSupport
          blocker_centers_eq := hcenters
          common_blocker_mem_terminal := hretainedSource }⟩
      · left
        rcases exists_commonDeletion_of_omitted_at_source
            F.pair.w_mem_A F.pair.q_mem_A hqWSupport
            F.pair.w_blocker_ne_oppApex2 F.pair.q_survives with
          ⟨center₁, hpacket⟩
        exact ⟨F.pair.q, center₁, hpacket⟩
    · left
      rcases exists_commonDeletion_of_omitted_at_source
          F.pair.q_mem_A F.pair.w_mem_A hwQSupport
          F.pair.q_blocker_ne_oppApex2 F.pair.w_survives with
        ⟨center₁, hpacket⟩
      exact ⟨F.pair.w, center₁, hpacket⟩
  · have hradius :=
      predecessorRadius_eq_frontierRadius_of_source_eq_w K hxw
    let hxA := (mem_selectedClass.mp K.predecessorPair.x_mem_class).1
    have hwSupportEq :=
      selectedShell_support_eq_of_source_eq
        H hxA F.pair.w_mem_A hxw
    let wShell :=
      (H.selectedAt F.pair.w F.pair.w_mem_A).toCriticalFourShell
    have hyWSupport : K.predecessorPair.y ∈ wShell.support := by
      rw [← hwSupportEq]
      exact hhit.1
    have hqClassPred :
        F.pair.q ∈
          SelectedClass D.A S.oppApex1 K.predecessorRadius := by
      have hqClassRadius :
          F.pair.q ∈ SelectedClass D.A S.oppApex1 radius := by
        exact mem_selectedClass.mpr
          ⟨F.pair.q_mem_A, by
            simpa [dist_comm] using
              (Finset.mem_filter.mp
                (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2⟩
      simpa [hradius] using hqClassRadius
    by_cases hqWSupport : F.pair.q ∈ wShell.support
    · have hyq : K.predecessorPair.y = F.pair.q := by
        by_contra hyq
        have hqPredSupport :
            F.pair.q ∈
              (H.selectedAt K.predecessorPair.x hxA).toCriticalFourShell.support := by
          rw [hwSupportEq]
          exact hqWSupport
        exact AmbientRobustHistoryPair.false_of_actualBlocker_hit_thirdCommonPoint
          K.predecessorPair H hhit.1 hqPredSupport hqClassPred
          (by simpa [hxw] using F.pair.q_ne_w)
          (fun h => hyq h.symm)
      by_cases hwQSupport :
          F.pair.w ∈
            (H.selectedAt F.pair.q
              F.pair.q_mem_A).toCriticalFourShell.support
      · right
        have hcenters :=
          (blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives
            F.pair E.firstApexDouble).2 ⟨hwQSupport, hqWSupport⟩
        have hretainedSource :
            H.centerAt F.pair.q F.pair.q_mem_A ∈ T.terminal.carrier := by
          rw [hcenters]
          rw [← centerAt_eq_of_source_eq H hxA F.pair.w_mem_A hxw]
          exact K.predecessor_blocker_mem_terminal
        exact ⟨{
          predecessor_orientation := Or.inr ⟨hxw, hyq⟩
          predecessorRadius_eq := hradius
          source_actualBlocker_hit := hhit
          w_mem_q_row := hwQSupport
          q_mem_w_row := hqWSupport
          blocker_centers_eq := hcenters
          common_blocker_mem_terminal := hretainedSource }⟩
      · left
        rcases exists_commonDeletion_of_omitted_at_source
            F.pair.q_mem_A F.pair.w_mem_A hwQSupport
            F.pair.q_blocker_ne_oppApex2 F.pair.w_survives with
          ⟨center₁, hpacket⟩
        exact ⟨F.pair.w, center₁, hpacket⟩
    · left
      rcases exists_commonDeletion_of_omitted_at_source
          F.pair.w_mem_A F.pair.q_mem_A hqWSupport
          F.pair.w_blocker_ne_oppApex2 F.pair.q_survives with
        ⟨center₁, hpacket⟩
      exact ⟨F.pair.q, center₁, hpacket⟩

/-- End-to-end spent orbit with the cycle residual removed.  The only
non-common-deletion branch is now the exact terminal original-pair mutual-hit
packet above. -/
theorem AmbientRobustHistoryPair.spentEntryOrbit_originalPairMutualHit_or_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    (P : AmbientRobustHistoryPair D S T.terminal.carrier rho)
    (horbit :
      (∃ n : ℕ,
        ((H.blockerVertex^[n])
          (actualBlockerStartVertex P)).1 ∈ T.terminal.carrier) ∨
        Nonempty (SourceExactMinimalActualBlockerCycle P H)) :
    (∃ K : LeastPositiveTerminalHitPredecessor P H,
      Nonempty (SpentEntryTerminalOriginalPairMutualHitPacket K)) ∨
      ∃ deleted center₁ : ℝ²,
        Nonempty (CommonDeletionTwoCenterPacket
          D H deleted center₁ S.oppApex2) := by
  rcases horbit with hhit | hcycle
  · rcases
      Problem97.ATailRFullParentEntryScratch.AmbientRobustHistoryPair.exists_leastPositiveTerminalHitPredecessor
        P H T.ambient_history hhit with ⟨K⟩
    rcases K.hitsOriginalPairAndActualBlockerHit_or_exists_commonDeletionTwoCenterPacket with
      hresidual | hcommon
    · rcases K.exists_commonDeletion_or_originalPairMutualHit hresidual with
        hcommon | hmutual
      · exact Or.inr hcommon
      · exact Or.inl ⟨K, hmutual⟩
    · rcases hcommon with ⟨deleted, hpacket⟩
      exact Or.inr ⟨deleted,
        H.centerAt K.predecessorPair.x
          (mem_selectedClass.mp K.predecessorPair.x_mem_class).1,
        hpacket⟩
  · rcases hcycle with ⟨K⟩
    rcases
      Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.exists_selfCenteredCommonDeletion_general
        K with
      ⟨deleted, hpacket⟩
    exact Or.inr ⟨deleted, deleted, hpacket⟩

#print axioms FrontierRadiusSpentAtEntry.firstApexDouble
#print axioms CriticalFourShell.selfCenteredOmissionExactRowPacket
#print axioms SourceExactMinimalActualBlockerCycle.exists_sourcePreservingSelfCenteredCommonDeletion_general
#print axioms SourceExactMinimalActualBlockerCycle.exists_selfCenteredCommonDeletion_general
#print axioms LeastPositiveTerminalHitPredecessor.exists_commonDeletion_or_originalPairMutualHit
#print axioms AmbientRobustHistoryPair.spentEntryOrbit_originalPairMutualHit_or_commonDeletion

end ATailRFullParentEntryScratch
end Problem97
