/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFiveMutualOneHitGeometry

/-!
# A global cross-deletion pair on the exact-five physical cap

The exact-five physical second cap has exactly three strict physical vertices.
Among them, two distinct vertices have the following global deletion-cover
property: at every carrier center, deleting at least one of the two vertices
leaves a four-equidistant witness.

Indeed, if each of the three pairs failed, choose a carrier center at which
both deletions fail.  A critical four-shell at that center contains the pair.
Second-apex robustness and two-center cap localization force the center to be
the third physical vertex.  The three failures would therefore make the
physical triangle equilateral, hence non-obtuse, contradicting convex
independence through the existing exact-five obstruction.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailExactFiveGlobalCrossDeletionPair

open ATAILStageOnePrescribedApexDichotomy
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailExactFiveMutualOneHitGeometry
open ATailParentExactFiveSecondCap
open ATailParentExactFiveSecondCap.PhysicalActualCriticalMutualOmissionPair
open ATailPhysicalSecondApexCommonDeletion
open ATailOrientedPhysicalApexIngress
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A pair of distinct strict physical vertices such that every carrier
center keeps K4 after deleting at least one endpoint.  Unlike a
source-indexed survival split, this cover quantifies over every carrier
center. -/
structure PhysicalGlobalCrossDeletionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  source : PhysicalVertex profile
  target : PhysicalVertex profile
  source_ne_target : source ≠ target
  globalCover :
    ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase source.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase target.1) center

/-- A vertex of the exact-five physical three-set whose two incident pairs
both cover every carrier center by singleton-deletion K4 survival. -/
structure PhysicalGlobalCrossDeletionStar
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  hub : PhysicalVertex profile
  spoke₁ : PhysicalVertex profile
  spoke₂ : PhysicalVertex profile
  hub_ne_spoke₁ : hub ≠ spoke₁
  hub_ne_spoke₂ : hub ≠ spoke₂
  spoke₁_ne_spoke₂ : spoke₁ ≠ spoke₂
  physicalVertices_eq :
    physicalVertices profile = {hub.1, spoke₁.1, spoke₂.1}
  hub_spoke₁_cover :
    ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase hub.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase spoke₁.1) center
  hub_spoke₂_cover :
    ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase hub.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase spoke₂.1) center

private theorem inner_nonneg_of_three_equal_distances
    (a b c : ℝ²)
    (hab_ac : dist a b = dist a c)
    (hab_bc : dist a b = dist b c) :
    0 ≤ ⟪b - a, c - a⟫_ℝ := by
  have hvec : (b - a) - (c - a) = b - c := by abel
  have hnormBA : ‖b - a‖ = dist a b := by
    rw [dist_eq_norm, norm_sub_rev]
  have hnormCA : ‖c - a‖ = dist a c := by
    rw [dist_eq_norm, norm_sub_rev]
  have hnormBC : ‖b - c‖ = dist b c := by
    rw [dist_eq_norm]
  have hidentity := norm_sub_sq_real (b - a) (c - a)
  rw [hvec, hnormBA, hnormCA, hnormBC, ← hab_ac, ← hab_bc] at hidentity
  nlinarith [sq_nonneg (dist a b)]

