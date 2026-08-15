import Erdos9796Proof.P97.ATail.ApexRichClassStructure

/-!
# Rich-apex normal form for a collectively blocking subdeletion

This scratch module isolates the exact radius-cardinality consequences of a
minimal blocking set contained in one canonical critical shell.  It deliberately
does not identify the blocking center with an actual blocker row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstNonHitRichApexScratch

open ATailApexRichClassStructure
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

private theorem selectedClass_sdiff_card_le_three_of_blocked
    {D : CounterexampleData} {p : ℝ²} {V : Finset ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) p) :
    (SelectedClass D.A p r \ V).card ≤ 3 := by
  by_contra hnot
  apply hblocked
  refine ⟨r, hr, ?_⟩
  change 4 ≤ (SelectedClass (D.A \ V) p r).card
  have heq :
      SelectedClass (D.A \ V) p r = SelectedClass D.A p r \ V := by
    ext z
    simp [SelectedClass, and_left_comm, and_comm]
  rw [heq]
  omega

/-- Deleting points from one canonical critical shell can remove at most two
points from any circle about a rich apex.  If the deletion blocks every
four-point circle at that apex, every positive-radius ambient class therefore
has cardinality at most five. -/
theorem selectedClass_card_le_five_of_blockingSubdeletion_of_apexRich
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (x : ℝ²) (hx : x ∈ D.A) {p : ℝ²}
    (hrich : ApexRichClassStructure D.A p)
    {V : Finset ℝ²}
    (hVsub : V ⊆ (H.selectedAt x hx).toCriticalFourShell.support)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) p)
    {r : ℝ} (hr : 0 < r) :
    (SelectedClass D.A p r).card ≤ 5 := by
  let C := SelectedClass D.A p r
  have hinter : (C ∩ V).card ≤ 2 := by
    calc
      (C ∩ V).card ≤
          ((H.selectedAt x hx).toCriticalFourShell.support ∩ C).card := by
        apply Finset.card_le_card
        intro z hz
        exact Finset.mem_inter.mpr
          ⟨hVsub (Finset.mem_inter.mp hz).2, (Finset.mem_inter.mp hz).1⟩
      _ ≤ 2 := by
        simpa [C] using
          criticalShell_inter_selectedClass_card_le_two_of_apexRich
            H x hx hrich r
  have hdiff : (C \ V).card ≤ 3 := by
    simpa [C] using
      selectedClass_sdiff_card_le_three_of_blocked hr hblocked
  have hsplit := Finset.card_sdiff_add_card_inter C V
  change C.card ≤ 5
  calc
    C.card = (C \ V).card + (C ∩ V).card := hsplit.symm
    _ ≤ 3 + 2 := Nat.add_le_add hdiff hinter
    _ = 5 := rfl

