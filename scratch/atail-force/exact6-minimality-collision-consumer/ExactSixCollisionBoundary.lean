/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.ATail.LargeCapUniqueFive
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Exact-six collision boundary

This scratch file checks the proposed use of global minimal deletion on the
strict-interior part of an exact-five physical-apex radius class.

The first theorem is a regression gate: the physical apex itself realizes the
shared-radius collision output.  Thus membership in `D.A \ T` does not make the
new center distinct from the physical apex.

The second theorem records the strongest consequence after adding that missing
distinctness premise.  At exact closed-cap cardinality six, a nonphysical
collision center forces exactly three physical-radius interior hits and is the
unique fourth strict-interior point.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixCollisionBoundary

open ATailLargeCapUniqueFive
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

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

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The physical apex itself realizes the collision output obtained by deleting
the physical-radius strict-interior set.  In particular, `center ∈ D.A \ T`
does not imply that the center is different from the physical apex. -/
theorem physicalApex_realizes_physicalInteriorDeletion_collision
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    let T := SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
    ∃ center ∈ D.A \ T, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ T ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ∃ s ∈ V, ∃ t ∈ V,
        s ≠ t ∧ dist center s = dist center t := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  have hTthree : 3 ≤ T.card := by
    simpa [T] using three_le_capInterior_hits_of_largeCapUniqueFive profile
  have hTne : T.Nonempty := Finset.card_pos.mp (by omega)
  have hapexNotT : S.oppApex2 ∉ T := by
    intro hapexT
    have hdist := (mem_selectedClass.mp (Finset.mem_inter.mp hapexT).1).2
    have hzero : dist S.oppApex2 S.oppApex2 = 0 := dist_self _
    rw [hzero] at hdist
    nlinarith [profile.radius_pos]
  have hapexRemaining : S.oppApex2 ∈ D.A \ T :=
    Finset.mem_sdiff.mpr ⟨oppApex2_mem_A S, hapexNotT⟩
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ T) S.oppApex2 := by
    intro hK4
    rcases hK4 with ⟨radius, hradius, hfour⟩
    have hsub :
        SelectedClass (D.A \ T) S.oppApex2 radius ⊆
          SelectedClass D.A S.oppApex2 radius := by
      intro x hx
      rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
      exact mem_selectedClass.mpr ⟨(Finset.mem_sdiff.mp hxA).1, hxdist⟩
    have hradiusEq : radius = profile.radius :=
      profile.unique_K4_radius radius hradius
        (hfour.trans (Finset.card_le_card hsub))
    subst radius
    have hclassEq :
        SelectedClass (D.A \ T) S.oppApex2 profile.radius =
          SelectedClass D.A S.oppApex2 profile.radius \ T := by
      ext x
      constructor
      · intro hx
        rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
        exact Finset.mem_sdiff.mpr
          ⟨mem_selectedClass.mpr ⟨(Finset.mem_sdiff.mp hxA).1, hxdist⟩,
            (Finset.mem_sdiff.mp hxA).2⟩
      · intro hx
        rcases Finset.mem_sdiff.mp hx with ⟨hxClass, hxNotT⟩
        rcases mem_selectedClass.mp hxClass with ⟨hxA, hxdist⟩
        exact mem_selectedClass.mpr
          ⟨Finset.mem_sdiff.mpr ⟨hxA, hxNotT⟩, hxdist⟩
    have hsplit := Finset.card_sdiff_add_card_inter
      (SelectedClass D.A S.oppApex2 profile.radius) T
    have hTsub :
        T ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
      intro x hx
      exact (Finset.mem_inter.mp hx).1
    have hinterEq :
        SelectedClass D.A S.oppApex2 profile.radius ∩ T = T :=
      Finset.inter_eq_right.mpr hTsub
    rw [hinterEq, profile.class_card_eq_five] at hsplit
    change 4 ≤
      (SelectedClass (D.A \ T) S.oppApex2 profile.radius).card at hfour
    rw [hclassEq] at hfour
    omega
  rcases Finset.one_lt_card.mp (show 1 < T.card by omega) with
    ⟨s, hsT, t, htT, hst⟩
  have heq : dist S.oppApex2 s = dist S.oppApex2 t := by
    exact (mem_selectedClass.mp (Finset.mem_inter.mp hsT).1).2.trans
      (mem_selectedClass.mp (Finset.mem_inter.mp htT).1).2.symm
  exact ⟨S.oppApex2, hapexRemaining, T, hTne, fun _ hx ↦ hx,
    hblocked, s, hsT, t, htT, hst, heq⟩

