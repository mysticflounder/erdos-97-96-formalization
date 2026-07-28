import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# D1 global survival (scratch bank)

Kernel-checked, `sorry`-free follow-up to `DPackageBank.lean` for the live D1
leaf

* `false_of_exactFourPostCardElevenTwoRadiusBranch`
  (`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:5976`).

`DPackageBank.lean` has no `.olean`, so §1 re-derives, verbatim, the bank
prerequisites this file consumes; only production modules are imported.

The assigned task was to extend the two-apex survival of the D1 swapped
common-deletion pair `{z₁, z₂}` to survival at *every* remaining carrier
center, and then contradict minimality.  §2 shows that this extension is
**refutable**, not merely unproved: the ambient `CriticalShellSystem` `H`
already names a center — the chosen blocker `χ(z₁) = H.centerAt z₁` — at which
`K4` fails after deleting `z₁` alone, hence a fortiori after deleting the pair.
That center survives in `A ∖ {z₁, z₂}` unless `χ(z₁) = z₂`.  So

> a two-point deletion can restore the global `K4` property only when the two
> deleted points are each other's chosen blocker centers.

§3 records the residual census for the remaining (mutual-blocker) shape, and
§4 instantiates everything on the D1 leaf's verbatim binder block.

Nothing here is wired into the production files; these are BANK theorems only.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace D1GlobalSurvival

open ATAILStageOnePrescribedApexDichotomy
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailPhysicalSecondApexSwap
open FirstApexExactFiveInteriorFrontier
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/- ## §1 Bank prerequisites re-derived

Verbatim copies from `DPackageBank.lean` (§ "Target 6 — leaf D1" and its
shared packet plumbing).  `DPackageBank.lean` is not a library target and has
no `.olean`, so it cannot be imported. -/

/-- A `K4` witness at a center survives passing to a larger ambient set. -/
theorem equidistantAt_mono
    {n : ℕ} {X Y : Finset ℝ²} {p : ℝ²} (hsub : X ⊆ Y)
    (h : HasNEquidistantPointsAt n X p) :
    HasNEquidistantPointsAt n Y p := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzX, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzX, hzdist⟩

/-- The second opposite apex is a carrier point. -/
theorem oppApex2_mem_A {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- The first apex is the vertex opposite the first opposite cap index. -/
theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The second apex is the vertex opposite the second opposite cap index. -/
theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The second opposite cap is the left-adjacent cap of the first opposite
index; this is the ordered-cap fact behind the one-hit bound at `a₁`. -/
theorem leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex1 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.leftAdjacentCapByIndex, SurplusCapPacket.capByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/-- **Sharp ordered-cap bound at the first apex.** -/
theorem firstApexClass_inter_secondOppCap_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (r : ℝ) :
    (SelectedClass D.A S.oppApex1 r ∩ S.capByIndex S.oppIndex2).card ≤ 1 := by
  have hbound :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep D.convex
      S.oppIndex1 r
  rw [leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2 S,
    ← oppApex1_eq_oppositeVertex_oppIndex1 S] at hbound
  exact hbound

/-- The exact first-apex four-row meets the strict second-cap interior in at
most one point. -/
theorem d1_firstApexClass_inter_secondCapInterior_card_le_one
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (r : ℝ) :
    (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex2).card ≤ 1 := by
  refine le_trans (Finset.card_le_card ?_)
    (firstApexClass_inter_secondOppCap_card_le_one S r)
  intro z hz
  rcases Finset.mem_inter.mp hz with ⟨hz₁, hz₂⟩
  exact Finset.mem_inter.mpr
    ⟨hz₁, S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hz₂⟩

/-- Leaf-D1 positivity of the first row radius, reconstructed from the row. -/
theorem d1_rho_pos
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (firstRow : SelectedFourClass D.A S.oppApex2)
    (hfirstRadius : firstRow.radius = rho) :
    0 < rho := by
  rw [← hfirstRadius]
  exact firstRow.radius_pos

/-- A selected four-row at `a₂` sits inside the ambient radius class of its
own radius. -/
theorem selectedFourClass_support_subset_selectedClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hradius : row.radius = rho) :
    row.support ⊆ SelectedClass D.A S.oppApex2 rho := by
  intro z hz
  exact mem_selectedClass.mpr
    ⟨row.support_subset_A hz, by rw [← hradius]; exact row.support_eq_radius z hz⟩

