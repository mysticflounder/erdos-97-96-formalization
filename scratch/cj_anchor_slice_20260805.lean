      ((H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_eq_radius
        O.deleted hdeletedShell).symm
  have happA : S.oppApex1 ∈ D.A :=
    oppApex1_mem_A_for_reverseHit S
  have happOffCap : S.oppApex1 ∉ S.capByIndex S.oppIndex1 :=
    oppApex1_not_mem_capByIndex_oppIndex1_for_reverseHit S
  have happOff : S.oppApex1 ∉ Finset.univ.image L.points := by
    intro happImage
    apply happOffCap
    rw [← hcap]
    exact happImage
  rcases hbetween with hrjs | hsjr
  · have hprod :
        signedArea2 S.oppApex1 (L.points r) (L.points s) *
            signedArea2 (L.points j) (L.points r) (L.points s) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hrjs.1 hrjs.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points r) (y := L.points s)
      (by simpa only [hr, hs] using hp)
      (by simpa only [hj, hr, hs] using hq)
      (by simpa only [hr, hs] using O.sources_ne)
      hprod
    simpa only [hj, hr] using hacute
  · have hprod :
        signedArea2 S.oppApex1 (L.points s) (L.points r) *
            signedArea2 (L.points j) (L.points s) (L.points r) < 0 :=
      CGN.signedArea_product_neg_of_between_and_off_cap D.convex Packet Hord
        hsjr.1 hsjr.2 happA happOff
    have hacute := two_center_two_hit_sqdist_acute_of_signedArea_opposite
      (p := S.oppApex1) (q := L.points j) (x := L.points s) (y := L.points r)
      (by simpa only [hr, hs] using hp.symm)
      (by simpa only [hj, hr, hs] using hq.symm)
      (by simpa only [hr, hs] using O.sources_ne.symm)
      hprod
    simpa only [hj, hr, hs, hp, hq] using hacute

/-- The two-arm E normal form is source-clean: it only composes checked
common-deletion, orientation, reverse-coupling, and fresh-third producers. -/
theorem nonempty_retainedOmissionAllLargeNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorDirectedOmission R)
    (hfirstLarge : 5 ≤ (S.capByIndex S.oppIndex1).card) :
    Nonempty (RetainedOmissionAllLargeNormalForm P) := by
  rcases nonempty_retainedInteriorCommonDeletion P with ⟨C⟩
  rcases nonempty_orientedRetainedCommonDeletion P C with ⟨O⟩
  rcases nonempty_retainedReverseCouplingOutcome O with ⟨Q⟩
  cases Q with
  | pairedCommonDeletion reverse_omission reversePacket =>
      exact ⟨.pairedCommonDeletion O reverse_omission reversePacket⟩
  | reverseHit reverse_mem reverseBlocker_mem_capInterior reverseShell_inter_cap_eq =>
      rcases exists_fresh_firstCap_commonDeletion_of_reverseHit
          O reverseShell_inter_cap_eq hfirstLarge with
        ⟨fresh, fresh_mem_capInterior, fresh_ne_kept, fresh_ne_deleted,
          fresh_not_mem_reverseShell, ⟨freshPacket⟩⟩
      exact ⟨.reverseHitFreshCommonDeletion O reverse_mem
        reverseBlocker_mem_capInterior reverseShell_inter_cap_eq fresh
        fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted
        fresh_not_mem_reverseShell freshPacket⟩

/- The indexed context consumed by the E1 core.  The old residual chain is
flattened here once; the core need not repeatedly distinguish the surplus and
the two named opposite roles. -/
structure TriApexAllLargeContext
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  cap_card_ge_six :
    ∀ i : Fin 3, 6 ≤ (S.capByIndex i).card
  apex_rich :
    ∀ i : Fin 3,
      ApexRichClassStructure D.A
        (S.oppositeVertexByIndex i)
  notRobustCover_card :
    D.A.card ≤ 4 * (notRobustCenters D).card
  no_center_covers_all_apices :
    ∀ p ∈ D.A, ∀ r : ℝ, 0 < r →
      ¬ (S.triangle.v1 ∈ SelectedClass D.A p r ∧
        S.triangle.v2 ∈ SelectedClass D.A p r ∧
        S.triangle.v3 ∈ SelectedClass D.A p r)

private theorem capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppIndex1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppIndex2, hi]

private theorem capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem triApexAllLargeContext_index_cases
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    i = S.oppIndex1 ∨ i = S.oppIndex2 ∨ i = S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  fin_cases i <;>
    interval_cases j <;>
      simp [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]

