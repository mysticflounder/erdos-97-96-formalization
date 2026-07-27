/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# A named-role global minimal-deletion reduction

The two exact-four collision packets determine four sources and two actual
blockers.  Together with the three Moser apices these give only nine named
carrier roles.  Since the live parent carrier has more than nine points,
global minimality can be applied after deleting precisely these roles.

The resulting blocking center is outside every named role, while its
cardinality-minimal blocking set is supported entirely on the nine roles.
This removes arbitrary carrier points from the deletion side of the remaining
global exact-four obligation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GlobalExactFourProverScratch

open ATAILStageOneMinimalDeletionCore
open ATailCriticalPairFrontier
open ATailGlobalMinimalDeletion
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

noncomputable section

/-- The finite roles visible in the two-collision, tri-apex configuration. -/
inductive CollisionTriApexRole
  | firstSource₁
  | firstSource₂
  | secondSource₁
  | secondSource₂
  | firstBlocker
  | secondBlocker
  | firstApex
  | secondApex
  | surplusApex
  deriving DecidableEq, Fintype

/-- Interpret a finite role as its actual carrier point. -/
def collisionTriApexPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    CollisionTriApexRole → ℝ²
  | .firstSource₁ => P.source₁
  | .firstSource₂ => P.source₂
  | .secondSource₁ => Pρ.source₁
  | .secondSource₂ => Pρ.source₂
  | .firstBlocker => H.centerAt P.source₁ P.source₁_mem_A
  | .secondBlocker => H.centerAt Pρ.source₁ Pρ.source₁_mem_A
  | .firstApex => S.oppApex1
  | .secondApex => S.oppApex2
  | .surplusApex => S.surplusApex

/-- The carrier set occupied by the nine named roles.  Distinct roles are
allowed to coincide; this only makes the set smaller. -/
def collisionTriApexSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) : Finset ℝ² :=
  Finset.univ.image (collisionTriApexPoint P Pρ)

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem surplusApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

/-- The named-role seed has cardinality at most nine. -/
theorem collisionTriApexSeed_card_le_nine
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    (collisionTriApexSeed P Pρ).card ≤ 9 := by
  classical
  have himage :=
    Finset.card_image_le
      (s := (Finset.univ : Finset CollisionTriApexRole))
      (f := collisionTriApexPoint P Pρ)
  simpa [collisionTriApexSeed] using himage

/-- Every named role is a genuine carrier point. -/
theorem collisionTriApexSeed_subset_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    collisionTriApexSeed P Pρ ⊆ D.A := by
  classical
  intro x hx
  rw [collisionTriApexSeed] at hx
  rcases Finset.mem_image.mp hx with ⟨role, _hrole, rfl⟩
  cases role with
  | firstSource₁ => exact P.source₁_mem_A
  | firstSource₂ => exact P.source₂_mem_A
  | secondSource₁ => exact Pρ.source₁_mem_A
  | secondSource₂ => exact Pρ.source₂_mem_A
  | firstBlocker =>
      simpa [collisionTriApexPoint, CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  | secondBlocker =>
      simpa [collisionTriApexPoint, CriticalShellSystem.blockerVertex] using
        (H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩).2
  | firstApex =>
      simpa [collisionTriApexPoint] using oppApex1_mem_A S
  | secondApex =>
      simpa [collisionTriApexPoint] using oppApex2_mem_A S
  | surplusApex =>
      simpa [collisionTriApexPoint] using surplusApex_mem_A S

/-- The seed is nonempty, witnessed by the first collision source. -/
theorem collisionTriApexSeed_nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    (collisionTriApexSeed P Pρ).Nonempty := by
  classical
  refine ⟨P.source₁, ?_⟩
  exact Finset.mem_image.mpr
    ⟨CollisionTriApexRole.firstSource₁, Finset.mem_univ _, rfl⟩

/-- A carrier of cardinality greater than nine has a point outside the
nine-role seed. -/
theorem collisionTriApexSeed_complement_nonempty
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hcard : 9 < D.A.card) :
    (D.A \ collisionTriApexSeed P Pρ).Nonempty := by
  apply Finset.sdiff_nonempty_of_card_lt_card
  exact lt_of_le_of_lt (collisionTriApexSeed_card_le_nine P Pρ) hcard

/-- Global exact-four named-role reduction.

