import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Exact-four blocker-coincidence reduction

Checked scratch reduction for the blocker-coincidence arm of
`false_of_exactFourMutualOmission_fourCenterCommonDeletion`.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure

attribute [local instance] Classical.propDecidable

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual

/-- Any exact row obtained by deleting `q` at the actual blocker of `source`
is forced to be the canonical critical shell of `source`.  Otherwise the row
would survive deletion of `source`, contrary to the blocker property. -/
theorem qDeletedRow_eq_actualShellSupport
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q source : ℝ²} (hsource : source ∈ D.A)
    {B : Finset ℝ²}
    (row :
      U5QDeletedK4Class D q (H.centerAt source hsource) B)
    (hBcard : B.card = 4) :
    B =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt source hsource).toCriticalFourShell
  have hsourceB : source ∈ B := by
    by_contra hsourceNot
    apply H.no_qfree_at source hsource
    refine ⟨row.radius, row.radius_pos, ?_⟩
    have hsub :
        B ⊆
          (D.A.erase source).filter
            (fun y => dist (H.centerAt source hsource) y = row.radius) := by
      intro y hy
      have hyErased : y ∈ (D.skeleton q).erase
          (H.centerAt source hsource) :=
        row.subset hy
      have hySkeleton : y ∈ D.skeleton q :=
        (Finset.mem_erase.mp hyErased).2
      have hyA : y ∈ D.A :=
        (Finset.mem_erase.mp hySkeleton).2
      have hyNeSource : y ≠ source := by
        intro hys
        exact hsourceNot (hys ▸ hy)
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr ⟨hyNeSource, hyA⟩,
          row.same_radius y hy⟩
    exact le_trans row.card_four (Finset.card_le_card hsub)
  have hradii : row.radius = K.radius := by
    exact (row.same_radius source hsourceB).symm.trans
      (K.support_eq_radius source K.q_mem_support)
  have hsub : B ⊆ K.support := by
    intro y hy
    have hyErased : y ∈ (D.skeleton q).erase
        (H.centerAt source hsource) :=
      row.subset hy
    have hySkeleton : y ∈ D.skeleton q :=
      (Finset.mem_erase.mp hyErased).2
    have hyA : y ∈ D.A :=
      (Finset.mem_erase.mp hySkeleton).2
    apply K.off_row_named_label_forbidden hyA
    exact (row.same_radius y hy).trans hradii
  refine Finset.eq_of_subset_of_card_le hsub ?_
  rw [K.support_card, hBcard]

/-- In each blocker-coincidence arm, the corresponding q-deleted row is not
an arbitrary witness: it is exactly the canonical critical shell whose
blocker collided with `q`. -/
theorem exactFour_blockerCoincidence_canonicalRow_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    (first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∧
        first.uPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support) ∨
      (first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∧
        first.vPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support) ∨
      (first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2 ∧
        crossPacket.B₁ =
          ((lateFirstApexSystem R).selectedAt
            second.deleted.1 second.deleted.2).toCriticalFourShell.support) := by
  rcases hcollision with hqu | hqv | hqr
  · exact Or.inl
      ⟨hqu,
        qDeletedRow_eq_actualShellSupport
          u.2 first.uPacket.row₁ first.uPacket.B₁_card⟩
  · exact Or.inr (Or.inl
      ⟨hqv,
        qDeletedRow_eq_actualShellSupport
          v.2 first.vPacket.row₁ first.vPacket.B₁_card⟩)
  · exact Or.inr (Or.inr
      ⟨hqr,
        qDeletedRow_eq_actualShellSupport
          second.deleted.2 crossPacket.row₁ crossPacket.B₁_card⟩)

/-- In either original-center blocker-coincidence arm, the coincident packet
row is canonical and the deleted source forms a mutual-omission,
mutual-cross-deletion pair with one original source.