/-- If deleting two distinct physical vertices blocks K4 at one carrier
center, that center is the third physical vertex and therefore bisects the
blocked pair. -/
private theorem third_equidistant_of_both_deletions_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (a b c : PhysicalVertex profile)
    (hab : a ≠ b)
    (hphysical : physicalVertices profile = {a.1, b.1, c.1})
    {center : ℝ²} (hcenterA : center ∈ D.A)
    (haBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase a.1) center)
    (hbBlocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase b.1) center) :
    dist c.1 a.1 = dist c.1 b.1 := by
  classical
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := a.1) D.K4 hcenterA with haSurvives | ⟨K, _haBlocked'⟩
  · exact False.elim (haBlocked haSurvives)
  · have haK : a.1 ∈ K.toCriticalFourShell.support :=
      K.toCriticalFourShell.q_mem_support
    have hbK : b.1 ∈ K.toCriticalFourShell.support :=
      source_mem_critical_support_of_no_qfree K hbBlocked
    have hcenterEq : dist center a.1 = dist center b.1 :=
      (K.toCriticalFourShell.support_eq_radius a.1 haK).trans
        (K.toCriticalFourShell.support_eq_radius b.1 hbK).symm
    have hphysicalEq : dist S.oppApex2 a.1 = dist S.oppApex2 b.1 :=
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass a)).2.trans
        (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass b)).2.symm
    have hcenterNe : center ≠ S.oppApex2 := by
      intro hcenter
      apply haBlocked
      rw [hcenter]
      exact B.secondApex_robust.survives a.1 (PhysicalVertex.mem_A a)
    have hcenterInterior :
        center ∈ S.capInteriorByIndex S.oppIndex2 :=
      commonPhysicalPair_center_mem_secondCapInterior
        hcenterA hcenterNe
        (PhysicalVertex.mem_capInterior a)
        (PhysicalVertex.mem_capInterior b)
        (fun h ↦ hab (Subtype.ext h)) hcenterEq hphysicalEq
    have hcenterPhysical : center ∈ physicalVertices profile := by
      rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile]
      exact hcenterInterior
    have hcenterCases :
        center = a.1 ∨ center = b.1 ∨ center = c.1 := by
      rw [hphysical] at hcenterPhysical
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hcenterPhysical
    have hcenterThird : center = c.1 := by
      rcases hcenterCases with hcenterA | hcenterB | hcenterC
      · exact False.elim (K.toCriticalFourShell.center_not_mem_support
          (hcenterA ▸ haK))
      · exact False.elim (K.toCriticalFourShell.center_not_mem_support
          (hcenterB ▸ hbK))
      · exact hcenterC
    simpa only [hcenterThird] using hcenterEq