/-- If a blocking subdeletion of one critical four-shell contains a co-radial
pair at a rich apex, then it contains at least three shell points.  The rich
six-point arm is impossible by the preceding five-point bound; in the two-rich-
radius arm, a second rich circle must lose at least one further point. -/
theorem three_le_card_of_sharedRadius_blockingSubdeletion_of_apexRich
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (x : ℝ²) (hx : x ∈ D.A) {p : ℝ²}
    (hrich : ApexRichClassStructure D.A p)
    {V : Finset ℝ²} {s t : ℝ²}
    (hVsub : V ⊆ (H.selectedAt x hx).toCriticalFourShell.support)
    (hsV : s ∈ V) (htV : t ∈ V) (hst : s ≠ t)
    (hsame : dist p s = dist p t)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) p) :
    3 ≤ V.card := by
  have hclassLeFive : ∀ {r : ℝ}, 0 < r →
      (SelectedClass D.A p r).card ≤ 5 := by
    intro r hr
    exact selectedClass_card_le_five_of_blockingSubdeletion_of_apexRich
      H x hx hrich hVsub hblocked hr
  have hd44 :
      ∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
        4 ≤ (SelectedClass D.A p r₁).card ∧
        4 ≤ (SelectedClass D.A p r₂).card := by
    rcases hrich with ⟨r, hr, hsix⟩ | htwo
    · have hle := hclassLeFive hr
      omega
    · exact htwo
  rcases hd44 with ⟨r₁, r₂, hr₁, hr₂, hradii, hfour₁, hfour₂⟩
  let r := dist p s
  obtain ⟨ρ, hρ, hρne, hρfour⟩ :
      ∃ ρ : ℝ, 0 < ρ ∧ ρ ≠ r ∧
        4 ≤ (SelectedClass D.A p ρ).card := by
    by_cases hr₁r : r₁ = r
    · refine ⟨r₂, hr₂, ?_, hfour₂⟩
      intro hr₂r
      exact hradii (hr₁r.trans hr₂r.symm)
    · exact ⟨r₁, hr₁, hr₁r, hfour₁⟩
  let Cρ := SelectedClass D.A p ρ
  have hdiff : (Cρ \ V).card ≤ 3 := by
    simpa [Cρ] using
      selectedClass_sdiff_card_le_three_of_blocked hρ hblocked
  have hsplit := Finset.card_sdiff_add_card_inter Cρ V
  have hfourρ : 4 ≤ Cρ.card := by simpa [Cρ] using hρfour
  have hinterPos : 0 < (Cρ ∩ V).card := by
    omega
  rcases Finset.card_pos.mp hinterPos with ⟨u, hu⟩
  have huCρ : u ∈ Cρ := (Finset.mem_inter.mp hu).1
  have huV : u ∈ V := (Finset.mem_inter.mp hu).2
  have hsA : s ∈ D.A :=
    (H.selectedAt x hx).toCriticalFourShell.support_subset_A (hVsub hsV)
  have htA : t ∈ D.A :=
    (H.selectedAt x hx).toCriticalFourShell.support_subset_A (hVsub htV)
  have hsC : s ∈ SelectedClass D.A p r := by
    exact mem_selectedClass.mpr ⟨hsA, rfl⟩
  have htC : t ∈ SelectedClass D.A p r := by
    exact mem_selectedClass.mpr ⟨htA, hsame.symm⟩
  have hus : u ≠ s := by
    intro hus
    subst u
    exact hρne
      ((mem_selectedClass.mp huCρ).2.symm.trans
        (mem_selectedClass.mp hsC).2)
  have hut : u ≠ t := by
    intro hut
    subst u
    exact hρne
      ((mem_selectedClass.mp huCρ).2.symm.trans
        (mem_selectedClass.mp htC).2)
  have hthreeSub : ({u, s, t} : Finset ℝ²) ⊆ V := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    exacts [huV, hsV, htV]
  have hthreeCard : ({u, s, t} : Finset ℝ²).card = 3 := by
    simp [hus, hut, hst]
  calc
    3 = ({u, s, t} : Finset ℝ²).card := hthreeCard.symm
    _ ≤ V.card := Finset.card_le_card hthreeSub

/-- The preceding lower bound is sharp against the ambient critical shell:
the blocking set has exactly three or four points. -/
theorem card_eq_three_or_four_of_sharedRadius_blockingSubdeletion_of_apexRich
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (x : ℝ²) (hx : x ∈ D.A) {p : ℝ²}
    (hrich : ApexRichClassStructure D.A p)
    {V : Finset ℝ²} {s t : ℝ²}
    (hVsub : V ⊆ (H.selectedAt x hx).toCriticalFourShell.support)
    (hsV : s ∈ V) (htV : t ∈ V) (hst : s ≠ t)
    (hsame : dist p s = dist p t)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) p) :
    V.card = 3 ∨ V.card = 4 := by
  have hlower : 3 ≤ V.card :=
    three_le_card_of_sharedRadius_blockingSubdeletion_of_apexRich
      H x hx hrich hVsub hsV htV hst hsame hblocked
  have hupper : V.card ≤ 4 := by
    calc
      V.card ≤
          (H.selectedAt x hx).toCriticalFourShell.support.card :=
        Finset.card_le_card hVsub
      _ = 4 := (H.selectedAt x hx).toCriticalFourShell.support_card
  omega

/-- The points of `V` on the same `p`-centred circle as `s`. -/
noncomputable def radiusBlock
    (A : Finset ℝ²) (p : ℝ²) (V : Finset ℝ²) (s : ℝ²) :
    Finset ℝ² :=
  V ∩ SelectedClass A p (dist p s)

