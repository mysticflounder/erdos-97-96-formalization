/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair

/-!
# Anchored double-deletion producer normal form

Outside the exact-card-four first-apex escape, a source whose actual blocker
is the first apex cannot make deletion of the first frontier point fail. On a
directed cross-membership arm, simultaneous failure of both frontier
deletions at an actual blocker is therefore equivalent to equality with the
already-known blocker selected for the first frontier source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAnchoredDoubleDeletionProducer

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailThirdCenterCommonPair

attribute [local instance] Classical.propDecidable

/-- If deleting the first frontier point fails at an actual blocker equal to
the first apex, the ambient first-apex radius class is exactly the critical
four-shell. -/
theorem firstApexClass_card_eq_four_of_qDeletion_blocked_at_actualFirstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter : H.centerAt source hsource = S.oppApex1)
    (hqBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource)) :
    (SelectedClass D.A S.oppApex1 r).card = 4 := by
  let K := (H.selectedAt source hsource).toCriticalFourShell
  have hqSupport : P.q ∈ K.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlocked
  have hqRadius : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hKr : K.radius = r := by
    calc
      K.radius = dist (H.centerAt source hsource) P.q :=
        (K.support_eq_radius P.q hqSupport).symm
      _ = dist S.oppApex1 P.q := congrArg (fun z ↦ dist z P.q) hcenter
      _ = dist P.q S.oppApex1 := dist_comm _ _
      _ = r := hqRadius
  have hsupport : SelectedClass D.A S.oppApex1 r = K.support := by
    ext z
    constructor
    · intro hz
      rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
      apply K.off_row_named_label_forbidden hzA
      calc
        dist (H.centerAt source hsource) z = dist S.oppApex1 z :=
          congrArg (fun center ↦ dist center z) hcenter
        _ = r := hzdist
        _ = K.radius := hKr.symm
    · intro hz
      apply mem_selectedClass.mpr
      refine ⟨K.support_subset_A hz, ?_⟩
      calc
        dist S.oppApex1 z = dist (H.centerAt source hsource) z :=
          (congrArg (fun center ↦ dist center z) hcenter).symm
        _ = K.radius := K.support_eq_radius z hz
        _ = r := hKr
  rw [hsupport, K.support_card]

/-- Outside the exact-card-four escape, an actual blocker at the first apex
preserves deletion of the first frontier point. -/
theorem qDeletion_survives_of_actualBlocker_eq_firstApex_of_not_cardFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter : H.centerAt source hsource = S.oppApex1) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
      (H.centerAt source hsource) := by
  by_contra hqBlocked
  exact hnotFour
    (firstApexClass_card_eq_four_of_qDeletion_blocked_at_actualFirstApex
      P hsource hcenter hqBlocked)

/-- Equal actual blockers force equality of their source-indexed exact
critical supports. -/
theorem criticalSupports_eq_of_actualBlocker_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter :
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A) :
    (H.selectedAt source hsource).toCriticalFourShell.support =
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  let Ks := (H.selectedAt source hsource).toCriticalFourShell
  let Kq := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell
  have hqBlockedAtSourceCenter :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource) := by
    intro hsurvives
    apply H.no_qfree_at P.q P.q_mem_A
    simpa only [hcenter] using hsurvives
  have hqKs : P.q ∈ Ks.support :=
    source_mem_critical_support_of_no_qfree
      (H.selectedAt source hsource) hqBlockedAtSourceCenter
  have hradii : Ks.radius = Kq.radius := by
    calc
      Ks.radius = dist (H.centerAt source hsource) P.q :=
        (Ks.support_eq_radius P.q hqKs).symm
      _ = dist (H.centerAt P.q P.q_mem_A) P.q :=
        congrArg (fun center ↦ dist center P.q) hcenter
      _ = Kq.radius := Kq.support_eq_radius P.q Kq.q_mem_support
  ext z
  constructor
  · intro hz
    apply Kq.off_row_named_label_forbidden (Ks.support_subset_A hz)
    calc
      dist (H.centerAt P.q P.q_mem_A) z =
          dist (H.centerAt source hsource) z :=
        (congrArg (fun center ↦ dist center z) hcenter).symm
      _ = Ks.radius := Ks.support_eq_radius z hz
      _ = Kq.radius := hradii
  · intro hz
    apply Ks.off_row_named_label_forbidden (Kq.support_subset_A hz)
    calc
      dist (H.centerAt source hsource) z =
          dist (H.centerAt P.q P.q_mem_A) z :=
        congrArg (fun center ↦ dist center z) hcenter
      _ = Kq.radius := Kq.support_eq_radius z hz
      _ = Ks.radius := hradii.symm

/-- Every source assigned to the blocker selected for `P.q` lies in that
blocker's exact critical shell. -/
theorem source_mem_qBlockerShell_of_actualBlocker_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hcenter :
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A) :
    source ∈
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  rw [← criticalSupports_eq_of_actualBlocker_eq P hsource hcenter]
  exact (H.selectedAt source hsource).toCriticalFourShell.q_mem_support

