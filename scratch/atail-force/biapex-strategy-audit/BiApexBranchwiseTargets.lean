/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity

/-!
# Branchwise row data forced by bi-apex blocker multiplicity

This scratch file records the exact actual-row information supplied by the
two branches of the bi-apex blocker-multiplicity theorem.  In the larger-fiber
branch, cardinality also supplies a source outside the four-point common shell;
its blocker is automatically different from the common blocker.

No cyclic order or cross-row membership is asserted here.  Those are the
remaining geometric inputs to an ordinal or Kalmanson consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexStrategyAudit

open ATailCriticalPairFrontier
open ATailBiApexBlockerMultiplicity
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

/-- Equal actual blockers transport the source of one critical row into the
exact shell selected for the other source. -/
theorem source_mem_other_shell_of_blocker_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source target : CriticalShellSystem.CarrierVertex A)
    (hblockers : H.blockerVertex source = H.blockerVertex target) :
    source.1 ∈
      (H.selectedAt target.1 target.2).toCriticalFourShell.support := by
  have hcenters :
      H.centerAt source.1 source.2 = H.centerAt target.1 target.2 :=
    congrArg Subtype.val hblockers
  let K : SelectedFourClass A (H.centerAt source.1 source.2) :=
    transportSelectedFourClass
      (H.selectedAt target.1 target.2).toSelectedFourClass hcenters.symm
  have hsource : source.1 ∈ K.support :=
    H.source_mem_selectedFourClass source.1 source.2 K
  simpa [K, CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using hsource

/-- Outside a prescribed four-point critical shell, every carrier source has
a blocker different from the shell's blocker.  Otherwise equal-blocker
criticality would put that source back into the shell. -/
theorem exists_source_outside_shell_with_distinct_blocker
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A)
    (hcard :
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support.card <
        A.card) :
    ∃ external : CriticalShellSystem.CarrierVertex A,
      external.1 ∉
          (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support ∧
        H.blockerVertex external ≠ H.blockerVertex anchor := by
  rcases Finset.exists_mem_notMem_of_card_lt_card hcard with
    ⟨point, hpointA, hpointOff⟩
  let external : CriticalShellSystem.CarrierVertex A := ⟨point, hpointA⟩
  refine ⟨external, hpointOff, ?_⟩
  intro hblockers
  exact hpointOff
    (source_mem_other_shell_of_blocker_eq H external anchor hblockers)

/-- Exact source-indexed row data on the two-distinct-fibers branch. -/
structure TwoFiberRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  firstSource₁ : CriticalShellSystem.CarrierVertex D.A
  firstSource₂ : CriticalShellSystem.CarrierVertex D.A
  secondSource₁ : CriticalShellSystem.CarrierVertex D.A
  secondSource₂ : CriticalShellSystem.CarrierVertex D.A
  firstSources_ne : firstSource₁ ≠ firstSource₂
  secondSources_ne : secondSource₁ ≠ secondSource₂
  firstBlockers_eq :
    H.blockerVertex firstSource₁ = H.blockerVertex firstSource₂
  secondBlockers_eq :
    H.blockerVertex secondSource₁ = H.blockerVertex secondSource₂
  blockerValues_ne :
    H.blockerVertex secondSource₁ ≠ H.blockerVertex firstSource₁

namespace TwoFiberRows

theorem firstSource₂_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : TwoFiberRows R) :
    B.firstSource₂.1 ∈
      (H.selectedAt B.firstSource₁.1
        B.firstSource₁.2).toCriticalFourShell.support :=
  source_mem_other_shell_of_blocker_eq H B.firstSource₂ B.firstSource₁
    B.firstBlockers_eq.symm

theorem secondSource₂_mem_secondShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : TwoFiberRows R) :
    B.secondSource₂.1 ∈
      (H.selectedAt B.secondSource₁.1
        B.secondSource₁.2).toCriticalFourShell.support :=
  source_mem_other_shell_of_blocker_eq H B.secondSource₂ B.secondSource₁
    B.secondBlockers_eq.symm