This is the direct conclusion available from blocker coincidence and the
physical-class intersection bound.  It deliberately retains the two possible
partners: the hypotheses do not determine whether the deleted source omits
`u` or `v`. -/
theorem exactFour_blockerCoincidence_uv_mutualCrossDeletion_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (surface : ExactFourPostCardElevenRobustSurface R)
    {u v : CarrierVertex D.A}
    (huNeV : u ≠ v)
    (huClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (first : ExactFourMutualOmissionJointDeletion R rho u v)
    (hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2) :
    let Kq :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support
    let Ku :=
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
    let Kv :=
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
    ((first.deleted.1 =
            (lateFirstApexSystem R).centerAt u.1 u.2 ∧
          first.uPacket.B₁ = Ku) ∧
        ((u.1 ∉ Kq ∧
              first.deleted.1 ∉ Ku ∧
              HasNEquidistantPointsAt 4
                (D.A.erase u.1)
                ((lateFirstApexSystem R).centerAt
                  first.deleted.1 first.deleted.2) ∧
              HasNEquidistantPointsAt 4
                (D.A.erase first.deleted.1)
                ((lateFirstApexSystem R).centerAt u.1 u.2)) ∨
          (v.1 ∉ Kq ∧
              first.deleted.1 ∉ Kv ∧
              HasNEquidistantPointsAt 4
                (D.A.erase v.1)
                ((lateFirstApexSystem R).centerAt
                  first.deleted.1 first.deleted.2) ∧
              HasNEquidistantPointsAt 4
                (D.A.erase first.deleted.1)
                ((lateFirstApexSystem R).centerAt v.1 v.2)))) ∨
      ((first.deleted.1 =
            (lateFirstApexSystem R).centerAt v.1 v.2 ∧
          first.vPacket.B₁ = Kv) ∧
        ((u.1 ∉ Kq ∧
              first.deleted.1 ∉ Ku ∧
              HasNEquidistantPointsAt 4
                (D.A.erase u.1)
                ((lateFirstApexSystem R).centerAt
                  first.deleted.1 first.deleted.2) ∧
              HasNEquidistantPointsAt 4
                (D.A.erase first.deleted.1)
                ((lateFirstApexSystem R).centerAt u.1 u.2)) ∨
          (v.1 ∉ Kq ∧
              first.deleted.1 ∉ Kv ∧
              HasNEquidistantPointsAt 4
                (D.A.erase v.1)
                ((lateFirstApexSystem R).centerAt
                  first.deleted.1 first.deleted.2) ∧
              HasNEquidistantPointsAt 4
                (D.A.erase first.deleted.1)
                ((lateFirstApexSystem R).centerAt v.1 v.2)))) := by
  dsimp only
  have hmutual :=
    exactFour_jointDeleted_mutualOmission_with_one_original
      surface huNeV huClass hvClass first
  have huCycle
      (hu :
        u.1 ∉
            ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
          first.deleted.1 ∉
            ((lateFirstApexSystem R).selectedAt
              u.1 u.2).toCriticalFourShell.support) :
      u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4
          (D.A.erase u.1)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2) := by
    exact
      ⟨hu.1, hu.2,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hu.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) u.2).mpr hu.2⟩
  have hvCycle
      (hv :
        v.1 ∉
            ((lateFirstApexSystem R).selectedAt
              first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
          first.deleted.1 ∉
            ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support) :
      v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4
          (D.A.erase v.1)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2) := by
    exact
      ⟨hv.1, hv.2,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hv.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) v.2).mpr hv.2⟩
  rcases hcollision with hqu | hqv
  · refine Or.inl ⟨⟨hqu, ?_⟩, ?_⟩
    · exact qDeletedRow_eq_actualShellSupport
        u.2 first.uPacket.row₁ first.uPacket.B₁_card
    · rcases hmutual with hu | hv
      · exact Or.inl (huCycle hu)
      · exact Or.inr (hvCycle hv)
  · refine Or.inr ⟨⟨hqv, ?_⟩, ?_⟩
    · exact qDeletedRow_eq_actualShellSupport
        v.2 first.vPacket.row₁ first.vPacket.B₁_card
    · rcases hmutual with hu | hv
      · exact Or.inl (huCycle hu)
      · exact Or.inr (hvCycle hv)

#print axioms qDeletedRow_eq_actualShellSupport
#print axioms exactFour_blockerCoincidence_canonicalRow_split
#print axioms exactFour_blockerCoincidence_uv_mutualCrossDeletion_split

end Problem97.ATailFrontierLiveClosure
