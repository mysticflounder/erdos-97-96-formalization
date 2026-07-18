/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalMutualPairCloser
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Late critical-system choice on the equal-blocker mutual arm

This scratch module tests whether `CriticalShellSystem.overrideAt` and the
production rebase ladder can choose a favorable critical system after the
equal-blocker pair has been found.

The result is an exact selector obstruction.  Saturating the existing common
critical shell merely assigns the same old blocker to every source in that
shell.  A pointwise override at a genuinely new center contains both fiber
sources only if the prescribed shell already contains them, hence only if the
new center is already equidistant from the pair.  Finally, a nontrivial
`MinimalDeletionCore` cannot be installed pointwise at any one of its members:
another disjoint exact shell survives that deletion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailGlobalMutualFavorableSystemChoiceScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailGlobalMutualPairCloserScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Every member of a chosen exact critical support is itself deletion
critical at the same blocker.  Thus the support can legally be installed at
all four of its sources by `overrideExactSelectedClass`. -/
theorem no_deletion_survival_at_blocker_of_mem_selectedSupport
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z : ℝ²} (hsource : source ∈ A)
    (hz : z ∈
      (H.selectedAt source hsource).toCriticalFourShell.support) :
    ¬ HasNEquidistantPointsAt 4 (A.erase z)
      (H.centerAt source hsource) := by
  intro hsurvives
  exact
    ((cross_deletion_survives_iff_not_mem_selected_support H hsource).mp
      hsurvives) hz

private theorem selectedClass_eq_selectedSupport
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    SelectedClass A (H.centerAt source hsource)
        (H.selectedAt source hsource).toCriticalFourShell.radius =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  simpa only [SelectedClass] using
    (H.selectedAt source hsource).toCriticalFourShell.support_eq.symm

/-- Install the current exact critical class at all four of its members.
This is the strongest selector change available without first producing a
new critical shell. -/
noncomputable def saturateCriticalSupportSystem
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) :
    CriticalShellSystem A := by
  let K := (H.selectedAt source hsource).toCriticalFourShell
  apply H.overrideExactSelectedClass
    (Finset.mem_erase.mp K.center_mem).2 K.radius_pos
  · rw [selectedClass_eq_selectedSupport H hsource]
    exact K.support_card
  · intro z hzClass
    apply no_deletion_survival_at_blocker_of_mem_selectedSupport H hsource
    rw [← selectedClass_eq_selectedSupport H hsource]
    exact hzClass

/-- Saturation does not create a new center: every source in the old support
is assigned the old common blocker. -/
theorem saturateCriticalSupportSystem_centerAt
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z : ℝ²} (hsource : source ∈ A) (hzA : z ∈ A)
    (hz : z ∈
      (H.selectedAt source hsource).toCriticalFourShell.support) :
    (saturateCriticalSupportSystem H hsource).centerAt z hzA =
      H.centerAt source hsource := by
  let K := (H.selectedAt source hsource).toCriticalFourShell
  apply H.overrideExactSelectedClass_centerAt
      (Finset.mem_erase.mp K.center_mem).2 K.radius_pos
  · rw [selectedClass_eq_selectedSupport H hsource]
    exact K.support_card
  · intro w hwClass
    apply no_deletion_survival_at_blocker_of_mem_selectedSupport H hsource
    rw [← selectedClass_eq_selectedSupport H hsource]
    exact hwClass
  · rw [selectedClass_eq_selectedSupport H hsource]
    exact hz

private theorem selectedFourClass_transport_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (hcenter : center₁ = center₂)
    (C : SelectedFourClass A center₂) :
    (hcenter.symm ▸ C).support = C.support := by
  cases hcenter
  rfl