/-- Build the indexed E1 context from the existing residual bundle. -/
theorem triApexAllLargeContext_of_residuals
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    TriApexAllLargeContext D S := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rw [capByIndex_oppIndex1_eq_oppCap1_for_triApexAllLargeContext]
    exact L.firstOppCap_card_ge_six
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rw [capByIndex_oppIndex2_eq_oppCap2_for_triApexAllLargeContext]
    exact L.secondOppCap_card_ge_six
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rw [capByIndex_surplusIdx_eq_surplusCap_for_triApexAllLargeContext]
    exact N.surplusCap_card_ge_six
  refine {
    cap_card_ge_six := ?_
    apex_rich := ?_
    notRobustCover_card := T.notRobustCover_card
    no_center_covers_all_apices := T.no_center_covers_all_apices }
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · exact hcap1
    · exact hcap2
    · exact hsurplus
  · intro i
    rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
    · simpa using T.oppApex1_rich
    · simpa using T.oppApex2_rich
    · simpa using T.surplusApex_rich

/-- Every canonical critical-shell center lies in one of the three strict cap
interiors once all three opposite apices are rich.  Richness makes every Moser
apex deletion robust, whereas a critical-shell center is unique-four; the cap
partition then leaves only the three strict interiors. -/
theorem exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3, H.centerAt x hx ∈ S.capInteriorByIndex i := by
  have hunique : IsUniqueFourCenter D.A (H.centerAt x hx) :=
    isUniqueFourCenter_centerAt H x hx
  have hcenterNe (i : Fin 3) :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
        (by simpa [hcenter] using hunique)
  have hcenterA : H.centerAt x hx ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt x hx).toCriticalFourShell.center_mem
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcenterA with
    htriangle | hcap
  · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · exact False.elim ((hcenterNe S.surplusIdx) hsurplus)
    · exact False.elim ((hcenterNe S.oppIndex1) hfirst)
    · exact False.elim ((hcenterNe S.oppIndex2) hsecond)
  · exact hcap

/-- Source-faithful global form of the cross-cap one-hit rule.  Every
canonical critical shell has a strict-cap location, and in every other rich
cap it meets each interior radius slice in at most one point. -/
theorem exists_criticalShell_center_with_otherRichCapSlice_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ i : Fin 3,
      H.centerAt x hx ∈ S.capInteriorByIndex i ∧
      ∀ j : Fin 3, i ≠ j → ∀ r : ℝ,
        ((H.selectedAt x hx).toCriticalFourShell.support ∩
          (SelectedClass D.A (S.oppositeVertexByIndex j) r ∩
            S.capInteriorByIndex j)).card ≤ 1 := by
  rcases
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G hx with
    ⟨i, hcenter⟩
  refine ⟨i, hcenter, ?_⟩
  intro j hij r
  exact criticalShell_inter_otherRichCapSlice_card_le_one
    hx hcenter hij (G.apex_rich j) r

/- A residual-independent form of the source-faithful cover ingress.  The
   endpoint leaves already carry `TriApexAllLargeContext`; requiring the
   older nested residual chain here only obscures the available source data. -/
theorem exists_globalK4Row_and_sourceFaithfulCriticalCover_of_triApexAllLargeContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    (q : CriticalShellSystem.CarrierVertex D.A) :
    Nonempty (SelectedFourClass D.A q.1) ∧
      Nonempty (CriticalSelectedFourClass D.A q.1
        (H.centerAt q.1 q.2)) ∧
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) ∧
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase q.1) (H.centerAt q.1 q.2) ∧
      H.centerAt q.1 q.2 ≠ S.oppApex1 ∧
      H.centerAt q.1 q.2 ≠ S.oppApex2 ∧
      H.centerAt q.1 q.2 ≠ S.surplusApex ∧
      ∃ i : Fin 3,
        H.centerAt q.1 q.2 ∈ S.capInteriorByIndex i := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 q.2 with ⟨Kq⟩
  have hcoverUnique :
      IsUniqueFourCenter D.A (H.centerAt q.1 q.2) :=
    isUniqueFourCenter_centerAt H q.1 q.2
  have hcoverNe (i : Fin 3) :
      H.centerAt q.1 q.2 ≠ S.oppositeVertexByIndex i := by
    intro hcenter
    exact
      not_isUniqueFourCenter_of_fullyDeletionRobust
          (fullyDeletionRobustAt_of_apexRichClassStructure (G.apex_rich i))
          (by simpa [hcenter] using hcoverUnique)
  have hcoverNe₁ :
      H.centerAt q.1 q.2 ≠ S.oppApex1 := by
    intro hcenter
    exact hcoverNe S.oppIndex1 (by simpa using hcenter)
  have hcoverNe₂ :
      H.centerAt q.1 q.2 ≠ S.oppApex2 := by
    intro hcenter
    exact hcoverNe S.oppIndex2 (by simpa using hcenter)
  have hcoverNe₃ :
      H.centerAt q.1 q.2 ≠ S.surplusApex := by
    intro hcenter
    exact hcoverNe S.surplusIdx (by simpa using hcenter)
  exact
    ⟨⟨Kq⟩, ⟨H.selectedAt q.1 q.2⟩, hcoverUnique,
      H.no_qfree_at q.1 q.2, hcoverNe₁, hcoverNe₂, hcoverNe₃,
      exists_criticalShell_center_mem_capInteriorByIndex_of_triApexAllLarge
        G q.2⟩

