/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.AllLargeCapCanonicalInterfaces
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.FourVertexLowSpan
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.Dumitrescu.L1
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueRowProducer.card_five_cross_blocker_localization

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFourVertexLowSpan
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- The bounded source-faithful deletion-fan packet for a selected four-row.

This is a proved finite interface, not an active proof obligation: it records
the canonical blocker data uniformly over all four support points. -/
def SourceFaithfulSelectedFourDeletionFan
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {center : ℝ²} (Row : SelectedFourClass D.A center) : Prop :=
  ∀ (w : ℝ²) (hw : w ∈ Row.support),
    ∃ blockerCap : Fin 3,
      H.centerAt w (Row.support_subset_A hw) ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt w (Row.support_subset_A hw)) ∧
        ((center = H.centerAt w (Row.support_subset_A hw) ∧
            Row.support =
              (H.selectedAt w
                (Row.support_subset_A hw)).toCriticalFourShell.support ∧
            ¬ FullyDeletionRobustAt D center) ∨
          (center ≠ H.centerAt w (Row.support_subset_A hw) ∧
            (Row.support ∩
              (H.selectedAt w
                (Row.support_subset_A hw)).toCriticalFourShell.support).card ≤
              2))

/-- The complete source-faithful packet attached by the deletion fan to one
selected-row point.  This alias lets pair-producing lemmas retain the
dependent packet proofs rather than merely retaining the fan as a whole. -/
def SourceFaithfulSelectedFourDeletionPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (w : ℝ²) (hw : w ∈ Row.support) : Prop :=
  ∃ blockerCap : Fin 3,
    H.centerAt w (Row.support_subset_A hw) ∈
        S.capInteriorByIndex blockerCap ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt w (Row.support_subset_A hw)) ∧
      ((center = H.centerAt w (Row.support_subset_A hw) ∧
          Row.support =
            (H.selectedAt w
              (Row.support_subset_A hw)).toCriticalFourShell.support ∧
          ¬ FullyDeletionRobustAt D center) ∨
        (center ≠ H.centerAt w (Row.support_subset_A hw) ∧
          (Row.support ∩
            (H.selectedAt w
              (Row.support_subset_A hw)).toCriticalFourShell.support).card ≤
            2))

/- A residual-independent form of the source-faithful cover ingress.  The
   endpoint leaves already carry `TriApexAllLargeContext`; requiring the
   older nested residual chain here only obscures the available source data. -/
theorem exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    (q : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty (SelectedFourClass D.A q.1) ∧
      Nonempty (CriticalSelectedFourClass D.A q.1
        (H.centerAt q.1 q.2)) ∧
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase q.1) (H.centerAt q.1 q.2) ∧
      H.centerAt q.1 q.2 ≠ S.oppApex1 ∧
      H.centerAt q.1 q.2 ≠ S.oppApex2 ∧
      H.centerAt q.1 q.2 ≠ S.surplusApex ∧
      ∃ i : Fin 3,
        H.centerAt q.1 q.2 ∈ S.capInteriorByIndex i := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 q.2 with ⟨Kq⟩
  have hcoverUnique :
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) :=
    isUniqueFourCenter_centerAt H q.1 q.2
  have hcoverNe (i : Fin 3) :
      H.centerAt q.1 q.2 ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
          (by simpa [hcenter] using hcoverUnique)
  have hcoverNe₁ :
      H.centerAt q.1 q.2 ≠ S.oppApex1 := by
    intro hcenter
    exact hcoverNe S.oppIndex1 (by simpa using hcenter)
  have hcoverNe₂ :
      H.centerAt q.1 q.2 ≠ S.oppApex2 := by
    intro hcenter
    exact hcoverNe S.oppIndex2 (by simpa using hcenter)
  have hcoverNe₃ :
      H.centerAt q.1 q.2 ≠ S.surplusApex := by
    intro hcenter
    exact hcoverNe S.surplusIdx (by simpa using hcenter)
  exact
    ⟨⟨Kq⟩, ⟨H.selectedAt q.1 q.2⟩, hcoverUnique,
      H.no_qfree_at q.1 q.2, hcoverNe₁, hcoverNe₂, hcoverNe₃,
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G q.2⟩

/-- The source-faithful deletion fan over all points of a selected four-row.

