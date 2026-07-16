/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredSourceCriticalTransitionConsumer
import LeastTerminalHitReciprocalRowSplit

/-!
# A fresh successor forced by the anchored coherent-R packet

The anchored source itself is critical at its retained first center, so it is
not another common-deletion successor.  The retained ambient history contains
more information, however: the source has an erased mate on the same
off-surplus first-apex circle, while the terminal carrier still contains at
least three off-surplus points of that radius.  Hence the ambient marginal has
at least five points, and the full ambient fixed class has at least six.

Each of the retained first-center and second-apex rows meets the full fixed
class in at most two points.  Consequently there is a fixed-class point,
distinct from the retained deleted point, outside both rows.  Its deletion
preserves the same two row supports, producing two distinct common-deletion
sources for the same centers and rows.

The off-surplus form is also exact:

* either the shared-row source can be chosen off-surplus; or
* the five-point off-surplus marginal is covered as two points in the source
  row, two points in the second-apex row, and the lone outside point
  `deleted`.

A second counting choice keeps the source outside the first row and
off-surplus.  It yields a recursive common deletion at the original centers,
and the pair `(deleted, fresh)` either enters the existing critical-pair
frontier or produces two disjoint exact shells at the second apex.

This is a producer, not a contradiction.  It uses the erased mate retained in
`sourcePair`, which the earlier anchored consumer did not exploit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

namespace CoherentRCommonDeletionPacket
namespace AnchoredSourceCriticalTransition

private theorem terminal_fixedMarginal_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    (T : FixedSingleRadiusTerminalHistory D S D.A radius) :
    3 ≤ ((T.carrier.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap).card := by
  let F := T.carrier.filter fun x => dist x S.oppApex1 = radius
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hFfour : 4 ≤ F.card := by
    rcases T.terminal with
      ⟨_q, _w, _hradius, _hq, _hw, _hqw, hcard, _hsecond⟩
    rcases hcard with hfour | hfive
    · simpa [F, SelectedClass, dist_comm] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
    · simpa [F, SelectedClass, dist_comm] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
  have hhit : (F ∩ S.surplusCap).card ≤ 1 := by
    calc
      (F ∩ S.surplusCap).card
          ≤ ((D.A.filter fun x => dist x S.oppApex1 = radius) ∩
              S.surplusCap).card :=
        Finset.card_le_card (by
          intro x hx
          rcases Finset.mem_inter.mp hx with ⟨hxF, hxCap⟩
          rcases Finset.mem_filter.mp hxF with ⟨hxCarrier, hxdist⟩
          exact Finset.mem_inter.mpr
            ⟨Finset.mem_filter.mpr
              ⟨T.carrier_subset hxCarrier, hxdist⟩, hxCap⟩)
      _ ≤ 1 := by
        simpa [DS] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS radius
  have hsplit := Finset.card_sdiff_add_card_inter F S.surplusCap
  simpa [F] using
    (show 3 ≤ (F \ S.surplusCap).card by omega)

/-- The terminal off-surplus class together with both erased endpoints of the
retained history pair gives at least five ambient marginal points. -/
theorem ambient_fixedMarginal_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) :
    5 ≤ ((D.A.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap).card := by
  let C :=
    (T.carrier.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap
  let M :=
    (D.A.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap
  have hCthree : 3 ≤ C.card := by
    simpa [C] using terminal_fixedMarginal_card_ge_three T
  have hxM : R.sourcePair.x ∈ M := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨?_, ?_⟩, ?_⟩
    · exact (mem_selectedClass.mp R.source_mem_fixedClass).1
    · simpa [dist_comm] using
        (mem_selectedClass.mp R.source_mem_fixedClass).2
    · exact R.sourcePair.x_off_surplus
  have hyFixed :=
    (T.pair_endpoints_mem_fixedClass R.sourcePair).2
  have hyM : R.sourcePair.y ∈ M := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨?_, ?_⟩, ?_⟩
    · exact (mem_selectedClass.mp hyFixed).1
    · simpa [dist_comm] using (mem_selectedClass.mp hyFixed).2
    · exact R.sourcePair.y_off_surplus
  have hxNotC : R.sourcePair.x ∉ C := by
    intro hx
    exact (Finset.mem_sdiff.mp R.sourcePair.x_mem_erased).2
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hx).1).1
  have hyNotC : R.sourcePair.y ∉ C := by
    intro hy
    exact (Finset.mem_sdiff.mp R.sourcePair.y_mem_erased).2
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp hy).1).1
  have hxNotInsert : R.sourcePair.x ∉ insert R.sourcePair.y C := by
    simp [R.sourcePair.x_ne_y, hxNotC]
  have hcardInsert :
      (insert R.sourcePair.x (insert R.sourcePair.y C)).card =
        C.card + 2 := by
    rw [Finset.card_insert_of_notMem hxNotInsert,
      Finset.card_insert_of_notMem hyNotC]
  have hsub :
      insert R.sourcePair.x (insert R.sourcePair.y C) ⊆ M := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact hxM
    rcases Finset.mem_insert.mp hz with rfl | hzC
    · exact hyM
    · rcases Finset.mem_sdiff.mp hzC with ⟨hzFilter, hzOff⟩
      rcases Finset.mem_filter.mp hzFilter with ⟨hzCarrier, hzdistance⟩
      exact Finset.mem_sdiff.mpr
        ⟨Finset.mem_filter.mpr
          ⟨T.carrier_subset hzCarrier, hzdistance⟩, hzOff⟩
  have hle :=
    Finset.card_le_card hsub
  rw [hcardInsert] at hle
  simpa [M] using (show 5 ≤ M.card by omega)