/-- On the exact-five physical second cap, two distinct physical vertices
globally cover all carrier centers by their singleton-deletion K4 witnesses. -/
theorem exists_distinct_physicalPair_globalDeletionCover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    ∃ q w : PhysicalVertex profile, q ≠ w ∧
      ∀ center : ℝ², center ∈ D.A →
        HasNEquidistantPointsAt 4 (D.A.erase q.1) center ∨
          HasNEquidistantPointsAt 4 (D.A.erase w.1) center := by
  classical
  rcases Finset.card_eq_three.mp
      (physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile) with
    ⟨aPoint, bPoint, cPoint, habPoint, hacPoint, hbcPoint, hphysical⟩
  have haPhysical : aPoint ∈ physicalVertices profile := by
    rw [hphysical]
    simp
  have hbPhysical : bPoint ∈ physicalVertices profile := by
    rw [hphysical]
    simp
  have hcPhysical : cPoint ∈ physicalVertices profile := by
    rw [hphysical]
    simp
  let a : PhysicalVertex profile := ⟨aPoint, haPhysical⟩
  let b : PhysicalVertex profile := ⟨bPoint, hbPhysical⟩
  let c : PhysicalVertex profile := ⟨cPoint, hcPhysical⟩
  have hab : a ≠ b := fun h ↦ habPoint (congrArg Subtype.val h)
  have hac : a ≠ c := fun h ↦ hacPoint (congrArg Subtype.val h)
  have hbc : b ≠ c := fun h ↦ hbcPoint (congrArg Subtype.val h)
  have hphysical' : physicalVertices profile = {a.1, b.1, c.1} := by
    simpa [a, b, c] using hphysical
  by_contra hnoPair
  have habNoCover : ¬ ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase a.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase b.1) center := by
    intro hcover
    exact hnoPair ⟨a, b, hab, hcover⟩
  have hacNoCover : ¬ ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase a.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase c.1) center := by
    intro hcover
    exact hnoPair ⟨a, c, hac, hcover⟩
  have hbcNoCover : ¬ ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase b.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase c.1) center := by
    intro hcover
    exact hnoPair ⟨b, c, hbc, hcover⟩
  push_neg at habNoCover hacNoCover hbcNoCover
  rcases habNoCover with ⟨centerAB, hcenterABA, haBlockedAB, hbBlockedAB⟩
  rcases hacNoCover with ⟨centerAC, hcenterACA, haBlockedAC, hcBlockedAC⟩
  rcases hbcNoCover with ⟨centerBC, hcenterBCA, hbBlockedBC, hcBlockedBC⟩
  have hcAB : dist c.1 a.1 = dist c.1 b.1 :=
    third_equidistant_of_both_deletions_blocked
      Q profile a b c hab hphysical' hcenterABA haBlockedAB hbBlockedAB
  have hbAC : dist b.1 a.1 = dist b.1 c.1 :=
    third_equidistant_of_both_deletions_blocked
      Q profile a c b hac (by simpa [Finset.pair_comm] using hphysical')
      hcenterACA haBlockedAC hcBlockedAC
  have haBC : dist a.1 b.1 = dist a.1 c.1 :=
    third_equidistant_of_both_deletions_blocked
      Q profile b c a hbc (by
        rw [hphysical']
        ext x
        simp only [Finset.mem_insert, Finset.mem_singleton]
        tauto)
      hcenterBCA hbBlockedBC hcBlockedBC
  have hab_bc : dist a.1 b.1 = dist b.1 c.1 := by
    rw [dist_comm a.1 b.1]
    exact hbAC
  apply not_nonobtuse_of_three_distinct_physicalVertices
    a b c hab hac hbc
  refine ⟨inner_nonneg_of_three_equal_distances
      a.1 b.1 c.1 haBC hab_bc, ?_, ?_⟩
  · exact inner_nonneg_of_three_equal_distances
      b.1 c.1 a.1
      (by
        calc
          dist b.1 c.1 = dist a.1 b.1 := hab_bc.symm
          _ = dist b.1 a.1 := dist_comm _ _)
      (by
        calc
          dist b.1 c.1 = dist a.1 b.1 := hab_bc.symm
          _ = dist a.1 c.1 := haBC
          _ = dist c.1 a.1 := dist_comm _ _)
  · exact inner_nonneg_of_three_equal_distances
      c.1 a.1 b.1 hcAB
      (by
        calc
          dist c.1 a.1 = dist a.1 c.1 := dist_comm _ _
          _ = dist a.1 b.1 := haBC.symm)

/-- Packet form of the global exact-five deletion cover. -/
theorem nonempty_physicalGlobalCrossDeletionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalGlobalCrossDeletionPair profile) := by
  rcases exists_distinct_physicalPair_globalDeletionCover Q profile with
    ⟨source, target, hne, hcover⟩
  exact ⟨{
    source := source
    target := target
    source_ne_target := hne
    globalCover := hcover }⟩

/-- The global-cover graph on the three physical vertices contains two
incident edges.  If only one edge existed, failures of the two remaining
pairs would make the physical triangle equilateral, contradicting the
non-obtuse exact-five obstruction. -/
theorem nonempty_physicalGlobalCrossDeletionStar
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalGlobalCrossDeletionStar profile) := by
  classical
  rcases nonempty_physicalGlobalCrossDeletionPair Q profile with ⟨G⟩
  have hthird :
      ∃ x ∈ physicalVertices profile,
        x ≠ G.source.1 ∧ x ≠ G.target.1 := by
    by_contra hnone
    push_neg at hnone
    have hsub : physicalVertices profile ⊆
        ({G.source.1, G.target.1} : Finset ℝ²) := by
      intro x hx
      by_cases hxSource : x = G.source.1
      · simp [hxSource]
      · have hxTarget := hnone x hx hxSource
        simp [hxTarget]
    have hcard := Finset.card_le_card hsub
    have hpairPoints : G.source.1 ≠ G.target.1 := by
      intro h
      exact G.source_ne_target (Subtype.ext h)
    rw [Finset.card_pair hpairPoints,
      physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile] at hcard
    omega
  rcases hthird with ⟨thirdPoint, hthirdPhysical,
    hthirdSource, hthirdTarget⟩
  let third : PhysicalVertex profile := ⟨thirdPoint, hthirdPhysical⟩
  have hsourceThird : G.source ≠ third := by
    intro h
    exact hthirdSource (congrArg Subtype.val h).symm
  have htargetThird : G.target ≠ third := by
    intro h
    exact hthirdTarget (congrArg Subtype.val h).symm
  have hphysical :
      physicalVertices profile = {G.source.1, G.target.1, third.1} := by
    have hsub :
        ({G.source.1, G.target.1, third.1} : Finset ℝ²) ⊆
          physicalVertices profile := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl
      · exact G.source.2
      · exact G.target.2
      · exact third.2
    have htripleCard :
        ({G.source.1, G.target.1, third.1} : Finset ℝ²).card = 3 := by
      have hsourceTarget : G.source.1 ≠ G.target.1 :=
        fun h ↦ G.source_ne_target (Subtype.ext h)
      have hsourceThirdPoints : G.source.1 ≠ third.1 :=
        fun h ↦ hsourceThird (Subtype.ext h)
      have htargetThirdPoints : G.target.1 ≠ third.1 :=
        fun h ↦ htargetThird (Subtype.ext h)
      simp [hsourceTarget, hsourceThirdPoints, htargetThirdPoints]
    have hPcard : (physicalVertices profile).card = 3 :=
      physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
    exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
  let Covers (a b : PhysicalVertex profile) : Prop :=
    ∀ center : ℝ², center ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase a.1) center ∨
        HasNEquidistantPointsAt 4 (D.A.erase b.1) center
  by_cases hsourceCover : Covers G.source third
  · exact ⟨{
      hub := G.source
      spoke₁ := G.target
      spoke₂ := third
      hub_ne_spoke₁ := G.source_ne_target
      hub_ne_spoke₂ := hsourceThird
      spoke₁_ne_spoke₂ := htargetThird
      physicalVertices_eq := hphysical
      hub_spoke₁_cover := G.globalCover
      hub_spoke₂_cover := hsourceCover }⟩
  · by_cases htargetCover : Covers G.target third
    · exact ⟨{
        hub := G.target
        spoke₁ := G.source
        spoke₂ := third
        hub_ne_spoke₁ := G.source_ne_target.symm
        hub_ne_spoke₂ := htargetThird
        spoke₁_ne_spoke₂ := hsourceThird
        physicalVertices_eq := by
          rw [hphysical]
          ext x
          simp only [Finset.mem_insert, Finset.mem_singleton]
          tauto
        hub_spoke₁_cover := fun center hcenter ↦
          (G.globalCover center hcenter).symm
        hub_spoke₂_cover := htargetCover }⟩
    · change ¬ ∀ center : ℝ², center ∈ D.A →
          HasNEquidistantPointsAt 4 (D.A.erase G.source.1) center ∨
            HasNEquidistantPointsAt 4 (D.A.erase third.1) center at hsourceCover
      change ¬ ∀ center : ℝ², center ∈ D.A →
          HasNEquidistantPointsAt 4 (D.A.erase G.target.1) center ∨
            HasNEquidistantPointsAt 4 (D.A.erase third.1) center at htargetCover
      push_neg at hsourceCover htargetCover
      rcases hsourceCover with
        ⟨centerST, hcenterSTA, hsourceBlocked, hthirdBlocked₁⟩
      rcases htargetCover with
        ⟨centerTT, hcenterTTA, htargetBlocked, hthirdBlocked₂⟩
      have htargetEq :
          dist G.target.1 G.source.1 = dist G.target.1 third.1 :=
        third_equidistant_of_both_deletions_blocked
          Q profile G.source third G.target hsourceThird (by
            rw [hphysical]
            ext x
            simp only [Finset.mem_insert, Finset.mem_singleton]
            tauto)
          hcenterSTA hsourceBlocked hthirdBlocked₁
      have hsourceEq :
          dist G.source.1 G.target.1 = dist G.source.1 third.1 :=
        third_equidistant_of_both_deletions_blocked
          Q profile G.target third G.source htargetThird (by
            rw [hphysical]
            ext x
            simp only [Finset.mem_insert, Finset.mem_singleton]
            tauto)
          hcenterTTA htargetBlocked hthirdBlocked₂
      have hsourceTarget_eq_targetThird :
          dist G.source.1 G.target.1 = dist G.target.1 third.1 := by
        rw [dist_comm G.source.1 G.target.1]
        exact htargetEq
      have hthirdEq :
          dist third.1 G.source.1 = dist third.1 G.target.1 := by
        calc
          dist third.1 G.source.1 = dist G.source.1 third.1 := dist_comm _ _
          _ = dist G.source.1 G.target.1 := hsourceEq.symm
          _ = dist G.target.1 third.1 := hsourceTarget_eq_targetThird
          _ = dist third.1 G.target.1 := dist_comm _ _
      apply False.elim
      apply not_nonobtuse_of_three_distinct_physicalVertices
        G.source G.target third G.source_ne_target hsourceThird htargetThird
      refine ⟨inner_nonneg_of_three_equal_distances
          G.source.1 G.target.1 third.1
          hsourceEq hsourceTarget_eq_targetThird, ?_, ?_⟩
      · exact inner_nonneg_of_three_equal_distances
          G.target.1 third.1 G.source.1
          (by
            calc
              dist G.target.1 third.1 =
                  dist G.source.1 G.target.1 :=
                hsourceTarget_eq_targetThird.symm
              _ = dist G.target.1 G.source.1 := dist_comm _ _)
          (by
            calc
              dist G.target.1 third.1 =
                  dist G.source.1 G.target.1 :=
                hsourceTarget_eq_targetThird.symm
              _ = dist G.source.1 third.1 := hsourceEq
              _ = dist third.1 G.source.1 := dist_comm _ _)
      · exact inner_nonneg_of_three_equal_distances
          third.1 G.source.1 G.target.1 hthirdEq
          (by
            calc
              dist third.1 G.source.1 = dist G.source.1 third.1 :=
                dist_comm _ _
              _ = dist G.source.1 G.target.1 := hsourceEq.symm)

