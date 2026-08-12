import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure

/-! Scratch-only source audit for the first-non-hit constructor products. -/

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius radiusρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S radiusρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- Every non-hit constructor says exactly that the named row either has the
Q center or is a distinct-center row whose overlap with Q is at most two. -/
theorem scratch_nonHit_namedRow_localAlternative
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (data : FreshThirdCapSourceNonHit P Pρ source Q) :
    H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∨
      (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2) := by
  cases data with
  | sameBlocker center_eq _ => exact Or.inl center_eq
  | sourceRowOmission deleted deleted_eq _ deletion_survives =>
      have hne :
          H.centerAt source.1 source.2 ≠
            H.centerAt Q.source₁.1 Q.source₁.2 := by
        rcases deleted_eq with rfl | rfl
        · have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₁.2 deletion_survives
          intro h
          exact hblockerNe h.symm
        · have hQCenters :
              H.centerAt Q.source₁.1 Q.source₁.2 =
                H.centerAt Q.source₂.1 Q.source₂.2 :=
            congrArg Subtype.val Q.blockers_eq
          have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₂.2 deletion_survives
          intro h
          exact hblockerNe (hQCenters.symm.trans h.symm)
      exact Or.inr ⟨hne, SelectedFourClass.inter_card_le_two
        (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass hne⟩

/-- The same local boundary for all four interaction constructors. -/
theorem scratch_interaction_namedRow_localAlternative
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Pρ)
    (interaction : FreshThirdCapSourceInteraction P Pρ source Q) :
    H.centerAt source.1 source.2 =
        H.centerAt Q.source₁.1 Q.source₁.2 ∨
      (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2) := by
  cases interaction with
  | sameBlocker center_eq _ => exact Or.inl center_eq
  | sourceRowOmission deleted deleted_eq _ deletion_survives =>
      have hne :
          H.centerAt source.1 source.2 ≠
            H.centerAt Q.source₁.1 Q.source₁.2 := by
        rcases deleted_eq with rfl | rfl
        · have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₁.2 deletion_survives
          intro h
          exact hblockerNe h.symm
        · have hQCenters :
              H.centerAt Q.source₁.1 Q.source₁.2 =
                H.centerAt Q.source₂.1 Q.source₂.2 :=
            congrArg Subtype.val Q.blockers_eq
          have hblockerNe :=
            _root_.Problem97.ATAILStageOnePrescribedApexDichotomy.actual_blocker_ne_of_deletion_survives
              H Q.source₂.2 deletion_survives
          intro h
          exact hblockerNe (hQCenters.symm.trans h.symm)
      exact Or.inr ⟨hne, SelectedFourClass.inter_card_le_two
        (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass hne⟩
  | distinctBlockersDifferentCaps centers_ne _ _ overlap_eq _ _ _ _ _ =>
      refine Or.inr ⟨centers_ne, ?_⟩
      rw [overlap_eq]
      have hvals : Q.source₁.1 ≠ Q.source₂.1 := by
        intro h
        exact Q.sources_ne (Subtype.ext h)
      simp [hvals]
  | sameCapWithInternalFiberSource centers_ne _ _ overlap_eq _ _ _ _ =>
      refine Or.inr ⟨centers_ne, ?_⟩
      rw [overlap_eq]
      have hvals : Q.source₁.1 ≠ Q.source₂.1 := by
        intro h
        exact Q.sources_ne (Subtype.ext h)
      simp [hvals]

end
end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

#print axioms Problem97.ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
#print axioms Problem97.ATailSurvivalCover.actualBlockerFiber_card_le_four
#print axioms Problem97.ATailMinimalUniqueFourCover.false_of_centerAt_selectedFourClass_inter_card_ge_three
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_commonRadius_equalCenters_noncanonicalSameCap_packet
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_sameCapCrossRowAlignment
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshThird_commonRadius_distinctCaps_survivingRow
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.selectedSupports_inter_eq_sources_of_mutualCrossMembership_distinctBlockers
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.blockerVertex_eq_one_of_mutualPair_of_selectedRow_contains_sources
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_mutualBlockerCapIndices_distinct
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.freshThird_acyclic_canonical_consumerPacket
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_commonRadius_mutualCrossMembership
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.mutualCrossMembership_or_oneSidedDeletionSurvival
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_mutualCrossMembership_distinctBlockers
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_sameBlockerAllEndpointOmission
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_oneSidedDeletionSurvival
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_collisionFiveCenterDeletion
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_outsidePairDeletionExactRows
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_firstFiber_crossedThreeRowExactSupports
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_freshCanonicalRowOverride
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber_viaAcyclicIngress
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_core_commonRadius
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.scratch_nonHit_namedRow_localAlternative
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.scratch_interaction_namedRow_localAlternative
#print axioms Problem97.ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion_of_selectedFourClass
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_freshThird_qRow_cardMinimalBlockingSubdeletion
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.qRow_cardMinimalBlockingSubdeletion_card_eq_one_of_center_eq
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.selectedRow_inter_card_ge_three_of_blocked_deletions
#print axioms Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.exists_selectedRow_overlap_card_ge_three_of_blocked_deletions
