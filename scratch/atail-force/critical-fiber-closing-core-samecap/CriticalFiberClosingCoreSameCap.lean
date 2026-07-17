/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore

/-!
# Exact source-faithful routes to the critical-fiber same-cap terminal

This scratch module normalizes the production `SameCapCollisionPairCore` to
the two permitted origins of its second center.  The outside pair is always
the two actual sources of the chosen critical fiber; it is never replaced by
an anonymous pair extracted from the common shell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberClosingCoreSameCapScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailCriticalFiberClosingCore

attribute [local instance] Classical.propDecidable

/-- The robust first apex itself is the second same-cap bisector center of
the two actual critical-fiber sources. -/
def FirstApexSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Prop :=
  ∃ capIndex : Fin 3,
    H.centerAt P.source₁.1 P.source₁.2 ∈ S.capByIndex capIndex ∧
      S.oppApex1 ∈ S.capByIndex capIndex ∧
      P.source₁.1 ∉ S.capByIndex capIndex ∧
      P.source₂.1 ∉ S.capByIndex capIndex ∧
      dist S.oppApex1 P.source₁.1 = dist S.oppApex1 P.source₂.1

/-- The actual blocker of a source `J` is the second same-cap bisector
center, and `J`'s exact critical row contains the two actual fiber sources. -/
def ActualRowSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Prop :=
  ∃ (capIndex : Fin 3) (J : ℝ²) (hJ : J ∈ D.A),
    H.centerAt P.source₁.1 P.source₁.2 ∈ S.capByIndex capIndex ∧
      H.centerAt J hJ ∈ S.capByIndex capIndex ∧
      H.centerAt J hJ ≠ H.centerAt P.source₁.1 P.source₁.2 ∧
      P.source₁.1 ∉ S.capByIndex capIndex ∧
      P.source₂.1 ∉ S.capByIndex capIndex ∧
      P.source₁.1 ∈
        (H.selectedAt J hJ).toCriticalFourShell.support ∧
      P.source₂.1 ∈
        (H.selectedAt J hJ).toCriticalFourShell.support

/-- The production same-cap terminal has no hidden anonymous-pair freedom:
it exists exactly when the fixed collision sources support either the robust
first-apex route or one actual critical-row route. -/
theorem nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) :
    Nonempty (SameCapCollisionPairCore P) ↔
      FirstApexSameCapRoute P ∨ ActualRowSameCapRoute P := by
  constructor
  · rintro ⟨Q⟩
    rcases Q.source_faithful_secondCenter with hfirst | hrow
    · rcases hfirst with ⟨hcenter, hEq⟩
      rcases Q.fiber_orientation with hforward | hreverse
      · rcases hforward with ⟨hC, hK⟩
        exact Or.inl ⟨Q.capIndex, Q.commonBlocker_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_mem_cap,
          by simpa only [hC] using Q.C_not_mem_cap,
          by simpa only [hK] using Q.K_not_mem_cap,
          by simpa only [hcenter, hC, hK] using hEq⟩
      · rcases hreverse with ⟨hC, hK⟩
        exact Or.inl ⟨Q.capIndex, Q.commonBlocker_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_mem_cap,
          by simpa only [hK] using Q.K_not_mem_cap,
          by simpa only [hC] using Q.C_not_mem_cap,
          by simpa only [hcenter, hC, hK] using hEq.symm⟩
    · rcases hrow with ⟨J, hJ, hcenter, hCRow, hKRow⟩
      rcases Q.fiber_orientation with hforward | hreverse
      · rcases hforward with ⟨hC, hK⟩
        exact Or.inr ⟨Q.capIndex, J, hJ, Q.commonBlocker_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_ne_commonBlocker,
          by simpa only [hC] using Q.C_not_mem_cap,
          by simpa only [hK] using Q.K_not_mem_cap,
          by simpa only [hC] using hCRow,
          by simpa only [hK] using hKRow⟩
      · rcases hreverse with ⟨hC, hK⟩
        exact Or.inr ⟨Q.capIndex, J, hJ, Q.commonBlocker_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_mem_cap,
          by simpa only [hcenter] using Q.secondCenter_ne_commonBlocker,
          by simpa only [hK] using Q.K_not_mem_cap,
          by simpa only [hC] using Q.C_not_mem_cap,
          by simpa only [hK] using hKRow,
          by simpa only [hC] using hCRow⟩
  · rintro (hfirst | hrow)
    · rcases hfirst with ⟨capIndex, hcommonCap, hfirstCap,
        hsource₁Off, hsource₂Off, hEq⟩
      exact ⟨{
        C := P.source₁.1
        K := P.source₂.1
        fiber_orientation := Or.inl ⟨rfl, rfl⟩
        capIndex := capIndex
        secondCenter := S.oppApex1
        commonBlocker_mem_cap := hcommonCap
        secondCenter_mem_cap := hfirstCap
        secondCenter_ne_commonBlocker :=
          P.commonBlocker_ne_firstApex.symm
        C_not_mem_cap := hsource₁Off
        K_not_mem_cap := hsource₂Off
        source_faithful_secondCenter := Or.inl ⟨rfl, hEq⟩ }⟩
    · rcases hrow with ⟨capIndex, J, hJ, hcommonCap, hrowCap,
        hrowNe, hsource₁Off, hsource₂Off, hsource₁Row, hsource₂Row⟩
      exact ⟨{
        C := P.source₁.1
        K := P.source₂.1
        fiber_orientation := Or.inl ⟨rfl, rfl⟩
        capIndex := capIndex
        secondCenter := H.centerAt J hJ
        commonBlocker_mem_cap := hcommonCap
        secondCenter_mem_cap := hrowCap
        secondCenter_ne_commonBlocker := hrowNe
        C_not_mem_cap := hsource₁Off
        K_not_mem_cap := hsource₂Off
        source_faithful_secondCenter :=
          Or.inr ⟨J, hJ, rfl, hsource₁Row, hsource₂Row⟩ }⟩

