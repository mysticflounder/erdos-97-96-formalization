/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import stage1_minimal_deletion_core
import JointProfileElimination
import ThirdCenterCommonPair
import CriticalSystemRebase

/-!
# Global minimality to a finite deletion core

This scratch module turns global minimality into a source-faithful local
alternative.  Delete a prescribed finite set `U` from a minimal carrier.  A
remaining carrier point must lose K4.  At that point, shrink `U` to a
cardinality-minimal set whose deletion still loses K4.

Restoring any member of the minimal set restores K4.  Consequently either
two deleted sources have the same radius about the new center, or the
existing `MinimalDeletionCore` theorem produces one exact critical shell per
deleted source with pairwise-disjoint supports.

The center lies in `A \ U`, so choosing `U` to contain all already-known
blockers forces genuinely fresh provenance.  No production declaration
imports this file.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMinimalDeletionCoreScratch

open ATAILStageOneMinimalDeletionCore
open ATAILStageOnePrescribedApexDichotomy
open ATailJointProfileEliminationScratch
open ATailThirdCenterCommonPairScratch
open ATailCriticalSystemRebaseScratch
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex1_mem_triangle_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.triangle.verts := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, hi, MoserTriangle.verts]

private theorem triple_card_le_three (a b c : ℝ²) :
    ({a, b, c} : Finset ℝ²).card ≤ 3 := by
  calc
    ({a, b, c} : Finset ℝ²).card ≤ ({b, c} : Finset ℝ²).card + 1 :=
      Finset.card_insert_le a {b, c}
    _ ≤ (({c} : Finset ℝ²).card + 1) + 1 :=
      Nat.add_le_add_right (Finset.card_insert_le b {c}) 1
    _ = 3 := by simp

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    H.centerAt source hsource ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt source hsource).toCriticalFourShell.center_mem).2

/-- A nonempty proper subset of a minimal counterexample carrier cannot
retain the global four-equidistant property. -/
theorem not_hasNEquidistantProperty_of_nonempty_proper_subset
    {D : CounterexampleData} (hmin : D.Minimal)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ D.A)
    (hBproper : B ≠ D.A) :
    ¬ HasNEquidistantProperty 4 B := by
  intro hBK4
  have hBconvex : ConvexIndep B := ConvexIndep.mono hBA D.convex
  have hcard : D.A.card ≤ B.card := hmin B hBne hBconvex hBK4
  exact hBproper (Finset.eq_of_subset_of_card_le hBA hcard)

/-- Failure of the global property on a finite carrier is witnessed at one
of its own centers. -/
theorem exists_local_blocker_of_not_global_K4
    {B : Finset ℝ²}
    (hnot : ¬ HasNEquidistantProperty 4 B) :
    ∃ center ∈ B,
      ¬ HasNEquidistantPointsAt 4 B center := by
  classical
  by_contra hnone
  apply hnot
  intro center hcenter
  by_contra hblocked
  exact hnone ⟨center, hcenter, hblocked⟩

/-- At a fixed center, any finite deletion which destroys K4 contains a
cardinality-minimal blocking subdeletion.  Restoring any one of its members
restores K4 at that center. -/
theorem exists_cardMinimal_blocking_subdeletion
    {A U : Finset ℝ²} {center : ℝ²}
    (hfull : HasNEquidistantPointsAt 4 A center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ U) center) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (A \ (V.erase s)) center := by
  classical
  let candidates : Finset (Finset ℝ²) :=
    U.powerset.filter fun V ↦
      ¬ HasNEquidistantPointsAt 4 (A \ V) center
  have hUcand : U ∈ candidates := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_powerset.mpr (fun _ hx ↦ hx), hblocked⟩
  have hcandidates : candidates.Nonempty := ⟨U, hUcand⟩
  rcases Finset.exists_min_image candidates Finset.card hcandidates with
    ⟨V, hVcand, hVmin⟩
  rcases Finset.mem_filter.mp hVcand with ⟨hVpowerset, hVblocked⟩
  have hVsub : V ⊆ U := Finset.mem_powerset.mp hVpowerset
  have hVne : V.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hVempty
    apply hVblocked
    simpa [hVempty] using hfull
  refine ⟨V, hVne, hVsub, hVblocked, ?_⟩
  intro s hsV
  by_contra hrestoreBlocked
  have hEraseCand : V.erase s ∈ candidates := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_powerset.mpr ?_, hrestoreBlocked⟩
    exact (Finset.erase_subset s V).trans hVsub
  have hle : V.card ≤ (V.erase s).card := hVmin (V.erase s) hEraseCand
  exact (not_lt_of_ge hle) (Finset.card_erase_lt_of_mem hsV)

/-- Delete a prescribed nonempty set `U` from a minimal carrier.  If at least
one carrier point remains, some remaining center admits a minimal blocking
subdeletion of `U`. -/
theorem exists_global_cardMinimal_blocking_subdeletion
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ (V.erase s)) center := by
  classical
  have hproper : D.A \ U ≠ D.A := by
    rcases hUne with ⟨u, huU⟩
    intro heq
    have huRemaining : u ∈ D.A \ U := by
      rw [heq]
      exact hUsub huU
    exact (Finset.mem_sdiff.mp huRemaining).2 huU
  have hnotGlobal :
      ¬ HasNEquidistantProperty 4 (D.A \ U) :=
    not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hremaining (Finset.sdiff_subset) hproper
  rcases exists_local_blocker_of_not_global_K4 hnotGlobal with
    ⟨center, hcenterRemaining, hcenterBlocked⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterRemaining).1
  rcases exists_cardMinimal_blocking_subdeletion
      (D.K4 center hcenterA) hcenterBlocked with
    ⟨V, hVne, hVsub, hVblocked, hVminimal⟩
  exact ⟨center, hcenterRemaining, V, hVne, hVsub,
    hVblocked, hVminimal⟩

/-- Global deletion-critical bridge.

