import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Scratch: geometry classifier for two global-K4 continuation rows

This file is intentionally scratch-only.  It starts with a selected four-class
at the second opposite apex, names two distinct support points in the strict
interior of the opposite cap, chooses global-K4 rows at those two centers, and
classifies the first pairwise deletion step.

The residual is deliberately not called a contradiction: neither of its two
metric arms is consumed by an existing terminal theorem without additional
row/cap-order data.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailContinuationGeometryClassifier

attribute [local instance] Classical.propDecidable

private theorem two_le_third_inter_of_card_four
    {alpha : Type _} [DecidableEq alpha]
    {T B₁ B₂ I : Finset alpha}
    (hcard : T.card = 4)
    (hcover : T ⊆ B₁ ∪ B₂ ∪ I)
    (hB₁ : (T ∩ B₁).card ≤ 1)
    (hB₂ : (T ∩ B₂).card ≤ 1) :
    2 ≤ (T ∩ I).card := by
  have hdecomp : T = (T ∩ B₁) ∪ (T ∩ B₂) ∪ (T ∩ I) := by
    ext x
    constructor
    · intro hxT
      have hx := hcover hxT
      simp only [Finset.mem_union, Finset.mem_inter] at hx ⊢
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact Or.inl (Or.inl ⟨hxT, hxB₁⟩)
      · exact Or.inl (Or.inr ⟨hxT, hxB₂⟩)
      · exact Or.inr ⟨hxT, hxI⟩
    · intro hx
      simp only [Finset.mem_union, Finset.mem_inter] at hx
      rcases hx with (hxB₁ | hxB₂) | hxI
      · exact hxB₁.1
      · exact hxB₂.1
      · exact hxI.1
  have hcard_le :
      T.card ≤ (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
    calc
      T.card = (((T ∩ B₁) ∪ (T ∩ B₂)) ∪ (T ∩ I)).card := by
        exact congrArg Finset.card hdecomp
      _ ≤ ((T ∩ B₁) ∪ (T ∩ B₂)).card + (T ∩ I).card :=
        Finset.card_union_le _ _
      _ ≤ ((T ∩ B₁).card + (T ∩ B₂).card) + (T ∩ I).card :=
        Nat.add_le_add_right (Finset.card_union_le _ _) _
      _ = (T ∩ B₁).card + (T ∩ B₂).card + (T ∩ I).card := by
        rw [Nat.add_assoc]
  omega

private theorem secondApex_support_strictInterior_card_ge_two
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    2 ≤ (K.support ∩
      (D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1))).card := by
  let F := D.A.filter fun x => dist x D.packet.oppApex2 = K.radius
  have hsupportF : K.support ⊆ F := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨K.support_subset_A hx, by
        simpa [dist_comm] using K.support_eq_radius x hx⟩
  have hcover : K.support ⊆
      D.packet.surplusCap ∪ D.packet.oppCap1 ∪
        (D.packet.oppCap2 \
          (D.packet.surplusCap ∪ D.packet.oppCap1)) :=
    fun _ hx => U2NonSurplusSqueeze.oppApex2_exactRadiusClass_cover
      D K.radius (hsupportF hx)
  have hsurplus : (K.support ∩ D.packet.surplusCap).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.surplusCap).card ≤
          (F ∩ D.packet.surplusCap).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1,
            (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_surplusCap_one_hit
            D K.radius
  have hother : (K.support ∩ D.packet.oppCap1).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.oppCap1).card ≤
          (F ∩ D.packet.oppCap1).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1,
            (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex2_otherCap_one_hit
            D K.radius
  exact two_le_third_inter_of_card_four
    K.support_card hcover hsurplus hother

private theorem firstApex_support_strictInterior_card_ge_two
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1) :
    2 ≤ (K.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2))).card := by
  let F := D.A.filter fun x => dist x D.packet.oppApex1 = K.radius
  have hsupportF : K.support ⊆ F := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨K.support_subset_A hx, by
        simpa [dist_comm] using K.support_eq_radius x hx⟩
  have hcover : K.support ⊆
      D.packet.surplusCap ∪ D.packet.oppCap2 ∪
        (D.packet.oppCap1 \
          (D.packet.surplusCap ∪ D.packet.oppCap2)) :=
    fun _ hx => U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover
      D K.radius (hsupportF hx)
  have hsurplus : (K.support ∩ D.packet.surplusCap).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.surplusCap).card ≤
          (F ∩ D.packet.surplusCap).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1,
            (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit
            D K.radius
  have hother : (K.support ∩ D.packet.oppCap2).card ≤ 1 := by
    calc
      (K.support ∩ D.packet.oppCap2).card ≤
          (F ∩ D.packet.oppCap2).card := by
        apply Finset.card_le_card
        intro x hx
        exact Finset.mem_inter.mpr
          ⟨hsupportF (Finset.mem_inter.mp hx).1,
            (Finset.mem_inter.mp hx).2⟩
      _ ≤ 1 := by
        simpa [F] using
          U2NonSurplusSqueeze.oppApex1_otherCap_one_hit
            D K.radius
  exact two_le_third_inter_of_card_four
    K.support_card hcover hsurplus hother

private theorem oppApex1_mem_A (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using
      D.packet.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using
      D.packet.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using
      D.packet.triangle.v1_mem

private theorem oppApex1_mem_oppCap2 (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.oppCap2 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v1_mem_C2

private theorem oppApex1_mem_surplusCap (D : CounterexampleData) :
    D.packet.oppApex1 ∈ D.packet.surplusCap := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v2_mem_C1
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v3_mem_C2
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.surplusCap, hi] using
      D.packet.partition.v1_mem_C3

private theorem oppApex2_mem_A (D : CounterexampleData) :
    D.packet.oppApex2 ∈ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using
      D.packet.triangle.v2_mem

private theorem oppApex2_not_mem_oppCap2 (D : CounterexampleData) :
    D.packet.oppApex2 ∉ D.packet.oppCap2 := by
  rcases hi : D.packet.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppCap2, hi] using
      D.packet.partition.v2_notin_C2

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Two named strict-`oppCap1` support points in a first-apex selected row.
Both points are outside `oppCap2`, while the row center `oppApex1` is an
endpoint of `oppCap2`. -/
structure FirstApexStrictPair
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1) where
  a : ℝ²
  b : ℝ²
  a_mem : a ∈ K.support ∩
    (D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2))
  b_mem : b ∈ K.support ∩
    (D.packet.oppCap1 \
      (D.packet.surplusCap ∪ D.packet.oppCap2))
  a_ne_b : a ≠ b

