/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# Actual-row structure at a triple-shell escape center

This scratch module keeps separate the anonymous selected row centered at the
triple-shell escape center from the critical-shell system's actual row whose
source is that center.  It makes no production declaration.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATAILStageOnePrescribedApexDichotomy
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailCriticalFiberRetainedRadiusSelector
open ATailLargeOppositeCapsBiApexSurface
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

attribute [local instance] Classical.propDecidable

/-- Deletion is blocked at a source's actual blocker exactly for the points of
that source's actual row. -/
theorem actualRow_blocked_iff_mem
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A) (w : ℝ²) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2)) ↔
      w ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  constructor
  · intro hwblocked
    exact source_mem_critical_support_of_no_qfree
      (H.selectedAt source.1 source.2) hwblocked
  · intro hw
    apply not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
      (isUniqueFourCenter_centerAt H source.1 source.2)
    rw [uniqueFourClass_centerAt_eq_selectedAt_support H source.1 source.2]
    exact hw

/-- The actual row attached to a carrier source consists entirely of deletions
blocked at its actual blocker.  Its actual-blocker fiber maps into that row and
has cardinality at most four. -/
theorem actualRow_deletion_and_fiber_packet
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A) :
    H.centerAt source.1 source.2 ∈ D.A ∧
      H.centerAt source.1 source.2 ≠ source.1 ∧
      source.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      (∀ w ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support,
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source.1 source.2)) ∧
      source ∈ actualBlockerFiber H source ∧
      (actualBlockerFiber H source).image (fun other ↦ other.1) ⊆
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      (actualBlockerFiber H source).card ≤ 4 := by
  have hcenterA : H.centerAt source.1 source.2 ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt source.1 source.2).toCriticalFourShell.center_mem
  have hcenterNe : H.centerAt source.1 source.2 ≠ source.1 :=
    centerAt_ne_source H source.1 source.2
  have hsource : source.1 ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
  have hblocked :
      ∀ w ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support,
        ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source.1 source.2) := by
    intro w hw
    exact (actualRow_blocked_iff_mem source w).2 hw
  have hsourceFiber : source ∈ actualBlockerFiber H source := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ source, rfl⟩
  have hfiberImage :
      (actualBlockerFiber H source).image (fun other ↦ other.1) ⊆
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    intro w hw
    rcases Finset.mem_image.mp hw with ⟨other, hother, rfl⟩
    have hblockers := (Finset.mem_filter.mp hother).2
    have hcenters :
        H.centerAt other.1 other.2 = H.centerAt source.1 source.2 :=
      congrArg Subtype.val hblockers
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq H other.2 source.2 hcenters
    rw [← hsupports]
    exact (H.selectedAt other.1 other.2).toCriticalFourShell.q_mem_support
  exact
    ⟨hcenterA, hcenterNe, hsource, hblocked, hsourceFiber, hfiberImage,
      actualBlockerFiber_card_le_four H source⟩