/-- The full ambient fixed class contains the terminal four-point class plus
both erased endpoints of the retained history pair. -/
theorem ambient_fixedClass_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) :
    6 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
  let C := SelectedClass T.carrier S.oppApex1 radius
  let M := SelectedClass D.A S.oppApex1 radius
  have hCfour : 4 ≤ C.card := by
    rcases T.terminal with
      ⟨_q, _w, _hradius, _hq, _hw, _hqw, hcard, _hsecond⟩
    rcases hcard with hfour | hfive
    · simpa [C] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
    · simpa [C] using
        (show 4 ≤ (SelectedClass T.carrier S.oppApex1 radius).card by
          omega)
  have hxM : R.sourcePair.x ∈ M := by
    simpa [M] using R.source_mem_fixedClass
  have hyM : R.sourcePair.y ∈ M := by
    simpa [M] using (T.pair_endpoints_mem_fixedClass R.sourcePair).2
  have hxNotC : R.sourcePair.x ∉ C := by
    intro hx
    exact (Finset.mem_sdiff.mp R.sourcePair.x_mem_erased).2
      (mem_selectedClass.mp hx).1
  have hyNotC : R.sourcePair.y ∉ C := by
    intro hy
    exact (Finset.mem_sdiff.mp R.sourcePair.y_mem_erased).2
      (mem_selectedClass.mp hy).1
  have hxNotInsert : R.sourcePair.x ∉ insert R.sourcePair.y C := by
    simp [R.sourcePair.x_ne_y, hxNotC]
  have hcardInsert :
      (insert R.sourcePair.x (insert R.sourcePair.y C)).card =
        C.card + 2 := by
    rw [Finset.card_insert_of_notMem hxNotInsert,
      Finset.card_insert_of_notMem hyNotC]
  have hsub :
      insert R.sourcePair.x (insert R.sourcePair.y C) ⊆ M := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hz
    · exact hxM
    rcases Finset.mem_insert.mp hz with rfl | hzC
    · exact hyM
    · rcases mem_selectedClass.mp hzC with ⟨hzCarrier, hzdistance⟩
      exact mem_selectedClass.mpr
        ⟨T.carrier_subset hzCarrier, hzdistance⟩
  have hle := Finset.card_le_card hsub
  rw [hcardInsert] at hle
  simpa [M] using (show 6 ≤ M.card by omega)

private theorem oppApex1_ne_oppApex2_fresh
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- The retained second-apex row meets the coherent fixed first-apex class in
at most two points. -/
private theorem secondApexRow_fixedClass_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (R : CoherentRCommonDeletionPacket T P H) :
    ((SelectedClass D.A S.oppApex1 radius) ∩
      R.secondApexRow.support).card ≤ 2 := by
  let W : N8ApexArcWitness :=
    { apex := S.oppApex1
      selectedRadius := radius
      arc :=
        { support := R.secondApexRow.support
          circleCenter := S.oppApex2
          circleRadius := R.secondApexRow.radius
          on_circle := R.secondApexRow.support_eq_radius }
      circles_ne := by
        intro hsame
        exact oppApex1_ne_oppApex2_fresh S
          (congrArg (fun s : EuclideanGeometry.Sphere ℝ² => s.1) hsame) }
  exact W.selectedClass_inter_card_le_two

/-- A point of the six-point coherent class, distinct from the retained
deleted point, which lies outside both exact rows of the original common
deletion packet. -/
structure RowExternalCommonDeletionSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) : Type where
  point : ℝ²
  point_mem_fixedClass :
    point ∈ SelectedClass D.A S.oppApex1 radius
  point_ne_deleted : point ≠ R.deleted
  point_not_mem_sourceRow : point ∉ R.sourceRow.support
  point_not_mem_secondApexRow : point ∉ R.secondApexRow.support