/-- Leaf-D1 exact class cardinality. -/
theorem d1_class_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hradius : row.radius = rho) :
    (SelectedClass D.A S.oppApex2 rho).card = 4 := by
  have hge : 4 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
    calc
      4 = row.support.card := row.support_card.symm
      _ ≤ _ := Finset.card_le_card
        (selectedFourClass_support_subset_selectedClass row hradius)
  have hlt := hnoFive rho (d1_rho_pos row hradius)
  omega

/-- Each of the two exact `a₂`-rows has at least two strict second-cap
members. -/
theorem d1_strictInterior_double_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {rho : ℝ}
    (row : SelectedFourClass D.A S.oppApex2)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hradius : row.radius = rho) :
    2 ≤ (SelectedClass D.A S.oppApex2 rho ∩
      S.capInteriorByIndex S.oppIndex2).card := by
  have hbound :=
    S.selectedClass_capInteriorByIndex_card_ge_card_sub_two D.convex
      S.oppIndex2 (d1_rho_pos row hradius)
  rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
  have hcard := d1_class_card_eq_four row hnoFive hradius
  omega

/-- Deleting two points of one exact `a₂`-row that miss the exact `a₁`-row
preserves `K4` at both apexes. -/
theorem twoDeletion_survives_at_both_apexes
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius sigma tau : ℝ} {z₁ z₂ : ℝ²}
    (hradius : 0 < radius) (htau : 0 < tau)
    (hUcard : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hTauCard : (SelectedClass D.A S.oppApex2 tau).card = 4)
    (hsigmatau : sigma ≠ tau)
    (hz₁ : z₁ ∈ SelectedClass D.A S.oppApex2 sigma)
    (hz₂ : z₂ ∈ SelectedClass D.A S.oppApex2 sigma)
    (hz₁U : z₁ ∉ SelectedClass D.A S.oppApex1 radius)
    (hz₂U : z₂ ∉ SelectedClass D.A S.oppApex1 radius) :
    HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2 := by
  classical
  have hz₁Tau : z₁ ∉ SelectedClass D.A S.oppApex2 tau := by
    intro h
    exact hsigmatau
      (((mem_selectedClass.mp hz₁).2).symm.trans (mem_selectedClass.mp h).2)
  have hz₂Tau : z₂ ∉ SelectedClass D.A S.oppApex2 tau := by
    intro h
    exact hsigmatau
      (((mem_selectedClass.mp hz₂).2).symm.trans (mem_selectedClass.mp h).2)
  have hFirst :
      SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex1 radius =
        SelectedClass D.A S.oppApex1 radius := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      Finset.erase_eq_self.mpr hz₁U, Finset.erase_eq_self.mpr hz₂U]
  have hSecond :
      SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex2 tau =
        SelectedClass D.A S.oppApex2 tau := by
    rw [selectedClass_erase_eq, selectedClass_erase_eq,
      Finset.erase_eq_self.mpr hz₁Tau, Finset.erase_eq_self.mpr hz₂Tau]
  refine ⟨⟨radius, hradius, ?_⟩, ⟨tau, htau, ?_⟩⟩
  · change 4 ≤ (SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex1 radius).card
    rw [hFirst, hUcard]
  · change 4 ≤ (SelectedClass ((D.A.erase z₁).erase z₂) S.oppApex2 tau).card
    rw [hSecond, hTauCard]

