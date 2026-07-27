import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97.ATailFrontierLiveClosure

attribute [local instance] Classical.propDecidable

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

theorem four_mem_card_four_split
    {α : Type*} [DecidableEq α]
    {K : Finset α} {q a b c d : α}
    (hKcard : K.card = 4)
    (hq : q ∈ K)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    q = a ∨ q = b ∨ q = c ∨ q = d ∨
      a ∉ K ∨ b ∉ K ∨ c ∉ K ∨ d ∉ K := by
  by_cases hqa : q = a
  · exact Or.inl hqa
  by_cases hqb : q = b
  · exact Or.inr (Or.inl hqb)
  by_cases hqc : q = c
  · exact Or.inr (Or.inr (Or.inl hqc))
  by_cases hqd : q = d
  · exact Or.inr (Or.inr (Or.inr (Or.inl hqd)))
  by_cases ha : a ∈ K
  · by_cases hb : b ∈ K
    · by_cases hc : c ∈ K
      · by_cases hd : d ∈ K
        · exfalso
          have hsub : ({q, a, b, c, d} : Finset α) ⊆ K := by
            simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
              using And.intro hq
                (And.intro ha (And.intro hb (And.intro hc hd)))
          have hcardFive : ({q, a, b, c, d} : Finset α).card = 5 := by
            simp [hqa, hqb, hqc, hqd, hab, hac, had, hbc, hbd, hcd]
          have hle := Finset.card_le_card hsub
          omega
        · exact Or.inr (Or.inr (Or.inr (Or.inr
            (Or.inr (Or.inr (Or.inr hd))))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr
          (Or.inr (Or.inr (Or.inl hc))))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (Or.inr (Or.inl hb)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ha))))

theorem exactFour_fourSurvivingCenters_actualShell_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    :
    let q := first.deleted.1
    let a := S.oppApex2
    let bu := (lateFirstApexSystem R).centerAt u.1 u.2
    let bv := (lateFirstApexSystem R).centerAt v.1 v.2
    let br :=
      (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2
    let K :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support
    q = bu ∨ q = bv ∨ q = br ∨
      a ∉ K ∨ bu ∉ K ∨ bv ∉ K ∨ br ∉ K := by
  dsimp only
  let K :=
    ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell
  have hqNeA : first.deleted.1 ≠ S.oppApex2 := by
    intro hqa
    have hdist :
        dist S.oppApex2 first.deleted.1 = rho :=
      (mem_selectedClass.mp first.deleted_mem_class).2
    rw [hqa, dist_self] at hdist
    linarith
  have hsplit :=
    four_mem_card_four_split
      (K := K.support)
      (q := first.deleted.1)
      (a := S.oppApex2)
      (b := (lateFirstApexSystem R).centerAt u.1 u.2)
      (c := (lateFirstApexSystem R).centerAt v.1 v.2)
      (d := (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2)
      K.support_card
      K.q_mem_support
      first.uPacket.centers_ne.symm
      first.vPacket.centers_ne.symm
      hsecondBlockerNeApex.symm
      first.blockers_ne
      hsecondBlockerNeU.symm
      hsecondBlockerNeV.symm
  rcases hsplit with hqa | hqbu | hqbv | hqbr | ha | hbu | hbv | hbr
  · exact False.elim (hqNeA hqa)
  · exact Or.inl hqbu
  · exact Or.inr (Or.inl hqbv)
  · exact Or.inr (Or.inr (Or.inl hqbr))
  · exact Or.inr (Or.inr (Or.inr (Or.inl ha)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hbu))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl hbv)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr hbr)))))

/-- The cardinality split expressed in the form needed by the exact-four
closer: unless the deleted source is itself one of the three actual blockers,
one of the four surviving centers forms a two-way deletion-survival square
with the actual blocker of the deleted source. -/
theorem exactFour_fourSurvivingCenters_survivalSquare_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} (hrho : 0 < rho)
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2) :
    let q := first.deleted.1
    let a := S.oppApex2
    let bu := (lateFirstApexSystem R).centerAt u.1 u.2
    let bv := (lateFirstApexSystem R).centerAt v.1 v.2
    let br :=
      (lateFirstApexSystem R).centerAt
        second.deleted.1 second.deleted.2
    let bq :=
      (lateFirstApexSystem R).centerAt
        first.deleted.1 first.deleted.2
    q = bu ∨ q = bv ∨ q = br ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) a ∧
        HasNEquidistantPointsAt 4 (D.A.erase a) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bu ∧
        HasNEquidistantPointsAt 4 (D.A.erase bu) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) bv ∧
        HasNEquidistantPointsAt 4 (D.A.erase bv) bq) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase q) br ∧
        HasNEquidistantPointsAt 4 (D.A.erase br) bq) := by
  dsimp only
  have hsplit :=
    exactFour_fourSurvivingCenters_actualShell_split
      hrho first second
      hsecondBlockerNeU hsecondBlockerNeV hsecondBlockerNeApex
  rcases hsplit with hqbu | hqbv | hqbr | ha | hbu | hbv | hbr
  · exact Or.inl hqbu
  · exact Or.inr (Or.inl hqbv)
  · exact Or.inr (Or.inr (Or.inl hqbr))
  · exact Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₂,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr ha⟩)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.uPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbu⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl
      ⟨first.vPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbv⟩)))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr
      ⟨crossPacket.survives₁,
        (cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) first.deleted.2).mpr hbr⟩)))))

end Problem97.ATailFrontierLiveClosure