/-- The two exact rows cover at most four points of the six-point fixed class.
Since `deleted` is itself outside both rows, a second row-external source can
be selected. -/
theorem nonempty_rowExternalCommonDeletionSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    Nonempty (RowExternalCommonDeletionSource A) := by
  classical
  let F := SelectedClass D.A S.oppApex1 radius
  let U := R.sourceRow.support ∪ R.secondApexRow.support
  have hFsix : 6 ≤ F.card := by
    simpa [F] using A.ambient_fixedClass_card_ge_six
  have hsource :
      (F ∩ R.sourceRow.support).card ≤ 2 := by
    simpa [F] using
      (criticalFourShell_fixedClass_inter_card_le_two
        (radius := radius) R.sourceRow R.firstCenter_ne_oppApex1)
  have hsecond :
      (F ∩ R.secondApexRow.support).card ≤ 2 := by
    simpa [F] using
      (secondApexRow_fixedClass_inter_card_le_two
        (radius := radius) R)
  have hinter :
      (F ∩ U).card ≤ 4 := by
    have hdecomp :
        F ∩ U =
          (F ∩ R.sourceRow.support) ∪
            (F ∩ R.secondApexRow.support) := by
      ext z
      simp [U, and_or_left]
    calc
      (F ∩ U).card =
          ((F ∩ R.sourceRow.support) ∪
            (F ∩ R.secondApexRow.support)).card :=
        congrArg Finset.card hdecomp
      _ ≤ (F ∩ R.sourceRow.support).card +
          (F ∩ R.secondApexRow.support).card :=
        Finset.card_union_le _ _
      _ ≤ 4 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter F U
  have htwo : 2 ≤ (F \ U).card := by omega
  have hone : 1 < (F \ U).card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haF, haU⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbF, hbU⟩
  have haSource : a ∉ R.sourceRow.support := by
    intro h
    exact haU (Finset.mem_union.mpr (Or.inl h))
  have hbSource : b ∉ R.sourceRow.support := by
    intro h
    exact hbU (Finset.mem_union.mpr (Or.inl h))
  have haSecond : a ∉ R.secondApexRow.support := by
    intro h
    exact haU (Finset.mem_union.mpr (Or.inr h))
  have hbSecond : b ∉ R.secondApexRow.support := by
    intro h
    exact hbU (Finset.mem_union.mpr (Or.inr h))
  by_cases haDeleted : a = R.deleted
  · refine ⟨{
      point := b
      point_mem_fixedClass := hbF
      point_ne_deleted := ?_
      point_not_mem_sourceRow := hbSource
      point_not_mem_secondApexRow := hbSecond }⟩
    intro hbDeleted
    exact hab (haDeleted.trans hbDeleted.symm)
  · exact ⟨{
      point := a
      point_mem_fixedClass := haF
      point_ne_deleted := haDeleted
      point_not_mem_sourceRow := haSource
      point_not_mem_secondApexRow := haSecond }⟩

namespace RowExternalCommonDeletionSource

theorem point_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    X.point ∈ D.A :=
  (mem_selectedClass.mp X.point_mem_fixedClass).1

theorem survives_firstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    HasNEquidistantPointsAt 4 (D.A.erase X.point) R.firstCenter := by
  refine ⟨R.sourceRow.radius, R.sourceRow.radius_pos, ?_⟩
  calc
    4 = R.sourceRow.support.card := R.sourceRow.support_card.symm
    _ ≤ (SelectedClass (D.A.erase X.point) R.firstCenter
        R.sourceRow.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact mem_selectedClass.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzx => X.point_not_mem_sourceRow (hzx ▸ hz),
                R.sourceRow.support_subset_A hz⟩,
            R.sourceRow.support_eq_radius z hz⟩)

theorem survives_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    HasNEquidistantPointsAt 4 (D.A.erase X.point) S.oppApex2 := by
  refine ⟨R.secondApexRow.radius,
    R.secondApexRow.radius_pos, ?_⟩
  calc
    4 = R.secondApexRow.support.card :=
      R.secondApexRow.support_card.symm
    _ ≤ (SelectedClass (D.A.erase X.point) S.oppApex2
        R.secondApexRow.radius).card :=
      Finset.card_le_card (by
        intro z hz
        have hzDouble := R.secondApexRow.support_subset_A hz
        have hzA :=
          (Finset.mem_erase.mp (Finset.mem_erase.mp hzDouble).2).2
        exact mem_selectedClass.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzx => X.point_not_mem_secondApexRow (hzx ▸ hz), hzA⟩,
            R.secondApexRow.support_eq_radius z hz⟩)

/-- The original source row, reinterpreted as an exact row after deleting
the row-external point. -/
def firstRowXDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    U5QDeletedK4Class D X.point R.firstCenter R.sourceRow.support :=
  criticalFourShellToU5QDeletedK4ClassOfNotMem
    R.sourceRow X.point_not_mem_sourceRow

/-- The retained second-apex row, reinterpreted after deleting the same
row-external point. -/
def secondRowXDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    U5QDeletedK4Class D X.point S.oppApex2
      R.secondApexRow.support where
  subset := by
    intro z hz
    have hzDouble := R.secondApexRow.support_subset_A hz
    have hzA :=
      (Finset.mem_erase.mp (Finset.mem_erase.mp hzDouble).2).2
    change z ∈ (D.A.erase X.point).erase S.oppApex2
    exact Finset.mem_erase.mpr
      ⟨fun h ↦ R.secondApexRow.center_not_mem (h ▸ hz),
        Finset.mem_erase.mpr
          ⟨fun h ↦ X.point_not_mem_secondApexRow (h ▸ hz), hzA⟩⟩
  card_four := by rw [R.secondApexRow.support_card]
  q_not_mem := X.point_not_mem_secondApexRow
  radius := R.secondApexRow.radius
  radius_pos := R.secondApexRow.radius_pos
  same_radius := R.secondApexRow.support_eq_radius

