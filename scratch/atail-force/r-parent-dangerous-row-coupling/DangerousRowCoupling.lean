/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import dangerous_blocker_collapse
import AnchoredFreshSuccessor
import ReciprocalDirectedCrossGlobalBoundary

/-!
# Full-parent dangerous-row coupling for the coherent R outputs

The live U1 tail contains an exact `p`-centered row
`{q, t1, t2, t3}`.  This module rebuilds an arbitrary critical-shell system
so that every source in that exact class chooses `p`, and performs the rebuild
before the critical-pair frontier is selected.

The resulting coupling is exact but nonterminal:

* a coherent source has blocker `p` exactly when it belongs to the dangerous
  class;
* in that branch its retained source row is exactly
  `{q, t1, t2, t3}`;
* every fresh anchored successor chosen outside the source row is therefore
  outside the dangerous class; and
* a reciprocal directed-cross deleted endpoint is always outside the dangerous
  class.

No current hypothesis forces a coherent source into the dangerous class.
Thus the rebuild gives a sharper parent normal form, not `False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRParentDangerousRowCouplingScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailRFullParentEntryScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The live dangerous data alone identifies the entire ambient
`p`-centered class through `q`. -/
theorem liveData_dangerous_selectedClass_eq_base
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    SelectedClass D.A p (dist p q) =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  classical
  apply Finset.Subset.antisymm
  · intro z hz
    by_cases hzq : z = q
    · simp [hzq]
    have hzp : z ≠ p := by
      intro hzp
      have hdist := (mem_selectedClass.mp hz).2
      subst z
      rw [dist_self] at hdist
      linarith [H.dangerous.q_radius_pos]
    have hzClass :
        z ∈ ((D.skeleton q).erase p).filter
          (fun y => dist p y = dist p q) := by
      refine Finset.mem_filter.mpr ⟨?_, (mem_selectedClass.mp hz).2⟩
      refine Finset.mem_erase.mpr ⟨hzp, ?_⟩
      change z ∈ D.A.erase q
      exact Finset.mem_erase.mpr ⟨hzq, (mem_selectedClass.mp hz).1⟩
    have hzTriple : z ∈ ({t1, t2, t3} : Finset ℝ²) := by
      rw [← H.dangerous.exact_radius_class_eq H.exactQDeletedRadius]
      exact hzClass
    exact Finset.mem_insert_of_mem hzTriple
  · intro z hz
    rcases Finset.mem_insert.mp hz with hzq | hzTriple
    · subst z
      exact mem_selectedClass.mpr ⟨H.dangerous.q_mem, rfl⟩
    · have hzErase := H.dangerous.T_subset hzTriple
      have hzA : z ∈ D.A := by
        have hzSkeleton := (Finset.mem_erase.mp hzErase).2
        have hzEraseQ : z ∈ D.A.erase q := by
          simpa [CounterexampleData.skeleton] using hzSkeleton
        exact (Finset.mem_erase.mp hzEraseQ).2
      exact mem_selectedClass.mpr
        ⟨hzA, H.dangerous.T_same_radius z hzTriple⟩

/-- The ambient dangerous class has cardinality exactly four. -/
theorem liveData_dangerous_selectedClass_card_eq_four
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    (SelectedClass D.A p (dist p q)).card = 4 := by
  rw [liveData_dangerous_selectedClass_eq_base H]
  have hqNot : q ∉ ({t1, t2, t3} : Finset ℝ²) := by
    intro hqTriple
    have hqErase :=
      H.dangerous.T_subset hqTriple
    have hqSkeleton := (Finset.mem_erase.mp hqErase).2
    have hqEraseA : q ∈ D.A.erase q := by
      change q ∈ D.A.erase q at hqSkeleton
      exact hqSkeleton
    exact (Finset.mem_erase.mp hqEraseA).1 rfl
  rw [Finset.card_insert_of_notMem hqNot, H.dangerous.T_card]

/-- The exact dangerous ambient class as a selected four-class. -/
noncomputable def liveData_dangerousSelectedFourClass
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    SelectedFourClass D.A p where
  support := SelectedClass D.A p (dist p q)
  support_subset_A := fun _ hz => (mem_selectedClass.mp hz).1
  support_card := liveData_dangerous_selectedClass_card_eq_four H
  radius := dist p q
  radius_pos := H.dangerous.q_radius_pos
  support_eq_radius := fun _ hz => (mem_selectedClass.mp hz).2
  center_not_mem := by
    intro hp
    have hdist := (mem_selectedClass.mp hp).2
    rw [dist_self] at hdist
    linarith [H.dangerous.q_radius_pos]

/-- Readable support equation for the selected dangerous row. -/
theorem liveData_dangerousSelectedFourClass_support_eq_base
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    (liveData_dangerousSelectedFourClass H).support =
      ({q, t1, t2, t3} : Finset ℝ²) :=
  liveData_dangerous_selectedClass_eq_base H

/-- A named exact critical row through the live source `q` at center `p`. -/
noncomputable def liveData_dangerousCriticalRow
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    CriticalSelectedFourClass D.A q p :=
  Classical.choice
    (CriticalSelectedFourClass.exists_of_exactSelectedClass
      H.dangerous.p_mem H.dangerous.q_radius_pos
      (liveData_dangerous_selectedClass_card_eq_four H)
      (mem_selectedClass.mpr ⟨H.dangerous.q_mem, rfl⟩))

/-- The named critical row has exactly the live dangerous support. -/
theorem liveData_dangerousCriticalRow_support_eq_base
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    (liveData_dangerousCriticalRow H).toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  let C := liveData_dangerousCriticalRow H
  have hradius :
      C.toCriticalFourShell.radius = dist p q :=
    (C.toCriticalFourShell.support_eq_radius
      q C.toCriticalFourShell.q_mem_support).symm
  calc
    C.toCriticalFourShell.support =
        SelectedClass D.A p C.toCriticalFourShell.radius := by
      simpa [SelectedClass] using C.toCriticalFourShell.support_eq
    _ = SelectedClass D.A p (dist p q) := by rw [hradius]
    _ = ({q, t1, t2, t3} : Finset ℝ²) :=
      liveData_dangerous_selectedClass_eq_base H

/-- Rebuild a critical-shell system so every dangerous-class source chooses
the live blocker `p`. -/
noncomputable def collapseLiveDangerousBlockers
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    CriticalShellSystem D.A :=
  H0.overrideExactSelectedClass
    Hlive.dangerous.p_mem Hlive.dangerous.q_radius_pos
    (liveData_dangerous_selectedClass_card_eq_four Hlive)
    (fun _z hz =>
      ATAILForceScratch.no_k4_after_delete_of_mem_exact_blocked_class
        (ATAILForceScratch.ambient_q_blocked_at_p hlocalNoQFree)
        (mem_selectedClass.mpr ⟨Hlive.dangerous.q_mem, rfl⟩)
        (liveData_dangerous_selectedClass_card_eq_four Hlive) hz)

/-- Every point in the dangerous class is sent to `p` by the rebuilt system. -/
theorem collapseLiveDangerousBlockers_centerAt_of_mem
    {D : CounterexampleData} {p q t1 t2 t3 u z : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hzA : z ∈ D.A)
    (hz : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    (collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive).centerAt z hzA = p := by
  apply CriticalShellSystem.overrideExactSelectedClass_centerAt
  rw [liveData_dangerous_selectedClass_eq_base Hlive]
  exact hz

/-- For the rebuilt system, choosing blocker `p` is equivalent to belonging
to the exact dangerous class. -/
theorem collapseLiveDangerousBlockers_centerAt_eq_p_iff
    {D : CounterexampleData} {p q t1 t2 t3 u z : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hzA : z ∈ D.A) :
    (collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive).centerAt z hzA = p ↔
      z ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
  constructor
  · intro hcenter
    by_contra hzOutside
    let K := liveData_dangerousSelectedFourClass Hlive
    have hsurvives :
        HasNEquidistantPointsAt 4 (D.A.erase z) p := by
      refine ⟨K.radius, K.radius_pos, ?_⟩
      calc
        4 = K.support.card := K.support_card.symm
        _ ≤ ((D.A.erase z).filter
            fun w => dist p w = K.radius).card :=
          Finset.card_le_card (by
            intro w hw
            have hwBase :
                w ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
              rw [← liveData_dangerousSelectedFourClass_support_eq_base Hlive]
              exact hw
            exact Finset.mem_filter.mpr
              ⟨Finset.mem_erase.mpr
                  ⟨fun hwz => hzOutside (hwz ▸ hwBase),
                    K.support_subset_A hw⟩,
                K.support_eq_radius w hw⟩)
    have hblocked :=
      (collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive).no_qfree_at z hzA
    rw [hcenter] at hblocked
    exact hblocked hsurvives
  · exact collapseLiveDangerousBlockers_centerAt_of_mem
      H0 hlocalNoQFree Hlive hzA

/-- The selected row at every dangerous source is exactly the live dangerous
four-set. -/
theorem collapseLiveDangerousBlockers_selectedAt_support_eq_base
    {D : CounterexampleData} {p q t1 t2 t3 u z : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hzA : z ∈ D.A)
    (hz : z ∈ ({q, t1, t2, t3} : Finset ℝ²)) :
    ((collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive).selectedAt z hzA
      ).toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  let Hc := collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive
  let C := Hc.selectedAt z hzA
  have hcenter : Hc.centerAt z hzA = p :=
    collapseLiveDangerousBlockers_centerAt_of_mem
      H0 hlocalNoQFree Hlive hzA hz
  have hzClass : z ∈ SelectedClass D.A p (dist p q) := by
    rw [liveData_dangerous_selectedClass_eq_base Hlive]
    exact hz
  have hradius :
      C.toCriticalFourShell.radius = dist p q := by
    calc
      C.toCriticalFourShell.radius =
          dist (Hc.centerAt z hzA) z :=
        (C.toCriticalFourShell.support_eq_radius
          z C.toCriticalFourShell.q_mem_support).symm
      _ = dist p z := by rw [hcenter]
      _ = dist p q := (mem_selectedClass.mp hzClass).2
  calc
    C.toCriticalFourShell.support =
        SelectedClass D.A (Hc.centerAt z hzA)
          C.toCriticalFourShell.radius := by
      simpa [SelectedClass] using C.toCriticalFourShell.support_eq
    _ = SelectedClass D.A p (dist p q) := by
      ext w
      simp [SelectedClass, hcenter, hradius]
    _ = ({q, t1, t2, t3} : Finset ℝ²) :=
      liveData_dangerous_selectedClass_eq_base Hlive

/-- A parent-retaining critical system with an explicit exact live row. -/
structure LiveDangerousRetainingSystem
    (D : CounterexampleData) (p q t1 t2 t3 : ℝ²) where
  H : CriticalShellSystem D.A
  liveRow : CriticalSelectedFourClass D.A q p
  liveRow_support :
    liveRow.toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²)
  liveRow_blocks :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase q) p
  centerAt_eq_p_iff :
    ∀ z : ℝ², ∀ hzA : z ∈ D.A,
      H.centerAt z hzA = p ↔
        z ∈ ({q, t1, t2, t3} : Finset ℝ²)
  selectedAt_support :
    ∀ z : ℝ², ∀ hzA : z ∈ D.A,
      z ∈ ({q, t1, t2, t3} : Finset ℝ²) →
        (H.selectedAt z hzA).toCriticalFourShell.support =
          ({q, t1, t2, t3} : Finset ℝ²)

/-- Construct the parent-retaining system from any available critical system. -/
noncomputable def LiveDangerousRetainingSystem.ofSystem
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H0 : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    LiveDangerousRetainingSystem D p q t1 t2 t3 where
  H := collapseLiveDangerousBlockers H0 hlocalNoQFree Hlive
  liveRow := liveData_dangerousCriticalRow Hlive
  liveRow_support := liveData_dangerousCriticalRow_support_eq_base Hlive
  liveRow_blocks := ATAILForceScratch.ambient_q_blocked_at_p hlocalNoQFree
  centerAt_eq_p_iff := by
    intro z hzA
    exact collapseLiveDangerousBlockers_centerAt_eq_p_iff
      H0 hlocalNoQFree Hlive hzA
  selectedAt_support := by
    intro z hzA hz
    exact collapseLiveDangerousBlockers_selectedAt_support_eq_base
      H0 hlocalNoQFree Hlive hzA hz

namespace LiveDangerousRetainingSystem

/-- A coherent source has blocker `p` exactly when it belongs to the live
dangerous class. -/
theorem coherent_source_center_eq_p_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H) :
    R.firstCenter = p ↔
      R.sourcePair.x ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
  simpa [CoherentRCommonDeletionPacket.firstCenter] using
    W.centerAt_eq_p_iff R.sourcePair.x
      (mem_selectedClass.mp R.sourcePair.x_mem_class).1

/-- Since the coherent source is off the surplus cap, it cannot equal the
original live source `q`. -/
theorem coherent_source_ne_live_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hqSurplus : q ∈ S.surplusCap) :
    R.sourcePair.x ≠ q := by
  intro hsource
  apply R.sourcePair.x_off_surplus
  simpa [hsource] using hqSurplus

/-- With the parent surplus placement retained, blocker `p` means that the
coherent source is one of the three dangerous triple labels. -/
theorem coherent_source_center_eq_p_iff_mem_dangerousTriple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hqSurplus : q ∈ S.surplusCap) :
    R.firstCenter = p ↔
      R.sourcePair.x ∈ ({t1, t2, t3} : Finset ℝ²) := by
  rw [W.coherent_source_center_eq_p_iff R]
  constructor
  · intro hbase
    rcases Finset.mem_insert.mp hbase with hq | htriple
    · exact False.elim (W.coherent_source_ne_live_q R hqSurplus hq)
    · exact htriple
  · exact Finset.mem_insert_of_mem

/-- In the aligned branch, the retained coherent source row is exactly the
live dangerous row. -/
theorem coherent_sourceRow_support_eq_base_of_center_eq_p
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hcenter : R.firstCenter = p) :
    R.sourceRow.support =
      ({q, t1, t2, t3} : Finset ℝ²) := by
  have hsource :
      R.sourcePair.x ∈ ({q, t1, t2, t3} : Finset ℝ²) :=
    (W.coherent_source_center_eq_p_iff R).mp hcenter
  simpa [CoherentRCommonDeletionPacket.sourceRow] using
    W.selectedAt_support R.sourcePair.x
      (mem_selectedClass.mp R.sourcePair.x_mem_class).1 hsource

/-- The coherent deleted point is outside the live dangerous row whenever
the source blocker is `p`. -/
theorem coherent_deleted_not_mem_base_of_source_center_eq_p
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hcenter : R.firstCenter = p) :
    R.deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  rw [← W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter]
  exact R.deleted_not_mem_sourceRow

/-- Off the aligned branch, the coherent source row meets the live dangerous
row in at most two points. -/
theorem coherent_sourceRow_inter_base_card_le_two_of_center_ne_p
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hcenter : R.firstCenter ≠ p) :
    (R.sourceRow.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2 := by
  have hbound :=
    SelectedFourClass.inter_card_le_two
      R.sourceRow.toSelectedFourClass
      W.liveRow.toSelectedFourClass hcenter
  simpa [CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass, W.liveRow_support] using hbound

namespace AnchoredCoupling

open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition

/-- If the anchored coherent source uses the live blocker `p`, the fresh
successor is outside the dangerous row and carries a common deletion whose
first exact row is that live row. -/
theorem exists_fresh_commonDeletionSuccessor_with_liveRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (A : AnchoredSourceCriticalTransition R)
    (hcenter : R.firstCenter = p) :
    ∃ X : FreshSurvivingMarginalSource A,
      X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
        R.sourceRow.support =
          ({q, t1, t2, t3} : Finset ℝ²) ∧
        Nonempty (CommonDeletionTwoCenterPacket
          D W.H X.point p S.oppApex2) := by
  rcases A.nonempty_freshSurvivingMarginalSource with ⟨X⟩
  have hrow :=
    W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter
  refine ⟨X, ?_, hrow, ?_⟩
  · rw [← hrow]
    exact X.point_not_mem_sourceRow
  · simpa [hcenter] using X.nonempty_commonDeletionSuccessor

end AnchoredCoupling

namespace ReciprocalCoupling

open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket

/-- In a reciprocal directed cross, the retained deleted endpoint can never
belong to the live dangerous class. -/
theorem deleted_not_mem_liveDangerousBase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (X : ReciprocalDirectedCrossResidual R) :
    R.deleted ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  intro hdeleted
  have hdeletedCenter :
      W.H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1 = p :=
    (W.centerAt_eq_p_iff R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1).2 hdeleted
  have hdeletedRow :
      (W.H.selectedAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1
        ).toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²) :=
    W.selectedAt_support R.deleted
      (mem_selectedClass.mp R.deleted_mem_fixedClass).1 hdeleted
  have hsource :
      R.sourcePair.x ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [← hdeletedRow]
    exact X.source_mem_deletedRow
  have hsourceCenter : R.firstCenter = p :=
    (W.coherent_source_center_eq_p_iff R).2 hsource
  exact X.blocker_centers_ne (hsourceCenter.trans hdeletedCenter.symm)

/-- In the aligned reciprocal branch, every point outside the retained source
row is outside the live dangerous class.  In particular this applies to the
fresh point produced by
`exists_fresh_commonDeletion_or_secondApexCritical`. -/
theorem omitted_not_mem_liveDangerousBase_of_source_center_eq_p
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 z : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (_X : ReciprocalDirectedCrossResidual R)
    (hcenter : R.firstCenter = p)
    (hzOutside : z ∉ R.sourceRow.support) :
    z ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  rw [← W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter]
  exact hzOutside

/-- Direct live-row specialization of the reciprocal global continuation.
The fresh off-fiber point is outside the dangerous row, while all of the exact
row, uniqueness, sign, and second-apex continuation fields are retained. -/
structure LiveRowAlignedGlobalContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (X : ReciprocalDirectedCrossResidual R) : Type where
  z : ℝ²
  sourceRow_eq_live :
    R.sourceRow.support =
      ({q, t1, t2, t3} : Finset ℝ²)
  z_not_mem_live :
    z ∉ ({q, t1, t2, t3} : Finset ℝ²)
  z_mem_deletedRow :
    z ∈ R.reciprocalDeletedRow.support
  z_not_mem_fixedClass :
    z ∉ SelectedClass D.A S.oppApex1 radius
  z_mem_terminalCarrier :
    z ∈ T.carrier
  z_not_mem_sourceRow :
    z ∉ R.sourceRow.support
  sourceRow_exact_after_deleted_and_z :
    SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter R.sourceRow.radius =
      R.sourceRow.support
  sourceRow_unique_radius_after_deleted_and_z :
    ∀ tau : ℝ, 0 < tau →
      4 ≤ (SelectedClass ((D.A.erase R.deleted).erase z)
        R.firstCenter tau).card →
      tau = R.sourceRow.radius
  directedCross_signedArea_product_neg :
    signedArea2 R.sourcePair.x S.oppApex1
        (W.H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) *
      signedArea2 R.deleted S.oppApex1
        (W.H.centerAt R.deleted
          (mem_selectedClass.mp R.deleted_mem_fixedClass).1) < 0
  continuation :
    Nonempty (CommonDeletionTwoCenterPacket
      D W.H z R.firstCenter S.oppApex2) ∨
    ∃ C : CriticalSelectedFourClass D.A z S.oppApex2,
      ¬ HasNEquidistantPointsAt 4
          (D.A.erase z) S.oppApex2 ∧
        C.toCriticalFourShell.support =
          R.secondApexRow.support

/-- The global reciprocal boundary, specialized to a coherent source whose
blocker is the live dangerous center `p`. -/
theorem nonempty_liveRowAlignedGlobalContinuation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P W.H}
    (X : ReciprocalDirectedCrossResidual R)
    (hcenter : R.firstCenter = p) :
    Nonempty (LiveRowAlignedGlobalContinuation X) := by
  rcases X.exists_fresh_commonDeletion_or_secondApexCritical with
    ⟨z, hzDeletedRow, hzNotFixed, hzCarrier, hzOutsideSource,
      hsourceExact, hsourceUnique, hsign, hcontinuation⟩
  have hrow :=
    W.coherent_sourceRow_support_eq_base_of_center_eq_p R hcenter
  exact ⟨{
    z := z
    sourceRow_eq_live := hrow
    z_not_mem_live :=
      omitted_not_mem_liveDangerousBase_of_source_center_eq_p X
        hcenter hzOutsideSource
    z_mem_deletedRow := hzDeletedRow
    z_not_mem_fixedClass := hzNotFixed
    z_mem_terminalCarrier := hzCarrier
    z_not_mem_sourceRow := hzOutsideSource
    sourceRow_exact_after_deleted_and_z := hsourceExact
    sourceRow_unique_radius_after_deleted_and_z := hsourceUnique
    directedCross_signedArea_product_neg := hsign
    continuation := hcontinuation }⟩

end ReciprocalCoupling

end LiveDangerousRetainingSystem

/-- The parent hypothesis `q ∈ CP.capAt i` is exactly membership in the
surplus cap of the CP-derived packet. -/
private theorem live_q_mem_leafSurplusPacket
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    {q : ℝ²} (hqCap : q ∈ CP.capAt i) :
    q ∈
      (leafSurplusPacket
        (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
        (hM := hM) (hsurplus := hsurplus)).surplusCap := by
  subst M
  simpa [leafSurplusPacket, SurplusCapPacket.surplusCap,
    CapTriple.capAt] using hqCap

set_option linter.unusedVariables false in
/-- Rebuild first, then extract the frontier.  The output keeps the exact live
dangerous row and the source/blocker equivalence in the same critical system
used by every later coherent-R packet. -/
theorem fullParent_extracts_dangerousRetainingFrontier
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y) [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
      q ∈ S.surplusCap ∧
        ∃ r : ℝ, 0 < r ∧
          4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
          ∃ F : CriticalPairFrontier D S r W.H,
            FirstApexSplit F.pair := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
    q ∈ S.surplusCap ∧
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
        ∃ F : CriticalPairFrontier D S r W.H,
          FirstApexSplit F.pair
  rcases hcritical with ⟨H0⟩
  let W :=
    LiveDangerousRetainingSystem.ofSystem
      H0 hlocalNoQFree Hlive
  have hqSurplus : q ∈ S.surplusCap := by
    simpa [S] using live_q_mem_leafSurplusPacket
      MT hCirc CP i hM hsurplus hqCap
  rcases exists_criticalPairFrontier_of_K4 D S W.H with
    ⟨r, hradius, hfour, ⟨F⟩⟩
  exact ⟨W, hqSurplus, r, hradius, hfour, F, F.firstApexSplit⟩

#print axioms liveData_dangerous_selectedClass_eq_base
#print axioms liveData_dangerousCriticalRow_support_eq_base
#print axioms collapseLiveDangerousBlockers_centerAt_eq_p_iff
#print axioms collapseLiveDangerousBlockers_selectedAt_support_eq_base
#print axioms LiveDangerousRetainingSystem.coherent_source_center_eq_p_iff_mem_dangerousTriple
#print axioms LiveDangerousRetainingSystem.coherent_sourceRow_support_eq_base_of_center_eq_p
#print axioms LiveDangerousRetainingSystem.AnchoredCoupling.exists_fresh_commonDeletionSuccessor_with_liveRow
#print axioms LiveDangerousRetainingSystem.ReciprocalCoupling.deleted_not_mem_liveDangerousBase
#print axioms LiveDangerousRetainingSystem.ReciprocalCoupling.nonempty_liveRowAlignedGlobalContinuation
#print axioms fullParent_extracts_dangerousRetainingFrontier

end ATailRParentDangerousRowCouplingScratch
end Problem97
