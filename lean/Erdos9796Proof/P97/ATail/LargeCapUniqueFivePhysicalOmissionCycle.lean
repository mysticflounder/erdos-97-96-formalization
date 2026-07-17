/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSuccessor

/-!
# Exact-five physical-class actual-critical omission cycle

The exact-five physical omission theorem gives a fixed-point-free successor
relation on the finite nonempty set of physical strict-cap members.  Choosing
one successor at every source and applying the canonical minimal-period
normalization produces a genuine finite cycle.

Every edge remains source exact: its target is omitted from the source's
actual selected critical support, so deleting the target preserves K4 at the
source's actual blocker.  All cycle vertices remain in the same physical
exact-five radius class and the same strict cap interior.

The final decomposition separates a mutually omitted edge from the arm where
every successor row contains the preceding source.  It is exhaustive
bookkeeping for the geometric consumer, not a contradiction by itself.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLargeCapUniqueFivePhysicalOmissionCycle

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The finite set of exact-five physical-radius points in the strict
interior of the physical second cap. -/
def physicalVertices
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Finset ℝ² :=
  SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2

/-- A source in the exact-five physical strict-cap vertex set. -/
abbrev PhysicalVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :=
  ↑(physicalVertices profile)

namespace PhysicalVertex

/-- Every physical cycle vertex is an ambient source. -/
theorem mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) : q.1 ∈ D.A :=
  (mem_selectedClass.mp (Finset.mem_inter.mp q.2).1).1

/-- Every physical cycle vertex lies in the common exact-five radius class. -/
theorem mem_radiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    q.1 ∈ SelectedClass D.A S.oppApex2 profile.radius :=
  (Finset.mem_inter.mp q.2).1

/-- Every physical cycle vertex lies in the same strict cap interior. -/
theorem mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    q.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
  (Finset.mem_inter.mp q.2).2

end PhysicalVertex

/-- The exact-five physical strict-cap vertex set has at least three members. -/
theorem physicalVertices_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    3 ≤ (physicalVertices profile).card := by
  simpa [physicalVertices] using
    three_le_capInterior_hits_of_largeCapUniqueFive profile

/-- The exact-five physical strict-cap vertex type is nonempty. -/
theorem physicalVertex_nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalVertex profile) := by
  have hpos : 0 < (physicalVertices profile).card := by
    have := physicalVertices_card_ge_three profile
    omega
  rcases Finset.card_pos.mp hpos with ⟨q, hq⟩
  exact ⟨⟨q, hq⟩⟩

/-- A total fixed-point-free source-to-source transition on the physical
strict-cap set, with the exact actual-critical omission and deletion-survival
facts retained on every edge. -/
structure PhysicalActualCriticalOmissionTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  successor : PhysicalVertex profile → PhysicalVertex profile
  successor_ne : ∀ q, successor q ≠ q
  successor_not_mem_actualCriticalSupport :
    ∀ q,
      (successor q).1 ∉
        (H.selectedAt q.1 (PhysicalVertex.mem_A q)).toCriticalFourShell.support
  successor_deletion_survives_actualBlocker :
    ∀ q,
      HasNEquidistantPointsAt 4 (D.A.erase (successor q).1)
        (H.centerAt q.1 (PhysicalVertex.mem_A q))

/-- Choose one of the production omission successors at every physical
strict-cap source. -/
theorem nonempty_physicalActualCriticalOmissionTransition
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalActualCriticalOmissionTransition H profile) := by
  classical
  let witness : ∀ q : PhysicalVertex profile,
      ∃ w : ℝ²,
        w ∈ physicalVertices profile ∧
        w ≠ q.1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt q.1 (PhysicalVertex.mem_A q)) := fun q ↦ by
    simpa [physicalVertices, PhysicalVertex.mem_A] using
      exists_distinct_physicalInterior_survives_actualBlocker
        H profile q.1 q.2
  let successor : PhysicalVertex profile → PhysicalVertex profile :=
    fun q ↦ ⟨Classical.choose (witness q), (Classical.choose_spec (witness q)).1⟩
  have hspec : ∀ q : PhysicalVertex profile,
      (successor q).1 ≠ q.1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase (successor q).1)
          (H.centerAt q.1 (PhysicalVertex.mem_A q)) := by
    intro q
    exact (Classical.choose_spec (witness q)).2
  refine ⟨{
    successor := successor
    successor_ne := ?_
    successor_not_mem_actualCriticalSupport := ?_
    successor_deletion_survives_actualBlocker := ?_ }⟩
  · intro q heq
    exact (hspec q).1 (congrArg Subtype.val heq)
  · intro q
    exact (cross_deletion_survives_iff_not_mem_selected_support H
      (PhysicalVertex.mem_A q)).mp
      (hspec q).2
  · intro q
    exact (hspec q).2

