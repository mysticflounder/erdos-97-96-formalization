/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginTaggedCoordinator
import OriginalQOutsideMiddleSplit

/-!
# Full-parent surface for an original-q outside-middle successor

This scratch module pins the exact parent boundary of the remaining generated-source
successor.  It retains the MEC/cap leaf, the witnessed second large cap, the common
critical-map frontier, and the anchored coherent-R origin before passing to the aligned
F2 packet.

No contradiction is asserted here.  The one-field eliminator at the end isolates the
remaining mathematical assertion: this complete parent surface is empty.  In particular,
the adapter does not route through generic successor recursion or infer metric facts from
selected-support omission.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorParentScratch

open ATailCriticalPairFrontier
open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailROriginTaggedCoordinatorScratch
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The exact live-U1 parent inputs which exist before the frontier and F2 projections.

This record intentionally keeps the hypotheses which are not visible in a reduced
`CommonDeletionTwoCenterPacket`, including the MEC/cap construction, the retained live
row, global no-removability, and the common-critical-system existence input. -/
structure OriginalQOutsideMiddleParentContext
    (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²) : Type where
  hncol : ¬ Collinear ℝ (D.A : Set ℝ²)
  MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol
  hCirc : ∃ h12 h23 h13,
    MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩
  M : MoserTriangle D.A
  CP : CapTriple D.A M
  i : Fin 3
  rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u
  hM : M = MT.toMoserTriangle.toStructural hCirc
  hqCap : q ∈ CP.capAt i
  hsurplus : 4 < (CP.capAt i).card
  hqNonMoser : q ∉ M.verts
  hnotOppExact : ¬ CP.OppositePairExactAt i
  hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44
  hcard : 9 < D.A.card
  hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x
  hcritical : Nonempty (CriticalShellSystem D.A)
  hlocalNoQFree : U3LocalizedNoQFreePacket D q p
  hfixed : U3FixedTriplePacket D q p t1 t2 t3
  hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y) [p, q, t1, t2, t3, u]
  Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u
  hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p
  hsupport :
    (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
      ({q, t1, t2, t3} : Finset ℝ²)

/-- The CP-derived surplus packet used by the retained frontier. -/
def OriginalQOutsideMiddleParentContext.leafPacket
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) :
    SurplusCapPacket D.A :=
  leafSurplusPacket
    (D := D) (MT := P.MT) (hCirc := P.hCirc) (CP := P.CP) (i := P.i)
    (hM := P.hM) (hsurplus := P.hsurplus)

/-- The exact live-heavy/mixed F2 cases in which an original-`q` generated row supplies
an outside-middle successor.

The generated center is not anonymous: it is `x` or `y` in the live-heavy constructor,
and the strict live point `x` in the mixed constructor. -/
inductive AnchoredF2GeneratedSuccessorCase
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    (P : AnchoredProvenanceF2NormalForm W R A X hcenter) : Type
  | liveHeavyAtX
      {chain : SourceFaithfulF2ThreeRowChain
        S W (alignedSharedRowPacket X hcenter)}
      (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
      (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.x)
      (N : OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) :
      AnchoredF2GeneratedSuccessorCase P
  | liveHeavyAtY
      {chain : SourceFaithfulF2ThreeRowChain
        S W (alignedSharedRowPacket X hcenter)}
      (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
      (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.y)
      (N : OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) :
      AnchoredF2GeneratedSuccessorCase P
  | mixedAtX
      (boundary : F2MixedOneLiveOneSupportBoundary
        S W (alignedSharedRowPacket X hcenter))
      (named : NamedF2MixedWitnesses P.profile boundary)
      (G : OriginalQOffLiveGeneratedProfile (S := S) W named.x)
      (N : OriginalQOutsideMiddleSuccessor
        (alignedSharedRowPacket X hcenter) G) :
      AnchoredF2GeneratedSuccessorCase P

/-- Full parent provenance for one generated-source successor.

The coherent packet is indexed by a fixed terminal on the retained frontier, its history
source is definitionally tied to `frontier.pair.q`, and the fresh F2 source is the exact
`anchored` origin.  The aligned packet is a retyping at `p`; it does not replace the
original origin packet by an unrelated common-deletion witness. -/
structure OriginalQOutsideMiddleSuccessorParentSurface
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) : Type where
  j : Fin 3
  j_ne_i : j ≠ P.i
  secondLargeCap : 5 ≤ (P.CP.capAt j).card
  W : LiveDangerousRetainingSystem D p q t1 t2 t3
  q_mem_surplus : q ∈ P.leafPacket.surplusCap
  radius : ℝ
  radius_pos : 0 < radius
  radius_card_four :
    4 ≤ (SelectedClass D.A P.leafPacket.oppApex1 radius).card
  frontier : CriticalPairFrontier D P.leafPacket radius W.H
  terminal : FixedSingleFrontierRadiusTerminal frontier
  historyPair :
    AmbientRobustHistoryPair D P.leafPacket terminal.terminal.carrier radius
  history_source_eq_frontier_q : historyPair.x = frontier.pair.q
  coherent : CoherentRCommonDeletionPacket terminal.terminal historyPair W.H
  transition : AnchoredSourceCriticalTransition coherent
  fresh : RowExternalCommonDeletionSource transition
  fresh_off_surplus : fresh.point ∉ P.leafPacket.surplusCap
  firstCenter_eq_p : coherent.firstCenter = p
  f2 : AnchoredProvenanceF2NormalForm
    W coherent transition fresh firstCenter_eq_p
  generatedSuccessor : AnchoredF2GeneratedSuccessorCase f2

namespace OriginalQOutsideMiddleSuccessorParentSurface

/-- Recover the exact unaligned origin tag.  This is the constructor which existed before
the F2 packet was retyped at the live center. -/
noncomputable def toOriginTagged
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u}
    (K : OriginalQOutsideMiddleSuccessorParentSurface P) :
    OriginTaggedRCommonDeletion P.leafPacket K.W K.frontier where
  deleted := K.fresh.point
  firstCenter := K.coherent.firstCenter
  packet := K.fresh.toSharedRowCommonDeletionPacket
  origin := RCommonDeletionOrigin.anchored
    K.history_source_eq_frontier_q K.transition K.fresh K.fresh_off_surplus

end OriginalQOutsideMiddleSuccessorParentSurface

/-- The remaining mathematical assertion, with no projection of the parent geometry. -/
def FalseOfOriginalQOutsideMiddleSuccessor
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) : Prop :=
  ∀ _surface : OriginalQOutsideMiddleSuccessorParentSurface P, False

/-- One-field interface for the missing mathematical argument.

This is deliberately not a claimed producer: constructing `close` is exactly the open
direct-`False` theorem.  Keeping it as one field prevents a network of assumption-taking
wrappers from disguising several independent gaps. -/
structure OriginalQOutsideMiddleSuccessorEliminator
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) : Prop where
  close : FalseOfOriginalQOutsideMiddleSuccessor P

/-- Kernel-clean consumer adapter for the pinned full-parent theorem surface.

The only unproved input is the single `close` field of `E`; all parent, origin, F2, and
generated-row data are carried by `K`. -/
theorem false_of_originalQOutsideMiddleSuccessor
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u}
    (E : OriginalQOutsideMiddleSuccessorEliminator P)
    (K : OriginalQOutsideMiddleSuccessorParentSurface P) : False :=
  E.close K

#print axioms OriginalQOutsideMiddleSuccessorParentSurface.toOriginTagged
#print axioms false_of_originalQOutsideMiddleSuccessor

end ATailRF2GeneratedSuccessorParentScratch
end Problem97
