/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GeneratedSuccessorGeometry
import CapRankOppositeSide
import OriginalQGeneratedSuccessorPair

/-!
# Scratch: source-exact generated-successor rank residual

The cap-rank adapter needs two explicit facts: the generated row contains a
chosen cap companion, and the generated successor source remains in
`oppCap2`.  Neither fact is silently produced here.

For each live-heavy generated row this file preserves the exact three-way
classification:

* the successor source is outside `oppCap2`;
* the opposite named live-heavy center is omitted from the generated support;
* or the source is a certified opposite-side cap-rank move relative to that
  companion.

The already-consumed q-critical coherent-predecessor terminal is retained as
an unconditional omission field.  The paired endpoint packages both row
classifiers together with the existing exact successor-source split.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorGeometryRankScratch

open ATailContinuationBankMatchScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2GeneratedSuccessorGeometryScratch
open ATailRF2GeneratedSuccessorRankScratch
open ATailRF2LiveMixedHandlerScratch
open ATailRF2OriginalQGeneratedSuccessorPairScratch
open ATailRF2OriginalQOffLiveDeficitScratch
open ATailRF2OriginalQOutsideMiddleSplitScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- Exact outcome after testing the two premises required by the cap-rank
adapter.  The first two constructors are genuine residual alternatives, not
failed proof attempts. -/
inductive OriginalQOutsideMiddleRankOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted center companion : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor C G) : Prop
  | sourceOutsideOppCap2
      (source_not_mem : N.source ∉ S.oppCap2) :
      OriginalQOutsideMiddleRankOutcome G N
  | companionOmitted
      (companion_not_mem : companion ∉ G.generated.support) :
      OriginalQOutsideMiddleRankOutcome G N
  | rankMove
      (move : EqualRadiusOppositeRankData S S.oppIndex2
        center companion N.source) :
      OriginalQOutsideMiddleRankOutcome G N

/-- One live-heavy generated-successor row after the direct q-critical
terminal has been consumed.

The coherent-predecessor omission is stronger than a constructor-specific
field: every exact q-critical triple at this same original-`q` generated
center omits it. -/
structure TerminalFilteredOutsideMiddleRankResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    {center companion : ℝ²}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) G) : Type where
  qCritical_coherentSource_omitted :
    ∀ Q : ExactQCriticalAt D q center, R.sourcePair.x ∉ Q.support
  outcome : OriginalQOutsideMiddleRankOutcome
    (companion := companion) G N

/-- Generic terminal-filtered rank classifier.  Its only companion inputs
are facts already true for the opposite named live-heavy center. -/
private theorem nonempty_terminalFilteredRankResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    {center companion : ℝ²}
    (G : OriginalQOffLiveGeneratedProfile (S := S) W center)
    (N : OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) G)
    (hcompanionLive :
      companion ∈ ({q, t1, t2, t3} : Finset ℝ²))
    (hcompanionCap : companion ∈ S.oppCap2) :
    Nonempty
      (TerminalFilteredOutsideMiddleRankResidual
        K (companion := companion) G N) := by
  have hcompanionSource : companion ≠ N.source := by
    intro h
    exact N.source_not_mem_live (h ▸ hcompanionLive)
  refine ⟨{
    qCritical_coherentSource_omitted := ?_
    outcome := ?_ }⟩
  · intro Q hcoherent
    exact false_of_qCritical_coherentSource_mem_support
      K G.source_profile Q hcoherent
  · by_cases hsourceCap : N.source ∈ S.oppCap2
    · by_cases hcompanion : companion ∈ G.generated.support
      · rcases
          ATailRF2GeneratedSuccessorRankScratch.OriginalQOutsideMiddleSuccessor.nonempty_equalRadiusOppositeRankData
            N hcompanion hcompanionCap hsourceCap hcompanionSource with
          ⟨move⟩
        exact .rankMove move
      · exact .companionOmitted hcompanion
    · exact .sourceOutsideOppCap2 hsourceCap

