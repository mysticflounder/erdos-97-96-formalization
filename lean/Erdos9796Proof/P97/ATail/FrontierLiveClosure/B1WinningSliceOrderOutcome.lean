/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1FiveSixWaveIngress

/-!
# B1 winning-slice order outcome

The five/six ingress retains the local escape row and a card-two live slice,
but it intentionally forgets the cap provenance needed to force a boundary
arc.  This module records the smallest source context that can carry that
provenance back to a neutral downstream consumer.  The order-or-context
producer itself remains an explicit proof obligation; no boundary order is
asserted from the cardinality normal form alone.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the card-six role packet both named live physical slices are genuinely
two-point slices.  This is the first card-six reduction: it uses only the
within-slice naming equalities and does not assume any boundary placement. -/
theorem b1_cardSix_liveSlices_card_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C) :
    (b1USlice C).card = 2 ∧ (b1VSlice C).card = 2 := by
  constructor
  · rw [show b1USlice C = {C.u.1, (P.uPhysical.other).1} by
      simpa [b1USlice, b1PhysicalClass] using P.uPhysical.slice_eq]
    simp [P.uPhysical.source_ne_other]
  · rw [show b1VSlice C = {C.v.1, (P.vPhysical.other).1} by
      simpa [b1VSlice, b1PhysicalClass] using P.vPhysical.slice_eq]
    simp [P.vPhysical.source_ne_other]

/-- In card six, the escape source lies in a genuine two-point winning slice.
The source orientation comes from the escape-row star; the cardinality comes
from the card-six local role packet. -/
theorem b1_cardSix_escapeSource_twoPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C) :
    (E.escape.source.1 ∈ b1USlice C ∧ (b1USlice C).card = 2) ∨
      (E.escape.source.1 ∈ b1VSlice C ∧ (b1VSlice C).card = 2) := by
  have hcards := b1_cardSix_liveSlices_card_two P
  rcases E.escape_mem_live_slice with hu | hv
  · exact Or.inl ⟨hu, hcards.1⟩
  · exact Or.inr ⟨hv, hcards.2⟩

/-- Source-oriented form of the exact card-five trace split.  The first two
arms identify a genuine two-point live slice containing the escape source; the
last two arms record that the source lies in a singleton slice.  No boundary
order is inferred in either case. -/
theorem b1_cardFive_escapeSource_trace
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hfive : (SelectedClass D.A S.oppApex2 C.rho).card = 5)
    (E : B1EscapeRowProvenanceStar C) :
    (E.escape.source.1 ∈ b1USlice C ∧ (b1USlice C).card = 2) ∨
      (E.escape.source.1 ∈ b1VSlice C ∧ (b1VSlice C).card = 2) ∨
      (E.escape.source.1 ∈ b1USlice C ∧ (b1USlice C).card = 1) ∨
      (E.escape.source.1 ∈ b1VSlice C ∧ (b1VSlice C).card = 1) := by
  have hsplit :
      ((b1USlice C).card = 1 ∧ (b1VSlice C).card = 2) ∨
        ((b1USlice C).card = 2 ∧ (b1VSlice C).card = 1) ∨
        ((b1USlice C).card = 2 ∧ (b1VSlice C).card = 2 ∧
          (b1USlice C ∩ b1VSlice C).card = 1) := by
    simpa [b1USlice, b1VSlice, b1PhysicalClass] using
      b1_live_slices_card_five_split C hnormal hfive
  rcases E.escape_mem_live_slice with hu | hv
  · rcases hsplit with hsingle | hrest
    · exact Or.inr (Or.inr (Or.inl ⟨hu, hsingle.1⟩))
    · rcases hrest with hpair | hshared
      · exact Or.inl ⟨hu, hpair.1⟩
      · exact Or.inl ⟨hu, hshared.1⟩
  · rcases hsplit with hsingle | hrest
    · exact Or.inr (Or.inl ⟨hv, hsingle.2⟩)
    · rcases hrest with hpair | hshared
      · exact Or.inr (Or.inr (Or.inr ⟨hv, hpair.2⟩))
      · exact Or.inr (Or.inl ⟨hv, hshared.2.1⟩)