/-- A second deletion source, distinct from the original `deleted`, carrying
the very same two row supports and centers as the coherent packet. -/
noncomputable def toSharedRowCommonDeletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : RowExternalCommonDeletionSource A) :
    CommonDeletionTwoCenterPacket
      D H X.point R.firstCenter S.oppApex2 where
  q_mem_A := X.point_mem_A
  center₁_mem_A := R.firstCenter_mem_A
  center₂_mem_A := R.toCommonDeletionTwoCenterPacket.center₂_mem_A
  centers_ne := R.firstCenter_ne_oppApex2
  survives₁ := X.survives_firstCenter
  survives₂ := X.survives_secondApex
  actual_blocker_ne_center₁ :=
    actual_blocker_ne_of_deletion_survives H
      X.point_mem_A X.survives_firstCenter
  actual_blocker_ne_center₂ :=
    actual_blocker_ne_of_deletion_survives H
      X.point_mem_A X.survives_secondApex
  B₁ := R.sourceRow.support
  B₂ := R.secondApexRow.support
  row₁ := X.firstRowXDeleted
  row₂ := X.secondRowXDeleted
  B₁_card := R.sourceRow.support_card
  B₂_card := R.secondApexRow.support_card
  overlap_le_two := R.toCommonDeletionTwoCenterPacket.overlap_le_two

end RowExternalCommonDeletionSource