/-- **The D1 swapped common-deletion pair, unconditional.** -/
theorem d1_swappedCommonDeletion_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    ∃ z₁ z₂ : ℝ², z₁ ≠ z₂ ∧
      z₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z₁ ∉ SelectedClass D.A S.oppApex1 radius ∧
      z₂ ∉ SelectedClass D.A S.oppApex1 radius ∧
      ((z₁ ∈ SelectedClass D.A S.oppApex2 rho ∧
          z₂ ∈ SelectedClass D.A S.oppApex2 rho) ∨
        (z₁ ∈ SelectedClass D.A S.oppApex2 otherRadius ∧
          z₂ ∈ SelectedClass D.A S.oppApex2 otherRadius)) ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2 := by
  classical
  have hrho : 0 < rho := d1_rho_pos firstRow hfirstRadius
  have hother : 0 < otherRadius := d1_rho_pos secondRow hsecondRadius
  have hfour : (SelectedClass D.A S.oppApex2 rho).card = 4 :=
    d1_class_card_eq_four firstRow hnoFive hfirstRadius
  have hfourOther : (SelectedClass D.A S.oppApex2 otherRadius).card = 4 :=
    d1_class_card_eq_four secondRow hnoFive hsecondRadius
  set I := S.capInteriorByIndex S.oppIndex2 with hI
  set U := SelectedClass D.A S.oppApex1 radius with hU
  set P := SelectedClass D.A S.oppApex2 rho ∩ I with hP
  set Q := SelectedClass D.A S.oppApex2 otherRadius ∩ I with hQ
  have hP2 : 2 ≤ P.card :=
    d1_strictInterior_double_hit firstRow hnoFive hfirstRadius
  have hQ2 : 2 ≤ Q.card :=
    d1_strictInterior_double_hit secondRow hnoFive hsecondRadius
  have hUI : (U ∩ I).card ≤ 1 :=
    d1_firstApexClass_inter_secondCapInterior_card_le_one S radius
  have hdisPQ : Disjoint (P ∩ U) (Q ∩ U) := by
    rw [Finset.disjoint_left]
    intro x hxP hxQ
    have h₁ : dist S.oppApex2 x = rho :=
      (mem_selectedClass.mp (Finset.mem_inter.mp
        (Finset.mem_inter.mp hxP).1).1).2
    have h₂ : dist S.oppApex2 x = otherRadius :=
      (mem_selectedClass.mp (Finset.mem_inter.mp
        (Finset.mem_inter.mp hxQ).1).1).2
    exact hradii (h₂.symm.trans h₁)
  have hsub : (P ∩ U) ∪ (Q ∩ U) ⊆ U ∩ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hx).2,
          (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2⟩
    · exact Finset.mem_inter.mpr
        ⟨(Finset.mem_inter.mp hx).2,
          (Finset.mem_inter.mp (Finset.mem_inter.mp hx).1).2⟩
  have hsum : (P ∩ U).card + (Q ∩ U).card ≤ 1 := by
    have hunion : ((P ∩ U) ∪ (Q ∩ U)).card = (P ∩ U).card + (Q ∩ U).card :=
      Finset.card_union_of_disjoint hdisPQ
    have := Finset.card_le_card hsub
    omega
  have hchoose :
      ∃ (T : Finset ℝ²) (sigma tau : ℝ),
        2 ≤ T.card ∧ Disjoint T U ∧ 0 < tau ∧ sigma ≠ tau ∧
          (SelectedClass D.A S.oppApex2 tau).card = 4 ∧
          T ⊆ SelectedClass D.A S.oppApex2 sigma ∩ I ∧
          (sigma = rho ∨ sigma = otherRadius) := by
    rcases Nat.eq_zero_or_pos (P ∩ U).card with hzero | hpos
    · refine ⟨P, rho, otherRadius, hP2, ?_, hother, Ne.symm hradii,
        hfourOther, by rw [hP], Or.inl rfl⟩
      rw [Finset.disjoint_left]
      intro x hxP hxU
      have : x ∈ P ∩ U := Finset.mem_inter.mpr ⟨hxP, hxU⟩
      rw [Finset.card_eq_zero] at hzero
      simp [hzero] at this
    · have hQzero : (Q ∩ U).card = 0 := by omega
      refine ⟨Q, otherRadius, rho, hQ2, ?_, hrho, hradii, hfour,
        by rw [hQ], Or.inr rfl⟩
      rw [Finset.disjoint_left]
      intro x hxQ hxU
      have : x ∈ Q ∩ U := Finset.mem_inter.mpr ⟨hxQ, hxU⟩
      rw [Finset.card_eq_zero] at hQzero
      simp [hQzero] at this
  rcases hchoose with
    ⟨T, sigma, tau, hT2, hTU, htau, hsigmatau, hTauCard, hTsub, hsigma⟩
  rcases Finset.one_lt_card.mp (by omega : 1 < T.card) with
    ⟨z₁, hz₁T, z₂, hz₂T, hz₁z₂⟩
  have hz₁Class : z₁ ∈ SelectedClass D.A S.oppApex2 sigma :=
    (Finset.mem_inter.mp (hTsub hz₁T)).1
  have hz₂Class : z₂ ∈ SelectedClass D.A S.oppApex2 sigma :=
    (Finset.mem_inter.mp (hTsub hz₂T)).1
  have hz₁I : z₁ ∈ I := (Finset.mem_inter.mp (hTsub hz₁T)).2
  have hz₂I : z₂ ∈ I := (Finset.mem_inter.mp (hTsub hz₂T)).2
  have hz₁U : z₁ ∉ U := Finset.disjoint_left.mp hTU hz₁T
  have hz₂U : z₂ ∉ U := Finset.disjoint_left.mp hTU hz₂T
  obtain ⟨hsurv1, hsurv2⟩ :=
    twoDeletion_survives_at_both_apexes (S := S) F.radius_pos htau
      R.class_card_eq_four hTauCard hsigmatau hz₁Class hz₂Class hz₁U hz₂U
  refine ⟨z₁, z₂, hz₁z₂, hz₁I, hz₂I, hz₁U, hz₂U, ?_, hsurv1, hsurv2⟩
  rcases hsigma with hsigma | hsigma
  · exact Or.inl ⟨hsigma ▸ hz₁Class, hsigma ▸ hz₂Class⟩
  · exact Or.inr ⟨hsigma ▸ hz₁Class, hsigma ▸ hz₂Class⟩

/- ## §2 The blocker obstruction to two-point global survival

Everything in this section needs only a `CriticalShellSystem`.  No cap, no
frontier, no minimality. -/

/-- The chosen blocker center of a source is a carrier point. -/
theorem centerAt_mem_A {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : H.centerAt z hz ∈ A :=
  (Finset.mem_erase.mp (H.selectedAt z hz).toCriticalFourShell.center_mem).2

/-- The chosen blocker center of a source is distinct from that source. -/
theorem centerAt_ne_self {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z : ℝ²} (hz : z ∈ A) : H.centerAt z hz ≠ z :=
  (Finset.mem_erase.mp (H.selectedAt z hz).toCriticalFourShell.center_mem).1

/-- **The two-point deletion never survives at a blocker center.**  The
critical-shell field kills the single deletion of `z₁` at `χ(z₁)`, and `K4`
witnesses are monotone in the ambient set, so deleting more cannot help. -/
theorem pairErase_blocked_at_centerAt
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ : ℝ²} (hz₁ : z₁ ∈ A) (z₂ : ℝ²) :
    ¬ HasNEquidistantPointsAt 4 ((A.erase z₁).erase z₂)
      (H.centerAt z₁ hz₁) :=
  fun h ↦ H.no_qfree_at z₁ hz₁
    (equidistantAt_mono (Finset.erase_subset z₂ (A.erase z₁)) h)

/-- Unless it is the other deleted point, the blocker center of `z₁` survives
the pair deletion as a carrier point. -/
theorem centerAt_mem_pairErase
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ A) (hne : H.centerAt z₁ hz₁ ≠ z₂) :
    H.centerAt z₁ hz₁ ∈ (A.erase z₁).erase z₂ :=
  Finset.mem_erase.mpr ⟨hne,
    Finset.mem_erase.mpr ⟨centerAt_ne_self H hz₁, centerAt_mem_A H hz₁⟩⟩