theorem nonempty_firstApexStrictPair
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1) :
    Nonempty (FirstApexStrictPair D K) := by
  let I := D.packet.oppCap1 \
    (D.packet.surplusCap ∪ D.packet.oppCap2)
  have htwo : 2 ≤ (K.support ∩ I).card := by
    simpa [I] using firstApex_support_strictInterior_card_ge_two D K
  have hone : 1 < (K.support ∩ I).card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨a, ha, b, hb, hab⟩
  exact ⟨
    { a := a
      b := b
      a_mem := by simpa [I] using ha
      b_mem := by simpa [I] using hb
      a_ne_b := hab }⟩

namespace FirstApexStrictPair

variable {D : CounterexampleData}
variable {K : SelectedFourClass D.A D.packet.oppApex1}

theorem a_mem_A (Q : FirstApexStrictPair D K) : Q.a ∈ D.A :=
  K.support_subset_A (Finset.mem_inter.mp Q.a_mem).1

theorem b_mem_A (Q : FirstApexStrictPair D K) : Q.b ∈ D.A :=
  K.support_subset_A (Finset.mem_inter.mp Q.b_mem).1

theorem a_not_mem_oppCap2 (Q : FirstApexStrictPair D K) :
    Q.a ∉ D.packet.oppCap2 := by
  intro ha
  exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp Q.a_mem).2).2
    (Finset.mem_union.mpr (Or.inr ha))

theorem b_not_mem_oppCap2 (Q : FirstApexStrictPair D K) :
    Q.b ∉ D.packet.oppCap2 := by
  intro hb
  exact (Finset.mem_sdiff.mp (Finset.mem_inter.mp Q.b_mem).2).2
    (Finset.mem_union.mpr (Or.inr hb))

/-- Conditional terminal supplied by the symmetric apex packet.