/-- The row selected at the overridden source is exactly the prescribed
critical class.  Pointwise override changes a selector; it does not add any
new support incidence to the supplied class. -/
theorem overrideAt_selectedSupport_eq_prescribed
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center : ℝ²} (hsource : source ∈ A)
    (C : CriticalSelectedFourClass A source center)
    (blocks : ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  let H' := H.overrideAt C blocks
  have hcenter : H'.centerAt source hsource = center := by
    simpa only [H'] using H.overrideAt_centerAt C blocks hsource
  let K : SelectedFourClass A (H'.centerAt source hsource) :=
    hcenter.symm ▸ C.toSelectedFourClass
  have hsupport := H'.selectedFourClass_support_eq_shell source hsource K
  calc
    (H'.selectedAt source hsource).toCriticalFourShell.support = K.support :=
      hsupport.symm
    _ = C.toCriticalFourShell.support := by
      exact selectedFourClass_transport_support hcenter C.toSelectedFourClass

/-- If a pointwise override hits two points, the prescribed center was
already equidistant from them before the selector was changed. -/
theorem overrideAt_pairHit_forces_equidistant
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center x y : ℝ²} (hsource : source ∈ A)
    (C : CriticalSelectedFourClass A source center)
    (blocks : ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hx : x ∈
      ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support)
    (hy : y ∈
      ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support) :
    dist center x = dist center y := by
  rw [overrideAt_selectedSupport_eq_prescribed H hsource C blocks] at hx hy
  exact
    C.toCriticalFourShell.support_eq_radius x hx |>.trans
      (C.toCriticalFourShell.support_eq_radius y hy).symm

/-- Conversely, if the proposed new center separates the two points, its
pointwise override necessarily misses at least one of them. -/
theorem overrideAt_misses_pair_of_dist_ne
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center x y : ℝ²} (hsource : source ∈ A)
    (C : CriticalSelectedFourClass A source center)
    (blocks : ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hdist : dist center x ≠ dist center y) :
    x ∉
        ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support ∨
      y ∉
        ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support := by
  by_cases hx : x ∈
      ((H.overrideAt C blocks).selectedAt source hsource).toCriticalFourShell.support
  · right
    intro hy
    exact hdist (overrideAt_pairHit_forces_equidistant
      H hsource C blocks hx hy)
  · exact Or.inl hx

/-- Another member of a nontrivial minimal-deletion core supplies a complete
exact shell after the first member is erased. -/
theorem minimalDeletionCore_survives_erase_of_other_source
    {A U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore A U center)
    (source other : {x : ℝ² // x ∈ U}) (hne : source ≠ other) :
    HasNEquidistantPointsAt 4 (A.erase source.1) center := by
  let T := (K.shellAt other).toCriticalFourShell
  have hsourceNot : source.1 ∉ T.support := by
    intro hsourceT
    have hdisjoint := K.supports_pairwise_disjoint source other hne
    exact Finset.disjoint_left.mp hdisjoint
      (K.shellAt source).toCriticalFourShell.q_mem_support hsourceT
  refine ⟨T.radius, T.radius_pos, ?_⟩
  have hselectedEq : SelectedClass A center T.radius = T.support := by
    simpa only [SelectedClass] using T.support_eq.symm
  have hcard : (SelectedClass (A.erase source.1) center T.radius).card = 4 := by
    rw [selectedClass_erase_eq, hselectedEq]
    have herase : T.support.erase source.1 = T.support :=
      Finset.erase_eq_self.mpr hsourceNot
    rw [herase, T.support_card]
  simpa only [SelectedClass] using hcard.ge

/-- Hence no member of a nontrivial minimal-deletion core can be installed
by `overrideAt` at the core center: the required blocker hypothesis is false.
Only a singleton core can reach the pointwise override API. -/
theorem minimalDeletionCore_no_pointwise_override_of_other_source
    {A U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore A U center)
    (source other : {x : ℝ² // x ∈ U}) (hne : source ≠ other)
    (blocks : ¬ HasNEquidistantPointsAt 4 (A.erase source.1) center) : False :=
  blocks (minimalDeletionCore_survives_erase_of_other_source K source other hne)

/-- Applying the production global-minimal-deletion theorem to the two
equal-blocker sources has an exact selector split.  Either it already returns
a co-radial pair, or its core is a singleton, or a second core shell survives
the proposed pointwise deletion and makes `overrideAt` unavailable. -/
theorem equalBlocker_globalMinimalDeletion_pairSelectorSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    ∃ center ∈
        D.A \
          ({Q.criticalFiber.source₁.1,
            Q.criticalFiber.source₂.1} : Finset ℝ²),
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆
          ({Q.criticalFiber.source₁.1,
            Q.criticalFiber.source₂.1} : Finset ℝ²) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        (dist center Q.criticalFiber.source₁.1 =
            dist center Q.criticalFiber.source₂.1 ∨
          (Nonempty (MinimalDeletionCore D.A V center) ∧
            (V.card = 1 ∨
              ∃ source other : {x : ℝ² // x ∈ V},
                source ≠ other ∧
                  HasNEquidistantPointsAt 4
                    (D.A.erase source.1) center))) := by
  let P := Q.criticalFiber
  let U : Finset ℝ² := {P.source₁.1, P.source₂.1}
  have hUsub : U ⊆ D.A := by
    intro x hx
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact P.source₁.2
    · exact P.source₂.2
  have hUne : U.Nonempty := ⟨P.source₁.1, by simp [U]⟩
  have hcommonNotSource₁ :
      H.centerAt P.source₁.1 P.source₁.2 ≠ P.source₁.1 := by
    intro h
    apply
      (H.selectedAt P.source₁.1
        P.source₁.2).toCriticalFourShell.center_not_mem_support
    simpa only [h] using
      (H.selectedAt P.source₁.1
        P.source₁.2).toCriticalFourShell.q_mem_support
  have hcommonNotSource₂ :
      H.centerAt P.source₁.1 P.source₁.2 ≠ P.source₂.1 := by
    intro h
    apply
      (H.selectedAt P.source₁.1
        P.source₁.2).toCriticalFourShell.center_not_mem_support
    simpa only [h] using P.source₂_mem_commonSupport
  have hremaining : (D.A \ U).Nonempty := by
    refine ⟨H.centerAt P.source₁.1 P.source₁.2,
      Finset.mem_sdiff.mpr ⟨P.commonBlocker_mem_A, ?_⟩⟩
    simp only [U, Finset.mem_insert, Finset.mem_singleton, not_or]
    exact ⟨hcommonNotSource₁, hcommonNotSource₂⟩
  rcases ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      R.minimal hUsub hUne hremaining with
    ⟨center, hcenter, V, hVne, hVsub, hblocked, hcollision | hcore⟩
  · rcases hcollision with
      ⟨first, hfirstV, second, hsecondV, hne, heq⟩
    have hfirstU := hVsub hfirstV
    have hsecondU := hVsub hsecondV
    simp only [U, Finset.mem_insert, Finset.mem_singleton] at hfirstU hsecondU
    have hpairEq :
        dist center P.source₁.1 = dist center P.source₂.1 := by
      rcases hfirstU with hfirst | hfirst <;>
        rcases hsecondU with hsecond | hsecond
      · exact (hne (hfirst.trans hsecond.symm)).elim
      · simpa only [hfirst, hsecond] using heq
      · simpa only [hfirst, hsecond] using heq.symm
      · exact (hne (hfirst.trans hsecond.symm)).elim
    exact ⟨center, by simpa only [U, P] using hcenter,
      V, hVne, by simpa only [U, P] using hVsub,
      hblocked, Or.inl (by simpa only [P] using hpairEq)⟩
  · rcases hcore with ⟨K⟩
    refine ⟨center, by simpa only [U, P] using hcenter,
      V, hVne, by simpa only [U, P] using hVsub,
      hblocked, Or.inr ⟨⟨K⟩, ?_⟩⟩
    by_cases hcard : V.card = 1
    · exact Or.inl hcard
    · right
      have hone : 1 < V.card := by
        have hpos : 0 < V.card := Finset.card_pos.mpr hVne
        omega
      rcases Finset.one_lt_card.mp hone with ⟨source, hsource, other, hother, hne⟩
      let source' : {x : ℝ² // x ∈ V} := ⟨source, hsource⟩
      let other' : {x : ℝ² // x ∈ V} := ⟨other, hother⟩
      have hne' : source' ≠ other' := by
        intro h
        exact hne (congrArg Subtype.val h)
      exact ⟨source', other', hne',
        minimalDeletionCore_survives_erase_of_other_source
          K source' other' hne'⟩

/-- A genuinely new pointwise blocker installed at the first fiber source
destroys the old equal-blocker fiber.  Rebase preserves the geometric parent,
but it cannot preserve this source pair as a critical fiber. -/
theorem equalBlocker_override_source₁_newCenter_breaks_fiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    {center : ℝ²}
    (C : CriticalSelectedFourClass D.A Q.criticalFiber.source₁.1 center)
    (blocks : ¬ HasNEquidistantPointsAt 4
      (D.A.erase Q.criticalFiber.source₁.1) center)
    (hnew : center ≠
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2) :
    let H' := H.overrideAt C blocks
    H'.blockerVertex Q.criticalFiber.source₁ ≠
      H'.blockerVertex Q.criticalFiber.source₂ := by
  dsimp only
  intro heq
  have hnewCenter := H.overrideAt_centerAt
    C blocks Q.criticalFiber.source₁.2
  have hotherCenter := H.overrideAt_centerAt_of_ne
    C blocks Q.criticalFiber.source₂.2 Q.criticalFiber.source_points_ne.symm
  have heqCenters :
      (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 =
        (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 := by
    simpa only [CriticalShellSystem.blockerVertex] using congrArg Subtype.val heq
  have holdCenters :
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 =
        H.centerAt Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 := by
    simpa only [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.criticalFiber.blockers_eq
  apply hnew
  calc
    center =
        (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 :=
      hnewCenter.symm
    _ = (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 :=
      heqCenters
    _ = H.centerAt Q.criticalFiber.source₂.1
          Q.criticalFiber.source₂.2 := hotherCenter
    _ = H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2 := holdCenters.symm

/-- Symmetric obstruction at the second fiber source. -/
theorem equalBlocker_override_source₂_newCenter_breaks_fiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    {center : ℝ²}
    (C : CriticalSelectedFourClass D.A Q.criticalFiber.source₂.1 center)
    (blocks : ¬ HasNEquidistantPointsAt 4
      (D.A.erase Q.criticalFiber.source₂.1) center)
    (hnew : center ≠
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2) :
    let H' := H.overrideAt C blocks
    H'.blockerVertex Q.criticalFiber.source₁ ≠
      H'.blockerVertex Q.criticalFiber.source₂ := by
  dsimp only
  intro heq
  have hnewCenter := H.overrideAt_centerAt
    C blocks Q.criticalFiber.source₂.2
  have hotherCenter := H.overrideAt_centerAt_of_ne
    C blocks Q.criticalFiber.source₁.2 Q.criticalFiber.source_points_ne
  have heqCenters :
      (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 =
        (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 := by
    simpa only [CriticalShellSystem.blockerVertex] using congrArg Subtype.val heq
  have holdCenters :
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 =
        H.centerAt Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 := by
    simpa only [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.criticalFiber.blockers_eq
  apply hnew
  calc
    center =
        (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₂.1 Q.criticalFiber.source₂.2 :=
      hnewCenter.symm
    _ = (H.overrideAt C blocks).centerAt
          Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 :=
      heqCenters.symm
    _ = H.centerAt Q.criticalFiber.source₁.1
          Q.criticalFiber.source₁.2 := hotherCenter

/-- Saturating the equal-blocker shell assigns the old common blocker to
every one of its four sources.  It therefore cannot manufacture the distinct
second center required by `SameCapCollisionPairCore`, nor the distinct `A,X`
roles required by `OrderedCrossRowCore`. -/
theorem equalBlocker_saturation_stutters_on_commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    {z : ℝ²} (hzA : z ∈ D.A)
    (hz : z ∈
      (H.selectedAt Q.criticalFiber.source₁.1
        Q.criticalFiber.source₁.2).toCriticalFourShell.support) :
    (saturateCriticalSupportSystem H Q.criticalFiber.source₁.2).centerAt z hzA =
      H.centerAt Q.criticalFiber.source₁.1 Q.criticalFiber.source₁.2 := by
  exact saturateCriticalSupportSystem_centerAt
    H Q.criticalFiber.source₁.2 hzA hz

/-- Critical-system rebase does preserve the full parent, and the exact-five
relation can be rebuilt at the saturated selector.  Simultaneously, every
old common-support source still maps to the old common blocker.  Thus this
late-choice operation changes the quantifier index but supplies no terminal
second center for the old equal-blocker fiber. -/
theorem equalBlocker_saturation_rebuilds_relation_but_not_secondCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M) :
    let H' := saturateCriticalSupportSystem H Q.criticalFiber.source₁.2
    let L' := rebaseFrontierLargeOppositeCapsBiApexRobustResidual L H'
    (Nonempty (FullParentExactFiveMutualData L' profile) ∨
        ∃ continuation :
            LargeCapUniqueFiveTwoCommonDeletionSources D S H' profile,
          Nonempty (FullParentExactFiveAllReverseData L' profile continuation)) ∧
      ∀ (z : ℝ²) (hzA : z ∈ D.A),
        z ∈
            (H.selectedAt Q.criticalFiber.source₁.1
              Q.criticalFiber.source₁.2).toCriticalFourShell.support →
          H'.centerAt z hzA =
            H.centerAt Q.criticalFiber.source₁.1
              Q.criticalFiber.source₁.2 := by
  dsimp only
  constructor
  · exact nonempty_mutualOmissionPair_or_fullParentExactFiveAllReverseData
      (rebaseFrontierLargeOppositeCapsBiApexRobustResidual L
        (saturateCriticalSupportSystem H Q.criticalFiber.source₁.2)) profile
  · intro z hzA hz
    exact equalBlocker_saturation_stutters_on_commonSupport Q hzA hz

/-- Exact obstruction for a genuinely new pointwise selector on the
equal-blocker arm.  If the installed row contains both fiber sources, then
the proposed center already supplies the missing two-center metric equality.
`overrideAt` and rebase do not derive that equality. -/
theorem equalBlocker_lateOverride_pairHit_forces_missingEquality
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : FullParentExactFiveMutualData L profile}
    (Q : FullParentMutualEqualBlockerShell M)
    {J center : ℝ²} (hJ : J ∈ D.A)
    (C : CriticalSelectedFourClass D.A J center)
    (blocks : ¬ HasNEquidistantPointsAt 4 (D.A.erase J) center)
    (hsource₁ : Q.criticalFiber.source₁.1 ∈
      ((H.overrideAt C blocks).selectedAt J hJ).toCriticalFourShell.support)
    (hsource₂ : Q.criticalFiber.source₂.1 ∈
      ((H.overrideAt C blocks).selectedAt J hJ).toCriticalFourShell.support) :
    dist center Q.criticalFiber.source₁.1 =
      dist center Q.criticalFiber.source₂.1 := by
  exact overrideAt_pairHit_forces_equidistant
    H hJ C blocks hsource₁ hsource₂

#print axioms no_deletion_survival_at_blocker_of_mem_selectedSupport
#print axioms saturateCriticalSupportSystem_centerAt
#print axioms overrideAt_selectedSupport_eq_prescribed
#print axioms overrideAt_pairHit_forces_equidistant
#print axioms overrideAt_misses_pair_of_dist_ne
#print axioms minimalDeletionCore_survives_erase_of_other_source
#print axioms minimalDeletionCore_no_pointwise_override_of_other_source
#print axioms equalBlocker_globalMinimalDeletion_pairSelectorSplit
#print axioms equalBlocker_override_source₁_newCenter_breaks_fiber
#print axioms equalBlocker_override_source₂_newCenter_breaks_fiber
#print axioms equalBlocker_saturation_stutters_on_commonSupport
#print axioms equalBlocker_saturation_rebuilds_relation_but_not_secondCenter
#print axioms equalBlocker_lateOverride_pairHit_forces_missingEquality

end

end ATailGlobalMutualFavorableSystemChoiceScratch
end Problem97
