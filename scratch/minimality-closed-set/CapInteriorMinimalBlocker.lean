import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# A cap-interior minimal blocker at an opposite apex

Deleting the entire strict opposite-cap interior leaves at most two points on
every positive-radius class centered at the corresponding opposite apex.
Consequently that deletion blocks K4 at the apex.  A cardinality-minimal
subdeletion therefore hits every exact-four row exactly once.

This scratch module is source-clean and does not edit the production frontier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCapInteriorMinimalBlocker

open ATailGlobalMinimalDeletion
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATAILStageOneMinimalDeletionCore

/-- At most two members of a positive-radius class centered at an indexed
opposite apex lie outside the corresponding strict cap interior. -/
theorem selectedClass_sdiff_capInteriorByIndex_card_le_two
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius) :
    (SelectedClass A (S.oppositeVertexByIndex i) radius \
      S.capInteriorByIndex i).card ≤ 2 := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  calc
    (SelectedClass A (S.oppositeVertexByIndex i) radius \
          S.capInteriorByIndex i).card =
        (T \ S.capInteriorByIndex i).card := by rfl
    _ ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i)).card :=
      Finset.card_le_card hcover
    _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
          (T ∩ S.rightAdjacentCapByIndex i).card :=
      Finset.card_union_le _ _
    _ ≤ 1 + 1 := by omega
    _ = 2 := by norm_num

/-- Deleting the full strict opposite-cap interior blocks every K4 witness at
the indexed opposite apex, including witnesses whose full row has more than
four members. -/
theorem capInteriorByIndex_deletion_blocks_oppositeVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) :
    ¬ HasNEquidistantPointsAt 4
      (A \ S.capInteriorByIndex i) (S.oppositeVertexByIndex i) := by
  classical
  intro hfour
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hfour with
    ⟨radius, hradius, hcard⟩
  have hsub :
      SelectedClass (A \ S.capInteriorByIndex i)
          (S.oppositeVertexByIndex i) radius ⊆
        SelectedClass A (S.oppositeVertexByIndex i) radius \
          S.capInteriorByIndex i := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
    rcases Finset.mem_sdiff.mp hxA with ⟨hxA, hxnot⟩
    exact Finset.mem_sdiff.mpr
      ⟨mem_selectedClass.mpr ⟨hxA, hxdist⟩, hxnot⟩
  have hle := Finset.card_le_card hsub
  have houtside :=
    selectedClass_sdiff_capInteriorByIndex_card_le_two
      S hconv i hradius
  omega

/-- One may retain two strict-interior points on distinct apex radii and still
block K4 at the opposite apex.  Every reduced radius class has at most two
points outside the strict interior and at most one of the retained points. -/
theorem capInteriorByIndex_keep_two_distinctRadii_deletion_blocks
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {keep₁ keep₂ : ℝ²}
    (hkeep :
      dist (S.oppositeVertexByIndex i) keep₁ ≠
        dist (S.oppositeVertexByIndex i) keep₂) :
    ¬ HasNEquidistantPointsAt 4
      (A \ (S.capInteriorByIndex i \ {keep₁, keep₂}))
      (S.oppositeVertexByIndex i) := by
  classical
  intro hfour
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hfour with
    ⟨radius, hradius, hcard⟩
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hkeepCard :
      (T ∩ ({keep₁, keep₂} : Finset ℝ²)).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    rcases Finset.mem_inter.mp hx with ⟨hxT, hxKeep⟩
    rcases Finset.mem_inter.mp hy with ⟨hyT, hyKeep⟩
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxKeep hyKeep
    rcases hxKeep with rfl | rfl <;>
      rcases hyKeep with rfl | rfl
    · rfl
    · exfalso
      apply hkeep
      exact (mem_selectedClass.mp hxT).2.trans
        (mem_selectedClass.mp hyT).2.symm
    · exfalso
      apply hkeep
      exact (mem_selectedClass.mp hyT).2.trans
        (mem_selectedClass.mp hxT).2.symm
    · rfl
  have hsub :
      SelectedClass
          (A \ (S.capInteriorByIndex i \ {keep₁, keep₂}))
          (S.oppositeVertexByIndex i) radius ⊆
        (T \ S.capInteriorByIndex i) ∪
          (T ∩ ({keep₁, keep₂} : Finset ℝ²)) := by
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzdist⟩
    rcases Finset.mem_sdiff.mp hzRemaining with ⟨hzA, hzNotDeleted⟩
    have hzT : z ∈ T :=
      mem_selectedClass.mpr ⟨hzA, hzdist⟩
    by_cases hzInterior : z ∈ S.capInteriorByIndex i
    · apply Finset.mem_union_right
      apply Finset.mem_inter.mpr
      refine ⟨hzT, ?_⟩
      by_contra hzNotKeep
      exact hzNotDeleted
        (Finset.mem_sdiff.mpr ⟨hzInterior, hzNotKeep⟩)
    · apply Finset.mem_union_left
      exact Finset.mem_sdiff.mpr ⟨hzT, hzInterior⟩
  have houtside :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    simpa [T] using
      selectedClass_sdiff_capInteriorByIndex_card_le_two
        S hconv i hradius
  have hle := Finset.card_le_card hsub
  have hunion :
      ((T \ S.capInteriorByIndex i) ∪
          (T ∩ ({keep₁, keep₂} : Finset ℝ²))).card ≤ 3 := by
    calc
      ((T \ S.capInteriorByIndex i) ∪
          (T ∩ ({keep₁, keep₂} : Finset ℝ²))).card ≤
          (T \ S.capInteriorByIndex i).card +
            (T ∩ ({keep₁, keep₂} : Finset ℝ²)).card :=
        Finset.card_union_le _ _
      _ ≤ 2 + 1 := by omega
      _ = 3 := by norm_num
  omega

