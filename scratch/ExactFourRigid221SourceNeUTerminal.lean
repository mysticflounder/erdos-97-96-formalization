import scratch.ExactFourRigid221ExceptionalArm

/-!
# Exact-four rigid `2+2+1`: physical source-ne-`u` terminal

This file isolates the axiom-clean finite frontier in the physical-apex
branch where the contextual source is not `u` and its blocker belongs to the
physical five-class.

The source normal form and the named-row producer force `xu = source`.  The
source blocker is then one of exactly four named physical points:
`deleted`, `u`, `v`, or `xv`.  The strict-cap geometry has five exact arms:
the two heavy-row arms, followed by the three contextual placements inside
the exceptional `1+1+1` arm.

The distinguished-deletion blocker case is retained deliberately.  Removing
it requires proving that the distinguished deletion lies in the source row;
the current producer of that fact is transitively `sorryAx`-tainted.
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

attribute [local instance] Classical.propDecidable

/-- The four exact physical points still available to the contextual
source's blocker in the clean `u ≠ source` branch. -/
inductive ExactFourRigid221SourceNeUBlockerPlacement
    (blocker deleted u v xv : ℝ²) : Prop where
  | atDeleted (h : blocker = deleted)
  | atU (h : blocker = u)
  | atV (h : blocker = v)
  | atXv (h : blocker = xv)

/-- The four exact carrier/point placements still available to `other`
before the strict-cap arm is selected. -/
inductive ExactFourRigid221SourceNeUOtherPlacement
    {D : CounterexampleData}
    (other deleted u v : CarrierVertex D.A)
    (xv : ℝ²) : Prop where
  | atDeleted (h : other = deleted)
  | atU (h : other = u)
  | atV (h : other = v)
  | atXv (h : other.1 = xv)

