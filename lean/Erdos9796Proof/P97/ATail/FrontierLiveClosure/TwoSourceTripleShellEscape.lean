/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface

/-!
# Two-source triple-shell escape

This module exposes the global-K4/minimality producer needed by the
FreshThird residual without importing the downstream retained-core shard.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailExactFourPhysicalConsumer
open ATailMinimalUniqueFourCover
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

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
    {B : FrontierBiApexRobustResidual R}

/-- The three collision/source shells form a small seed, and global K4
minimality must continue one selected row outside that seed.  This is the
source-level producer for the FreshThird route: it preserves both collision
rows instead of collapsing them to a one-sided omission packet. -/
noncomputable def freshThirdCriticalTripleShellSeed
    (source : CriticalShellSystem.CarrierVertex D.A) : Finset ℝ² :=
  ((H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support ∪
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support) ∪
    (H.selectedAt source.1
      source.2).toCriticalFourShell.support

/-- BANKED PRODUCER (no current terminal consumer; do not count as closure).

Minimality pins one center of the three-shell seed at which *every*
selected four-class escapes the seed.  This is stronger than choosing one
favorable faithful-pattern row: downstream consumers may instantiate the
universal conclusion with whichever physical four-class their incidence arm
supplies.

The extra ambient-membership witness is exported explicitly so consumers do
not have to reopen the union-of-shells definition. -/
theorem exists_freshThird_pinnedCenter_allRows_escape_tripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ _hcenterSeed : center ∈ freshThirdCriticalTripleShellSeed P Pρ source,
        ∃ _hcenterA : center ∈ D.A,
          ∀ K : SelectedFourClass D.A center,
            ∃ z : ℝ²,
              z ∈ K.support ∧
                z ∉ freshThirdCriticalTripleShellSeed P Pρ source := by
  let K₁ :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell
  let K₂ :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  let K₃ :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell
  have hseedSub :
      freshThirdCriticalTripleShellSeed P Pρ source ⊆ D.A := by
    intro z hz
    simp only [freshThirdCriticalTripleShellSeed, Finset.mem_union] at hz
    rcases hz with (hz | hz) | hz
    · exact K₁.support_subset_A hz
    · exact K₂.support_subset_A hz
    · exact K₃.support_subset_A hz
  have hseedNonempty :
      (freshThirdCriticalTripleShellSeed P Pρ source).Nonempty := by
    refine ⟨source.1, ?_⟩
    exact Finset.mem_union_right _ K₃.q_mem_support
  have hseedCard :
      (freshThirdCriticalTripleShellSeed P Pρ source).card ≤ 12 := by
    calc
      (freshThirdCriticalTripleShellSeed P Pρ source).card
          ≤ (K₁.support ∪ K₂.support).card + K₃.support.card := by
            exact
              Finset.card_union_le (K₁.support ∪ K₂.support) K₃.support
      _ ≤ (K₁.support.card + K₂.support.card) + K₃.support.card := by
            exact
              Nat.add_le_add_right
                (Finset.card_union_le K₁.support K₂.support)
                K₃.support.card
      _ = 12 := by
            rw [K₁.support_card, K₂.support_card, K₃.support_card]
  have hseedProper :
      freshThirdCriticalTripleShellSeed P Pρ source ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 12 := by
      simpa [hseedEq] using hseedCard
    have hAge : 14 ≤ D.A.card :=
      FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen hlarge
    omega
  rcases
      exists_center_all_selectedFourClass_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenterSeed, hEveryRowEscapes⟩
  exact
    ⟨center, hcenterSeed, hseedSub hcenterSeed, hEveryRowEscapes⟩

/-- Global K4 and deletion minimality give a selected row with a point outside
the two retained collision shells and the chosen cap-source shell.  The
theorem is cardinality-free beyond the live branch's inherited
`carrier_card_ge_fourteen`; no finite census or solver certificate is used.
The output is intentionally a producer packet, not a contradiction. -/
theorem exists_freshThird_selectedRow_escape_tripleShellSeed
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ _hcenter : center ∈ freshThirdCriticalTripleShellSeed P Pρ source,
        ∃ K : SelectedFourClass D.A center,
          ∃ z : ℝ²,
            z ∈ K.support ∧
              z ∉ freshThirdCriticalTripleShellSeed P Pρ source := by
  let K₁ :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell
  let K₂ :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell
  let K₃ :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell
  have hseedSub :
      freshThirdCriticalTripleShellSeed P Pρ source ⊆ D.A := by
    intro z hz
    simp only [freshThirdCriticalTripleShellSeed, Finset.mem_union] at hz
    rcases hz with (hz | hz) | hz
    · exact K₁.support_subset_A hz
    · exact K₂.support_subset_A hz
    · exact K₃.support_subset_A hz
  have hseedNonempty :
      (freshThirdCriticalTripleShellSeed P Pρ source).Nonempty := by
    refine ⟨source.1, ?_⟩
    exact Finset.mem_union_right _ K₃.q_mem_support
  have hseedCard :
      (freshThirdCriticalTripleShellSeed P Pρ source).card ≤ 12 := by
    calc
      (freshThirdCriticalTripleShellSeed P Pρ source).card
          ≤ (K₁.support ∪ K₂.support).card + K₃.support.card := by
            exact
              Finset.card_union_le (K₁.support ∪ K₂.support) K₃.support
      _ ≤ (K₁.support.card + K₂.support.card) + K₃.support.card := by
            exact
              Nat.add_le_add_right
                (Finset.card_union_le K₁.support K₂.support)
                K₃.support.card
      _ = 12 := by
            rw [K₁.support_card, K₂.support_card, K₃.support_card]
  have hseedProper :
      freshThirdCriticalTripleShellSeed P Pρ source ≠ D.A := by
    intro hseedEq
    have hAcard : D.A.card ≤ 12 := by
      simpa [hseedEq] using hseedCard
    have hAge : 14 ≤ D.A.card :=
      FrontierLargeOppositeCapsBiApexRobustResidual.carrier_card_ge_fourteen hlarge
    omega
  rcases
      exists_faithfulCarrierPattern_of_globalK4
        D.K4 source.2 with ⟨G⟩
  rcases
      G.exists_row_escape_of_proper_subset
        R.minimal hseedNonempty hseedSub hseedProper with
    ⟨center, hcenter, z, hzRow, hzOutside⟩
  exact
    ⟨center, hcenter, G.classAt center (hseedSub hcenter),
      z, hzRow, hzOutside⟩

/-- CEGAR-ready form of the carrier-wide third-row producer.  The escaping
row center lies on one of the two retained collision shells or on the live
cap-source shell; no bounded-carrier or favorable-center assumption is added.

This is only an ingress adapter: a downstream certificate must still consume
the escaped row's incidence, cap-order, or metric data. -/
theorem exists_freshThird_selectedRow_escape_tripleShellSeed_originCases
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      (center ∈
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∨
        center ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support ∨
        center ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support) ∧
      ∃ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ source := by
  rcases
      exists_freshThird_selectedRow_escape_tripleShellSeed
        (P := P) (Pρ := Pρ) hlarge source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, ?_, K, z, hzK, hzOutside⟩
  simp only [freshThirdCriticalTripleShellSeed, Finset.mem_union] at hcenter
  rcases hcenter with (hP | hPρ) | hsource
  · exact Or.inl hP
  · exact Or.inr (Or.inl hPρ)
  · exact Or.inr (Or.inr hsource)

/-- Each center-origin arm of the carrier-wide third-row producer carries a
sharp two-circle incidence bound.  Because the new row is centered at a point
of its origin shell, rather than at that shell's center, the two rows meet in
at most two points; hence at least two points of the new four-row lie outside
the origin shell.

This is the source-level predicate intended for refinement search: it adds a
genuine global row and exact incidence information without identifying the
anonymous escaping point with any favorable named endpoint. -/
theorem exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (source : CriticalShellSystem.CarrierVertex D.A) :
    ∃ center : ℝ²,
      ∃ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ source ∧
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
                  (H.selectedAt source.1
                    source.2).toCriticalFourShell.support ∧
                (K.support ∩
                    (H.selectedAt source.1
                      source.2).toCriticalFourShell.support).card ≤ 2 ∧
                2 ≤
                  (K.support \
                    (H.selectedAt source.1
                      source.2).toCriticalFourShell.support).card)) := by
  rcases
      exists_freshThird_selectedRow_escape_tripleShellSeed_originCases
        (P := P) (Pρ := Pρ) hlarge source with
    ⟨center, hcenter, K, z, hzK, hzOutside⟩
  refine ⟨center, K, z, hzK, hzOutside, ?_⟩
  have originIncidence
      {rowCenter : ℝ²}
      (K₀ : SelectedFourClass D.A rowCenter)
      (hcenterSupport : center ∈ K₀.support) :
      (K.support ∩ K₀.support).card ≤ 2 ∧
        2 ≤ (K.support \ K₀.support).card := by
    have hcentersNe : center ≠ rowCenter := by
      intro hcenterEq
      exact K₀.center_not_mem (hcenterEq ▸ hcenterSupport)
    have hinter : (K.support ∩ K₀.support).card ≤ 2 :=
      SelectedFourClass.inter_card_le_two K K₀ hcentersNe
    have hdecomp :=
      Finset.card_sdiff_add_card_inter K.support K₀.support
    have houtside : 2 ≤ (K.support \ K₀.support).card := by
      rw [K.support_card] at hdecomp
      omega
    exact ⟨hinter, houtside⟩
  rcases hcenter with hP | hPρ | hsource
  · have hinc :=
      originIncidence
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass hP
    exact Or.inl ⟨hP, hinc.1, hinc.2⟩
  · have hinc :=
      originIncidence
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.toSelectedFourClass hPρ
    exact Or.inr (Or.inl ⟨hPρ, hinc.1, hinc.2⟩)
  · have hinc :=
      originIncidence
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass hsource
    exact Or.inr (Or.inr ⟨hsource, hinc.1, hinc.2⟩)

/-- Every row supplied by the triple-shell escape has overlap at most two with
the `Q` row.  If its center is distinct this is the two-circle bound; if the
centers coincide, the escaping point forces distinct radii and hence disjoint
supports. -/
theorem exists_q_tripleShellEscape_qRow_overlap_card_le_two
    (hlarge : FrontierLargeOppositeCapsBiApexRobustResidual B)
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
      exists_freshThird_selectedRow_escape_tripleShellSeed_originIncidenceCases
        (P := P) (Pρ := Pρ) hlarge Q.source₁ with
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

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
