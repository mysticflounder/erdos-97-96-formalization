import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# A prescribed-center consequence of global minimality

Deleting every carrier point except a fixed center forces global minimality
to return that center.  A cardinality-minimal blocking subdeletion must then
meet every exact four-point radius class at the center.  In particular, two
distinct exact-four rows force two distinct deleted witnesses.

This is a source-clean global bridge, but it does not identify either witness
with a named strict-cap collision source: either witness may be one of the two
points of its row outside the strict cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCollisionGlobalMath

open ATAILStageOneMinimalDeletionCore
open ATailGlobalMinimalDeletion
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

/-- A deletion-minimal obstruction meets an exact four-point row exactly once.
Deleting no point of the row leaves that row as a K4 witness.  Deleting two
points cannot be minimal: restoring one still leaves the other missing, while
any witness on another radius would already survive the full deletion. -/
theorem blockingSubset_inter_exactFourRow_card_eq_one
    {A V : Finset ℝ²} {center : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hrFour : (SelectedClass A center r).card = 4)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ V) center)
    (hminimal :
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (A \ (V.erase s)) center) :
    (V ∩ SelectedClass A center r).card = 1 := by
  classical
  have hhit : (V ∩ SelectedClass A center r).Nonempty := by
    by_contra hnoHit
    rw [Finset.not_nonempty_iff_eq_empty] at hnoHit
    apply hblocked
    refine ⟨r, hr, ?_⟩
    change 4 ≤ (SelectedClass (A \ V) center r).card
    have hclassEq :
        SelectedClass (A \ V) center r =
          SelectedClass A center r := by
      ext z
      constructor
      · intro hz
        exact mem_selectedClass.mpr
          ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hz).1).1,
            (mem_selectedClass.mp hz).2⟩
      · intro hz
        rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
        apply mem_selectedClass.mpr
        refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzdist⟩
        intro hzV
        have hzInter :
            z ∈ V ∩ SelectedClass A center r :=
          Finset.mem_inter.mpr
            ⟨hzV, mem_selectedClass.mpr ⟨hzA, hzdist⟩⟩
        rw [hnoHit] at hzInter
        simp at hzInter
    rw [hclassEq, hrFour]
  have hpos : 0 < (V ∩ SelectedClass A center r).card :=
    Finset.card_pos.mpr hhit
  have hle : (V ∩ SelectedClass A center r).card ≤ 1 := by
    by_contra hnot
    have htwo : 1 < (V ∩ SelectedClass A center r).card := by omega
    rcases Finset.one_lt_card.mp htwo with
      ⟨x, hxInter, y, hyInter, hxy⟩
    rcases Finset.mem_inter.mp hxInter with ⟨hxV, hxr⟩
    rcases Finset.mem_inter.mp hyInter with ⟨hyV, hyr⟩
    rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (hminimal x hxV) with
      ⟨τ, hτpos, hτfour⟩
    by_cases hτr : τ = r
    · subst τ
      have hsub :
          SelectedClass (A \ (V.erase x)) center r ⊆
            (SelectedClass A center r).erase y := by
        intro z hz
        rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzdist⟩
        have hzFull :
            z ∈ SelectedClass A center r :=
          mem_selectedClass.mpr
            ⟨(Finset.mem_sdiff.mp hzRemaining).1, hzdist⟩
        apply Finset.mem_erase.mpr
        refine ⟨?_, hzFull⟩
        intro hzy
        subst z
        exact (Finset.mem_sdiff.mp hzRemaining).2
          (Finset.mem_erase.mpr ⟨hxy.symm, hyV⟩)
      have hcardLe := Finset.card_le_card hsub
      rw [Finset.card_erase_of_mem hyr, hrFour] at hcardLe
      omega
    · have hxNotTau :
          x ∉ SelectedClass A center τ := by
        intro hxτ
        apply hτr
        exact (mem_selectedClass.mp hxτ).2.symm.trans
          (mem_selectedClass.mp hxr).2
      have hsub :
          SelectedClass (A \ (V.erase x)) center τ ⊆
            SelectedClass (A \ V) center τ := by
        intro z hz
        rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzdist⟩
        rcases Finset.mem_sdiff.mp hzRemaining with
          ⟨hzA, hzNotErase⟩
        apply mem_selectedClass.mpr
        refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzdist⟩
        intro hzV
        have hzx : z = x := by
          by_contra hne
          exact hzNotErase (Finset.mem_erase.mpr ⟨hne, hzV⟩)
        subst z
        exact hxNotTau (mem_selectedClass.mpr ⟨hzA, hzdist⟩)
      apply hblocked
      refine ⟨τ, hτpos, ?_⟩
      change 4 ≤ (SelectedClass (A \ V) center τ).card
      exact hτfour.trans (Finset.card_le_card hsub)
  omega