Deleting the four collision sources, their two actual blockers, and the three
Moser apices produces a fresh blocking center.  A cardinality-minimal blocking
subdeletion has at most nine points, all selected from those named roles.
Either two selected roles are co-radial about the fresh center, or the
minimal-deletion-core packet supplies pairwise-disjoint exact critical shells.
-/
theorem exists_fresh_namedRole_sharedRadiusPair_or_minimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    ∃ center ∈ D.A \ collisionTriApexSeed P Pρ,
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ collisionTriApexSeed P Pρ ∧
        V.card ≤ 9 ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧ dist center s = dist center t) ∨
          Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  rcases exists_fresh_sharedRadiusPair_or_minimalDeletionCore
      R.minimal
      (collisionTriApexSeed_subset_carrier P Pρ)
      (collisionTriApexSeed_nonempty P Pρ)
      (collisionTriApexSeed_complement_nonempty P Pρ
        R.carrier_card_gt_nine) with
    ⟨center, hcenter, V, hVne, hVsub, hVblocked, hVoutcome⟩
  refine ⟨center, hcenter, V, hVne, hVsub, ?_, hVblocked, hVoutcome⟩
  exact
    (Finset.card_le_card hVsub).trans
      (collisionTriApexSeed_card_le_nine P Pρ)

/-- If a cardinality-minimal blocking deletion contains two distinct points at
the same radius from its blocked center, restoring either one exposes an exact
four-point class.  Erasing that restored point leaves exactly three survivors,
while the other deleted co-radial point makes the ambient class have at least
five members.

This is the precise content hidden by the bare `sharedRadiusPair` outcome in
the generic global minimal-deletion dichotomy. -/
theorem exact_three_survivors_and_full_card_ge_five_of_sharedRadius
    {A V : Finset ℝ²} {center s t : ℝ²}
    (hVsub : V ⊆ A)
    (hsV : s ∈ V)
    (htV : t ∈ V)
    (hst : s ≠ t)
    (hsame : dist center s = dist center t)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A \ (V.erase s)) center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ V) center) :
    0 < dist center s ∧
      (SelectedClass (A \ (V.erase s)) center
        (dist center s)).card = 4 ∧
      (SelectedClass (A \ V) center
        (dist center s)).card = 3 ∧
      5 ≤ (SelectedClass A center (dist center s)).card := by
  classical
  have heraseEq :
      (A \ (V.erase s)).erase s = A \ V := by
    ext x
    by_cases hxs : x = s
    · subst x
      simp [hsV]
    · simp [hxs]
  have hblockedErase :
      ¬ HasNEquidistantPointsAt 4
        ((A \ (V.erase s)).erase s) center := by
    rw [heraseEq]
    exact hblocked
  rcases
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨witnessRadius, hwitnessRadius, hwitnessCard⟩
  have hsRestored :
      s ∈
        SelectedClass (A \ (V.erase s)) center witnessRadius := by
    by_contra hsNot
    apply hblockedErase
    have hsameCard :=
      selectedClass_erase_card_eq_of_not_mem
        (A := A \ (V.erase s)) (x := s)
        (s := center) (d := witnessRadius) hsNot
    refine ⟨witnessRadius, hwitnessRadius, ?_⟩
    have hcardErased :
        4 ≤
          (SelectedClass ((A \ (V.erase s)).erase s)
            center witnessRadius).card := by
      rw [hsameCard]
      exact hwitnessCard
    simpa [SelectedClass] using hcardErased
  have hnotFive :
      ¬ 5 ≤
        (SelectedClass (A \ (V.erase s))
          center witnessRadius).card := by
    intro hfive
    apply hblockedErase
    have hfourErased :=
      selectedClass_erase_card_ge_of_succ_le
        (A := A \ (V.erase s)) (x := s)
        (s := center) (d := witnessRadius) (n := 4)
        (by simpa using hfive)
    exact ⟨witnessRadius, hwitnessRadius, by
      simpa [SelectedClass] using hfourErased⟩
  have hrestoredCard :
      (SelectedClass (A \ (V.erase s))
        center witnessRadius).card = 4 := by
    omega
  have hsDist : dist center s = witnessRadius :=
    (mem_selectedClass.mp hsRestored).2
  have hpositive : 0 < dist center s := by
    simpa [hsDist] using hwitnessRadius
  have hsRestoredAtSourceRadius :
      s ∈
        SelectedClass (A \ (V.erase s))
          center (dist center s) := by
    simpa [hsDist] using hsRestored
  have hrestoredCardAtSourceRadius :
      (SelectedClass (A \ (V.erase s))
        center (dist center s)).card = 4 := by
    simpa [hsDist] using hrestoredCard
  have hsurvivingClassEq :
      SelectedClass (A \ V) center (dist center s) =
        (SelectedClass (A \ (V.erase s))
          center (dist center s)).erase s := by
    rw [← heraseEq, selectedClass_erase_eq]
  have hsurvivingCard :
      (SelectedClass (A \ V)
        center (dist center s)).card = 3 := by
    rw [hsurvivingClassEq,
      Finset.card_erase_of_mem hsRestoredAtSourceRadius,
      hrestoredCardAtSourceRadius]
  have htErase : t ∈ V.erase s :=
    Finset.mem_erase.mpr ⟨Ne.symm hst, htV⟩
  have htNotRestored :
      t ∉
        SelectedClass (A \ (V.erase s))
          center (dist center s) := by
    intro htRestored
    exact
      (Finset.mem_sdiff.mp
        (mem_selectedClass.mp htRestored).1).2 htErase
  have hrestoredSubsetFull :
      SelectedClass (A \ (V.erase s))
          center (dist center s) ⊆
        SelectedClass A center (dist center s) := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxRestored, hxDist⟩
    exact
      mem_selectedClass.mpr
        ⟨(Finset.mem_sdiff.mp hxRestored).1, hxDist⟩
  have htFull :
      t ∈ SelectedClass A center (dist center s) := by
    exact mem_selectedClass.mpr ⟨hVsub htV, hsame.symm⟩
  have hinsertSubset :
      insert t
          (SelectedClass (A \ (V.erase s))
            center (dist center s)) ⊆
        SelectedClass A center (dist center s) := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact htFull
    · exact hrestoredSubsetFull hx
  have hinsertCard :
      (insert t
        (SelectedClass (A \ (V.erase s))
          center (dist center s))).card = 5 := by
    rw [Finset.card_insert_of_notMem htNotRestored,
      hrestoredCardAtSourceRadius]
  refine ⟨hpositive, hrestoredCardAtSourceRadius, hsurvivingCard, ?_⟩
  rw [← hinsertCard]
  exact Finset.card_le_card hinsertSubset

