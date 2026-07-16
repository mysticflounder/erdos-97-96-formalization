/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SubcarrierTerminalInvariant

/-!
# Exact blocker-map normal form for an ambient robust history pair

This scratch module continues the R-branch terminal-history analysis without
changing a production module.  It uses the total critical-shell blocker map in
both orientations of a retained erased pair.

The main result is an exact three-way normal form.  Either the two chosen
blockers coincide, in which case the common blocker is outside the surplus cap
and both directed cross incidences occur, or the blockers are distinct and at
least one directed cross deletion survives.  The latter is equivalently a
directed omission from the corresponding exact selected support.

The final section strengthens `exists_blocker_cycle` to a cycle reachable from
an arbitrary named source.  This records exactly what iteration of the total
blocker map supplies; it does not assert that the robust-pair invariant is
preserved after the first blocker step.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRComplementBlockerMapScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hsub : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzA, hzdist⟩

/-- Reverse the orientation of an ambient robust history pair. -/
def swapAmbientRobustHistoryPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho) :
    AmbientRobustHistoryPair D S C rho where
  x := P.y
  y := P.x
  x_mem_erased := P.y_mem_erased
  y_mem_erased := P.x_mem_erased
  x_mem_class := P.y_mem_class
  y_mem_class := P.x_mem_class
  x_ne_y := P.x_ne_y.symm
  x_off_surplus := P.y_off_surplus
  y_off_surplus := P.x_off_surplus
  first_double := by simpa [Finset.erase_right_comm] using P.first_double
  second_double := by simpa [Finset.erase_right_comm] using P.second_double
  strict_endpoint := P.strict_endpoint.elim Or.inr Or.inl

/-- An ambient robust history pair supplies the source-exact relocation packet
needed by the existing reciprocal-blocker theorems. -/
def robustPairToSurvivorPairRelocationPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S rho H := by
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  have hyA : P.y ∈ D.A := (mem_selectedClass.mp P.y_mem_class).1
  have hxMarginal :
      P.x ∈ (D.A.filter fun z => dist z S.oppApex1 = rho) \ S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hxA, ?_⟩, P.x_off_surplus⟩
    simpa [dist_comm] using (mem_selectedClass.mp P.x_mem_class).2
  have hyMarginal :
      P.y ∈ (D.A.filter fun z => dist z S.oppApex1 = rho) \ S.surplusCap := by
    refine Finset.mem_sdiff.mpr ⟨Finset.mem_filter.mpr ⟨hyA, ?_⟩, P.y_off_surplus⟩
    simpa [dist_comm] using (mem_selectedClass.mp P.y_mem_class).2
  have hxSecond : HasNEquidistantPointsAt 4 (D.A.erase P.x) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase P.x) _ P.second_double
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hsecondSym :
      HasNEquidistantPointsAt 4 ((D.A.erase P.y).erase P.x) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using P.second_double
  have hySecond : HasNEquidistantPointsAt 4 (D.A.erase P.y) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase P.y) _ hsecondSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  exact
    { q := P.x
      w := P.y
      q_mem_A := hxA
      w_mem_A := hyA
      q_mem_marginal := hxMarginal
      w_mem_marginal := hyMarginal
      q_ne_w := P.x_ne_y
      q_survives := hxSecond
      w_survives := hySecond
      q_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hxA hxSecond
      w_blocker_ne_oppApex2 :=
        actual_blocker_ne_of_deletion_survives H hyA hySecond }

/-- Both chosen blockers are distinct from both prescribed apices. -/
theorem robustPair_blockers_ne_prescribed_apices
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠ S.oppApex1 ∧
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠ S.oppApex2) ∧
    (H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ≠ S.oppApex1 ∧
      H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ≠ S.oppApex2) := by
  have hxA : P.x ∈ D.A := (mem_selectedClass.mp P.x_mem_class).1
  have hyA : P.y ∈ D.A := (mem_selectedClass.mp P.y_mem_class).1
  have hxFirst : HasNEquidistantPointsAt 4 (D.A.erase P.x) S.oppApex1 := by
    apply equidistant_mono (B := D.A.erase P.x) _ P.first_double
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hfirstSym :
      HasNEquidistantPointsAt 4 ((D.A.erase P.y).erase P.x) S.oppApex1 := by
    simpa [Finset.erase_right_comm] using P.first_double
  have hyFirst : HasNEquidistantPointsAt 4 (D.A.erase P.y) S.oppApex1 := by
    apply equidistant_mono (B := D.A.erase P.y) _ hfirstSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hxSecond : HasNEquidistantPointsAt 4 (D.A.erase P.x) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase P.x) _ P.second_double
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  have hsecondSym :
      HasNEquidistantPointsAt 4 ((D.A.erase P.y).erase P.x) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using P.second_double
  have hySecond : HasNEquidistantPointsAt 4 (D.A.erase P.y) S.oppApex2 := by
    apply equidistant_mono (B := D.A.erase P.y) _ hsecondSym
    intro z hz
    exact (Finset.mem_erase.mp hz).2
  exact
    ⟨⟨actual_blocker_ne_of_deletion_survives H hxA hxFirst,
        actual_blocker_ne_of_deletion_survives H hxA hxSecond⟩,
      ⟨actual_blocker_ne_of_deletion_survives H hyA hyFirst,
        actual_blocker_ne_of_deletion_survives H hyA hySecond⟩⟩