/-- A deletion-minimal obstruction meets an exact four-point row exactly once.
This is independent of the geometric source of the obstruction. -/
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

/-- Once a critical-shell source is deleted, its chosen blocker remains failed
after any larger deletion.  This is the deterministic closure edge supplied by
a `CriticalShellSystem`. -/
theorem criticalShellCenter_blocked_after_deleting_source
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {V : Finset ℝ²} {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceV : source ∈ V) :
    ¬ HasNEquidistantPointsAt 4
      (D.A \ V) (H.centerAt source hsourceA) := by
  intro hsurvives
  apply H.no_qfree_at source hsourceA
  rcases hsurvives with ⟨r, hr, hcard⟩
  refine ⟨r, hr, ?_⟩
  change 4 ≤
    (SelectedClass (D.A.erase source)
      (H.centerAt source hsourceA) r).card
  change 4 ≤
    (SelectedClass (D.A \ V)
      (H.centerAt source hsourceA) r).card at hcard
  exact hcard.trans (Finset.card_le_card (by
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzRemaining, hzDist⟩
    rcases Finset.mem_sdiff.mp hzRemaining with ⟨hzA, hzNotV⟩
    apply mem_selectedClass.mpr
    refine ⟨Finset.mem_erase.mpr ⟨?_, hzA⟩, hzDist⟩
    intro hzs
    exact hzNotV (hzs ▸ hsourceV)))

