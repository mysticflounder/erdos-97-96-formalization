          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v) :
    False := by
  classical
  by_cases hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5
  · rcases
      exactFourMutualOmissionJointDeletion_exactFive_strongSplit
        R surface rho hclassFive u v jointDeletion with
      hsecond | hrigid
    · rcases hsecond with ⟨second, hdeletedNe⟩
      exact
        false_of_twoDistinctExactFourMutualOmissionJointDeletions
          R _hcard surface rho _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          second jointDeletion hdeletedNe
    · exact
        false_of_exactFourMutualOmissionRigid221
          R _hcard surface rho source other _hrho _hfive u v _huNeV
          _huClass _hvClass _hvOmitted _huOmitted
          context jointDeletion hclassFive hrigid
  · have hsix :
        6 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
      omega
    obtain ⟨first, second, hdeletedNe⟩ :=
      exists_two_exactFourMutualOmissionJointDeletions
        R surface rho hsix u v jointDeletion.blockers_ne
    exact
      false_of_twoDistinctExactFourMutualOmissionJointDeletions
        R _hcard surface rho _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted
        first second hdeletedNe

/-- The mutually omitted-pair residue of the five-point-radius branch.  It
retains the preceding strict-cap omitted peer and, in addition, two physical
second-apex class sources absent from one another's actual late rows.  Both
cross deletions therefore preserve K4, and the actual blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (_hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hsourceOutside : source ∈ outsideFirstApexFiber R)
    (_hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (_hotherNe : other ≠ source)
    (_hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (_hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (_hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2))
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
    (_hsourceMemURow :
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_hvOmittedSourceRow :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (_huEqSourceOrOmitted :
      u = source ∨
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support)
    (_hblockersUVNe :
      (lateFirstApexSystem R).centerAt u.1 u.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2))
    (_hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2)) :
    False := by
  let context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v := {
    source_mem_class := _hsourceClass
    source_mem_interior := _hsourceInterior
    source_mem_outside := _hsourceOutside
    source_cross_card_le_two := _hlateCross
    other_ne_source := _hotherNe
    other_mem_class := _hotherClass
    other_mem_interior := _hotherInterior
    other_not_mem_source_row := _hotherOmitted
    source_other_blockers_ne := _hblockersNe
    source_survives_q_or_w := _hsurvives
    source_mem_u_row := _hsourceMemURow
    v_not_mem_source_row := _hvOmittedSourceRow
    u_eq_source_or_not_mem_source_row := _huEqSourceOrOmitted
  }
  rcases
      nonempty_exactFourMutualOmissionJointDeletion
        R surface rho _hfive u v _hblockersUVNe with
    ⟨jointDeletion⟩
  exact
    false_of_exactFourMutualOmissionJointDeletion
      R _hcard surface rho source other _hrho _hfive u v _huNeV
        _huClass _hvClass _hvOmitted _huOmitted context jointDeletion

/-- The asymmetric strict-cap omitted peer forces a stronger whole-class
normal form: among the five physical second-apex class sources, two are
mutually omitted.  This checked wrapper is the one-child narrowing from the
former omitted-peer obligation to the mutual-omission obligation above. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (other : CarrierVertex D.A)
    (hotherNe : other ≠ source)
    (hotherClass :
      other.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hotherInterior :
      other.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hotherOmitted :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
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
  have huSurvivesDeleteV :
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
        ((lateFirstApexSystem R).centerAt u.1 u.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) u.2).mpr hvOmitted
  have hvSurvivesDeleteU :
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
        ((lateFirstApexSystem R).centerAt v.1 v.2) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      (lateFirstApexSystem R) v.2).mpr huOmitted
  exact
    false_of_exactFourPostCardElevenInteriorDeletionMutualOmissionBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives u v huNeV huClass hvClass
        hvOmitted huOmitted hsourceMemURow hvOmittedSourceRow
        huEqSourceOrOmitted hblockersUVNe huSurvivesDeleteV
        hvSurvivesDeleteU

/-- The bounded-cross-incidence residue supplies a named strict-cap peer
outside the active late row.  Equality of the two actual blockers would make
their canonical supports equal, so the peer's own-row membership proves the
blockers are distinct. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2)
    (hsourceOutside : source ∈ outsideFirstApexFiber R)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2))
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    False := by
  rcases
      exists_omittedSecondClassInteriorPeer
        R source hrho hfive hlateCross with
    ⟨other, hotherNe, hotherClass, hotherInterior,
      hotherOmitted, hblockersNe⟩
  exact
    false_of_exactFourPostCardElevenInteriorDeletionOmittedPeerBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside hlateCross other hotherNe hotherClass hotherInterior
        hotherOmitted hblockersNe hsurvives

/-- The five-point-radius branch reduces to its bounded-cross-incidence
residue: three physical strict-cap hits in the actual late row are already
ruled out by two-center cap localization and the ordered-cap row bound. -/
theorem false_of_exactFourPostCardElevenInteriorDeletionBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
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
    False := by
  exact
    false_of_exactFourPostCardElevenInteriorDeletionLowCrossBranch
      R hcard surface rho source hrho hfive hsourceClass hsourceInterior
        hsourceOutside
        (actualLateRow_secondClassInterior_card_le_two
          R surface source hsourceClass hsourceInterior)
        hsurvives

/-- The no-five two-distinct-radii branch of the post-card-eleven robust
exact-four terminal.  It retains the two disjoint exact rows and their radius
identifications.  Positivity, exact class cardinalities, and the strict-second-
cap lower bounds are reconstructed from those rows and the no-five packet. -/
theorem false_of_exactFourPostCardElevenTwoRadiusBranch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (_hradii : otherRadius ≠ rho)
    (_hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (_hfirstRadius : firstRow.radius = rho)
    (_hsecondRadius : secondRow.radius = otherRadius)
    (_hdisjoint : Disjoint firstRow.support secondRow.support) :
    False := by
  sorry

/-- The narrowed post-card-eleven robust exact-four terminal.  Its checked
radius normal form now dispatches directly to two load-bearing branch
obligations: the surviving interior-deletion branch and the no-five
two-distinct-radii branch. -/
theorem false_of_exactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    False := by
  rcases interiorPairGood_or_twoDistinctExactFourInteriorRows R surface with
    ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
      hsourceOutside, hsurvives⟩ |
      ⟨rho, otherRadius, firstRow, secondRow, hrho, hother, hradii,
        hnoFive, hcardRho, hcardOther, hfirstRadius, hsecondRadius,
        hdisjoint, hinterior, hinteriorOther⟩
  · exact
      false_of_exactFourPostCardElevenInteriorDeletionBranch
        R hcard surface rho source hrho hfive hsourceClass hsourceInterior
          hsourceOutside hsurvives