/-- On a robust pair, coincident chosen blockers are exactly the case in which
neither directed cross deletion survives. -/
theorem robustPair_blocker_centers_eq_iff_no_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 =
        H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ↔
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.y)
          (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase P.x)
          (H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1) := by
  let R := robustPairToSurvivorPairRelocationPacket P H
  have hreciprocal :=
    blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives
      R P.first_double
  constructor
  · intro hcenters
    have hhits := hreciprocal.mp hcenters
    constructor
    · intro hsurvives
      have homits :=
        (cross_deletion_survives_iff_not_mem_selected_support H
          (mem_selectedClass.mp P.x_mem_class).1).mp hsurvives
      exact homits hhits.1
    · intro hsurvives
      have homits :=
        (cross_deletion_survives_iff_not_mem_selected_support H
          (mem_selectedClass.mp P.y_mem_class).1).mp hsurvives
      exact homits hhits.2
  · rintro ⟨hxyBlocked, hyxBlocked⟩
    apply hreciprocal.mpr
    constructor
    · by_contra homits
      exact hxyBlocked
        ((cross_deletion_survives_iff_not_mem_selected_support H
          (mem_selectedClass.mp P.x_mem_class).1).mpr homits)
    · by_contra homits
      exact hyxBlocked
        ((cross_deletion_survives_iff_not_mem_selected_support H
          (mem_selectedClass.mp P.y_mem_class).1).mpr homits)

/-- Equivalently, the chosen blockers are distinct exactly when at least one
directed cross deletion survives. -/
theorem robustPair_blocker_centers_ne_iff_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
        H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ↔
      HasNEquidistantPointsAt 4 (D.A.erase P.y)
          (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.x)
          (H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1) := by
  constructor
  · intro hne
    by_contra hneither
    push_neg at hneither
    exact hne
      ((robustPair_blocker_centers_eq_iff_no_cross_deletion_survives P H).mpr hneither)
  · intro hsurvives hcenters
    have hblocked :=
      (robustPair_blocker_centers_eq_iff_no_cross_deletion_survives P H).mp hcenters
    exact hsurvives.elim hblocked.1 hblocked.2

/-- If the two source blockers coincide, the common blocker is outside the
surplus cap and both directed cross incidences occur. -/
theorem robustPair_coincident_blocker_normal_form
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hcenters :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 =
        H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1) :
    H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉ S.surplusCap ∧
      P.y ∈
        (H.selectedAt P.x
          (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
      P.x ∈
        (H.selectedAt P.y
          (mem_selectedClass.mp P.y_mem_class).1).toCriticalFourShell.support := by
  let R := robustPairToSurvivorPairRelocationPacket P H
  have hhits :=
    (blocker_centers_eq_iff_mutual_cross_membership_of_first_apex_double_deletion_survives
      R P.first_double).mp hcenters
  refine ⟨?_, hhits⟩
  intro hsurplus
  exact P.false_of_sourceBlocker_surplus_cross H hsurplus hhits.1

/-- If both source blockers lie in the surplus cap, then both directed cross
deletions survive and the two blockers are distinct. -/
theorem robustPair_two_surplus_blockers_force_two_cross_survivals
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A)
    (hxSurplus :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∈ S.surplusCap)
    (hySurplus :
      H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ∈ S.surplusCap) :
    HasNEquidistantPointsAt 4 (D.A.erase P.y)
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1) ∧
      HasNEquidistantPointsAt 4 (D.A.erase P.x)
        (H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1) ∧
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
        H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 := by
  have hxComp := P.sourceBlocker_outside_surplus_or_cross_deletion_survives H
  have hyComp :=
    (swapAmbientRobustHistoryPair P).sourceBlocker_outside_surplus_or_cross_deletion_survives H
  have hxSurvives := hxComp.resolve_left (not_not.mpr hxSurplus)
  have hySurvives := hyComp.resolve_left (not_not.mpr hySurplus)
  exact ⟨hxSurvives, hySurvives,
    (robustPair_blocker_centers_ne_iff_cross_deletion_survives P H).mpr
      (Or.inl hxSurvives)⟩

/-- The sharp oriented normal form supplied by the current total blocker map.