theorem exists_prescribedCenter_blockingSubset_hits_two_exactRows
    {D : CounterexampleData}
    (hmin : D.Minimal)
    {center : ℝ²} {r ρ : ℝ}
    (hcenterA : center ∈ D.A)
    (hdelete : (D.A.erase center).Nonempty)
    (hr : 0 < r)
    (hρ : 0 < ρ)
    (hrρ : r ≠ ρ)
    (hrFour : (SelectedClass D.A center r).card = 4)
    (hρFour : (SelectedClass D.A center ρ).card = 4) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ D.A.erase center ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      (∃ x ∈ V, x ∈ SelectedClass D.A center r) ∧
      (∃ y ∈ V, y ∈ SelectedClass D.A center ρ) ∧
      (V ∩ SelectedClass D.A center r).card = 1 ∧
      (V ∩ SelectedClass D.A center ρ).card = 1 ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  have hremaining : (D.A \ D.A.erase center).Nonempty := by
    refine ⟨center, ?_⟩
    simp [hcenterA]
  rcases exists_global_cardMinimal_blocking_subdeletion
      hmin (Finset.erase_subset center D.A) hdelete hremaining with
    ⟨newCenter, hnewCenter, V, hVne, hVsub, hblocked, hminimal⟩
  have hnewCenterEq : newCenter = center := by
    rcases Finset.mem_sdiff.mp hnewCenter with ⟨hnewA, hnewNotErase⟩
    by_contra hne
    exact hnewNotErase (Finset.mem_erase.mpr ⟨hne, hnewA⟩)
  subst newCenter
  have hrInter :
      (V ∩ SelectedClass D.A center r).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hr hrFour hblocked hminimal
  have hρInter :
      (V ∩ SelectedClass D.A center ρ).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hρ hρFour hblocked hminimal
  have hrHit : ∃ x ∈ V, x ∈ SelectedClass D.A center r := by
    by_contra hnoHit
    apply hblocked
    refine ⟨r, hr, ?_⟩
    change 4 ≤ (SelectedClass (D.A \ V) center r).card
    have hclassEq :
        SelectedClass (D.A \ V) center r =
          SelectedClass D.A center r := by
      ext z
      constructor
      · intro hz
        exact mem_selectedClass.mpr
          ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hz).1).1,
            (mem_selectedClass.mp hz).2⟩
      · intro hz
        rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
        apply mem_selectedClass.mpr
        refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzdist⟩
        intro hzV
        exact hnoHit ⟨z, hzV, mem_selectedClass.mpr ⟨hzA, hzdist⟩⟩
    rw [hclassEq, hrFour]
  have hρHit : ∃ y ∈ V, y ∈ SelectedClass D.A center ρ := by
    by_contra hnoHit
    apply hblocked
    refine ⟨ρ, hρ, ?_⟩
    change 4 ≤ (SelectedClass (D.A \ V) center ρ).card
    have hclassEq :
        SelectedClass (D.A \ V) center ρ =
          SelectedClass D.A center ρ := by
      ext z
      constructor
      · intro hz
        exact mem_selectedClass.mpr
          ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hz).1).1,
            (mem_selectedClass.mp hz).2⟩
      · intro hz
        rcases mem_selectedClass.mp hz with ⟨hzA, hzdist⟩
        apply mem_selectedClass.mpr
        refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzdist⟩
        intro hzV
        exact hnoHit ⟨z, hzV, mem_selectedClass.mpr ⟨hzA, hzdist⟩⟩
    rw [hclassEq, hρFour]
  rcases hrHit with ⟨x, hxV, hxr⟩
  rcases hρHit with ⟨y, hyV, hyρ⟩
  have hxy : x ≠ y := by
    intro hxy
    apply hrρ
    calc
      r = dist center x := (mem_selectedClass.mp hxr).2.symm
      _ = dist center y := by rw [hxy]
      _ = ρ := (mem_selectedClass.mp hyρ).2
  have htwo : 2 ≤ V.card := by
    have hpairSub : ({x, y} : Finset ℝ²) ⊆ V := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hxV
      · exact hyV
    have hcard := Finset.card_le_card hpairSub
    simpa [hxy] using hcard
  have hterminal :
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t) ∨
        Nonempty (MinimalDeletionCore D.A V center)) := by
    by_cases hcollision :
        ∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist center s = dist center t
    · exact Or.inl hcollision
    · apply Or.inr
      apply exists_minimalDeletionCore
          (hVsub.trans (Finset.erase_subset center D.A))
          hcenterA
      · intro s hsV t htV hst hdist
        exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
      · exact hblocked
      · exact hminimal
  exact ⟨V, hVne, hVsub, hblocked, ⟨x, hxV, hxr⟩,
    ⟨y, hyV, hyρ⟩, hrInter, hρInter, htwo, hterminal⟩

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem collision_radius_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    0 < radius := by
  have hdist₁ :
      dist S.oppApex1 P.source₁ = radius :=
    (mem_selectedClass.mp P.source₁_mem_radius).2
  have hdist₂ :
      dist S.oppApex1 P.source₂ = radius :=
    (mem_selectedClass.mp P.source₂_mem_radius).2
  have hnonneg : 0 ≤ radius := by
    rw [← hdist₁]
    exact dist_nonneg
  have hne : radius ≠ 0 := by
    intro hzero
    have hsource₁ : S.oppApex1 = P.source₁ :=
      dist_eq_zero.mp (hdist₁.trans hzero)
    have hsource₂ : S.oppApex1 = P.source₂ :=
      dist_eq_zero.mp (hdist₂.trans hzero)
    exact P.sources_ne (hsource₁.symm.trans hsource₂)
  exact lt_of_le_of_ne hnonneg (Ne.symm hne)