/-- The full cap-interior deletion admits a minimal subdeletion that hits two
prescribed distinct exact-four rows exactly once.  If the strict-interior parts
of those rows are named pairs, the two hits are forced to be named sources. -/
theorem exists_capInterior_minimalBlocker_hits_two_named_exactRows
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {r ρ : ℝ} {x₁ x₂ y₁ y₂ : ℝ²}
    (hfull :
      HasNEquidistantPointsAt 4 D.A (S.oppositeVertexByIndex i))
    (hr : 0 < r)
    (hρ : 0 < ρ)
    (hrρ : r ≠ ρ)
    (hrFour :
      (SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 4)
    (hρFour :
      (SelectedClass D.A (S.oppositeVertexByIndex i) ρ).card = 4)
    (hrInterior :
      SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i = {x₁, x₂})
    (hρInterior :
      SelectedClass D.A (S.oppositeVertexByIndex i) ρ ∩
          S.capInteriorByIndex i = {y₁, y₂}) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ S.capInteriorByIndex i ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A \ V) (S.oppositeVertexByIndex i) ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ V.erase s) (S.oppositeVertexByIndex i)) ∧
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) r).card = 1 ∧
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) ρ).card = 1 ∧
      (∃ x ∈ V, x = x₁ ∨ x = x₂) ∧
      (∃ y ∈ V, y = y₁ ∨ y = y₂) ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t) ∨
        Nonempty
          (MinimalDeletionCore D.A V
            (S.oppositeVertexByIndex i))) := by
  classical
  have hblocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A \ S.capInteriorByIndex i)
        (S.oppositeVertexByIndex i) :=
    capInteriorByIndex_deletion_blocks_oppositeVertex S D.convex i
  rcases exists_cardMinimal_blocking_subdeletion hfull hblocked with
    ⟨V, hVne, hVsub, hVblocked, hVminimal⟩
  have hrInterCard :
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) r).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hr hrFour hVblocked hVminimal
  have hρInterCard :
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) ρ).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hρ hρFour hVblocked hVminimal
  have hrHit :
      ∃ x ∈ V, x = x₁ ∨ x = x₂ := by
    have hnonempty :
        (V ∩ SelectedClass D.A
          (S.oppositeVertexByIndex i) r).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨x, hx⟩
    rcases Finset.mem_inter.mp hx with ⟨hxV, hxr⟩
    have hxInterior := hVsub hxV
    have hxPair : x ∈ ({x₁, x₂} : Finset ℝ²) := by
      rw [← hrInterior]
      exact Finset.mem_inter.mpr ⟨hxr, hxInterior⟩
    rcases Finset.mem_insert.mp hxPair with h | h
    · exact ⟨x, hxV, Or.inl h⟩
    · exact ⟨x, hxV, Or.inr (Finset.mem_singleton.mp h)⟩
  have hρHit :
      ∃ y ∈ V, y = y₁ ∨ y = y₂ := by
    have hnonempty :
        (V ∩ SelectedClass D.A
          (S.oppositeVertexByIndex i) ρ).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨y, hy⟩
    rcases Finset.mem_inter.mp hy with ⟨hyV, hyρ⟩
    have hyInterior := hVsub hyV
    have hyPair : y ∈ ({y₁, y₂} : Finset ℝ²) := by
      rw [← hρInterior]
      exact Finset.mem_inter.mpr ⟨hyρ, hyInterior⟩
    rcases Finset.mem_insert.mp hyPair with h | h
    · exact ⟨y, hyV, Or.inl h⟩
    · exact ⟨y, hyV, Or.inr (Finset.mem_singleton.mp h)⟩
  rcases hrHit with ⟨x, hxV, hxEq⟩
  rcases hρHit with ⟨y, hyV, hyEq⟩
  have hxr :
      x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r := by
    have hxPair : x ∈ ({x₁, x₂} : Finset ℝ²) := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hxEq
    have hxInter :
        x ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i := by
      rw [hrInterior]
      exact hxPair
    exact (Finset.mem_inter.mp hxInter).1
  have hyρ :
      y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) ρ := by
    have hyPair : y ∈ ({y₁, y₂} : Finset ℝ²) := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hyEq
    have hyInter :
        y ∈ SelectedClass D.A (S.oppositeVertexByIndex i) ρ ∩
          S.capInteriorByIndex i := by
      rw [hρInterior]
      exact hyPair
    exact (Finset.mem_inter.mp hyInter).1
  have hxy : x ≠ y := by
    intro hxy
    apply hrρ
    calc
      r = dist (S.oppositeVertexByIndex i) x :=
        (mem_selectedClass.mp hxr).2.symm
      _ = dist (S.oppositeVertexByIndex i) y := by rw [hxy]
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
      (∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t) ∨
        Nonempty
          (MinimalDeletionCore D.A V
            (S.oppositeVertexByIndex i)) := by
    by_cases hcollision :
        ∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t
    · exact Or.inl hcollision
    · apply Or.inr
      apply exists_minimalDeletionCore
      · intro z hzV
        exact S.capInteriorByIndex_subset i (hVsub hzV)
      · exact S.oppositeVertexByIndex_mem i
      · intro s hsV t htV hst hdist
        exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
      · exact hVblocked
      · exact hVminimal
  exact ⟨V, hVne, hVsub, hVblocked, hVminimal,
    hrInterCard, hρInterCard,
    ⟨x, hxV, hxEq⟩, ⟨y, hyV, hyEq⟩, htwo, hterminal⟩