The first-apex row is centered at the `oppCap2` endpoint `oppApex1` and
contains the outside pair `a,b`.  Therefore no selected row centered at a
distinct strict-`oppCap2` point can also contain both `a,b`. -/
theorem not_both_mem_selectedRow_at_strictOppCap2
    (Q : FirstApexStrictPair D K)
    {z : ℝ²}
    (hz : z ∈ D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
    (R : SelectedFourClass D.A z) :
    ¬ (Q.a ∈ R.support ∧ Q.b ∈ R.support) := by
  classical
  rintro ⟨haR, hbR⟩
  have hzCap : z ∈ D.packet.oppCap2 := (Finset.mem_sdiff.mp hz).1
  have hzNotSurplus : z ∉ D.packet.surplusCap := by
    intro hzSurplus
    exact (Finset.mem_sdiff.mp hz).2
      (Finset.mem_union.mpr (Or.inl hzSurplus))
  have hcenters : D.packet.oppApex1 ≠ z := by
    intro h
    apply hzNotSurplus
    simpa [← h] using oppApex1_mem_surplusCap D
  rcases D.packet.capByIndex_cgn4g_capData
      D.convex D.packet.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapEq : Finset.univ.image L.points = D.packet.oppCap2 := by
    rw [hcap, capByIndex_oppIndex2_eq_oppCap2]
  have hapexImage :
      D.packet.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcapEq]
    exact oppApex1_mem_oppCap2 D
  have hzImage : z ∈ Finset.univ.image L.points := by
    rw [hcapEq]
    exact hzCap
  rcases Finset.mem_image.mp hapexImage with ⟨i, _hi, hi⟩
  rcases Finset.mem_image.mp hzImage with ⟨j, _hj, hj⟩
  have hij : i ≠ j := by
    intro h
    apply hcenters
    simpa [hi, hj] using congrArg L.points h
  have hmem : ∀ t : Fin m, L.points t ∈ D.A := Packet.mem_A
  have hapexEq :
      dist D.packet.oppApex1 Q.a =
        dist D.packet.oppApex1 Q.b :=
    (K.support_eq_radius Q.a (Finset.mem_inter.mp Q.a_mem).1).trans
      (K.support_eq_radius Q.b (Finset.mem_inter.mp Q.b_mem).1).symm
  have hzEq : dist z Q.a = dist z Q.b :=
    (R.support_eq_radius Q.a haR).trans
      (R.support_eq_radius Q.b hbR).symm
  rcases lt_or_gt_of_ne hij with hijlt | hjilt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord hmem hijlt Q.a_mem_A Q.b_mem_A
      (by simpa [hcapEq] using Q.a_not_mem_oppCap2)
      (by simpa [hcapEq] using Q.b_not_mem_oppCap2)
      Q.a_ne_b
      (by simpa [hi] using hapexEq)
      (by simpa [hj] using hzEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord hmem hjilt Q.a_mem_A Q.b_mem_A
      (by simpa [hcapEq] using Q.a_not_mem_oppCap2)
      (by simpa [hcapEq] using Q.b_not_mem_oppCap2)
      Q.a_ne_b
      (by simpa [hj] using hzEq)
      (by simpa [hi] using hapexEq)

end FirstApexStrictPair

/-- Two named strict-opposite-cap support centers and their globally supplied
selected rows. -/
structure TwoContinuationRows
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) where
  z₁ : ℝ²
  z₂ : ℝ²
  z₁_mem : z₁ ∈ K.support ∩
    (D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
  z₂_mem : z₂ ∈ K.support ∩
    (D.packet.oppCap2 \
      (D.packet.surplusCap ∪ D.packet.oppCap1))
  z₁_ne_z₂ : z₁ ≠ z₂
  row₁ : SelectedFourClass D.A z₁
  row₂ : SelectedFourClass D.A z₂

/-- Symmetric first/second-apex packet.  The first apex supplies a fixed
outside pair; the second apex supplies two distinct strict-cap centers and
global continuation rows. -/
structure SymmetricApexContinuationPacket (D : CounterexampleData) where
  firstRow : SelectedFourClass D.A D.packet.oppApex1
  firstPair : FirstApexStrictPair D firstRow
  secondRow : SelectedFourClass D.A D.packet.oppApex2
  continuations : TwoContinuationRows D secondRow

/-- The cardinal continuation theorem with witnesses and rows named. -/
theorem nonempty_twoContinuationRows
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    Nonempty (TwoContinuationRows D K) := by
  let I := D.packet.oppCap2 \
    (D.packet.surplusCap ∪ D.packet.oppCap1)
  have htwo : 2 ≤ (K.support ∩ I).card := by
    simpa [I] using secondApex_support_strictInterior_card_ge_two D K
  have hone : 1 < (K.support ∩ I).card := by omega
  rcases Finset.one_lt_card.mp hone with
    ⟨z₁, hz₁, z₂, hz₂, hz₁z₂⟩
  exact ⟨
    { z₁ := z₁
      z₂ := z₂
      z₁_mem := by simpa [I] using hz₁
      z₂_mem := by simpa [I] using hz₂
      z₁_ne_z₂ := hz₁z₂
      row₁ := Classical.choice
        (exists_selectedFourClass_of_globalK4 D.K4
          (K.support_subset_A (Finset.mem_inter.mp hz₁).1))
      row₂ := Classical.choice
        (exists_selectedFourClass_of_globalK4 D.K4
          (K.support_subset_A (Finset.mem_inter.mp hz₂).1)) }⟩

theorem nonempty_symmetricApexContinuationPacket
    (D : CounterexampleData) :
    Nonempty (SymmetricApexContinuationPacket D) := by
  let K₁ := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4 (oppApex1_mem_A D))
  let K₂ := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4 (oppApex2_mem_A D))
  exact ⟨
    { firstRow := K₁
      firstPair := Classical.choice (nonempty_firstApexStrictPair D K₁)
      secondRow := K₂
      continuations := Classical.choice (nonempty_twoContinuationRows D K₂) }⟩