/-- At the physical apex, every cardinality-minimal blocking subdeletion of
the physical-radius interior set has exactly two members.  Hence the
shared-radius collision is not an accidental weak witness: it is the exact
minimal-deletion normal form at this center. -/
theorem physicalApex_cardMinimal_blocking_subdeletion_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    {V : Finset ℝ²}
    (hVne : V.Nonempty)
    (hVsub :
      V ⊆ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) S.oppApex2)
    (hminimal :
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4
          (D.A \ (V.erase s)) S.oppApex2) :
    V.card = 2 := by
  classical
  have hVsubClass : V ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
    intro x hx
    exact (Finset.mem_inter.mp (hVsub hx)).1
  have hclassBlocked :
      SelectedClass (D.A \ V) S.oppApex2 profile.radius =
        SelectedClass D.A S.oppApex2 profile.radius \ V := by
    ext x
    constructor
    · intro hx
      rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
      exact Finset.mem_sdiff.mpr
        ⟨mem_selectedClass.mpr ⟨(Finset.mem_sdiff.mp hxA).1, hxdist⟩,
          (Finset.mem_sdiff.mp hxA).2⟩
    · intro hx
      rcases Finset.mem_sdiff.mp hx with ⟨hxClass, hxNotV⟩
      rcases mem_selectedClass.mp hxClass with ⟨hxA, hxdist⟩
      exact mem_selectedClass.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hxA, hxNotV⟩, hxdist⟩
  have hVtwo : 2 ≤ V.card := by
    by_contra hnot
    apply hblocked
    refine ⟨profile.radius, profile.radius_pos, ?_⟩
    change 4 ≤
      (SelectedClass (D.A \ V) S.oppApex2 profile.radius).card
    rw [hclassBlocked, Finset.card_sdiff_of_subset hVsubClass,
      profile.class_card_eq_five]
    omega
  rcases hVne with ⟨s, hsV⟩
  rcases hminimal s hsV with ⟨radius, hradius, hfour⟩
  have hsub :
      SelectedClass (D.A \ (V.erase s)) S.oppApex2 radius ⊆
        SelectedClass D.A S.oppApex2 radius := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
    exact mem_selectedClass.mpr ⟨(Finset.mem_sdiff.mp hxA).1, hxdist⟩
  have hradiusEq : radius = profile.radius :=
    profile.unique_K4_radius radius hradius
      (hfour.trans (Finset.card_le_card hsub))
  subst radius
  have hEraseSubClass :
      V.erase s ⊆ SelectedClass D.A S.oppApex2 profile.radius :=
    (Finset.erase_subset s V).trans hVsubClass
  have hclassRestored :
      SelectedClass (D.A \ (V.erase s)) S.oppApex2 profile.radius =
        SelectedClass D.A S.oppApex2 profile.radius \ (V.erase s) := by
    ext x
    constructor
    · intro hx
      rcases mem_selectedClass.mp hx with ⟨hxA, hxdist⟩
      exact Finset.mem_sdiff.mpr
        ⟨mem_selectedClass.mpr ⟨(Finset.mem_sdiff.mp hxA).1, hxdist⟩,
          (Finset.mem_sdiff.mp hxA).2⟩
    · intro hx
      rcases Finset.mem_sdiff.mp hx with ⟨hxClass, hxNotV⟩
      rcases mem_selectedClass.mp hxClass with ⟨hxA, hxdist⟩
      exact mem_selectedClass.mpr
        ⟨Finset.mem_sdiff.mpr ⟨hxA, hxNotV⟩, hxdist⟩
  change 4 ≤
    (SelectedClass (D.A \ (V.erase s)) S.oppApex2 profile.radius).card at hfour
  rw [hclassRestored, Finset.card_sdiff_of_subset hEraseSubClass,
    profile.class_card_eq_five, Finset.card_erase_of_mem hsV] at hfour
  omega