/-- A canonical genuine cycle of the chosen physical omission transition.
The base is reachable from `start`, and the period is definitionally the
minimal period of that reachable base. -/
structure PhysicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  transition : PhysicalActualCriticalOmissionTransition H profile
  start : PhysicalVertex profile
  entryTime : ℕ
  period_two_le :
    2 ≤ Function.minimalPeriod transition.successor
      ((transition.successor^[entryTime]) start)

namespace PhysicalActualCriticalOmissionCycle

/-- The reachable base of the normalized omission cycle. -/
def base
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    PhysicalVertex profile :=
  (K.transition.successor^[K.entryTime]) K.start

/-- The canonical minimal period of the omission cycle. -/
noncomputable def period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) : ℕ :=
  Function.minimalPeriod K.transition.successor K.base

/-- The physical source at one canonical cycle index. -/
def source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : PhysicalVertex profile :=
  (K.transition.successor^[i.1]) K.base

/-- The normalized omission cycle has period at least two. -/
theorem two_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    2 ≤ K.period := by
  simpa [period, base] using K.period_two_le

/-- The normalized base is periodic with exactly the minimal period. -/
theorem isPeriodicPt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    Function.IsPeriodicPt K.transition.successor K.period K.base :=
  Function.isPeriodicPt_minimalPeriod K.transition.successor K.base

/-- Distinct canonical indices give distinct physical sources. -/
theorem source_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    Function.Injective K.source := by
  intro i j hij
  apply Fin.ext
  exact Function.iterate_injOn_Iio_minimalPeriod i.isLt j.isLt hij

/-- The cyclic successor index, including the wrap edge. -/
def successorIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Fin K.period :=
  ⟨(i.1 + 1) % K.period,
    Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩

/-- The chosen transition sends each canonical source to the next canonical
source, including at the wrap edge. -/
theorem successor_source_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    K.transition.successor (K.source i) = K.source (K.successorIndex i) := by
  change K.transition.successor
      ((K.transition.successor^[i.1]) K.base) =
    (K.transition.successor^[(i.1 + 1) % K.period]) K.base
  calc
    K.transition.successor ((K.transition.successor^[i.1]) K.base) =
        (K.transition.successor^[i.1 + 1]) K.base := by
      rw [Function.iterate_succ_apply']
    _ = (K.transition.successor^[(i.1 + 1) % K.period]) K.base :=
      (K.isPeriodicPt.iterate_mod_apply (i.1 + 1)).symm

/-- Every cycle edge is nontrivial. -/
theorem successor_source_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    K.source (K.successorIndex i) ≠ K.source i := by
  rw [← K.successor_source_eq i]
  exact K.transition.successor_ne (K.source i)

/-- Every canonical source is an ambient source in the same exact-five
physical radius class. -/
theorem source_mem_A_and_radiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    (K.source i).1 ∈ D.A ∧
      (K.source i).1 ∈ SelectedClass D.A S.oppApex2 profile.radius :=
  ⟨PhysicalVertex.mem_A (K.source i),
    PhysicalVertex.mem_radiusClass (K.source i)⟩

/-- Every canonical source lies in the same strict physical cap interior. -/
theorem source_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    (K.source i).1 ∈ S.capInteriorByIndex S.oppIndex2 :=
  PhysicalVertex.mem_capInterior (K.source i)

/-- Deleting any canonical physical source leaves four points on the common
exact-five physical circle. -/
theorem physicalApex_survives_sourceDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    HasNEquidistantPointsAt 4 (D.A.erase (K.source i).1) S.oppApex2 := by
  refine ⟨profile.radius, profile.radius_pos, ?_⟩
  change 4 ≤
    (SelectedClass (D.A.erase (K.source i).1)
      S.oppApex2 profile.radius).card
  have hmem :
      (K.source i).1 ∈ SelectedClass D.A S.oppApex2 profile.radius :=
    PhysicalVertex.mem_radiusClass (K.source i)
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hmem,
    profile.class_card_eq_five]