/-- Orient the first covered edge from its spoke toward the hub.  This is the
orientation needed when the spoke row is the asymmetric two-hit row. -/
def PhysicalGlobalCrossDeletionStar.spoke₁HubPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalGlobalCrossDeletionStar profile) :
    PhysicalGlobalCrossDeletionPair profile where
  source := T.spoke₁
  target := T.hub
  source_ne_target := T.hub_ne_spoke₁.symm
  globalCover := fun center hcenter ↦
    (T.hub_spoke₁_cover center hcenter).symm

/-- Orient the second covered edge from its spoke toward the hub. -/
def PhysicalGlobalCrossDeletionStar.spoke₂HubPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalGlobalCrossDeletionStar profile) :
    PhysicalGlobalCrossDeletionPair profile where
  source := T.spoke₂
  target := T.hub
  source_ne_target := T.hub_ne_spoke₂.symm
  globalCover := fun center hcenter ↦
    (T.hub_spoke₂_cover center hcenter).symm

/-- Every global cross-deletion pair is, for the fixed critical system, a
mutual omission pair.  At the actual blocker of one endpoint, deleting that
endpoint is critical, so the global cover forces survival after deleting the
other endpoint; exact criticality turns that survival into support omission. -/
def PhysicalGlobalCrossDeletionPair.toMutualOmissionPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (G : PhysicalGlobalCrossDeletionPair profile) :
    PhysicalActualCriticalMutualOmissionPair H profile := by
  let sourceRow := (H.selectedAt G.source.1
    (PhysicalVertex.mem_A G.source)).toCriticalFourShell
  let targetRow := (H.selectedAt G.target.1
    (PhysicalVertex.mem_A G.target)).toCriticalFourShell
  have hsourceCenterA :
      H.centerAt G.source.1 (PhysicalVertex.mem_A G.source) ∈ D.A :=
    (Finset.mem_erase.mp sourceRow.center_mem).2
  have htargetCenterA :
      H.centerAt G.target.1 (PhysicalVertex.mem_A G.target) ∈ D.A :=
    (Finset.mem_erase.mp targetRow.center_mem).2
  have htargetSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase G.target.1)
        (H.centerAt G.source.1 (PhysicalVertex.mem_A G.source)) :=
    (G.globalCover _ hsourceCenterA).resolve_left
      (H.no_qfree_at G.source.1 (PhysicalVertex.mem_A G.source))
  have hsourceSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase G.source.1)
        (H.centerAt G.target.1 (PhysicalVertex.mem_A G.target)) :=
    (G.globalCover _ htargetCenterA).resolve_right
      (H.no_qfree_at G.target.1 (PhysicalVertex.mem_A G.target))
  exact {
    source := G.source
    target := G.target
    target_not_mem_sourceSupport :=
      (cross_deletion_survives_iff_not_mem_selected_support H
        (PhysicalVertex.mem_A G.source)).mp htargetSurvives
    source_not_mem_targetSupport :=
      (cross_deletion_survives_iff_not_mem_selected_support H
        (PhysicalVertex.mem_A G.target)).mp hsourceSurvives }

