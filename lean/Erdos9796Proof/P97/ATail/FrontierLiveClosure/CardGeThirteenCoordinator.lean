/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardGeThirteenTwoRadiusGoodSourceIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenAnchoredOutcomeDispatcher
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenOutcomeDispatcher
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RawIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DispatchRawBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13CoarseCellIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceRoleIngress

/-!
# CardGe13 four-case coordinator

The source-anchored CardGe13 dispatcher has four proof-relevant outcomes.  The
coordinator exposes one residual theorem for each outcome and keeps all
source, row, and exact-thirteen ingress data explicit at the boundary.  The
four residuals are intentionally open: this module records the exact frontier
without asserting a closure that has not been proved.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCardGeThirteenTwoRadiusGoodSourceIngress
open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

/-- The row-overlap outcome remains a residual because failure of pairwise
disjointness alone does not provide the three-point overlap needed by the
available geometric terminal. -/
theorem false_of_cardGeThirteenAnchoredOutcome_rowOverlap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hoverlap :
      ¬ Disjoint Q.base.W.row₁.support Q.base.W.row₂.support ∨
      ¬ Disjoint Q.base.W.row₁.support Q.base.thirdRow.support ∨
      ¬ Disjoint Q.base.W.row₂.support Q.base.thirdRow.support)
    (named : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow)
    (sources : TwoRadiusNamedRowsTwoGoodSourcesIngress R firstRow secondRow) :
    False := by
  sorry

/-- The disjoint-fresh outcome remains a residual after its fourteen-point
cardinality witness has been exposed; no source-entitled false consumer is
currently available for an arbitrary fresh point. -/
theorem false_of_cardGeThirteenAnchoredOutcome_disjointFresh
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (q : ℝ²)
    (hq : q ∈ D.A)
    (houtside : q ∉ insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪
        Q.base.thirdRow.support))
    (hdisj01 : Disjoint Q.base.W.row₁.support Q.base.W.row₂.support)
    (hdisj0K : Disjoint Q.base.W.row₁.support Q.base.thirdRow.support)
    (hdisj1K : Disjoint Q.base.W.row₂.support Q.base.thirdRow.support)
    (hcard14 : 14 ≤ D.A.card)
    (named : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow)
    (sources : TwoRadiusNamedRowsTwoGoodSourcesIngress R firstRow secondRow) :
    False := by
  sorry

/-- The exact-thirteen finite outcome remains a residual at the source-faithful
X/O/coarse/source-role interface; the payload is retained without selecting a
fixed orientation or solver cell. -/
theorem false_of_cardGeThirteenAnchoredOutcome_exactThirteenFinite
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (ingress : ExactThirteenBranchIngress S)
    (hdisj01 : Disjoint Q.base.W.row₁.support Q.base.W.row₂.support)
    (hdisj0K : Disjoint Q.base.W.row₁.support Q.base.thirdRow.support)
    (hdisj1K : Disjoint Q.base.W.row₂.support Q.base.thirdRow.support)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪
        Q.base.thirdRow.support))
    (hcard13 : D.A.card = 13)
    (X : CardGeThirteenExact13DispatchRawPacket
      R surface firstRow secondRow Q ingress)
    (O : ExactThirteenBranchIngress.CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base ingress X.tightSupport)
    (coarse : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q ingress X.tightSupport O)
    (sourceRole : CardGeThirteenExact13SourceRoleWitnesses
      R surface firstRow secondRow Q ingress X) 
    (named : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow)
    (sources : TwoRadiusNamedRowsTwoGoodSourcesIngress R firstRow secondRow) :
    False := by
  sorry

/-- The adjacent-grid outcome remains a residual; the current exact-grid
terminals are restricted to the exact-cardinality sibling and do not close the
card-at-least-thirteen branch. -/
theorem false_of_cardGeThirteenAnchoredOutcome_adjacentGrid
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support)
    (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2
      firstRow.radius secondRow.radius)
    (named : TwoRadiusNamedRowGoodSourceIngress R firstRow secondRow)
    (sources : TwoRadiusNamedRowsTwoGoodSourcesIngress R firstRow secondRow) :
    False := by
  sorry

/-- Dispatch every source-anchored CardGe13 outcome to its corresponding
residual.  The exact-thirteen branch constructs the finite X/O/coarse/source-
role payload before handing it to its open terminal. -/
theorem false_of_cardGeThirteenAnchoredOutcome_onSpine
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho otherRadius : ℝ)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (hradii : otherRadius ≠ rho)
    (hnoFive : ∀ candidateRadius : ℝ, 0 < candidateRadius →
      (SelectedClass D.A S.oppApex2 candidateRadius).card < 5)
    (hfirstRadius : firstRow.radius = rho)
    (hsecondRadius : secondRow.radius = otherRadius)
    (hdisjoint : Disjoint firstRow.support secondRow.support) :
    False := by
  obtain ⟨A⟩ :=
    nonempty_cardGeThirteenAnchoredOutcome
      R hcard surface rho otherRadius firstRow secondRow
      hradii hnoFive hfirstRadius hsecondRadius hdisjoint
  rcases A with ⟨outcome, named, sources⟩
  cases outcome with
  | rowOverlap Q hoverlap =>
      exact false_of_cardGeThirteenAnchoredOutcome_rowOverlap
        R hcard surface rho otherRadius firstRow secondRow
        hradii hnoFive hfirstRadius hsecondRadius hdisjoint
        Q hoverlap named sources
  | uncovered Q q hq houtside hdisj01 hdisj0K hdisj1K hcard14 =>
      exact false_of_cardGeThirteenAnchoredOutcome_disjointFresh
        R hcard surface rho otherRadius firstRow secondRow
        hradii hnoFive hfirstRadius hsecondRadius hdisjoint
        Q q hq houtside hdisj01 hdisj0K hdisj1K hcard14 named sources
  | exactThirteenTight Q ingress hdisj01 hdisj0K hdisj1K hcover hcard13 =>
      obtain ⟨X⟩ :=
        nonempty_cardGeThirteenExact13DispatchRawPacket
          R surface firstRow secondRow Q ingress hdisjoint
          hdisj01 hdisj0K hdisj1K hcover hcard13
      let O :
          ExactThirteenBranchIngress.CardGeThirteenRawOtherOuterSupport
            R surface firstRow secondRow Q.base ingress X.tightSupport :=
        ExactThirteenBranchIngress.raw_other_outer_support_of_tight
          R surface firstRow secondRow Q.base ingress X.tightSupport hdisjoint
      obtain ⟨coarse⟩ :=
        nonempty_exactThirteenCoarseCellSignature
          R surface firstRow secondRow Q ingress X.rawPartition
          X.tightSupport O X.fivePositionalRows
      obtain ⟨sourceRole⟩ :=
        nonempty_cardGeThirteenExact13SourceRoleWitnesses
          R surface firstRow secondRow Q ingress X
      exact false_of_cardGeThirteenAnchoredOutcome_exactThirteenFinite
        R hcard surface rho otherRadius firstRow secondRow
        hradii hnoFive hfirstRadius hsecondRadius hdisjoint
        Q ingress hdisj01 hdisj0K hdisj1K hcover hcard13
        X O coarse sourceRole named sources
  | adjacentGrid G =>
      exact false_of_cardGeThirteenAnchoredOutcome_adjacentGrid
        R hcard surface rho otherRadius firstRow secondRow
        hradii hnoFive hfirstRadius hsecondRadius hdisjoint
        G named sources

end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.false_of_cardGeThirteenAnchoredOutcome_onSpine
