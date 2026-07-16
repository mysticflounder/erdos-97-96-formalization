/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AnchoredSupportHeavyCoupling

/-!
# Scratch: deleted-source pair-row boundary on the anchored F2 arm

The anchored support-heavy packet already places the deleted source in strict
`oppCap1` and its two named support-heavy points in strict `oppCap2` on a
common second-apex row.  Cap order therefore proves that the two points have
different distances from the deleted source.

Consequently, a selected four-class centered at the deleted source cannot
contain both points.  This file records the source-faithful negative boundary:
every such row contains at most one of the named pair, including rows supplied
by global K4 or by any critical-shell-system entry whose blocker happens to be
the deleted source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2DeletedSourcePairRowScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2AnchoredProvenanceLiftScratch
open ATailRF2AnchoredSupportHeavyCouplingScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket.AnchoredSourceCriticalTransition
open ATailRParentDangerousRowCouplingScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

/-- The second named support-heavy point is outside the full deleted-source
radius class through the first point. -/
theorem AnchoredSupportHeavyCoupling.t_not_mem_deletedSourceRadiusThroughS
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) :
    K.named.t ∉
      SelectedClass D.A X.point (dist X.point K.named.s) := by
  intro ht
  exact K.deletedSource_separates_supportPair
    (mem_selectedClass.mp ht).2.symm

/-- Symmetrically, the first named support-heavy point is outside the full
deleted-source radius class through the second point. -/
theorem AnchoredSupportHeavyCoupling.s_not_mem_deletedSourceRadiusThroughT
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) :
    K.named.s ∉
      SelectedClass D.A X.point (dist X.point K.named.t) := by
  intro hs
  exact K.deletedSource_separates_supportPair
    (mem_selectedClass.mp hs).2

/-- Every selected four-class centered at the deleted source contains at most
one of the two named support-heavy points. -/
theorem AnchoredSupportHeavyCoupling.deletedSourceRow_inter_namedPair_card_le_one
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : SelectedFourClass D.A X.point) :
    ((({K.named.s, K.named.t} : Finset ℝ²) ∩ Q.support).card ≤ 1) := by
  rw [Finset.card_le_one]
  intro u hu v hv
  have huPair : u = K.named.s ∨ u = K.named.t := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hu).1
  have hvPair : v = K.named.s ∨ v = K.named.t := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hv).1
  have huQ : u ∈ Q.support := (Finset.mem_inter.mp hu).2
  have hvQ : v ∈ Q.support := (Finset.mem_inter.mp hv).2
  rcases huPair with rfl | rfl <;>
    rcases hvPair with rfl | rfl
  · rfl
  · exact False.elim
      (K.false_of_deletedSourceRow_contains_pair Q huQ hvQ)
  · exact False.elim
      (K.false_of_deletedSourceRow_contains_pair Q hvQ huQ)
  · rfl

/-- Pointwise form of the same boundary: every deleted-source row omits one
of the two named support-heavy points. -/
theorem AnchoredSupportHeavyCoupling.deletedSourceRow_omits_namedPair
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    (Q : SelectedFourClass D.A X.point) :
    K.named.s ∉ Q.support ∨ K.named.t ∉ Q.support := by
  by_cases hs : K.named.s ∈ Q.support
  · right
    intro ht
    exact K.false_of_deletedSourceRow_contains_pair Q hs ht
  · exact Or.inl hs

/-- There is no selected four-class centered at the deleted source containing
both named support-heavy points. -/
theorem AnchoredSupportHeavyCoupling.not_exists_deletedSourceRow_contains_namedPair
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) :
    ¬ ∃ Q : SelectedFourClass D.A X.point,
      K.named.s ∈ Q.support ∧ K.named.t ∈ Q.support := by
  rintro ⟨Q, hs, ht⟩
  exact K.false_of_deletedSourceRow_contains_pair Q hs ht

/-- Global K4 does supply a row at the deleted source, but every such row
necessarily omits at least one member of the named support-heavy pair. -/
theorem AnchoredSupportHeavyCoupling.exists_globalK4_deletedSourceRow_boundary
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) :
    ∃ Q : SelectedFourClass D.A X.point,
      ((({K.named.s, K.named.t} : Finset ℝ²) ∩ Q.support).card ≤ 1) := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 X.point_mem_A with ⟨Q⟩
  exact ⟨Q,
    AnchoredSupportHeavyCoupling.deletedSourceRow_inter_namedPair_card_le_one K Q⟩

/-- Direct global-K4 omission form. -/
theorem AnchoredSupportHeavyCoupling.exists_globalK4_deletedSourceRow_omitting_namedPair
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P) :
    ∃ Q : SelectedFourClass D.A X.point,
      K.named.s ∉ Q.support ∨ K.named.t ∉ Q.support := by
  rcases exists_selectedFourClass_of_globalK4 D.K4 X.point_mem_A with ⟨Q⟩
  exact ⟨Q, AnchoredSupportHeavyCoupling.deletedSourceRow_omits_namedPair K Q⟩

/-- If an entry of the retained critical-shell map has blocker center equal
to the deleted source, its exact selected shell also contains at most one
member of the named support-heavy pair. -/
theorem AnchoredSupportHeavyCoupling.criticalShellRow_inter_namedPair_card_le_one
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
    (K : AnchoredSupportHeavyCoupling W R A X hcenter P)
    {source : ℝ²} (hsource : source ∈ D.A)
    (hblocker : W.H.centerAt source hsource = X.point) :
    ((({K.named.s, K.named.t} : Finset ℝ²) ∩
      (W.H.selectedAt source hsource).toCriticalFourShell.support).card ≤ 1) := by
  rw [Finset.card_le_one]
  intro u hu v hv
  have huPair : u = K.named.s ∨ u = K.named.t := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hu).1
  have hvPair : v = K.named.s ∨ v = K.named.t := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hv).1
  have huShell :
      u ∈ (W.H.selectedAt source hsource).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hu).2
  have hvShell :
      v ∈ (W.H.selectedAt source hsource).toCriticalFourShell.support :=
    (Finset.mem_inter.mp hv).2
  rcases huPair with rfl | rfl <;>
    rcases hvPair with rfl | rfl
  · rfl
  · exact False.elim (K.deletedSource_separates_supportPair (by
      simpa only [hblocker] using
        ((W.H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          K.named.s huShell).trans
        ((W.H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          K.named.t hvShell).symm))
  · exact False.elim (K.deletedSource_separates_supportPair (by
      simpa only [hblocker] using
        ((W.H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          K.named.s hvShell).trans
        ((W.H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
          K.named.t huShell).symm))
  · rfl

#print axioms AnchoredSupportHeavyCoupling.t_not_mem_deletedSourceRadiusThroughS
#print axioms AnchoredSupportHeavyCoupling.s_not_mem_deletedSourceRadiusThroughT
#print axioms AnchoredSupportHeavyCoupling.deletedSourceRow_inter_namedPair_card_le_one
#print axioms AnchoredSupportHeavyCoupling.deletedSourceRow_omits_namedPair
#print axioms AnchoredSupportHeavyCoupling.not_exists_deletedSourceRow_contains_namedPair
#print axioms AnchoredSupportHeavyCoupling.exists_globalK4_deletedSourceRow_boundary
#print axioms AnchoredSupportHeavyCoupling.exists_globalK4_deletedSourceRow_omitting_namedPair
#print axioms AnchoredSupportHeavyCoupling.criticalShellRow_inter_namedPair_card_le_one

end ATailRF2DeletedSourcePairRowScratch
end Problem97