/-- By retaining the second named source on each of two distinct exact rows
before minimizing the deletion, the minimal blocker is forced to contain the
two first named sources themselves.  This removes the final choice in the
two-row hit conclusion above. -/
theorem exists_capInterior_minimalBlocker_contains_prescribedRowSources
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {r ρ : ℝ} {x₁ x₂ y₁ y₂ : ℝ²}
    (hfull :
      HasNEquidistantPointsAt 4 D.A (S.oppositeVertexByIndex i))
    (hr : 0 < r)
    (hρ : 0 < ρ)
    (hrρ : r ≠ ρ)
    (hrFour :
      (SelectedClass D.A (S.oppositeVertexByIndex i) r).card = 4)
    (hρFour :
      (SelectedClass D.A (S.oppositeVertexByIndex i) ρ).card = 4)
    (hrInterior :
      SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i = {x₁, x₂})
    (hρInterior :
      SelectedClass D.A (S.oppositeVertexByIndex i) ρ ∩
          S.capInteriorByIndex i = {y₁, y₂}) :
    ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ S.capInteriorByIndex i \ {x₂, y₂} ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A \ V) (S.oppositeVertexByIndex i) ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ V.erase s) (S.oppositeVertexByIndex i)) ∧
      x₁ ∈ V ∧
      y₁ ∈ V ∧
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) r).card = 1 ∧
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) ρ).card = 1 ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t) ∨
        Nonempty
          (MinimalDeletionCore D.A V
            (S.oppositeVertexByIndex i))) := by
  classical
  have hx₂Inter :
      x₂ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i := by
    rw [hrInterior]
    simp
  have hy₂Inter :
      y₂ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) ρ ∩
        S.capInteriorByIndex i := by
    rw [hρInterior]
    simp
  have hkeep :
      dist (S.oppositeVertexByIndex i) x₂ ≠
        dist (S.oppositeVertexByIndex i) y₂ := by
    rw [(mem_selectedClass.mp (Finset.mem_inter.mp hx₂Inter).1).2,
      (mem_selectedClass.mp (Finset.mem_inter.mp hy₂Inter).1).2]
    exact hrρ
  have hdeletedBlocks :
      ¬ HasNEquidistantPointsAt 4
        (D.A \ (S.capInteriorByIndex i \ {x₂, y₂}))
        (S.oppositeVertexByIndex i) :=
    capInteriorByIndex_keep_two_distinctRadii_deletion_blocks
      S D.convex i hkeep
  rcases exists_cardMinimal_blocking_subdeletion hfull hdeletedBlocks with
    ⟨V, hVne, hVsub, hVblocked, hVminimal⟩
  have hrInterCard :
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) r).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hr hrFour hVblocked hVminimal
  have hρInterCard :
      (V ∩ SelectedClass D.A
        (S.oppositeVertexByIndex i) ρ).card = 1 :=
    blockingSubset_inter_exactFourRow_card_eq_one
      hρ hρFour hVblocked hVminimal
  have hx₁V : x₁ ∈ V := by
    have hhit :
        (V ∩ SelectedClass D.A
          (S.oppositeVertexByIndex i) r).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hhit with ⟨x, hx⟩
    rcases Finset.mem_inter.mp hx with ⟨hxV, hxr⟩
    have hxDeleted := hVsub hxV
    have hxInterior := (Finset.mem_sdiff.mp hxDeleted).1
    have hxPair : x ∈ ({x₁, x₂} : Finset ℝ²) := by
      rw [← hrInterior]
      exact Finset.mem_inter.mpr ⟨hxr, hxInterior⟩
    rcases Finset.mem_insert.mp hxPair with h | h
    · simpa [h] using hxV
    · have hxx₂ : x = x₂ := Finset.mem_singleton.mp h
      exfalso
      exact (Finset.mem_sdiff.mp hxDeleted).2 (by simp [hxx₂])
  have hy₁V : y₁ ∈ V := by
    have hhit :
        (V ∩ SelectedClass D.A
          (S.oppositeVertexByIndex i) ρ).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hhit with ⟨y, hy⟩
    rcases Finset.mem_inter.mp hy with ⟨hyV, hyρ⟩
    have hyDeleted := hVsub hyV
    have hyInterior := (Finset.mem_sdiff.mp hyDeleted).1
    have hyPair : y ∈ ({y₁, y₂} : Finset ℝ²) := by
      rw [← hρInterior]
      exact Finset.mem_inter.mpr ⟨hyρ, hyInterior⟩
    rcases Finset.mem_insert.mp hyPair with h | h
    · simpa [h] using hyV
    · have hyy₂ : y = y₂ := Finset.mem_singleton.mp h
      exfalso
      exact (Finset.mem_sdiff.mp hyDeleted).2 (by simp [hyy₂])
  have hx₁r :
      x₁ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r := by
    have hx₁Inter :
        x₁ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i := by
      rw [hrInterior]
      simp
    exact (Finset.mem_inter.mp hx₁Inter).1
  have hy₁ρ :
      y₁ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) ρ := by
    have hy₁Inter :
        y₁ ∈ SelectedClass D.A (S.oppositeVertexByIndex i) ρ ∩
          S.capInteriorByIndex i := by
      rw [hρInterior]
      simp
    exact (Finset.mem_inter.mp hy₁Inter).1
  have hx₁y₁ : x₁ ≠ y₁ := by
    intro hxy
    apply hrρ
    calc
      r = dist (S.oppositeVertexByIndex i) x₁ :=
        (mem_selectedClass.mp hx₁r).2.symm
      _ = dist (S.oppositeVertexByIndex i) y₁ := by rw [hxy]
      _ = ρ := (mem_selectedClass.mp hy₁ρ).2
  have htwo : 2 ≤ V.card := by
    have hpairSub : ({x₁, y₁} : Finset ℝ²) ⊆ V := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hx₁V
      · exact hy₁V
    have hcard := Finset.card_le_card hpairSub
    simpa [hx₁y₁] using hcard
  have hterminal :
      (∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t) ∨
        Nonempty
          (MinimalDeletionCore D.A V
            (S.oppositeVertexByIndex i)) := by
    by_cases hcollision :
        ∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧
            dist (S.oppositeVertexByIndex i) s =
              dist (S.oppositeVertexByIndex i) t
    · exact Or.inl hcollision
    · apply Or.inr
      apply exists_minimalDeletionCore
      · intro z hzV
        exact S.capInteriorByIndex_subset i
          (Finset.mem_sdiff.mp (hVsub hzV)).1
      · exact S.oppositeVertexByIndex_mem i
      · intro s hsV t htV hst hdist
        exact hcollision ⟨s, hsV, t, htV, hst, hdist⟩
      · exact hVblocked
      · exact hVminimal
  exact ⟨V, hVne, hVsub, hVblocked, hVminimal,
    hx₁V, hy₁V, hrInterCard, hρInterCard, htwo, hterminal⟩

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1, hi]

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

