    ATailFiveCenterDeletionBoundary.exists_faithfulCarrierPattern_with_fiveSurvivorClasses
      B.firstFive hc₀ hc₁ hc₂ hc₃ hc₄ hcenters

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The deleted point's blocked actual center is exactly the localized
no-q-free center required by the U3 fixed-triple extractor. -/
theorem SixSurvivorExactRowsBoundary.localizedNoQFreePacket
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅) :
    U3LocalizedNoQFreePacket D deleted.1
      (H.centerAt deleted.1 deleted.2) := by
  refine
    { q_mem := deleted.2
      p_mem_skeleton := mem_skeleton_of_mem_ne
        (H.blockerVertex deleted).2 B.firstFive.actualBlocker_ne_deleted
      no_qfree := ?_ }
  intro hfree
  exact B.firstFive.actualBlocker_fails
    (hasNEquidistantPointsAt_of_erase hfree)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every six-row deletion boundary produces a U3 dangerous triple and its
bounded audit frame.  The remaining terminal premise is rowwise confinement
of the audit-center classes, not construction of the U3 packet itself. -/
theorem SixSurvivorExactRowsBoundary.exists_fixedTripleAuditFrame
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    ∃ t₁ t₂ t₃ : ℝ²,
      Nonempty
        (U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃) := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.firstFive.actualBlocker_uniqueFour with
    ⟨hblockerMem, r, hr, hclassCard, -⟩
  have hK4 :
      HasNEquidistantPointsAt 4 D.A (H.centerAt deleted.1 deleted.2) :=
    ⟨r, hr, le_of_eq hclassCard.symm⟩
  rcases exists_u3FixedTriplePacket_of_k4_no_qfree
      P₃.q_mem hblockerMem B.firstFive.actualBlocker_ne_deleted hK4
      P₃.no_qfree with ⟨t₁, t₂, t₃, F₃⟩
  exact
    ⟨t₁, t₂, t₃,
      P₃.exists_fixedTripleAuditFrame_of_card_gt_nine F₃ hcard⟩

/-- Exact finite obstruction exposed by a fixed U3 audit frame: one bounded
audit center has either an exact q-deleted four-row escaping the bounded
support or an ambient critical four-shell through the deleted point. -/
abbrev SixSurvivorU3AuditObstruction
    (deleted : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ t₁ t₂ t₃ : ℝ²,
    ∃ F : U3FixedTripleAuditFrame D deleted.1
        (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
      ∃ x,
        x ∈ U5BoundedAuditCenters D deleted.1
          (H.centerAt deleted.1 deleted.2)
          ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
          ((∃ (B : Finset ℝ²) (z : ℝ²),
              Nonempty (U5QDeletedK4Class D deleted.1 x B) ∧
                B.card = 4 ∧
                z ∈ B ∧
                z ∉ U5BoundedSupport D deleted.1
                  (H.centerAt deleted.1 deleted.2)
                  ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1) ∨
            Nonempty (CriticalFourShell D.A deleted.1 x))

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The six-row boundary supplies the exact finite U3 obstruction consumed by
the source-faithful computational ingress. -/
theorem SixSurvivorExactRowsBoundary.exists_u3AuditObstruction
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    SixSurvivorU3AuditObstruction (H := H) deleted := by
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  rcases F.exists_qDeleted_escape_or_criticalFourShell with ⟨x, hx, hobs⟩
  exact ⟨t₁, t₂, t₃, F, x, hx, hobs⟩

/-- The U3 audit obstruction with the source-derived exact dangerous radius
and the resulting off-circle candidate attached to every escaping row.

This is stronger than `SixSurvivorU3AuditObstruction`, but it is still only an
obstruction packet: the critical-shell arm and an escaping candidate both need
a further universal consumer. -/
abbrev SixSurvivorU3ExactRadiusAuditObstruction
    (deleted : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ t₁ t₂ t₃ : ℝ²,
    ∃ F : U3FixedTripleAuditFrame D deleted.1
        (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
      (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
        dist (H.centerAt deleted.1 deleted.2) y =
          dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
        ∃ x,
          x ∈ U5BoundedAuditCenters D deleted.1
            (H.centerAt deleted.1 deleted.2)
            ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            ((∃ (B : Finset ℝ²) (z : ℝ²),
                Nonempty (U5QDeletedK4Class D deleted.1 x B) ∧
                  B.card = 4 ∧
                  z ∈ B ∧
                  z ∉ U5BoundedSupport D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
                  U5SelectedCandidateSkeleton D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) z ∧
                  dist (H.centerAt deleted.1 deleted.2) z ≠
                    dist (H.centerAt deleted.1 deleted.2) deleted.1) ∨
              Nonempty (CriticalFourShell D.A deleted.1 x))

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A six-row deletion boundary supplies the exact-radius U3 obstruction.
The proof only composes the localized no-q-free exactness theorem with the
existing escape-or-critical-shell producer. -/
theorem SixSurvivorExactRowsBoundary.exists_u3ExactRadiusAuditObstruction
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  rcases F.exists_qDeleted_escape_or_criticalFourShell with ⟨x, hx, hobs⟩
  refine ⟨t₁, t₂, t₃, F, hexact, x, hx, ?_⟩
  rcases hobs with hescape | hshell
  · left
    rcases hescape with ⟨Brow, z, ⟨K⟩, hBrowCard, hzBrow, hzOutside⟩
    have hcandidate :=
      F.dangerous.candidate_of_not_mem_boundedSupport
        K hzBrow hzOutside hexact
    exact
      ⟨Brow, z, ⟨K⟩, hBrowCard, hzBrow, hzOutside,
        hcandidate.1, hcandidate.2⟩
  · exact Or.inr hshell

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A uniform confinement theorem for the fixed-triple frame emitted by a
six-row boundary closes the boundary immediately.  This adapter isolates the
remaining universal producer: every such frame must confine all of its
q-deleted audit rows to its bounded support. -/
theorem SixSurvivorExactRowsBoundary.false_of_u3ExactRadiusAuditObstruction_of_rowwiseConfined
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card)
    (hconf :
      ∀ {t₁ t₂ t₃ : ℝ²}
        (F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃),
        F.RowwiseConfinedQDeletedClasses) : False := by
  rcases B.exists_u3ExactRadiusAuditObstruction hcard with
    ⟨t₁, t₂, t₃, F, _, _, _, _⟩
  exact F.false_of_rowwiseConfinedQDeletedClasses (hconf F)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- When three of the surviving row centers are actual blockers, the deleted
point is omitted from all three corresponding canonical selected shells. -/
theorem SixSurvivorExactRowsBoundary.deleted_not_mem_three_selectedShells
    (deleted source₀ source₁ source₅ :
      CriticalShellSystem.CarrierVertex D.A)
    (c₂ c₃ c₄ : ℝ²)
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt source₀.1 source₀.2)
      (H.centerAt source₁.1 source₁.2)
      c₂ c₃ c₄
      (H.centerAt source₅.1 source₅.2)) :
    deleted.1 ∉
        (H.selectedAt source₀.1 source₀.2).toCriticalFourShell.support ∧
      deleted.1 ∉
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support ∧
      deleted.1 ∉
        (H.selectedAt source₅.1 source₅.2).toCriticalFourShell.support := by
  refine ⟨?_, ?_, ?_⟩
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₀.2 B.firstFive.K₀ B.firstFive.B₀_card
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₁.2 B.firstFive.K₁ B.firstFive.B₁_card
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₅.2 B.K₅ B.B₅_card

/-- The three deleted rows whose centers are named actual blockers retain
