/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress

/-!
# B1 winning live-slice ingress

This module sharpens the symmetric live-slice interface to the single winning
row actually consumed by the contradiction. It also restores the source-row
provenance dropped by the historical two-deletion adapter and identifies the
named two-point live slice in the nondegenerate source branch.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The source-row provenance that the historical two-deletion adapter drops.
Keeping this small packet upstream identifies a named live pair before any
fixed-cardinality or boundary-order encoding is introduced. -/
structure B1SourceProvenance
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  source : CarrierVertex D.A
  other : CarrierVertex D.A
  context : ExactFourMutualOmissionSourceContext
    C.R C.rho source other C.u C.v

/-- If the retained source is genuinely different from `u`, then source
provenance identifies the complete two-point `u`-slice as `{source,u}`. -/
theorem b1_uSlice_eq_source_u_of_sourceProvenance
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (P : B1SourceProvenance C)
    (huNeSource : C.u ≠ P.source) :
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uSlice :=
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
    uSlice.card = 2 ∧ uSlice = {P.source.1, C.u.1} := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uRow :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support
  let uSlice := uRow ∩ physicalClass
  have hsourceNeU : P.source.1 ≠ C.u.1 := by
    intro h
    apply huNeSource
    exact Subtype.ext h.symm
  have hsourceMem : P.source.1 ∈ uSlice :=
    Finset.mem_inter.mpr
      ⟨by simpa [uRow] using P.context.source_mem_u_row,
        by simpa [physicalClass] using P.context.source_mem_class⟩
  have huMem : C.u.1 ∈ uSlice :=
    Finset.mem_inter.mpr
      ⟨by
          simpa [uRow] using
            ((lateFirstApexSystem C.R).selectedAt
              C.u.1 C.u.2).toCriticalFourShell.q_mem_support,
        by simpa [physicalClass] using C.huClass⟩
  have hpairSubset : ({P.source.1, C.u.1} : Finset ℝ²) ⊆ uSlice := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hsourceMem
    · exact huMem
  have huSliceCardLe : uSlice.card ≤ 2 := by
    simpa [uSlice, uRow, physicalClass] using
      actualLateRow_secondClass_card_le_two C.R C.surface C.u
  have hpairCard : ({P.source.1, C.u.1} : Finset ℝ²).card = 2 := by
    simp [hsourceNeU]
  have huSliceEq : uSlice = {P.source.1, C.u.1} := by
    symm
    exact Finset.eq_of_subset_of_card_le hpairSubset
      (by simpa [hpairCard] using huSliceCardLe)
  have huSliceCard : uSlice.card = 2 := by
    rw [huSliceEq, hpairCard]
  simpa only [uSlice, uRow, physicalClass] using
    And.intro huSliceCard huSliceEq

/-- The physical second-apex class named by a B1 context. -/
noncomputable def b1PhysicalClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Finset ℝ² :=
  SelectedClass D.A S.oppApex2 C.rho

/-- The trace of the actual late row at `u` on the physical class. -/
noncomputable def b1USlice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Finset ℝ² :=
  ((lateFirstApexSystem C.R).selectedAt
    C.u.1 C.u.2).toCriticalFourShell.support ∩ b1PhysicalClass C

/-- The trace of the actual late row at `v` on the physical class. -/
noncomputable def b1VSlice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Finset ℝ² :=
  ((lateFirstApexSystem C.R).selectedAt
    C.v.1 C.v.2).toCriticalFourShell.support ∩ b1PhysicalClass C

/-- Source-entitled arbitrary-cardinality input for the escape-row wave.  It
retains a complete-carrier boundary indexing, the forced card-two live-slice
branch, a strict-cap escape source lying on a live row, and one original
deletion omitted from the escape row.  No boundary order of the live pair is
assumed. -/
structure B1EscapeRowProvenanceStar
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  boundary : BoundaryIndexing D.A
  escape : B1EscapeWitness C
  winning_slice_card :
    (b1USlice C).card = 2 ∨ (b1VSlice C).card = 2
  escape_mem_live_slice :
    escape.source.1 ∈ b1USlice C ∨ escape.source.1 ∈ b1VSlice C
  cross_omission :
    C.first.deleted.1 ∉ b1EscapeRow C escape.source ∨
      C.second.deleted.1 ∉ b1EscapeRow C escape.source

/-- Every B1 five/six normal form emits the source-entitled escape-row star.
This is the checked arbitrary-cardinality source boundary for Wave 8. -/
theorem nonempty_b1EscapeRowProvenanceStar
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Nonempty (B1EscapeRowProvenanceStar C) := by
  classical
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by
      have hcard := C.hcard
      omega)
  rcases exists_boundaryIndexing D.convex hncol with ⟨B⟩
  rcases nonempty_b1EscapeWitness C with ⟨E⟩
  have hwinning :
      (b1USlice C).card = 2 ∨ (b1VSlice C).card = 2 := by
    simpa [b1USlice, b1VSlice, b1PhysicalClass] using
      b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm C hnormal
  have hcover :
      b1PhysicalClass C =
        {C.first.deleted.1, C.second.deleted.1} ∪
          (b1USlice C ∪ b1VSlice C) := by
    simpa [b1PhysicalClass, b1USlice, b1VSlice] using hnormal.2.2
  have hsourceCover :
      E.source.1 ∈
        {C.first.deleted.1, C.second.deleted.1} ∪
          (b1USlice C ∪ b1VSlice C) := by
    rw [← hcover]
    simpa [b1PhysicalClass] using E.source_mem_class
  have hsourceNotPair :
      E.source.1 ∉ ({C.first.deleted.1, C.second.deleted.1} : Finset ℝ²) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or]
    exact
      ⟨fun h => E.source_ne_first (Subtype.ext h),
        fun h => E.source_ne_second (Subtype.ext h)⟩
  have hsourceLive :
      E.source.1 ∈ b1USlice C ∨ E.source.1 ∈ b1VSlice C := by
    rcases Finset.mem_union.mp hsourceCover with hpair | hlive
    · exact (hsourceNotPair hpair).elim
    · exact Finset.mem_union.mp hlive
  exact ⟨{
    boundary := B
    escape := E
    winning_slice_card := hwinning
    escape_mem_live_slice := hsourceLive
    cross_omission := b1_escapeRow_crossOmission C E
  }⟩

