
private theorem capByIndex_oppIndex2_eq_oppCap2_sourceHeavy
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Exhaustive physical-second-cap profile below the source-heavy
`other = xv` placement.  The exact-five constructors retain the full
carrier-cardinality budget belonging to their robust-growth arm. -/
inductive ExactFourRigid221SourceHeavyOtherXvCapProfile
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | secondOppositeLarge
      (secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card)
      (secondInterior_card_ge_four :
        4 ≤ (S.capInteriorByIndex S.oppIndex2).card)
      (robust_growth : ExactFourRobustCapGrowth S)
  | secondOppositeExactFiveSurplusGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
      (surplus_first_card_add_two_eq_carrier :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card)
      (surplus_first_card_ge_ten :
        10 ≤ S.surplusCap.card + S.oppCap1.card)
  | secondOppositeExactFiveFirstGrowth
      (secondOppCap_card_eq_five : S.oppCap2.card = 5)
      (secondInterior_card_eq_three :
        (S.capInteriorByIndex S.oppIndex2).card = 3)
      (profile : ExactFourFirstOppositeCapGrowth S)
      (firstOppCap_card_add_seven_eq_carrier :
        S.oppCap1.card + 7 = D.A.card)

/-- The robust-cap-growth trichotomy, specialized to the physical second cap,
is an arithmetic consequence of the complete production context. -/
theorem exactFourRigid221_sourceHeavyOtherXv_capProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ExactFourRigid221SourceHeavyOtherXvCapProfile S := by
  have hinteriorCard :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2_sourceHeavy S] at hinteriorCard
  by_cases hsecond : 6 ≤ S.oppCap2.card
  · exact .secondOppositeLarge hsecond (by omega) P.surface.capGrowth
  have hsecondEq : S.oppCap2.card = 5 := by
    have hfive := P.surface.secondOppCap_card_ge_five
    omega
  have hinteriorEq :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    omega
  rcases P.surface.capGrowth with hsurplus | hfirst | hsecondGrowth
  · have hbudget :
        S.surplusCap.card + S.oppCap1.card + 2 = D.A.card := by
      have hsum := S.capSum
      omega
    exact .secondOppositeExactFiveSurplusGrowth
      hsecondEq hinteriorEq hsurplus hbudget (by
        have hcard := P.hcard
        omega)
  · have hcarrier :
        S.oppCap1.card + 7 = D.A.card := by
      have hsum := hfirst.oppositeCaps_card_add_two_eq_carrier
      omega
    exact .secondOppositeExactFiveFirstGrowth
      hsecondEq hinteriorEq hfirst hcarrier
  · exact (hsecond hsecondGrowth.secondOppCap_card_ge_six).elim

/-- The complete point placement forced by the exact-five physical-second-cap
arms.  The three named interior points exhaust the physical second-cap
interior, while `v` and the rigid deleted point occupy opposite adjacent
caps.  This packet is derived from the live source-heavy hypotheses alone and
is independent of the robust-cap-growth profile, so both the first-growth and
surplus-growth exact-five arms produce it. -/
structure ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P) :
    Prop where
  secondOppCap_card_eq_five : S.oppCap2.card = 5
  secondInterior_eq_named :
    S.capInteriorByIndex S.oppIndex2 =
      {P.u.1, packet.xu, packet.xv}
  v_not_mem_secondInterior :
    P.v.1 ∉ S.capInteriorByIndex S.oppIndex2
  deleted_not_mem_secondInterior :
    P.jointDeletion.deleted.1 ∉
      S.capInteriorByIndex S.oppIndex2
  other_point_eq_xv : P.other.1 = packet.xv
  source_blocker_eq_other_point :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 =
      P.other.1
  outside_adjacent_orientation :
    (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.jointDeletion.deleted.1 ∈
          S.rightAdjacentCapByIndex S.oppIndex2) ∨
      (P.jointDeletion.deleted.1 ∈
          S.leftAdjacentCapByIndex S.oppIndex2 ∧
        P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)

