/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CanonicalExhaustion

/-!
# B1 canonical bad-source bound

In the no-escape branch, every noncanonical physical source in the strict
second cap and outside the first-apex blocker fibre blocks both retained
singleton deletions.  The existing interior-pair bad-source bound then leaves
at most one such source.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- In the no-escape branch, at most one noncanonical physical source lies in
the strict second cap outside the first-apex blocker fibre. -/
theorem b1_noncanonical_strictSecondCap_outsideFirstApexFiber_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (E : B1EscapeRowProvenanceStar C)
    (hnoescape : ¬ Nonempty (B1EscapeSourceContext C)) :
    ((Finset.univ.filter fun source : CarrierVertex D.A =>
      source.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
        source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        source ∈ outsideFirstApexFiber C.R ∧
        source ≠ C.first.deleted ∧
        source ≠ C.second.deleted).card ≤ 1) := by
  classical
  have hexhaust :=
    ((b1_escape_or_canonicalExhaustion C hnormal E).resolve_left
      hnoescape).2
  have hsubset :
      (Finset.univ.filter fun source : CarrierVertex D.A =>
        source.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
          source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          source ∈ outsideFirstApexFiber C.R ∧
          source ≠ C.first.deleted ∧
          source ≠ C.second.deleted) ⊆
        (interiorPairBadOutsideSources C.R).filter fun source =>
          source.1 ∈ SelectedClass D.A S.oppApex2 C.rho ∧
            source.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    intro source hsource
    rcases (Finset.mem_filter.mp hsource).2 with
      ⟨hclass, hinterior, houtside, hneFirst, hneSecond⟩
    have hbad : source ∈ interiorPairBadOutsideSources C.R := by
      apply Finset.mem_filter.mpr
      refine ⟨houtside, ?_⟩
      constructor
      · intro hq
        rcases hexhaust source hclass hinterior houtside (Or.inl hq) with
          hfirst | hsecond
        · exact hneFirst hfirst
        · exact hneSecond hsecond
      · intro hw
        rcases hexhaust source hclass hinterior houtside (Or.inr hw) with
          hfirst | hsecond
        · exact hneFirst hfirst
        · exact hneSecond hsecond
    exact Finset.mem_filter.mpr ⟨hbad, hclass, hinterior⟩
  exact (Finset.card_le_card hsubset).trans
    (interiorPairBad_secondClassInterior_card_le_one
      (rho := C.rho) C.R C.surface.secondApex_robust)

#print axioms b1_noncanonical_strictSecondCap_outsideFirstApexFiber_card_le_one

end ATailFrontierLiveClosure
end Problem97