/-- The anonymous escape row centered at a source and that source's actual row
have distinct centers.  Consequently each row has at least two points outside
the other. -/
theorem escapeRow_actualRow_incidence_packet
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    (source : CriticalShellSystem.CarrierVertex D.A)
    (K : SelectedFourClass D.A source.1) :
    (K.support ∩
        (H.selectedAt source.1 source.2).toCriticalFourShell.support).card ≤ 2 ∧
      2 ≤
        (K.support \
          (H.selectedAt source.1 source.2).toCriticalFourShell.support).card ∧
      2 ≤
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support \
          K.support).card := by
  let actualRow :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
  have hcenters : source.1 ≠ H.centerAt source.1 source.2 :=
    (centerAt_ne_source H source.1 source.2).symm
  have hinter : (K.support ∩ actualRow.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two K actualRow hcenters
  have hKOutside : 2 ≤ (K.support \ actualRow.support).card := by
    have hsplit := Finset.card_sdiff_add_card_inter K.support actualRow.support
    rw [K.support_card] at hsplit
    omega
  have hActualOutside : 2 ≤ (actualRow.support \ K.support).card := by
    have hinter' : (actualRow.support ∩ K.support).card ≤ 2 := by
      simpa [Finset.inter_comm] using hinter
    have hsplit := Finset.card_sdiff_add_card_inter actualRow.support K.support
    rw [actualRow.support_card] at hsplit
    omega
  exact ⟨hinter, hKOutside, hActualOutside⟩

/-- Relative to the canonical `Q` row, an actual row has no third case: equal
actual blockers give the same exact support, while distinct blockers give the
two-circle upper bound. -/
theorem actualRow_qRow_dichotomy
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    (H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        (H.selectedAt source.1 source.2).toCriticalFourShell.support =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) ∨
      (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support).card ≤ 2) := by
  by_cases hcenters : H.centerAt source.1 source.2 =
      H.centerAt Q.source₁.1 Q.source₁.2
  · exact Or.inl
      ⟨hcenters,
        selectedSupports_eq_of_actualBlockers_eq H source.2 Q.source₁.2 hcenters⟩
  · exact Or.inr
      ⟨hcenters, SelectedFourClass.inter_card_le_two
        (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.toSelectedFourClass hcenters⟩

/-- The `Q`-row deletions blocked at a source's actual blocker are exactly the
intersection of the source's actual row with the `Q` row. -/
theorem actualRow_qRow_blockedDeletionSet_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support.filter
        (fun w ↦ ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt source.1 source.2)) =
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
  ext w
  constructor
  · intro hw
    rcases Finset.mem_filter.mp hw with ⟨hwQ, hwblocked⟩
    exact Finset.mem_inter.mpr
      ⟨(actualRow_blocked_iff_mem source w).1 hwblocked, hwQ⟩
  · intro hw
    rcases Finset.mem_inter.mp hw with ⟨hwactual, hwQ⟩
    exact Finset.mem_filter.mpr
      ⟨hwQ, (actualRow_blocked_iff_mem source w).2 hwactual⟩

/-- At an actual blocker distinct from the `Q` blocker, at most two deletions
of `Q`-row points are blocked. -/
theorem actualRow_distinct_qRow_blockedDeletionSet_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters : H.centerAt source.1 source.2 ≠
      H.centerAt Q.source₁.1 Q.source₁.2) :
    ((H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support.filter
      (fun w ↦ ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt source.1 source.2))).card ≤ 2 := by
  rw [actualRow_qRow_blockedDeletionSet_eq P Pρ Q source]
  exact SelectedFourClass.inter_card_le_two
    (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.toSelectedFourClass hcenters

/-- In particular, the actual row of any source cannot itself be the requested
distinct-center three-overlap landing row. -/
theorem actualRow_not_distinct_qRow_overlap_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ¬ (H.centerAt source.1 source.2 ≠
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        3 ≤
          ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support).card) := by
  rintro ⟨hcenters, hthree⟩
  rcases actualRow_qRow_dichotomy P Pρ Q source with heq | hne
  · exact hcenters heq.1
  · omega

/-- On the live tri-apex branch, the actual blocker of every source lies in a
strict indexed cap.  At most two sources from that cap can share it. -/
theorem actualRow_center_cap_and_localFiber_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ i : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        ((actualBlockerFiber H source).filter
          (fun other ↦ other.1 ∈ S.capByIndex i)).card ≤ 2 := by
  rcases exists_blockerCenter_mem_capInteriorByIndex T source with ⟨i, hi⟩
  refine ⟨i, hi, actualBlockerFiber_filter_capByIndex_card_le_two source i ?_⟩
  exact S.capInteriorByIndex_subset_capByIndex i hi