/-- In the live two-collision packet, global minimality produces a blocking
subdeletion at the first apex which hits both exact rows.  Each hit is either
one of the named strict-cap sources or an off-strict-cap point of that row.

The off-strict-cap alternatives are the precise unresolved output: the local
collision hypotheses do not force the minimal deletion to choose a named
source rather than one of the two other points in an exact-four row. -/
theorem exists_firstApex_blockingSubset_hits_collisionRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂}) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ D.A.erase S.oppApex1 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) S.oppApex1 ∧
      (∃ x ∈ V,
        x ∈ SelectedClass D.A S.oppApex1 radius ∧
          (x = P.source₁ ∨ x = P.source₂ ∨
            x ∉ S.capInteriorByIndex S.oppIndex1)) ∧
      (∃ y ∈ V,
        y ∈ SelectedClass D.A S.oppApex1 ρ ∧
          (y = Pρ.source₁ ∨ y = Pρ.source₂ ∨
            y ∉ S.capInteriorByIndex S.oppIndex1)) ∧
      (V ∩ SelectedClass D.A S.oppApex1 radius).card = 1 ∧
      (V ∩ SelectedClass D.A S.oppApex1 ρ).card = 1 ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist S.oppApex1 s = dist S.oppApex1 t) ∨
        Nonempty (MinimalDeletionCore D.A V S.oppApex1)) := by
  classical
  have hrpos : 0 < radius := collision_radius_pos P
  have hρpos : 0 < ρ := collision_radius_pos Pρ
  have hsourceNe : P.source₁ ≠ S.oppApex1 := by
    have hdistPos : 0 < dist S.oppApex1 P.source₁ := by
      rw [(mem_selectedClass.mp P.source₁_mem_radius).2]
      exact hrpos
    exact (dist_pos.mp hdistPos).symm
  have hdelete : (D.A.erase S.oppApex1).Nonempty :=
    ⟨P.source₁,
      Finset.mem_erase.mpr ⟨hsourceNe, P.source₁_mem_A⟩⟩
  rcases exists_prescribedCenter_blockingSubset_hits_two_exactRows
      R.minimal (oppApex1_mem_A S) hdelete hrpos hρpos hρne.symm
      hfrontierFour hρfour with
    ⟨V, hVne, hVsub, hblocked, hrHit, hρHit,
      hrInter, hρInter, htwo, hterminal⟩
  rcases hrHit with ⟨x, hxV, hxr⟩
  rcases hρHit with ⟨y, hyV, hyρ⟩
  have hxLocation :
      x = P.source₁ ∨ x = P.source₂ ∨
        x ∉ S.capInteriorByIndex S.oppIndex1 := by
    by_cases hxInterior : x ∈ S.capInteriorByIndex S.oppIndex1
    · have hxPair :
          x ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
        rw [← hfrontierInteriorEq]
        exact Finset.mem_inter.mpr ⟨hxr, hxInterior⟩
      rcases Finset.mem_insert.mp hxPair with hx | hx
      · exact Or.inl hx
      · exact Or.inr (Or.inl (Finset.mem_singleton.mp hx))
    · exact Or.inr (Or.inr hxInterior)
  have hyLocation :
      y = Pρ.source₁ ∨ y = Pρ.source₂ ∨
        y ∉ S.capInteriorByIndex S.oppIndex1 := by
    by_cases hyInterior : y ∈ S.capInteriorByIndex S.oppIndex1
    · have hyPair :
          y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
        rw [← hρInteriorEq]
        exact Finset.mem_inter.mpr ⟨hyρ, hyInterior⟩
      rcases Finset.mem_insert.mp hyPair with hy | hy
      · exact Or.inl hy
      · exact Or.inr (Or.inl (Finset.mem_singleton.mp hy))
    · exact Or.inr (Or.inr hyInterior)
  exact ⟨V, hVne, hVsub, hblocked,
    ⟨x, hxV, hxr, hxLocation⟩,
    ⟨y, hyV, hyρ, hyLocation⟩,
    hrInter, hρInter, htwo, hterminal⟩

#print axioms blockingSubset_inter_exactFourRow_card_eq_one
#print axioms exists_prescribedCenter_blockingSubset_hits_two_exactRows
#print axioms exists_firstApex_blockingSubset_hits_collisionRows

end ATailCollisionGlobalMath
end Problem97
