/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginTaggedCoordinator
import same_cap_second_center

/-!
# Source-faithful reduction of the unaligned R branch

The origin-tagged coordinator leaves one packet-level handler completely
opaque:

```text
RCommonDeletionBranch.unaligned : firstCenter ≠ p
```

This file keeps the exact common critical system and derives the strongest
uniform row consequence available before new cap/order geometry is supplied.
The first common-deletion row and the exact live `p` row are centered at
distinct points, so they overlap in at most two points.  Since both rows have
cardinality four, the first row contains two distinct points outside the live
row.

On the coherent anchored and reciprocal origins, substantially more survives:
the named coherent source is q-critical at its actual blocker, while exact
q-deleted rows survive at both the live center and the second opposite apex.
The spent origin has an exact split according to whether the spent frontier
source lies in the live row.

None of these packets is itself contradictory.  The final theorem identifies
one exact consumer-ready missing field: if two first-row/live-row common
points lie outside one cap containing both centers, the existing ordered-cap
uniqueness theorem gives `False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRUnalignedHandlerScratch

open ATAILForceScratch
open ATAILStageOnePrescribedApexDichotomy
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailROriginTaggedCoordinatorScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Regard the retained exact live row as a q-allowed U5 class. -/
def liveRowAllowed
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3) :
    U5QAllowedK4Class D p W.liveRow.toCriticalFourShell.support :=
  criticalFourShellToU5QAllowedK4Class W.liveRow.toCriticalFourShell

/-- Any selected four-class on a twice-erased carrier is an exact
source-deleted U5 row on the ambient carrier. -/
def doubleErasedSelectedFourToSourceDeleted
    {D : CounterexampleData} {source deleted center : ℝ²}
    (K : SelectedFourClass ((D.A.erase source).erase deleted) center) :
    U5QDeletedK4Class D source center K.support where
  subset := by
    intro z hz
    have hzDouble := K.support_subset_A hz
    have hzEraseSource := (Finset.mem_erase.mp hzDouble).2
    have hzSource : z ≠ source := (Finset.mem_erase.mp hzEraseSource).1
    have hzA : z ∈ D.A := (Finset.mem_erase.mp hzEraseSource).2
    change z ∈ (D.A.erase source).erase center
    exact Finset.mem_erase.mpr
      ⟨fun hcenter ↦ K.center_not_mem (hcenter ▸ hz),
        Finset.mem_erase.mpr ⟨hzSource, hzA⟩⟩
  card_four := by rw [K.support_card]
  q_not_mem := by
    intro hsource
    have hsourceDouble := K.support_subset_A hsource
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp hsourceDouble).2).1 rfl
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- The first exact common-deletion row meets the exact live row in at most
two points whenever its center is not the live center. -/
theorem firstRow_inter_live_card_le_two
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    {S : SurplusCapPacket D.A}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (hcenter : center₁ ≠ p) :
    (C.B₁ ∩ ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2 := by
  rw [← W.liveRow_support]
  exact U5QAllowedK4Class.inter_card_le_two
    C.row₁.toQAllowedK4Class (liveRowAllowed W) hcenter

/-- Uniform positive information on the unaligned branch: two distinct
points of the first exact row lie outside the exact live row. -/
structure UnalignedFirstRowOffLivePair
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    {S : SurplusCapPacket D.A}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2) : Type where
  x : ℝ²
  w : ℝ²
  x_ne_w : x ≠ w
  x_mem_firstRow : x ∈ C.B₁
  w_mem_firstRow : w ∈ C.B₁
  x_not_mem_live : x ∉ ({q, t1, t2, t3} : Finset ℝ²)
  w_not_mem_live : w ∉ ({q, t1, t2, t3} : Finset ℝ²)
  x_mem_A : x ∈ D.A
  w_mem_A : w ∈ D.A
  firstCenter_equidistant :
    dist center₁ x = dist center₁ w

/-- Construct the uniform off-live pair without choosing a new row. -/
theorem nonempty_unalignedFirstRowOffLivePair
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    {S : SurplusCapPacket D.A}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (hcenter : center₁ ≠ p) :
    Nonempty (UnalignedFirstRowOffLivePair W C) := by
  classical
  let live : Finset ℝ² := {q, t1, t2, t3}
  have hinter : (C.B₁ ∩ live).card ≤ 2 := by
    simpa [live] using firstRow_inter_live_card_le_two W C hcenter
  have hsplit := Finset.card_inter_add_card_sdiff C.B₁ live
  have hcard : C.B₁.card = 4 := C.B₁_card
  have hoff : 2 ≤ (C.B₁ \ live).card := by
    omega
  have hone : 1 < (C.B₁ \ live).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxB, hxLive⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwB, hwLive⟩
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hxB)).2).2
  have hwA : w ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hwB)).2).2
  exact ⟨{
    x := x
    w := w
    x_ne_w := hxw
    x_mem_firstRow := hxB
    w_mem_firstRow := hwB
    x_not_mem_live := by simpa [live] using hxLive
    w_not_mem_live := by simpa [live] using hwLive
    x_mem_A := hxA
    w_mem_A := hwA
    firstCenter_equidistant :=
      (C.row₁.same_radius x hxB).trans
        (C.row₁.same_radius w hwB).symm
  }⟩

/-- Exact source-indexed U5 fan retained on either coherent origin. -/
structure CoherentUnalignedSourceFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H) : Type where
  source_not_mem_live :
    R.sourcePair.x ∉ ({q, t1, t2, t3} : Finset ℝ²)
  source_qCritical_at_firstCenter :
    Nonempty (U5QCriticalTripleClass D R.sourcePair.x R.firstCenter
      (R.sourceRow.support.erase R.sourcePair.x))
  liveRow_sourceDeleted :
    U5QDeletedK4Class D R.sourcePair.x p
      W.liveRow.toCriticalFourShell.support
  secondApexRow_sourceDeleted :
    U5QDeletedK4Class D R.sourcePair.x S.oppApex2
      R.secondApexRow.support
  firstCenter_ne_live : R.firstCenter ≠ p
  firstCenter_ne_secondApex : R.firstCenter ≠ S.oppApex2
  firstRow_inter_live_card_le_two :
    (R.sourceRow.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2
  offLivePair :
    UnalignedFirstRowOffLivePair W R.toCommonDeletionTwoCenterPacket

/-- Construct the coherent source fan.  This is the same theorem for the
anchored and reciprocal origins because both retain the same coherent source
and exact rows. -/
theorem nonempty_coherentUnalignedSourceFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (R : CoherentRCommonDeletionPacket T P W.H)
    (hcenter : R.firstCenter ≠ p) :
    Nonempty (CoherentUnalignedSourceFan W R) := by
  have hsourceOutside :
      R.sourcePair.x ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
    intro hsource
    exact hcenter ((W.coherent_source_center_eq_p_iff R).2 hsource)
  have hsourceOutsideLive :
      R.sourcePair.x ∉ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact hsourceOutside
  have hcritical :
      Nonempty (U5QCriticalTripleClass D R.sourcePair.x R.firstCenter
        (R.sourceRow.support.erase R.sourcePair.x)) :=
    (criticalFourShellToU5QAllowedK4Class R.sourceRow
      ).qCriticalTriple_of_mem_q
        R.sourceRow.support_card R.source_mem_sourceRow
  have hlive :
      U5QDeletedK4Class D R.sourcePair.x p
        W.liveRow.toCriticalFourShell.support :=
    criticalFourShellToU5QDeletedK4ClassOfNotMem
      W.liveRow.toCriticalFourShell hsourceOutsideLive
  have hsecond :
      U5QDeletedK4Class D R.sourcePair.x S.oppApex2
        R.secondApexRow.support :=
    doubleErasedSelectedFourToSourceDeleted R.secondApexRow
  rcases nonempty_unalignedFirstRowOffLivePair
      W R.toCommonDeletionTwoCenterPacket hcenter with ⟨offLive⟩
  exact ⟨{
    source_not_mem_live := hsourceOutside
    source_qCritical_at_firstCenter := hcritical
    liveRow_sourceDeleted := hlive
    secondApexRow_sourceDeleted := hsecond
    firstCenter_ne_live := hcenter
    firstCenter_ne_secondApex := R.firstCenter_ne_oppApex2
    firstRow_inter_live_card_le_two :=
      W.coherent_sourceRow_inter_base_card_le_two_of_center_ne_p R hcenter
    offLivePair := offLive
  }⟩

/-- The spent-origin live row is either q-critical at `p`, or it is a third
exact q-deleted row beside the two common-deletion rows. -/
inductive SpentUnalignedLiveStatus
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted S.oppApex1 S.oppApex2) : Type
  | qCritical
      (deleted_mem_live :
        deleted ∈ ({q, t1, t2, t3} : Finset ℝ²))
      (live_qCritical :
        Nonempty (U5QCriticalTripleClass D deleted p
          (W.liveRow.toCriticalFourShell.support.erase deleted)))
      (p_ne_firstApex : p ≠ S.oppApex1)
      (p_ne_secondApex : p ≠ S.oppApex2) :
      SpentUnalignedLiveStatus W C
  | qDeleted
      (deleted_not_mem_live :
        deleted ∉ ({q, t1, t2, t3} : Finset ℝ²))
      (live_qDeleted :
        U5QDeletedK4Class D deleted p
          W.liveRow.toCriticalFourShell.support)
      (firstApex_ne_live : S.oppApex1 ≠ p) :
      SpentUnalignedLiveStatus W C

/-- Construct the exact spent-origin split. -/
noncomputable def spentUnalignedLiveStatus
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted S.oppApex1 S.oppApex2)
    (hcenter : S.oppApex1 ≠ p) :
    SpentUnalignedLiveStatus W C := by
  by_cases hdeleted :
      deleted ∈ ({q, t1, t2, t3} : Finset ℝ²)
  · have hdeletedSupport :
        deleted ∈ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact hdeleted
    have hcritical :
        Nonempty (U5QCriticalTripleClass D deleted p
          (W.liveRow.toCriticalFourShell.support.erase deleted)) :=
      (liveRowAllowed W).qCriticalTriple_of_mem_q
        W.liveRow.toCriticalFourShell.support_card hdeletedSupport
    have hblocker : W.H.centerAt deleted C.q_mem_A = p :=
      (W.centerAt_eq_p_iff deleted C.q_mem_A).2 hdeleted
    exact SpentUnalignedLiveStatus.qCritical hdeleted hcritical
      (by simpa [hblocker] using C.actual_blocker_ne_center₁)
      (by simpa [hblocker] using C.actual_blocker_ne_center₂)
  · have hdeletedSupport :
        deleted ∉ W.liveRow.toCriticalFourShell.support := by
      rw [W.liveRow_support]
      exact hdeleted
    exact SpentUnalignedLiveStatus.qDeleted hdeleted
      (criticalFourShellToU5QDeletedK4ClassOfNotMem
        W.liveRow.toCriticalFourShell hdeletedSupport)
      hcenter

/-- Origin-visible normal form for the unaligned branch.  No anchored,
reciprocal, or spent provenance is projected away. -/
inductive OriginTaggedUnalignedOutcome
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H) : Type
  | anchored
      {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (A : AnchoredSourceCriticalTransition R)
      (X : RowExternalCommonDeletionSource A)
      (fresh_off_surplus : X.point ∉ S.surplusCap)
      (fan : CoherentUnalignedSourceFan W R) :
      OriginTaggedUnalignedOutcome S W F
  | reciprocal
      {T : FixedSingleFrontierRadiusTerminal F}
      {P : AmbientRobustHistoryPair D S T.terminal.carrier radius}
      (source_eq : P.x = F.pair.q)
      {R : CoherentRCommonDeletionPacket T.terminal P W.H}
      (X : ReciprocalDirectedCrossResidual R)
      (G : ReciprocalCommonDeletionContinuation X)
      (fan : CoherentUnalignedSourceFan W R) :
      OriginTaggedUnalignedOutcome S W F
  | spent
      (E : FrontierRadiusSpentAtEntry F)
      (C : CommonDeletionTwoCenterPacket
        D W.H F.pair.q S.oppApex1 S.oppApex2)
      (status : SpentUnalignedLiveStatus W C)
      (offLivePair : UnalignedFirstRowOffLivePair W C) :
      OriginTaggedUnalignedOutcome S W F

/-- Every origin-tagged unaligned packet reaches the exact normal form above.
This theorem is the source-current replacement for an anonymous
`firstCenter ≠ p` handler. -/
theorem nonempty_originTaggedUnalignedOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    (O : OriginTaggedRCommonDeletion S W F)
    (hcenter : O.firstCenter ≠ p) :
    Nonempty (OriginTaggedUnalignedOutcome S W F) := by
  rcases O with ⟨deleted, center₁, C, origin⟩
  rcases origin with
    ⟨hsource, A, X, hXOff⟩ | ⟨hsource, X, G⟩ | ⟨E, Cspent⟩
  · rcases nonempty_coherentUnalignedSourceFan W _ hcenter with ⟨fan⟩
    exact ⟨OriginTaggedUnalignedOutcome.anchored hsource A X hXOff fan⟩
  · rcases nonempty_coherentUnalignedSourceFan W _ hcenter with ⟨fan⟩
    exact ⟨OriginTaggedUnalignedOutcome.reciprocal hsource X G fan⟩
  · let status := spentUnalignedLiveStatus W Cspent hcenter
    rcases nonempty_unalignedFirstRowOffLivePair W Cspent hcenter with
      ⟨offLive⟩
    exact ⟨OriginTaggedUnalignedOutcome.spent E Cspent status offLive⟩

/-- Exact missing cap-local antecedent consumed by the existing ordered-cap
uniqueness theorem: the two distinct centers lie in one indexed cap and the
two exact rows share at least two points outside that cap. -/
def UnalignedCommonCapLiveMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2) : Prop :=
  ∃ k : Fin 3,
    p ∈ S.capByIndex k ∧
    center₁ ∈ S.capByIndex k ∧
    2 ≤ (C.B₁ ∩
      (({q, t1, t2, t3} : Finset ℝ²) \ S.capByIndex k)).card

/-- The common-cap live multiplicity field closes the unaligned packet
directly through `outsidePair_unique_capCenter`. -/
theorem false_of_unalignedCommonCapLiveMultiplicity
    {D : CounterexampleData} {p q t1 t2 t3 deleted center₁ : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted center₁ S.oppApex2)
    (hcenter : center₁ ≠ p)
    (H : UnalignedCommonCapLiveMultiplicity S W C) :
    False := by
  classical
  rcases H with ⟨k, hpCap, hcCap, htwo⟩
  have hone :
      1 < (C.B₁ ∩
        (({q, t1, t2, t3} : Finset ℝ²) \ S.capByIndex k)).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_inter.mp hx with ⟨hxB, hxLiveOff⟩
  rcases Finset.mem_inter.mp hw with ⟨hwB, hwLiveOff⟩
  rcases Finset.mem_sdiff.mp hxLiveOff with ⟨hxLive, hxOff⟩
  rcases Finset.mem_sdiff.mp hwLiveOff with ⟨hwLive, hwOff⟩
  have hxLiveSupport :
      x ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact hxLive
  have hwLiveSupport :
      w ∈ W.liveRow.toCriticalFourShell.support := by
    rw [W.liveRow_support]
    exact hwLive
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hxB)).2).2
  have hwA : w ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (C.row₁.subset hwB)).2).2
  have hpdist : dist p x = dist p w :=
    (W.liveRow.toCriticalFourShell.support_eq_radius x hxLiveSupport).trans
      (W.liveRow.toCriticalFourShell.support_eq_radius w hwLiveSupport).symm
  have hcdist : dist center₁ x = dist center₁ w :=
    (C.row₁.same_radius x hxB).trans
      (C.row₁.same_radius w hwB).symm
  exact false_of_sameCap_outsidePair_twoCenters
    S D.convex k hpCap hcCap hcenter hxA hwA hxw
      hxOff hwOff hpdist hcdist

#print axioms liveRowAllowed
#print axioms doubleErasedSelectedFourToSourceDeleted
#print axioms firstRow_inter_live_card_le_two
#print axioms nonempty_unalignedFirstRowOffLivePair
#print axioms nonempty_coherentUnalignedSourceFan
#print axioms spentUnalignedLiveStatus
#print axioms nonempty_originTaggedUnalignedOutcome
#print axioms false_of_unalignedCommonCapLiveMultiplicity

end ATailRUnalignedHandlerScratch
end Problem97