/-- Each actual blocker on the source cycle differs from the common physical
apex, since the source deletion preserves K4 there. -/
theorem actualBlocker_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    H.centerAt (K.source i).1
        (PhysicalVertex.mem_A (K.source i)) ≠ S.oppApex2 :=
  ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives H
    (PhysicalVertex.mem_A (K.source i))
    (K.physicalApex_survives_sourceDeletion i)

/-- The next physical source is omitted from the current source's actual
critical support. -/
theorem successor_not_mem_actualCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    (K.source (K.successorIndex i)).1 ∉
      (H.selectedAt (K.source i).1
        (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell.support := by
  rw [← K.successor_source_eq i]
  exact K.transition.successor_not_mem_actualCriticalSupport (K.source i)

/-- Deleting the next physical source preserves K4 at the current source's
actual blocker. -/
theorem successor_deletion_survives_actualBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    HasNEquidistantPointsAt 4
      (D.A.erase (K.source (K.successorIndex i)).1)
      (H.centerAt (K.source i).1
        (PhysicalVertex.mem_A (K.source i))) := by
  rw [← K.successor_source_eq i]
  exact K.transition.successor_deletion_survives_actualBlocker (K.source i)

/-- Consecutive cycle sources have distinct actual blockers. -/
theorem successor_actualBlockers_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ≠
      H.centerAt (K.source i).1 (PhysicalVertex.mem_A (K.source i)) := by
  apply blocker_centers_ne_of_not_mem_other_selected_support H
    (PhysicalVertex.mem_A (K.source (K.successorIndex i)))
    (PhysicalVertex.mem_A (K.source i))
  exact K.successor_not_mem_actualCriticalSupport i

/-- Consequently, consecutive actual critical supports overlap in at most
two points. -/
theorem successor_actualCriticalSupport_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    (((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i)))).toCriticalFourShell.support ∩
        (H.selectedAt (K.source i).1
          (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell.support).card ≤ 2) := by
  apply selected_support_inter_card_le_two_of_not_mem_other_selected_support H
    (PhysicalVertex.mem_A (K.source (K.successorIndex i)))
    (PhysicalVertex.mem_A (K.source i))
  exact K.successor_not_mem_actualCriticalSupport i

/-- The physical exact-five class bounds the genuine cycle period by five. -/
theorem period_le_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    K.period ≤ 5 := by
  have hperiodVertices : K.period ≤ (physicalVertices profile).card := by
    simpa using Fintype.card_le_of_injective K.source K.source_injective
  have hverticesClass :
      (physicalVertices profile).card ≤
        (SelectedClass D.A S.oppApex2 profile.radius).card :=
    Finset.card_le_card Finset.inter_subset_left
  calc
    K.period ≤ (physicalVertices profile).card := hperiodVertices
    _ ≤ (SelectedClass D.A S.oppApex2 profile.radius).card := hverticesClass
    _ = 5 := profile.class_card_eq_five

end PhysicalActualCriticalOmissionCycle

/-- One omission-cycle edge whose reverse incidence is also absent.  This is
the source-faithful mutual-omission arm of the cycle consumer. -/
structure PhysicalActualCriticalMutualOmissionEdge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) where
  index : Fin K.period
  reverse_not_mem_actualCriticalSupport :
    (K.source index).1 ∉
      (H.selectedAt (K.source (K.successorIndex index)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex index)))).toCriticalFourShell.support

namespace PhysicalActualCriticalMutualOmissionEdge

/-- On a mutual-omission edge, deleting the current source preserves K4 at
the successor source's actual blocker. -/
theorem reverse_deletion_survives_actualBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    (E : PhysicalActualCriticalMutualOmissionEdge K) :
    HasNEquidistantPointsAt 4 (D.A.erase (K.source E.index).1)
      (H.centerAt (K.source (K.successorIndex E.index)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex E.index)))) :=
  (cross_deletion_survives_iff_not_mem_selected_support H
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex E.index)))).mpr
    E.reverse_not_mem_actualCriticalSupport

end PhysicalActualCriticalMutualOmissionEdge

/-- Exhaustive source-faithful split for the next geometric consumer: either
some cycle edge is omitted in both directions, or every edge has the reverse
positive incidence in the successor's actual critical row. -/
theorem nonempty_mutualOmissionEdge_or_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    Nonempty (PhysicalActualCriticalMutualOmissionEdge K) ∨
      ∀ i : Fin K.period,
        (K.source i).1 ∈
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
  classical
  by_cases hmutual :
      ∃ i : Fin K.period,
        (K.source i).1 ∉
          (H.selectedAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A
              (K.source (K.successorIndex i)))).toCriticalFourShell.support
  · left
    rcases hmutual with ⟨index, hreverse⟩
    exact ⟨{
      index := index
      reverse_not_mem_actualCriticalSupport := hreverse }⟩
  · right
    intro i
    by_contra hreverse
    exact hmutual ⟨i, hreverse⟩