/-- **The global-survival goal is refutable.**  If the blocker center of `z₁`
is not the second deleted point, then `A ∖ {z₁, z₂}` provably fails the global
four-equidistant property — at `χ(z₁)`. -/
theorem not_globalK4_pairErase_of_centerAt_ne
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ A) (hne : H.centerAt z₁ hz₁ ≠ z₂) :
    ¬ HasNEquidistantProperty 4 ((A.erase z₁).erase z₂) :=
  fun hprop ↦ pairErase_blocked_at_centerAt H hz₁ z₂
    (hprop _ (centerAt_mem_pairErase H hz₁ hne))

/-- **Mutual-blocker normal form.**  A two-point deletion restoring the global
four-equidistant property forces the two deleted points to be each other's
chosen blocker centers. -/
theorem mutual_centerAt_of_globalK4_pairErase
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ A) (hz₂ : z₂ ∈ A)
    (hprop : HasNEquidistantProperty 4 ((A.erase z₁).erase z₂)) :
    H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁ := by
  refine ⟨?_, ?_⟩
  · by_contra hne
    exact not_globalK4_pairErase_of_centerAt_ne H hz₁ hne hprop
  · by_contra hne
    refine not_globalK4_pairErase_of_centerAt_ne H hz₂ hne ?_
    rwa [Finset.erase_right_comm]

/-- **Unique-blocker normal form.**  Global survival of the pair deletion makes
`z₂` the only carrier point at which deleting `z₁` *alone* destroys `K4`.  So
the route does not merely need `z₂` to be *a* blocker of `z₁`: it needs `z₂` to
be the *only* one, for both points simultaneously. -/
theorem singleErase_survives_of_globalK4_pairErase
    {A : Finset ℝ²} {z₁ z₂ : ℝ²}
    (hprop : HasNEquidistantProperty 4 ((A.erase z₁).erase z₂))
    {c : ℝ²} (hc : c ∈ A) (hcz₁ : c ≠ z₁) (hcz₂ : c ≠ z₂) :
    HasNEquidistantPointsAt 4 (A.erase z₁) c :=
  equidistantAt_mono (Finset.erase_subset z₂ (A.erase z₁))
    (hprop c (Finset.mem_erase.mpr ⟨hcz₂, Finset.mem_erase.mpr ⟨hcz₁, hc⟩⟩))

