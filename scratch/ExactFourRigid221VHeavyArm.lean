import ExactFourRigid221GlobalDeletionSplit

/-!
# Exact-four rigid `2+2+1`: indexed strict-cap `v`-heavy arm

This scratch file narrows the `v`-row-heavy arm of
`ExactFourRigid221PhysicalFiveCycleDecomposition`.  The twelve constructors
below are the literal product of:

* the source row (`u` itself, or the genuine third row through `xu`);
* the deleted row pointing to `u` or to `v`; and
* the three remaining placements of `other`.

The producer retains the full physical-apex context and records the common
strict-cap and five-point facts once, outside the indexed case proposition.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

/-- The exhaustive finite index for the strict-cap `v`-heavy arm. -/
inductive ExactFourRigid221VHeavyIndex where
  | sourceU_rowU_otherD
  | sourceU_rowU_otherV
  | sourceU_rowU_otherXv
  | sourceU_rowV_otherD
  | sourceU_rowV_otherV
  | sourceU_rowV_otherXv
  | sourceX_rowU_otherU
  | sourceX_rowU_otherV
  | sourceX_rowU_otherXv
  | sourceX_rowV_otherU
  | sourceX_rowV_otherV
  | sourceX_rowV_otherXv
  deriving DecidableEq

/-- Interpretation of one indexed `v`-heavy case.  The `sourceX` constructors
include the exact third-row trace, so choosing an index loses no source
context. -/
def ExactFourRigid221VHeavyCaseSpec
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (xu xv : ℝ²)
    (k : ExactFourRigid221VHeavyIndex) : Prop :=
  let C := SelectedClass D.A S.oppApex2 rho
  let Ks :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support
  let Id :=
    ((lateFirstApexSystem R).selectedAt
      jointDeletion.deleted.1
      jointDeletion.deleted.2).toCriticalFourShell.support ∩ C
  match k with
  | .sourceU_rowU_otherD =>
      u = source ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other = jointDeletion.deleted
  | .sourceU_rowU_otherV =>
      u = source ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other = v
  | .sourceU_rowU_otherXv =>
      u = source ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other.1 = xv
  | .sourceU_rowV_otherD =>
      u = source ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other = jointDeletion.deleted
  | .sourceU_rowV_otherV =>
      u = source ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other = v
  | .sourceU_rowV_otherXv =>
      u = source ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other.1 = xv
  | .sourceX_rowU_otherU =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other = u
  | .sourceX_rowU_otherV =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other = v
  | .sourceX_rowU_otherXv =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, u.1} ∧
        other.1 = xv
  | .sourceX_rowV_otherU =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other = u
  | .sourceX_rowV_otherV =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other = v
  | .sourceX_rowV_otherXv =>
      u ≠ source ∧ source.1 = xu ∧
        Ks ∩ C = {source.1, jointDeletion.deleted.1} ∧
        Id = {jointDeletion.deleted.1, v.1} ∧
        other.1 = xv

/-- Common, non-indexed information retained by every `v`-heavy case. -/
structure ExactFourRigid221VHeavyFacts
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (xu xv : ℝ²) : Prop where
  named_card :
    (insert jointDeletion.deleted.1
      ({u.1, xu} ∪ {v.1, xv}) : Finset ℝ²).card = 5
  xu_ne_u : xu ≠ u.1
  xv_ne_v : xv ≠ v.1
  physical_class :
    SelectedClass D.A S.oppApex2 rho =
      insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv})
  v_row_class :
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho =
        {v.1, xv}
  v_pair_strict :
    ({v.1, xv} : Finset ℝ²) ∩
      S.capInteriorByIndex S.oppIndex2 =
        {v.1, xv}
  v_blocker_strict :
    (lateFirstApexSystem R).centerAt v.1 v.2 ∈
      S.capInteriorByIndex S.oppIndex2
  v_row_physical_cap :
    ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2 =
        {v.1, xv}
  source_strict :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  other_strict :
    other.1 ∈ S.capInteriorByIndex S.oppIndex2