/-- Any fixed-point-free self-map on a finite type reaches a canonical
minimal-period cycle.  This is the generic finite-cycle step adapted from the
banked actual-blocker-cycle normalization. -/
private theorem exists_reachable_nontrivial_minimalCycle
    {X : Type*} [Finite X]
    (f : X → X) (hfixed : ∀ x, f x ≠ x) (start : X) :
    ∃ m : ℕ,
      2 ≤ Function.minimalPeriod f ((f^[m]) start) := by
  classical
  obtain ⟨m, n, hmn, heq⟩ :=
    Finite.exists_ne_map_eq_of_infinite (fun t : ℕ ↦ (f^[t]) start)
  rcases lt_or_gt_of_ne hmn with hmnlt | hmnlt
  · let q := (f^[m]) start
    let k := n - m
    have hkpos : 0 < k := by omega
    have hperiodic : Function.IsPeriodicPt f k q := by
      change (f^[k]) q = q
      calc
        (f^[k]) q = (f^[k + m]) start := by rw [Function.iterate_add_apply]
        _ = (f^[n]) start := by congr 1; omega
        _ = (f^[m]) start := heq.symm
        _ = q := rfl
    have hminpos : 0 < Function.minimalPeriod f q :=
      hperiodic.minimalPeriod_pos hkpos
    have hminne : Function.minimalPeriod f q ≠ 1 := by
      intro hone
      exact hfixed q (Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone)
    exact ⟨m, by simpa [q] using (show 2 ≤ Function.minimalPeriod f q by omega)⟩
  · let q := (f^[n]) start
    let k := m - n
    have hkpos : 0 < k := by omega
    have hperiodic : Function.IsPeriodicPt f k q := by
      change (f^[k]) q = q
      calc
        (f^[k]) q = (f^[k + n]) start := by rw [Function.iterate_add_apply]
        _ = (f^[m]) start := by congr 1; omega
        _ = (f^[n]) start := heq
        _ = q := rfl
    have hminpos : 0 < Function.minimalPeriod f q :=
      hperiodic.minimalPeriod_pos hkpos
    have hminne : Function.minimalPeriod f q ≠ 1 := by
      intro hone
      exact hfixed q (Function.minimalPeriod_eq_one_iff_isFixedPt.mp hone)
    exact ⟨n, by simpa [q] using (show 2 ≤ Function.minimalPeriod f q by omega)⟩

/-- The production exact-five omission successor yields a genuine
source-exact actual-critical omission cycle of period two through five. -/
theorem nonempty_physicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalActualCriticalOmissionCycle H profile) := by
  rcases nonempty_physicalActualCriticalOmissionTransition H profile with
    ⟨transition⟩
  rcases physicalVertex_nonempty profile with ⟨start⟩
  rcases exists_reachable_nontrivial_minimalCycle transition.successor
      transition.successor_ne start with ⟨entryTime, hperiod⟩
  exact ⟨{
    transition := transition
    start := start
    entryTime := entryTime
    period_two_le := hperiod }⟩

#print axioms physicalVertices_card_ge_three
#print axioms nonempty_physicalActualCriticalOmissionTransition
#print axioms PhysicalActualCriticalOmissionCycle.source_injective
#print axioms PhysicalActualCriticalOmissionCycle.actualBlocker_ne_physicalApex
#print axioms PhysicalActualCriticalOmissionCycle.successor_not_mem_actualCriticalSupport
#print axioms PhysicalActualCriticalOmissionCycle.successor_deletion_survives_actualBlocker
#print axioms PhysicalActualCriticalOmissionCycle.successor_actualBlockers_ne
#print axioms PhysicalActualCriticalOmissionCycle.period_le_five
#print axioms PhysicalActualCriticalMutualOmissionEdge.reverse_deletion_survives_actualBlocker
#print axioms nonempty_mutualOmissionEdge_or_all_reverseMembership
#print axioms nonempty_physicalActualCriticalOmissionCycle

end

end ATailLargeCapUniqueFivePhysicalOmissionCycle
end Problem97