namespace TwoContinuationRows

variable {D : CounterexampleData}
variable {K : SelectedFourClass D.A D.packet.oppApex2}

theorem z₁_mem_A (P : TwoContinuationRows D K) : P.z₁ ∈ D.A :=
  K.support_subset_A (Finset.mem_inter.mp P.z₁_mem).1

theorem z₂_mem_A (P : TwoContinuationRows D K) : P.z₂ ∈ D.A :=
  K.support_subset_A (Finset.mem_inter.mp P.z₂_mem).1

theorem z₁_mem_oppCap2 (P : TwoContinuationRows D K) :
    P.z₁ ∈ D.packet.oppCap2 :=
  (Finset.mem_sdiff.mp (Finset.mem_inter.mp P.z₁_mem).2).1

theorem z₂_mem_oppCap2 (P : TwoContinuationRows D K) :
    P.z₂ ∈ D.packet.oppCap2 :=
  (Finset.mem_sdiff.mp (Finset.mem_inter.mp P.z₂_mem).2).1

theorem apex_equidistant (P : TwoContinuationRows D K) :
    dist P.z₁ D.packet.oppApex2 =
      dist P.z₂ D.packet.oppApex2 := by
  have hz₁ := K.support_eq_radius P.z₁
    (Finset.mem_inter.mp P.z₁_mem).1
  have hz₂ := K.support_eq_radius P.z₂
    (Finset.mem_inter.mp P.z₂_mem).1
  simpa [dist_comm] using hz₁.trans hz₂.symm