For any prescribed proper deletion set `U`, minimality produces a center
outside `U` and a nonempty minimal blocking subset `V ⊆ U`.  Either two
members of `V` are co-radial about that fresh center, or every member of `V`
has its own exact critical four-shell there and these shells are pairwise
disjoint. -/
theorem exists_fresh_sharedRadiusPair_or_minimalDeletionCore
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  rcases exists_global_cardMinimal_blocking_subdeletion
      hmin hUsub hUne hremaining with
    ⟨center, hcenterRemaining, V, hVne, hVsub,
      hVblocked, hVminimal⟩
  refine ⟨center, hcenterRemaining, V, hVne, hVsub, hVblocked, ?_⟩
  by_cases hcollision :
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t
  · exact Or.inl hcollision
  · apply Or.inr
    have hcenterA : center ∈ D.A :=
      (Finset.mem_sdiff.mp hcenterRemaining).1
    apply exists_minimalDeletionCore
      (A := D.A) (U := V) (center := center)
      (hVsub.trans hUsub) hcenterA
    · intro s hsV t htV hst hdist
      exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
    · exact hVblocked
    · exact hVminimal

/-- Cardinality-facing form: `U.card < A.card` supplies the required
nonempty complement automatically. -/
theorem exists_fresh_sharedRadiusPair_or_minimalDeletionCore_of_card_lt
    {D : CounterexampleData} (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hcard : U.card < D.A.card) :
    ∃ center ∈ D.A \ U, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ U ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  have hsplit := Finset.card_sdiff_add_card_inter D.A U
  have hinter : D.A ∩ U = U := Finset.inter_eq_right.mpr hUsub
  rw [hinter] at hsplit
  have hremainingCard : 0 < (D.A \ U).card := by omega
  exact exists_fresh_sharedRadiusPair_or_minimalDeletionCore
    hmin hUsub hUne (Finset.card_pos.mp hremainingCard)

/-- Four-role specialization for the intended frontier application.  When
`q`, `w`, and two already-known common-pair centers `o`, `b` are deleted, a
carrier of cardinality at least five has a blocker center outside all four.
The resulting minimal deletion core again gives either a fresh shared-radius
pair among the four roles or pairwise-disjoint exact shells at the fresh
center. -/
theorem exists_outside_four_knownPoints_sharedRadiusPair_or_core
    {D : CounterexampleData} (hmin : D.Minimal)
    {q w o b : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A)
    (hoA : o ∈ D.A) (hbA : b ∈ D.A)
    (hcard : 4 < D.A.card) :
    ∃ center ∈ D.A \ ({q, w, o, b} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({q, w, o, b} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  let U : Finset ℝ² := {q, w, o, b}
  have hUsub : U ⊆ D.A := by
    intro x hx
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact hqA
    · exact hwA
    · exact hoA
    · exact hbA
  have hUne : U.Nonempty := ⟨q, by simp [U]⟩
  have hUcard : U.card < D.A.card := by
    have hfour : U.card ≤ 4 := by
      simpa [U] using
        (Finset.card_le_four :
          ({q, w, o, b} : Finset ℝ²).card ≤ 4)
    exact hfour.trans_lt hcard
  simpa only [U] using
    exists_fresh_sharedRadiusPair_or_minimalDeletionCore_of_card_lt
      hmin hUsub hUne hUcard

/-- The immediate consumer for the intended frontier collision.  If `o` and
`b` are already two distinct carrier centers bisecting `q,w`, then a center
outside `{q,w,o,b}` cannot bisect the same pair. -/
theorem fresh_center_not_bisect_saturated_frontierPair
    {D : CounterexampleData} {q w o b center : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A) (hqw : q ≠ w)
    (hoA : o ∈ D.A) (hbA : b ∈ D.A)
    (hob : o ≠ b)
    (hoEq : dist o q = dist o w)
    (hbEq : dist b q = dist b w)
    (hcenterFresh :
      center ∈ D.A \ ({q, w, o, b} : Finset ℝ²)) :
    dist center q ≠ dist center w := by
  intro hcenterEq
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterFresh).1
  have hcenterOff : center ∉ ({q, w, o, b} : Finset ℝ²) :=
    (Finset.mem_sdiff.mp hcenterFresh).2
  have hoc : o ≠ center := by
    intro h
    apply hcenterOff
    simp [← h]
  have hbc : b ≠ center := by
    intro h
    apply hcenterOff
    simp [← h]
  exact false_of_three_carrier_bisector_centers
    hqA hwA hqw hoA hbA hcenterA
    hoEq hbEq hcenterEq hob hoc hbc

/-- Source-faithful frontier application of the global bridge.  On a directed
cross hit, the first apex and the actual `q`-blocker already saturate the
perpendicular bisector of `q,w`.  Minimality therefore produces a center
outside those four named roles whose core outcome cannot simply be another
`q,w` bisector. -/
theorem SurvivorPairRelocationPacket.exists_fresh_nonfrontierCollision_or_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hcard : 4 < D.A.card) :
    ∃ center ∈
        D.A \ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  let b := H.centerAt P.q P.q_mem_A
  have hoA : S.oppApex1 ∈ D.A := oppApex1_mem_A S
  have hbA : b ∈ D.A := by
    simpa [b] using blocker_mem_A H P.q_mem_A
  rcases exists_outside_four_knownPoints_sharedRadiusPair_or_core
      hmin P.q_mem_A P.w_mem_A hoA hbA hcard with
    ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked, houtcome⟩
  have hoEq : dist S.oppApex1 P.q = dist S.oppApex1 P.w :=
    firstApex_dist_eq P
  have hbEq : dist b P.q = dist b P.w := by
    simpa [b] using sourceBlocker_dist_eq_of_crossMembership P hwSupport
  have hcenterNe : dist center P.q ≠ dist center P.w := by
    apply fresh_center_not_bisect_saturated_frontierPair
      P.q_mem_A P.w_mem_A P.q_ne_w hoA hbA
        (by simpa [b] using hqBlocker_ne_first.symm)
      hoEq hbEq
    simpa [b] using hcenterFresh
  exact ⟨center, by simpa [b] using hcenterFresh,
    V, hVne, by simpa [b] using hVsub,
    hVblocked, hcenterNe, houtcome⟩

/-- A singleton minimal-deletion core is a certified pointwise replacement
for the chosen blocker at its unique source.  If another point has a
different radius about the new center, then it is omitted from the installed
exact shell, so deleting that other point preserves K4 at the new blocker.