/-- The hub's actual critical support contains no other physical vertex.
Criticality makes deletion of the hub fail at its blocker, so both covered
edges force survival after deleting their spokes. -/
theorem PhysicalGlobalCrossDeletionStar.hub_inter_support_eq_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalGlobalCrossDeletionStar profile) :
    physicalVertices profile ∩
        (H.selectedAt T.hub.1
          (PhysicalVertex.mem_A T.hub)).toCriticalFourShell.support =
      {T.hub.1} := by
  classical
  let K := (H.selectedAt T.hub.1
    (PhysicalVertex.mem_A T.hub)).toCriticalFourShell
  have hcenterA : H.centerAt T.hub.1 (PhysicalVertex.mem_A T.hub) ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hspoke₁Survives :
      HasNEquidistantPointsAt 4 (D.A.erase T.spoke₁.1)
        (H.centerAt T.hub.1 (PhysicalVertex.mem_A T.hub)) :=
    (T.hub_spoke₁_cover _ hcenterA).resolve_left
      (H.no_qfree_at T.hub.1 (PhysicalVertex.mem_A T.hub))
  have hspoke₂Survives :
      HasNEquidistantPointsAt 4 (D.A.erase T.spoke₂.1)
        (H.centerAt T.hub.1 (PhysicalVertex.mem_A T.hub)) :=
    (T.hub_spoke₂_cover _ hcenterA).resolve_left
      (H.no_qfree_at T.hub.1 (PhysicalVertex.mem_A T.hub))
  have hspoke₁Not : T.spoke₁.1 ∉ K.support := by
    simpa [K] using
      (cross_deletion_survives_iff_not_mem_selected_support H
        (PhysicalVertex.mem_A T.hub)).mp hspoke₁Survives
  have hspoke₂Not : T.spoke₂.1 ∉ K.support := by
    simpa [K] using
      (cross_deletion_survives_iff_not_mem_selected_support H
        (PhysicalVertex.mem_A T.hub)).mp hspoke₂Survives
  apply Finset.Subset.antisymm
  · intro x hx
    have hxPhysical := (Finset.mem_inter.mp hx).1
    have hxSupport := (Finset.mem_inter.mp hx).2
    rw [T.physicalVertices_eq] at hxPhysical
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxPhysical
    rcases hxPhysical with rfl | rfl | rfl
    · exact Finset.mem_singleton_self _
    · exact False.elim (hspoke₁Not hxSupport)
    · exact False.elim (hspoke₂Not hxSupport)
  · intro x hx
    have hxHub : x = T.hub.1 := Finset.mem_singleton.mp hx
    subst x
    exact Finset.mem_inter.mpr ⟨T.hub.2, K.q_mem_support⟩