For every row point, its canonical blocker is cap-localized and genuinely
blocks after deleting that point.  Comparing the row center with the blocker
then gives the exact equal-support/non-robust versus distinct-center/small-
overlap dichotomy used by the live FreshThird residual.  The statement is
cardinality-independent: the only bounded object is the already selected
four-row itself. -/
theorem sourceFaithfulDeletionFan_of_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {center : ℝ²} (Row : SelectedFourClass D.A center) :
    SourceFaithfulSelectedFourDeletionFan D S H Row := by
  intro w hw
  have hwA : w ∈ D.A := Row.support_subset_A hw
  let q : CriticalShellSystem.CarrierVertex D.A := ⟨w, hwA⟩
  rcases
      exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
        G q with
    ⟨_, _, _, hblocked, _, _, _, blockerCap, hblockerCap⟩
  refine ⟨blockerCap, ?_, ?_, ?_⟩
  · simpa [q] using hblockerCap
  · simpa [q] using hblocked
  · by_cases heq : center = H.centerAt w hwA
    · subst center
      left
      refine
        ⟨rfl, H.selectedFourClass_support_eq_shell w hwA Row, ?_⟩
      intro hrobust
      exact H.no_qfree_at w hwA (hrobust.survives w hwA)
    · right
      exact
        ⟨heq,
          SelectedFourClass.inter_card_le_two Row
            (H.selectedAt w hwA).toCriticalFourShell.toSelectedFourClass heq⟩

/-- Two points outside a chosen cap retain their complete source-faithful
deletion-fan packets.  The two points are returned as carrier vertices, with
their outside proofs made explicit so the dependent packets remain available
to the endpoint consumer. -/
theorem exists_distinct_outsideCap_sourceFaithful_packets
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (i : Fin 3)
    (houtside : 2 ≤ (Row.support \ S.capByIndex i).card)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Row.support \ S.capByIndex i,
        ∃ hw : w.1 ∈ Row.support \ S.capByIndex i,
          z ≠ w ∧ SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
              (Finset.mem_sdiff.mp hw).1 := by
  classical
  let outside : Finset ℝ² := Row.support \ S.capByIndex i
  have hpair : ∃ x ∈ outside, ∃ y ∈ outside, x ≠ y := by
    by_contra hno
    have hle : outside.card ≤ 1 := Finset.card_le_one.mpr (by
      intro x hx y hy
      by_contra hxy
      exact hno ⟨x, hx, y, hy, hxy⟩)
    have : 2 ≤ outside.card := by simpa [outside] using houtside
    omega
  rcases hpair with ⟨x, hx, y, hy, hxy⟩
  have hxRow : x ∈ Row.support :=
    (Finset.mem_sdiff.mp (by simpa [outside] using hx)).1
  have hyRow : y ∈ Row.support :=
    (Finset.mem_sdiff.mp (by simpa [outside] using hy)).1
  let z : CriticalShellSystem.CarrierVertex D.A :=
    ⟨x, Row.support_subset_A hxRow⟩
  let w : CriticalShellSystem.CarrierVertex D.A :=
    ⟨y, Row.support_subset_A hyRow⟩
  have hz : z.1 ∈ Row.support \ S.capByIndex i := by
    simpa [z, outside] using hx
  have hw : w.1 ∈ Row.support \ S.capByIndex i := by
    simpa [w, outside] using hy
  have hzw : z ≠ w := by
    intro h
    apply hxy
    exact congrArg Subtype.val h
  exact ⟨z, w, hz, hw, hzw,
    (show SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
        (Finset.mem_sdiff.mp hz).1 from by
      simpa [SourceFaithfulSelectedFourDeletionPacket] using
        hfan z.1 (Finset.mem_sdiff.mp hz).1),
    (show SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
        (Finset.mem_sdiff.mp hw).1 from by
      simpa [SourceFaithfulSelectedFourDeletionPacket] using
        hfan w.1 (Finset.mem_sdiff.mp hw).1)⟩