/-- Direct first-apex specialization for the two source-exact collision rows
in the live frontier.  Unlike the earlier deletion of `D.A.erase oppApex1`,
all witnesses selected here lie in the strict cap interior, so the two row
hits are necessarily named collision sources. -/
theorem exists_firstApex_capInterior_minimalBlocker_hits_collisionRows
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
      V ⊆ S.capInteriorByIndex S.oppIndex1 ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) S.oppApex1 ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ V.erase s) S.oppApex1) ∧
      (V ∩ SelectedClass D.A S.oppApex1 radius).card = 1 ∧
      (V ∩ SelectedClass D.A S.oppApex1 ρ).card = 1 ∧
      (∃ x ∈ V, x = P.source₁ ∨ x = P.source₂) ∧
      (∃ y ∈ V, y = Pρ.source₁ ∨ y = Pρ.source₂) ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist S.oppApex1 s = dist S.oppApex1 t) ∨
        Nonempty (MinimalDeletionCore D.A V S.oppApex1)) := by
  have happ := oppositeVertexByIndex_oppIndex1 S
  have hfull :
      HasNEquidistantPointsAt 4 D.A
        (S.oppositeVertexByIndex S.oppIndex1) := by
    rw [happ]
    exact D.K4 S.oppApex1 (oppApex1_mem_A S)
  have hmain :=
    exists_capInterior_minimalBlocker_hits_two_named_exactRows
      S S.oppIndex1 hfull (collision_radius_pos P)
      (collision_radius_pos Pρ) hρne.symm
      (by simpa only [happ] using hfrontierFour)
      (by simpa only [happ] using hρfour)
      (by simpa only [happ] using hfrontierInteriorEq)
      (by simpa only [happ] using hρInteriorEq)
  simpa only [happ] using hmain