private theorem physical_inter_actualSupport_card_eq_one_or_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    (physicalVertices profile ∩
        (H.selectedAt q.1
          (PhysicalVertex.mem_A q)).toCriticalFourShell.support).card = 1 ∨
      (physicalVertices profile ∩
        (H.selectedAt q.1
          (PhysicalVertex.mem_A q)).toCriticalFourShell.support).card = 2 := by
  let K := (H.selectedAt q.1
    (PhysicalVertex.mem_A q)).toCriticalFourShell
  have hupper :
      (physicalVertices profile ∩ K.support).card ≤ 2 := by
    change ((SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2) ∩ K.support).card ≤ 2
    simpa only [K] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile q.1 q.2
  have hpos : 0 < (physicalVertices profile ∩ K.support).card :=
    Finset.card_pos.mpr ⟨q.1,
      Finset.mem_inter.mpr ⟨q.2, K.q_mem_support⟩⟩
  by_cases hone : (physicalVertices profile ∩ K.support).card = 1
  · exact Or.inl hone
  · apply Or.inr
    change (physicalVertices profile ∩ K.support).card = 2
    omega

/-- Choice-free exact-five endpoint that preserves the global-cover property
on the asymmetric pair.  Either every physical actual-critical row is one-hit,
or the two-hit source and its one-hit hub form a globally covered pair. -/
inductive ExactFiveGlobalCoverStarOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type
  | allRowsOneHit
      (star : PhysicalGlobalCrossDeletionStar profile)
      (all_one : AllPhysicalActualCriticalRowsOneHit H profile)
  | spoke₁TwoHit
      (star : PhysicalGlobalCrossDeletionStar profile)
      (normal : SourceTwoHitNormalForm Q profile
        star.spoke₁HubPair.toMutualOmissionPair)
  | spoke₂TwoHit
      (star : PhysicalGlobalCrossDeletionStar profile)
      (normal : SourceTwoHitNormalForm Q profile
        star.spoke₂HubPair.toMutualOmissionPair)

