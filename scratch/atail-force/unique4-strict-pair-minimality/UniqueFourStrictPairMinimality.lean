/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourGlobalDeletionCoupling
import Erdos9796Proof.P97.ATail.CapApexRadiusRigidity
import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Minimal deletion at the exact-four strict pair

This module specializes global cardinal minimality to the two strict-cap points carried by
`OriginalUniqueFourResidual`.  Because the prescribed deletion set has exactly two members,
the cardinal-minimal blocking subset is either a singleton or the whole pair.

On the whole-pair equal-radius arm, the residual's bisector localization places the fresh
center in the same strict cap.  Minimal restoration forces a five-point ambient radius class,
so that center is fully deletion-robust and omitted by every legal critical-shell system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourStrictPairMinimalityScratch

open ATAILStageOneMinimalDeletionCore
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailGlobalMinimalDeletion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourGlobalCouplingScratch

attribute [local instance] Classical.propDecidable

/-- The cardinal-minimal deletion data obtained from the distinguished strict pair. -/
structure StrictPairMinimalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) where
  center : ℝ²
  center_mem_remaining :
    center ∈ D.A \ ({R.interior_q, R.interior_w} : Finset ℝ²)
  deleted : Finset ℝ²
  deleted_nonempty : deleted.Nonempty
  deleted_subset_pair :
    deleted ⊆ ({R.interior_q, R.interior_w} : Finset ℝ²)
  blocked : ¬ HasNEquidistantPointsAt 4 (D.A \ deleted) center
  restores : ∀ s ∈ deleted,
    HasNEquidistantPointsAt 4 (D.A \ (deleted.erase s)) center
  cardinality : deleted.card = 1 ∨
    (deleted.card = 2 ∧
      deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))

private theorem pair_subset_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ({R.interior_q, R.interior_w} : Finset ℝ²) ⊆ D.A := by
  intro x hx
  rcases Finset.mem_insert.mp hx with rfl | hx
  · exact (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1
  · have hxw : x = R.interior_w := Finset.mem_singleton.mp hx
    subst x
    exact (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).1

/-- Global minimality specialized to the two source-faithful strict-cap points. -/
theorem exists_strictPair_minimalDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (StrictPairMinimalDeletion R) := by
  let U : Finset ℝ² := {R.interior_q, R.interior_w}
  have hUsub : U ⊆ D.A := by
    simpa [U] using pair_subset_carrier R
  have hUne : U.Nonempty := ⟨R.interior_q, by simp [U]⟩
  have hUcard : U.card = 2 := by
    simp [U, R.interior_q_ne_w]
  have hremaining : (D.A \ U).Nonempty := by
    apply Finset.card_pos.mp
    have hsplit := Finset.card_sdiff_add_card_inter D.A U
    have hinter : D.A ∩ U = U := Finset.inter_eq_right.mpr hUsub
    have hAcard := R.carrier_card_gt_nine
    rw [hinter, hUcard] at hsplit
    omega
  rcases exists_global_cardMinimal_blocking_subdeletion
      R.minimal hUsub hUne hremaining with
    ⟨center, hcenter, V, hVne, hVsub, hblocked, hrestores⟩
  have hVle : V.card ≤ 2 := by
    calc
      V.card ≤ U.card := Finset.card_le_card hVsub
      _ = 2 := hUcard
  have hVcard : V.card = 1 ∨ V.card = 2 := by
    have hVpos : 0 < V.card := Finset.card_pos.mpr hVne
    omega
  refine ⟨{
    center := center
    center_mem_remaining := by simpa [U] using hcenter
    deleted := V
    deleted_nonempty := hVne
    deleted_subset_pair := by simpa [U] using hVsub
    blocked := hblocked
    restores := hrestores
    cardinality := ?_ }⟩
  rcases hVcard with hVone | hVtwo
  · exact Or.inl hVone
  · right
    refine ⟨hVtwo, ?_⟩
    have hVU : V = U := Finset.eq_of_subset_of_card_le hVsub (by omega)
    simpa [U] using hVU

private theorem center_ne_firstApex_of_deleted_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²)) :
    P.center ≠ S.oppApex1 := by
  intro hcenter
  have hqV : R.interior_q ∈ P.deleted := by simp [hpair]
  have hrestore := P.restores R.interior_q hqV
  have hwClass :
      R.interior_w ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp R.interior_w_mem).1
  apply R.every_class_member_blocks R.interior_w hwClass
  rw [hcenter] at hrestore
  simpa [hpair, R.interior_q_ne_w, Finset.sdiff_singleton_eq_erase] using hrestore