private theorem survives_erase_of_not_mem_support
    {A : Finset ℝ²} {center deleted : ℝ²}
    (R : SelectedFourClass A center)
    (hdeleted : deleted ∉ R.support) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  refine ⟨R.radius, R.radius_pos, ?_⟩
  calc
    4 = R.support.card := R.support_card.symm
    _ ≤ ((A.erase deleted).filter
        fun x => dist center x = R.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h => hdeleted (h ▸ hx), R.support_subset_A hx⟩,
          R.support_eq_radius x hx⟩

private theorem survives_erase_of_extra_same_radius
    {A : Finset ℝ²} {center extra deleted : ℝ²}
    (R : SelectedFourClass A center)
    (hextraA : extra ∈ A)
    (hextraOutside : extra ∉ R.support)
    (hextraRadius : dist center extra = R.radius) :
    HasNEquidistantPointsAt 4 (A.erase deleted) center := by
  have hfive : 5 ≤ (SelectedClass A center R.radius).card := by
    have hcard : (insert extra R.support).card = 5 := by
      rw [Finset.card_insert_of_notMem hextraOutside, R.support_card]
    rw [← hcard]
    apply Finset.card_le_card
    intro x hx
    rcases Finset.mem_insert.mp hx with hxeq | hxR
    · subst x
      exact mem_selectedClass.mpr ⟨hextraA, hextraRadius⟩
    · exact mem_selectedClass.mpr
        ⟨R.support_subset_A hxR, R.support_eq_radius x hxR⟩
  refine ⟨R.radius, R.radius_pos, ?_⟩
  simpa [SelectedClass] using
    (selectedClass_erase_card_ge_of_succ_le
      (A := A) (x := deleted) (s := center)
      (d := R.radius) (n := 4) hfive)

/-- Every continuation row centered in `oppCap2` has at least two support
points outside that cap. -/
theorem two_le_row₁_support_outside_oppCap2
    (P : TwoContinuationRows D K) :
    2 ≤ (P.row₁.support \ D.packet.oppCap2).card := by
  have hcap :
      (P.row₁.support ∩ D.packet.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      D.packet D.convex D.packet.oppIndex2 P.row₁
      (by
        rw [capByIndex_oppIndex2_eq_oppCap2]
        exact P.z₁_mem_oppCap2)
    simpa [capByIndex_oppIndex2_eq_oppCap2] using hraw
  have hsplit := Finset.card_sdiff_add_card_inter
    P.row₁.support D.packet.oppCap2
  have hcard := P.row₁.support_card
  omega

theorem two_le_row₂_support_outside_oppCap2
    (P : TwoContinuationRows D K) :
    2 ≤ (P.row₂.support \ D.packet.oppCap2).card := by
  have hcap :
      (P.row₂.support ∩ D.packet.oppCap2).card ≤ 2 := by
    have hraw :=
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      D.packet D.convex D.packet.oppIndex2 P.row₂
      (by
        rw [capByIndex_oppIndex2_eq_oppCap2]
        exact P.z₂_mem_oppCap2)
    simpa [capByIndex_oppIndex2_eq_oppCap2] using hraw
  have hsplit := Finset.card_sdiff_add_card_inter
    P.row₂.support D.packet.oppCap2
  have hcard := P.row₂.support_card
  omega

/-- Two rows centered at distinct points of the same ordered cap have at most
one common support point outside that cap. -/
theorem common_support_outside_oppCap2_card_le_one
    (P : TwoContinuationRows D K) :
    (((P.row₁.support ∩ P.row₂.support) \
      D.packet.oppCap2).card ≤ 1) := by
  classical
  rcases D.packet.capByIndex_cgn4g_capData
      D.convex D.packet.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapEq : Finset.univ.image L.points = D.packet.oppCap2 := by
    rw [hcap, capByIndex_oppIndex2_eq_oppCap2]
  have hz₁Image : P.z₁ ∈ Finset.univ.image L.points := by
    rw [hcapEq]
    exact P.z₁_mem_oppCap2
  have hz₂Image : P.z₂ ∈ Finset.univ.image L.points := by
    rw [hcapEq]
    exact P.z₂_mem_oppCap2
  rcases Finset.mem_image.mp hz₁Image with ⟨i₁, _hi₁, hi₁⟩
  rcases Finset.mem_image.mp hz₂Image with ⟨i₂, _hi₂, hi₂⟩
  have hi₁i₂ : i₁ ≠ i₂ := by
    intro h
    apply P.z₁_ne_z₂
    simpa [hi₁, hi₂] using congrArg L.points h
  by_contra hle
  have htwo : 2 ≤
      ((P.row₁.support ∩ P.row₂.support) \
        D.packet.oppCap2).card := by omega
  have hone : 1 <
      ((P.row₁.support ∩ P.row₂.support) \
        D.packet.oppCap2).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  have haBoth := (Finset.mem_inter.mp (Finset.mem_sdiff.mp ha).1)
  have hbBoth := (Finset.mem_inter.mp (Finset.mem_sdiff.mp hb).1)
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcapEq] using (Finset.mem_sdiff.mp ha).2
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcapEq] using (Finset.mem_sdiff.mp hb).2
  have hmem : ∀ t : Fin m, L.points t ∈ D.A := by
    intro t
    exact Packet.mem_A t
  have hrow₁ : dist P.z₁ a = dist P.z₁ b :=
    (P.row₁.support_eq_radius a haBoth.1).trans
      (P.row₁.support_eq_radius b hbBoth.1).symm
  have hrow₂ : dist P.z₂ a = dist P.z₂ b :=
    (P.row₂.support_eq_radius a haBoth.2).trans
      (P.row₂.support_eq_radius b hbBoth.2).symm
  rcases lt_or_gt_of_ne hi₁i₂ with hi₁lt | hi₂lt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord hmem
      hi₁lt
      (P.row₁.support_subset_A haBoth.1)
      (P.row₁.support_subset_A hbBoth.1)
      haOutside hbOutside hab
      (by simpa [hi₁] using hrow₁)
      (by simpa [hi₂] using hrow₂)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord hmem
      hi₂lt
      (P.row₁.support_subset_A haBoth.1)
      (P.row₁.support_subset_A hbBoth.1)
      haOutside hbOutside hab
      (by simpa [hi₂] using hrow₂)
      (by simpa [hi₁] using hrow₁)