/-- Paired-common-deletion branch of the E1 geometric consumer.  Its inputs
are exactly the first constructor of `RetainedOmissionAllLargeNormalForm`, so
the remaining metric producer can be mined and formalized independently of
the fresh-third branch. -/
theorem false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reverse_omission :
      O.kept ∉
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (G : TriApexAllLargeContext D S) :
    False := by
  sorry

/-- The fresh reverse-hit branch is already a nonreturning two-step
common-deletion walk.  Hence its endpoint is classified by either an
origin-tagged blocker collision or three pairwise-distinct actual blockers;
the source-return constructor is ruled out by freshness. -/
theorem exists_reverseHitFresh_nonreturnEndpointClassification
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (freshPacket :
      CommonDeletionTwoCenterPacket
        D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) :
    ∃ W : RetainedMatchingTwoStepCommonDeletionWalk R,
      W.first = O.kept ∧ W.second = O.deleted ∧ W.next = fresh ∧
        (Nonempty (RetainedMatchingEndpointCriticalFiber W) ∨
          Nonempty (RetainedMatchingThreeDistinctBlockerPath W)) := by
  let W : RetainedMatchingTwoStepCommonDeletionWalk R := {
    first := O.kept
    second := O.deleted
    next := fresh
    first_mem_A := O.kept_mem_A
    second_mem_A := O.deleted_mem_A
    next_mem_A := freshPacket.q_mem_A
    first_ne_second := O.sources_ne
    second_ne_next := fresh_ne_deleted.symm
    first_mem_radius := O.kept_mem_radius
    second_mem_radius := O.deleted_mem_radius
    first_mem_capInterior := O.kept_mem_capInterior
    second_mem_capInterior := O.deleted_mem_capInterior
    firstPacket := O.packet
    secondPacket := freshPacket
    nextLocation := RetainedMatchingNextLocation.freshFirstCap
      fresh_mem_capInterior fresh_ne_kept fresh_ne_deleted }
  refine ⟨W, rfl, rfl, rfl, ?_⟩
  rcases nonempty_twoStepEndpointOutcome W with ⟨outcome⟩
  cases outcome with
  | sourceReturn next_eq_first =>
      exact False.elim (fresh_ne_kept (by simpa [W] using next_eq_first))
  | endpointCriticalFiber fiber => exact Or.inl ⟨fiber⟩
  | threeDistinctBlockers path => exact Or.inr ⟨path⟩

/-- Source-faithful data retained after the fresh reverse-hit branch has been
turned into its nonreturning two-step walk.  The endpoint leaves below receive
this whole context, so the endpoint split does not erase the reverse-shell
localization or any freshness hypothesis. -/
structure ReverseHitFreshEndpointContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P) : Type where
  reverse_mem :
    O.kept ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  reverseBlocker_mem_capInterior :
    H.centerAt O.deleted O.deleted_mem_A ∈
      S.capInteriorByIndex S.oppIndex1
  reverseShell_inter_cap_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {O.kept, O.deleted}
  fresh : ℝ²
  fresh_mem_capInterior :
    fresh ∈ S.capInteriorByIndex S.oppIndex1
  fresh_ne_kept : fresh ≠ O.kept
  fresh_ne_deleted : fresh ≠ O.deleted
  fresh_not_mem_reverseShell :
    fresh ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  freshPacket :
    CommonDeletionTwoCenterPacket
      D H fresh S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)
  allLarge : TriApexAllLargeContext D S
  walk : RetainedMatchingTwoStepCommonDeletionWalk R
  walk_first_eq : walk.first = O.kept
  walk_second_eq : walk.second = O.deleted
  walk_next_eq : walk.next = fresh

/-- The sole cyclic-order input still needed after an endpoint collision has
supplied a fresh first-apex row source.  All metric equalities and the final
cross incidence are kept outside this structure, so a producer of this packet
is exactly a producer of the six-point boundary placement
`O < A < X < J < C < K`. -/
structure EndpointFreshOrderedCrossRowPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (Q : EndpointFreshFirstApexRowSource E) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt Q.J Q.J_mem_A
  boundary_J : boundary iJ = Q.J
  boundary_C : boundary iC = Q.C
  boundary_K : boundary iK = Q.K

/-- The endpoint cross-hit arm is closed once its six named points occur in
the ordered placement `O < A < X < J < C < K`.  This is a proved adapter to
`OrderedCrossRowCore`; it introduces no new metric hypothesis. -/
theorem false_of_endpointFreshCrossHit_of_orderedPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    {Q : EndpointFreshFirstApexRowSource E}
    (placement : EndpointFreshOrderedCrossRowPlacement Q)
    (K_mem_J_shell :
      Q.K ∈ (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support) :
    False := by
  exact OrderedCrossRowCore.false {
    C := Q.C
    K := Q.K
    fiber_orientation := Q.fiber_orientation
