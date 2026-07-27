import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Rigid exact-four minimal-core normalization

Direct checked work on the nonphysical, pairwise-distinct-radius
minimal-deletion-core leaf.  This file imports only the production boundary.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

attribute [local instance] Classical.propDecidable

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

/-- Exhaustive direct normalization of the contextual minimal-core leaf.

The global core has an exact cardinality in `1..5`.  Every core shell contains
exactly one deleted point, namely its indexing source.  Since the global
center is nonphysical, two-circle geometry says that the shell meets the
five-point physical class in either exactly that source or exactly that source
and one partner.  In the first case three shell points lie outside the
physical class; in the second case exactly two do.

The final two disjunctions record strict narrowing measures:

* physical intersection size `1` for some core source, versus size `2` for
  every core source;
* the contextual source survives the core deletion, versus it indexes a core
  shell whose physical intersection has exact size `1` or `2`.
-/
theorem exactFourRigid221_minimalCore_normalization
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A globalDeletion.deleted globalDeletion.center) :
    let C := SelectedClass D.A S.oppApex2 rho
    let U := globalDeletion.deleted
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    let Iu := Ku ∩ C
    let Iv := Kv ∩ C
    let J := S.capInteriorByIndex S.oppIndex2
    let K := fun s : {x : ℝ² // x ∈ U} =>
      (core.shellAt s).toCriticalFourShell.support
    U ⊆ C ∧
      globalDeletion.center ∈ D.A \ C ∧
      source.1 ∈ C ∧
      source.1 ∈ J ∧
      source.1 ∈ Ku ∧
      source.1 ∈ Iu ∧
      source.1 ≠ jointDeletion.deleted.1 ∧
      source.1 ∉ Iv ∧
      (∀ s : {x : ℝ² // x ∈ U},
        s.1 = jointDeletion.deleted.1 ∨ s.1 ∈ Iu ∨ s.1 ∈ Iv) ∧
      (U.card = 1 ∨ U.card = 2 ∨ U.card = 3 ∨
        U.card = 4 ∨ U.card = 5) ∧
      (∀ s : {x : ℝ² // x ∈ U}, K s ∩ U = {s.1}) ∧
      ((∃ s : {x : ℝ² // x ∈ U},
          K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
        (∀ s : {x : ℝ² // x ∈ U},
          ∃ t ∈ C, t ≠ s.1 ∧
            K s ∩ C = {s.1, t} ∧
            (K s \ C).card = 2)) ∧
      (source.1 ∉ U ∨
        ∃ s : {x : ℝ² // x ∈ U}, s.1 = source.1 ∧
          ((K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
            (∃ t ∈ C, t ≠ s.1 ∧
              K s ∩ C = {s.1, t} ∧
              (K s \ C).card = 2))) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let U := globalDeletion.deleted
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.support
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.support
  let Iu := Ku ∩ C
  let Iv := Kv ∩ C
  let J := S.capInteriorByIndex S.oppIndex2
  let K := fun s : {x : ℝ² // x ∈ U} =>
    (core.shellAt s).toCriticalFourShell.support
  change
    U ⊆ C ∧
      globalDeletion.center ∈ D.A \ C ∧
      source.1 ∈ C ∧
      source.1 ∈ J ∧
      source.1 ∈ Ku ∧
      source.1 ∈ Iu ∧
      source.1 ≠ jointDeletion.deleted.1 ∧
      source.1 ∉ Iv ∧
      (∀ s : {x : ℝ² // x ∈ U},
        s.1 = jointDeletion.deleted.1 ∨ s.1 ∈ Iu ∨ s.1 ∈ Iv) ∧
      (U.card = 1 ∨ U.card = 2 ∨ U.card = 3 ∨
        U.card = 4 ∨ U.card = 5) ∧
      (∀ s : {x : ℝ² // x ∈ U}, K s ∩ U = {s.1}) ∧
      ((∃ s : {x : ℝ² // x ∈ U},
          K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
        (∀ s : {x : ℝ² // x ∈ U},
          ∃ t ∈ C, t ≠ s.1 ∧
            K s ∩ C = {s.1, t} ∧
            (K s \ C).card = 2)) ∧
      (source.1 ∉ U ∨
        ∃ s : {x : ℝ² // x ∈ U}, s.1 = source.1 ∧
          ((K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
            (∃ t ∈ C, t ≠ s.1 ∧
              K s ∩ C = {s.1, t} ∧
              (K s \ C).card = 2)))
  have hUsubC : U ⊆ C := by
    intro z hz
    simpa [U, C] using globalDeletion.deleted_subset_class hz
  have hcenterRemaining : globalDeletion.center ∈ D.A \ C := by
    simpa [C] using globalDeletion.center_mem_remaining
  have hsourceC : source.1 ∈ C := by
    simpa [C] using context.source_mem_class
  have hsourceJ : source.1 ∈ J := by
    simpa [J] using context.source_mem_interior
  have hsourceKu : source.1 ∈ Ku := by
    simpa [Ku] using context.source_mem_u_row
  have hsourceIu : source.1 ∈ Iu :=
    Finset.mem_inter.mpr ⟨hsourceKu, hsourceC⟩
  have hrigid :
      Iu.card = 2 ∧ Iv.card = 2 ∧ Disjoint Iu Iv ∧
        C = insert jointDeletion.deleted.1 (Iu ∪ Iv) := by
    simpa [C, Ku, Kv, Iu, Iv] using globalDeletion.rigid
  have hsourceNeDeleted :
      source.1 ≠ jointDeletion.deleted.1 := by
    intro heq
    apply jointDeletion.deleted_not_mem_uRow
    simpa [Ku, heq] using hsourceKu
  have hsourceNotIv : source.1 ∉ Iv := by
    intro hsourceIv
    exact Finset.disjoint_left.mp hrigid.2.2.1
      hsourceIu hsourceIv
  have hcorePlacement :
      ∀ s : {x : ℝ² // x ∈ U},
        s.1 = jointDeletion.deleted.1 ∨ s.1 ∈ Iu ∨ s.1 ∈ Iv := by
    intro s
    have hsC : s.1 ∈ C := hUsubC s.2
    rw [hrigid.2.2.2] at hsC
    rcases Finset.mem_insert.mp hsC with hdeleted | hrows
    · exact Or.inl hdeleted
    · rcases Finset.mem_union.mp hrows with huRow | hvRow
      · exact Or.inr (Or.inl huRow)
      · exact Or.inr (Or.inr hvRow)
  have hUcardCases :
      U.card = 1 ∨ U.card = 2 ∨ U.card = 3 ∨
        U.card = 4 ∨ U.card = 5 := by
    have hpos : 0 < U.card := by
      exact Finset.card_pos.mpr (by
        simpa [U] using globalDeletion.deleted_nonempty)
    have hle : U.card ≤ 5 := by
      simpa [U] using globalDeletion.deleted_card_le_five
    omega
  have hKinterU :
      ∀ s : {x : ℝ² // x ∈ U}, K s ∩ U = {s.1} := by
    intro s
    apply Finset.Subset.antisymm
    · intro z hz
      rcases Finset.mem_inter.mp hz with ⟨hzK, hzU⟩
      have hzEq : z = s.1 := by
        by_contra hne
        let t : {x : ℝ² // x ∈ U} := ⟨z, hzU⟩
        have hst : s ≠ t := by
          intro heq
          exact hne (congrArg Subtype.val heq).symm
        have hdisjoint := core.supports_pairwise_disjoint s t hst
        exact
          Finset.disjoint_left.mp hdisjoint
            (by simpa [K] using hzK)
            (core.shellAt t).toCriticalFourShell.q_mem_support
      simpa [hzEq]
    · intro z hz
      have hzEq : z = s.1 := by simpa using hz
      subst z
      exact Finset.mem_inter.mpr
        ⟨by
          simpa [K] using
            (core.shellAt s).toCriticalFourShell.q_mem_support,
          s.2⟩
  have hphysicalSplit :
      ∀ s : {x : ℝ² // x ∈ U},
        (K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
          (∃ t ∈ C, t ≠ s.1 ∧
            K s ∩ C = {s.1, t} ∧
            (K s \ C).card = 2) := by
    intro s
    have hsC : s.1 ∈ C := hUsubC s.2
    have hsK : s.1 ∈ K s := by
      simpa [K] using
        (core.shellAt s).toCriticalFourShell.q_mem_support
    have hsInter : s.1 ∈ K s ∩ C :=
      Finset.mem_inter.mpr ⟨hsK, hsC⟩
    have hInterLe : (K s ∩ C).card ≤ 2 := by
      simpa [K, C] using
        criticalFourShell_inter_selectedClass_card_le_two
          (core.shellAt s).toCriticalFourShell hcenter
    have hCardDecomp :
        (K s \ C).card + (K s ∩ C).card = (K s).card :=
      Finset.card_sdiff_add_card_inter (K s) C
    have hKcard : (K s).card = 4 := by
      simpa [K] using
        (core.shellAt s).toCriticalFourShell.support_card
    rcases Classical.em (K s ∩ C = {s.1}) with hsingle | hnotSingle
    · left
      refine ⟨hsingle, ?_⟩
      have hInterCard : (K s ∩ C).card = 1 := by simp [hsingle]
      omega
    · right
      have hpartner :
          ∃ t ∈ K s ∩ C, t ≠ s.1 := by
        by_contra hnone
        apply hnotSingle
        apply Finset.Subset.antisymm
        · intro z hz
          have hzEq : z = s.1 := by
            by_contra hne
            exact hnone ⟨z, hz, hne⟩
          simpa [hzEq]
        · intro z hz
          have hzEq : z = s.1 := by simpa using hz
          simpa [hzEq] using hsInter
      rcases hpartner with ⟨t, htInter, hts⟩
      have hpairSubset : ({s.1, t} : Finset ℝ²) ⊆ K s ∩ C := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact hsInter
        · exact htInter
      have hpairCard : ({s.1, t} : Finset ℝ²).card = 2 :=
        Finset.card_pair hts.symm
      have hInterEq : K s ∩ C = {s.1, t} := by
        exact
          (Finset.eq_of_subset_of_card_le hpairSubset
            (by omega)).symm
      have hInterCard : (K s ∩ C).card = 2 := by
        rw [hInterEq]
        exact hpairCard
      have hOutsideCard : (K s \ C).card = 2 := by omega
      exact
        ⟨t, (Finset.mem_inter.mp htInter).2, hts,
          hInterEq, hOutsideCard⟩
  have hglobalPhysicalSplit :
      (∃ s : {x : ℝ² // x ∈ U},
          K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
        (∀ s : {x : ℝ² // x ∈ U},
          ∃ t ∈ C, t ≠ s.1 ∧
            K s ∩ C = {s.1, t} ∧
            (K s \ C).card = 2) := by
    rcases Classical.em
        (∃ s : {x : ℝ² // x ∈ U},
          K s ∩ C = {s.1} ∧ (K s \ C).card = 3) with
      hex | hno
    · exact Or.inl hex
    · refine Or.inr ?_
      intro s
      rcases hphysicalSplit s with hsingle | hpair
      · exact False.elim (hno ⟨s, hsingle⟩)
      · exact hpair
  have hsourceSplit :
      source.1 ∉ U ∨
        ∃ s : {x : ℝ² // x ∈ U}, s.1 = source.1 ∧
          ((K s ∩ C = {s.1} ∧ (K s \ C).card = 3) ∨
            (∃ t ∈ C, t ≠ s.1 ∧
              K s ∩ C = {s.1, t} ∧
              (K s \ C).card = 2)) := by
    rcases Classical.em (source.1 ∈ U) with hsU | hsU
    · right
      let s : {x : ℝ² // x ∈ U} := ⟨source.1, hsU⟩
      exact ⟨s, rfl, hphysicalSplit s⟩
    · exact Or.inl hsU
  exact
    ⟨hUsubC, hcenterRemaining, hsourceC, hsourceJ, hsourceKu,
      hsourceIu, hsourceNeDeleted, hsourceNotIv, hcorePlacement,
      hUcardCases, hKinterU, hglobalPhysicalSplit, hsourceSplit⟩

#print axioms exactFourRigid221_minimalCore_normalization

/-- The contextual `q/w` survival disjunction is exactly a disjunction of
nonmembership statements for the actual source row.  This records the full
content of that hypothesis at the finite-incidence level: it constrains the
chosen row at the source blocker, not an arbitrary global minimal-core shell.
-/
theorem exactFourRigid221_context_sourceRow_omits_interior_q_or_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v) :
    R.interior_q ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∨
      R.interior_w ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
  rcases context.source_survives_q_or_w with hq | hw
  · exact Or.inl
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mp hq)
  · exact Or.inr
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mp hw)

/-- A concrete obstruction to closing the minimal-core leaf from its current
interface.

If the actual blocker chosen for the contextual source lies outside the
five-point physical class, then deleting just that source already supplies
all fields of the global-deletion terminal.  Its minimal core is the chosen
source row, and pairwise disjointness is vacuous.  Thus the current hypotheses
do not rule out even the cardinality-one branch: a closing producer must at
least localize this blocker into the physical class (and must analogously
control arbitrary blockers to eliminate larger minimal cores).
-/
theorem exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (rigidWitness :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (hcenterOutside :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∉
        SelectedClass D.A S.oppApex2 rho) :
    let c := (lateFirstApexSystem R).centerAt source.1 source.2
    ∃ globalDeletion :
        ExactFourMutualOmissionRigid221GlobalDeletion
          R rho u v jointDeletion,
      globalDeletion.center = c ∧
        globalDeletion.deleted = {source.1} ∧
        globalDeletion.center ≠ S.oppApex2 ∧
        Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
            D.A globalDeletion.deleted globalDeletion.center) := by
  classical
  let Hlate := lateFirstApexSystem R
  let c := Hlate.centerAt source.1 source.2
  let U : Finset ℝ² := {source.1}
  have hcA : c ∈ D.A := by
    exact
      (Finset.mem_erase.mp
        (Hlate.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have hcOutside :
      c ∉ SelectedClass D.A S.oppApex2 rho := by
    simpa [c, Hlate] using hcenterOutside
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ U) c := by
    simpa [U, c, Hlate, Finset.sdiff_singleton_eq_erase] using
      Hlate.no_qfree_at source.1 source.2
  have hrestores :
      ∀ s ∈ U,
        HasNEquidistantPointsAt 4 (D.A \ U.erase s) c := by
    intro s hs
    have hsEq : s = source.1 := by
      simpa [U] using hs
    subst s
    simpa [U] using D.K4 c hcA
  let core :
      ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c :=
    { shellAt := fun s => by
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        simpa [c, Hlate, hsEq] using
          Hlate.selectedAt source.1 source.2
      supports_pairwise_disjoint := by
        intro s t hst
        have hsEq : s.1 = source.1 := by
          have hsMem := s.2
          change s.1 ∈ ({source.1} : Finset ℝ²) at hsMem
          exact Finset.mem_singleton.mp hsMem
        have htEq : t.1 = source.1 := by
          have htMem := t.2
          change t.1 ∈ ({source.1} : Finset ℝ²) at htMem
          exact Finset.mem_singleton.mp htMem
        exact False.elim
          (hst (Subtype.ext (hsEq.trans htEq.symm))) }
  let globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion :=
    { rigid := rigidWitness.rigid
      center := c
      deleted := U
      center_mem_remaining :=
        Finset.mem_sdiff.mpr ⟨hcA, hcOutside⟩
      deleted_nonempty := by simp [U]
      deleted_subset_class := by
        simpa [U] using context.source_mem_class
      deleted_card_le_five := by simp [U]
      blocked := hblocked
      restores := hrestores
      geometry := Or.inr ⟨core⟩ }
  have hcenterNe : c ≠ S.oppApex2 := by
    simpa [c, Hlate] using
      surface.secondApex_robust.centerAt_ne
        Hlate source.1 source.2
  have hcore :
      Nonempty
        (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
          D.A globalDeletion.deleted globalDeletion.center) := by
    simpa [globalDeletion] using
      (show Nonempty
          (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore D.A U c)
        from ⟨core⟩)
  exact ⟨globalDeletion, rfl, rfl, hcenterNe, hcore⟩

/-- Checked exhaustive producer for the first unresolved geometric decision.
Either the contextual source's actual blocker is in the physical class, or
the current rigid terminal interface admits the explicit singleton minimal
core above. -/
theorem exactFourRigid221_sourceBlocker_mem_class_or_singleton_minimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (rigidWitness :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion) :
    let c := (lateFirstApexSystem R).centerAt source.1 source.2
    c ∈ SelectedClass D.A S.oppApex2 rho ∨
      ∃ globalDeletion :
          ExactFourMutualOmissionRigid221GlobalDeletion
            R rho u v jointDeletion,
        globalDeletion.center = c ∧
          globalDeletion.deleted = {source.1} ∧
          globalDeletion.center ≠ S.oppApex2 ∧
          Nonempty
            (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
              D.A globalDeletion.deleted globalDeletion.center) := by
  classical
  let c := (lateFirstApexSystem R).centerAt source.1 source.2
  by_cases hc : c ∈ SelectedClass D.A S.oppApex2 rho
  · exact Or.inl hc
  · exact Or.inr
      (exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
        R surface source other u v context jointDeletion rigidWitness hc)

#print axioms exactFourRigid221_context_sourceRow_omits_interior_q_or_w
#print axioms exactFourRigid221_singleton_minimalCore_of_sourceBlocker_outside_class
#print axioms exactFourRigid221_sourceBlocker_mem_class_or_singleton_minimalCore

end ATailFrontierLiveClosure
end Problem97