theorem firstSource₁_ne_secondSource₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : TwoFiberRows R) : B.firstSource₁ ≠ B.secondSource₁ := by
  intro h
  apply B.blockerValues_ne
  rw [h]

end TwoFiberRows

/-- Exact source-indexed row data on the three-sources-in-one-fiber branch.
The external source and its different blocker are forced by the four-point
shell cardinality and the live carrier bound. -/
structure TripleFiberRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  firstSource₁ : CriticalShellSystem.CarrierVertex D.A
  firstSource₂ : CriticalShellSystem.CarrierVertex D.A
  thirdSource : CriticalShellSystem.CarrierVertex D.A
  firstSources_ne : firstSource₁ ≠ firstSource₂
  third_ne_firstSource₁ : thirdSource ≠ firstSource₁
  third_ne_firstSource₂ : thirdSource ≠ firstSource₂
  firstBlockers_eq :
    H.blockerVertex firstSource₁ = H.blockerVertex firstSource₂
  thirdBlocker_eq :
    H.blockerVertex thirdSource = H.blockerVertex firstSource₁
  externalSource : CriticalShellSystem.CarrierVertex D.A
  externalSource_not_mem_firstShell :
    externalSource.1 ∉
      (H.selectedAt firstSource₁.1
        firstSource₁.2).toCriticalFourShell.support
  externalBlocker_ne_firstBlocker :
    H.blockerVertex externalSource ≠ H.blockerVertex firstSource₁

namespace TripleFiberRows

theorem firstSource₂_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : TripleFiberRows R) :
    B.firstSource₂.1 ∈
      (H.selectedAt B.firstSource₁.1
        B.firstSource₁.2).toCriticalFourShell.support :=
  source_mem_other_shell_of_blocker_eq H B.firstSource₂ B.firstSource₁
    B.firstBlockers_eq.symm

theorem thirdSource_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : TripleFiberRows R) :
    B.thirdSource.1 ∈
      (H.selectedAt B.firstSource₁.1
        B.firstSource₁.2).toCriticalFourShell.support :=
  source_mem_other_shell_of_blocker_eq H B.thirdSource B.firstSource₁
    B.thirdBlocker_eq

end TripleFiberRows

/-- The common consumer-facing seed shared by both multiplicity branches.
It contains one genuine collision row and one source whose actual blocker is
different.  No cross membership between those rows is included. -/
structure DistinctBlockerRowSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  firstSource₁ : CriticalShellSystem.CarrierVertex D.A
  firstSource₂ : CriticalShellSystem.CarrierVertex D.A
  continuationSource : CriticalShellSystem.CarrierVertex D.A
  firstSources_ne : firstSource₁ ≠ firstSource₂
  firstBlockers_eq :
    H.blockerVertex firstSource₁ = H.blockerVertex firstSource₂
  continuationSource_not_mem_firstShell :
    continuationSource.1 ∉
      (H.selectedAt firstSource₁.1
        firstSource₁.2).toCriticalFourShell.support
  continuationBlocker_ne_firstBlocker :
    H.blockerVertex continuationSource ≠ H.blockerVertex firstSource₁

namespace DistinctBlockerRowSeed

theorem firstSource₂_mem_firstShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : DistinctBlockerRowSeed R) :
    B.firstSource₂.1 ∈
      (H.selectedAt B.firstSource₁.1
        B.firstSource₁.2).toCriticalFourShell.support :=
  source_mem_other_shell_of_blocker_eq H B.firstSource₂ B.firstSource₁
    B.firstBlockers_eq.symm

theorem continuationSource_mem_ownShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (B : DistinctBlockerRowSeed R) :
    B.continuationSource.1 ∈
      (H.selectedAt B.continuationSource.1
        B.continuationSource.2).toCriticalFourShell.support :=
  (H.selectedAt B.continuationSource.1
    B.continuationSource.2).toCriticalFourShell.q_mem_support