/-- Rank classifier at the generated row centered at `K.named.x`, with
`K.named.y` as the actual cap companion. -/
theorem AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atX
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.x)
    (N : OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) G) :
    Nonempty
      (TerminalFilteredOutsideMiddleRankResidual
        K (companion := K.named.y) G N) := by
  apply nonempty_terminalFilteredRankResidual K G N
  · exact Finset.mem_insert_of_mem K.named.y_mem_dangerousTriple
  · exact
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.y_mem_liveStrict).2).1

/-- Symmetric rank classifier at the generated row centered at `K.named.y`,
with `K.named.x` as the actual cap companion. -/
theorem AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atY
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    (G : OriginalQOffLiveGeneratedProfile (S := S) W K.named.y)
    (N : OriginalQOutsideMiddleSuccessor
      (alignedSharedRowPacket X hcenter) G) :
    Nonempty
      (TerminalFilteredOutsideMiddleRankResidual
        K (companion := K.named.x) G N) := by
  apply nonempty_terminalFilteredRankResidual K G N
  · exact Finset.mem_insert_of_mem K.named.x_mem_dangerousTriple
  · exact
      (Finset.mem_sdiff.mp
        (Finset.mem_inter.mp K.named.x_mem_liveStrict).2).1

/-- Both source-exact rank residuals together with the already-checked
paired-successor source split. -/
structure OriginalQGeneratedSuccessorRankPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain)
    (Q : OriginalQGeneratedSuccessorPair K) : Type where
  sourceSplit : OriginalQGeneratedSuccessorPair.SourceSplit Q
  at_x : TerminalFilteredOutsideMiddleRankResidual K
    (companion := K.named.y) Q.generated.at_x Q.at_x
  at_y : TerminalFilteredOutsideMiddleRankResidual K
    (companion := K.named.x) Q.generated.at_y Q.at_y

/-- Package the strongest currently source-implied live-heavy handoff: both
successors, both terminal-filtered rank classifiers, and the exact paired
source split. -/
theorem OriginalQGeneratedSuccessorPair.nonempty_rankPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    {K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain}
    (Q : OriginalQGeneratedSuccessorPair K) :
    Nonempty (OriginalQGeneratedSuccessorRankPacket K Q) := by
  rcases
      ATailRF2GeneratedSuccessorGeometryRankScratch.AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atX
        K Q.generated.at_x Q.at_x with
    ⟨Rx⟩
  rcases
      ATailRF2GeneratedSuccessorGeometryRankScratch.AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atY
        K Q.generated.at_y Q.at_y with
    ⟨Ry⟩
  exact ⟨{
    sourceSplit := Q.sourceSplit
    at_x := Rx
    at_y := Ry }⟩

/-- Existence form from the actual live-heavy packet. -/
theorem AnchoredF2LiveHeavyReduction.exists_generatedSuccessorRankPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²} {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P₀ : AmbientRobustHistoryPair D S T.carrier rho}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {R : CoherentRCommonDeletionPacket T P₀ W.H}
    {A : AnchoredSourceCriticalTransition R}
    {X : RowExternalCommonDeletionSource A}
    {hcenter : R.firstCenter = p}
    {P : AnchoredProvenanceF2NormalForm W R A X hcenter}
    {chain : SourceFaithfulF2ThreeRowChain
      S W (alignedSharedRowPacket X hcenter)}
    (K : AnchoredF2LiveHeavyReduction W R A X hcenter P chain) :
    ∃ Q : OriginalQGeneratedSuccessorPair K,
      Nonempty (OriginalQGeneratedSuccessorRankPacket K Q) := by
  rcases nonempty_originalQGeneratedSuccessorPair K with ⟨Q⟩
  exact
    ⟨Q,
      ATailRF2GeneratedSuccessorGeometryRankScratch.OriginalQGeneratedSuccessorPair.nonempty_rankPacket
        Q⟩

#print axioms AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atX
#print axioms AnchoredF2LiveHeavyReduction.nonempty_rankResidual_atY
#print axioms OriginalQGeneratedSuccessorPair.nonempty_rankPacket
#print axioms
  AnchoredF2LiveHeavyReduction.exists_generatedSuccessorRankPacket

end ATailRF2GeneratedSuccessorGeometryRankScratch
end Problem97
