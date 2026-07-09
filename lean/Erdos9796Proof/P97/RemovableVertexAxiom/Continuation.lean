import Erdos9796Proof.P97.RemovableVertexAxiom.PinnedSurplusBank

open scoped EuclideanGeometry

namespace Problem97

/-- The local non-surplus Moser-cap containment input supplies the `U2`
package needed by the U5 interface for the same counterexample datum. -/
theorem u2Statement_of_nonSurplusMoserCapContainment
    (D : CounterexampleData)
    (hcontain : D.packet.NonSurplusMoserCapContainment) :
    U2Statement D := by
  refine u2Statement_of_u2FullDistanceClasses D ?_
  intro hM44
  rcases hM44.exists_nonSurplus_exact_cap_classes_at_side_of_moserCapContainment
      D.K4 hcontain with
    ⟨d, hdpos, _h12, _h23, _h31, hexact1, hexact2⟩
  refine ⟨d, hdpos, ?_, ?_⟩
  · ext y
    have h := congrArg (fun T : Finset ℝ² => y ∈ T) hexact1
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    all_goals
      simpa [SelectedClass, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppCap1, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppositeVertexByIndex, SurplusCapPacket.capByIndex,
        hi, dist_comm] using h
  · ext y
    have h := congrArg (fun T : Finset ℝ² => y ∈ T) hexact2
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    all_goals
      simpa [SelectedClass, SurplusCapPacket.oppApex2,
        SurplusCapPacket.oppCap2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, SurplusCapPacket.capByIndex,
        hi, dist_comm] using h

/-- A direct erased-pin triple is the same fixed-triple packet used by the U5
dangerous-triple interface, with the erased point as `q`. -/
theorem exists_u3FixedTriplePacket_of_erasedPinTriple
    {D : CounterexampleData} {x p : ℝ²}
    (hxA : x ∈ D.A) (hpA : p ∈ D.A)
    (htriple : ErasedPinTriple D.A x p) :
    ∃ t1 t2 t3 : ℝ², U3FixedTriplePacket D x p t1 t2 t3 := by
  classical
  rcases htriple with ⟨hpos, hcard⟩
  rw [Finset.card_eq_three] at hcard
  rcases hcard with ⟨t1, t2, t3, ht12, ht13, ht23, hC⟩
  refine ⟨t1, t2, t3, ?_⟩
  have ht1 :
      t1 ∈ (((D.A.erase x).erase p).filter
        fun y => dist p y = dist p x) := by
    rw [hC]
    simp
  have ht2 :
      t2 ∈ (((D.A.erase x).erase p).filter
        fun y => dist p y = dist p x) := by
    rw [hC]
    simp
  have ht3 :
      t3 ∈ (((D.A.erase x).erase p).filter
        fun y => dist p y = dist p x) := by
    rw [hC]
    simp
  refine
    { q_mem := hxA
      p_mem := hpA
      t1_mem := ?_
      t2_mem := ?_
      t3_mem := ?_
      t1_ne_t2 := ht12
      t1_ne_t3 := ht13
      t2_ne_t3 := ht23
      q_radius_pos := hpos
      t1_same_radius := ?_
      t2_same_radius := ?_
      t3_same_radius := ?_ }
  · simpa [CounterexampleData.skeleton] using (Finset.mem_filter.mp ht1).1
  · simpa [CounterexampleData.skeleton] using (Finset.mem_filter.mp ht2).1
  · simpa [CounterexampleData.skeleton] using (Finset.mem_filter.mp ht3).1
  · exact (Finset.mem_filter.mp ht1).2
  · exact (Finset.mem_filter.mp ht2).2
  · exact (Finset.mem_filter.mp ht3).2

/-- The exact residual circle in an erased-pin triple, restated against the U5
q-deleted skeleton notation. -/
theorem u5ExactRadiusClassCard_of_erasedPinTriple
    {D : CounterexampleData} {q p : ℝ²}
    (htriple : ErasedPinTriple D.A q p) :
    (((D.skeleton q).erase p).filter
        fun y => dist p y = dist p q).card = 3 := by
  simpa [CounterexampleData.skeleton] using htriple.2