/-- Rigid fallback when `deleted` is the only off-surplus fixed-class point
outside the two retained rows.  The marginal then has exactly five points,
with each row accounting for exactly two of the other four. -/
structure FixedMarginalTwoRowCoverResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) : Prop where
  marginal_card_eq_five :
    ((SelectedClass D.A S.oppApex1 radius) \
      S.surplusCap).card = 5
  outside_rows_eq_deleted :
    ((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) \
        (R.sourceRow.support ∪ R.secondApexRow.support) =
      {R.deleted}
  sourceRow_hits_two :
    (((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) ∩
      R.sourceRow.support).card = 2
  secondApexRow_hits_two :
    (((SelectedClass D.A S.oppApex1 radius) \ S.surplusCap) ∩
      R.secondApexRow.support).card = 2

/-- Exact off-surplus output.  Either the shared-row successor can itself be
kept off the surplus cap, or the off-surplus marginal has the rigid
`2 + 2 + deleted` cover recorded above. -/
theorem exists_offSurplus_sharedRowSource_or_twoRowCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    (∃ X : RowExternalCommonDeletionSource A,
      X.point ∉ S.surplusCap) ∨
      FixedMarginalTwoRowCoverResidual A := by
  classical
  let M :=
    (SelectedClass D.A S.oppApex1 radius) \ S.surplusCap
  let U := R.sourceRow.support ∪ R.secondApexRow.support
  have hMfive : 5 ≤ M.card := by
    simpa [M, SelectedClass, dist_comm] using
      A.ambient_fixedMarginal_card_ge_five
  have hsource :
      (M ∩ R.sourceRow.support).card ≤ 2 := by
    calc
      (M ∩ R.sourceRow.support).card ≤
          ((SelectedClass D.A S.oppApex1 radius) ∩
            R.sourceRow.support).card :=
        Finset.card_le_card (by
          intro z hz
          rcases Finset.mem_inter.mp hz with ⟨hzM, hzRow⟩
          exact Finset.mem_inter.mpr
            ⟨(Finset.mem_sdiff.mp hzM).1, hzRow⟩)
      _ ≤ 2 :=
        criticalFourShell_fixedClass_inter_card_le_two
          (radius := radius) R.sourceRow R.firstCenter_ne_oppApex1
  have hsecond :
      (M ∩ R.secondApexRow.support).card ≤ 2 := by
    calc
      (M ∩ R.secondApexRow.support).card ≤
          ((SelectedClass D.A S.oppApex1 radius) ∩
            R.secondApexRow.support).card :=
        Finset.card_le_card (by
          intro z hz
          rcases Finset.mem_inter.mp hz with ⟨hzM, hzRow⟩
          exact Finset.mem_inter.mpr
            ⟨(Finset.mem_sdiff.mp hzM).1, hzRow⟩)
      _ ≤ 2 :=
        secondApexRow_fixedClass_inter_card_le_two
          (radius := radius) R
  have hdecomp :
      M ∩ U =
        (M ∩ R.sourceRow.support) ∪
          (M ∩ R.secondApexRow.support) := by
    ext z
    simp [U, and_or_left]
  have hinter : (M ∩ U).card ≤ 4 := by
    rw [hdecomp]
    exact le_trans (Finset.card_union_le _ _) (by omega)
  have hdeletedM : R.deleted ∈ M :=
    Finset.mem_sdiff.mpr
      ⟨R.deleted_mem_fixedClass, R.deleted_off_surplus⟩
  have hdeletedU : R.deleted ∉ U := by
    intro h
    rcases Finset.mem_union.mp h with hsourceRow | hsecondRow
    · exact R.deleted_not_mem_sourceRow hsourceRow
    · exact R.secondApexRowQDeleted.q_not_mem hsecondRow
  have hdeletedOutside : R.deleted ∈ M \ U :=
    Finset.mem_sdiff.mpr ⟨hdeletedM, hdeletedU⟩
  by_cases hex :
      ∃ x : ℝ², x ∈ M \ U ∧ x ≠ R.deleted
  · rcases hex with ⟨x, hxOutside, hxDeleted⟩
    rcases Finset.mem_sdiff.mp hxOutside with ⟨hxM, hxU⟩
    rcases Finset.mem_sdiff.mp hxM with ⟨hxClass, hxOff⟩
    have hxSource : x ∉ R.sourceRow.support := by
      intro h
      exact hxU (Finset.mem_union.mpr (Or.inl h))
    have hxSecond : x ∉ R.secondApexRow.support := by
      intro h
      exact hxU (Finset.mem_union.mpr (Or.inr h))
    exact Or.inl
      ⟨{
        point := x
        point_mem_fixedClass := hxClass
        point_ne_deleted := hxDeleted
        point_not_mem_sourceRow := hxSource
        point_not_mem_secondApexRow := hxSecond },
        hxOff⟩
  · right
    have houtsideEq : M \ U = {R.deleted} := by
      apply Finset.Subset.antisymm
      · intro x hx
        have hxEq : x = R.deleted := by
          by_contra hxNe
          exact hex ⟨x, hx, hxNe⟩
        simp [hxEq]
      · intro x hx
        simpa only [Finset.mem_singleton.mp hx] using hdeletedOutside
    have houtsideCard : (M \ U).card = 1 := by
      rw [houtsideEq, Finset.card_singleton]
    have hsplit := Finset.card_sdiff_add_card_inter M U
    have hMcard : M.card = 5 := by
      omega
    have hinterCard : (M ∩ U).card = 4 := by
      omega
    have hunionCard :
        ((M ∩ R.sourceRow.support) ∪
          (M ∩ R.secondApexRow.support)).card = 4 := by
      rw [← hdecomp]
      exact hinterCard
    have hsourceCard :
        (M ∩ R.sourceRow.support).card = 2 := by
      have hunionLe := Finset.card_union_le
        (M ∩ R.sourceRow.support)
        (M ∩ R.secondApexRow.support)
      omega
    have hsecondCard :
        (M ∩ R.secondApexRow.support).card = 2 := by
      have hunionLe := Finset.card_union_le
        (M ∩ R.sourceRow.support)
        (M ∩ R.secondApexRow.support)
      omega
    exact
      { marginal_card_eq_five := by simpa [M] using hMcard
        outside_rows_eq_deleted := by
          simpa [M, U] using houtsideEq
        sourceRow_hits_two := by simpa [M] using hsourceCard
        secondApexRow_hits_two := by simpa [M] using hsecondCard }

/-- A second-apex-surviving marginal point, distinct from `deleted`, can be
chosen outside the retained source row. -/
structure FreshSurvivingMarginalSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (_A : AnchoredSourceCriticalTransition R) : Type where
  point : ℝ²
  point_mem_marginal :
    point ∈ (D.A.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap
  point_ne_deleted : point ≠ R.deleted
  point_not_mem_sourceRow : point ∉ R.sourceRow.support
  point_survives_secondApex :
    HasNEquidistantPointsAt 4 (D.A.erase point) S.oppApex2

/-- Counting the five-point ambient marginal against the at-most-two source
row and the at-most-one second-apex blocker produces a fresh surviving
source. -/
theorem nonempty_freshSurvivingMarginalSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    Nonempty (FreshSurvivingMarginalSource A) := by
  classical
  let M :=
    (D.A.filter fun x => dist x S.oppApex1 = radius) \
      S.surplusCap
  let U := M \ R.sourceRow.support
  let survives : ℝ² → Prop := fun q =>
    HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2
  have hMfive : 5 ≤ M.card := by
    simpa [M] using A.ambient_fixedMarginal_card_ge_five
  have hinterFixed :
      (R.sourceRow.support ∩
        SelectedClass D.A S.oppApex1 radius).card ≤ 2 :=
    by
      simpa [Finset.inter_comm] using
        (criticalFourShell_fixedClass_inter_card_le_two
          (radius := radius) R.sourceRow R.firstCenter_ne_oppApex1)
  have hinter :
      (M ∩ R.sourceRow.support).card ≤ 2 := by
    calc
      (M ∩ R.sourceRow.support).card
          = (R.sourceRow.support ∩ M).card := by
              rw [Finset.inter_comm]
      _ ≤ (R.sourceRow.support ∩
          SelectedClass D.A S.oppApex1 radius).card :=
        Finset.card_le_card (by
          intro z hz
          rcases Finset.mem_inter.mp hz with ⟨hzRow, hzM⟩
          rcases Finset.mem_sdiff.mp hzM with ⟨hzFilter, _hzOff⟩
          rcases Finset.mem_filter.mp hzFilter with ⟨hzA, hzdistance⟩
          exact Finset.mem_inter.mpr
            ⟨hzRow, mem_selectedClass.mpr
              ⟨hzA, by simpa [dist_comm] using hzdistance⟩⟩)
      _ ≤ 2 := hinterFixed
  have hsplitM :=
    Finset.card_sdiff_add_card_inter M R.sourceRow.support
  have hUthree : 3 ≤ U.card := by
    simpa [U] using
      (show 3 ≤ (M \ R.sourceRow.support).card by omega)
  have hblockedSub :
      (U.filter fun q => ¬ survives q) ⊆
        (M.filter fun q => ¬ survives q) := by
    intro q hq
    rcases Finset.mem_filter.mp hq with ⟨hqU, hqBlocked⟩
    exact Finset.mem_filter.mpr
      ⟨(Finset.mem_sdiff.mp hqU).1, hqBlocked⟩
  have hblocked : (U.filter fun q => ¬ survives q).card ≤ 1 := by
    calc
      (U.filter fun q => ¬ survives q).card
          ≤ (M.filter fun q => ¬ survives q).card :=
        Finset.card_le_card hblockedSub
      _ ≤ 1 := by
        simpa [M, survives] using
          blocked_sources_in_firstApex_marginal_card_le_one D S radius
  have hsplitU :=
    Finset.card_filter_add_card_filter_not (s := U) survives
  have htwo : 2 ≤ (U.filter survives).card := by
    omega
  have hone : 1 < (U.filter survives).card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_filter.mp ha with ⟨haU, haSurvives⟩
  rcases Finset.mem_filter.mp hb with ⟨hbU, hbSurvives⟩
  by_cases haDeleted : a = R.deleted
  · refine ⟨{
      point := b
      point_mem_marginal := (Finset.mem_sdiff.mp hbU).1
      point_ne_deleted := ?_
      point_not_mem_sourceRow := (Finset.mem_sdiff.mp hbU).2
      point_survives_secondApex := hbSurvives }⟩
    intro hbDeleted
    exact hab (haDeleted.trans hbDeleted.symm)
  · exact ⟨{
      point := a
      point_mem_marginal := (Finset.mem_sdiff.mp haU).1
      point_ne_deleted := haDeleted
      point_not_mem_sourceRow := (Finset.mem_sdiff.mp haU).2
      point_survives_secondApex := haSurvives }⟩

namespace FreshSurvivingMarginalSource

theorem point_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    X.point ∈ D.A :=
  (Finset.mem_filter.mp
    (Finset.mem_sdiff.mp X.point_mem_marginal).1).1

theorem point_ne_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    X.point ≠ R.sourcePair.x := by
  intro h
  apply X.point_not_mem_sourceRow
  simpa [h] using R.source_mem_sourceRow

theorem survives_firstCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    HasNEquidistantPointsAt 4 (D.A.erase X.point) R.firstCenter :=
  (cross_deletion_survives_iff_not_mem_selected_support H
    (mem_selectedClass.mp R.sourcePair.x_mem_class).1).mpr
      X.point_not_mem_sourceRow

/-- The fresh point is unconditionally a new common-deletion successor at the
same two centers as the original coherent packet.  Unlike the anchored source,
its deletion survives at both centers. -/
theorem nonempty_commonDeletionSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    Nonempty (CommonDeletionTwoCenterPacket
      D H X.point R.firstCenter S.oppApex2) :=
  nonempty_commonDeletionTwoCenterPacket H
    X.point_mem_A
    R.firstCenter_mem_A
    R.toCommonDeletionTwoCenterPacket.center₂_mem_A
    R.firstCenter_ne_oppApex2
    X.survives_firstCenter
    X.point_survives_secondApex

/-- If the fresh source also avoids the deleted point's critical row, the two
retained exact critical rows give a new common-deletion packet on their
original supports. -/
noncomputable def toCommonDeletionOfOutsideDeletedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A)
    (houtside :
      X.point ∉
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        ).toCriticalFourShell.support) :
    CommonDeletionTwoCenterPacket D H X.point R.firstCenter
      (H.centerAt R.deleted
        (mem_selectedClass.mp R.deleted_mem_fixedClass).1) := by
  let deletedA :=
    (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  let deletedRow :=
    (H.selectedAt R.deleted deletedA).toCriticalFourShell
  have hsurvivesDeletedCenter :
      HasNEquidistantPointsAt 4
        (D.A.erase X.point) (H.centerAt R.deleted deletedA) :=
    (cross_deletion_survives_iff_not_mem_selected_support H deletedA).mpr
      houtside
  let row₁ : U5QDeletedK4Class D X.point R.firstCenter
      R.sourceRow.support :=
    criticalFourShellToU5QDeletedK4ClassOfNotMem
      R.sourceRow X.point_not_mem_sourceRow
  let row₂ : U5QDeletedK4Class D X.point
      (H.centerAt R.deleted deletedA) deletedRow.support :=
    criticalFourShellToU5QDeletedK4ClassOfNotMem deletedRow houtside
  exact
    { q_mem_A := X.point_mem_A
      center₁_mem_A := R.firstCenter_mem_A
      center₂_mem_A :=
        (Finset.mem_erase.mp deletedRow.center_mem).2
      centers_ne := A.firstCenter_ne_deletedCriticalCenter
      survives₁ := X.survives_firstCenter
      survives₂ := hsurvivesDeletedCenter
      actual_blocker_ne_center₁ :=
        actual_blocker_ne_of_deletion_survives
          H X.point_mem_A X.survives_firstCenter
      actual_blocker_ne_center₂ :=
        actual_blocker_ne_of_deletion_survives
          H X.point_mem_A hsurvivesDeletedCenter
      B₁ := R.sourceRow.support
      B₂ := deletedRow.support
      row₁ := row₁
      row₂ := row₂
      B₁_card := R.sourceRow.support_card
      B₂_card := deletedRow.support_card
      overlap_le_two :=
        U5QDeletedK4Class.inter_card_le_two row₁ row₂
          A.firstCenter_ne_deletedCriticalCenter }

/-- The fresh source and the retained deleted point form another survivor
relocation pair on the same first-apex marginal. -/
noncomputable def deletedFreshRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    SurvivorPairRelocationPacket D S radius H where
  q := R.deleted
  w := X.point
  q_mem_A := (mem_selectedClass.mp R.deleted_mem_fixedClass).1
  w_mem_A := X.point_mem_A
  q_mem_marginal := Finset.mem_sdiff.mpr
    ⟨Finset.mem_filter.mpr
      ⟨(mem_selectedClass.mp R.deleted_mem_fixedClass).1,
        by simpa [dist_comm] using
          (mem_selectedClass.mp R.deleted_mem_fixedClass).2⟩,
      R.deleted_off_surplus⟩
  w_mem_marginal := X.point_mem_marginal
  q_ne_w := X.point_ne_deleted.symm
  q_survives := R.deleted_survives_secondApex
  w_survives := X.point_survives_secondApex
  q_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_secondApex
  w_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H
      X.point_mem_A X.point_survives_secondApex

/-- The ambient six-point fixed class makes the deleted/fresh pair survive
double deletion at the first apex. -/
theorem deletedFresh_firstApexDouble
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    HasNEquidistantPointsAt 4
      ((D.A.erase R.deleted).erase X.point) S.oppApex1 := by
  have hsix :
      6 ≤ (SelectedClass D.A S.oppApex1 radius).card :=
    A.ambient_fixedClass_card_ge_six
  have hfive :
      5 ≤ (SelectedClass (D.A.erase R.deleted)
        S.oppApex1 radius).card :=
    selectedClass_erase_card_ge_of_succ_le hsix
  have hfour :
      4 ≤ (SelectedClass ((D.A.erase R.deleted).erase X.point)
        S.oppApex1 radius).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  have hradius : 0 < radius := by
    rcases T.terminal with
      ⟨_q, _w, hradius, _hq, _hw, _hqw, _hcard, _hsecond⟩
    exact hradius
  exact ⟨radius, hradius, by simpa [SelectedClass] using hfour⟩

/-- The new pair enters the existing critical-pair frontier whenever its
double deletion also survives at the second apex. -/
noncomputable def deletedFreshCriticalPairFrontier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A)
    (hsecond :
      HasNEquidistantPointsAt 4
        ((D.A.erase R.deleted).erase X.point) S.oppApex2) :
    CriticalPairFrontier D S radius H := by
  let Q := X.deletedFreshRelocationPacket
  exact
    { pair := Q
      firstApexSplit := Or.inl (by
        simpa [Q, deletedFreshRelocationPacket] using
          X.deletedFresh_firstApexDouble)
      secondApexDouble := by
        simpa [Q, deletedFreshRelocationPacket] using hsecond
      secondApexSplit := Or.inl (by
        simpa [Q, deletedFreshRelocationPacket] using hsecond) }

/-- Exact remaining frontier for the deleted/fresh pair: either it produces
an existing `CriticalPairFrontier`, or the second apex carries two disjoint
exact four-shells at the two distinct pair radii. -/
theorem nonempty_deletedFreshCriticalPairFrontier_or_exactSecondApexShells
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A) :
    Nonempty (CriticalPairFrontier D S radius H) ∨
      ∃ Cdeleted :
          CriticalSelectedFourClass D.A R.deleted S.oppApex2,
        ∃ Cfresh :
            CriticalSelectedFourClass D.A X.point S.oppApex2,
          Cdeleted.toCriticalFourShell.radius =
              dist S.oppApex2 R.deleted ∧
            Cfresh.toCriticalFourShell.radius =
              dist S.oppApex2 X.point ∧
            Disjoint Cdeleted.toCriticalFourShell.support
              Cfresh.toCriticalFourShell.support := by
  let Q := X.deletedFreshRelocationPacket
  rcases Q.double_erase_or_exact_eight_packet with hsecond | hshells
  · exact Or.inl ⟨X.deletedFreshCriticalPairFrontier (by
      simpa [Q, deletedFreshRelocationPacket] using hsecond)⟩
  · exact Or.inr (by
      simpa [Q, deletedFreshRelocationPacket] using hshells)