The alternatives are intentionally asymmetric only to make them disjoint:
the third arm records that the `x`-sourced row hits `y`, while the reverse
cross deletion survives. -/
theorem robustPair_blocker_cross_three_way
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 =
          H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ∧
        H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ∉ S.surplusCap ∧
        P.y ∈
          (H.selectedAt P.x
            (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
        P.x ∈
          (H.selectedAt P.y
            (mem_selectedClass.mp P.y_mem_class).1).toCriticalFourShell.support) ∨
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
          H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.y)
          (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1)) ∨
      (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 ≠
          H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1 ∧
        P.y ∈
          (H.selectedAt P.x
            (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.x)
          (H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1)) := by
  by_cases hcenters :
      H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1 =
        H.centerAt P.y (mem_selectedClass.mp P.y_mem_class).1
  · left
    exact ⟨hcenters, robustPair_coincident_blocker_normal_form P H hcenters⟩
  · by_cases hxSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.y)
        (H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1)
    · exact Or.inr (Or.inl ⟨hcenters, hxSurvives⟩)
    · right; right
      have hxHit : P.y ∈
          (H.selectedAt P.x
            (mem_selectedClass.mp P.x_mem_class).1).toCriticalFourShell.support := by
        by_contra hxOmitted
        exact hxSurvives
          ((cross_deletion_survives_iff_not_mem_selected_support H
            (mem_selectedClass.mp P.x_mem_class).1).mpr hxOmitted)
      have hsome :=
        (robustPair_blocker_centers_ne_iff_cross_deletion_survives P H).mp hcenters
      exact ⟨hcenters, hxHit, hsome.resolve_left hxSurvives⟩

/-- Every named source reaches a genuine periodic blocker cycle.  Unlike the
global existence theorem, this preserves reachability from the chosen source. -/
theorem exists_reachable_blocker_cycle
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (start : CriticalShellSystem.CarrierVertex A) :
    ∃ (m k : ℕ), 2 ≤ k ∧
      Function.IsPeriodicPt H.blockerVertex k
        ((H.blockerVertex^[m]) start) := by
  classical
  obtain ⟨m, n, hmn, heq⟩ :=
    Finite.exists_ne_map_eq_of_infinite
      (fun t : ℕ => (H.blockerVertex^[t]) start)
  rcases lt_or_gt_of_ne hmn with hmnlt | hmnlt
  · let q : CriticalShellSystem.CarrierVertex A := (H.blockerVertex^[m]) start
    let k : ℕ := n - m
    have hkpos : 0 < k := by
      dsimp [k]
      omega
    have hperiodic : Function.IsPeriodicPt H.blockerVertex k q := by
      change (H.blockerVertex^[k]) q = q
      calc
        (H.blockerVertex^[k]) q = (H.blockerVertex^[k + m]) start := by
          rw [Function.iterate_add_apply]
        _ = (H.blockerVertex^[n]) start := by
          congr 1
          omega
        _ = (H.blockerVertex^[m]) start := heq.symm
        _ = q := rfl
    have hk_ne_one : k ≠ 1 := by
      intro hk
      have hfixed : H.blockerVertex q = q := by simpa [hk] using hperiodic
      exact H.blockerVertex_ne q hfixed
    exact ⟨m, k, by omega, hperiodic⟩
  · let q : CriticalShellSystem.CarrierVertex A := (H.blockerVertex^[n]) start
    let k : ℕ := m - n
    have hkpos : 0 < k := by
      dsimp [k]
      omega
    have hperiodic : Function.IsPeriodicPt H.blockerVertex k q := by
      change (H.blockerVertex^[k]) q = q
      calc
        (H.blockerVertex^[k]) q = (H.blockerVertex^[k + n]) start := by
          rw [Function.iterate_add_apply]
        _ = (H.blockerVertex^[m]) start := by
          congr 1
          omega
        _ = (H.blockerVertex^[n]) start := heq
        _ = q := rfl
    have hk_ne_one : k ≠ 1 := by
      intro hk
      have hfixed : H.blockerVertex q = q := by simpa [hk] using hperiodic
      exact H.blockerVertex_ne q hfixed
    exact ⟨n, k, by omega, hperiodic⟩

/-- Pair-specialized reachable-cycle export.  No robust-pair field is claimed
for the later orbit vertices. -/
theorem robustPair_exists_reachable_blocker_cycle_from_x
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    (P : AmbientRobustHistoryPair D S C rho)
    (H : CriticalShellSystem D.A) :
    ∃ (m k : ℕ), 2 ≤ k ∧
      Function.IsPeriodicPt H.blockerVertex k
        ((H.blockerVertex^[m])
          ⟨P.x, (mem_selectedClass.mp P.x_mem_class).1⟩) :=
  exists_reachable_blocker_cycle H
    ⟨P.x, (mem_selectedClass.mp P.x_mem_class).1⟩

#print axioms robustPair_blockers_ne_prescribed_apices
#print axioms robustPair_blocker_centers_eq_iff_no_cross_deletion_survives
#print axioms robustPair_blocker_centers_ne_iff_cross_deletion_survives
#print axioms robustPair_coincident_blocker_normal_form
#print axioms robustPair_two_surplus_blockers_force_two_cross_survivals
#print axioms robustPair_blocker_cross_three_way
#print axioms exists_reachable_blocker_cycle
#print axioms robustPair_exists_reachable_blocker_cycle_from_x

end ATailRComplementBlockerMapScratch
end Problem97