/-- The named escape source is a coherent common point of its own exact row
and one of the two live physical slices.  This is the source-level
intersection witness retained by the escape-row packet; it assumes no cyclic
placement of either slice. -/
theorem b1_escapeSource_mem_escapeRow_inter_liveSlice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (E : B1EscapeRowProvenanceStar C) :
    E.escape.source.1 ∈ b1EscapeRow C E.escape.source ∩ b1USlice C ∨
      E.escape.source.1 ∈ b1EscapeRow C E.escape.source ∩ b1VSlice C := by
  have hrow : E.escape.source.1 ∈ b1EscapeRow C E.escape.source := by
    simpa [b1EscapeRow] using
      ((lateFirstApexSystem C.R).selectedAt
        E.escape.source.1 E.escape.source.2).toCriticalFourShell.q_mem_support
  rcases E.escape_mem_live_slice with hu | hv
  · exact Or.inl (Finset.mem_inter.mpr ⟨hrow, hu⟩)
  · exact Or.inr (Finset.mem_inter.mpr ⟨hrow, hv⟩)

/-- The weakest live-slice order packet consumed by the contradiction: one
of the two live rows has a two-point physical slice, and that particular pair
lies on one boundary arc between the physical apex and its row blocker. -/
def B1WinningLiveSliceSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  ∃ B : BoundaryIndexing D.A,
    let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
    let Hlate := lateFirstApexSystem C.R
    let uBlocker := blockerLabel Hlate C.u.1 C.u.2
    let vBlocker := blockerLabel Hlate C.v.1 C.v.2
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uSlice :=
      (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
        physicalClass
    let vSlice :=
      (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
        physicalClass
    (uSlice.card = 2 ∧
        B1SliceSameBoundaryArc B apex uBlocker uSlice) ∨
      (vSlice.card = 2 ∧
        B1SliceSameBoundaryArc B apex vBlocker vSlice)

/-- The symmetric conditional packet specializes to the weaker winning-row
packet using the exact normal-form count. -/
theorem b1WinningLiveSliceSameBoundaryArc_of_liveSlicesSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsame : B1LiveSlicesSameBoundaryArc C) :
    B1WinningLiveSliceSameBoundaryArc C := by
  rcases hsame with ⟨B, huArc, hvArc⟩
  refine ⟨B, ?_⟩
  rcases b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm
      C hnormal with huCard | hvCard
  · exact Or.inl ⟨huCard, huArc huCard⟩
  · exact Or.inr ⟨hvCard, hvArc hvCard⟩

/-- A winning live-slice order packet already contradicts the two-circle
separation law; it needs no further normal-form data. -/
theorem false_of_b1WinningLiveSliceSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hsame : B1WinningLiveSliceSameBoundaryArc C) : False := by
  classical
  let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  let Hlate := lateFirstApexSystem C.R
  let uBlocker := blockerLabel Hlate C.u.1 C.u.2
  let vBlocker := blockerLabel Hlate C.v.1 C.v.2
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uRow :=
    (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell
  let vRow :=
    (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell
  rcases hsame with ⟨B, hwinningRaw⟩
  have hwinning :
      (((uRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSameBoundaryArc B apex uBlocker
          (uRow.support ∩ physicalClass)) ∨
      (((vRow.support ∩ physicalClass).card = 2) ∧
        B1SliceSameBoundaryArc B apex vBlocker
          (vRow.support ∩ physicalClass)) := by
    simpa [apex, Hlate, uBlocker, vBlocker, physicalClass, uRow, vRow] using
      hwinningRaw
  have huCenters : apex ≠ uBlocker := by
    intro h
    exact C.surface.secondApex_robust.centerAt_ne Hlate C.u.1 C.u.2
      (congrArg Subtype.val h).symm
  have hvCenters : apex ≠ vBlocker := by
    intro h
    exact C.surface.secondApex_robust.centerAt_ne Hlate C.v.1 C.v.2
      (congrArg Subtype.val h).symm
  rcases hwinning with ⟨huCard, huArc⟩ | ⟨hvCard, hvArc⟩
  · exact false_of_criticalShell_slice_card_two_of_sameBoundaryArc
      B apex uBlocker huCenters C.hrho (row := uRow) huCard huArc
  · exact false_of_criticalShell_slice_card_two_of_sameBoundaryArc
      B apex vBlocker hvCenters C.hrho (row := vRow) hvCard hvArc

end ATailFrontierLiveClosure
end Problem97