private theorem minimalDeletionCore_of_no_collision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hno : ¬ ∃ s ∈ P.deleted, ∃ t ∈ P.deleted,
      s ≠ t ∧ dist P.center s = dist P.center t) :
    Nonempty (MinimalDeletionCore D.A P.deleted P.center) := by
  apply exists_minimalDeletionCore
    (P.deleted_subset_pair.trans (pair_subset_carrier R))
    (Finset.mem_sdiff.mp P.center_mem_remaining).1
  · intro s hs t ht hst hdist
    exact hno ⟨s, hs, t, ht, hst, hdist⟩
  · exact P.blocked
  · exact P.restores

/-- A singleton minimal deletion already carries its exact critical shell at the fresh
center. -/
theorem minimalDeletionCore_of_singleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R) (hone : P.deleted.card = 1) :
    Nonempty (MinimalDeletionCore D.A P.deleted P.center) := by
  apply minimalDeletionCore_of_no_collision P
  rintro ⟨s, hs, t, ht, hst, _hdist⟩
  rcases Finset.card_eq_one.mp hone with ⟨u, hVeq⟩
  rw [hVeq] at hs ht
  simp only [Finset.mem_singleton] at hs ht
  exact hst (hs.trans ht.symm)

/-- The singleton is one of the two named strict points, not an anonymous source. -/
theorem singleton_eq_left_or_right
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R) (hone : P.deleted.card = 1) :
    P.deleted = {R.interior_q} ∨ P.deleted = {R.interior_w} := by
  rcases Finset.card_eq_one.mp hone with ⟨source, hsource⟩
  have hsourceMem : source ∈ P.deleted := by simp [hsource]
  have hsourcePair := P.deleted_subset_pair hsourceMem
  rw [Finset.mem_insert, Finset.mem_singleton] at hsourcePair
  rcases hsourcePair with rfl | rfl
  · exact Or.inl hsource
  · exact Or.inr hsource

/-- A distinct-radius whole-pair deletion carries two support-disjoint exact shells at
the fresh center. -/
theorem minimalDeletionCore_of_pair_dist_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q ≠ dist P.center R.interior_w) :
    Nonempty (MinimalDeletionCore D.A P.deleted P.center) := by
  apply minimalDeletionCore_of_no_collision P
  rintro ⟨s, hs, t, ht, hst, hEq⟩
  have hsPair : s = R.interior_q ∨ s = R.interior_w := by
    simpa [hpair] using hs
  have htPair : t = R.interior_q ∨ t = R.interior_w := by
    simpa [hpair] using ht
  rcases hsPair with rfl | rfl <;> rcases htPair with rfl | rfl
  · exact hst rfl
  · exact hdist hEq
  · exact hdist hEq.symm
  · exact hst rfl