end DistinctBlockerRowSeed

/-- Both multiplicity branches have the same minimal row seed.  In fact, the
extra fiber multiplicity is not needed for this normalization: a source
outside the first exact four-shell already has a different blocker. -/
theorem FrontierBiApexRobustResidual.nonempty_distinctBlockerRowSeed
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (DistinctBlockerRowSeed R) := by
  rcases
      ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
        R with
    ⟨source₁, source₂, hsources, hblockers, _hbranch⟩
  have hshellCard :
      (H.selectedAt source₁.1
        source₁.2).toCriticalFourShell.support.card < D.A.card := by
    have hcarrier := parent.carrier_card_gt_nine
    rw [(H.selectedAt source₁.1
      source₁.2).toCriticalFourShell.support_card]
    omega
  rcases exists_source_outside_shell_with_distinct_blocker H source₁
      hshellCard with
    ⟨continuation, hcontinuationOff, hcontinuationBlocker⟩
  exact ⟨{
    firstSource₁ := source₁
    firstSource₂ := source₂
    continuationSource := continuation
    firstSources_ne := hsources
    firstBlockers_eq := hblockers
    continuationSource_not_mem_firstShell := hcontinuationOff
    continuationBlocker_ne_firstBlocker := hcontinuationBlocker }⟩

/-- The live bi-apex endpoint reaches one of the two exact branchwise row
packets.  The larger-fiber branch additionally carries an automatically
available different-blocker row source. -/
theorem FrontierBiApexRobustResidual.nonempty_twoFiberRows_or_tripleFiberRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (TwoFiberRows R) ∨ Nonempty (TripleFiberRows R) := by
  rcases
      ATailBiApexBlockerMultiplicity.FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
        R with
    ⟨source₁, source₂, hsources, hblockers, hbranch⟩
  rcases hbranch with htwo | htriple
  · rcases htwo with ⟨a, b, hab, habBlocker, hvalue⟩
    exact Or.inl ⟨{
      firstSource₁ := source₁
      firstSource₂ := source₂
      secondSource₁ := a
      secondSource₂ := b
      firstSources_ne := hsources
      secondSources_ne := hab
      firstBlockers_eq := hblockers
      secondBlockers_eq := habBlocker
      blockerValues_ne := hvalue }⟩
  · rcases htriple with ⟨third, hthird₁, hthird₂, hthirdBlocker⟩
    have hshellCard :
        (H.selectedAt source₁.1
          source₁.2).toCriticalFourShell.support.card < D.A.card := by
      have hcarrier := parent.carrier_card_gt_nine
      rw [(H.selectedAt source₁.1
        source₁.2).toCriticalFourShell.support_card]
      omega
    rcases exists_source_outside_shell_with_distinct_blocker H source₁
        hshellCard with
      ⟨external, hexternalOff, hexternalBlocker⟩
    exact Or.inr ⟨{
      firstSource₁ := source₁
      firstSource₂ := source₂
      thirdSource := third
      firstSources_ne := hsources
      third_ne_firstSource₁ := hthird₁
      third_ne_firstSource₂ := hthird₂
      firstBlockers_eq := hblockers
      thirdBlocker_eq := hthirdBlocker
      externalSource := external
      externalSource_not_mem_firstShell := hexternalOff
      externalBlocker_ne_firstBlocker := hexternalBlocker }⟩

#print axioms source_mem_other_shell_of_blocker_eq
#print axioms exists_source_outside_shell_with_distinct_blocker
#print axioms FrontierBiApexRobustResidual.nonempty_distinctBlockerRowSeed
#print axioms FrontierBiApexRobustResidual.nonempty_twoFiberRows_or_tripleFiberRows

end ATailBiApexStrategyAudit
end Problem97
