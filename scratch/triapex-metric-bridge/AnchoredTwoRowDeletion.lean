import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Anchoring a minimal deletion core at prescribed exact-row sources

If deleting `V` blocks K4 at `center`, an exact four-row may be used to
replace every deletion from that row by deletion of any prescribed member
`p` of the row.  The replacement remains blocking: the prescribed row has
only three survivors, while any witness on another radius would already
have survived deletion of `V`.

Applying this successively to two distinct exact rows and then shrinking the
result to a deletion-minimal blocker produces a core containing any prescribed
source from each row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTriapexMetricBridgeScratch

open ATAILStageOneMinimalDeletionCore
open ATailGlobalMinimalDeletion

private def replaceRowHit
    (V : Finset ℝ²) (A : Finset ℝ²) (center : ℝ²) (r : ℝ) (p : ℝ²) :
    Finset ℝ² :=
  (V \ SelectedClass A center r) ∪ {p}

/-- Replacing all deleted points from an exact four-row by one prescribed
member of that row preserves failure of K4 at the center. -/
theorem not_hasNEquidistantPointsAt_replaceRowHit
    {A V : Finset ℝ²} {center p : ℝ²} {r : ℝ}
    (hp : p ∈ SelectedClass A center r)
    (hrFour : (SelectedClass A center r).card = 4)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ V) center) :
    ¬ HasNEquidistantPointsAt 4
      (A \ replaceRowHit V A center r p) center := by
  classical
  intro hsurvives
  rcases hsurvives with ⟨τ, hτpos, hτfour⟩
  by_cases hτr : τ = r
  · subst τ
    have hsub :
        SelectedClass
            (A \ replaceRowHit V A center r p) center r ⊆
          (SelectedClass A center r).erase p := by
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzdist⟩
      apply Finset.mem_erase.mpr
      refine ⟨?_, mem_selectedClass.mpr
        ⟨(Finset.mem_sdiff.mp hzRemaining).1, hzdist⟩⟩
      intro hzp
      subst z
      exact (Finset.mem_sdiff.mp hzRemaining).2
        (Finset.mem_union_right _ (Finset.mem_singleton_self p))
    have hcardLe := Finset.card_le_card hsub
    rw [Finset.card_erase_of_mem hp, hrFour] at hcardLe
    change 4 ≤
      (SelectedClass
        (A \ replaceRowHit V A center r p) center r).card at hτfour
    omega
  · apply hblocked
    refine ⟨τ, hτpos, ?_⟩
    change 4 ≤ (SelectedClass (A \ V) center τ).card
    refine hτfour.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzdist⟩
    rcases Finset.mem_sdiff.mp hzRemaining with
      ⟨hzA, hzNotReplacement⟩
    apply mem_selectedClass.mpr
    refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzdist⟩
    intro hzV
    have hzRow : z ∈ SelectedClass A center r := by
      by_contra hzNotRow
      exact hzNotReplacement
        (Finset.mem_union_left _
          (Finset.mem_sdiff.mpr ⟨hzV, hzNotRow⟩))
    apply hτr
    exact hzdist.symm.trans (mem_selectedClass.mp hzRow).2

/-- The replacement has exactly the prescribed point on its target row. -/
theorem replaceRowHit_inter_selectedClass
    {A V : Finset ℝ²} {center p : ℝ²} {r : ℝ}
    (hp : p ∈ SelectedClass A center r) :
    replaceRowHit V A center r p ∩ SelectedClass A center r = {p} := by
  classical
  ext z
  simp only [replaceRowHit, Finset.mem_inter, Finset.mem_union,
    Finset.mem_sdiff, Finset.mem_singleton]
  constructor
  · rintro ⟨(⟨_, hzNotRow⟩ | rfl), hzRow⟩
    · exact (hzNotRow hzRow).elim
    · rfl
  · intro hz
    subst z
    exact ⟨Or.inr rfl, hp⟩