/-- **The obstruction set of a two-point deletion is nonempty** outside the
mutual-blocker shape, and one obstruction center is named explicitly. -/
theorem exists_pairErase_obstruction_center
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ A) (hz₂ : z₂ ∈ A)
    (hmutual : ¬ (H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁)) :
    ∃ c ∈ (A.erase z₁).erase z₂,
      ¬ HasNEquidistantPointsAt 4 ((A.erase z₁).erase z₂) c := by
  by_cases hfirst : H.centerAt z₁ hz₁ = z₂
  · have hsecond : H.centerAt z₂ hz₂ ≠ z₁ := fun h ↦ hmutual ⟨hfirst, h⟩
    refine ⟨H.centerAt z₂ hz₂, ?_, ?_⟩
    · rw [Finset.erase_right_comm]
      exact centerAt_mem_pairErase H hz₂ hsecond
    · rw [Finset.erase_right_comm]
      exact pairErase_blocked_at_centerAt H hz₂ z₁
  · exact ⟨H.centerAt z₁ hz₁, centerAt_mem_pairErase H hz₁ hfirst,
      pairErase_blocked_at_centerAt H hz₁ z₂⟩

/-- A center at which the pair deletion *does* survive is never the chosen
blocker center of either deleted point. -/
theorem centerAt_ne_of_pairErase_survives
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ z₂ c : ℝ²} (hz₁ : z₁ ∈ A)
    (hsurv : HasNEquidistantPointsAt 4 ((A.erase z₁).erase z₂) c) :
    H.centerAt z₁ hz₁ ≠ c := by
  intro h
  refine pairErase_blocked_at_centerAt H hz₁ z₂ ?_
  rw [h]
  exact hsurv

/-- **Blocker-row dichotomy.**  The selected critical row of `z₁` either omits
`z₂`, or places the chosen blocker center of `z₁` on the perpendicular
bisector of the deleted pair. -/
theorem centerAt_row_omits_or_bisects
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z₁ : ℝ²} (hz₁ : z₁ ∈ A) (z₂ : ℝ²) :
    z₂ ∉ (H.selectedAt z₁ hz₁).toCriticalFourShell.support ∨
      dist (H.centerAt z₁ hz₁) z₁ = dist (H.centerAt z₁ hz₁) z₂ := by
  by_cases hz₂ : z₂ ∈ (H.selectedAt z₁ hz₁).toCriticalFourShell.support
  · refine Or.inr ?_
    have h₁ :=
      (H.selectedAt z₁ hz₁).toCriticalFourShell.support_eq_radius z₁
        (H.selectedAt z₁ hz₁).toCriticalFourShell.q_mem_support
    have h₂ :=
      (H.selectedAt z₁ hz₁).toCriticalFourShell.support_eq_radius z₂ hz₂
    exact h₁.trans h₂.symm
  · exact Or.inl hz₂

/-- **The minimality consumer.**  If a two-point deletion of a minimal
counterexample did retain the global four-equidistant property, minimality
would be contradicted.  This is the statement §2 shows to be unreachable. -/
theorem false_of_globalK4_pairErase
    {D : CounterexampleData} (hmin : D.Minimal)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ D.A) (hz₂ : z₂ ∈ D.A) (hne : z₁ ≠ z₂)
    (hprop : HasNEquidistantProperty 4 ((D.A.erase z₁).erase z₂)) :
    False := by
  classical
  have hz₂' : z₂ ∈ D.A.erase z₁ := Finset.mem_erase.mpr ⟨Ne.symm hne, hz₂⟩
  have hcard₁ : (D.A.erase z₁).card = D.A.card - 1 :=
    Finset.card_erase_of_mem hz₁
  have hcard₂ : ((D.A.erase z₁).erase z₂).card = (D.A.erase z₁).card - 1 :=
    Finset.card_erase_of_mem hz₂'
  have hbig : 4 < D.A.card := D.card_gt_four
  have hpos : 0 < ((D.A.erase z₁).erase z₂).card := by omega
  have hconv : ConvexIndep ((D.A.erase z₁).erase z₂) :=
    ConvexIndep.erase z₂ (ConvexIndep.erase z₁ D.convex)
  have hle := hmin ((D.A.erase z₁).erase z₂) (Finset.card_pos.mp hpos)
    hconv hprop
  omega