/-- Four source-faithful blocker-cap choices on one selected four-row contain
two distinct row points whose actual blockers lie in the same strict indexed
cap.  This is the cardinality-independent repeated-cap normalization at the
front of the remaining FreshThird fan-to-consumer lift. -/
theorem exists_distinct_support_points_with_same_blockerCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        ∃ blockerCap : Fin 3,
          H.centerAt z.1 z.2 ∈
              S.capInteriorByIndex blockerCap ∧
            H.centerAt w.1 w.2 ∈
              S.capInteriorByIndex blockerCap := by
  classical
  let e : Row.support ≃ Fin 4 :=
    Finset.equivFinOfCardEq Row.support_card
  let source : Fin 4 → CriticalShellSystem.CarrierVertex D.A := fun i ↦
    ⟨(e.symm i).1, Row.support_subset_A (e.symm i).2⟩
  have hsource (i : Fin 4) : (source i).1 ∈ Row.support := by
    exact (e.symm i).2
  let capOf : Fin 4 → Fin 3 := fun i ↦
    Classical.choose (hfan (source i).1 (hsource i))
  have hcapOf (i : Fin 4) :
      H.centerAt (source i).1 (source i).2 ∈
        S.capInteriorByIndex (capOf i) := by
    exact (Classical.choose_spec (hfan (source i).1 (hsource i))).1
  have hnotInjective : ¬ Function.Injective capOf := by
    intro hinjective
    have hcard : Fintype.card (Fin 4) ≤ Fintype.card (Fin 3) :=
      Fintype.card_le_of_injective capOf hinjective
    norm_num at hcard
  rcases Function.not_injective_iff.mp hnotInjective with
    ⟨i, j, hcaps, hij⟩
  have hsourcesNe : source i ≠ source j := by
    intro hsources
    apply hij
    apply e.symm.injective
    apply Subtype.ext
    simpa [source] using congrArg Subtype.val hsources
  refine
    ⟨source i, source j, hsource i, hsource j, hsourcesNe,
      capOf i, hcapOf i, ?_⟩
  simpa [hcaps] using hcapOf j

/-- If two distinct sources outside one cap have distinct canonical blockers
inside that cap, at least one cross-deletion preserves a four-point row.

Indeed, if both cross-deletions blocked, each source would lie in the other
source's canonical critical row.  The two blocker centers would then bisect
the same outside pair, contradicting ordered-cap geometry. -/
theorem crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {z w : ℝ²}
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) (hzw : z ≠ w)
    (k : Fin 3)
    (hzCap : H.centerAt z hzA ∈ S.capByIndex k)
    (hwCap : H.centerAt w hwA ∈ S.capByIndex k)
    (hcentersNe : H.centerAt z hzA ≠ H.centerAt w hwA)
    (hzOff : z ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k) :
    HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt z hzA) ∨
      HasNEquidistantPointsAt 4 (D.A.erase z) (H.centerAt w hwA) := by
  by_contra hblocked
  push_neg at hblocked
  have hwInZ :
      w ∈ (H.selectedAt z hzA).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt z hzA) hblocked.1
  have hzInW :
      z ∈ (H.selectedAt w hwA).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt w hwA) hblocked.2
  have hzEq :
      dist (H.centerAt z hzA) z = dist (H.centerAt z hzA) w :=
    ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z
        (H.selectedAt z hzA).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius w hwInZ).symm
  have hwEq :
      dist (H.centerAt w hwA) z = dist (H.centerAt w hwA) w :=
    ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius z hzInW).trans
      ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius w
        (H.selectedAt w hwA).toCriticalFourShell.q_mem_support).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S k hzCap hwCap hcentersNe hzA hwA hzw hzOff hwOff hzEq hwEq