This is the precise selector-independent content of the singleton arm: it is
not itself contradictory, but it can be fed back into any existing
`CriticalShellSystem` by `overrideAt`. -/
theorem singleton_minimalDeletionCore_installs_cross_survival
    {A V : Finset ℝ²} (H : CriticalShellSystem A)
    {source other center : ℝ²}
    (hsourceA : source ∈ A)
    (K : MinimalDeletionCore A V center)
    (hVeq : V = {source})
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ V) center)
    (hdist : dist center source ≠ dist center other) :
    ∃ (C : CriticalSelectedFourClass A source center),
      ∃ (blocks :
          ¬ HasNEquidistantPointsAt 4 (A.erase source) center),
        ∃ H' : CriticalShellSystem A,
          H' = H.overrideAt C blocks ∧
          H'.centerAt source hsourceA = center ∧
          other ∉
            (H'.selectedAt source hsourceA).toCriticalFourShell.support ∧
          HasNEquidistantPointsAt 4 (A.erase other) center := by
  classical
  have hsourceV : source ∈ V := by
    rw [hVeq]
    simp
  let C : CriticalSelectedFourClass A source center :=
    K.shellAt ⟨source, hsourceV⟩
  have blocks :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center := by
    rw [hVeq, Finset.sdiff_singleton_eq_erase] at hblocked
    exact hblocked
  let H' : CriticalShellSystem A := H.overrideAt C blocks
  have hcenter : H'.centerAt source hsourceA = center := by
    simpa [H'] using H.overrideAt_centerAt C blocks hsourceA
  have hotherNot :
      other ∉
        (H'.selectedAt source hsourceA).toCriticalFourShell.support := by
    intro hother
    apply hdist
    calc
      dist center source = dist (H'.centerAt source hsourceA) source := by
        rw [hcenter]
      _ =
          (H'.selectedAt source hsourceA).toCriticalFourShell.radius :=
        (H'.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
          source
          (H'.selectedAt source hsourceA).toCriticalFourShell.q_mem_support
      _ = dist (H'.centerAt source hsourceA) other :=
        ((H'.selectedAt source hsourceA).toCriticalFourShell.support_eq_radius
          other hother).symm
      _ = dist center other := by rw [hcenter]
  have hsurvivesAtBlocker :
      HasNEquidistantPointsAt 4 (A.erase other)
        (H'.centerAt source hsourceA) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H' hsourceA).2 hotherNot
  have hsurvives :
      HasNEquidistantPointsAt 4 (A.erase other) center := by
    simpa [hcenter] using hsurvivesAtBlocker
  exact ⟨C, blocks, H', rfl, hcenter, hotherNot, hsurvives⟩

/-- Since the fresh center separates the two frontier radii, every singleton
core source has a different radius from at least one of the two frontier
points.  Installing the singleton blocker therefore omits, and survives the
deletion of, at least one frontier point. -/
theorem singleton_minimalDeletionCore_installs_frontier_omission
    {A V : Finset ℝ²} (H : CriticalShellSystem A)
    {source q w center : ℝ²}
    (hsourceA : source ∈ A)
    (K : MinimalDeletionCore A V center)
    (hVeq : V = {source})
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ V) center)
    (hfrontierNe : dist center q ≠ dist center w) :
    ∃ target ∈ ({q, w} : Finset ℝ²),
      ∃ (C : CriticalSelectedFourClass A source center),
        ∃ (blocks :
            ¬ HasNEquidistantPointsAt 4 (A.erase source) center),
          ∃ H' : CriticalShellSystem A,
            H' = H.overrideAt C blocks ∧
            H'.centerAt source hsourceA = center ∧
            target ∉
              (H'.selectedAt source hsourceA).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (A.erase target) center := by
  classical
  by_cases hsourceQ : dist center source = dist center q
  · have hsourceW : dist center source ≠ dist center w := by
      intro hsourceW
      exact hfrontierNe (hsourceQ.symm.trans hsourceW)
    rcases singleton_minimalDeletionCore_installs_cross_survival
        H hsourceA K hVeq hblocked hsourceW with
      ⟨C, blocks, H', hH', hcenter, hwNot, hsurvives⟩
    exact ⟨w, by simp, C, blocks, H', hH',
      hcenter, hwNot, hsurvives⟩
  · rcases singleton_minimalDeletionCore_installs_cross_survival
        H hsourceA K hVeq hblocked hsourceQ with
      ⟨C, blocks, H', hH', hcenter, hqNot, hsurvives⟩
    exact ⟨q, by simp, C, blocks, H', hH',
      hcenter, hqNot, hsurvives⟩

/-- The fully installed singleton output at the live frontier.  Besides the
fresh exact blocker and its omitted frontier target, the structure retains a
rebased copy of the same survivor pair, so no geometric provenance is lost
when the critical-shell selector is changed. -/
structure InstalledSingletonFrontierOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (V : Finset ℝ²) (center : ℝ²) where
  core : MinimalDeletionCore D.A V center
  source : ℝ²
  source_mem_V : source ∈ V
  source_mem_A : source ∈ D.A
  V_eq_singleton : V = {source}
  target : ℝ²
  target_mem_frontier : target ∈ ({P.q, P.w} : Finset ℝ²)
  shell : CriticalSelectedFourClass D.A source center
  blocks :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center
  installedSystem : CriticalShellSystem D.A
  installedSystem_eq : installedSystem = H.overrideAt shell blocks
  installed_centerAt :
    installedSystem.centerAt source source_mem_A = center
  target_not_mem_installed_support :
    target ∉
      (installedSystem.selectedAt source source_mem_A).toCriticalFourShell.support
  target_deletion_survives :
    HasNEquidistantPointsAt 4 (D.A.erase target) center
  rebasedPair : SurvivorPairRelocationPacket D S r installedSystem
  rebased_q_eq : rebasedPair.q = P.q
  rebased_w_eq : rebasedPair.w = P.w

/-- Frontier specialization of the singleton installation theorem at `q`.
The same geometric survivor pair rebases to the modified shell system, and
the old directed `q → w` cross hit is replaced by literal `w`-deletion
survival at the fresh `q`-blocker. -/
theorem SurvivorPairRelocationPacket.install_q_singletonCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hVeq : V = {P.q})
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hcenterNe : dist center P.q ≠ dist center P.w) :
    ∃ (C : CriticalSelectedFourClass D.A P.q center),
      ∃ (blocks :
          ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q) center),
        ∃ H' : CriticalShellSystem D.A,
          H' = H.overrideAt C blocks ∧
          ∃ P' : SurvivorPairRelocationPacket D S r H',
            P'.q = P.q ∧
            P'.w = P.w ∧
            H'.centerAt P.q P.q_mem_A = center ∧
            P.w ∉
              (H'.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.w) center := by
  classical
  rcases singleton_minimalDeletionCore_installs_cross_survival
      H P.q_mem_A K hVeq hblocked hcenterNe with
    ⟨C, blocks, H', hH', hcenter, hwNot, hsurvives⟩
  let P' : SurvivorPairRelocationPacket D S r H' :=
    rebaseSurvivorPairCriticalSystem P H'
  exact ⟨C, blocks, H', hH', P', rfl, rfl,
    hcenter, hwNot, hsurvives⟩

/-- Symmetric frontier specialization at `w`.  A singleton core there
installs the fresh `w`-blocker and forces `q`-deletion survival. -/
theorem SurvivorPairRelocationPacket.install_w_singletonCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    {V : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore D.A V center)
    (hVeq : V = {P.w})
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center)
    (hcenterNe : dist center P.q ≠ dist center P.w) :
    ∃ (C : CriticalSelectedFourClass D.A P.w center),
      ∃ (blocks :
          ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w) center),
        ∃ H' : CriticalShellSystem D.A,
          H' = H.overrideAt C blocks ∧
          ∃ P' : SurvivorPairRelocationPacket D S r H',
            P'.q = P.q ∧
            P'.w = P.w ∧
            H'.centerAt P.w P.w_mem_A = center ∧
            P.q ∉
              (H'.selectedAt P.w P.w_mem_A).toCriticalFourShell.support ∧
            HasNEquidistantPointsAt 4 (D.A.erase P.q) center := by
  classical
  have hreverse : dist center P.w ≠ dist center P.q := by
    intro h
    exact hcenterNe h.symm
  rcases singleton_minimalDeletionCore_installs_cross_survival
      H P.w_mem_A K hVeq hblocked hreverse with
    ⟨C, blocks, H', hH', hcenter, hqNot, hsurvives⟩
  let P' : SurvivorPairRelocationPacket D S r H' :=
    rebaseSurvivorPairCriticalSystem P H'
  exact ⟨C, blocks, H', hH', P', rfl, rfl,
    hcenter, hqNot, hsurvives⟩

/-- Refined source-faithful global bridge.  The raw core arm is split into
exactly two possibilities:

* a genuine core with at least two sources; or
* a singleton core which has already been installed into a modified critical
  shell system and omits at least one of the two frontier points.

Thus singleton cores are no longer an unprocessed escape in the output.
They remain a finite-orbit/incidence obligation rather than an immediate
contradiction. -/
theorem SurvivorPairRelocationPacket.exists_fresh_collision_or_nontrivialCore_or_installedSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hcard : 4 < D.A.card) :
    ∃ center ∈
        D.A \ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            2 ≤ V.card) ∨
          Nonempty (InstalledSingletonFrontierOmission P V center)) := by
  classical
  rcases
      Problem97.ATailGlobalMinimalDeletionCoreScratch.SurvivorPairRelocationPacket.exists_fresh_nonfrontierCollision_or_core
        P hmin hwSupport hqBlocker_ne_first hcard with
    ⟨center, hcenterFresh, V, hVne, hVsub,
      hVblocked, hfrontierNe, hcollision | hcore⟩
  · exact ⟨center, hcenterFresh, V, hVne, hVsub,
      hVblocked, hfrontierNe, Or.inl hcollision⟩
  · rcases hcore with ⟨K⟩
    by_cases hmulti : 2 ≤ V.card
    · exact ⟨center, hcenterFresh, V, hVne, hVsub,
        hVblocked, hfrontierNe, Or.inr (Or.inl ⟨⟨K⟩, hmulti⟩)⟩
    · have hcardPos : 0 < V.card := Finset.card_pos.mpr hVne
      have hcardOne : V.card = 1 := by omega
      rcases Finset.card_eq_one.mp hcardOne with ⟨source, hVeq⟩
      have hsourceV : source ∈ V := by simp [hVeq]
      have hoA : S.oppApex1 ∈ D.A := oppApex1_mem_A S
      have hbA : H.centerAt P.q P.q_mem_A ∈ D.A :=
        blocker_mem_A H P.q_mem_A
      have hrolesSub :
          ({P.q, P.w, S.oppApex1,
            H.centerAt P.q P.q_mem_A} : Finset ℝ²) ⊆ D.A := by
        intro x hx
        simp only [Finset.mem_insert, Finset.mem_singleton] at hx
        rcases hx with rfl | rfl | rfl | rfl
        · exact P.q_mem_A
        · exact P.w_mem_A
        · exact hoA
        · exact hbA
      have hsourceA : source ∈ D.A := hrolesSub (hVsub hsourceV)
      rcases singleton_minimalDeletionCore_installs_frontier_omission
          H hsourceA K hVeq hVblocked hfrontierNe with
        ⟨target, htarget, C, blocks, H', hH',
          hcenter, htargetNot, hsurvives⟩
      let P' : SurvivorPairRelocationPacket D S r H' :=
        rebaseSurvivorPairCriticalSystem P H'
      let installed : InstalledSingletonFrontierOmission P V center :=
        { core := K
          source := source
          source_mem_V := hsourceV
          source_mem_A := hsourceA
          V_eq_singleton := hVeq
          target := target
          target_mem_frontier := htarget
          shell := C
          blocks := blocks
          installedSystem := H'
          installedSystem_eq := hH'
          installed_centerAt := hcenter
          target_not_mem_installed_support := htargetNot
          target_deletion_survives := hsurvives
          rebasedPair := P'
          rebased_q_eq := rfl
          rebased_w_eq := rfl }
      exact ⟨center, hcenterFresh, V, hVne, hVsub,
        hVblocked, hfrontierNe, Or.inr (Or.inr ⟨installed⟩)⟩

/-- The exact four-shells attached to the sources of a minimal deletion core
are pairwise disjoint subsets of the carrier.  Consequently the carrier must
contain at least four points per core source. -/
theorem MinimalDeletionCore.four_mul_card_le_carrier
    {A U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore A U center) :
    4 * U.card ≤ A.card := by
  classical
  let shell : {x : ℝ² // x ∈ U} → Finset ℝ² := fun s =>
    (K.shellAt s).toCriticalFourShell.support
  have hdisjoint :
      ((Finset.univ : Finset {x : ℝ² // x ∈ U}) :
        Set {x : ℝ² // x ∈ U}).PairwiseDisjoint shell := by
    rintro s _hs t _ht hst
    exact K.supports_pairwise_disjoint s t hst
  have hallSubset : (Finset.univ.biUnion shell) ⊆ A := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨s, _hs, hxs⟩
    exact (K.shellAt s).toCriticalFourShell.support_subset_A hxs
  calc
    4 * U.card = ∑ _s : {x : ℝ² // x ∈ U}, 4 := by
      simp [Nat.mul_comm]
    _ = ∑ s : {x : ℝ² // x ∈ U}, (shell s).card := by
      apply Finset.sum_congr rfl
      intro s _hs
      simp [shell, (K.shellAt s).toCriticalFourShell.support_card]
    _ = (Finset.univ.biUnion shell).card := by
      rw [Finset.card_biUnion hdisjoint]
    _ ≤ A.card := Finset.card_le_card hallSubset

/-- A deletion core on a twelve-point carrier has at most three sources. -/
theorem MinimalDeletionCore.card_le_three_of_card_twelve
    {A U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore A U center)
    (hAcard : A.card = 12) :
    U.card ≤ 3 := by
  have hpack :=
    Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.four_mul_card_le_carrier
      K
  omega

/-- A deletion core centered in one closed cap consumes at least two distinct
points outside that cap for every source in the core.  The cap-chain bound
puts at most two points of each exact four-shell in the center's cap, and the
core's shell supports are pairwise disjoint. -/
theorem MinimalDeletionCore.two_mul_card_le_capByIndex_complement
    {U : Finset ℝ²} {center : ℝ²}
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (K : MinimalDeletionCore D.A U center)
    (k : Fin 3)
    (hcenter : center ∈ S.capByIndex k) :
    2 * U.card ≤ (D.A \ S.capByIndex k).card := by
  classical
  let hits : {x : ℝ² // x ∈ U} → Finset ℝ² := fun s =>
    (K.shellAt s).toCriticalFourShell.support \ S.capByIndex k
  have hhitsTwo (s : {x : ℝ² // x ∈ U}) : 2 ≤ (hits s).card := by
    have hinter :
        ((K.shellAt s).toCriticalFourShell.support ∩
          S.capByIndex k).card ≤ 2 := by
      let Krow : SelectedFourClass D.A center :=
        (K.shellAt s).toSelectedFourClass
      have h :=
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex k Krow hcenter
      simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass] using h
    have hsplit := Finset.card_inter_add_card_sdiff
      (K.shellAt s).toCriticalFourShell.support (S.capByIndex k)
    have hfour := (K.shellAt s).toCriticalFourShell.support_card
    change 2 ≤
      ((K.shellAt s).toCriticalFourShell.support \ S.capByIndex k).card
    omega
  have hdisjoint :
      ((Finset.univ : Finset {x : ℝ² // x ∈ U}) :
        Set {x : ℝ² // x ∈ U}).PairwiseDisjoint hits := by
    rintro s _hs t _ht hst
    change Disjoint
      ((K.shellAt s).toCriticalFourShell.support \ S.capByIndex k)
      ((K.shellAt t).toCriticalFourShell.support \ S.capByIndex k)
    have hsupport := K.supports_pairwise_disjoint s t hst
    rw [Finset.disjoint_left] at hsupport ⊢
    intro x hxs hxt
    exact hsupport (Finset.mem_sdiff.mp hxs).1
      (Finset.mem_sdiff.mp hxt).1
  have hallSubset :
      (Finset.univ.biUnion hits) ⊆ D.A \ S.capByIndex k := by
    intro x hx
    rcases Finset.mem_biUnion.mp hx with ⟨s, _hs, hxs⟩
    rcases Finset.mem_sdiff.mp hxs with ⟨hxsSupport, hxsOff⟩
    exact Finset.mem_sdiff.mpr
      ⟨(K.shellAt s).toCriticalFourShell.support_subset_A hxsSupport,
        hxsOff⟩
  have hlower :
      2 * U.card ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card := by
    calc
      2 * U.card = ∑ _s : {x : ℝ² // x ∈ U}, 2 := by
        simp [Nat.mul_comm]
      _ ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card :=
        Finset.sum_le_sum fun s _hs => hhitsTwo s
  calc
    2 * U.card ≤ ∑ s : {x : ℝ² // x ∈ U}, (hits s).card := hlower
    _ = (Finset.univ.biUnion hits).card := by
      rw [Finset.card_biUnion hdisjoint]
    _ ≤ (D.A \ S.capByIndex k).card := Finset.card_le_card hallSubset

/-- The geometric location alternatives for a fresh center known not to be
the first opposite apex.  A carrier point is either another Moser vertex,
expressed as an indexed opposite vertex, or lies in one strict cap interior. -/
def FreshCenterCapLocation
    {A : Finset ℝ²} (S : SurplusCapPacket A) (center : ℝ²) : Prop :=
  (∃ k : Fin 3,
      S.oppositeVertexByIndex k = center ∧
      S.oppositeVertexByIndex k ≠ S.oppApex1) ∨
    ∃ k : Fin 3, center ∈ S.capInteriorByIndex k

theorem freshCenterCapLocation_of_mem_ne_first
    {A : Finset ℝ²} (S : SurplusCapPacket A) {center : ℝ²}
    (hcenterA : center ∈ A)
    (hcenterNeFirst : center ≠ S.oppApex1) :
    FreshCenterCapLocation S center := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    hcenterVerts | hcenterInterior
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcenterVerts with
      hsurplus | hopp1 | hopp2
    · exact Or.inl ⟨S.surplusIdx, hsurplus.symm, fun heq =>
        hcenterNeFirst (hsurplus.trans heq)⟩
    · exact Or.inl ⟨S.oppIndex1, hopp1.symm, fun heq =>
        hcenterNeFirst (hopp1.trans heq)⟩
    · exact Or.inl ⟨S.oppIndex2, hopp2.symm, fun heq =>
        hcenterNeFirst (hopp2.trans heq)⟩
  · exact Or.inr hcenterInterior

/-- The geometric packing data forced by a multi-source core at a fresh
four-role center.  A strict-cap center consumes two complement points per
source.  A Moser center forces the cap opposite that center to have at least
six points. -/
def LocatedCorePacking
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (V : Finset ℝ²) (center : ℝ²) : Prop :=
  (∃ k : Fin 3,
      center ∈ S.capInteriorByIndex k ∧
      2 * V.card ≤ (D.A \ S.capByIndex k).card) ∨
    ∃ k : Fin 3,
      S.oppositeVertexByIndex k = center ∧
      S.oppositeVertexByIndex k ≠ S.oppApex1 ∧
      6 ≤ (S.capByIndex k).card

theorem MinimalDeletionCore.locatedCorePacking
    {V : Finset ℝ²} {center : ℝ²}
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (K : MinimalDeletionCore D.A V center)
    (hlocation : FreshCenterCapLocation S center)
    (hVtwo : 2 ≤ V.card) :
    LocatedCorePacking S V center := by
  rcases hlocation with ⟨k, hcenterEq, hnotFirst⟩ | ⟨k, hcenterInterior⟩
  · exact Or.inr ⟨k, hcenterEq, hnotFirst,
      K.capByIndex_card_ge_six D S k hcenterEq hVtwo⟩
  · have hcenterCap : center ∈ S.capByIndex k :=
      S.capInteriorByIndex_subset_capByIndex k hcenterInterior
    have hpack :=
      Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.two_mul_card_le_capByIndex_complement
        D S K k hcenterCap
    exact Or.inl ⟨k, hcenterInterior, hpack⟩

/-- In a `555`-type profile, where every cap has size at most five, the Moser
center arm of `LocatedCorePacking` is impossible.  The core center must lie in
a strict cap interior and obey complement packing there. -/
theorem LocatedCorePacking.strict_of_all_cap_card_le_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {V : Finset ℝ²} {center : ℝ²}
    (hpacking : LocatedCorePacking S V center)
    (hallCaps : ∀ k : Fin 3, (S.capByIndex k).card ≤ 5) :
    ∃ k : Fin 3,
      center ∈ S.capInteriorByIndex k ∧
      2 * V.card ≤ (D.A \ S.capByIndex k).card := by
  rcases hpacking with hstrict | ⟨k, _hcenter, _hnotFirst, hsix⟩
  · exact hstrict
  · have hfive := hallCaps k
    omega

/-- In a profile whose cap sizes are all at most six, the only non-strict
location allowed by `LocatedCorePacking` is the Moser vertex opposite a cap
of exact size six.  This is the location split used by profile `654`. -/
theorem LocatedCorePacking.strict_or_moser_cap_eq_six_of_all_cap_card_le_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {V : Finset ℝ²} {center : ℝ²}
    (hpacking : LocatedCorePacking S V center)
    (hallCaps : ∀ k : Fin 3, (S.capByIndex k).card ≤ 6) :
    (∃ k : Fin 3,
        center ∈ S.capInteriorByIndex k ∧
        2 * V.card ≤ (D.A \ S.capByIndex k).card) ∨
      ∃ k : Fin 3,
        S.oppositeVertexByIndex k = center ∧
        S.oppositeVertexByIndex k ≠ S.oppApex1 ∧
        (S.capByIndex k).card = 6 := by
  rcases hpacking with hstrict | ⟨k, hcenter, hnotFirst, hsix⟩
  · exact Or.inl hstrict
  · have hupper := hallCaps k
    exact Or.inr ⟨k, hcenter, hnotFirst, by omega⟩

/-- Four-role bridge with a complete center-location split.  Compared with
deleting all Moser vertices, this keeps the possible collision pairs confined
to `{q,w,firstApex,qBlocker}`.  The multi-source core arm records the sharp
geometric consequence appropriate to whichever location the fresh center
occupies. -/
theorem SurvivorPairRelocationPacket.exists_fourRoleFresh_collision_or_locatedCore_or_installedSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hcard : 4 < D.A.card) :
    ∃ center ∈
        D.A \ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ({P.q, P.w, S.oppApex1,
          H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        FreshCenterCapLocation S center ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            2 ≤ V.card ∧
            4 * V.card ≤ D.A.card ∧
            LocatedCorePacking S V center) ∨
          Nonempty (InstalledSingletonFrontierOmission P V center)) := by
  rcases
      Problem97.ATailGlobalMinimalDeletionCoreScratch.SurvivorPairRelocationPacket.exists_fresh_collision_or_nontrivialCore_or_installedSingleton
        P hmin hwSupport hqBlocker_ne_first hcard with
    ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked, hfrontierNe,
      houtcome⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterFresh).1
  have hcenterNeFirst : center ≠ S.oppApex1 := by
    intro hcenterEq
    exact (Finset.mem_sdiff.mp hcenterFresh).2 (by simp [hcenterEq])
  have hlocation : FreshCenterCapLocation S center :=
    freshCenterCapLocation_of_mem_ne_first S hcenterA hcenterNeFirst
  rcases houtcome with hcollision | hmulti | hsingleton
  · exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
      hfrontierNe, hlocation, Or.inl hcollision⟩
  · rcases hmulti with ⟨⟨K⟩, hVtwo⟩
    have hglobalPack : 4 * V.card ≤ D.A.card :=
      Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.four_mul_card_le_carrier
        K
    have hlocatedPack : LocatedCorePacking S V center :=
      Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.locatedCorePacking
        D S K hlocation hVtwo
    exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
      hfrontierNe, hlocation,
      Or.inr (Or.inl ⟨⟨K⟩, hVtwo, hglobalPack, hlocatedPack⟩)⟩
  · exact ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked,
      hfrontierNe, hlocation, Or.inr (Or.inr hsingleton)⟩

/-- Strict-cap-localized form of the refined bridge.  Delete the two frontier
points, the current `q`-blocker, and all three Moser vertices.  The deletion
set has cardinality at most six, so minimality supplies a fresh blocker on a
carrier of cardinality at least seven.  Since every Moser vertex was deleted,
the fresh center lies in the strict interior of one indexed cap.

The two already-known `q,w` bisectors are still among the deleted roles: the
first apex is one of the Moser vertices, while the actual `q`-blocker is named
separately.  Hence the fresh center cannot bisect `q,w`, and singleton cores
can again be installed as an exact blocker omitting one frontier target. -/
theorem SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hcard : 6 < D.A.card) :
    ∃ center ∈
        D.A \ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)),
      (∃ k : Fin 3, center ∈ S.capInteriorByIndex k) ∧
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            2 ≤ V.card ∧ 4 * V.card ≤ D.A.card) ∨
          Nonempty (InstalledSingletonFrontierOmission P V center)) := by
  classical
  let b := H.centerAt P.q P.q_mem_A
  let R : Finset ℝ² := {P.q, P.w, b}
  let U : Finset ℝ² := R ∪ S.triangle.verts
  have hbA : b ∈ D.A := by
    simpa [b] using blocker_mem_A H P.q_mem_A
  have hRsub : R ⊆ D.A := by
    intro x hx
    simp only [R, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact P.q_mem_A
    · exact P.w_mem_A
    · exact hbA
  have hUsub : U ⊆ D.A :=
    Finset.union_subset hRsub S.triangle.verts_subset
  have hUne : U.Nonempty := ⟨P.q, by simp [U, R]⟩
  have hRcard : R.card ≤ 3 := by
    simpa [R] using triple_card_le_three P.q P.w b
  have hUcard : U.card < D.A.card := by
    have hunion : U.card ≤ R.card + S.triangle.verts.card := by
      simpa [U] using Finset.card_union_le R S.triangle.verts
    rw [S.triangle.verts_card] at hunion
    omega
  rcases exists_fresh_sharedRadiusPair_or_minimalDeletionCore_of_card_lt
      hmin hUsub hUne hUcard with
    ⟨center, hcenterFresh, V, hVne, hVsub, hVblocked, houtcome⟩
  have hcenterA : center ∈ D.A :=
    (Finset.mem_sdiff.mp hcenterFresh).1
  have hcenterNotU : center ∉ U :=
    (Finset.mem_sdiff.mp hcenterFresh).2
  have hcenterNotVerts : center ∉ S.triangle.verts := by
    intro hcenterVerts
    exact hcenterNotU (Finset.mem_union.mpr (Or.inr hcenterVerts))
  have hcenterCap : ∃ k : Fin 3, center ∈ S.capInteriorByIndex k := by
    rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
      hcenterVerts | hcenterInterior
    · exact False.elim (hcenterNotVerts hcenterVerts)
    · exact hcenterInterior
  have hcenterFreshFour :
      center ∈ D.A \ ({P.q, P.w, S.oppApex1, b} : Finset ℝ²) := by
    refine Finset.mem_sdiff.mpr ⟨hcenterA, ?_⟩
    intro hcenterFour
    apply hcenterNotU
    simp only [Finset.mem_insert, Finset.mem_singleton] at hcenterFour
    rcases hcenterFour with hq | hw | happ | hb
    · exact Finset.mem_union.mpr (Or.inl (by simp [R, hq]))
    · exact Finset.mem_union.mpr (Or.inl (by simp [R, hw]))
    · exact Finset.mem_union.mpr
        (Or.inr (by simpa [happ] using oppApex1_mem_triangle_verts S))
    · exact Finset.mem_union.mpr (Or.inl (by simp [R, hb]))
  have hoA : S.oppApex1 ∈ D.A := oppApex1_mem_A S
  have hoEq : dist S.oppApex1 P.q = dist S.oppApex1 P.w :=
    firstApex_dist_eq P
  have hbEq : dist b P.q = dist b P.w := by
    simpa [b] using sourceBlocker_dist_eq_of_crossMembership P hwSupport
  have hfrontierNe : dist center P.q ≠ dist center P.w := by
    exact fresh_center_not_bisect_saturated_frontierPair
      P.q_mem_A P.w_mem_A P.q_ne_w hoA hbA
      (by simpa [b] using hqBlocker_ne_first.symm)
      hoEq hbEq hcenterFreshFour
  have hVsubA : V ⊆ D.A := hVsub.trans hUsub
  have hrefined :
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        (Nonempty (MinimalDeletionCore D.A V center) ∧
          2 ≤ V.card ∧ 4 * V.card ≤ D.A.card) ∨
        Nonempty (InstalledSingletonFrontierOmission P V center)) := by
    rcases houtcome with hcollision | hcore
    · exact Or.inl hcollision
    · rcases hcore with ⟨K⟩
      by_cases hmulti : 2 ≤ V.card
      · have hpack : 4 * V.card ≤ D.A.card :=
          Problem97.ATailGlobalMinimalDeletionCoreScratch.MinimalDeletionCore.four_mul_card_le_carrier
            K
        exact Or.inr (Or.inl ⟨⟨K⟩, hmulti, hpack⟩)
      · have hcardPos : 0 < V.card := Finset.card_pos.mpr hVne
        have hcardOne : V.card = 1 := by omega
        rcases Finset.card_eq_one.mp hcardOne with ⟨source, hVeq⟩
        have hsourceV : source ∈ V := by simp [hVeq]
        have hsourceA : source ∈ D.A := hVsubA hsourceV
        rcases singleton_minimalDeletionCore_installs_frontier_omission
            H hsourceA K hVeq hVblocked hfrontierNe with
          ⟨target, htarget, C, blocks, H', hH',
            hinstalledCenter, htargetNot, hsurvives⟩
        let P' : SurvivorPairRelocationPacket D S r H' :=
          rebaseSurvivorPairCriticalSystem P H'
        let installed : InstalledSingletonFrontierOmission P V center :=
          { core := K
            source := source
            source_mem_V := hsourceV
            source_mem_A := hsourceA
            V_eq_singleton := hVeq
            target := target
            target_mem_frontier := htarget
            shell := C
            blocks := blocks
            installedSystem := H'
            installedSystem_eq := hH'
            installed_centerAt := hinstalledCenter
            target_not_mem_installed_support := htargetNot
            target_deletion_survives := hsurvives
            rebasedPair := P'
            rebased_q_eq := rfl
            rebased_w_eq := rfl }
        exact Or.inr (Or.inr ⟨installed⟩)
  exact ⟨center, by simpa [U, R, b] using hcenterFresh,
    hcenterCap, V, hVne, by simpa [U, R, b] using hVsub,
    hVblocked, hfrontierNe, hrefined⟩

/-- The cardinality-twelve numerical specialization, covering both `555` and
`654`.  Pairwise-disjoint exact four-shells rule out four-source cores before
any cap-size information is used.  The strict-cap bridge leaves only:

* a shared-radius collision among the prescribed roles;
* a genuine deletion core with exactly two or three sources; or
* an already-installed singleton blocker omitting one frontier point.

Thus the non-singleton arm is a bounded finite role-classification problem,
not an unbounded core. -/
theorem SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_twoThreeCore_or_installedSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hAcard : D.A.card = 12) :
    ∃ center ∈
        D.A \ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)),
      ∃ k : Fin 3, center ∈ S.capInteriorByIndex k ∧
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            2 ≤ V.card ∧ V.card ≤ 3) ∨
          Nonempty (InstalledSingletonFrontierOmission P V center)) := by
  have hcard : 6 < D.A.card := by omega
  rcases
      Problem97.ATailGlobalMinimalDeletionCoreScratch.SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
        P hmin hwSupport hqBlocker_ne_first hcard with
    ⟨center, hcenterFresh, ⟨k, hcenterInterior⟩,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      hcollision | hmulti | hsingleton⟩
  · exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe, Or.inl hcollision⟩
  · rcases hmulti with ⟨⟨K⟩, hVtwo, hpack⟩
    have hVthree : V.card ≤ 3 := by omega
    exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      Or.inr (Or.inl ⟨⟨K⟩, hVtwo, hVthree⟩)⟩
  · exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      Or.inr (Or.inr hsingleton)⟩

/-- The cardinality-eleven numerical specialization, relevant to profile
`554`.  Two disjoint exact four-shells fit, but three would require twelve
carrier points, so the genuine core arm has exactly two sources. -/
theorem SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_twoSourceCore_or_installedSingleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hmin : D.Minimal)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hqBlocker_ne_first :
      H.centerAt P.q P.q_mem_A ≠ S.oppApex1)
    (hAcard : D.A.card = 11) :
    ∃ center ∈
        D.A \ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)),
      ∃ k : Fin 3, center ∈ S.capInteriorByIndex k ∧
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ ((({P.q, P.w, H.centerAt P.q P.q_mem_A} : Finset ℝ²) ∪
          S.triangle.verts)) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        dist center P.q ≠ dist center P.w ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            V.card = 2) ∨
          Nonempty (InstalledSingletonFrontierOmission P V center)) := by
  have hcard : 6 < D.A.card := by omega
  rcases
      Problem97.ATailGlobalMinimalDeletionCoreScratch.SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
        P hmin hwSupport hqBlocker_ne_first hcard with
    ⟨center, hcenterFresh, ⟨k, hcenterInterior⟩,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      hcollision | hmulti | hsingleton⟩
  · exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe, Or.inl hcollision⟩
  · rcases hmulti with ⟨hcore, hVtwo, hpack⟩
    have hVeq : V.card = 2 := by omega
    exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      Or.inr (Or.inl ⟨hcore, hVeq⟩)⟩
  · exact ⟨center, hcenterFresh, k, hcenterInterior,
      V, hVne, hVsub, hVblocked, hfrontierNe,
      Or.inr (Or.inr hsingleton)⟩

