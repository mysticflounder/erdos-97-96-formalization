import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

namespace TwoSourceExactCollisionRowsTerminal

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Frho : CriticalPairFrontier D S rho H}
    {Rrho : FrontierCommonDeletionParentResidual Frho}
    (Prho : RetainedInteriorBlockerCollision Rrho)

inductive DesignFreshThirdCapSourceNonHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Prho) : Prop where
  | sameBlocker
      (center_eq :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2)
      (support_eq :
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support)
  | sourceRowOmission
      (deleted : CriticalShellSystem.CarrierVertex D.A)
      (deleted_eq : deleted = Q.source₁ ∨ deleted = Q.source₂)
      (deleted_not_mem :
        deleted.1 ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support)
      (deletion_survives :
        HasNEquidistantPointsAt 4 (D.A.erase deleted.1)
          (H.centerAt source.1 source.2))

theorem designNonHit_of_not_crossRowHit
    (source : CriticalShellSystem.CarrierVertex D.A)
    (Q : FreshThirdBlockerFiber P Prho)
    (interaction : FreshThirdCapSourceInteraction P Prho source Q)
    (hnot : ¬ FreshThirdCrossRowHit P Prho source Q) :
    DesignFreshThirdCapSourceNonHit P Prho source Q := by
  cases interaction with
  | sameBlocker center_eq support_eq =>
      exact .sameBlocker center_eq support_eq
  | sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives =>
      exact .sourceRowOmission deleted deleted_eq deleted_not_mem deletion_survives
  | distinctBlockersDifferentCaps centers_ne source₁_mem source₂_mem
      _ _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim
  | sameCapWithInternalFiberSource centers_ne source₁_mem source₂_mem
      _ _ _ _ _ =>
      exact (hnot ⟨centers_ne, source₁_mem, source₂_mem⟩).elim

/-- Design-only strengthening: the equal-center arm retains the two positive
cross-row hits used to reach it. -/
inductive StrictFreshThirdNormalizedResidualCase
    (C : TwoCapSourceThirdCanonicalRowSurface P Prho)
    (Q : FreshThirdBlockerFiber P Prho) : Prop where
  | firstNonHit
      (data : DesignFreshThirdCapSourceNonHit P Prho C.firstSource Q)
  | secondNonHit
      (data : DesignFreshThirdCapSourceNonHit P Prho C.secondSource Q)
  | equalCrossRowCenters
      (first_hit : FreshThirdCrossRowHit P Prho C.firstSource Q)
      (second_hit : FreshThirdCrossRowHit P Prho C.secondSource Q)
      (centers_eq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2)

theorem strictCase_of_crossRowResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Prho)
    (Q : FreshThirdBlockerFiber P Prho)
    (firstInteraction :
      FreshThirdCapSourceInteraction P Prho C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Prho C.secondSource Q)
    (hresidual :
      FreshThirdCrossRowResidual P Prho C.firstSource C.secondSource Q) :
    StrictFreshThirdNormalizedResidualCase P Prho C Q := by
  by_cases hfirst : FreshThirdCrossRowHit P Prho C.firstSource Q
  · by_cases hsecond : FreshThirdCrossRowHit P Prho C.secondSource Q
    · have hcenters :
          H.centerAt C.firstSource.1 C.firstSource.2 =
            H.centerAt C.secondSource.1 C.secondSource.2 := by
        rcases hresidual with hnotFirst | hnotSecond | hcenters
        · exact (hnotFirst hfirst).elim
        · exact (hnotSecond hsecond).elim
        · exact hcenters
      exact .equalCrossRowCenters hfirst hsecond hcenters
    · exact .secondNonHit
        (designNonHit_of_not_crossRowHit
          (P := P) (Prho := Prho) C.secondSource Q secondInteraction hsecond)
  · exact .firstNonHit
      (designNonHit_of_not_crossRowHit
        (P := P) (Prho := Prho) C.firstSource Q firstInteraction hfirst)

/-- The positive equal-center arm gives one common exact support and mutual
incidence of the two cap sources. -/
theorem mutualCrossMembership_of_equalCrossRowCenters
    (C : TwoCapSourceThirdCanonicalRowSurface P Prho)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    TwoCapSourcesMutualCrossMembership (H := H)
      C.firstSource C.secondSource := by
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H C.firstSource.2 C.secondSource.2 hcenters
  constructor
  · rw [hsupports]
    exact C.secondSource_data.2.2.2.2.2.2.2.1
  · rw [← hsupports]
    exact C.firstSource_data.2.2.2.2.2.2.2.1

/-- With the two positive hits retained, the common cap-source row is exactly
the four named source points. -/
theorem selectedSupport_eq_fourSources_of_equalCrossRowCenters
    (C : TwoCapSourceThirdCanonicalRowSurface P Prho)
    (Q : FreshThirdBlockerFiber P Prho)
    (hfirst : FreshThirdCrossRowHit P Prho C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Prho C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.support =
      {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1} := by
  classical
  let K :=
    (H.selectedAt C.firstSource.1
      C.firstSource.2).toCriticalFourShell.support
  let named : Finset ℝ² :=
    {C.firstSource.1, C.secondSource.1, Q.source₁.1, Q.source₂.1}
  have hsupports :=
    ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
      H C.firstSource.2 C.secondSource.2 hcenters
  have hqcenters :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 := by
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val Q.blockers_eq
  have hfirstNeQ₁ : C.firstSource.1 ≠ Q.source₁.1 := by
    intro hval
    apply hfirst.1
    have hsub : C.firstSource = Q.source₁ := Subtype.ext hval
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val (congrArg H.blockerVertex hsub)
  have hfirstNeQ₂ : C.firstSource.1 ≠ Q.source₂.1 := by
    intro hval
    apply hfirst.1
    have hsub : C.firstSource = Q.source₂ := Subtype.ext hval
    rw [hsub]
    exact hqcenters.symm
  have hsecondNeQ₁ : C.secondSource.1 ≠ Q.source₁.1 := by
    intro hval
    apply hsecond.1
    have hsub : C.secondSource = Q.source₁ := Subtype.ext hval
    simpa [CriticalShellSystem.blockerVertex] using
      congrArg Subtype.val (congrArg H.blockerVertex hsub)
  have hsecondNeQ₂ : C.secondSource.1 ≠ Q.source₂.1 := by
    intro hval
    apply hsecond.1
    have hsub : C.secondSource = Q.source₂ := Subtype.ext hval
    rw [hsub]
    exact hqcenters.symm
  have hqNe : Q.source₁.1 ≠ Q.source₂.1 := by
    intro hval
    exact Q.sources_ne (Subtype.ext hval)
  have hnamedCard : named.card = 4 := by
    simp [named, C.sources_ne, hfirstNeQ₁, hfirstNeQ₂,
      hsecondNeQ₁, hsecondNeQ₂, hqNe]
  have hnamedSubset : named ⊆ K := by
    intro z hz
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl | rfl
    · exact C.firstSource_data.2.2.2.2.2.2.2.1
    · change C.secondSource.1 ∈
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support
      rw [hsupports]
      exact C.secondSource_data.2.2.2.2.2.2.2.1
    · exact hfirst.2.1
    · exact hfirst.2.2
  have hKCard : K.card = 4 :=
    C.firstSource_data.2.2.2.2.2.2.2.2.1
  change K = named
  exact
    (Finset.eq_of_subset_of_card_le hnamedSubset (by omega)).symm

end TwoSourceExactCollisionRowsTerminal
end Problem97.ATailFrontierLiveClosure