/-- The escape witness's point outside the three-shell seed proves the same
`Q`-row anti-overlap bound as the production theorem, without changing the
witness. -/
theorem tripleShellEscape_qRow_overlap_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    {center : ℝ²} {K : SelectedFourClass D.A center} {z : ℝ²}
    (hzK : z ∈ K.support)
    (hzOutside : z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁) :
    (K.support ∩
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support).card ≤ 2 := by
  let KQ :=
    (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell
  by_cases hcenters : center = H.centerAt Q.source₁.1 Q.source₁.2
  · have hzNotQ : z ∉ KQ.support := by
      intro hzQ
      exact hzOutside (Finset.mem_union_right _ hzQ)
    have hradii : K.radius ≠ KQ.radius := by
      intro hradii
      apply hzNotQ
      have hzClass :
          z ∈ SelectedClass D.A
            (H.centerAt Q.source₁.1 Q.source₁.2) KQ.radius := by
        rw [mem_selectedClass]
        refine ⟨K.support_subset_A hzK, ?_⟩
        calc
          dist (H.centerAt Q.source₁.1 Q.source₁.2) z =
              dist center z := by rw [hcenters]
          _ = K.radius := K.support_eq_radius z hzK
          _ = KQ.radius := hradii
      have hclassEq :
          SelectedClass D.A
              (H.centerAt Q.source₁.1 Q.source₁.2) KQ.radius =
            KQ.support := by
        simpa only [SelectedClass] using KQ.support_eq.symm
      rwa [hclassEq] at hzClass
    have hinterEmpty : K.support ∩ KQ.support = ∅ := by
      apply Finset.disjoint_iff_inter_eq_empty.mp
      rw [Finset.disjoint_left]
      intro w hwK hwQ
      apply hradii
      calc
        K.radius = dist center w := (K.support_eq_radius w hwK).symm
        _ = dist (H.centerAt Q.source₁.1 Q.source₁.2) w := by rw [hcenters]
        _ = KQ.radius := KQ.support_eq_radius w hwQ
    rw [show
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support = KQ.support by rfl]
    rw [hinterEmpty]
    simp
  · simpa [KQ] using
      SelectedFourClass.inter_card_le_two K KQ.toSelectedFourClass hcenters

section TripleShellEscape

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)

include L in
/-- The production overlap theorem hides that its witness center lies in the
carrier.  Reopening its origin-incidence producer restores that fact for the
same anonymous escape row. -/
theorem exists_q_tripleShellEscape_center_mem_carrier
    (Q : FreshThirdBlockerFiber P Pρ) :
    ∃ center : ℝ²,
      ∃ _hcenterA : center ∈ D.A,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
              (K.support ∩
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.support).card ≤ 2 := by
  rcases
      exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases
        (P := P) (Pρ := Pρ) L Q.source₁ with
    ⟨center, K, z, hzK, hzOutside, horigin⟩
  have hcenterA : center ∈ D.A := by
    rcases horigin with hP | hPρ | hQ
    · exact
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support_subset_A hP.1
    · exact
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support_subset_A hPρ.1
    · exact
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_subset_A hQ.1
  have hQOverlap :=
    tripleShellEscape_qRow_overlap_card_le_two P Pρ Q hzK hzOutside
  exact ⟨center, hcenterA, K, z, hzK, hzOutside, hQOverlap⟩