/- ## §3 Residual census for the surviving shape

The mutual-blocker shape of §2 is the only one in which the global-survival
goal is not already refuted.  These are the constraints an obstruction center
must satisfy there. -/

/-- **Obstruction row normal form.**  At a center where the pair deletion
destroys `K4`, every ambient row of size `≥ 4` either contains *both* deleted
points — putting the center on their perpendicular bisector — or is an exact
four-point row meeting the pair in exactly one point. -/
theorem pairErase_obstruction_row_normalForm
    {A : Finset ℝ²} {c z₁ z₂ : ℝ²} {s : ℝ}
    (hblocked : ¬ HasNEquidistantPointsAt 4 ((A.erase z₁).erase z₂) c)
    (hs : 0 < s) (hcard : 4 ≤ (SelectedClass A c s).card) :
    (dist c z₁ = s ∧ dist c z₂ = s) ∨
      ((SelectedClass A c s).card = 4 ∧
        ((z₁ ∈ SelectedClass A c s ∧ z₂ ∉ SelectedClass A c s) ∨
          (z₂ ∈ SelectedClass A c s ∧ z₁ ∉ SelectedClass A c s))) := by
  classical
  have hcards : (((SelectedClass A c s).erase z₁).erase z₂).card ≤ 3 := by
    by_contra hbig
    refine hblocked ⟨s, hs, ?_⟩
    change 4 ≤ (SelectedClass ((A.erase z₁).erase z₂) c s).card
    rw [selectedClass_erase_eq, selectedClass_erase_eq]
    omega
  by_cases h₁ : z₁ ∈ SelectedClass A c s <;>
    by_cases h₂ : z₂ ∈ SelectedClass A c s
  · exact Or.inl ⟨(mem_selectedClass.mp h₁).2, (mem_selectedClass.mp h₂).2⟩
  · refine Or.inr ⟨?_, Or.inl ⟨h₁, h₂⟩⟩
    have he₂ : z₂ ∉ (SelectedClass A c s).erase z₁ :=
      fun h ↦ h₂ (Finset.mem_of_mem_erase h)
    rw [Finset.erase_eq_self.mpr he₂, Finset.card_erase_of_mem h₁] at hcards
    omega
  · refine Or.inr ⟨?_, Or.inr ⟨h₂, h₁⟩⟩
    rw [Finset.erase_eq_self.mpr h₁, Finset.card_erase_of_mem h₂] at hcards
    omega
  · exfalso
    have he₂ : z₂ ∉ (SelectedClass A c s).erase z₁ :=
      fun h ↦ h₂ (Finset.mem_of_mem_erase h)
    rw [Finset.erase_eq_self.mpr he₂, Finset.erase_eq_self.mpr h₁] at hcards
    omega

/-- **Bisector census.**  At most two carrier points are equidistant from the
deleted pair (Dumitrescu L1). -/
theorem pair_bisector_carrier_card_le_two
    {D : CounterexampleData} {z₁ z₂ : ℝ²}
    (hz₁ : z₁ ∈ D.A) (hz₂ : z₂ ∈ D.A) (hne : z₁ ≠ z₂) :
    (D.A.filter fun p ↦ dist p z₁ = dist p z₂).card ≤ 2 :=
  Problem97.Dumitrescu.perpBisector_apex_bound D.convex hz₁ hz₂ hne

/-- **Bisector localization for a strict-`Γ₂` co-radial pair.**  Any carrier
center other than `a₂` equidistant from two distinct strict second-cap points
that are co-radial about `a₂` lies in the strict second cap itself. -/
theorem pair_bisector_carrier_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {z₁ z₂ c : ℝ²}
    (hz₁ : z₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hz₂ : z₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hne : z₁ ≠ z₂)
    (hcoradial : dist S.oppApex2 z₁ = dist S.oppApex2 z₂)
    (hcA : c ∈ D.A) (hcNe : c ≠ S.oppApex2)
    (hcBisects : dist c z₁ = dist c z₂) :
    c ∈ S.capInteriorByIndex S.oppIndex2 :=
  ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_secondCapInterior
    hcA hcNe hz₁ hz₂ hne hcBisects hcoradial

/- ## §4 The D1 leaf

The binder block below is `false_of_exactFourPostCardElevenTwoRadiusBranch`'s
own, with the `_` linter prefixes dropped. -/