/-- Source-faithful repeated-cap normalization with the first geometric case
split already discharged.  Two distinct points of a selected four-row have
blockers in one strict cap; either the blockers coincide, one source lies in
that closed cap, or one of the two cross-deletions survives. -/
theorem exists_repeatedBlockerCap_pair_outcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        ∃ blockerCap : Fin 3,
          H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
            H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
            (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
              z.1 ∈ S.capByIndex blockerCap ∨
              w.1 ∈ S.capByIndex blockerCap ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  rcases exists_distinct_support_points_with_same_blockerCap Row hfan with
    ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCapInterior, hwCapInterior⟩
  have hzwVal : z.1 ≠ w.1 := by
    intro hvals
    exact hzw (Subtype.ext hvals)
  have hzCap : H.centerAt z.1 z.2 ∈ S.capByIndex blockerCap :=
    S.capInteriorByIndex_subset_capByIndex blockerCap hzCapInterior
  have hwCap : H.centerAt w.1 w.2 ∈ S.capByIndex blockerCap :=
    S.capInteriorByIndex_subset_capByIndex blockerCap hwCapInterior
  refine
    ⟨z, w, hzRow, hwRow, hzw, blockerCap,
      hzCapInterior, hwCapInterior, ?_⟩
  by_cases hcenters : H.centerAt z.1 z.2 = H.centerAt w.1 w.2
  · exact Or.inl hcenters
  by_cases hzIn : z.1 ∈ S.capByIndex blockerCap
  · exact Or.inr (Or.inl hzIn)
  by_cases hwIn : w.1 ∈ S.capByIndex blockerCap
  · exact Or.inr (Or.inr (Or.inl hwIn))
  rcases
      crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
        z.2 w.2 hzwVal blockerCap hzCap hwCap hcenters hzIn hwIn with
    hzwSurvives | hwzSurvives
  · exact Or.inr (Or.inr (Or.inr (Or.inl hzwSurvives)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr hwzSurvives)))

/-- Two distinct sources on a selected four-row whose center is itself a
carrier point cannot have distinct canonical blockers while both cross
deletions fail.