/-- Either exact route constructs the production `sameCap` constructor,
still indexed by the same chosen critical fiber. -/
theorem nonempty_closingCore_of_sourceFaithfulSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R)
    (hroute : FirstApexSameCapRoute P ∨ ActualRowSameCapRoute P) :
    Nonempty (CriticalFiberClosingCore R) := by
  have hcore :=
    (nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute P).2 hroute
  exact ⟨CriticalFiberClosingCore.sameCap P hcore.some⟩

/-- Normalized direct consumer for the two exact source-faithful routes. -/
theorem false_of_sourceFaithfulSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) :
    FirstApexSameCapRoute P ∨ ActualRowSameCapRoute P → False := by
  intro hroute
  exact false_of_criticalFiberClosingCore
    (nonempty_closingCore_of_sourceFaithfulSameCapRoute P hroute).some

/-- The adaptive parent-level same-cap producer target.  The parent chooses
the critical fiber after inspecting the full geometry. -/
def ParentSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Prop :=
  ∃ P : FrontierCommonDeletionCriticalFiber R,
    FirstApexSameCapRoute P ∨ ActualRowSameCapRoute P

/-- Exact sigma-type for the `sameCap` side of the parent closing contract. -/
abbrev ParentSameCapCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :=
  Σ P : FrontierCommonDeletionCriticalFiber R, SameCapCollisionPairCore P

/-- The adaptive source-faithful route is exactly the existence of a
`sameCap` sigma packet, before embedding it in the full closing core. -/
theorem nonempty_parentSameCapCore_iff_parentSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (ParentSameCapCore R) ↔ ParentSameCapRoute R := by
  constructor
  · rintro ⟨⟨P, Q⟩⟩
    exact ⟨P,
      (nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute P).1 ⟨Q⟩⟩
  · rintro ⟨P, hroute⟩
    exact ⟨⟨P,
      (nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute P).2 hroute |>.some⟩⟩

/-- The adaptive parent route embeds through the production `sameCap`
constructor without changing the chosen fiber. -/
theorem nonempty_closingCore_of_parentSameCapRoute
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (hroute : ParentSameCapRoute R) :
    Nonempty (CriticalFiberClosingCore R) := by
  rcases hroute with ⟨P, hP⟩
  exact nonempty_closingCore_of_sourceFaithfulSameCapRoute P hP

#print axioms nonempty_sameCapCollisionPairCore_iff_sourceFaithfulRoute
#print axioms nonempty_closingCore_of_sourceFaithfulSameCapRoute
#print axioms false_of_sourceFaithfulSameCapRoute
#print axioms nonempty_parentSameCapCore_iff_parentSameCapRoute
#print axioms nonempty_closingCore_of_parentSameCapRoute

end ATailCriticalFiberClosingCoreSameCapScratch
end Problem97