/-- The two-edge global-cover star gives the provenance-preserving terminal
classification. -/
theorem nonempty_exactFiveGlobalCoverStarOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (ExactFiveGlobalCoverStarOutcome Q profile) := by
  classical
  rcases nonempty_physicalGlobalCrossDeletionStar Q profile with ⟨T⟩
  have hhubOne :
      (physicalVertices profile ∩
        (H.selectedAt T.hub.1
          (PhysicalVertex.mem_A T.hub)).toCriticalFourShell.support).card = 1 := by
    rw [T.hub_inter_support_eq_singleton]
    exact Finset.card_singleton _
  rcases physical_inter_actualSupport_card_eq_one_or_two
      (H := H) T.spoke₁ with hspoke₁One | hspoke₁Two
  · rcases physical_inter_actualSupport_card_eq_one_or_two
        (H := H) T.spoke₂ with hspoke₂One | hspoke₂Two
    · refine ⟨ExactFiveGlobalCoverStarOutcome.allRowsOneHit T ?_⟩
      intro q
      have hcases : q = T.hub ∨ q = T.spoke₁ ∨ q = T.spoke₂ := by
        have hq := q.2
        change q.1 ∈ physicalVertices profile at hq
        rw [T.physicalVertices_eq] at hq
        simp only [Finset.mem_insert, Finset.mem_singleton] at hq
        rcases hq with hq | hq | hq
        · exact Or.inl (Subtype.ext hq)
        · exact Or.inr (Or.inl (Subtype.ext hq))
        · exact Or.inr (Or.inr (Subtype.ext hq))
      rcases hcases with rfl | rfl | rfl
      · exact hhubOne
      · exact hspoke₁One
      · exact hspoke₂One
    · rcases nonempty_sourceTwoHitNormalForm Q profile
          T.spoke₂HubPair.toMutualOmissionPair
          (by simpa [PhysicalGlobalCrossDeletionStar.spoke₂HubPair]
            using hspoke₂Two) with ⟨normal⟩
      exact ⟨ExactFiveGlobalCoverStarOutcome.spoke₂TwoHit T normal⟩
  · rcases nonempty_sourceTwoHitNormalForm Q profile
        T.spoke₁HubPair.toMutualOmissionPair
        (by simpa [PhysicalGlobalCrossDeletionStar.spoke₁HubPair]
          using hspoke₁Two) with ⟨normal⟩
    exact ⟨ExactFiveGlobalCoverStarOutcome.spoke₁TwoHit T normal⟩