/-- Strengthened named-role reduction.

The shared-radius branch now records its full deletion-critical normal form:
one restored exact four-class, its exact three-point survivor, and the ambient
class of cardinality at least five.  The alternative remains the
pairwise-disjoint exact-shell minimal-deletion core. -/
theorem exists_fresh_namedRole_largeRadiusClass_or_minimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius radiusρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ) :
    ∃ center ∈ D.A \ collisionTriApexSeed P Pρ,
      ∃ V : Finset ℝ²,
        V.Nonempty ∧
        V ⊆ collisionTriApexSeed P Pρ ∧
        V.card ≤ 9 ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
        ((∃ s ∈ V, ∃ t ∈ V,
            s ≠ t ∧
            dist center s = dist center t ∧
            0 < dist center s ∧
            (SelectedClass (D.A \ (V.erase s))
              center (dist center s)).card = 4 ∧
            (SelectedClass (D.A \ V)
              center (dist center s)).card = 3 ∧
            5 ≤
              (SelectedClass D.A center
                (dist center s)).card) ∨
          Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  have hseedSub :
      collisionTriApexSeed P Pρ ⊆ D.A :=
    collisionTriApexSeed_subset_carrier P Pρ
  rcases exists_global_cardMinimal_blocking_subdeletion
      R.minimal
      hseedSub
      (collisionTriApexSeed_nonempty P Pρ)
      (collisionTriApexSeed_complement_nonempty P Pρ
        R.carrier_card_gt_nine) with
    ⟨center, hcenter, V, hVne, hVsub, hVblocked, hVminimal⟩
  refine
    ⟨center, hcenter, V, hVne, hVsub, ?_, hVblocked, ?_⟩
  · exact
      (Finset.card_le_card hVsub).trans
        (collisionTriApexSeed_card_le_nine P Pρ)
  · by_cases hcollision :
        ∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t
    · rcases hcollision with
        ⟨s, hsV, t, htV, hst, hsame⟩
      rcases
          exact_three_survivors_and_full_card_ge_five_of_sharedRadius
            (hVsub.trans hseedSub)
            hsV htV hst hsame
            (hVminimal s hsV) hVblocked with
        ⟨hpositive, hrestoredCard, hsurvivingCard, hfullCard⟩
      exact Or.inl
        ⟨s, hsV, t, htV, hst, hsame, hpositive,
          hrestoredCard, hsurvivingCard, hfullCard⟩
    · apply Or.inr
      have hcenterA : center ∈ D.A :=
        (Finset.mem_sdiff.mp hcenter).1
      apply exists_minimalDeletionCore
        (A := D.A) (U := V) (center := center)
        (hVsub.trans hseedSub) hcenterA
      · intro s hsV t htV hst hsame
        exact hcollision ⟨s, hsV, t, htV, hst, hsame⟩
      · exact hVblocked
      · exact hVminimal

#print axioms exists_fresh_namedRole_sharedRadiusPair_or_minimalDeletionCore
#print axioms exact_three_survivors_and_full_card_ge_five_of_sharedRadius
#print axioms exists_fresh_namedRole_largeRadiusClass_or_minimalDeletionCore

end

end GlobalExactFourProverScratch
end Problem97