/-- If a collision center is additionally known to differ from the physical
apex, exact cap-six geometry identifies it as the unique strict-interior point
outside the physical exact-five radius class. -/
theorem nonphysical_collision_forces_three_hits_and_unique_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hcap : S.oppCap2.card = 6)
    {center source partner : ℝ²}
    (hcenterRemaining :
      center ∈ D.A \ (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2))
    (hcenterNe : center ≠ S.oppApex2)
    (hsource : source ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2)
    (hpartner : partner ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2)
    (hsourcePartner : source ≠ partner)
    (hcenterEq : dist center source = dist center partner) :
    let T := SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2
    let I := S.capInteriorByIndex S.oppIndex2
    T.card = 3 ∧ center ∈ I \ T ∧ I = insert center T := by
  classical
  let T := SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
  let I := S.capInteriorByIndex S.oppIndex2
  have hphysicalEq :
      dist S.oppApex2 source = dist S.oppApex2 partner := by
    exact (mem_selectedClass.mp (Finset.mem_inter.mp hsource).1).2.trans
      (mem_selectedClass.mp (Finset.mem_inter.mp hpartner).1).2.symm
  have hcenterI : center ∈ I := by
    apply commonPhysicalPair_center_mem_secondCapInterior
      (Finset.mem_sdiff.mp hcenterRemaining).1 hcenterNe
      (Finset.mem_inter.mp hsource).2
      (Finset.mem_inter.mp hpartner).2
      hsourcePartner hcenterEq hphysicalEq
  have hcenterNotT : center ∉ T := (Finset.mem_sdiff.mp hcenterRemaining).2
  have hTsubI : T ⊆ I := by
    intro x hx
    exact (Finset.mem_inter.mp hx).2
  have hTthree : 3 ≤ T.card := by
    simpa [T] using three_le_capInterior_hits_of_largeCapUniqueFive profile
  have hIcard : I.card = 4 := by
    have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2 S, hcap] at hinterior
    simpa [I] using (show (S.capInteriorByIndex S.oppIndex2).card = 4 by omega)
  have hproper : T ⊂ I := by
    apply (Finset.ssubset_iff_of_subset hTsubI).2
    exact ⟨center, hcenterI, hcenterNotT⟩
  have hTlt : T.card < I.card := Finset.card_lt_card hproper
  have hTcard : T.card = 3 := by omega
  have hcenterDiff : center ∈ I \ T := Finset.mem_sdiff.mpr ⟨hcenterI, hcenterNotT⟩
  have hinsertSub : insert center T ⊆ I := by
    intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hxT
    · exact hcenterI
    · exact hTsubI hxT
  have hinsertCard : (insert center T).card = 4 := by
    rw [Finset.card_insert_of_notMem hcenterNotT, hTcard]
  have hIeq : I = insert center T := by
    symm
    apply Finset.eq_of_subset_of_card_le hinsertSub
    rw [hIcard, hinsertCard]
  exact ⟨hTcard, hcenterDiff, hIeq⟩

#print axioms physicalApex_realizes_physicalInteriorDeletion_collision
#print axioms physicalApex_cardMinimal_blocking_subdeletion_card_eq_two
#print axioms nonphysical_collision_forces_three_hits_and_unique_complement

end ATailExactSixCollisionBoundary
end Problem97
