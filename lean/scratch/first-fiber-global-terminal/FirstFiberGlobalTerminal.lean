import FormalConjectures.ErdosProblems.«97»

/-!
# First-fiber global-deletion terminal: retained minimality facts

Scratch-only, kernel-checked lemmas recovering the cardinal-minimal restoration
data behind the current `FirstCapComplementGlobalDeletionOutcome`.

The cardinal-minimal global deletion producer proves that restoring any one
deleted point restores a K4.  A co-radial pair in the deletion then forces a
five-point ambient radius class.  Although the production outcome retains only
the collision and the blocking premise, one may minimize its deletion again at
the same center, so the restoration consequence remains recoverable.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace FirstFiberGlobalTerminal

attribute [local instance] Classical.propDecidable

/-- Scratch-local spelling of the production `SelectedClass`. -/
noncomputable def selectedClass
    (A : Finset ℝ²) (center : ℝ²) (radius : ℝ) : Finset ℝ² :=
  A.filter fun q ↦ dist center q = radius

@[simp] theorem mem_selectedClass
    {A : Finset ℝ²} {center q : ℝ²} {radius : ℝ} :
    q ∈ selectedClass A center radius ↔
      q ∈ A ∧ dist center q = radius := by
  simp [selectedClass]

/-- The metric content of production `IsUniqueFourCenter`, omitting only the
irrelevant assertion that the center itself belongs to the carrier. -/
def hasUniqueFourRadius (A : Finset ℝ²) (center : ℝ²) : Prop :=
  ∃ base : ℝ, 0 < base ∧
    (selectedClass A center base).card = 4 ∧
    ∀ radius : ℝ, 0 < radius →
      4 ≤ (selectedClass A center radius).card →
      radius = base

/-- The restoration datum omitted by
`FirstCapComplementGlobalDeletionOutcome`.  It can be reconstructed at the
same center by minimizing the outcome's blocking deletion once more. -/
structure CardMinimalBlockingSubdeletion
    (A U : Finset ℝ²) (center : ℝ²) : Type where
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset : deleted ⊆ U
  blocked :
    ¬ Erdos97.HasNEquidistantPointsAt 4 (A \ deleted) center
  restores :
    ∀ s ∈ deleted,
      Erdos97.HasNEquidistantPointsAt 4
        (A \ (deleted.erase s)) center

/-- Any finite blocking deletion has a cardinal-minimal blocking
subdeletion, so the erased restoration property is reconstructible from the
current production outcome's `blocked` field and the carrier K4 property. -/
theorem exists_cardMinimalBlockingSubdeletion
    {A U : Finset ℝ²} {center : ℝ²}
    (hfull : Erdos97.HasNEquidistantPointsAt 4 A center)
    (hblocked :
      ¬ Erdos97.HasNEquidistantPointsAt 4 (A \ U) center) :
    Nonempty (CardMinimalBlockingSubdeletion A U center) := by
  classical
  let candidates : Finset (Finset ℝ²) :=
    U.powerset.filter fun V ↦
      ¬ Erdos97.HasNEquidistantPointsAt 4 (A \ V) center
  have hUcand : U ∈ candidates := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_powerset.mpr (fun _ hx ↦ hx), hblocked⟩
  have hcandidates : candidates.Nonempty := ⟨U, hUcand⟩
  rcases Finset.exists_min_image candidates Finset.card hcandidates with
    ⟨V, hVcand, hVmin⟩
  rcases Finset.mem_filter.mp hVcand with
    ⟨hVpowerset, hVblocked⟩
  have hVsub : V ⊆ U := Finset.mem_powerset.mp hVpowerset
  have hVne : V.Nonempty := by
    rw [Finset.nonempty_iff_ne_empty]
    intro hVempty
    apply hVblocked
    simpa [hVempty] using hfull
  refine ⟨{
    deleted := V
    deleted_nonempty := hVne
    deleted_subset := hVsub
    blocked := hVblocked
    restores := ?_ }⟩
  intro s hsV
  by_contra hrestoreBlocked
  have hEraseCand : V.erase s ∈ candidates := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_powerset.mpr ?_, hrestoreBlocked⟩
    exact (Finset.erase_subset s V).trans hVsub
  have hle : V.card ≤ (V.erase s).card :=
    hVmin (V.erase s) hEraseCand
  exact (not_lt_of_ge hle) (Finset.card_erase_lt_of_mem hsV)