/-- The no-common-outside-pair result forces genuine row divergence in both
directions: each continuation row has an outside-cap support point omitted by
the other row. -/
theorem exists_divergent_outside_witnesses
    (P : TwoContinuationRows D K) :
    ∃ a b : ℝ²,
      a ∈ P.row₁.support \ D.packet.oppCap2 ∧
      a ∉ P.row₂.support ∧
      b ∈ P.row₂.support \ D.packet.oppCap2 ∧
      b ∉ P.row₁.support := by
  let T₁ := P.row₁.support \ D.packet.oppCap2
  let T₂ := P.row₂.support \ D.packet.oppCap2
  let C := (P.row₁.support ∩ P.row₂.support) \
    D.packet.oppCap2
  have hT₁ : 2 ≤ T₁.card := by
    simpa [T₁] using P.two_le_row₁_support_outside_oppCap2
  have hT₂ : 2 ≤ T₂.card := by
    simpa [T₂] using P.two_le_row₂_support_outside_oppCap2
  have hC : C.card ≤ 1 := by
    simpa [C] using P.common_support_outside_oppCap2_card_le_one
  have hnot₁ : ¬ T₁ ⊆ P.row₂.support := by
    intro hsub
    have hT₁C : T₁ ⊆ C := by
      intro x hx
      rcases Finset.mem_sdiff.mp hx with ⟨hx₁, hxOutside⟩
      exact Finset.mem_sdiff.mpr
        ⟨Finset.mem_inter.mpr ⟨hx₁, hsub hx⟩, hxOutside⟩
    have hcard := Finset.card_le_card hT₁C
    omega
  have hnot₂ : ¬ T₂ ⊆ P.row₁.support := by
    intro hsub
    have hT₂C : T₂ ⊆ C := by
      intro x hx
      rcases Finset.mem_sdiff.mp hx with ⟨hx₂, hxOutside⟩
      exact Finset.mem_sdiff.mpr
        ⟨Finset.mem_inter.mpr ⟨hsub hx, hx₂⟩, hxOutside⟩
    have hcard := Finset.card_le_card hT₂C
    omega
  rcases Finset.not_subset.mp hnot₁ with ⟨a, haT₁, haOutside₂⟩
  rcases Finset.not_subset.mp hnot₂ with ⟨b, hbT₂, hbOutside₁⟩
  exact ⟨a, b, by simpa [T₁] using haT₁, haOutside₂,
    by simpa [T₂] using hbT₂, hbOutside₁⟩

/-- The two residual metric shapes after the easy pairwise-deletion arms have
failed. -/
def MetricResidual (P : TwoContinuationRows D K) : Prop :=
  let d := dist P.z₁ P.z₂
  (d ≠ K.radius ∧
      P.z₂ ∈ P.row₁.support ∧
      P.z₁ ∈ P.row₂.support ∧
      P.row₁.radius = d ∧
      P.row₂.radius = d ∧
      D.packet.oppApex2 ∉ P.row₁.support ∧
      D.packet.oppApex2 ∉ P.row₂.support) ∨
    (d = K.radius ∧
      P.z₂ ∈ P.row₁.support ∧
      P.z₁ ∈ P.row₂.support ∧
      D.packet.oppApex2 ∈ P.row₁.support ∧
      D.packet.oppApex2 ∈ P.row₂.support ∧
      P.row₁.radius = K.radius ∧
      P.row₂.radius = K.radius)

/-- Named form of the equilateral arm of `MetricResidual`. -/
def EquilateralResidual (P : TwoContinuationRows D K) : Prop :=
  dist P.z₁ P.z₂ = K.radius ∧
    P.z₂ ∈ P.row₁.support ∧
    P.z₁ ∈ P.row₂.support ∧
    D.packet.oppApex2 ∈ P.row₁.support ∧
    D.packet.oppApex2 ∈ P.row₂.support ∧
    P.row₁.radius = K.radius ∧
    P.row₂.radius = K.radius

/-- In the equilateral residual, the apex is the unique common outside-cap
support point.  Thus this arm cannot already supply the repeated outside pair
needed by `outsidePair_unique_capCenter`. -/
theorem common_support_outside_oppCap2_eq_singleton_of_equilateralResidual
    (P : TwoContinuationRows D K)
    (h : P.EquilateralResidual) :
    (P.row₁.support ∩ P.row₂.support) \
        D.packet.oppCap2 =
      {D.packet.oppApex2} := by
  have hapex₁ : D.packet.oppApex2 ∈ P.row₁.support := h.2.2.2.1
  have hapex₂ : D.packet.oppApex2 ∈ P.row₂.support := h.2.2.2.2.1
  have hapex : D.packet.oppApex2 ∈
      (P.row₁.support ∩ P.row₂.support) \
        D.packet.oppCap2 :=
    Finset.mem_sdiff.mpr
      ⟨Finset.mem_inter.mpr ⟨hapex₁, hapex₂⟩,
        oppApex2_not_mem_oppCap2 D⟩
  have hle := P.common_support_outside_oppCap2_card_le_one
  rw [Finset.card_le_one] at hle
  ext x
  constructor
  · intro hx
    have hxeq := hle x hx D.packet.oppApex2 hapex
    exact Finset.mem_singleton.mpr hxeq
  · intro hx
    have hxeq : x = D.packet.oppApex2 := by simpa using hx
    simpa [hxeq] using hapex

