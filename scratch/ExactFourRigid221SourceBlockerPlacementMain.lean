import ExactFourRigid221GlobalDeletionSplit
import ExactFourRigid221MinimalCoreClosure

/-!
# Exact-four rigid `2+2+1`: source-blocker placement

This file resolves the first geometric decision left implicit by the physical
five-cycle decomposition.  The contextual source's actual blocker is either
outside the physical five-class, in which case the checked singleton
minimal-core construction applies, or it is one of only six named points.

The two source-row shapes eliminate the blocker from the two physical points
already known to lie in that row.  No source context is discarded.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The six possible named locations of the contextual source's actual blocker
after localizing it into the rigid physical five-class. -/
inductive ExactFourRigid221SourceBlockerNamedPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (xu xv : ℝ²) : Prop
  | sourceEqU_deleted
      (source_eq_u : u = source)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1)
  | sourceEqU_v
      (source_eq_u : u = source)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = v.1)
  | sourceEqU_xv
      (source_eq_u : u = source)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = xv)
  | sourceEqXu_u
      (source_ne_u : u ≠ source)
      (source_eq_xu : source.1 = xu)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1)
  | sourceEqXu_v
      (source_ne_u : u ≠ source)
      (source_eq_xu : source.1 = xu)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = v.1)
  | sourceEqXu_xv
      (source_ne_u : u ≠ source)
      (source_eq_xu : source.1 = xu)
      (blocker_eq :
        (lateFirstApexSystem R).centerAt source.1 source.2 = xv)

/-- The explicit singleton minimal-core alternative produced when the source's
actual blocker is outside the physical five-class. -/
structure ExactFourRigid221SourceSingletonMinimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v) : Type where
  globalDeletion :
    ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion
  center_eq :
    globalDeletion.center =
      (lateFirstApexSystem R).centerAt source.1 source.2
  deleted_eq : globalDeletion.deleted = {source.1}
  center_ne_physical : globalDeletion.center ≠ S.oppApex2
  core :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A globalDeletion.deleted globalDeletion.center)

/-- Exhaustive source-blocker placement producer for the physical five-cycle.

If the blocker is outside the physical class, the right branch is the checked
singleton minimal core.  If it is inside, the source-row trace excludes the
two points of that trace, leaving exactly the six constructors above:

* `u = source`: deleted, `v`, or `xv`;
* `u ≠ source` and `source = xu`: `u`, `v`, or `xv`.
-/
theorem exactFourRigid221_sourceBlocker_namedPlacement_or_singletonMinimalCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other u v : CarrierVertex D.A)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²)
    (P : ExactFourRigid221PhysicalFiveCycleDecomposition
      R rho source other u v jointDeletion G xu xv) :
    ExactFourRigid221SourceBlockerNamedPlacement
        R rho source u v jointDeletion xu xv ∨
      Nonempty
        (ExactFourRigid221SourceSingletonMinimalCore
          R rho source u v jointDeletion) := by
  classical
  let Ksource :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let blocker :=
    (lateFirstApexSystem R).centerAt source.1 source.2
  have hfork :=
    exactFourRigid221_sourceBlocker_mem_class_or_singleton_minimalCore
      R surface source other u v context jointDeletion G
  change
    blocker ∈ SelectedClass D.A S.oppApex2 rho ∨
      ∃ globalDeletion :
          ExactFourMutualOmissionRigid221GlobalDeletion
            R rho u v jointDeletion,
        globalDeletion.center = blocker ∧
          globalDeletion.deleted = {source.1} ∧
          globalDeletion.center ≠ S.oppApex2 ∧
          Nonempty
            (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
              D.A globalDeletion.deleted globalDeletion.center)
      at hfork
  rcases hfork with hblockerClass | hsingleton
  · have hnamed :
        blocker = jointDeletion.deleted.1 ∨
          (blocker = u.1 ∨ blocker = xu) ∨
            blocker = v.1 ∨ blocker = xv := by
      rw [P.physical_class] at hblockerClass
      simpa only [Finset.mem_insert, Finset.mem_union,
        Finset.mem_singleton] using hblockerClass
    have hblockerNotSupport : blocker ∉ Ksource.support := by
      simpa [blocker, Ksource] using Ksource.center_not_mem_support
    by_cases huSource : u = source
    · subst u
      have hxuSourceRow :
          xu ∈
            ((lateFirstApexSystem R).selectedAt
              source.1 source.2).toCriticalFourShell.support := by
        have hxu :
            xu ∈
              ((lateFirstApexSystem R).selectedAt
                  source.1 source.2).toCriticalFourShell.support ∩
                SelectedClass D.A S.oppApex2 rho := by
          rw [P.u_row_trace]
          simp
        exact (Finset.mem_inter.mp hxu).1
      have hxuSourceRow' : xu ∈ Ksource.support := by
        simpa [Ksource] using hxuSourceRow
      rcases hnamed with hd | (hu | hxu) | hv | hxv
      · exact Or.inl (.sourceEqU_deleted rfl hd)
      · exfalso
        apply hblockerNotSupport
        rw [hu]
        exact Ksource.q_mem_support
      · exact (hblockerNotSupport (hxu ▸ hxuSourceRow')).elim
      · exact Or.inl (.sourceEqU_v rfl hv)
      · exact Or.inl (.sourceEqU_xv rfl hxv)
    · have hsourceShape := P.source_shape
      rcases hsourceShape with hsourceEq | hsourceNe
      · exact (huSource hsourceEq.1).elim
      · have hsourceEqXu : source.1 = xu := hsourceNe.2.1
        have hsourceRowTrace := hsourceNe.2.2.1
        have hdeletedSourceRow :
            jointDeletion.deleted.1 ∈ Ksource.support := by
          have hdeleted :
              jointDeletion.deleted.1 ∈
                Ksource.support ∩
                  SelectedClass D.A S.oppApex2 rho := by
            rw [hsourceRowTrace]
            simp
          exact (Finset.mem_inter.mp hdeleted).1
        rcases hnamed with hd | (hu | hxu) | hv | hxv
        · exact
            (hblockerNotSupport
              (hd ▸ hdeletedSourceRow)).elim
        · exact Or.inl (.sourceEqXu_u huSource hsourceEqXu hu)
        · exfalso
          apply hblockerNotSupport
          rw [hxu, ← hsourceEqXu]
          exact Ksource.q_mem_support
        · exact Or.inl (.sourceEqXu_v huSource hsourceEqXu hv)
        · exact Or.inl (.sourceEqXu_xv huSource hsourceEqXu hxv)
  · rcases hsingleton with
      ⟨globalDeletion, hcenter, hdeleted, hcenterNe, hcore⟩
    exact Or.inr
      ⟨{ globalDeletion := globalDeletion
         center_eq := by simpa [blocker] using hcenter
         deleted_eq := hdeleted
         center_ne_physical := hcenterNe
         core := hcore }⟩

#print axioms
  exactFourRigid221_sourceBlocker_namedPlacement_or_singletonMinimalCore

end ATailFrontierLiveClosure
end Problem97
