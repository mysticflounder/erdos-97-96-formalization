      have hcard := firstApex_marginal_inter_secondClass_card_le_one
        D S radius rho
      rw [Finset.card_le_one] at hcard
      have huv : u.1 = v.1 := hcard u.1 huHit v.1 hvHit
      exact (huNeV (Subtype.ext huv)).elim
    · exact Or.inr (Or.inr
        ⟨huFirst,
          b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass
            R hvFirst⟩)
  · have huOutside :=
      b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass R huFirst
    by_cases hvFirst : v.1 ∈ SelectedClass D.A S.oppApex1 radius
    · exact Or.inr (Or.inl
        ⟨huOutside, hvFirst⟩)
    · have hvOutside :=
        b1_source_mem_outsideFirstApexFiber_of_not_mem_firstApexClass R hvFirst
      by_cases hsurvives :
          HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt u.1 u.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt v.1 v.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt v.1 v.2)
      · exact Or.inl ⟨huOutside, hvOutside, hsurvives⟩
      · exfalso
        have huBad : u ∈ interiorPairBadOutsideSources R := by
          refine Finset.mem_filter.mpr ⟨huOutside, ?_⟩
          exact ⟨(by intro hq; exact hsurvives (Or.inl hq)),
            (by intro hw; exact hsurvives (Or.inr (Or.inl hw)))⟩
        have hvBad : v ∈ interiorPairBadOutsideSources R := by
          refine Finset.mem_filter.mpr ⟨hvOutside, ?_⟩
          exact ⟨(by
              intro hq
              exact hsurvives (Or.inr (Or.inr (Or.inl hq)))),
            (by
              intro hw
              exact hsurvives (Or.inr (Or.inr (Or.inr hw))))⟩
        have huEntry : u ∈
            (interiorPairBadOutsideSources R).filter fun source =>
              source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
                source.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
          Finset.mem_filter.mpr ⟨huBad, ⟨huClass, huInterior⟩⟩
        have hvEntry : v ∈
            (interiorPairBadOutsideSources R).filter fun source =>
              source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
                source.1 ∈ S.capInteriorByIndex S.oppIndex2 :=
          Finset.mem_filter.mpr ⟨hvBad, ⟨hvClass, hvInterior⟩⟩
        have hcard := interiorPairBad_secondClassInterior_card_le_one
          R surface.secondApex_robust (rho := rho)
        rw [Finset.card_le_one] at hcard
        exact huNeV (hcard u huEntry v hvEntry)

/-/ A strict second-cap source with the retained deletion-survival witness
    supplies the complete ingress record needed by the rigid `2+2+1`
    consumer.  This is deliberately a producer theorem: it packages the
    source-clean five-point and omitted-peer arguments, but it does not claim
    the downstream coordinator is sorry-free. -/
theorem exists_exactFourMutualOmissionSourceContext_of_fivePointInteriorSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (source : CarrierVertex D.A)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    ∃ other u v : CarrierVertex D.A,
      ∃ jointDeletion : ExactFourMutualOmissionJointDeletion R rho u v,
        u ≠ v ∧
        u.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        v.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support ∧
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support ∧
        ExactFourMutualOmissionSourceContext R rho source other u v := by
  classical
  have hlateCross :=
    actualLateRow_secondClassInterior_card_le_two
      R surface source hsourceClass hsourceInterior
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior, hotherOmitted,
      hblockersNe⟩
  rcases
      exists_mutuallyOmittedSecondClassPair
        R surface source hfive hsourceClass with
    ⟨u, v, huNeV, huClass, hvClass, hvOmitted, huOmitted,
      hsourceMemURow, hvOmittedSourceRow, huEqSourceOrOmitted⟩
  have hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2 := by
    intro hcenters
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) u.2 v.2 hcenters
    apply hvOmitted
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.q_mem_support
  obtain ⟨jointDeletion⟩ :=
    nonempty_exactFourMutualOmissionJointDeletion
      R surface rho hfive u v hblockersUVNe
  let context : ExactFourMutualOmissionSourceContext R rho source other u v := {
    source_mem_class := hsourceClass
    source_mem_interior := hsourceInterior
    source_mem_outside := hsourceOutside
    source_cross_card_le_two := hlateCross
    other_ne_source := hotherNe
    other_mem_class := hotherClass
    other_mem_interior := hotherInterior
    other_not_mem_source_row := hotherOmitted
    source_other_blockers_ne := hblockersNe
    source_survives_q_or_w := hsurvives
    source_mem_u_row := hsourceMemURow
    v_not_mem_source_row := hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := huEqSourceOrOmitted
  }
  exact
    ⟨other, u, v, jointDeletion, huNeV, huClass, hvClass,
      hvOmitted, huOmitted, context⟩

/-- The collision arm of the two-deletion residue.  The two distinct deleted
class sources have the same actual blocker, hence their canonical selected
supports agree and meet the physical second-apex class in exactly those two
sources.  Support equality, cross-membership, and the exact intersection count
are deliberately reconstructed inside this leaf from the two deletion packets,
their distinctness, the robust surface, and blocker equality. -/
theorem false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
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
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2) :
    False := by
  sorry

/-- Two distinct deleted sources cannot lie in one another's actual rows when
their actual blockers are distinct from each other and from the physical apex. -/
theorem false_of_exactFour_twoDeletion_blockerTwoCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {u v : CarrierVertex D.A}
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeApex :
