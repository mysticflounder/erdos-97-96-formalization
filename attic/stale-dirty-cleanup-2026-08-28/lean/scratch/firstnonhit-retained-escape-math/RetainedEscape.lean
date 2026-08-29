/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# Retained FirstNonHit escape interface

Source-clean specializations and interface counterpatterns for the retained
FirstNonHit branch.  This scratch module makes no production declaration.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge
open ATAILStageOneMinimalDeletionCore

attribute [local instance] Classical.propDecidable

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include L in
/-- Specializing the global escape theorem to the `Q` row gives exactly the
three origin-incidence alternatives, with no relabeling of the escaping row. -/
theorem exists_q_tripleShellEscape_originIncidenceCases
    (Q : FreshThirdBlockerFiber P Pρ) :
    ∃ center : ℝ²,
      ∃ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
            ((center ∈
                  (H.selectedAt P.source₁
                    P.source₁_mem_A).toCriticalFourShell.support ∧
                (K.support ∩
                    (H.selectedAt P.source₁
                      P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 ∧
                2 ≤
                  (K.support \
                    (H.selectedAt P.source₁
                      P.source₁_mem_A).toCriticalFourShell.support).card) ∨
              (center ∈
                  (H.selectedAt Pρ.source₁
                    Pρ.source₁_mem_A).toCriticalFourShell.support ∧
                (K.support ∩
                    (H.selectedAt Pρ.source₁
                      Pρ.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 ∧
                2 ≤
                  (K.support \
                    (H.selectedAt Pρ.source₁
                      Pρ.source₁_mem_A).toCriticalFourShell.support).card) ∨
              (center ∈
                  (H.selectedAt Q.source₁.1
                    Q.source₁.2).toCriticalFourShell.support ∧
                (K.support ∩
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.support).card ≤ 2 ∧
                2 ≤
                  (K.support \
                    (H.selectedAt Q.source₁.1
                      Q.source₁.2).toCriticalFourShell.support).card)) := by
  exact
    exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases
      (P := P) (Pρ := Pρ) L Q.source₁

include L in
/-- Every row supplied by the triple-shell escape has overlap at most two with
the `Q` row.  If its center is distinct this is the two-circle bound; if the
centers coincide, the escaping point forces distinct radii and hence disjoint
supports.  Thus this global row is an anti-landing for the three-overlap
terminal. -/
theorem exists_q_tripleShellEscape_qRow_overlap_card_le_two
    (Q : FreshThirdBlockerFiber P Pρ) :
    ∃ center : ℝ²,
      ∃ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
            (K.support ∩
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support).card ≤ 2 := by
  rcases
      exists_q_tripleShellEscape_originIncidenceCases
        (P := P) (Pρ := Pρ) (L := L) Q with
    ⟨center, K, z, hzK, hzOutside, _⟩
  refine ⟨center, K, z, hzK, hzOutside, ?_⟩
  let KQ :=
    (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell
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

include hfrontierInteriorEq hρInteriorEq hpairsDisjoint in
/-- The new minimal-core shell API identifies the two restored shells in the
retained packet with the two already named first-apex rows.  In particular,
it adds no incidence with the `Q` row. -/
theorem retained_firstSource_core_shells_eq_retainedApexRows
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    ∃ x y : ℝ²,
      x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
      y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      x ∉
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∧
      y ∉
        (H.selectedAt C.firstSource.1
          C.firstSource.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y)
        (H.centerAt C.firstSource.1 C.firstSource.2) ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 ∧
      ∃ K : MinimalDeletionCore D.A {x, y} S.oppApex1,
        ∃ sx sy : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)},
          sx.1 = x ∧
          sy.1 = y ∧
          (K.shellAt sx).toCriticalFourShell.support =
            SelectedClass D.A S.oppApex1 radius ∧
          (K.shellAt sy).toCriticalFourShell.support =
            SelectedClass D.A S.oppApex1 ρ ∧
          SelectedClass D.A S.oppApex1
              (K.shellAt sx).toCriticalFourShell.radius =
            (K.shellAt sx).toCriticalFourShell.support ∧
          SelectedClass D.A S.oppApex1
              (K.shellAt sy).toCriticalFourShell.radius =
            (K.shellAt sy).toCriticalFourShell.support ∧
          (K.shellAt sx).toCriticalFourShell.support ∩
              S.capInteriorByIndex S.oppIndex1 =
            {P.source₁, P.source₂} ∧
          (K.shellAt sy).toCriticalFourShell.support ∩
              S.capInteriorByIndex S.oppIndex1 =
            {Pρ.source₁, Pρ.source₂} ∧
          2 ≤
            ((K.shellAt sx).toCriticalFourShell.support ∩
              S.capInteriorByIndex S.oppIndex1).card ∧
          2 ≤
            ((K.shellAt sy).toCriticalFourShell.support ∩
              S.capInteriorByIndex S.oppIndex1).card ∧
          Disjoint
            (K.shellAt sx).toCriticalFourShell.support
            (K.shellAt sy).toCriticalFourShell.support := by
  rcases hretained.2.2.2.1 with
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted,
      hsourceSurvives, hfirstApexBlocked, ⟨K⟩⟩
  have hxy : x ≠ y := by
    intro hxy
    subst y
    exact (Finset.disjoint_left.mp hpairsDisjoint) hxPair hyPair
  let sx : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨x, by simp⟩
  let sy : {z : ℝ² // z ∈ ({x, y} : Finset ℝ²)} := ⟨y, by simp⟩
  have hsxVal : sx.1 = x := rfl
  have hsyVal : sy.1 = y := rfl
  have hxClass : x ∈ SelectedClass D.A S.oppApex1 radius := by
    exact (Finset.mem_inter.mp (hfrontierInteriorEq.symm ▸ hxPair)).1
  have hyClass : y ∈ SelectedClass D.A S.oppApex1 ρ := by
    exact (Finset.mem_inter.mp (hρInteriorEq.symm ▸ hyPair)).1
  have hxRadius : dist S.oppApex1 sx.1 = radius := by
    simpa [sx] using (mem_selectedClass.mp hxClass).2
  have hyRadius : dist S.oppApex1 sy.1 = ρ := by
    simpa [sy] using (mem_selectedClass.mp hyClass).2
  have hsxSupport :
      (K.shellAt sx).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 radius :=
    K.shellAt_support_eq_selectedClass_of_dist_eq sx hxRadius
  have hsySupport :
      (K.shellAt sy).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 ρ :=
    K.shellAt_support_eq_selectedClass_of_dist_eq sy hyRadius
  have hsxNeSy : sx ≠ sy := by
    intro h
    exact hxy (congrArg Subtype.val h)
  refine
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted,
      hsourceSurvives, hfirstApexBlocked, K, sx, sy,
      hsxVal, hsyVal, hsxSupport, hsySupport,
      K.shellAt_selectedClass_eq sx, K.shellAt_selectedClass_eq sy,
      ?_, ?_, ?_, ?_, ?_⟩
  · simpa only [hsxSupport] using hfrontierInteriorEq
  · simpa only [hsySupport] using hρInteriorEq
  · exact
      K.shellAt_capInteriorByIndex_card_ge_two D S S.oppIndex1
        (ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex1 S) sx
  · exact
      K.shellAt_capInteriorByIndex_card_ge_two D S S.oppIndex1
        (ATailApexRichClassStructure.oppositeVertexByIndex_oppIndex1 S) sy
  · exact K.supports_pairwise_disjoint sx sy hsxNeSy

end

section InterfaceCounterpatterns

/-- The sharp origin-incidence packet permits the `Q`-origin arm while the
escaping row has only one `Q`-row point. -/
theorem escape_originIncidence_interface_counterpattern :
    ∃ (origin qRow escaped : Finset ℕ) (center z : ℕ),
      origin = qRow ∧
      origin.card = 4 ∧
      escaped.card = 4 ∧
      center ∈ origin ∧
      z ∈ escaped ∧
      z ∉ origin ∧
      (escaped ∩ origin).card ≤ 2 ∧
      2 ≤ (escaped \ origin).card ∧
      ¬ 3 ≤ (escaped ∩ qRow).card := by
  refine
    ⟨{0, 1, 2, 3}, {0, 1, 2, 3}, {0, 4, 5, 6}, 0, 6, ?_⟩
  decide

/-- Two disjoint exact core shells can each contribute two cap-interior points
and still be completely disjoint from the `Q` row. -/
theorem minimalCore_shell_interface_counterpattern :
    ∃ (cap shell₀ shell₁ qRow : Finset ℕ),
      shell₀.card = 4 ∧
      shell₁.card = 4 ∧
      qRow.card = 4 ∧
      Disjoint shell₀ shell₁ ∧
      2 ≤ (shell₀ ∩ cap).card ∧
      2 ≤ (shell₁ ∩ cap).card ∧
      ¬ 3 ≤ (shell₀ ∩ qRow).card ∧
      ¬ 3 ≤ (shell₁ ∩ qRow).card := by
  refine
    ⟨{0, 1, 4, 5}, {0, 1, 2, 3}, {4, 5, 6, 7},
      {8, 9, 10, 11}, ?_⟩
  decide

/-- A two-member minimal deletion core has the opposite singleton polarity
from a blocked-deletion triple: each singleton deletion may survive while the
pair deletion is blocked. -/
def interfaceSurvives (deleted : Finset ℕ) : Prop :=
  deleted.card ≤ 1

theorem minimalCore_blockingPolarity_interface_counterpattern :
    interfaceSurvives {0} ∧
      interfaceSurvives {1} ∧
      ¬ interfaceSurvives {0, 1} ∧
      ¬ ∃ blocked : Finset ℕ,
        blocked.card = 3 ∧
          ∀ w ∈ blocked, ¬ interfaceSurvives {w} := by
  refine ⟨by simp [interfaceSurvives], by simp [interfaceSurvives], ?_, ?_⟩
  · simp [interfaceSurvives]
  · rintro ⟨blocked, hcard, hblocked⟩
    have hnonempty : blocked.Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨w, hw⟩
    exact hblocked w hw (by simp [interfaceSurvives])

end InterfaceCounterpatterns

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