/-- Kernel-checked producer for the exhaustive indexed `v`-heavy packet.

All arguments of the full physical-apex producer are retained deliberately:
this theorem can replace the arm at its current consumer without erasing
global context. -/
theorem exactFourRigid221_vHeavy_indexedPacket
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
    (_huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
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
    (hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (_hcenter : G.center = S.oppApex2)
    (xu xv : ℝ²)
    (decomposition :
      ExactFourRigid221PhysicalFiveCycleDecomposition
        R rho source other u v jointDeletion G xu xv)
    (vHeavy :
      ({v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {v.1, xv} ∧
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈
          S.capInteriorByIndex S.oppIndex2 ∧
        ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 =
            {v.1, xv}) :
    ∃ k : ExactFourRigid221VHeavyIndex,
      ExactFourRigid221VHeavyFacts
        R rho source other u v jointDeletion xu xv ∧
      ExactFourRigid221VHeavyCaseSpec
        R rho source other u v jointDeletion xu xv k := by
  classical
  rcases vHeavy with ⟨hvPair, hvBlocker, hvCap⟩
  have hnamedCard :
      (insert jointDeletion.deleted.1
        ({u.1, xu} ∪ {v.1, xv}) : Finset ℝ²).card = 5 := by
    rw [← decomposition.physical_class]
    exact hclassFive
  have hcommon :
      ExactFourRigid221VHeavyFacts
        R rho source other u v jointDeletion xu xv :=
    { named_card := hnamedCard
      xu_ne_u := decomposition.xu_ne_u
      xv_ne_v := decomposition.xv_ne_v
      physical_class := decomposition.physical_class
      v_row_class := decomposition.v_row_trace
      v_pair_strict := hvPair
      v_blocker_strict := hvBlocker
      v_row_physical_cap := hvCap
      source_strict := context.source_mem_interior
      other_strict := context.other_mem_interior }
  rcases decomposition.source_shape with
    ⟨huSource, hother⟩ | ⟨huSource, hsourceXu, hsourceRow, hother⟩
  · rcases decomposition.deleted_row_trace with hrowU | hrowV
    · rcases hother with hotherD | hotherV | hotherXv
      · refine ⟨.sourceU_rowU_otherD, hcommon, ?_⟩
        exact ⟨huSource, hrowU, hotherD⟩
      · refine ⟨.sourceU_rowU_otherV, hcommon, ?_⟩
        exact ⟨huSource, hrowU, hotherV⟩
      · refine ⟨.sourceU_rowU_otherXv, hcommon, ?_⟩
        exact ⟨huSource, hrowU, hotherXv⟩
    · rcases hother with hotherD | hotherV | hotherXv
      · refine ⟨.sourceU_rowV_otherD, hcommon, ?_⟩
        exact ⟨huSource, hrowV, hotherD⟩
      · refine ⟨.sourceU_rowV_otherV, hcommon, ?_⟩
        exact ⟨huSource, hrowV, hotherV⟩
      · refine ⟨.sourceU_rowV_otherXv, hcommon, ?_⟩
        exact ⟨huSource, hrowV, hotherXv⟩
  · rcases decomposition.deleted_row_trace with hrowU | hrowV
    · rcases hother with hotherU | hotherV | hotherXv
      · refine ⟨.sourceX_rowU_otherU, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowU, hotherU⟩
      · refine ⟨.sourceX_rowU_otherV, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowU, hotherV⟩
      · refine ⟨.sourceX_rowU_otherXv, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowU, hotherXv⟩
    · rcases hother with hotherU | hotherV | hotherXv
      · refine ⟨.sourceX_rowV_otherU, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowV, hotherU⟩
      · refine ⟨.sourceX_rowV_otherV, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowV, hotherV⟩
      · refine ⟨.sourceX_rowV_otherXv, hcommon, ?_⟩
        exact
          ⟨huSource, hsourceXu, hsourceRow, hrowV, hotherXv⟩

end ATailFrontierLiveClosure
end Problem97