/-- Solver-ready normal form for the rich-apex equality arm of a minimal
blocking subdeletion.  It records only consequences proved at the source
level; in particular it says nothing about the actual blockers or selected
rows of the points of `V`. -/
structure BlockingSubdeletionD44Profile
    (A : Finset ℝ²) (p : ℝ²) (V : Finset ℝ²) : Prop where
  card_eq_three_or_four : V.card = 3 ∨ V.card = 4
  d44 :
    ∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass A p r₁).card ∧
      4 ≤ (SelectedClass A p r₂).card
  class_card_le_five :
    ∀ {r : ℝ}, 0 < r → (SelectedClass A p r).card ≤ 5
  radiusBlock_nonempty :
    ∀ {s : ℝ²}, s ∈ V → (radiusBlock A p V s).Nonempty
  radiusBlock_card_le_two :
    ∀ {s : ℝ²}, s ∈ V → (radiusBlock A p V s).card ≤ 2
  deletedClass_card_eq_three :
    ∀ {s : ℝ²}, s ∈ V →
      (SelectedClass (A \ V) p (dist p s)).card = 3
  ambientClass_card_eq_three_add_block :
    ∀ {s : ℝ²}, s ∈ V →
      (SelectedClass A p (dist p s)).card =
        3 + (radiusBlock A p V s).card
  sharedRadiusPair :
    ∃ s ∈ V, ∃ t ∈ V, s ≠ t ∧ dist p s = dist p t

/-- Package the complete finite radius-partition information available in the
rich-apex equality arm.  The exact post-deletion size-three facts are kept as
an input so the theorem remains independent of any particular minimal-deletion
producer. -/
theorem blockingSubdeletionD44Profile_of_sharedRadius_of_apexRich
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (x : ℝ²) (hx : x ∈ D.A) {p : ℝ²}
    (hrich : ApexRichClassStructure D.A p)
    {V : Finset ℝ²}
    (hVsub : V ⊆ (H.selectedAt x hx).toCriticalFourShell.support)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (D.A \ V) p)
    (hdeletedThree : ∀ {s : ℝ²}, s ∈ V →
      (SelectedClass (D.A \ V) p (dist p s)).card = 3)
    {s t : ℝ²} (hsV : s ∈ V) (htV : t ∈ V) (hst : s ≠ t)
    (hsame : dist p s = dist p t) :
    BlockingSubdeletionD44Profile D.A p V := by
  have hclassLeFive : ∀ {r : ℝ}, 0 < r →
      (SelectedClass D.A p r).card ≤ 5 := by
    intro r hr
    exact selectedClass_card_le_five_of_blockingSubdeletion_of_apexRich
      H x hx hrich hVsub hblocked hr
  have hd44 :
      ∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
        4 ≤ (SelectedClass D.A p r₁).card ∧
        4 ≤ (SelectedClass D.A p r₂).card := by
    rcases hrich with ⟨r, hr, hsix⟩ | htwo
    · have hle := hclassLeFive hr
      omega
    · exact htwo
  refine
    { card_eq_three_or_four :=
        card_eq_three_or_four_of_sharedRadius_blockingSubdeletion_of_apexRich
          H x hx hrich hVsub hsV htV hst hsame hblocked
      d44 := hd44
      class_card_le_five := @hclassLeFive
      radiusBlock_nonempty := ?_
      radiusBlock_card_le_two := ?_
      deletedClass_card_eq_three := ?_
      ambientClass_card_eq_three_add_block := ?_
      sharedRadiusPair := ⟨s, hsV, t, htV, hst, hsame⟩ }
  · intro u huV
    refine ⟨u, ?_⟩
    exact Finset.mem_inter.mpr
      ⟨huV, mem_selectedClass.mpr
        ⟨(H.selectedAt x hx).toCriticalFourShell.support_subset_A
          (hVsub huV), rfl⟩⟩
  · intro u huV
    apply le_trans (Finset.card_le_card ?_)
      (criticalShell_inter_selectedClass_card_le_two_of_apexRich
        H x hx hrich (dist p u))
    intro z hz
    exact Finset.mem_inter.mpr
      ⟨hVsub (Finset.mem_inter.mp hz).1, (Finset.mem_inter.mp hz).2⟩
  · intro u huV
    exact hdeletedThree huV
  · intro u huV
    let C := SelectedClass D.A p (dist p u)
    have heq :
        SelectedClass (D.A \ V) p (dist p u) = C \ V := by
      ext z
      simp [C, SelectedClass, and_left_comm, and_comm]
    have hdeleted : (C \ V).card = 3 := by
      rw [← heq]
      exact hdeletedThree huV
    have hsplit := Finset.card_sdiff_add_card_inter C V
    have hinter :
        (C ∩ V).card = (radiusBlock D.A p V u).card := by
      simp [C, radiusBlock, Finset.inter_comm]
    change C.card = 3 + (radiusBlock D.A p V u).card
    omega

end FirstNonHitRichApexScratch
end Problem97