If both deletions failed, each source would lie on the other source's
canonical critical shell.  The row center and the two distinct blocker
centers would then be three distinct carrier points on the perpendicular
bisector of the source pair, contradicting convex position.  Unlike the
cap-localized variant above, this producer needs no hypothesis about where
the sources lie relative to the blocker cap. -/
theorem crossDeletion_survives_of_distinct_selectedRow_blockers
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support) (hwRow : w.1 ∈ Row.support)
    (hzw : z ≠ w)
    (hzBlockerNeCenter : H.centerAt z.1 z.2 ≠ center)
    (hwBlockerNeCenter : H.centerAt w.1 w.2 ≠ center)
    (hblockersNe : H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2) :
    HasNEquidistantPointsAt 4 (D.A.erase w.1) (H.centerAt z.1 z.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase z.1)
        (H.centerAt w.1 w.2) := by
  classical
  by_contra hblocked
  push_neg at hblocked
  have hwInZ :
      w.1 ∈ (H.selectedAt z.1 z.2).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt z.1 z.2) hblocked.1
  have hzInW :
      z.1 ∈ (H.selectedAt w.1 w.2).toCriticalFourShell.support :=
    ATAILStageOnePrescribedApexDichotomy.source_mem_critical_support_of_no_qfree
      (H.selectedAt w.1 w.2) hblocked.2
  have hzwVal : z.1 ≠ w.1 := by
    intro hvals
    exact hzw (Subtype.ext hvals)
  have hcenterEq : dist center z.1 = dist center w.1 :=
    (Row.support_eq_radius z.1 hzRow).trans
      (Row.support_eq_radius w.1 hwRow).symm
  have hzBlockerA : H.centerAt z.1 z.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt z.1 z.2).toCriticalFourShell.center_mem).2
  have hwBlockerA : H.centerAt w.1 w.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt w.1 w.2).toCriticalFourShell.center_mem).2
  have hzBlockerEq :
      dist (H.centerAt z.1 z.2) z.1 =
        dist (H.centerAt z.1 z.2) w.1 :=
    ((H.selectedAt z.1 z.2).toCriticalFourShell.support_eq_radius z.1
        (H.selectedAt z.1 z.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt z.1 z.2).toCriticalFourShell.support_eq_radius w.1
        hwInZ).symm
  have hwBlockerEq :
      dist (H.centerAt w.1 w.2) z.1 =
        dist (H.centerAt w.1 w.2) w.1 :=
    ((H.selectedAt w.1 w.2).toCriticalFourShell.support_eq_radius z.1
        hzInW).trans
      ((H.selectedAt w.1 w.2).toCriticalFourShell.support_eq_radius w.1
        (H.selectedAt w.1 w.2).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex z.2 w.2 hzwVal
  have hthree :
      2 < (D.A.filter (fun p ↦ dist p z.1 = dist p w.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨center, Finset.mem_filter.mpr ⟨hcenterA, hcenterEq⟩,
        H.centerAt z.1 z.2,
          Finset.mem_filter.mpr ⟨hzBlockerA, hzBlockerEq⟩,
        H.centerAt w.1 w.2,
          Finset.mem_filter.mpr ⟨hwBlockerA, hwBlockerEq⟩,
        hzBlockerNeCenter.symm, hwBlockerNeCenter.symm, hblockersNe⟩
  exact (not_lt_of_ge hbound) hthree

/-- A four-vertex directed graph with at least two outgoing non-edges at
every vertex contains a mutually missing pair.  Keeping this closed finite
kernel separate makes the geometric lift below independent of a hand-written
case split on the four support slots. -/
private theorem finFour_exists_mutualFalse_of_row_card_le_two :
    ∀ contains : Fin 4 → Fin 4 → Bool,
      (∀ i, contains i i = true) →
      (∀ i, (Finset.univ.filter fun j ↦ contains i j).card ≤ 2) →
      ∃ i j : Fin 4,
        i ≠ j ∧ contains i j = false ∧ contains j i = false := by
  intro contains hself hbound
  rcases finFour_exists_nearby_mutualFalse_of_card_le_two contains hself hbound with
    ⟨i, j, hij, _, hijOmit, hjiOmit⟩
  exact ⟨i, j, ne_of_lt hij, hijOmit, hjiOmit⟩

/-- If none of the four sources in a source-faithful deletion fan uses the
row center itself as its canonical blocker, two sources mutually omit one
another from their actual critical shells.  Equivalently, deleting either
source preserves a four-point row at the other source's blocker.

This is cardinality-independent: the only enumeration is the already exact
four-point support. -/
theorem exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hcenterNe : ∀ (w : ℝ²) (hw : w ∈ Row.support),
      center ≠ H.centerAt w (Row.support_subset_A hw)) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
        HasNEquidistantPointsAt 4 (D.A.erase w.1)
          (H.centerAt z.1 z.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase z.1)
          (H.centerAt w.1 w.2) ∧
        H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  classical
  let e : Row.support ≃ Fin 4 :=
    Finset.equivFinOfCardEq Row.support_card
  let source : Fin 4 → CriticalShellSystem.CarrierVertex D.A := fun i ↦
    ⟨(e.symm i).1, Row.support_subset_A (e.symm i).2⟩
  have hsource (i : Fin 4) : (source i).1 ∈ Row.support := by
    exact (e.symm i).2
  let contains : Fin 4 → Fin 4 → Bool := fun i j ↦
    decide ((source j).1 ∈
      (H.selectedAt (source i).1 (source i).2).toCriticalFourShell.support)
  have hself (i : Fin 4) : contains i i = true := by
    simp only [contains, decide_eq_true_eq]
    exact
      (H.selectedAt (source i).1
        (source i).2).toCriticalFourShell.q_mem_support
  have hrowBound (i : Fin 4) :
      (Finset.univ.filter fun j ↦ contains i j).card ≤ 2 := by
    have hinter :
        (Row.support ∩
          (H.selectedAt (source i).1
            (source i).2).toCriticalFourShell.support).card ≤ 2 := by
      rcases hfan (source i).1 (hsource i) with
        ⟨_, _, _, hsame | hdistinct⟩
      · exact False.elim ((hcenterNe (source i).1 (hsource i)) hsame.1)
      · exact hdistinct.2
    rw [← show
      (Finset.univ.filter fun j ↦ contains i j).card =
          (Row.support ∩
            (H.selectedAt (source i).1
              (source i).2).toCriticalFourShell.support).card by
        refine Finset.card_bij (fun j _ ↦ (e.symm j).1) ?_ ?_ ?_
        · intro j hj
          have hjContains : contains i j = true :=
            (Finset.mem_filter.mp hj).2
          exact Finset.mem_inter.mpr ⟨(e.symm j).2, by
            simpa only [contains, decide_eq_true_eq] using hjContains⟩
        · intro a _ b _ hab
          apply e.symm.injective
          exact Subtype.ext hab
        · intro point hpoint
          let pointInRow : Row.support :=
            ⟨point, (Finset.mem_inter.mp hpoint).1⟩
          refine ⟨e pointInRow, ?_, ?_⟩
          · refine Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩
            simp only [contains, decide_eq_true_eq]
            simpa [source, pointInRow] using
              (Finset.mem_inter.mp hpoint).2
          · simp [pointInRow]
      ] at hinter
    exact hinter
  rcases finFour_exists_mutualFalse_of_row_card_le_two contains hself hrowBound with
    ⟨i, j, hij, hijOmit, hjiOmit⟩
  have hsourcesNe : source i ≠ source j := by
    intro hsources
    apply hij
    apply e.symm.injective
    apply Subtype.ext
    simpa [source] using congrArg Subtype.val hsources
  have hijNotMem :
      (source j).1 ∉
        (H.selectedAt (source i).1
          (source i).2).toCriticalFourShell.support := by
    simpa only [contains, decide_eq_false_iff_not] using hijOmit
  have hjiNotMem :
      (source i).1 ∉
        (H.selectedAt (source j).1
          (source j).2).toCriticalFourShell.support := by
    simpa only [contains, decide_eq_false_iff_not] using hjiOmit
  exact
    ⟨source i, source j, hsource i, hsource j, hsourcesNe,
      (cross_deletion_survives_iff_not_mem_selected_support
        H (source i).2).mpr hijNotMem,
      (cross_deletion_survives_iff_not_mem_selected_support
        H (source j).2).mpr hjiNotMem,
      blocker_centers_ne_of_not_mem_other_selected_support
        H (source i).2 (source j).2 hjiNotMem⟩

/-- Every source-faithful four-row exposes one of the two genuinely global
fan outcomes: either its center is not deletion-robust, or two row sources
mutually omit one another from their actual critical shells.  The first arm
is forced as soon as one actual blocker is the row center; otherwise the
finite four-vertex producer above supplies the second arm. -/
theorem nonrobustCenter_or_exists_mutualCrossDeletion_pair_of_sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          HasNEquidistantPointsAt 4 (D.A.erase w.1)
            (H.centerAt z.1 z.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase z.1)
            (H.centerAt w.1 w.2) ∧
          H.centerAt z.1 z.2 ≠ H.centerAt w.1 w.2 := by
  classical
  by_cases hcenterBlocker :
      ∃ (w : ℝ²) (hw : w ∈ Row.support),
        center = H.centerAt w (Row.support_subset_A hw)
  · rcases hcenterBlocker with ⟨w, hw, hcenter⟩
    rcases hfan w hw with ⟨_, _, _, hsame | hdistinct⟩
    · exact Or.inl hsame.2.2
    · exact False.elim (hdistinct.1 hcenter)
  · right
    exact
      exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
        Row hfan (by
          intro w hw hcenter
          exact hcenterBlocker ⟨w, hw, hcenter⟩)

/-- A source-faithful row whose center is a carrier point has a cap-synchronized
terminal normalization.

Either the row center is not fully deletion-robust, or two distinct row
sources have blockers in the same strict cap and expose the only remaining
alternatives: the blockers coincide, or one of the two cross-deletions
survives.  The perpendicular-bisector producer above removes the former
"one source lies inside the blocker cap" escape from this carrier-centered
version. -/
theorem
    nonrobustCenter_or_exists_sameCap_blockerCollision_or_crossDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    ¬ FullyDeletionRobustAt D center ∨
      ∃ z w : CriticalShellSystem.CarrierVertex D.A,
        z.1 ∈ Row.support ∧ w.1 ∈ Row.support ∧ z ≠ w ∧
          ∃ blockerCap : Fin 3,
            H.centerAt z.1 z.2 ∈ S.capInteriorByIndex blockerCap ∧
              H.centerAt w.1 w.2 ∈ S.capInteriorByIndex blockerCap ∧
              (H.centerAt z.1 z.2 = H.centerAt w.1 w.2 ∨
                HasNEquidistantPointsAt 4 (D.A.erase w.1)
                  (H.centerAt z.1 z.2) ∨
                HasNEquidistantPointsAt 4 (D.A.erase z.1)
                  (H.centerAt w.1 w.2)) := by
  classical
  by_cases hcenterBlocker :
      ∃ (w : ℝ²) (hw : w ∈ Row.support),
        center = H.centerAt w (Row.support_subset_A hw)
  · rcases hcenterBlocker with ⟨w, hw, hcenter⟩
    rcases hfan w hw with ⟨_, _, _, hsame | hdistinct⟩
    · exact Or.inl hsame.2.2
    · exact False.elim (hdistinct.1 hcenter)
  · right
    rcases exists_distinct_support_points_with_same_blockerCap Row hfan with
      ⟨z, w, hzRow, hwRow, hzw, blockerCap,
        hzCapInterior, hwCapInterior⟩
    refine
      ⟨z, w, hzRow, hwRow, hzw, blockerCap,
        hzCapInterior, hwCapInterior, ?_⟩
    by_cases hblockers : H.centerAt z.1 z.2 = H.centerAt w.1 w.2
    · exact Or.inl hblockers
    · have hzBlockerNeCenter : H.centerAt z.1 z.2 ≠ center := by
        intro hzEq
        exact hcenterBlocker ⟨z.1, hzRow, hzEq.symm⟩
      have hwBlockerNeCenter : H.centerAt w.1 w.2 ≠ center := by
        intro hwEq
        exact hcenterBlocker ⟨w.1, hwRow, hwEq.symm⟩
      rcases
          crossDeletion_survives_of_distinct_selectedRow_blockers
            hcenterA Row z w hzRow hwRow hzw
              hzBlockerNeCenter hwBlockerNeCenter hblockers with
        hzwSurvives | hwzSurvives
      · exact Or.inr (Or.inl hzwSurvives)
      · exact Or.inr (Or.inr hwzSurvives)

/-- Preserve the concrete source and canonical blocker when a source-faithful
four-row enters its nonrobust-center arm.  The existing cap-synchronized fan
theorem deliberately forgets this witness; this adapter retains the blocker
cap, blocked deletion, selected-shell equality, and unique-four provenance. -/
theorem exists_nonrobustCenter_witness_of_sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hcenterBlocker :
      ∃ (q : ℝ²) (hq : q ∈ Row.support),
        center = H.centerAt q (Row.support_subset_A hq)) :
    ∃ (q : ℝ²) (hq : q ∈ Row.support) (blockerCap : Fin 3),
      center = H.centerAt q (Row.support_subset_A hq) ∧
        H.centerAt q (Row.support_subset_A hq) ∈
          S.capInteriorByIndex blockerCap ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q)
          (H.centerAt q (Row.support_subset_A hq)) ∧
        Row.support =
          (H.selectedAt q
            (Row.support_subset_A hq)).toCriticalFourShell.support ∧
        IsUniqueFourCenter D.A center ∧
        ¬ FullyDeletionRobustAt D center := by
  rcases hcenterBlocker with ⟨q, hq, hcenter⟩
  rcases hfan q hq with ⟨blockerCap, hcap, hblocked, hsame | hdistinct⟩
  · refine ⟨q, hq, blockerCap, hcenter, hcap, hblocked, hsame.2.1, ?_, hsame.2.2⟩
    rw [hcenter]
    exact isUniqueFourCenter_centerAt H q (Row.support_subset_A hq)
  · exact False.elim (hdistinct.1 hcenter)