/-- **D1 pair-deletion census.**  Over the D1 leaf's verbatim binders there is
a swapped common-deletion pair `{z₁, z₂}` which

1. is co-radial about `a₂` and survives at both apexes,
2. has at most two carrier points on its perpendicular bisector, `a₂` being
   one of them, and every other such point lying in `Γ₂°`,
3. **cannot** restore the global four-equidistant property unless `z₁` and
   `z₂` are each other's chosen blocker centers, and
4. otherwise has an explicitly named obstruction center, at which every
   ambient `≥ 4`-row obeys the normal form of §3.

Together (3) and (4) refute — rather than merely fail to prove — the
"survival at every remaining center" step that the minimality consumer
`false_of_globalK4_pairErase` would need. -/
theorem d1_pairDeletion_obstruction_census
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    ∃ (z₁ z₂ : ℝ²) (hz₁ : z₁ ∈ D.A) (hz₂ : z₂ ∈ D.A),
      z₁ ≠ z₂ ∧
      z₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      z₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
      dist S.oppApex2 z₁ = dist S.oppApex2 z₂ ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2 ∧
      (D.A.filter fun p ↦ dist p z₁ = dist p z₂).card ≤ 2 ∧
      S.oppApex2 ∈ D.A.filter (fun p ↦ dist p z₁ = dist p z₂) ∧
      (∀ c ∈ D.A.filter (fun p ↦ dist p z₁ = dist p z₂), c ≠ S.oppApex2 →
        c ∈ S.capInteriorByIndex S.oppIndex2) ∧
      (HasNEquidistantProperty 4 ((D.A.erase z₁).erase z₂) →
        H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁) ∧
      (¬ (H.centerAt z₁ hz₁ = z₂ ∧ H.centerAt z₂ hz₂ = z₁) →
        ∃ c ∈ (D.A.erase z₁).erase z₂,
          ¬ HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) c ∧
          ∀ s : ℝ, 0 < s → 4 ≤ (SelectedClass D.A c s).card →
            (dist c z₁ = s ∧ dist c z₂ = s) ∨
              ((SelectedClass D.A c s).card = 4 ∧
                ((z₁ ∈ SelectedClass D.A c s ∧
                    z₂ ∉ SelectedClass D.A c s) ∨
                  (z₂ ∈ SelectedClass D.A c s ∧
                    z₁ ∉ SelectedClass D.A c s)))) := by
  classical
  obtain ⟨z₁, z₂, hz₁z₂, hz₁I, hz₂I, _hz₁U, _hz₂U, hclass, hsurv1, hsurv2⟩ :=
    d1_swappedCommonDeletion_pair R hcard surface rho otherRadius firstRow
      secondRow hradii hnoFive hfirstRadius hsecondRadius hdisjoint
  have hcoradial : dist S.oppApex2 z₁ = dist S.oppApex2 z₂ := by
    rcases hclass with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩ <;>
      exact ((mem_selectedClass.mp h₁).2).trans
        ((mem_selectedClass.mp h₂).2).symm
  have hz₁A : z₁ ∈ D.A := by
    rcases hclass with ⟨h₁, _⟩ | ⟨h₁, _⟩ <;> exact (mem_selectedClass.mp h₁).1
  have hz₂A : z₂ ∈ D.A := by
    rcases hclass with ⟨_, h₂⟩ | ⟨_, h₂⟩ <;> exact (mem_selectedClass.mp h₂).1
  refine ⟨z₁, z₂, hz₁A, hz₂A, hz₁z₂, hz₁I, hz₂I, hcoradial, hsurv1, hsurv2,
    pair_bisector_carrier_card_le_two hz₁A hz₂A hz₁z₂, ?_, ?_, ?_, ?_⟩
  · exact Finset.mem_filter.mpr ⟨oppApex2_mem_A S, hcoradial⟩
  · intro c hc hcNe
    exact pair_bisector_carrier_mem_secondCapInterior hz₁I hz₂I hz₁z₂
      hcoradial (Finset.mem_filter.mp hc).1 hcNe (Finset.mem_filter.mp hc).2
  · intro hprop
    exact mutual_centerAt_of_globalK4_pairErase H hz₁A hz₂A hprop
  · intro hmutual
    obtain ⟨c, hcMem, hcBlocked⟩ :=
      exists_pairErase_obstruction_center H hz₁A hz₂A hmutual
    exact ⟨c, hcMem, hcBlocked, fun s hs hs4 ↦
      pairErase_obstruction_row_normalForm hcBlocked hs hs4⟩

