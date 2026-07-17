/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting

/-!
# ATAIL Stage-I finite minimal-deletion cores

This module records the generic MUS-style lift of the Stage-I two-source
deletion argument. Let `U ⊆ A` be a finite set of sources at pairwise distinct
distances from a prescribed center. If deleting all of `U` destroys every
`K4` at that center, but restoring any one source restores a `K4`, then every
source lies on its own exact ambient four-point selected class. The selected
classes for distinct sources are pairwise disjoint.

The final theorem feeds any two members of such a core through the banked
`selectedClass_capInteriorByIndex_card_ge_two` theorem. At a Moser opposite
vertex, the two disjoint exact shells contribute four strict-interior cap
points and force the corresponding closed cap to have cardinality at least
six.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILStageOneMinimalDeletionCore

/-- The exact output attached to a finite minimal deletion core: one ambient
critical selected four-class through every source, with pairwise disjoint
supports. -/
structure MinimalDeletionCore
    (A U : Finset ℝ²) (center : ℝ²) where
  shellAt :
    (s : {x : ℝ² // x ∈ U}) →
      CriticalSelectedFourClass A s.1 center
  supports_pairwise_disjoint :
    ∀ s t : {x : ℝ² // x ∈ U}, s ≠ t →
      Disjoint
        (shellAt s).toCriticalFourShell.support
        (shellAt t).toCriticalFourShell.support

/-- The shell indexed by a core source has exactly that source's radius from
the prescribed center. -/
theorem MinimalDeletionCore.shellAt_radius_eq
    {A U : Finset ℝ²} {center : ℝ²}
    (K : MinimalDeletionCore A U center)
    (s : {x : ℝ² // x ∈ U}) :
    (K.shellAt s).toCriticalFourShell.radius = dist center s.1 := by
  exact
    ((K.shellAt s).toCriticalFourShell.support_eq_radius s.1
      (K.shellAt s).toCriticalFourShell.q_mem_support).symm

/-- Restoring `s` and then erasing it again is exactly deletion of the whole
finite source set. -/
private theorem sdiff_erase_then_erase_eq_sdiff
    {X : Type*} [DecidableEq X]
    (A U : Finset X) {s : X} (hs : s ∈ U) :
    (A \ (U.erase s)).erase s = A \ U := by
  ext x
  by_cases hxs : x = s
  · subst x
    simp [hs]
  · simp [hxs]

/-- The memberwise engine of the finite minimal-core theorem.

If restoring `s` from a fully deleted source set restores a K4, while erasing
`s` again kills every K4 at `center`, the restored witness must use `s` and
must have exactly four members. Distinct source radii ensure that restoring
`s` restores its entire ambient radius class and no other deleted source. -/
theorem criticalSelectedFourClass_of_minimal_deletion_member
    {A U : Finset ℝ²} {center s : ℝ²}
    (hUsub : U ⊆ A)
    (hcenter : center ∈ A)
    (hsU : s ∈ U)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A \ (U.erase s)) center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ U) center)
    (hdistinct :
      ∀ t ∈ U, t ≠ s → dist center t ≠ dist center s) :
    Nonempty (CriticalSelectedFourClass A s center) := by
  classical
  have hblockedErase :
      ¬ HasNEquidistantPointsAt 4
        ((A \ (U.erase s)).erase s) center := by
    rw [sdiff_erase_then_erase_eq_sdiff A U hsU]
    exact hblocked
  rcases
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt hsurvives with
    ⟨radius, hradius, hcard⟩
  have hsClass :
      s ∈ SelectedClass (A \ (U.erase s)) center radius := by
    by_contra hsNot
    apply hblockedErase
    have hsameCard := selectedClass_erase_card_eq_of_not_mem
      (A := A \ (U.erase s)) (x := s) (s := center) (d := radius)
      hsNot
    refine ⟨radius, hradius, ?_⟩
    have hcardErased :
        4 ≤
          (SelectedClass ((A \ (U.erase s)).erase s)
            center radius).card := by
      rw [hsameCard]
      exact hcard
    simpa [SelectedClass] using hcardErased
  have hnotFive :
      ¬ 5 ≤ (SelectedClass (A \ (U.erase s)) center radius).card := by
    intro hfive
    apply hblockedErase
    have hfourErased := selectedClass_erase_card_ge_of_succ_le
      (A := A \ (U.erase s)) (x := s) (s := center) (d := radius)
      (n := 4) (by simpa using hfive)
    exact ⟨radius, hradius, by
      simpa [SelectedClass] using hfourErased⟩
  have hcardExactRestored :
      (SelectedClass (A \ (U.erase s)) center radius).card = 4 := by
    omega
  have hsDist : dist center s = radius :=
    (mem_selectedClass.mp hsClass).2
  have hclassEq :
      SelectedClass (A \ (U.erase s)) center radius =
        SelectedClass A center radius := by
    ext z
    constructor
    · intro hz
      rcases mem_selectedClass.mp hz with ⟨hzRestored, hzDist⟩
      exact mem_selectedClass.mpr
        ⟨(Finset.mem_sdiff.mp hzRestored).1, hzDist⟩
    · intro hz
      rcases mem_selectedClass.mp hz with ⟨hzA, hzDist⟩
      apply mem_selectedClass.mpr
      refine ⟨Finset.mem_sdiff.mpr ⟨hzA, ?_⟩, hzDist⟩
      intro hzDeleted
      rcases Finset.mem_erase.mp hzDeleted with ⟨hzNe, hzU⟩
      exact hdistinct z hzU hzNe (hzDist.trans hsDist.symm)
  have hcardExact : (SelectedClass A center radius).card = 4 := by
    rw [← hclassEq]
    exact hcardExactRestored
  have hsA : s ∈ A := hUsub hsU
  have hsFull : s ∈ SelectedClass A center radius :=
    mem_selectedClass.mpr ⟨hsA, hsDist⟩
  exact CriticalSelectedFourClass.exists_of_exactSelectedClass
    hcenter hradius hcardExact hsFull

/-- A finite deletion-minimal obstruction with pairwise distinct source
radii produces an exact ambient shell through every source, and the shells
are pairwise disjoint.

This is the Stage-I analogue of extracting every member of a minimal
unsatisfiable core rather than only the first deletion witness. -/
theorem exists_minimalDeletionCore
    {A U : Finset ℝ²} {center : ℝ²}
    (hUsub : U ⊆ A)
    (hcenter : center ∈ A)
    (hdistinct :
      ∀ {s}, s ∈ U → ∀ {t}, t ∈ U → s ≠ t →
        dist center s ≠ dist center t)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A \ U) center)
    (hminimal :
      ∀ s ∈ U,
        HasNEquidistantPointsAt 4 (A \ (U.erase s)) center) :
    Nonempty (MinimalDeletionCore A U center) := by
  classical
  have hshell :
      ∀ s : {x : ℝ² // x ∈ U},
        Nonempty (CriticalSelectedFourClass A s.1 center) := by
    intro s
    exact criticalSelectedFourClass_of_minimal_deletion_member
      hUsub hcenter s.2 (hminimal s.1 s.2) hblocked
        (fun t htU hts => hdistinct htU s.2 hts)
  let C :
      (s : {x : ℝ² // x ∈ U}) →
        CriticalSelectedFourClass A s.1 center :=
    fun s => Classical.choice (hshell s)
  refine ⟨
    { shellAt := C
      supports_pairwise_disjoint := ?_ }⟩
  intro s t hst
  have hstVal : s.1 ≠ t.1 := by
    intro hval
    exact hst (Subtype.ext hval)
  have hdistST : dist center s.1 ≠ dist center t.1 :=
    hdistinct s.2 t.2 hstVal
  rw [Finset.disjoint_left]
  intro z hzs hzt
  apply hdistST
  calc
    dist center s.1 = (C s).toCriticalFourShell.radius :=
      ((C s).toCriticalFourShell.support_eq_radius s.1
        (C s).toCriticalFourShell.q_mem_support)
    _ = dist center z :=
      ((C s).toCriticalFourShell.support_eq_radius z hzs).symm
    _ = (C t).toCriticalFourShell.radius :=
      (C t).toCriticalFourShell.support_eq_radius z hzt
    _ = dist center t.1 :=
      ((C t).toCriticalFourShell.support_eq_radius t.1
        (C t).toCriticalFourShell.q_mem_support).symm

/-- Removing the two Moser endpoints from an indexed closed cap lowers its
cardinality by exactly two. -/
private theorem capInteriorByIndex_card_add_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) (k : Fin 3) :
    (S.capInteriorByIndex k).card + 2 = (S.capByIndex k).card := by
  fin_cases k
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior1] using
      U1OppositeCapLowerBounds.interior1_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior2] using
      U1OppositeCapLowerBounds.interior2_card_add_two S.partition
  · simpa only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex,
      U1OppositeCapLowerBounds.interior3] using
      U1OppositeCapLowerBounds.interior3_card_add_two S.partition