/-- The alternative to a new common deletion is a concrete directed cross at
the deleted point's actual blocker, with the banked opposite-side sign. -/
theorem directedCross_signedArea_product_neg
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    {A : AnchoredSourceCriticalTransition R}
    (X : FreshSurvivingMarginalSource A)
    (hcross :
      X.point ∈
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        ).toCriticalFourShell.support) :
    signedArea2 X.point S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
      signedArea2 R.deleted S.oppApex1
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0 := by
  let Q := X.deletedFreshRelocationPacket
  have hcenter :
      H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1 ≠
        S.oppApex1 :=
    actual_blocker_ne_of_deletion_survives H
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1
      R.deleted_survives_firstApex
  simpa [Q, deletedFreshRelocationPacket] using
    signedArea_product_neg_of_cross_membership Q hcross hcenter

end FreshSurvivingMarginalSource

/-- Existential summary of the stronger row-external construction: besides
the original `deleted` packet, there is a distinct fixed-class source whose
common-deletion packet uses exactly the same two row supports. -/
theorem exists_distinct_sharedRow_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ∃ X : RowExternalCommonDeletionSource A,
      X.point ≠ R.deleted ∧
        X.toSharedRowCommonDeletionPacket.B₁ =
          R.toCommonDeletionTwoCenterPacket.B₁ ∧
        X.toSharedRowCommonDeletionPacket.B₂ =
          R.toCommonDeletionTwoCenterPacket.B₂ := by
  rcases A.nonempty_rowExternalCommonDeletionSource with ⟨X⟩
  exact ⟨X, X.point_ne_deleted, rfl, rfl⟩

