/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress

/-!
# Source audit for a second blocker collision

The robust first apex is omitted by the finite blocker endomap, so one
nontrivial blocker fiber exists.  This file records the exact finite-map
boundary after choosing that first collision: either another blocker center
has a nontrivial fiber, the first fiber has a third source, or every other
carrier vertex (in particular the physical second apex) is hit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSecondCollisionSourceAudit

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress

attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- Repairing the unique double fiber by sending one of its sources to the
omitted value produces an injective finite endomap.  Hence the original map
hits every value other than the omitted one. -/
theorem exists_preimage_of_unique_collision_and_omission
    {alpha : Type*} [Finite alpha] [DecidableEq alpha]
    (f : alpha → alpha) {omitted source₁ source₂ target : alpha}
    (homitted : ∀ source, f source ≠ omitted)
    (hunique :
      ∀ a b, f a = f b →
        a = b ∨
          (a = source₁ ∧ b = source₂) ∨
          (a = source₂ ∧ b = source₁))
    (htarget : target ≠ omitted) :
    ∃ source, f source = target := by
  let repaired : alpha → alpha := fun source ↦
    if source = source₂ then omitted else f source
  have hrepairedInjective : Function.Injective repaired := by
    intro a b hab
    by_cases ha : a = source₂
    · subst a
      by_cases hb : b = source₂
      · exact hb.symm
      · have homitEq : omitted = f b := by
          simpa [repaired, hb] using hab
        exact False.elim ((homitted b) homitEq.symm)
    · by_cases hb : b = source₂
      · subst b
        have homitEq : f a = omitted := by
          simpa [repaired, ha] using hab
        exact False.elim ((homitted a) homitEq)
      · have hf : f a = f b := by
          simpa [repaired, ha, hb] using hab
        rcases hunique a b hf with hab' | hab' | hab'
        · exact hab'
        · exact False.elim (hb hab'.2)
        · exact False.elim (ha hab'.1)
  have hrepairedSurjective : Function.Surjective repaired :=
    Finite.injective_iff_surjective.mp hrepairedInjective
  rcases hrepairedSurjective target with ⟨source, hsource⟩
  by_cases hs : source = source₂
  · subst source
    have : omitted = target := by
      simpa [repaired] using hsource
    exact False.elim (htarget this.symm)
  · exact ⟨source, by simpa [repaired, hs] using hsource⟩

/-- Exact finite-map trichotomy after choosing one collision at an omitted
value.  The first alternative is a second nontrivial blocker fiber, the
second is a third source in the chosen fiber, and the last says that the
specified non-omitted target is itself in the image. -/
theorem second_fiber_or_larger_first_fiber_or_target_in_image
    {alpha : Type*} [Finite alpha] [DecidableEq alpha]
    (f : alpha → alpha) {omitted source₁ source₂ target : alpha}
    (homitted : ∀ source, f source ≠ omitted)
    (htarget : target ≠ omitted) :
    (∃ a b, a ≠ b ∧ f a = f b ∧ f a ≠ f source₁) ∨
      (∃ source, source ≠ source₁ ∧ source ≠ source₂ ∧
        f source = f source₁) ∨
      ∃ source, f source = target := by
  by_cases hsecond :
      ∃ a b, a ≠ b ∧ f a = f b ∧ f a ≠ f source₁
  · exact Or.inl hsecond
  · by_cases hlarger :
        ∃ source, source ≠ source₁ ∧ source ≠ source₂ ∧
          f source = f source₁
    · exact Or.inr (Or.inl hlarger)
    · right
      right
      apply exists_preimage_of_unique_collision_and_omission
        (f := f) (omitted := omitted) (source₁ := source₁)
        (source₂ := source₂) (target := target) homitted _ htarget
      intro a b hab
      by_cases heq : a = b
      · exact Or.inl heq
      have hcenter : f a = f source₁ := by
        by_contra hne
        exact hsecond ⟨a, b, heq, hab, hne⟩
      have ha : a = source₁ ∨ a = source₂ := by
        by_cases ha₁ : a = source₁
        · exact Or.inl ha₁
        · by_cases ha₂ : a = source₂
          · exact Or.inr ha₂
          · exact False.elim (hlarger ⟨a, ha₁, ha₂, hcenter⟩)
      have hbcenter : f b = f source₁ := by
        calc
          f b = f a := hab.symm
          _ = f source₁ := hcenter
      have hb : b = source₁ ∨ b = source₂ := by
        by_cases hb₁ : b = source₁
        · exact Or.inl hb₁
        · by_cases hb₂ : b = source₂
          · exact Or.inr hb₂
          · exact False.elim (hlarger ⟨b, hb₁, hb₂, hbcenter⟩)
      rcases ha with ha₁ | ha₂
      · rcases hb with hb₁ | hb₂
        · exact Or.inl (ha₁.trans hb₁.symm)
        · exact Or.inr (Or.inl ⟨ha₁, hb₂⟩)
      · rcases hb with hb₁ | hb₂
        · exact Or.inr (Or.inr ⟨ha₂, hb₁⟩)
        · exact Or.inl (ha₂.trans hb₂.symm)

/-- Live parent specialization.  The `O,A,X`-style second collision is only
one arm: otherwise the `A` fiber has a third source, or the physical second
apex is the actual blocker of some source. -/
theorem FrontierCommonDeletionParentResidual.collision_or_largerFiber_or_secondApexImage
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    ∃ source₁ source₂ : CriticalShellSystem.CarrierVertex D.A,
      source₁ ≠ source₂ ∧
      H.blockerVertex source₁ = H.blockerVertex source₂ ∧
      ((∃ a b : CriticalShellSystem.CarrierVertex D.A,
          a ≠ b ∧
          H.blockerVertex a = H.blockerVertex b ∧
          H.blockerVertex a ≠ H.blockerVertex source₁) ∨
        (∃ source : CriticalShellSystem.CarrierVertex D.A,
          source ≠ source₁ ∧ source ≠ source₂ ∧
          H.blockerVertex source = H.blockerVertex source₁) ∨
        ∃ source : CriticalShellSystem.CarrierVertex D.A,
          H.blockerVertex source =
            ⟨S.oppApex2, R.common.packet.center₂_mem_A⟩) := by
  let firstApexVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, R.common.packet.center₁_mem_A⟩
  let secondApexVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex2, R.common.packet.center₂_mem_A⟩
  rcases FullyDeletionRobustAt.exists_distinct_sources_same_blocker
      R.firstApexFullyDeletionRobust H
        R.common.packet.center₁_mem_A with
    ⟨source₁, source₂, hsources, hcollision⟩
  refine ⟨source₁, source₂, hsources, hcollision, ?_⟩
  have homitted : ∀ source, H.blockerVertex source ≠ firstApexVertex := by
    intro source
    exact R.firstApexFullyDeletionRobust.blockerVertex_ne H source
      R.common.packet.center₁_mem_A
  have hapices : secondApexVertex ≠ firstApexVertex := by
    intro h
    have hvalue : S.oppApex2 = S.oppApex1 := congrArg Subtype.val h
    exact R.common.packet.centers_ne hvalue.symm
  exact second_fiber_or_larger_first_fiber_or_target_in_image
    H.blockerVertex homitted hapices

/-- The honest row prefix exported by the full parent after choosing the
forced blocker collision.  The collision row contains both sources, while an
arbitrary selected row at the robust apex is retained with no claimed
incidence to either source. -/
structure ParentCollisionAndRobustRowPrefix
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A) : Type where
  sourceC : CriticalShellSystem.CarrierVertex D.A
  sourceK : CriticalShellSystem.CarrierVertex D.A
  sources_ne : sourceC ≠ sourceK
  blockers_eq : H.blockerVertex sourceC = H.blockerVertex sourceK
  robustRow : SelectedFourClass D.A S.oppApex1
  c_mem_collisionRow :
    sourceC.1 ∈
      (H.selectedAt sourceC.1 sourceC.2).toCriticalFourShell.support
  k_mem_collisionRow :
    sourceK.1 ∈
      (H.selectedAt sourceC.1 sourceC.2).toCriticalFourShell.support

/-- The parent supplies the collision `A`-row and some ambient `O`-row, but
does not identify either collision source with a member of the `O`-row. -/
theorem FrontierCommonDeletionParentResidual.nonempty_collisionAndRobustRowPrefix
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (ParentCollisionAndRobustRowPrefix (S := S) H) := by
  rcases FullyDeletionRobustAt.exists_distinct_sources_same_blocker
      R.firstApexFullyDeletionRobust H
        R.common.packet.center₁_mem_A with
    ⟨sourceC, sourceK, hsources, hblockers⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4
      R.common.packet.center₁_mem_A with ⟨robustRow⟩
  have hcenters :
      H.centerAt sourceC.1 sourceC.2 =
        H.centerAt sourceK.1 sourceK.2 :=
    congrArg Subtype.val hblockers
  let transportedK :
      SelectedFourClass D.A (H.centerAt sourceC.1 sourceC.2) :=
    transportSelectedFourClass
      (H.selectedAt sourceK.1 sourceK.2).toSelectedFourClass
      hcenters.symm
  have hsupports :
      (H.selectedAt sourceC.1 sourceC.2).toCriticalFourShell.support =
        (H.selectedAt sourceK.1 sourceK.2).toCriticalFourShell.support := by
    calc
      (H.selectedAt sourceC.1 sourceC.2).toCriticalFourShell.support =
          transportedK.support :=
        (H.selectedFourClass_support_eq_shell
          sourceC.1 sourceC.2 transportedK).symm
      _ = (H.selectedAt sourceK.1 sourceK.2).toCriticalFourShell.support := by
        simp [transportedK, CriticalSelectedFourClass.toSelectedFourClass,
          CriticalFourShell.toSelectedFourClass]
  exact ⟨{
    sourceC := sourceC
    sourceK := sourceK
    sources_ne := hsources
    blockers_eq := hblockers
    robustRow := robustRow
    c_mem_collisionRow :=
      (H.selectedAt sourceC.1 sourceC.2).toCriticalFourShell.q_mem_support
    k_mem_collisionRow := by
      rw [hsupports]
      exact (H.selectedAt sourceK.1 sourceK.2).toCriticalFourShell.q_mem_support }⟩

/-- If the displayed collision is the unique double fiber, the blocker map is
almost surjective.  One can therefore choose a faithful carrier pattern whose
row at every center other than the robust apex is an actual row of `H`; only
the robust-apex row must be chosen from ambient K4. -/
theorem FrontierCommonDeletionParentResidual.exists_criticalRowsOffFirstApexPattern
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hunique :
      ∀ a b, H.blockerVertex a = H.blockerVertex b →
        a = b ∨
          (a = source₁ ∧ b = source₂) ∨
          (a = source₂ ∧ b = source₁)) :
    ∃ P : FaithfulCarrierPattern D.A,
      ∀ center : ℝ², ∀ hcenter : center ∈ D.A,
        center ≠ S.oppApex1 →
          ∃ source : CriticalShellSystem.CarrierVertex D.A,
            H.blockerVertex source = ⟨center, hcenter⟩ ∧
            (P.classAt center hcenter).support =
              (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  classical
  let firstApexVertex : CriticalShellSystem.CarrierVertex D.A :=
    ⟨S.oppApex1, R.common.packet.center₁_mem_A⟩
  have homitted : ∀ source, H.blockerVertex source ≠ firstApexVertex := by
    intro source
    exact R.firstApexFullyDeletionRobust.blockerVertex_ne H source
      R.common.packet.center₁_mem_A
  have hpreimage :
      ∀ center : ℝ², ∀ hcenter : center ∈ D.A,
        center ≠ S.oppApex1 →
          ∃ source, H.blockerVertex source =
            (⟨center, hcenter⟩ : CriticalShellSystem.CarrierVertex D.A) := by
    intro center hcenter hcenterNe
    apply exists_preimage_of_unique_collision_and_omission
      (f := H.blockerVertex) (omitted := firstApexVertex)
      (source₁ := source₁) (source₂ := source₂)
      (target := ⟨center, hcenter⟩) homitted hunique
    intro h
    exact hcenterNe (congrArg Subtype.val h)
  let sourceAt :
      ∀ center : ℝ², ∀ hcenter : center ∈ D.A,
        center ≠ S.oppApex1 → CriticalShellSystem.CarrierVertex D.A :=
    fun center hcenter hcenterNe ↦
      Classical.choose (hpreimage center hcenter hcenterNe)
  have hsourceAt :
      ∀ center : ℝ², ∀ hcenter : center ∈ D.A,
        ∀ hcenterNe : center ≠ S.oppApex1,
          H.blockerVertex (sourceAt center hcenter hcenterNe) =
            (⟨center, hcenter⟩ : CriticalShellSystem.CarrierVertex D.A) := by
    intro center hcenter hcenterNe
    exact Classical.choose_spec (hpreimage center hcenter hcenterNe)
  rcases exists_selectedFourClass_of_globalK4 D.K4
      R.common.packet.center₁_mem_A with ⟨robustRow⟩
  let classAt :
      ∀ center : ℝ², center ∈ D.A → SelectedFourClass D.A center :=
    fun center hcenter ↦
      if hcenterEq : center = S.oppApex1 then
        transportSelectedFourClass robustRow hcenterEq.symm
      else
        transportSelectedFourClass
          (H.selectedAt
            (sourceAt center hcenter hcenterEq).1
            (sourceAt center hcenter hcenterEq).2).toSelectedFourClass
          (congrArg Subtype.val (hsourceAt center hcenter hcenterEq))
  have hrowNonempty :
      (classAt S.oppApex1 R.common.packet.center₁_mem_A).support.Nonempty :=
    (classAt S.oppApex1 R.common.packet.center₁_mem_A).support_nonempty
  rcases hrowNonempty with ⟨gaugeWitness, hgaugeWitness⟩
  let P : FaithfulCarrierPattern D.A :=
    { gaugeCenter := S.oppApex1
      gaugeCenter_mem := R.common.packet.center₁_mem_A
      classAt := classAt
      gaugeWitness := gaugeWitness
      gaugeWitness_mem := hgaugeWitness }
  refine ⟨P, ?_⟩
  intro center hcenter hcenterNe
  let source := sourceAt center hcenter hcenterNe
  refine ⟨source, hsourceAt center hcenter hcenterNe, ?_⟩
  simp [P, classAt, hcenterNe, source,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass]

/-- Directed edge relation of the almost-critical faithful pattern. -/
def SelectedWitnessEdge {A : Finset ℝ²} (P : FaithfulCarrierPattern A)
    (center target : ℝ²) : Prop :=
  ∃ hcenter : center ∈ A, target ∈ (P.classAt center hcenter).support

/-- Minimality makes every faithful selected-row pattern strongly connected,
including the pattern built from actual critical rows away from the robust
apex. -/
theorem selectedWitnessEdge_reflTransGen
    {D : CounterexampleData} (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A) {source target : ℝ²}
    (hsource : source ∈ D.A) (htarget : target ∈ D.A) :
    Relation.ReflTransGen (SelectedWitnessEdge P) source target := by
  classical
  let reachable : Finset ℝ² :=
    D.A.filter fun z ↦ Relation.ReflTransGen (SelectedWitnessEdge P) source z
  have hreachableNonempty : reachable.Nonempty := by
    refine ⟨source, Finset.mem_filter.mpr ⟨hsource, ?_⟩⟩
    exact Relation.ReflTransGen.refl
  have hreachableSubset : reachable ⊆ D.A := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  have hreachableClosed :
      ∀ center : ℝ², ∀ hcenter : center ∈ reachable,
        (P.classAt center (hreachableSubset hcenter)).support ⊆ reachable := by
    intro center hcenter z hz
    have hpath : Relation.ReflTransGen (SelectedWitnessEdge P) source center :=
      (Finset.mem_filter.mp hcenter).2
    have hedge : SelectedWitnessEdge P center z :=
      ⟨hreachableSubset hcenter, hz⟩
    exact Finset.mem_filter.mpr
      ⟨(P.classAt center (hreachableSubset hcenter)).support_subset_A hz,
        hpath.tail hedge⟩
  have hreachableEq : reachable = D.A :=
    P.eq_carrier_of_nonempty_closed hmin hreachableNonempty
      hreachableSubset hreachableClosed
  have htargetReachable : target ∈ reachable := by
    rw [hreachableEq]
    exact htarget
  exact (Finset.mem_filter.mp htargetReachable).2

/-- Almost-surjective critical-row form together with its exact strong
connectivity consequence.  Strong connectivity supplies a path, not a single
row through two prescribed points. -/
theorem FrontierCommonDeletionParentResidual.exists_stronglyConnectedCriticalPattern
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (source₁ source₂ : CriticalShellSystem.CarrierVertex D.A)
    (hunique :
      ∀ a b, H.blockerVertex a = H.blockerVertex b →
        a = b ∨
          (a = source₁ ∧ b = source₂) ∨
          (a = source₂ ∧ b = source₁)) :
    ∃ P : FaithfulCarrierPattern D.A,
      (∀ center : ℝ², ∀ hcenter : center ∈ D.A,
        center ≠ S.oppApex1 →
          ∃ source : CriticalShellSystem.CarrierVertex D.A,
            H.blockerVertex source = ⟨center, hcenter⟩ ∧
            (P.classAt center hcenter).support =
              (H.selectedAt source.1 source.2).toCriticalFourShell.support) ∧
      ∀ source target : ℝ², source ∈ D.A → target ∈ D.A →
        Relation.ReflTransGen (SelectedWitnessEdge P) source target := by
  rcases FrontierCommonDeletionParentResidual.exists_criticalRowsOffFirstApexPattern
      R source₁ source₂ hunique with ⟨P, hcriticalRows⟩
  exact ⟨P, hcriticalRows, fun _ _ hsource htarget ↦
    selectedWitnessEdge_reflTransGen R.minimal P hsource htarget⟩

#print axioms exists_preimage_of_unique_collision_and_omission
#print axioms second_fiber_or_larger_first_fiber_or_target_in_image
#print axioms FrontierCommonDeletionParentResidual.collision_or_largerFiber_or_secondApexImage
#print axioms FrontierCommonDeletionParentResidual.nonempty_collisionAndRobustRowPrefix
#print axioms FrontierCommonDeletionParentResidual.exists_criticalRowsOffFirstApexPattern
#print axioms selectedWitnessEdge_reflTransGen
#print axioms FrontierCommonDeletionParentResidual.exists_stronglyConnectedCriticalPattern

end ATailSecondCollisionSourceAudit
end Problem97