/-- If two distinct carrier points lie on one selected four-class and have the
same actual selected-row centre, then the original row centre and that common
centre cannot lie in one indexed cap while both points lie outside it. -/
theorem false_of_selectedFourClass_common_actualCenter_pair_outside_cap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (i : Fin 3)
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (z w : CriticalShellSystem.CarrierVertex D.A)
    (hzRow : z.1 ∈ Row.support)
    (hwRow : w.1 ∈ Row.support)
    (hzw : z.1 ≠ w.1)
    (hactualCenters :
      H.centerAt z.1 z.2 = H.centerAt w.1 w.2)
    (hcenterCap : center ∈ S.capByIndex i)
    (hactualCenterCap : H.centerAt z.1 z.2 ∈ S.capByIndex i)
    (hzOutside : z.1 ∉ S.capByIndex i)
    (hwOutside : w.1 ∉ S.capByIndex i)
    (hcenter_ne_actualCenter : center ≠ H.centerAt z.1 z.2) :
    False := by
  classical
  let ActualRow : SelectedFourClass D.A (H.centerAt z.1 z.2) :=
    (H.selectedAt z.1 z.2).toCriticalFourShell.toSelectedFourClass
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H z.2 w.2 hactualCenters
  have hzActual : z.1 ∈ ActualRow.support := by
    simpa [ActualRow, CriticalFourShell.toSelectedFourClass] using
      (H.selectedAt z.1 z.2).toCriticalFourShell.q_mem_support
  have hwActual : w.1 ∈ ActualRow.support := by
    have hown :=
      (H.selectedAt w.1 w.2).toCriticalFourShell.q_mem_support
    rw [← hsupports] at hown
    simpa [ActualRow, CriticalFourShell.toSelectedFourClass] using hown
  have hpairSubset :
      ({z.1, w.1} : Finset ℝ²) ⊆
        (Row.support \ S.capByIndex i) ∩
          (ActualRow.support \ S.capByIndex i) := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hzRow, hzOutside⟩,
          Finset.mem_sdiff.mpr ⟨hzActual, hzOutside⟩⟩
    · exact Finset.mem_inter.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hwRow, hwOutside⟩,
          Finset.mem_sdiff.mpr ⟨hwActual, hwOutside⟩⟩
  have htwo :
      2 ≤
        ((Row.support \ S.capByIndex i) ∩
          (ActualRow.support \ S.capByIndex i)).card := by
    simpa [hzw] using Finset.card_le_card hpairSubset
  have hone :=
    selectedFourClass_outside_overlap_card_le_one
      S i hcenterCap hactualCenterCap hcenter_ne_actualCenter Row ActualRow
  omega