/-- Existential form matching the anchored-transition output: every anchored
packet produces a genuinely fresh recursive common deletion at the original
two centers. -/
theorem exists_fresh_commonDeletionSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    ∃ X : FreshSurvivingMarginalSource A,
      Nonempty (CommonDeletionTwoCenterPacket
        D H X.point R.firstCenter S.oppApex2) := by
  rcases A.nonempty_freshSurvivingMarginalSource with ⟨X⟩
  exact ⟨X, X.nonempty_commonDeletionSuccessor⟩

/-- Complete fresh-successor split forced by an anchored transition. -/
theorem exists_fresh_commonDeletion_or_directedCross
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (A : AnchoredSourceCriticalTransition R) :
    (∃ X : FreshSurvivingMarginalSource A,
      Nonempty (CommonDeletionTwoCenterPacket D H X.point R.firstCenter
        (H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1)) ∧
      HasNEquidistantPointsAt 4 (D.A.erase X.point) S.oppApex2) ∨
    (∃ X : FreshSurvivingMarginalSource A,
      X.point ∈
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        ).toCriticalFourShell.support ∧
      signedArea2 X.point S.oppApex1
          (H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
        signedArea2 R.deleted S.oppApex1
          (H.centerAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0) := by
  rcases A.nonempty_freshSurvivingMarginalSource with ⟨X⟩
  by_cases houtside :
      X.point ∉
        (H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        ).toCriticalFourShell.support
  · exact Or.inl
      ⟨X, ⟨X.toCommonDeletionOfOutsideDeletedRow houtside⟩,
        X.point_survives_secondApex⟩
  · have hcross :
        X.point ∈
          (H.selectedAt R.deleted
            (mem_selectedClass.mp R.deleted_mem_fixedClass).1
          ).toCriticalFourShell.support :=
      not_not.mp houtside
    exact Or.inr
      ⟨X, hcross, X.directedCross_signedArea_product_neg hcross⟩

#print axioms ambient_fixedMarginal_card_ge_five
#print axioms ambient_fixedClass_card_ge_six
#print axioms nonempty_rowExternalCommonDeletionSource
#print axioms RowExternalCommonDeletionSource.toSharedRowCommonDeletionPacket
#print axioms exists_distinct_sharedRow_commonDeletion
#print axioms exists_offSurplus_sharedRowSource_or_twoRowCover
#print axioms nonempty_freshSurvivingMarginalSource
#print axioms FreshSurvivingMarginalSource.nonempty_commonDeletionSuccessor
#print axioms FreshSurvivingMarginalSource.toCommonDeletionOfOutsideDeletedRow
#print axioms FreshSurvivingMarginalSource.deletedFresh_firstApexDouble
#print axioms FreshSurvivingMarginalSource.deletedFreshCriticalPairFrontier
#print axioms FreshSurvivingMarginalSource.nonempty_deletedFreshCriticalPairFrontier_or_exactSecondApexShells
#print axioms FreshSurvivingMarginalSource.directedCross_signedArea_product_neg
#print axioms exists_fresh_commonDeletionSuccessor
#print axioms exists_fresh_commonDeletion_or_directedCross

end AnchoredSourceCriticalTransition
end CoherentRCommonDeletionPacket

end ATailRFullParentEntryScratch
end Problem97