/-- The source fiber of the actual blocker selected for `P.q`. -/
noncomputable def qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    Finset (CriticalShellSystem.CarrierVertex D.A) :=
  Finset.univ.filter fun source ↦
    H.blockerVertex source = H.blockerVertex ⟨P.q, P.q_mem_A⟩

/-- Exact critical-shell locking bounds the source fiber of the known
`P.q`-blocker by four. -/
theorem qBlockerFiber_card_le_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    (qBlockerFiber P).card ≤ 4 := by
  let points : Finset ℝ² :=
    (qBlockerFiber P).image fun source ↦ source.1
  have hpoints :
      points ⊆
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceFiber, rfl⟩
    have hsourceA : source.1 ∈ D.A := source.2
    have hblockerVertex :=
      (Finset.mem_filter.mp hsourceFiber).2
    have hcenter :
        H.centerAt source.1 hsourceA = H.centerAt P.q P.q_mem_A :=
      congrArg Subtype.val hblockerVertex
    exact source_mem_qBlockerShell_of_actualBlocker_eq
      P hsourceA hcenter
  calc
    (qBlockerFiber P).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support.card :=
      Finset.card_le_card hpoints
    _ = 4 :=
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_card

/-- The parent cardinality hypothesis therefore leaves at least six carrier
sources outside the exceptional known-blocker fiber. -/
theorem six_le_sources_outside_qBlockerFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : 9 < D.A.card) :
    6 ≤ (Finset.univ \ qBlockerFiber P).card := by
  have hfiber := qBlockerFiber_card_le_four P
  have hsplit := Finset.card_sdiff_add_card_inter
    (Finset.univ : Finset (CriticalShellSystem.CarrierVertex D.A))
    (qBlockerFiber P)
  have htotal :
      Fintype.card (CriticalShellSystem.CarrierVertex D.A) = D.A.card := by
    simp [CriticalShellSystem.CarrierVertex, Fintype.card_coe]
  simp only [Finset.inter_eq_right.mpr (Finset.subset_univ _),
    Finset.card_univ, htotal] at hsplit
  omega

/-- On a directed cross-membership arm and away from exact card four, both
frontier deletions fail at a source's actual blocker exactly when that blocker
is the already-known blocker selected for `P.q`. -/
theorem both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    {source : ℝ²} (hsource : source ∈ D.A) :
    ((¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source hsource)) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source hsource)) ↔
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A := by
  have hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
    intro hcenter
    exact hnotFour
      (firstApexClass_card_eq_four_of_qDeletion_blocked_at_actualFirstApex
        P P.q_mem_A hcenter (H.no_qfree_at P.q P.q_mem_A))
  constructor
  · rintro ⟨hqBlocked, hwBlocked⟩
    rcases
        actualBlocker_eq_knownCenter_of_both_frontierDeletions_blocked
          P hwSupport hqBlocker_ne_first hsource hqBlocked hwBlocked with
      hfirst | hblocker
    · exact False.elim
        (hqBlocked
          (qDeletion_survives_of_actualBlocker_eq_firstApex_of_not_cardFour
            P hnotFour hsource hfirst))
    · exact hblocker
  · intro hblocker
    apply
      (both_frontierDeletions_blocked_iff_selectedRow_contains_pair
        (H := H) hsource).2
    have hsupportEq :=
      criticalSupports_eq_of_actualBlocker_eq P hsource hblocker
    constructor
    · change P.q ∈
        (H.selectedAt source hsource).toCriticalFourShell.support
      rw [hsupportEq]
      exact (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support
    · change P.w ∈
        (H.selectedAt source hsource).toCriticalFourShell.support
      rw [hsupportEq]
      exact hwSupport

/-- Equivalent cover form: away from exact card four, every actual blocker
either preserves one frontier deletion or is the known `P.q`-blocker. -/
theorem frontierDeletion_survival_or_actualBlocker_eq_qBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    {source : ℝ²} (hsource : source ∈ D.A) :
    HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt source hsource) ∨
      H.centerAt source hsource = H.centerAt P.q P.q_mem_A := by
  by_cases hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt source hsource)
  · exact Or.inl hqSurvives
  · by_cases hwSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source hsource)
    · exact Or.inr (Or.inl hwSurvives)
    · exact Or.inr (Or.inr
        ((both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker
          P hnotFour hwSupport hsource).1 ⟨hqSurvives, hwSurvives⟩))

/-- Off the card-four escape, no source has a genuinely third actual blocker
at which both frontier deletions fail. -/
theorem not_exists_distinct_actualBlocker_with_both_frontierDeletions_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support) :
    ¬ ∃ (source : ℝ²) (hsource : source ∈ D.A),
      H.centerAt source hsource ≠ S.oppApex1 ∧
        H.centerAt source hsource ≠ H.centerAt P.q P.q_mem_A ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q)
          (H.centerAt source hsource) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w)
          (H.centerAt source hsource) := by
  rintro ⟨source, hsource, _hfirst, hblocker, hqBlocked, hwBlocked⟩
  exact hblocker
    ((both_frontierDeletions_blocked_iff_actualBlocker_eq_qBlocker
      P hnotFour hwSupport hsource).1 ⟨hqBlocked, hwBlocked⟩)

end ATailAnchoredDoubleDeletionProducer
end Problem97