/-- The source-rich alternative to a winning same-arc live pair.

The `escape` field reuses the already checked local escape-star data.  The
three additional fields are exactly the global information absent from the
historical B1 normal form: outside-first-apex-fiber provenance, retained
singleton-deletion survival, and the exact live-row orientation. -/
structure B1EscapeSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Type where
  source : CarrierVertex D.A
  escape : B1EscapeWitness C
  source_eq_escape : source = escape.source
  source_mem_physicalClass :
    source.1 ∈ b1PhysicalClass C
  source_mem_secondCapInterior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_liveRow :
    source.1 ∈ b1USlice C ∨ source.1 ∈ b1VSlice C
  source_mem_escapeRow :
    source.1 ∈ b1EscapeRow C source
  escapeBlocker_ne_common :
    b1EscapeBlocker C source ≠ b1CommonBlocker C
  escapeBlocker_ne_apex :
    b1EscapeBlocker C source ≠ S.oppApex2
  source_mem_outsideFirstApexFiber :
    source ∈ outsideFirstApexFiber C.R
  survives_retained_firstApex_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
        ((lateFirstApexSystem C.R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
        ((lateFirstApexSystem C.R).centerAt source.1 source.2)
  cross_omission :
    C.first.deleted.1 ∉ b1EscapeRow C source ∨
      C.second.deleted.1 ∉ b1EscapeRow C source

/-- Package the local star once the cap producer supplies its two missing
global facts.  This adapter is intentionally neutral: it does not choose a
boundary order and does not import any downstream rigid closure. -/
theorem b1EscapeSourceContext_of_star
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    (houtside : W.escape.escape.source ∈ outsideFirstApexFiber C.R)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
          ((lateFirstApexSystem C.R).centerAt
            W.escape.escape.source.1 W.escape.escape.source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
          ((lateFirstApexSystem C.R).centerAt
            W.escape.escape.source.1 W.escape.escape.source.2)) :
    Nonempty (B1EscapeSourceContext C) := by
  classical
  let source : CarrierVertex D.A := W.escape.escape.source
  have hsourceLiveRow :
      source.1 ∈ b1USlice C ∨ source.1 ∈ b1VSlice C := by
    simpa [source] using W.escape.escape_mem_live_slice
  have hsourceEscapeRow : source.1 ∈ b1EscapeRow C source := by
    rcases b1_escapeSource_mem_escapeRow_inter_liveSlice W.escape with hu | hv
    · simpa [source] using (Finset.mem_inter.mp hu).1
    · simpa [source] using (Finset.mem_inter.mp hv).1
  refine ⟨{
    source := source
    escape := W.escape.escape
    source_eq_escape := by rfl
    source_mem_physicalClass := by
      simpa [source, b1PhysicalClass] using W.escape.escape.source_mem_class
    source_mem_secondCapInterior := by
      simpa [source] using W.escape.escape.source_mem_interior
    source_mem_liveRow := hsourceLiveRow
    source_mem_escapeRow := hsourceEscapeRow
    escapeBlocker_ne_common := by
      simpa [source] using W.escape.escape.escapeBlocker_ne_common
    escapeBlocker_ne_apex := by
      simpa [source] using W.escape.escape.escapeBlocker_ne_apex
    source_mem_outsideFirstApexFiber := by
      simpa [source] using houtside
    survives_retained_firstApex_deletion := by
      simpa [source] using hsurvives
    cross_omission := W.escape.cross_omission
  }⟩

/-- The intended producer outcome for a five/six wave. -/
def B1WinningSliceOrderOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  Nonempty (B1WinningLiveSliceSameBoundaryArc C) ∨
    Nonempty (B1EscapeSourceContext C)

/-- Neutral final dispatch once the order-or-context producer and the source
consumer have both been supplied. -/
theorem false_of_b1WinningSliceOrderOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (houtcome : B1WinningSliceOrderOutcome C)
    (hsource : ∀ _P : B1EscapeSourceContext C, False) : False := by
  rcases houtcome with horder | hsource'
  · exact false_of_b1WinningLiveSliceSameBoundaryArc C horder.some
  · exact hsource hsource'.some

end ATailFrontierLiveClosure
end Problem97