/-- Target-facing prescribed-source version: retain `source₂` on each exact
collision row, so the deletion-minimal blocker must contain both `source₁`
points. -/
theorem exists_firstApex_capInterior_minimalBlocker_contains_sourceOnEachRow
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
      V ⊆
        S.capInteriorByIndex S.oppIndex1 \
          {P.source₂, Pρ.source₂} ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) S.oppApex1 ∧
      (∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ V.erase s) S.oppApex1) ∧
      P.source₁ ∈ V ∧
      Pρ.source₁ ∈ V ∧
      (V ∩ SelectedClass D.A S.oppApex1 radius).card = 1 ∧
      (V ∩ SelectedClass D.A S.oppApex1 ρ).card = 1 ∧
      2 ≤ V.card ∧
      ((∃ s ∈ V, ∃ t ∈ V,
          s ≠ t ∧ dist S.oppApex1 s = dist S.oppApex1 t) ∨
        Nonempty (MinimalDeletionCore D.A V S.oppApex1)) := by
  have happ := oppositeVertexByIndex_oppIndex1 S
  have hfull :
      HasNEquidistantPointsAt 4 D.A
        (S.oppositeVertexByIndex S.oppIndex1) := by
    rw [happ]
    exact D.K4 S.oppApex1 (oppApex1_mem_A S)
  have hmain :=
    exists_capInterior_minimalBlocker_contains_prescribedRowSources
      S S.oppIndex1 hfull (collision_radius_pos P)
      (collision_radius_pos Pρ) hρne.symm
      (by simpa only [happ] using hfrontierFour)
      (by simpa only [happ] using hρfour)
      (by simpa only [happ] using hfrontierInteriorEq)
      (by simpa only [happ] using hρInteriorEq)
  simpa only [happ] using hmain

/-- The prescribed-source blocker gives three explicit failed centers after
one simultaneous deletion: the first opposite apex and the chosen critical
blockers of the two retained collision rows. -/
theorem exists_firstApex_capInterior_deletion_blocks_three_named_centers
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
      V ⊆
        S.capInteriorByIndex S.oppIndex1 \
          {P.source₂, Pρ.source₂} ∧
      P.source₁ ∈ V ∧
      Pρ.source₁ ∈ V ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) S.oppApex1 ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A \ V) (H.centerAt P.source₁ P.source₁_mem_A) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A \ V) (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
  rcases
      exists_firstApex_capInterior_minimalBlocker_contains_sourceOnEachRow
        P Pρ hρne hfrontierFour hρfour
          hfrontierInteriorEq hρInteriorEq with
    ⟨V, hVne, hVsub, hO, _hrestore, hP, hPρ,
      _hrCard, _hρCard, _htwo, _hterminal⟩
  exact ⟨V, hVne, hVsub, hP, hPρ, hO,
    criticalShellCenter_blocked_after_deleting_source
      H P.source₁_mem_A hP,
    criticalShellCenter_blocked_after_deleting_source
      H Pρ.source₁_mem_A hPρ⟩

#print axioms selectedClass_sdiff_capInteriorByIndex_card_le_two
#print axioms capInteriorByIndex_deletion_blocks_oppositeVertex
#print axioms capInteriorByIndex_keep_two_distinctRadii_deletion_blocks
#print axioms blockingSubset_inter_exactFourRow_card_eq_one
#print axioms criticalShellCenter_blocked_after_deleting_source
#print axioms exists_capInterior_minimalBlocker_hits_two_named_exactRows
#print axioms exists_capInterior_minimalBlocker_contains_prescribedRowSources
#print axioms exists_firstApex_capInterior_minimalBlocker_hits_collisionRows
#print axioms exists_firstApex_capInterior_minimalBlocker_contains_sourceOnEachRow
#print axioms exists_firstApex_capInterior_deletion_blocks_three_named_centers

end ATailCapInteriorMinimalBlocker
end Problem97