/-- The exact strict-cap alternatives after orienting the source as the
companion `xu`.  The exceptional arm is split by the three surviving
placements of `other`, so no contextual disjunction is hidden in that arm. -/
inductive ExactFourRigid221SourceNeUStrictCapCase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²) : Prop where
  | uHeavy
      (u_pair_interior :
        ({u.1, xu} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {u.1, xu})
      (u_blocker_interior :
        (lateFirstApexSystem R).centerAt u.1 u.2 ∈
          S.capInteriorByIndex S.oppIndex2)
      (u_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 =
            {u.1, xu})
  | vHeavy
      (v_pair_interior :
        ({v.1, xv} : Finset ℝ²) ∩
            S.capInteriorByIndex S.oppIndex2 =
          {v.1, xv})
      (v_blocker_interior :
        (lateFirstApexSystem R).centerAt v.1 v.2 ∈
          S.capInteriorByIndex S.oppIndex2)
      (v_cap_trace :
        ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 =
            {v.1, xv})
  | exceptionalDeleted
      (arm :
        ExactFourRigid221PhysicalFiveExceptionalArm
          R rho source other u v jointDeletion G xu xv)
      (other_eq : other = jointDeletion.deleted)
  | exceptionalV
      (arm :
        ExactFourRigid221PhysicalFiveExceptionalArm
          R rho source other u v jointDeletion G xu xv)
      (other_eq : other = v)
      (v_interior :
        v.1 ∈ S.capInteriorByIndex S.oppIndex2)
      (xv_not_interior :
        xv ∉ S.capInteriorByIndex S.oppIndex2)
  | exceptionalXv
      (arm :
        ExactFourRigid221PhysicalFiveExceptionalArm
          R rho source other u v jointDeletion G xu xv)
      (other_point_eq : other.1 = xv)
      (v_not_interior :
        v.1 ∉ S.capInteriorByIndex S.oppIndex2)
      (xv_interior :
        xv ∈ S.capInteriorByIndex S.oppIndex2)

/-- A sorry-free packet for the complete clean physical source-ne-`u`
frontier.  Besides the finite placements, it retains every component of the
production source normal form that is immediately relevant to a geometric
terminal. -/
structure ExactFourRigid221SourceNeUInClassTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (G : ExactFourMutualOmissionRigid221GlobalDeletion
      R rho u v jointDeletion)
    (xu xv : ℝ²) : Prop where
  named_rows :
    ExactFourRigid221PhysicalFiveNamedRows
      R rho u v jointDeletion G xu xv
  source_eq_xu : source.1 = xu
  u_point_ne_source : u.1 ≠ source.1
  u_not_mem_source_row :
    u.1 ∉
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
  u_row_normal_form :
    ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 rho =
        {source.1, u.1}
  source_row_u_intersection :
    ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support ∩
      (((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho) =
          {source.1}
  source_mem_u_pair_interior :
    source.1 ∈
      (((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho) ∩
      S.capInteriorByIndex S.oppIndex2
  source_blocker_ne_u_blocker :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠
      (lateFirstApexSystem R).centerAt u.1 u.2
  source_blocker_ne_v_blocker :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  u_blocker_ne_v_blocker :
    (lateFirstApexSystem R).centerAt u.1 u.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  global_deleted_card : G.deleted.card = 2
  blocker_placement :
    ExactFourRigid221SourceNeUBlockerPlacement
      ((lateFirstApexSystem R).centerAt source.1 source.2)
      jointDeletion.deleted.1 u.1 v.1 xv
  other_placement :
    ExactFourRigid221SourceNeUOtherPlacement
      other jointDeletion.deleted u v xv
  strict_cap_case :
    ExactFourRigid221SourceNeUStrictCapCase
      R rho source other u v jointDeletion G xu xv

/-- Full-hypothesis producer for the exact axiom-clean terminal in the
physical source-ne-`u`, source-blocker-in-class branch. -/
theorem exactFourRigid221_physicalApex_sourceNeU_inClass_terminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (huOmitted :
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
    (hcenter : G.center = S.oppApex2)
    (hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (huNeSource : u ≠ source) :
    ∃ xu xv : ℝ²,
      ExactFourRigid221SourceNeUInClassTerminal
        R rho source other u v jointDeletion G xu xv := by
  classical
  rcases
      exactFourRigid221_physicalApex_exceptionalArmRefinement
        R hcard surface rho source other hrho hfive u v huNeV
          huClass hvClass hvOmitted huOmitted context jointDeletion
          hclassFive G hcenter with
    ⟨xu, xv, namedRows, hstrict⟩
  have hnormal :=
    exactFourRigid221_context_u_ne_source_normalForm
      huClass context jointDeletion.blockers_ne G huNeSource
  change
    u.1 ≠ source.1 ∧
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho =
          {source.1, u.1} ∧
      ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        (((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho) =
            {source.1} ∧
      source.1 ∈
        (((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho) ∩
        S.capInteriorByIndex S.oppIndex2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2 ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 ∧
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2
      at hnormal
  rcases hnormal with
    ⟨huPointNe, huNotSourceRow, hIuEq, hsourceIuEq,
      hsourceIuInterior, hsourceNeUBlocker, hsourceNeVBlocker,
      huNeVBlocker⟩
  have hsourceIu :
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho :=
    Finset.mem_inter.mpr
      ⟨context.source_mem_u_row, context.source_mem_class⟩
  rw [namedRows.u_row_trace] at hsourceIu
  simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceIu
  have hsourceEqXu : source.1 = xu := by
    rcases hsourceIu with hsourceEqU | hsourceEqXu
    · exact (huPointNe hsourceEqU.symm).elim
    · exact hsourceEqXu
  have hblockerPlacement :
      ExactFourRigid221SourceNeUBlockerPlacement
        ((lateFirstApexSystem R).centerAt source.1 source.2)
        jointDeletion.deleted.1 u.1 v.1 xv := by
    rcases
        exactFourRigid221_sourceBlockerInClass_placement
          huClass context G hsourceBlockerClass with
      hsource | hsourceNe
    · exact (huNeSource hsource.1).elim
    · rcases hsourceNe.2 with hd | hu | hIv
      · exact .atDeleted hd
      · exact .atU hu
      · rw [namedRows.v_row_trace] at hIv
        simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
        rcases hIv with hv | hxv
        · exact .atV hv
        · exact .atXv hxv
  have hotherPlacement :
      ExactFourRigid221SourceNeUOtherPlacement
        other jointDeletion.deleted u v xv := by
    have hother :=
      exactFourRigid221_context_u_ne_source_otherPlacement
        huClass context jointDeletion.blockers_ne G huNeSource
    change
      other = u ∨
        other.1 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho ∨
        other = jointDeletion.deleted
        at hother
    rcases hother with hu | hIv | hd
    · exact .atU hu
    · rw [namedRows.v_row_trace] at hIv
      simp only [Finset.mem_insert, Finset.mem_singleton] at hIv
      rcases hIv with hv | hxv
      · exact .atV (Subtype.ext hv)
      · exact .atXv hxv
    · exact .atDeleted hd
  have hstrictCase :
      ExactFourRigid221SourceNeUStrictCapCase
        R rho source other u v jointDeletion G xu xv := by
    rcases hstrict with huHeavy | hvHeavy | exceptional
    · exact .uHeavy huHeavy.1 huHeavy.2.1 huHeavy.2.2
    · exact .vHeavy hvHeavy.1 hvHeavy.2.1 hvHeavy.2.2
    · rcases exceptional.contextual_trace with hsource | hsourceNe
      · exact (huNeSource hsource.1).elim
      · rcases hsourceNe with
          ⟨_, _, _, _, hd | hv | hxv⟩
        · exact .exceptionalDeleted exceptional hd
        · exact
            .exceptionalV exceptional hv.1 hv.2.1 hv.2.2
        · exact
            .exceptionalXv exceptional hxv.1 hxv.2.1 hxv.2.2
  refine ⟨xu, xv, ?_⟩
  exact
    { named_rows := namedRows
      source_eq_xu := hsourceEqXu
      u_point_ne_source := huPointNe
      u_not_mem_source_row := huNotSourceRow
      u_row_normal_form := hIuEq
      source_row_u_intersection := hsourceIuEq
      source_mem_u_pair_interior := hsourceIuInterior
      source_blocker_ne_u_blocker := hsourceNeUBlocker
      source_blocker_ne_v_blocker := hsourceNeVBlocker
      u_blocker_ne_v_blocker := huNeVBlocker
      global_deleted_card :=
        exactFourRigid221_physicalApex_deleted_card_eq_two
          hrho hclassFive G hcenter
      blocker_placement := hblockerPlacement
      other_placement := hotherPlacement
      strict_cap_case := hstrictCase }

#print axioms exactFourRigid221_physicalApex_sourceNeU_inClass_terminal

end ATailFrontierLiveClosure
end Problem97