/-- Branch-complete pairwise-deletion classifier.

If neither new row survives deletion of the other center, both rows contain
the opposite center.  If the center chord is not the parent radius, the apex
is off both row circles.  If it is the parent radius, the apex is a fifth
same-radius candidate; failure of both deletions forces the apex to have been
selected in both rows already. -/
theorem cross_survival_or_metricResidual
    (P : TwoContinuationRows D K) :
    HasNEquidistantPointsAt 4 (D.A.erase P.z₂) P.z₁ ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.z₁) P.z₂ ∨
      P.MetricResidual := by
  by_cases hsurvive₁ :
      HasNEquidistantPointsAt 4 (D.A.erase P.z₂) P.z₁
  · exact Or.inl hsurvive₁
  by_cases hsurvive₂ :
      HasNEquidistantPointsAt 4 (D.A.erase P.z₁) P.z₂
  · exact Or.inr (Or.inl hsurvive₂)
  right
  right
  have hz₂row₁ : P.z₂ ∈ P.row₁.support := by
    by_contra hz₂
    exact hsurvive₁
      (survives_erase_of_not_mem_support P.row₁ hz₂)
  have hz₁row₂ : P.z₁ ∈ P.row₂.support := by
    by_contra hz₁
    exact hsurvive₂
      (survives_erase_of_not_mem_support P.row₂ hz₁)
  have hradius₁ : P.row₁.radius = dist P.z₁ P.z₂ :=
    (P.row₁.support_eq_radius P.z₂ hz₂row₁).symm
  have hradius₂ : P.row₂.radius = dist P.z₁ P.z₂ := by
    rw [dist_comm]
    exact (P.row₂.support_eq_radius P.z₁ hz₁row₂).symm
  by_cases heq : dist P.z₁ P.z₂ = K.radius
  · refine Or.inr ⟨heq, hz₂row₁, hz₁row₂, ?_, ?_, ?_, ?_⟩
    · by_contra hapex
      apply hsurvive₁
      apply survives_erase_of_extra_same_radius P.row₁
        (oppApex2_mem_A D) hapex
      calc
        dist P.z₁ D.packet.oppApex2 = K.radius := by
          simpa [dist_comm] using K.support_eq_radius P.z₁
            (Finset.mem_inter.mp P.z₁_mem).1
        _ = P.row₁.radius := by rw [hradius₁, heq]
    · by_contra hapex
      apply hsurvive₂
      apply survives_erase_of_extra_same_radius P.row₂
        (oppApex2_mem_A D) hapex
      calc
        dist P.z₂ D.packet.oppApex2 = K.radius := by
          simpa [dist_comm] using K.support_eq_radius P.z₂
            (Finset.mem_inter.mp P.z₂_mem).1
        _ = P.row₂.radius := by rw [hradius₂, heq]
    · exact hradius₁.trans heq
    · exact hradius₂.trans heq
  · refine Or.inl ⟨heq, hz₂row₁, hz₁row₂,
        hradius₁, hradius₂, ?_, ?_⟩
    · intro hapex
      have hapexRadius := P.row₁.support_eq_radius
        D.packet.oppApex2 hapex
      have hparent := K.support_eq_radius P.z₁
        (Finset.mem_inter.mp P.z₁_mem).1
      apply heq
      calc
        dist P.z₁ P.z₂ = P.row₁.radius := hradius₁.symm
        _ = dist P.z₁ D.packet.oppApex2 := hapexRadius.symm
        _ = K.radius := by simpa [dist_comm] using hparent
    · intro hapex
      have hapexRadius := P.row₂.support_eq_radius
        D.packet.oppApex2 hapex
      have hparent := K.support_eq_radius P.z₂
        (Finset.mem_inter.mp P.z₂_mem).1
      apply heq
      calc
        dist P.z₁ P.z₂ = P.row₂.radius := hradius₂.symm
        _ = dist P.z₂ D.packet.oppApex2 := hapexRadius.symm
        _ = K.radius := by simpa [dist_comm] using hparent