/-- Two successive replacements anchor a blocking deletion simultaneously
at arbitrary prescribed members of two distinct exact four-rows. -/
theorem exists_anchored_minimal_blocking_subdeletion_of_two_exactRows
    {A V : Finset ℝ²} {center p q : ℝ²} {r ρ : ℝ}
    (hp : p ∈ SelectedClass A center r)
    (hq : q ∈ SelectedClass A center ρ)
    (hrρ : r ≠ ρ)
    (hrFour : (SelectedClass A center r).card = 4)
    (hρFour : (SelectedClass A center ρ).card = 4)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ V) center) :
    ∃ U : Finset ℝ²,
      U.Nonempty ∧
      U ⊆ replaceRowHit (replaceRowHit V A center r p) A center ρ q ∧
      p ∈ U ∧
      q ∈ U ∧
      ¬ HasNEquidistantPointsAt 4 (A \ U) center ∧
      ∀ s ∈ U,
        HasNEquidistantPointsAt 4 (A \ (U.erase s)) center := by
  classical
  let W₁ := replaceRowHit V A center r p
  let W₂ := replaceRowHit W₁ A center ρ q
  have hW₁blocked :
      ¬ HasNEquidistantPointsAt 4 (A \ W₁) center := by
    exact not_hasNEquidistantPointsAt_replaceRowHit hp hrFour hblocked
  have hW₂blocked :
      ¬ HasNEquidistantPointsAt 4 (A \ W₂) center := by
    exact not_hasNEquidistantPointsAt_replaceRowHit hq hρFour hW₁blocked
  have hfull : HasNEquidistantPointsAt 4 A center := by
    refine ⟨r, ?_, ?_⟩
    · have hpdist := (mem_selectedClass.mp hp).2
      have hnonneg : 0 ≤ r := by
        rw [← hpdist]
        exact dist_nonneg
      have hrne : r ≠ 0 := by
        intro hrzero
        have hcardOne :
            (SelectedClass A center r).card ≤ 1 := by
          subst r
          have hsub :
              SelectedClass A center 0 ⊆ {center} := by
            intro z hz
            have hzdist := (mem_selectedClass.mp hz).2
            have hzc : z = center := by
              exact (dist_eq_zero.mp hzdist).symm
            simpa [hzc]
          simpa using Finset.card_le_card hsub
        omega
      exact lt_of_le_of_ne hnonneg (Ne.symm hrne)
    · simpa [hrFour]
  rcases exists_cardMinimal_blocking_subdeletion hfull hW₂blocked with
    ⟨U, hUne, hUW₂, hUblocked, hUminimal⟩
  have hrowsDisjoint :
      Disjoint (SelectedClass A center r) (SelectedClass A center ρ) := by
    rw [Finset.disjoint_left]
    intro z hzr hzρ
    apply hrρ
    exact (mem_selectedClass.mp hzr).2.symm.trans
      (mem_selectedClass.mp hzρ).2
  have hpNotρ : p ∉ SelectedClass A center ρ := by
    exact fun hpρ => Finset.disjoint_left.mp hrowsDisjoint hp hpρ
  have hW₂r :
      W₂ ∩ SelectedClass A center r = {p} := by
    have hW₁r :
        W₁ ∩ SelectedClass A center r = {p} := by
      exact replaceRowHit_inter_selectedClass hp
    ext z
    simp only [W₂, replaceRowHit, Finset.mem_inter, Finset.mem_union,
      Finset.mem_sdiff, Finset.mem_singleton]
    constructor
    · rintro ⟨(⟨hzW₁, _⟩ | rfl), hzr⟩
      · have : z ∈ ({p} : Finset ℝ²) := by
          rw [← hW₁r]
          exact Finset.mem_inter.mpr ⟨hzW₁, hzr⟩
        simpa using this
      · exact (hpNotρ hzr).elim
    · intro hzp
      have hzp' : z = p := Finset.mem_singleton.mp hzp
      subst z
      exact ⟨Or.inl ⟨?_, hpNotρ⟩, hp⟩
      have : p ∈ ({p} : Finset ℝ²) := Finset.mem_singleton_self p
      rw [← hW₁r] at this
      exact (Finset.mem_inter.mp this).1
  have hW₂ρ :
      W₂ ∩ SelectedClass A center ρ = {q} := by
    exact replaceRowHit_inter_selectedClass hq
  have hpU : p ∈ U := by
    by_contra hpNotU
    apply hUblocked
    refine ⟨r, ?_, ?_⟩
    · have hpdist := (mem_selectedClass.mp hp).2
      have hnonneg : 0 ≤ r := by
        rw [← hpdist]
        exact dist_nonneg
      have hrne : r ≠ 0 := by
        intro hrzero
        subst r
        have hcardLe :
            (SelectedClass A center 0).card ≤ 1 := by
          have hsub : SelectedClass A center 0 ⊆ {center} := by
            intro z hz
            simpa [(dist_eq_zero.mp (mem_selectedClass.mp hz).2).symm]
          simpa using Finset.card_le_card hsub
        omega
      exact lt_of_le_of_ne hnonneg (Ne.symm hrne)
    · change 4 ≤ (SelectedClass (A \ U) center r).card
      have hclassEq :
          SelectedClass (A \ U) center r =
            SelectedClass A center r := by
        ext z
        constructor
        · intro hz
          exact mem_selectedClass.mpr
            ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hz).1).1,
              (mem_selectedClass.mp hz).2⟩
        · intro hz
          apply mem_selectedClass.mpr
          refine ⟨Finset.mem_sdiff.mpr
            ⟨(mem_selectedClass.mp hz).1, ?_⟩,
            (mem_selectedClass.mp hz).2⟩
          intro hzU
          have hzW₂ := hUW₂ hzU
          have hzSingleton : z ∈ ({p} : Finset ℝ²) := by
            rw [← hW₂r]
            exact Finset.mem_inter.mpr ⟨hzW₂, hz⟩
          exact hpNotU (Finset.mem_singleton.mp hzSingleton ▸ hzU)
      rw [hclassEq, hrFour]
  have hqU : q ∈ U := by
    by_contra hqNotU
    apply hUblocked
    refine ⟨ρ, ?_, ?_⟩
    · have hqdist := (mem_selectedClass.mp hq).2
      have hnonneg : 0 ≤ ρ := by
        rw [← hqdist]
        exact dist_nonneg
      have hρne : ρ ≠ 0 := by
        intro hρzero
        subst ρ
        have hcardLe :
            (SelectedClass A center 0).card ≤ 1 := by
          have hsub : SelectedClass A center 0 ⊆ {center} := by
            intro z hz
            simpa [(dist_eq_zero.mp (mem_selectedClass.mp hz).2).symm]
          simpa using Finset.card_le_card hsub
        omega
      exact lt_of_le_of_ne hnonneg (Ne.symm hρne)
    · change 4 ≤ (SelectedClass (A \ U) center ρ).card
      have hclassEq :
          SelectedClass (A \ U) center ρ =
            SelectedClass A center ρ := by
        ext z
        constructor
        · intro hz
          exact mem_selectedClass.mpr
            ⟨(Finset.mem_sdiff.mp (mem_selectedClass.mp hz).1).1,
              (mem_selectedClass.mp hz).2⟩
        · intro hz
          apply mem_selectedClass.mpr
          refine ⟨Finset.mem_sdiff.mpr
            ⟨(mem_selectedClass.mp hz).1, ?_⟩,
            (mem_selectedClass.mp hz).2⟩
          intro hzU
          have hzW₂ := hUW₂ hzU
          have hzSingleton : z ∈ ({q} : Finset ℝ²) := by
            rw [← hW₂ρ]
            exact Finset.mem_inter.mpr ⟨hzW₂, hz⟩
          exact hqNotU (Finset.mem_singleton.mp hzSingleton ▸ hzU)
      rw [hclassEq, hρFour]
  exact ⟨U, hUne, hUW₂, hpU, hqU, hUblocked, hUminimal⟩

end ATailTriapexMetricBridgeScratch
end Problem97