#print axioms not_hasNEquidistantProperty_of_nonempty_proper_subset
#print axioms exists_local_blocker_of_not_global_K4
#print axioms exists_cardMinimal_blocking_subdeletion
#print axioms exists_global_cardMinimal_blocking_subdeletion
#print axioms exists_fresh_sharedRadiusPair_or_minimalDeletionCore
#print axioms exists_fresh_sharedRadiusPair_or_minimalDeletionCore_of_card_lt
#print axioms exists_outside_four_knownPoints_sharedRadiusPair_or_core
#print axioms fresh_center_not_bisect_saturated_frontierPair
#print axioms SurvivorPairRelocationPacket.exists_fresh_nonfrontierCollision_or_core
#print axioms singleton_minimalDeletionCore_installs_cross_survival
#print axioms singleton_minimalDeletionCore_installs_frontier_omission
#print axioms SurvivorPairRelocationPacket.install_q_singletonCore
#print axioms SurvivorPairRelocationPacket.install_w_singletonCore
#print axioms SurvivorPairRelocationPacket.exists_fresh_collision_or_nontrivialCore_or_installedSingleton
#print axioms MinimalDeletionCore.four_mul_card_le_carrier
#print axioms MinimalDeletionCore.card_le_three_of_card_twelve
#print axioms MinimalDeletionCore.two_mul_card_le_capByIndex_complement
#print axioms freshCenterCapLocation_of_mem_ne_first
#print axioms MinimalDeletionCore.locatedCorePacking
#print axioms LocatedCorePacking.strict_of_all_cap_card_le_five
#print axioms LocatedCorePacking.strict_or_moser_cap_eq_six_of_all_cap_card_le_six
#print axioms SurvivorPairRelocationPacket.exists_fourRoleFresh_collision_or_locatedCore_or_installedSingleton
#print axioms SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_nontrivialCore_or_installedSingleton
#print axioms SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_twoThreeCore_or_installedSingleton
#print axioms SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_twoSourceCore_or_installedSingleton

end ATailGlobalMinimalDeletionCoreScratch
end Problem97
