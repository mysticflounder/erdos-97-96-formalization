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
open Census554.GeneralCarrierBridge

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

/- A card-six order producer needs only one same-arc assertion: the local
packet supplies the two-point cardinalities for both live slices. -/
def B1CardSixWinningSliceArc
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
    B1SliceSameBoundaryArc B apex uBlocker (b1USlice C) ∨
      B1SliceSameBoundaryArc B apex vBlocker (b1VSlice C)

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

/- Reuse the existing source-rich mutual-omission packet when an upstream
producer retains it for the escape source. -/
theorem b1EscapeSourceContext_of_exactFourSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    {other : CarrierVertex D.A}
    (hcontext : ExactFourMutualOmissionSourceContext C.R C.rho
      W.escape.escape.source other C.u C.v) :
    Nonempty (B1EscapeSourceContext C) := by
  have hsourceEscapeRow :
      W.escape.escape.source.1 ∈
        b1EscapeRow C W.escape.escape.source := by
    rcases b1_escapeSource_mem_escapeRow_inter_liveSlice W.escape with hu | hv
    · exact (Finset.mem_inter.mp hu).1
    · exact (Finset.mem_inter.mp hv).1
  refine ⟨{
    source := W.escape.escape.source
    escape := W.escape.escape
    source_eq_escape := rfl
    source_mem_physicalClass := by
      simpa [b1PhysicalClass] using hcontext.source_mem_class
    source_mem_secondCapInterior := hcontext.source_mem_interior
    source_mem_liveRow := W.escape.escape_mem_live_slice
    source_mem_escapeRow := hsourceEscapeRow
    escapeBlocker_ne_common := W.escape.escape.escapeBlocker_ne_common
    escapeBlocker_ne_apex := W.escape.escape.escapeBlocker_ne_apex
    source_mem_outsideFirstApexFiber := hcontext.source_mem_outside
    survives_retained_firstApex_deletion := hcontext.source_survives_q_or_w
    cross_omission := W.escape.cross_omission
  }⟩

/- A class-level non-membership proof is enough to discharge the outside-fiber
part of the source context. -/
theorem b1_escapeSource_mem_outsideFirstApexFiber_of_not_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    (hnot : W.escape.escape.source.1 ∉
      SelectedClass D.A S.oppApex1 radius) :
    W.escape.escape.source ∈ outsideFirstApexFiber C.R := by
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro hsourceFiber
  have hblockers := (Finset.mem_filter.mp hsourceFiber).2
  apply hnot
  apply
    (lateFirstApexSystem_centerAt_eq_iff_mem_class C.R
      W.escape.escape.source.2).mp
  calc
    (lateFirstApexSystem C.R).centerAt
        W.escape.escape.source.1 W.escape.escape.source.2 =
      (lateFirstApexSystem C.R).centerAt
        F.pair.q F.pair.q_mem_A :=
      congrArg Subtype.val hblockers
    _ = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq C.R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)

/- Outside sources that are not in the bad set carry one retained-deletion
survival witness.  The residual's named interior points must be identified
with the frontier pair points because the two structures store them separately. -/
theorem b1_escapeSource_survives_retained_firstApex_deletion_of_not_bad_of_pair_identifications
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    (hq_eq : C.R.interior_q = F.pair.q)
    (hw_eq : C.R.interior_w = F.pair.w)
    (houtside : W.escape.escape.source ∈ outsideFirstApexFiber C.R)
    (hnotBad : W.escape.escape.source ∉ badOutsideSources C.R) :
    HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
        ((lateFirstApexSystem C.R).centerAt
          W.escape.escape.source.1 W.escape.escape.source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
        ((lateFirstApexSystem C.R).centerAt
          W.escape.escape.source.1 W.escape.escape.source.2) := by
  by_cases hq :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem C.R).centerAt
          W.escape.escape.source.1 W.escape.escape.source.2)
  · left
    simpa [hq_eq] using hq
  by_cases hw :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem C.R).centerAt
          W.escape.escape.source.1 W.escape.escape.source.2)
  · right
    simpa [hw_eq] using hw
  exfalso
  apply hnotBad
  exact Finset.mem_filter.mpr ⟨houtside, hq, hw⟩

/- The favorable source branch now packages the two global adapters above
into the source context consumed downstream.  The pair identifications remain
explicit because they are not definitional fields of the residual. -/
theorem b1EscapeSourceContext_of_escape_source_outside_not_bad
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    (hq_eq : C.R.interior_q = F.pair.q)
    (hw_eq : C.R.interior_w = F.pair.w)
    (hnotFirst : W.escape.escape.source.1 ∉
      SelectedClass D.A S.oppApex1 radius)
    (hnotBad : W.escape.escape.source ∉ badOutsideSources C.R) :
    Nonempty (B1EscapeSourceContext C) := by
  have houtside :=
    b1_escapeSource_mem_outsideFirstApexFiber_of_not_mem_firstClass
      C W hnotFirst
  have hsurvives :=
    b1_escapeSource_survives_retained_firstApex_deletion_of_not_bad_of_pair_identifications
      C W hq_eq hw_eq houtside hnotBad
  exact b1EscapeSourceContext_of_star C W houtside hsurvives

/-- The intended producer outcome for a five/six wave. -/
def B1WinningSliceOrderOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  Nonempty (B1WinningLiveSliceSameBoundaryArc C) ∨
    Nonempty (B1EscapeSourceContext C)

/- The card-six producer interface maps one explicit winning-pair arc, or the
two explicit source-context facts, into the common order-or-context outcome. -/
theorem b1_cardSix_orderOutcome_of_arc_or_escapeSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (W : B1FiveSixWaveIngress C)
    (P : B1CardSixLocalRolePacket C)
    (_hcase : W.cardCase = B1FiveSixWaveCardCase.cardSix P)
    (hproducer :
      B1CardSixWinningSliceArc C ∨
        (W.escape.escape.source ∈ outsideFirstApexFiber C.R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
              ((lateFirstApexSystem C.R).centerAt
                W.escape.escape.source.1 W.escape.escape.source.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
              ((lateFirstApexSystem C.R).centerAt
                W.escape.escape.source.1 W.escape.escape.source.2)))) :
    B1WinningSliceOrderOutcome C := by
  rcases hproducer with harc | hsource
  · rcases harc with ⟨B, hu | hv⟩
    · left
      refine ⟨B, ?_⟩
      have hcards := b1_cardSix_liveSlices_card_two P
      simpa [B1WinningLiveSliceSameBoundaryArc, b1USlice,
        b1VSlice, b1PhysicalClass] using
        (Or.inl ⟨hcards.1, hu⟩)
    · left
      refine ⟨B, ?_⟩
      have hcards := b1_cardSix_liveSlices_card_two P
      simpa [B1WinningLiveSliceSameBoundaryArc, b1USlice,
        b1VSlice, b1PhysicalClass] using
        (Or.inr ⟨hcards.2, hv⟩)
  · right
    exact b1EscapeSourceContext_of_star C W hsource.1 hsource.2

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