private theorem fullyDeletionRobustAt_of_pair_minimalDeletionCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (K : MinimalDeletionCore D.A P.deleted P.center) :
    FullyDeletionRobustAt D P.center := by
  have hqV : R.interior_q ∈ P.deleted := by simp [hpair]
  have hwV : R.interior_w ∈ P.deleted := by simp [hpair]
  let q : {x : ℝ² // x ∈ P.deleted} := ⟨R.interior_q, hqV⟩
  let w : {x : ℝ² // x ∈ P.deleted} := ⟨R.interior_w, hwV⟩
  have hqw : q ≠ w := by
    intro h
    exact R.interior_q_ne_w (congrArg Subtype.val h)
  exact fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    (K.shellAt q).toSelectedFourClass (K.shellAt w).toSelectedFourClass
    (by simpa using K.supports_pairwise_disjoint q w hqw)

/-- The equal-radius whole-pair arm has a fully source-faithful geometric normal form.

The fresh center is a third strict point of the first opposite cap, its radius class
contains at least five ambient points, and it is omitted by every legal critical-shell
system.  In particular the first opposite cap itself has at least five points. -/
theorem equalRadius_pair_collision_normalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q = dist P.center R.interior_w) :
    P.center ∈ S.capInteriorByIndex S.oppIndex1 ∧
      0 < dist P.center R.interior_q ∧
      R.interior_q ∈ SelectedClass D.A P.center (dist P.center R.interior_q) ∧
      R.interior_w ∈ SelectedClass D.A P.center (dist P.center R.interior_q) ∧
      5 ≤ (SelectedClass D.A P.center (dist P.center R.interior_q)).card ∧
      5 ≤ (S.capByIndex S.oppIndex1).card ∧
      FullyDeletionRobustAt D P.center ∧
      (∀ (H' : CriticalShellSystem D.A) (source : ℝ²)
        (hsource : source ∈ D.A), H'.centerAt source hsource ≠ P.center) := by
  have hcenterA : P.center ∈ D.A :=
    (Finset.mem_sdiff.mp P.center_mem_remaining).1
  have hcenterNeQ : P.center ≠ R.interior_q := by
    intro h
    exact (Finset.mem_sdiff.mp P.center_mem_remaining).2 (h ▸ by simp)
  have hcenterNeW : P.center ≠ R.interior_w := by
    intro h
    exact (Finset.mem_sdiff.mp P.center_mem_remaining).2 (h ▸ by simp)
  have hcenterNeApex := center_ne_firstApex_of_deleted_eq_pair P hpair
  have hcenterInterior :
      P.center ∈ S.capInteriorByIndex S.oppIndex1 :=
    R.bisector_center_mem_interior P.center hcenterA hcenterNeApex hdist
  have hqA := (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1
  have hwA := (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).1
  have hqV : R.interior_q ∈ P.deleted := by simp [hpair]
  have hwV : R.interior_w ∈ P.deleted := by simp [hpair]
  have hfive :
      5 ≤ (SelectedClass D.A P.center (dist P.center R.interior_q)).card :=
    five_le_selectedClass_of_minimalDeletion_collision
      (P.deleted_subset_pair.trans (pair_subset_carrier R))
      hqV hwV R.interior_q_ne_w hdist
      (P.restores R.interior_q hqV) P.blocked
  have hradius : 0 < dist P.center R.interior_q := dist_pos.mpr hcenterNeQ
  have hrobust : FullyDeletionRobustAt D P.center :=
    fullyDeletionRobustAt_of_five_le_selectedClass hradius hfive
  have hthreeSub :
      ({P.center, R.interior_q, R.interior_w} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact hcenterInterior
    · exact (Finset.mem_inter.mp R.interior_q_mem).2
    · exact (Finset.mem_inter.mp R.interior_w_mem).2
  have hthreeCard :
      ({P.center, R.interior_q, R.interior_w} : Finset ℝ²).card = 3 := by
    simp [hcenterNeQ, hcenterNeW, R.interior_q_ne_w]
  have hinteriorThree : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hle := Finset.card_le_card hthreeSub
    simpa [hthreeCard] using hle
  have hcap := capInteriorByIndex_card_add_two S S.oppIndex1
  refine ⟨hcenterInterior, hradius,
    mem_selectedClass.mpr ⟨hqA, rfl⟩,
    mem_selectedClass.mpr ⟨hwA, hdist.symm⟩,
    hfive, by omega, hrobust, ?_⟩
  intro H' source hsource
  exact hrobust.centerAt_ne H' source hsource

/-- If an independent argument makes the first opposite cap exact four, the equal-radius
whole-pair arm is impossible: its fresh bisector center would be a third point in the
two-point strict cap interior. -/
theorem false_of_equalRadius_pair_of_firstOppCap_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : StrictPairMinimalDeletion R)
    (hpair : P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²))
    (hdist : dist P.center R.interior_q = dist P.center R.interior_w)
    (hcap : (S.capByIndex S.oppIndex1).card = 4) : False := by
  have hnormal := equalRadius_pair_collision_normalForm P hpair hdist
  omega

/-- Exhaustive source-faithful split for minimality at the distinguished strict pair.

The singleton and distinct-radius arms carry exact minimal-deletion shells.  The
equal-radius arm carries the complete geometric strengthening above. -/
theorem exists_strictPair_singleton_or_equalRadius_or_distinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ∃ P : StrictPairMinimalDeletion R,
      (P.deleted.card = 1 ∧
        (P.deleted = {R.interior_q} ∨ P.deleted = {R.interior_w}) ∧
        Nonempty (MinimalDeletionCore D.A P.deleted P.center)) ∨
      (P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²) ∧
        dist P.center R.interior_q = dist P.center R.interior_w ∧
        P.center ∈ S.capInteriorByIndex S.oppIndex1 ∧
        5 ≤ (SelectedClass D.A P.center (dist P.center R.interior_q)).card ∧
        5 ≤ (S.capByIndex S.oppIndex1).card ∧
        FullyDeletionRobustAt D P.center) ∨
      (P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²) ∧
        dist P.center R.interior_q ≠ dist P.center R.interior_w ∧
        Nonempty (MinimalDeletionCore D.A P.deleted P.center) ∧
        FullyDeletionRobustAt D P.center) := by
  rcases exists_strictPair_minimalDeletion R with ⟨P⟩
  refine ⟨P, ?_⟩
  rcases P.cardinality with hone | ⟨_htwo, hpair⟩
  · exact Or.inl
      ⟨hone, singleton_eq_left_or_right P hone,
        minimalDeletionCore_of_singleton P hone⟩
  · by_cases hdist :
      dist P.center R.interior_q = dist P.center R.interior_w
    · rcases equalRadius_pair_collision_normalForm P hpair hdist with
        ⟨hcenterInterior, _hradius, _hqClass, _hwClass, hfive,
          hcap, hrobust, _homitted⟩
      exact Or.inr (Or.inl
        ⟨hpair, hdist, hcenterInterior, hfive, hcap, hrobust⟩)
    · have hcore := minimalDeletionCore_of_pair_dist_ne P hpair hdist
      rcases hcore with ⟨K⟩
      exact Or.inr (Or.inr
        ⟨hpair, hdist, ⟨K⟩,
          fullyDeletionRobustAt_of_pair_minimalDeletionCore P hpair K⟩)

/-- With a genuinely exact four-point first opposite cap, the only surviving pair-minimality
outputs are a named singleton shell or a distinct-radius two-shell core.  This theorem is
conditional because `OriginalUniqueFourResidual` fixes the radius-class cardinality, not the
physical cap cardinality. -/
theorem exists_strictPair_singleton_or_distinctRadius_of_firstOppCap_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcap : (S.capByIndex S.oppIndex1).card = 4) :
    ∃ P : StrictPairMinimalDeletion R,
      (P.deleted.card = 1 ∧
        (P.deleted = {R.interior_q} ∨ P.deleted = {R.interior_w}) ∧
        Nonempty (MinimalDeletionCore D.A P.deleted P.center)) ∨
      (P.deleted = ({R.interior_q, R.interior_w} : Finset ℝ²) ∧
        dist P.center R.interior_q ≠ dist P.center R.interior_w ∧
        Nonempty (MinimalDeletionCore D.A P.deleted P.center) ∧
        FullyDeletionRobustAt D P.center) := by
  rcases exists_strictPair_singleton_or_equalRadius_or_distinctRadius R with
    ⟨P, hsingleton | hequal | hdistinct⟩
  · exact ⟨P, Or.inl hsingleton⟩
  · exact False.elim
      (false_of_equalRadius_pair_of_firstOppCap_card_eq_four
        P hequal.1 hequal.2.1 hcap)
  · exact ⟨P, Or.inr hdistinct⟩

end ATailUniqueFourStrictPairMinimalityScratch
end Problem97

#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.exists_strictPair_minimalDeletion
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.minimalDeletionCore_of_singleton
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.singleton_eq_left_or_right
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.minimalDeletionCore_of_pair_dist_ne
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.equalRadius_pair_collision_normalForm
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.false_of_equalRadius_pair_of_firstOppCap_card_eq_four
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.exists_strictPair_singleton_or_equalRadius_or_distinctRadius
#print axioms Problem97.ATailUniqueFourStrictPairMinimalityScratch.exists_strictPair_singleton_or_distinctRadius_of_firstOppCap_card_eq_four