/-- Construct the exact-five placement packet directly from the source-heavy
row traces and cap arithmetic.  No growth-profile input is consumed. -/
theorem exactFourRigid221_sourceHeavyOtherXv_exactFivePlacement_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hother : P.other.1 = packet.xv)
    (hsecond : S.oppCap2.card = 5)
    (hinterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3) :
    ExactFourRigid221SourceHeavyOtherXvExactFivePlacementPacket P packet := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have huUSupport : P.u.1 ∈ Ku.support := by
    have hmem :
        P.u.1 ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      rw [show Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho =
            {P.u.1, packet.xu} by
        simpa [Ku] using packet.source_row_trace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuUSupport : packet.xu ∈ Ku.support := by
    have hmem :
        packet.xu ∈ Ku.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Ku, packet.source_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvVSupport : packet.xv ∈ Kv.support := by
    have hmem :
        packet.xv ∈ Kv.support ∩
          SelectedClass D.A S.oppApex2 P.rho := by
      simpa [Kv, packet.opposite_row_trace]
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : packet.xv ∉ Ku.support := by
    intro hxv
    have hcenter :
        (lateFirstApexSystem R).centerAt P.u.1 P.u.2 =
          packet.xv := by
      simpa [P.huSource] using packet.blocker_eq_xv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
            Ku.support) =
          (packet.xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hcenter
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hpairSubset :
      ({P.u.1, packet.xu} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.u.1, packet.xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [packet.source_pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have hxvInterior :
      packet.xv ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [← hother]
    exact P.context.other_mem_interior
  have htripleSubset :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
    · exact hxvInterior
  have huNeXv : P.u.1 ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact huUSupport
  have hxuNeXv : packet.xu ≠ packet.xv := by
    intro h
    apply hxvNotUSupport
    rw [← h]
    exact hxuUSupport
  have htripleCard :
      ({P.u.1, packet.xu, packet.xv} : Finset ℝ²).card = 3 := by
    simp [packet.xu_ne_u.symm, huNeXv, hxuNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, packet.xu, packet.xv} := by
    apply Eq.symm
    apply Finset.eq_of_subset_of_card_le htripleSubset
    rw [hinterior, htripleCard]
  have hvNotInterior :
      P.v.1 ∉ S.capInteriorByIndex S.oppIndex2 := by
    intro hvInterior
    rw [hinteriorEq] at hvInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hvInterior
    rcases hvInterior with hvu | hvxu | hvxv
    · apply P.huNeV
      apply Subtype.ext
      exact hvu.symm
    · apply P.hvOmitted
      rw [hvxu]
      exact hxuUSupport
    · exact packet.xv_ne_v hvxv.symm
  have hdeletedNotInterior :
      P.jointDeletion.deleted.1 ∉
        S.capInteriorByIndex S.oppIndex2 := by
    intro hdeletedInterior
    rw [hinteriorEq] at hdeletedInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedInterior
    rcases hdeletedInterior with hdu | hdxu | hdxv
    · apply P.jointDeletion.deleted_ne_u
      apply Subtype.ext
      exact hdu
    · apply P.jointDeletion.deleted_not_mem_uRow
      rw [hdxu]
      exact hxuUSupport
    · apply P.jointDeletion.deleted_not_mem_vRow
      rw [hdxv]
      exact hxvVSupport
  have houtsideAdjacentOrientation :
      (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
    let T :=
      SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho
    have hleftOne :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hrightOne :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hcover :
        T \ S.capInteriorByIndex S.oppIndex2 ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
      simpa [T] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex2 P.hrho
    have hvT : P.v.1 ∈ T := by
      simpa [T] using P.hvClass
    have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
      simpa [T] using P.jointDeletion.deleted_mem_class
    have hvOutside :
        P.v.1 ∈ T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hvT, hvNotInterior⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNotInterior⟩
    have hvLocation :
        P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hvOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hdeletedLocation :
        P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hdeletedOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hvNeDeleted :
        P.v.1 ≠ P.jointDeletion.deleted.1 := by
      intro h
      apply P.jointDeletion.deleted_ne_v
      apply Subtype.ext
      exact h.symm
    have hnotBothLeft :
        ¬ (P.v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvLeft, hdeletedLeft⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvLeft⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedLeft⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    have hnotBothRight :
        ¬ (P.v.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hvRight, hdeletedRight⟩
      have hpairSubset :
          ({P.v.1, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hvT, hvRight⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedRight⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({P.v.1, P.jointDeletion.deleted.1} :
            Finset ℝ²).card = 2 := by
        simp [hvNeDeleted]
      omega
    rcases hvLocation with hvLeft | hvRight <;>
      rcases hdeletedLocation with hdeletedLeft | hdeletedRight
    · exact (hnotBothLeft ⟨hvLeft, hdeletedLeft⟩).elim
    · exact Or.inl ⟨hvLeft, hdeletedRight⟩
    · exact Or.inr ⟨hdeletedLeft, hvRight⟩
    · exact (hnotBothRight ⟨hvRight, hdeletedRight⟩).elim
  exact
    { secondOppCap_card_eq_five := hsecond
      secondInterior_eq_named := hinteriorEq
      v_not_mem_secondInterior := hvNotInterior
      deleted_not_mem_secondInterior := hdeletedNotInterior
      other_point_eq_xv := hother
      source_blocker_eq_other_point := by
        calc
          (lateFirstApexSystem R).centerAt
              P.source.1 P.source.2 =
            packet.xv := packet.blocker_eq_xv
          _ = P.other.1 := hother.symm
      outside_adjacent_orientation :=
        houtsideAdjacentOrientation }

/-- Large physical-second-cap residual of the source-heavy arm — the single
surviving placement leaf after the exact-five arms are closed.  The strict
second-cap interior contains the named triple `u`, `xu`, `xv` together with
at least one further class point, and the retained contextual peer is
unconstrained.  The source-heavy packet determines the blocker-row,
blocker-inequality, and `xv`-interior facts, while the source context carries
the robust growth data, so the terminal interface retains only the packet and
the genuinely branch-specific large-cap witness. -/
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (_packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (_hsecond : 6 ≤ S.oppCap2.card) :
    False := by
  sorry

/-- Two distinct points of the physical second class whose late rows contain
each other have equal blocker centers: the second apex and both centers are
equidistant from the pair, and the convex-position perpendicular-bisector
bound admits at most two such carrier points besides the apex. -/
theorem
    blocker_centers_eq_of_physicalSecondRadius_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    {x y : ℝ²}
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex2 P.rho)
    (hyx :
      y ∈ ((lateFirstApexSystem R).selectedAt
        x hxA).toCriticalFourShell.support)
    (hxy' :
      x ∈ ((lateFirstApexSystem R).selectedAt
        y hyA).toCriticalFourShell.support) :
    (lateFirstApexSystem R).centerAt x hxA =
      (lateFirstApexSystem R).centerAt y hyA := by
  classical
  let Hlate := lateFirstApexSystem R
  let cx := Hlate.centerAt x hxA
  let cy := Hlate.centerAt y hyA
  let o := S.oppApex2