/-- Any two members of a minimal deletion core centered at an indexed Moser
opposite vertex force four distinct points into the strict interior of the
opposite cap, hence at least six points in the closed cap. -/
theorem MinimalDeletionCore.capByIndex_card_ge_six_of_two_sources
    {U : Finset ℝ²} {center : ℝ²}
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (K : MinimalDeletionCore D.A U center)
    (k : Fin 3)
    (hcenterEq : S.oppositeVertexByIndex k = center)
    (s t : {x : ℝ² // x ∈ U}) (hst : s ≠ t) :
    6 ≤ (S.capByIndex k).card := by
  classical
  let I := S.capInteriorByIndex k
  have hsClassEq :
      SelectedClass D.A (S.oppositeVertexByIndex k)
          (K.shellAt s).toCriticalFourShell.radius =
        (K.shellAt s).toCriticalFourShell.support := by
    rw [hcenterEq]
    simpa only [SelectedClass] using
      (K.shellAt s).toCriticalFourShell.support_eq.symm
  have htClassEq :
      SelectedClass D.A (S.oppositeVertexByIndex k)
          (K.shellAt t).toCriticalFourShell.radius =
        (K.shellAt t).toCriticalFourShell.support := by
    rw [hcenterEq]
    simpa only [SelectedClass] using
      (K.shellAt t).toCriticalFourShell.support_eq.symm
  have hsCard :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex k)
        (K.shellAt s).toCriticalFourShell.radius).card := by
    rw [hsClassEq, (K.shellAt s).toCriticalFourShell.support_card]
  have htCard :
      4 ≤ (SelectedClass D.A (S.oppositeVertexByIndex k)
        (K.shellAt t).toCriticalFourShell.radius).card := by
    rw [htClassEq, (K.shellAt t).toCriticalFourShell.support_card]
  have hsTwo0 :=
    S.selectedClass_capInteriorByIndex_card_ge_two D.convex k
      (K.shellAt s).toCriticalFourShell.radius_pos hsCard
  have htTwo0 :=
    S.selectedClass_capInteriorByIndex_card_ge_two D.convex k
      (K.shellAt t).toCriticalFourShell.radius_pos htCard
  have hsTwo :
      2 ≤ ((K.shellAt s).toCriticalFourShell.support ∩ I).card := by
    simpa only [I, hsClassEq] using hsTwo0
  have htTwo :
      2 ≤ ((K.shellAt t).toCriticalFourShell.support ∩ I).card := by
    simpa only [I, htClassEq] using htTwo0
  have hdisjointI :
      Disjoint
        ((K.shellAt s).toCriticalFourShell.support ∩ I)
        ((K.shellAt t).toCriticalFourShell.support ∩ I) := by
    have hdisjoint := K.supports_pairwise_disjoint s t hst
    rw [Finset.disjoint_left] at hdisjoint ⊢
    intro x hxs hxt
    exact hdisjoint (Finset.mem_inter.mp hxs).1
      (Finset.mem_inter.mp hxt).1
  have hsubI :
      ((K.shellAt s).toCriticalFourShell.support ∩ I) ∪
          ((K.shellAt t).toCriticalFourShell.support ∩ I) ⊆ I := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxs | hxt
    · exact (Finset.mem_inter.mp hxs).2
    · exact (Finset.mem_inter.mp hxt).2
  have hIcard : 4 ≤ I.card := by
    have hle := Finset.card_le_card hsubI
    rw [Finset.card_union_of_disjoint hdisjointI] at hle
    omega
  have hcapCard := capInteriorByIndex_card_add_two S k
  change I.card + 2 = (S.capByIndex k).card at hcapCard
  omega

/-- Cardinality-only form of the indexed-cap consequence. -/
theorem MinimalDeletionCore.capByIndex_card_ge_six
    {U : Finset ℝ²} {center : ℝ²}
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (K : MinimalDeletionCore D.A U center)
    (k : Fin 3)
    (hcenterEq : S.oppositeVertexByIndex k = center)
    (hUcard : 2 ≤ U.card) :
    6 ≤ (S.capByIndex k).card := by
  have hone : 1 < U.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨s, hsU, t, htU, hst⟩
  apply K.capByIndex_card_ge_six_of_two_sources D S k hcenterEq
    ⟨s, hsU⟩ ⟨t, htU⟩
  intro hsub
  apply hst
  exact congrArg Subtype.val hsub

end ATAILStageOneMinimalDeletionCore
end Problem97