/-- If restoring `s` from a blocking deletion restores K4 and another deleted
point `t` is co-radial with `s`, the restored four-row plus `t` gives an
ambient five-row. -/
theorem selectedClass_card_ge_five_of_restored_coRadial_pair
    {A V : Finset ℝ²} {center s t : ℝ²}
    (hVsub : V ⊆ A)
    (ht : t ∈ V) (hst : s ≠ t)
    (hdist : dist center s = dist center t)
    (hblocked :
      ¬ Erdos97.HasNEquidistantPointsAt 4 (A \ V) center)
    (hrestore :
      Erdos97.HasNEquidistantPointsAt 4
        (A \ (V.erase s)) center) :
    ∃ r : ℝ, 0 < r ∧ dist center s = r ∧
      5 ≤ (selectedClass A center r).card := by
  classical
  rcases hrestore with ⟨r, hr, hfour⟩
  have hsr : dist center s = r := by
    by_contra hne
    apply hblocked
    refine ⟨r, hr, ?_⟩
    exact hfour.trans (Finset.card_le_card (by
      intro x hx
      rcases Finset.mem_filter.mp hx with ⟨hxCarrier, hxRadius⟩
      rcases Finset.mem_sdiff.mp hxCarrier with ⟨hxA, hxNotErase⟩
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨hxA, ?_⟩, hxRadius⟩
      intro hxV
      have hxs : x = s := by
        by_contra hxs
        exact hxNotErase (Finset.mem_erase.mpr ⟨hxs, hxV⟩)
      exact hne (hxs ▸ hxRadius)))
  let K := (A \ (V.erase s)).filter fun q ↦ dist center q = r
  have hKsub : K ⊆ selectedClass A center r := by
    intro x hx
    rcases Finset.mem_filter.mp hx with ⟨hxCarrier, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_sdiff.mp hxCarrier).1, hxRadius⟩
  have htSelected : t ∈ selectedClass A center r := by
    exact mem_selectedClass.mpr
      ⟨hVsub ht, hdist.symm.trans hsr⟩
  have htNotK : t ∉ K := by
    intro htK
    have htCarrier := (Finset.mem_filter.mp htK).1
    exact (Finset.mem_sdiff.mp htCarrier).2
      (Finset.mem_erase.mpr ⟨hst.symm, ht⟩)
  have hlt : K.card < (selectedClass A center r).card :=
    Finset.card_lt_card
      (Finset.ssubset_iff_subset_ne.mpr ⟨hKsub, by
        intro heq
        exact htNotK (heq ▸ htSelected)⟩)
  refine ⟨r, hr, hsr, ?_⟩
  dsimp [K] at hlt
  omega

/-- The retained restoration property makes a co-radial deletion collision
incompatible with a unique-four center.  In the production terminal this
would immediately prove that the new center is not the canonical first
blocker, because the latter is supplied by the unique-four cover. -/
theorem not_hasUniqueFourRadius_of_restored_coRadial_pair
    {A V : Finset ℝ²} {center s t : ℝ²}
    (hVsub : V ⊆ A)
    (ht : t ∈ V) (hst : s ≠ t)
    (hdist : dist center s = dist center t)
    (hblocked :
      ¬ Erdos97.HasNEquidistantPointsAt 4 (A \ V) center)
    (hrestore :
      Erdos97.HasNEquidistantPointsAt 4
        (A \ (V.erase s)) center) :
    ¬ hasUniqueFourRadius A center := by
  rintro ⟨base, hbase, hbaseCard, hunique⟩
  obtain ⟨radius, hradius, _hsRadius, hfive⟩ :=
    selectedClass_card_ge_five_of_restored_coRadial_pair
      hVsub ht hst hdist hblocked hrestore
  have hradiusEq : radius = base :=
    hunique radius hradius (by omega)
  rw [hradiusEq, hbaseCard] at hfive
  omega

/-- Applied to the reconstructed minimal subdeletion, the co-radial branch
cannot be centered at any unique-four center. -/
theorem CardMinimalBlockingSubdeletion.not_hasUniqueFourRadius_of_coRadial_pair
    {A U : Finset ℝ²} {center s t : ℝ²}
    (M : CardMinimalBlockingSubdeletion A U center)
    (hUsub : U ⊆ A)
    (hs : s ∈ M.deleted) (ht : t ∈ M.deleted)
    (hst : s ≠ t)
    (hdist : dist center s = dist center t) :
    ¬ hasUniqueFourRadius A center := by
  exact not_hasUniqueFourRadius_of_restored_coRadial_pair
    (M.deleted_subset.trans hUsub) ht hst hdist
    M.blocked (M.restores s hs)

/-- Scratch-local exact selected row, sufficient to model each shell in a
production `MinimalDeletionCore`. -/
structure ExactFourRadiusRow
    (A : Finset ℝ²) (center : ℝ²) where
  radius : ℝ
  radius_pos : 0 < radius
  support : Finset ℝ²
  support_eq : support = selectedClass A center radius
  support_card : support.card = 4

/-- Disjoint exact rows cannot have the same radius. -/
theorem ExactFourRadiusRow.radius_ne_of_disjoint
    {A : Finset ℝ²} {center : ℝ²}
    (K L : ExactFourRadiusRow A center)
    (hdisjoint : Disjoint K.support L.support) :
    K.radius ≠ L.radius := by
  intro hradius
  have hsupports : K.support = L.support := by
    rw [K.support_eq, L.support_eq, hradius]
  have hnonempty : K.support.Nonempty := by
    rw [← Finset.card_pos, K.support_card]
    omega
  rcases hnonempty with ⟨x, hx⟩
  exact Finset.disjoint_left.mp hdisjoint hx (hsupports ▸ hx)

/-- The non-singleton production core arm is incompatible with a unique-four
center: two source shells are exact, disjoint rows at that center. -/
theorem not_hasUniqueFourRadius_of_two_disjoint_exactRows
    {A : Finset ℝ²} {center : ℝ²}
    (K L : ExactFourRadiusRow A center)
    (hdisjoint : Disjoint K.support L.support) :
    ¬ hasUniqueFourRadius A center := by
  rintro ⟨base, _hbasePos, _hbaseCard, hunique⟩
  have hKcard : 4 ≤ (selectedClass A center K.radius).card := by
    rw [← K.support_eq, K.support_card]
  have hLcard : 4 ≤ (selectedClass A center L.radius).card := by
    rw [← L.support_eq, L.support_card]
  have hKbase := hunique K.radius K.radius_pos hKcard
  have hLbase := hunique L.radius L.radius_pos hLcard
  exact (K.radius_ne_of_disjoint L hdisjoint) (hKbase.trans hLbase.symm)

end FirstFiberGlobalTerminal
end Problem97