include L in
/-- The actual row of the carrier center supplied by the triple-shell escape
has four blocked deletions, but remains geometrically anti-synchronized with
both the anonymous escape row and every distinct-center `Q` row. -/
theorem exists_q_tripleShellEscape_actualCenterRow_packet
    (Q : FreshThirdBlockerFiber P Pρ) :
    ∃ center : ℝ²,
      ∃ hcenterA : center ∈ D.A,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
              (K.support ∩
                (H.selectedAt Q.source₁.1
                  Q.source₁.2).toCriticalFourShell.support).card ≤ 2 ∧
              (K.support ∩
                (H.selectedAt center hcenterA).toCriticalFourShell.support).card ≤ 2 ∧
              2 ≤
                (K.support \
                  (H.selectedAt center hcenterA).toCriticalFourShell.support).card ∧
              2 ≤
                ((H.selectedAt center hcenterA).toCriticalFourShell.support \
                  K.support).card ∧
              (∀ w ∈ (H.selectedAt center hcenterA).toCriticalFourShell.support,
                ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
                  (H.centerAt center hcenterA)) ∧
              ((H.centerAt center hcenterA =
                    H.centerAt Q.source₁.1 Q.source₁.2 ∧
                  (H.selectedAt center hcenterA).toCriticalFourShell.support =
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.support) ∨
                (H.centerAt center hcenterA ≠
                    H.centerAt Q.source₁.1 Q.source₁.2 ∧
                  ((H.selectedAt center hcenterA).toCriticalFourShell.support ∩
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.support).card ≤ 2)) := by
  rcases exists_q_tripleShellEscape_center_mem_carrier P Pρ L Q with
    ⟨center, hcenterA, K, z, hzK, hzOutside, hQOverlap⟩
  let source : CriticalShellSystem.CarrierVertex D.A := ⟨center, hcenterA⟩
  have hincidence := escapeRow_actualRow_incidence_packet (H := H) source K
  have hactual := actualRow_deletion_and_fiber_packet (H := H) source
  have hQ := actualRow_qRow_dichotomy P Pρ Q source
  exact
    ⟨center, hcenterA, K, z, hzK, hzOutside,
      hQOverlap, hincidence.1, hincidence.2.1, hincidence.2.2,
      hactual.2.2.2.1, hQ⟩

end TripleShellEscape

section InterfaceCounterpattern

/-- Incidence-only counterpattern: even the equal-row arms of the named
FirstNonHit data coexist with an escaping row and an actual row at its center
whose intersection with the `Q` row has cardinality one.  This is not a
Euclidean or full-source model. -/
theorem actualCenterRow_firstNonHit_interface_counterpattern :
    ∃ (qRow firstNamedRow secondNamedRow escapeRow actualRow : Finset ℕ)
      (center z : ℕ),
      qRow.card = 4 ∧
        firstNamedRow = qRow ∧
        secondNamedRow = qRow ∧
        escapeRow.card = 4 ∧
        actualRow.card = 4 ∧
        center ∈ qRow ∧
        center ∉ escapeRow ∧
        center ∈ actualRow ∧
        z ∈ escapeRow ∧
        z ∉ qRow ∧
        (escapeRow ∩ actualRow).card ≤ 2 ∧
        2 ≤ (escapeRow \ actualRow).card ∧
        2 ≤ (actualRow \ escapeRow).card ∧
        ¬ 3 ≤ (actualRow ∩ qRow).card := by
  refine
    ⟨{0, 1, 2, 3}, {0, 1, 2, 3}, {0, 1, 2, 3},
      {4, 5, 6, 7}, {0, 8, 9, 10}, 0, 7, ?_⟩
  decide

end InterfaceCounterpattern

#print axioms actualRow_deletion_and_fiber_packet
#print axioms actualRow_blocked_iff_mem
#print axioms escapeRow_actualRow_incidence_packet
#print axioms actualRow_qRow_dichotomy
#print axioms actualRow_qRow_blockedDeletionSet_eq
#print axioms actualRow_distinct_qRow_blockedDeletionSet_card_le_two
#print axioms actualRow_not_distinct_qRow_overlap_card_ge_three
#print axioms actualRow_center_cap_and_localFiber_packet
#print axioms tripleShellEscape_qRow_overlap_card_le_two
#print axioms exists_q_tripleShellEscape_center_mem_carrier
#print axioms exists_q_tripleShellEscape_actualCenterRow_packet
#print axioms actualCenterRow_firstNonHit_interface_counterpattern

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