/-- Select two points outside the row cap before inspecting their actual
blockers.  If neither blocker escapes that cap, equal blockers contradict the
outside-pair overlap bound, while distinct blockers force one cross-deletion
to preserve a four-point row.

This keeps the complete source-faithful deletion packets attached to the
selected points.  In particular, it exposes the exact remaining endpoint
residual without assuming that the deletion fan's blocker-cap labels agree
with the row cap. -/
theorem exists_distinct_outsideCap_fan_escape_or_crossDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (Row : SelectedFourClass D.A center)
    (i : Fin 3)
    (hcenterCap : center ∈ S.capByIndex i)
    (houtside : 2 ≤ (Row.support \ S.capByIndex i).card)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row)
    (hcenterNe :
      ∀ (w : ℝ²) (hw : w ∈ Row.support),
        center ≠ H.centerAt w (Row.support_subset_A hw)) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Row.support \ S.capByIndex i,
        ∃ hw : w.1 ∈ Row.support \ S.capByIndex i,
          z ≠ w ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
              (Finset.mem_sdiff.mp hw).1 ∧
            (H.centerAt z.1 z.2 ∉ S.capByIndex i ∨
              H.centerAt w.1 w.2 ∉ S.capByIndex i ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  classical
  rcases exists_distinct_outsideCap_sourceFaithful_packets
      Row i houtside hfan with
    ⟨z, w, hz, hw, hzw, hzPacket, hwPacket⟩
  refine ⟨z, w, hz, hw, hzw, hzPacket, hwPacket, ?_⟩
  have hzRow : z.1 ∈ Row.support := (Finset.mem_sdiff.mp hz).1
  have hwRow : w.1 ∈ Row.support := (Finset.mem_sdiff.mp hw).1
  have hzOutside : z.1 ∉ S.capByIndex i := (Finset.mem_sdiff.mp hz).2
  have hwOutside : w.1 ∉ S.capByIndex i := (Finset.mem_sdiff.mp hw).2
  have hzwVal : z.1 ≠ w.1 := by
    intro h
    apply hzw
    exact Subtype.ext h
  have hcenterNeZ : center ≠ H.centerAt z.1 z.2 := by
    simpa using hcenterNe z.1 hzRow
  by_cases hzCap : H.centerAt z.1 z.2 ∈ S.capByIndex i
  · by_cases hwCap : H.centerAt w.1 w.2 ∈ S.capByIndex i
    · by_cases hcenters : H.centerAt z.1 z.2 = H.centerAt w.1 w.2
      · exact (false_of_selectedFourClass_common_actualCenter_pair_outside_cap
          S H i Row z w hzRow hwRow hzwVal hcenters hcenterCap hzCap
          hzOutside hwOutside hcenterNeZ).elim
      · rcases crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair
          z.2 w.2 hzwVal i hzCap hwCap hcenters hzOutside hwOutside with
          hsurvives | hsurvives
        · exact Or.inr (Or.inr (Or.inl hsurvives))
        · exact Or.inr (Or.inr (Or.inr hsurvives))
    · exact Or.inr (Or.inl hwCap)
  · exact Or.inl hzCap

end ATailFrontierLiveClosure
end Problem97