/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch reduced to U5-style erased-pin triple circles.  The
non-surplus interior cases are discharged by exact selected-count row
exclusions for the erased-pin selected class. -/
theorem isM44NonSurplusContainmentErasedPinTripleResidualsExcluded :
      IsM44NonSurplusContainmentErasedPinTripleResidualsExcludedStatement := by
    have hfiniteResidualRows :
        IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement := by
      classical
      intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
        hcontain
      have hsurplusCardPos :
          0 < (S.capInteriorByIndex S.surplusIdx).card := by
        have hcard := hM44.surplusInterior_card_ge_three
        omega
      have hsurplusNonempty :
          (S.capInteriorByIndex S.surplusIdx).Nonempty :=
        Finset.card_pos.mp hsurplusCardPos
      rcases hsurplusNonempty with ⟨x, hxI⟩
      let D : CounterexampleData :=
        { A := A
          nonempty := hne
          convex := hconv
          K4 := hK4
          packet := S }
      have hDmin : D.Minimal := by
        intro B hBne hBconv hBK4
        by_contra hnot
        exact hMin B (Nat.lt_of_not_ge hnot) hBne hBconv hBK4
      have hxA : x ∈ D.A := by
        exact S.capInteriorByIndex_subset S.surplusIdx hxI
      have hDIsM44 : D.IsM44 := by
        simpa [CounterexampleData.IsM44, D] using hM44
      have hDU2 : U2Statement D := by
        refine u2Statement_of_nonSurplusMoserCapContainment D ?_
        simpa [D] using hcontain
      have hfixed :
          ∃ p t1 t2 t3 : ℝ², U3FixedTriplePacket D x p t1 t2 t3 := by
        exact exists_fixedTriplePacket_of_not_removable_mem hxA
          (CounterexampleData.not_isRemovableVertex_of_minimal hDmin x)
      have hdangerous :
          ∃ p t1 t2 t3 : ℝ²,
            U5DangerousTriple D x p ({t1, t2, t3} : Finset ℝ²) := by
        rcases hfixed with ⟨p, t1, t2, t3, hP⟩
        exact ⟨p, t1, t2, t3,
          u5DangerousTriple_of_u3FixedTriplePacket hP⟩
      refine ⟨x, hxI, ?_, ?_, ?_⟩
      · intro htriple
        rcases exists_u3FixedTriplePacket_of_erasedPinTriple
            (D := D) hxA
            (by
              simpa [D] using
                S.oppositeVertexByIndex_mem S.surplusIdx)
            (by simpa [D] using htriple) with
          ⟨t1, t2, t3, hP⟩
        have hlocalDangerous :
            U5DangerousTriple D x
              (S.oppositeVertexByIndex S.surplusIdx)
              ({t1, t2, t3} : Finset ℝ²) := by
          simpa [D] using u5DangerousTriple_of_u3FixedTriplePacket hP
        rcases
            hlocalDangerous.exists_selectedCandidateSkeleton_of_card_gt_nine
              hgt with
          ⟨u, hlocalSelected⟩
        have hlocalExact :
            (((D.skeleton x).erase
                (S.oppositeVertexByIndex S.surplusIdx)).filter
              fun y => dist (S.oppositeVertexByIndex S.surplusIdx) y =
                dist (S.oppositeVertexByIndex S.surplusIdx) x).card = 3 := by
          exact u5ExactRadiusClassCard_of_erasedPinTriple
            (by simpa [D] using htriple)
        rcases U5DangerousTriple.exists_two_off_circle_aux hDIsM44
            hlocalDangerous hlocalSelected hlocalExact with
          ⟨a0, a1, ha0_mem, ha1_mem, ha0_notin_base,
            ha1_notin_base, ha0_off, ha1_off⟩
        -- The direct surplus-opposite branch now has the exact U5 dangerous
        -- triple, selected candidate, exact radius class, and auxiliary
        -- off-circle support vertices.  The remaining producer must supply the
        -- rowwise confined classes or same-circle export, plus Mode A, or a
        -- direct surplus-index contradiction.
        sorry
      · intro p hpI hpErase htriple
        rcases exists_u3FixedTriplePacket_of_erasedPinTriple
            (D := D) hxA
            (by exact (Finset.mem_erase.mp hpErase).2)
            (by simpa [D] using htriple) with
          ⟨t1, t2, t3, hP⟩
        have hlocalDangerous :
            U5DangerousTriple D x p ({t1, t2, t3} : Finset ℝ²) := by
          simpa [D] using u5DangerousTriple_of_u3FixedTriplePacket hP
        rcases
            hlocalDangerous.exists_selectedCandidateSkeleton_of_card_gt_nine
              hgt with
          ⟨u, hlocalSelected⟩
        have hlocalExact :
            (((D.skeleton x).erase p).filter
              fun y => dist p y = dist p x).card = 3 := by
          exact u5ExactRadiusClassCard_of_erasedPinTriple
            (by simpa [D] using htriple)
        rcases U5DangerousTriple.exists_two_off_circle_aux hDIsM44
            hlocalDangerous hlocalSelected hlocalExact with
          ⟨a0, a1, ha0_mem, ha1_mem, ha0_notin_base,
            ha1_notin_base, ha0_off, ha1_off⟩
        -- The direct surplus-interior branch now has the exact U5 dangerous
        -- triple, selected candidate, exact radius class, and auxiliary
        -- off-circle support vertices.  The remaining producer must supply the
        -- rowwise confined classes or same-circle export, plus Mode A, or a
        -- direct surplus-index contradiction.
        sorry
      · have hlabelBase :
            ∀ T : Finset ℝ²,
              x ∈ T →
              T.card = 3 →
              T ⊆ S.capInteriorByIndex S.surplusIdx →
                ∃ p₁ p₂ q₁ q₂ s1 s2 s3 : ℝ²,
                  p₁ ≠ p₂ ∧
                  S.oppInterior1 = ({p₁, p₂} : Finset ℝ²) ∧
                  q₁ ≠ q₂ ∧
                  S.oppInterior2 = ({q₁, q₂} : Finset ℝ²) ∧
                  T = ({s1, s2, s3} : Finset ℝ²) ∧
                  x ∈ ({s1, s2, s3} : Finset ℝ²) ∧
                  s1 ≠ s2 ∧
                  s1 ≠ s3 ∧
                  s2 ≠ s3 ∧
                  ({s1, s2, s3} : Finset ℝ²) ⊆
                    S.capInteriorByIndex S.surplusIdx ∧
                  p₁ ∈ S.capInteriorByIndex S.oppIndex1 ∧
                  p₂ ∈ S.capInteriorByIndex S.oppIndex1 ∧
                  q₁ ∈ S.capInteriorByIndex S.oppIndex2 ∧
                  q₂ ∈ S.capInteriorByIndex S.oppIndex2 ∧
                  s1 ∈ S.capInteriorByIndex S.surplusIdx ∧
                  s2 ∈ S.capInteriorByIndex S.surplusIdx ∧
                  s3 ∈ S.capInteriorByIndex S.surplusIdx := by
          intro T hxT hTcard hTsub
          have hTcardLe : T.card ≤ 3 := by
            omega
          rcases hM44.exists_oppInterior_pairs with
            ⟨p₁, p₂, q₁, q₂, hp12, hpair, hq12, hqpair⟩
          rcases hM44.exists_surplusInterior_triple_preserving_subset hTsub
              hTcardLe with
            ⟨s1, s2, s3, hTtriple, hs12, hs13, hs23, hsSub⟩
          have hxTriple : x ∈ ({s1, s2, s3} : Finset ℝ²) :=
            hTtriple hxT
          have hTripleCard : ({s1, s2, s3} : Finset ℝ²).card = 3 := by
            simp [hs12, hs13, hs23]
          have hTriple_le :
              ({s1, s2, s3} : Finset ℝ²).card ≤ T.card := by
            rw [hTripleCard, hTcard]
          have hTeq : T = ({s1, s2, s3} : Finset ℝ²) :=
            Finset.eq_of_subset_of_card_le hTtriple hTriple_le
          have hp₁I : p₁ ∈ S.capInteriorByIndex S.oppIndex1 := by
            have hp₁Opp : p₁ ∈ S.oppInterior1 := by
              rw [hpair]
              simp
            simpa [SurplusCapPacket.oppInterior1] using hp₁Opp
          have hp₂I : p₂ ∈ S.capInteriorByIndex S.oppIndex1 := by
            have hp₂Opp : p₂ ∈ S.oppInterior1 := by
              rw [hpair]
              simp
            simpa [SurplusCapPacket.oppInterior1] using hp₂Opp
          have hq₁I : q₁ ∈ S.capInteriorByIndex S.oppIndex2 := by
            have hq₁Opp : q₁ ∈ S.oppInterior2 := by
              rw [hqpair]
              simp
            simpa [SurplusCapPacket.oppInterior2] using hq₁Opp
          have hq₂I : q₂ ∈ S.capInteriorByIndex S.oppIndex2 := by
            have hq₂Opp : q₂ ∈ S.oppInterior2 := by
              rw [hqpair]
              simp
            simpa [SurplusCapPacket.oppInterior2] using hq₂Opp
          have hs1I : s1 ∈ S.capInteriorByIndex S.surplusIdx :=
            hsSub (by simp)
          have hs2I : s2 ∈ S.capInteriorByIndex S.surplusIdx :=
            hsSub (by simp)
          have hs3I : s3 ∈ S.capInteriorByIndex S.surplusIdx :=
            hsSub (by simp)
          exact
            ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
              hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
              hq₁I, hq₂I, hs1I, hs2I, hs3I⟩
        rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
            hne hconv hK4 with
          ⟨n, hn, φ, iv, iw, hφinj, hφimage, hccwBoundary, hu, hv, hw,
            hapexOrder⟩
        have hrightCandidate :
            ∀ {p₁ p₂ q₁ q₂ s1 s2 s3 p : ℝ²},
              p ∈ S.capInteriorByIndex S.oppIndex1 →
              p ∈ A.erase x →
              ∀ sstar : Label,
                isSurplusStar sstar = true →
                rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3 sstar = x →
                  (OneSidedSeedCandidateRemainder
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                      (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂
                        s1 s2 s3 (dist p x) (fun _ => dist p x))
                      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                        OneSidedSeed) ∧
                    OneSidedSeedCandidateRemainder
                      (rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3)
                      (rightPinnedErasedPayloadCenterClass S p₁ p₂ q₁ q₂
                        s1 s2 s3 (dist p x) (fun _ => dist p x))
                      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                        OneSidedSeed)) := by
          intro p₁ p₂ q₁ q₂ s1 s2 s3 p hpI hpErase sstar hsstar
            hsstar_eq
          -- P2 producer gap: prove the right candidate remainders for the
          -- selected-class center classes.
          sorry
        have hleftCandidate :
            ∀ {p₁ p₂ q₁ q₂ s1 s2 s3 p : ℝ²},
              p ∈ S.capInteriorByIndex S.oppIndex2 →
              p ∈ A.erase x →
              ∀ sstar : Label,
                isSurplusStar sstar = true →
                leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3 sstar = x →
                  (OneSidedSeedCandidateRemainder
                      (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3)
                      (leftPinnedErasedPayloadCenterClass S q₁ q₂ p₁ p₂
                        s1 s2 s3 (dist p x) (fun _ => dist p x))
                      ({ sstar := sstar, privateCenter := .Pw, kind := .own,
                          privateMask := maskOfLabels [.u, .w, sstar, .Pu] } :
                        OneSidedSeed) ∧
                    OneSidedSeedCandidateRemainder
                      (leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3)
                      (leftPinnedErasedPayloadCenterClass S q₁ q₂ p₁ p₂
                        s1 s2 s3 (dist p x) (fun _ => dist p x))
                      ({ sstar := sstar, privateCenter := .Pu, kind := .own,
                          privateMask := maskOfLabels [.u, .w, sstar, .Pw] } :
                        OneSidedSeed)) := by
          intro p₁ p₂ q₁ q₂ s1 s2 s3 p hpI hpErase sstar hsstar
            hsstar_eq
          -- Mirror P2 candidate-remainder producer gap.
          sorry
        constructor
        · intro T hxT hTcard hTsub
          rcases hapexOrder with hrightOrder | hleftOrder
          · rcases hrightOrder with ⟨h0v, hvw⟩
            rcases exists_rightPinnedHullOrderLabels_of_apex_order
                (A := A) (S := S) (x := x) (T := T) (n := n) (φ := φ)
                (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv
                hw h0v hvw hM44 hxT hTcard hTsub with
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
                hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
            refine
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, ?_⟩
            intro p hpI hpErase
            exact
              rightFiniteCandidateSepFacts_of_erasedPayloadCenterClass
                hconv hK4 hM44 hcontain hp₁I hp₂I hq₁I hq₂I hs1I hs2I
                hs3I hp12 hq12 hs12 hs13 hs23
                (fun _ => dist p x)
                (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
                (by
                  intro sstar hsstar hsstar_eq
                  exact hrightCandidate hpI hpErase sstar hsstar hsstar_eq)
          · rcases hleftOrder with ⟨h0w, hwv⟩
            rcases exists_leftPinnedHullOrderLabels_of_apex_order
                (A := A) (S := S) (x := x) (T := T) (n := n) (φ := φ)
                (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv
                hw h0w hwv hM44 hxT hTcard hTsub with
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
                hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
            have hpair_rev :
                S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
              rw [hpair]
              ext z
              simp [or_comm]
            have hqpair_rev :
                S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
              rw [hqpair]
              ext z
              simp [or_comm]
            have hTeq_rev :
                T = ({s3, s2, s1} : Finset ℝ²) := by
              rw [hTeq]
              ext z
              simp [or_comm, or_left_comm]
            have hxTriple_rev :
                x ∈ ({s3, s2, s1} : Finset ℝ²) := by
              simpa [or_comm, or_left_comm, or_assoc] using hxTriple
            have hsSub_rev :
                ({s3, s2, s1} : Finset ℝ²) ⊆
                  S.capInteriorByIndex S.surplusIdx := by
              intro z hz
              exact hsSub (by
                simpa [or_comm, or_left_comm, or_assoc] using hz)
            refine
              ⟨p₂, p₁, q₂, q₁, s3, s2, s1, hp12.symm, hpair_rev,
                hq12.symm, hqpair_rev, hTeq_rev, hxTriple_rev,
                hs23.symm, hs13.symm, hs12.symm, hsSub_rev, ?_⟩
            intro p hpI hpErase
            have hccwReflected :
                EuclideanGeometry.IsCcwConvexPolygon
                  (fun i : Fin 10 =>
                    rightPinnedLabelPoint S p₂ p₁ q₂ q₁ s3 s2 s1
                      (reflectedHullLabel (labelOfHullFin i))) := by
              have hccwLeft :
                  EuclideanGeometry.IsCcwConvexPolygon
                    (fun i : Fin 10 =>
                      leftPinnedLabelPoint S q₁ q₂ p₁ p₂ s1 s2 s3
                        (labelOfHullFin i)) :=
                isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
              convert hccwLeft using 2
              rename_i i
              fin_cases i <;> rfl
            exact
              rightFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass
                hconv hK4 hM44 hcontain hp₂I hp₁I hq₂I hq₁I hs3I hs2I
                hs1I hp12.symm hq12.symm hs23.symm hs13.symm hs12.symm
                (fun _ => dist p x)
                hccwReflected
                (by
                  intro sstar hsstar hsstar_eq
                  exact hrightCandidate hpI hpErase sstar hsstar hsstar_eq)
        · intro T hxT hTcard hTsub
          rcases hapexOrder with hrightOrder | hleftOrder
          · rcases hrightOrder with ⟨h0v, hvw⟩
            rcases exists_rightPinnedHullOrderLabels_of_apex_order
                (A := A) (S := S) (x := x) (T := T) (n := n) (φ := φ)
                (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv
                hw h0v hvw hM44 hxT hTcard hTsub with
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
                hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
            have hpair_rev :
                S.oppInterior1 = ({p₂, p₁} : Finset ℝ²) := by
              rw [hpair]
              ext z
              simp [or_comm]
            have hqpair_rev :
                S.oppInterior2 = ({q₂, q₁} : Finset ℝ²) := by
              rw [hqpair]
              ext z
              simp [or_comm]
            have hTeq_rev :
                T = ({s3, s2, s1} : Finset ℝ²) := by
              rw [hTeq]
              ext z
              simp [or_comm, or_left_comm]
            have hxTriple_rev :
                x ∈ ({s3, s2, s1} : Finset ℝ²) := by
              simpa [or_comm, or_left_comm, or_assoc] using hxTriple
            have hsSub_rev :
                ({s3, s2, s1} : Finset ℝ²) ⊆
                  S.capInteriorByIndex S.surplusIdx := by
              intro z hz
              exact hsSub (by
                simpa [or_comm, or_left_comm, or_assoc] using hz)
            refine
              ⟨p₂, p₁, q₂, q₁, s3, s2, s1, hp12.symm, hpair_rev,
                hq12.symm, hqpair_rev, hTeq_rev, hxTriple_rev,
                hs23.symm, hs13.symm, hs12.symm, hsSub_rev, ?_⟩
            intro p hpI hpErase
            have hccwReflected :
                EuclideanGeometry.IsCcwConvexPolygon
                  (fun i : Fin 10 =>
                    leftPinnedLabelPoint S q₂ q₁ p₂ p₁ s3 s2 s1
                      (reflectedHullLabel (labelOfHullFin i))) := by
              have hccwRight :
                  EuclideanGeometry.IsCcwConvexPolygon
                    (fun i : Fin 10 =>
                      rightPinnedLabelPoint S p₁ p₂ q₁ q₂ s1 s2 s3
                        (labelOfHullFin i)) :=
                isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder
              convert hccwRight using 2
              rename_i i
              fin_cases i <;> rfl
            exact
              leftFiniteCandidateSepFacts_of_reflectedErasedPayloadCenterClass
                hconv hK4 hM44 hcontain hq₂I hq₁I hp₂I hp₁I hs3I hs2I
                hs1I hq12.symm hp12.symm hs23.symm hs13.symm hs12.symm
                (fun _ => dist p x)
                hccwReflected
                (by
                  intro sstar hsstar hsstar_eq
                  exact hleftCandidate hpI hpErase sstar hsstar hsstar_eq)
          · rcases hleftOrder with ⟨h0w, hwv⟩
            rcases exists_leftPinnedHullOrderLabels_of_apex_order
                (A := A) (S := S) (x := x) (T := T) (n := n) (φ := φ)
                (iv := iv) (iw := iw) hn hφinj hφimage hccwBoundary hu hv
                hw h0w hwv hM44 hxT hTcard hTsub with
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, hp₁I, hp₂I,
                hq₁I, hq₂I, hs1I, hs2I, hs3I, horder⟩
            refine
              ⟨p₁, p₂, q₁, q₂, s1, s2, s3, hp12, hpair, hq12, hqpair,
                hTeq, hxTriple, hs12, hs13, hs23, hsSub, ?_⟩
            intro p hpI hpErase
            exact
              leftFiniteCandidateSepFacts_of_erasedPayloadCenterClass
                hconv hK4 hM44 hcontain hq₁I hq₂I hp₁I hp₂I hs1I hs2I
                hs3I hq12 hp12 hs12 hs13 hs23
                (fun _ => dist p x)
                (isCcwConvexPolygon_of_hullOrderSubsequenceCertificate horder)
                (by
                  intro sstar hsstar hsstar_eq
                  exact hleftCandidate hpI hpErase sstar hsstar hsstar_eq)
    have hprunedRows :
        IsM44NonSurplusContainmentErasedPinTripleRoutedSeedPrunedRowsFactsStatement :=
      prunedRowsFactsStatement_of_finiteResidualRowsFactsStatement
        hfiniteResidualRows
    have hseedRows :
        IsM44NonSurplusContainmentErasedPinTripleRoutedSeedRowsFactsStatement :=
      routedSeedRowsFactsStatement_of_prunedRowsFactsStatement hprunedRows
    have hrouted :
        IsM44NonSurplusContainmentErasedPinTripleRoutedRowsFactsStatement :=
      routedRowsFactsStatement_of_routedSeedRowsFactsStatement hseedRows
    have hrows :
        IsM44NonSurplusContainmentErasedPinTripleCountRowsFactsStatement :=
      countRowsFactsStatement_of_routedRowsFactsStatement hrouted
    have hcount :
        IsM44NonSurplusContainmentErasedPinTripleCountFamilyFactsStatement :=
      countFamilyFactsStatement_of_countRowsFactsStatement hrows
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases hcount A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2
        hcontain with
      ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
        hoppInterior1Count, hoppInterior2Count⟩
    refine ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple, ?_, ?_⟩
    · intro p hpI hpErase htriple
      have hpOpp : p ∈ S.oppInterior1 := by
        simpa [SurplusCapPacket.oppInterior1] using hpI
      exact
        SurplusCapPacket.IsM44.oppIndex1_surplusErasedPinTriple_false_of_exactCountFamily
          hM44 hK4 hcontain hxI hpOpp
        (hoppInterior1Count p hpI hpErase)
        htriple
    · intro p hpI hpErase htriple
      have hpOpp : p ∈ S.oppInterior2 := by
        simpa [SurplusCapPacket.oppInterior2] using hpI
      exact
        SurplusCapPacket.IsM44.oppIndex2_surplusErasedPinTriple_false_of_exactCountFamily
          hM44 hK4 hcontain hxI hpOpp
        (hoppInterior2Count p hpI hpErase)
        htriple

/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch reduced to exact four-point selected-class pins through the
erased surplus point. -/
theorem isM44NonSurplusContainmentExactPinResidualsExcluded :
      IsM44NonSurplusContainmentExactPinResidualsExcludedStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOppTriple, hsurplusInteriorTriple,
        hoppInterior1Triple, hoppInterior2Triple⟩
    refine ⟨x, hxI, ?_, ?_, ?_, ?_⟩
    · intro radius hradius hcard hxpin
      exact hsurplusOppTriple
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hsurplusInteriorTriple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hoppInterior1Triple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)
    · intro p hpI hpErase radius hradius hcard hxpin
      exact hoppInterior2Triple p hpI hpErase
        (erasedPinTriple_of_exact_erased_pin hradius hcard hxpin)

/-- Categorized residual concrete erasure-witness production for the `IsM44`
containment branch after exact-cap survival handles the two non-surplus
opposite Moser vertices. -/
theorem isM44NonSurplusContainmentResidualErasureWitnesses :
      IsM44NonSurplusContainmentResidualErasureWitnessesStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentExactPinResidualsExcluded
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOppPin, hsurplusInteriorPin, hoppInterior1Pin,
        hoppInterior2Pin⟩
    have hsurplusOppErase :
        S.oppositeVertexByIndex S.surplusIdx ∈ A.erase x := by
      exact Finset.mem_erase.mpr
        ⟨(S.capInteriorByIndex_ne_oppositeVertexByIndex_of_mem
            (j := S.surplusIdx) hxI).symm,
          S.oppositeVertexByIndex_mem S.surplusIdx⟩
    refine ⟨x, hxI, ?_, ?_, ?_, ?_⟩
    · exact selectedClass_erase_witness_of_no_exact_erased_pin hK4
        hsurplusOppErase
        (fun hradius hcard hxpin =>
          hsurplusOppPin hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hsurplusInteriorPin p hpI hpErase hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hoppInterior1Pin p hpI hpErase hradius hcard hxpin)
    · intro p hpI hpErase
      exact selectedClass_erase_witness_of_no_exact_erased_pin hK4 hpErase
        (fun hradius hcard hxpin =>
          hoppInterior2Pin p hpI hpErase hradius hcard hxpin)

/-- Concrete erasure-witness production for the `IsM44` containment branch.
The two non-surplus opposite Moser vertices are supplied by exact-cap survival;
the residual theorem handles the other survivors. -/
theorem isM44NonSurplusContainmentErasureWitnesses :
      IsM44NonSurplusContainmentErasureWitnessesStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentResidualErasureWitnesses
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxI, hsurplusOpp, hsurplusInterior, hoppInterior1,
        hoppInterior2⟩
    have hxA : x ∈ A := S.capInteriorByIndex_subset S.surplusIdx hxI
    refine ⟨x, hxA, ?_⟩
    intro p hp
    by_cases hp1 : p = S.oppositeVertexByIndex S.oppIndex1
    · subst p
      exact hM44.exists_oppIndex1_erase_witness_of_surplusInterior
        hK4 hcontain hxI
    · by_cases hp2 : p = S.oppositeVertexByIndex S.oppIndex2
      · subst p
        exact hM44.exists_oppIndex2_erase_witness_of_surplusInterior
          hK4 hcontain hxI
      · have hpA : p ∈ A := (Finset.mem_erase.mp hp).2
        rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hpA with
          hpVerts | ⟨i, hpI⟩
        · rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hpVerts with
            hsurplus | hopp1 | hopp2
          · simpa [hsurplus] using hsurplusOpp
          · exact False.elim (hp1 hopp1)
          · exact False.elim (hp2 hopp2)
        · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
            hi | hi | hi
          · exact hsurplusInterior p (by simpa [hi] using hpI) hp
          · exact hoppInterior1 p (by simpa [hi] using hpI) hp
          · exact hoppInterior2 p (by simpa [hi] using hpI) hp

/-- Non-surplus Moser-cap containment supplies a removable vertex in the
`IsM44` branch once the concrete erasure witnesses are produced. -/
theorem isM44NonSurplusContainmentRemovable :
      IsM44NonSurplusContainmentRemovableStatement := by
    intro A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain
    rcases isM44NonSurplusContainmentErasureWitnesses
        A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain with
      ⟨x, hxA, hwitness⟩
    exact ⟨x, removableVertex_of_selectedClass_erase_witnesses hxA hwitness⟩

/-- Closed adapter from the residual split to the broad `IsM44` pinned-surplus
  branch. -/
theorem removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit :
      IsM44PinnedSurplusBranchFromResidualSplitStatement := by
    intro hendpoint hpinned hrem hbridge A hne hconv hK4 hgt hMin S hM44
    rcases hendpoint A hne hconv hK4 hgt hMin S hM44 with ⟨hend1, hend2⟩
    rcases hpinned hbridge A hne hconv hK4 hgt hMin S hM44 with
      ⟨hpin1, hpin2⟩
    have hcontain : S.NonSurplusMoserCapContainment :=
      hM44.nonSurplusMoserCapContainment_of_endpoint_pinnedSurplusResiduals
        hK4 hconv hend1 hend2 hpin1 hpin2
    exact hrem A hne hconv hK4 hgt hMin S hM44 hend1 hend2 hpin1 hpin2 hcontain

/-- `IsM44` surplus-cap packets close the removable-vertex branch after the
  endpoint residuals, pinned surplus-family residuals, and
  containment-to-removable extraction are discharged.  This is consumed by
  `RemovableVertexOfLarge_from_threeWaySplit`. -/
theorem removableVertexOfLarge_of_isM44PinnedSurplus :
      IsM44PinnedSurplusBranchStatement :=
    removableVertexOfLarge_of_isM44PinnedSurplus_from_residualSplit
      isM44EndpointResidualsExcluded
      isM44PinnedSurplusResidualsExcluded
      isM44NonSurplusContainmentRemovable

/-- Configurations with no `IsM44` surplus-cap packet close by descent.  This
is a spine obligation consumed by `RemovableVertexOfLarge_from_threeWaySplit`.

The proof is the copied p97-rvol U-lane route-B tail, reassembled at the
configuration level.  A `CounterexampleData` is built on the carrier `A`;
minimality (from the strong-induction IH) excludes removable vertices and
supplies a critical shell system; the no-`IsM44` hypothesis discharges the
exact-pair branch of the cap-triple split; the surplus (non-exact) branch is
closed by `u1_largeCap_routeB_tail_false`.  The remaining open content is the
two named residuals inside that tail —
`u1_largeCap_routeB_tail_liveData_false` and
`U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
(the two-large-cap DoubleApex kill). -/
theorem removableVertexOfLarge_of_nonIsM44 :
    NonIsM44DescentStatement := by
  classical
  intro A hne hconv hK4 hgt hMin hNoM44
  -- Build the counterexample datum on the carrier `A`.
  obtain ⟨packet⟩ := MEC.nonempty_surplusCapPacket_of_K4 hne hconv hK4 hgt
  let D : CounterexampleData := ⟨A, hne, hconv, hK4, packet⟩
  have hDA : D.A = A := rfl
  have hDcard : 9 < D.A.card := by rw [hDA]; exact hgt
  -- Minimality of `D` from the strong-induction hypothesis.
  have hmin : D.Minimal := by
    intro B hBne hBconv hBK4
    by_contra hlt
    exact hMin B (not_le.mp hlt) hBne hBconv hBK4
  -- No `IsM44` surplus-cap packet on `D.A = A`.
  have hNoM44D : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44 := by rw [hDA]; exact hNoM44
  -- Minimality excludes removable vertices and supplies a critical shell system.
  have hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x :=
    CounterexampleData.not_isRemovableVertex_of_minimal hmin
  have hcritical : Nonempty (CriticalShellSystem D.A) :=
    D.exists_criticalShellSystem_of_minimal hmin
  -- The route-B tail derives `False`, closing the goal ex falso.
  exfalso
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by omega)
  have hcirc :
      3 ≤ (D.A.filter fun p =>
        dist p (MEC.mec D.A D.nonempty).center =
          (MEC.mec D.A D.nonempty).radius).card :=
    MEC.no_diameter_under_k4 D.nonempty hncol D.convex D.K4
  rcases MEC.exists_capTriple_of_circumscribed D.nonempty hncol D.convex hcirc with
    ⟨MT, hCirc, ⟨CP⟩⟩
  rcases CP.exactPair_or_nonExactSurplusBranch_of_card_gt_nine hDcard with
    hexact | hnonExact
  · exact hNoM44D
      (isM44Packet_of_capTriple_two_exact_of_card_gt_nine MT hCirc CP hDcard hexact)
  · rcases hnonExact with ⟨i, hsurplus, hnotOppExact⟩
    exact u1_largeCap_routeB_tail_false D hDcard hnoRem hcritical hNoM44D
      MT hCirc CP rfl hsurplus hnotOppExact

/-- Closed adapter from the three-way split to the existing removable-vertex
spine node. -/
theorem RemovableVertexOfLarge_from_threeWaySplit :
    RemovableVertexOfLargeFromThreeWaySplitStatement := by
  classical
  intro _hpacket hM44 hnonM44 hbridge A hne hconv hK4 hgt hMin
  by_cases h : ∃ S : SurplusCapPacket A, S.IsM44
  · rcases h with ⟨S, hS⟩
    exact hM44 hbridge A hne hconv hK4 hgt hMin S hS
  · exact hnonM44 A hne hconv hK4 hgt hMin h

/-- Remaining removable-vertex obligation with the finite pinned-surplus bank
handoff available as a closed input.  It is now routed through the three-way
split into packet extraction, the `IsM44` pinned-surplus branch, and the
non-`IsM44` descent branch. -/
theorem RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank :
    RemovableVertexOfLargeFromPinnedSurplusCOMPGBankStatement :=
  RemovableVertexOfLarge_from_threeWaySplit
    largeK4SurplusCapPacket
    removableVertexOfLarge_of_isM44PinnedSurplus
    removableVertexOfLarge_of_nonIsM44

/-- **Removable-vertex existence for `|A| > 9` counterexamples.**
This is now wired through the finite pinned-surplus COMP-G bank bridge; the
open work is
the three obligations consumed by
`RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank`. -/
theorem RemovableVertexOfLarge : RemovableVertexOfLargeStatement :=
  RemovableVertexOfLarge_from_pinnedSurplusCOMPGBank
    pinnedSurplusCOMPGBankBridge


end Problem97