/-- **D1 blocker-center dichotomy.**  For a swapped common-deletion pair that
survives at both apexes, the chosen blocker center of `z₁` is neither apex,
and either its selected critical row omits `z₂`, or that blocker center is a
strict-`Γ₂` carrier point on the perpendicular bisector of the pair — of which
at most one exists besides `a₂`.  The mirror statement holds for `z₂`. -/
theorem d1_blockerCenter_dichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ D.A) (hne : z₁ ≠ z₂)
    (hz₁I : z₁ ∈ S.capInteriorByIndex S.oppIndex2)
    (hz₂I : z₂ ∈ S.capInteriorByIndex S.oppIndex2)
    (hcoradial : dist S.oppApex2 z₁ = dist S.oppApex2 z₂)
    (hsurv1 : HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex1)
    (hsurv2 : HasNEquidistantPointsAt 4 ((D.A.erase z₁).erase z₂) S.oppApex2) :
    H.centerAt z₁ hz₁ ≠ S.oppApex1 ∧ H.centerAt z₁ hz₁ ≠ S.oppApex2 ∧
      (z₂ ∉ (H.selectedAt z₁ hz₁).toCriticalFourShell.support ∨
        (H.centerAt z₁ hz₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
          H.centerAt z₁ hz₁ ∈
            D.A.filter fun p ↦ dist p z₁ = dist p z₂)) := by
  have hNe1 : H.centerAt z₁ hz₁ ≠ S.oppApex1 :=
    centerAt_ne_of_pairErase_survives H hz₁ hsurv1
  have hNe2 : H.centerAt z₁ hz₁ ≠ S.oppApex2 :=
    centerAt_ne_of_pairErase_survives H hz₁ hsurv2
  refine ⟨hNe1, hNe2, ?_⟩
  rcases centerAt_row_omits_or_bisects H hz₁ z₂ with homit | hbisect
  · exact Or.inl homit
  · refine Or.inr ⟨?_, Finset.mem_filter.mpr ⟨centerAt_mem_A H hz₁, hbisect⟩⟩
    exact pair_bisector_carrier_mem_secondCapInterior hz₁I hz₂I hne hcoradial
      (centerAt_mem_A H hz₁) hNe2 hbisect

/-- **What remains of the D1 minimality route.**  Over the leaf's verbatim
binders, a global-survival proof for the swapped common-deletion pair would
close D1 — and it exists only if the pair is a mutual blocker pair. -/
theorem d1_globalSurvival_closes_leaf
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    {z₁ z₂ : ℝ²} (hz₁ : z₁ ∈ D.A) (hz₂ : z₂ ∈ D.A) (hne : z₁ ≠ z₂)
    (hprop : HasNEquidistantProperty 4 ((D.A.erase z₁).erase z₂)) :
    False :=
  false_of_globalK4_pairErase R.minimal hz₁ hz₂ hne hprop

/- ## Axiom gate -/

#print axioms equidistantAt_mono
#print axioms oppApex2_mem_A
#print axioms oppApex1_eq_oppositeVertex_oppIndex1
#print axioms oppApex2_eq_oppositeVertex_oppIndex2
#print axioms leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2
#print axioms firstApexClass_inter_secondOppCap_card_le_one
#print axioms d1_firstApexClass_inter_secondCapInterior_card_le_one
#print axioms d1_rho_pos
#print axioms selectedFourClass_support_subset_selectedClass
#print axioms d1_class_card_eq_four
#print axioms d1_strictInterior_double_hit
#print axioms twoDeletion_survives_at_both_apexes
#print axioms d1_swappedCommonDeletion_pair
#print axioms centerAt_mem_A
#print axioms centerAt_ne_self
#print axioms pairErase_blocked_at_centerAt
#print axioms centerAt_mem_pairErase
#print axioms not_globalK4_pairErase_of_centerAt_ne
#print axioms mutual_centerAt_of_globalK4_pairErase
#print axioms singleErase_survives_of_globalK4_pairErase
#print axioms exists_pairErase_obstruction_center
#print axioms centerAt_ne_of_pairErase_survives
#print axioms centerAt_row_omits_or_bisects
#print axioms false_of_globalK4_pairErase
#print axioms pairErase_obstruction_row_normalForm
#print axioms pair_bisector_carrier_card_le_two
#print axioms pair_bisector_carrier_mem_secondCapInterior
#print axioms d1_pairDeletion_obstruction_census
#print axioms d1_blockerCenter_dichotomy
#print axioms d1_globalSurvival_closes_leaf

end D1GlobalSurvival
end Problem97