/-- The complete scratch handoff: two named continuation rows, two outside-cap
support points per row, no common outside pair, and the branch-complete metric
classifier. -/
theorem exists_twoContinuationRows_with_geometry
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex2) :
    ∃ P : TwoContinuationRows D K,
      2 ≤ (P.row₁.support \ D.packet.oppCap2).card ∧
      2 ≤ (P.row₂.support \ D.packet.oppCap2).card ∧
      (((P.row₁.support ∩ P.row₂.support) \
        D.packet.oppCap2).card ≤ 1) ∧
      (HasNEquidistantPointsAt 4 (D.A.erase P.z₂) P.z₁ ∨
        HasNEquidistantPointsAt 4 (D.A.erase P.z₁) P.z₂ ∨
        P.MetricResidual) := by
  rcases nonempty_twoContinuationRows D K with ⟨P⟩
  exact ⟨P,
    P.two_le_row₁_support_outside_oppCap2,
    P.two_le_row₂_support_outside_oppCap2,
    P.common_support_outside_oppCap2_card_le_one,
    P.cross_survival_or_metricResidual⟩

end TwoContinuationRows

namespace SymmetricApexContinuationPacket

/-- Each global row at a strict second-cap continuation center must omit at
least one member of the fixed first-apex outside pair.  A hit on both members
would close immediately by the ordered-cap outside-pair uniqueness theorem. -/
theorem firstPair_omitted_by_eachContinuationRow
    {D : CounterexampleData}
    (P : SymmetricApexContinuationPacket D) :
    (P.firstPair.a ∉ P.continuations.row₁.support ∨
      P.firstPair.b ∉ P.continuations.row₁.support) ∧
    (P.firstPair.a ∉ P.continuations.row₂.support ∨
      P.firstPair.b ∉ P.continuations.row₂.support) := by
  have h₁ := P.firstPair.not_both_mem_selectedRow_at_strictOppCap2
    (Finset.mem_inter.mp P.continuations.z₁_mem).2
    P.continuations.row₁
  have h₂ := P.firstPair.not_both_mem_selectedRow_at_strictOppCap2
    (Finset.mem_inter.mp P.continuations.z₂_mem).2
    P.continuations.row₂
  constructor <;> tauto

/-- Fully named symmetric-apex handoff. -/
theorem exists_with_firstPair_omission_and_continuationGeometry
    (D : CounterexampleData) :
    ∃ P : SymmetricApexContinuationPacket D,
      (P.firstPair.a ∉ P.continuations.row₁.support ∨
        P.firstPair.b ∉ P.continuations.row₁.support) ∧
      (P.firstPair.a ∉ P.continuations.row₂.support ∨
        P.firstPair.b ∉ P.continuations.row₂.support) ∧
      2 ≤ (P.continuations.row₁.support \
        D.packet.oppCap2).card ∧
      2 ≤ (P.continuations.row₂.support \
        D.packet.oppCap2).card ∧
      (((P.continuations.row₁.support ∩
          P.continuations.row₂.support) \
        D.packet.oppCap2).card ≤ 1) ∧
      (HasNEquidistantPointsAt 4
          (D.A.erase P.continuations.z₂) P.continuations.z₁ ∨
        HasNEquidistantPointsAt 4
          (D.A.erase P.continuations.z₁) P.continuations.z₂ ∨
        P.continuations.MetricResidual) := by
  rcases nonempty_symmetricApexContinuationPacket D with ⟨P⟩
  have homit := P.firstPair_omitted_by_eachContinuationRow
  exact ⟨P, homit.1, homit.2,
    P.continuations.two_le_row₁_support_outside_oppCap2,
    P.continuations.two_le_row₂_support_outside_oppCap2,
    P.continuations.common_support_outside_oppCap2_card_le_one,
    P.continuations.cross_survival_or_metricResidual⟩

end SymmetricApexContinuationPacket
end ATailContinuationGeometryClassifier
end Problem97

#print axioms Problem97.ATailContinuationGeometryClassifier.nonempty_twoContinuationRows
#print axioms Problem97.ATailContinuationGeometryClassifier.TwoContinuationRows.common_support_outside_oppCap2_card_le_one
#print axioms Problem97.ATailContinuationGeometryClassifier.TwoContinuationRows.exists_divergent_outside_witnesses
#print axioms Problem97.ATailContinuationGeometryClassifier.TwoContinuationRows.cross_survival_or_metricResidual
#print axioms Problem97.ATailContinuationGeometryClassifier.TwoContinuationRows.common_support_outside_oppCap2_eq_singleton_of_equilateralResidual
#print axioms Problem97.ATailContinuationGeometryClassifier.TwoContinuationRows.exists_twoContinuationRows_with_geometry
#print axioms Problem97.ATailContinuationGeometryClassifier.FirstApexStrictPair.not_both_mem_selectedRow_at_strictOppCap2
#print axioms Problem97.ATailContinuationGeometryClassifier.SymmetricApexContinuationPacket.exists_with_firstPair_omission_and_continuationGeometry