/-- Upgrade the favorable pair to the full retained-row parent packet.  This
constructs the mutual branch directly and therefore does not pass through the
older mutual-versus-all-reverse relation split. -/
def PhysicalGlobalCrossDeletionPair.toMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (G : PhysicalGlobalCrossDeletionPair profile) :
    FrontierBiApexRobustExactFiveMutualParentResidual Q profile := by
  let pair : PhysicalActualCriticalMutualOmissionPair H profile :=
    G.toMutualOmissionPair
  have honeHit := source_hit_eq_one_or_target_hit_eq_one Q profile pair
  have hsecond :=
    PhysicalActualCriticalMutualOmissionPair.source_mem_secondRow_or_target_mem_secondRow
      Q profile pair
  have hfirst :=
    PhysicalActualCriticalMutualOmissionPair.source_not_mem_firstRow_or_target_not_mem_firstRow
      (R := R) pair
  have hdichotomy :
      (pair.source.1 ∈ R.common.packet.B₂ ∧
          pair.source.1 ∉ R.common.packet.B₁) ∨
        (pair.target.1 ∈ R.common.packet.B₂ ∧
          pair.target.1 ∉ R.common.packet.B₁) ∨
        ((pair.source.1 ∈ R.common.packet.B₁ ∧
            pair.source.1 ∈ R.common.packet.B₂) ∧
          (pair.target.1 ∉ R.common.packet.B₁ ∧
            pair.target.1 ∉ R.common.packet.B₂)) ∨
        ((pair.target.1 ∈ R.common.packet.B₁ ∧
            pair.target.1 ∈ R.common.packet.B₂) ∧
          (pair.source.1 ∉ R.common.packet.B₁ ∧
            pair.source.1 ∉ R.common.packet.B₂)) := by
    tauto
  exact {
    pair := pair
    oneHit := honeHit
    bridge :=
      exists_physicalVertex_mem_parentSecondRow_not_mem_parentFirstRow
        R profile
    source_mem_second_or_target_mem_second := hsecond
    source_not_mem_first_or_target_not_mem_first := hfirst
    endpointRowDichotomy := hdichotomy }

/-- No actual critical support contains both endpoints of a favorable global
cover pair.  At each selected blocker the global cover, together with exact
criticality, says that at least one endpoint is absent from its complete
four-point shell. -/
theorem PhysicalGlobalCrossDeletionPair.source_not_mem_or_target_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (G : PhysicalGlobalCrossDeletionPair profile)
    (rowSource : ℝ²) (hrowSource : rowSource ∈ D.A) :
    G.source.1 ∉
          (H.selectedAt rowSource hrowSource).toCriticalFourShell.support ∨
      G.target.1 ∉
          (H.selectedAt rowSource hrowSource).toCriticalFourShell.support := by
  let K := (H.selectedAt rowSource hrowSource).toCriticalFourShell
  have hcenterA : H.centerAt rowSource hrowSource ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  rcases G.globalCover _ hcenterA with hsource | htarget
  · exact Or.inl
      ((cross_deletion_survives_iff_not_mem_selected_support H hrowSource).mp
        hsource)
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support H hrowSource).mp
        htarget)

theorem PhysicalGlobalCrossDeletionPair.not_both_mem_actualCriticalSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (G : PhysicalGlobalCrossDeletionPair profile)
    (rowSource : ℝ²) (hrowSource : rowSource ∈ D.A) :
    ¬ (G.source.1 ∈
          (H.selectedAt rowSource hrowSource).toCriticalFourShell.support ∧
        G.target.1 ∈
          (H.selectedAt rowSource hrowSource).toCriticalFourShell.support) := by
  intro hboth
  rcases G.source_not_mem_or_target_not_mem rowSource hrowSource with h | h
  · exact h hboth.1
  · exact h hboth.2

/-- Apply the exact-five row classifier to the favorable global-cover pair,
retaining `G` in the caller's context.  The result is either the normalized
asymmetric outside-pair surface or the all-three-one-hit surface. -/
theorem PhysicalGlobalCrossDeletionPair.nonemptyGlobalOneHitOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (G : PhysicalGlobalCrossDeletionPair profile) :
    Nonempty (ExactFiveGlobalOneHitOutcome Q profile) := by
  let pair : PhysicalActualCriticalMutualOmissionPair H profile :=
    G.toMutualOmissionPair
  exact nonempty_exactFiveGlobalOneHitOutcome Q profile pair
    (source_hit_eq_one_or_target_hit_eq_one Q profile pair)

#print axioms exists_distinct_physicalPair_globalDeletionCover
#print axioms nonempty_physicalGlobalCrossDeletionStar
#print axioms PhysicalGlobalCrossDeletionStar.hub_inter_support_eq_singleton
#print axioms nonempty_exactFiveGlobalCoverStarOutcome
#print axioms PhysicalGlobalCrossDeletionPair.toMutualOmissionPair
#print axioms PhysicalGlobalCrossDeletionPair.toMutualParentResidual
#print axioms PhysicalGlobalCrossDeletionPair.source_not_mem_or_target_not_mem
#print axioms PhysicalGlobalCrossDeletionPair.nonemptyGlobalOneHitOutcome

end

end ATailExactFiveGlobalCrossDeletionPair
end Problem97
