/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenOutcomeDispatcher
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13RawIngress

/-!
# Dispatcher-to-raw ingress for the exact-thirteen CardGe arm

The outcome dispatcher retains the geometric data needed by the raw-label
ingress, but it intentionally does not depend on that ingress.  This module is
the small coordinator at that boundary: given the original disjoint named
rows, it packages an exact-thirteen-tight outcome's packet and ingress into the
raw `2+3` partition and the tight three-row cover.

The fixed-label center-9 terminal is deliberately not imported or asserted
here.  The resulting packet remains source-faithful and orientation-parametric.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

/-- The raw finite data exposed by an exact-thirteen tight outcome. -/
structure CardGeThirteenExact13DispatchRawPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S) : Type where
  namedRows_disjoint : Disjoint firstRow.support secondRow.support
  rawPartition :
    ExactThirteenRawTwoThreePartition P firstRow.support secondRow.support
  tightSupport :
    CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q.base P
  fivePositionalRows :
    ExactThirteenFivePositionalRows R firstRow secondRow Q.base P

/-- Turn the exact-thirteen-tight dispatcher fields into the source-faithful
raw packet.  `hrows` is kept explicit because the dispatcher outcome retains
the cover and row disjointness of the three-row residual, while the original
two named-row disjointness is a premise of the profile-to-raw partition.
-/
theorem nonempty_cardGeThirteenExact13DispatchRawPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (hrows : Disjoint firstRow.support secondRow.support)
    (hdisj01 : Disjoint Q.base.W.row₁.support Q.base.W.row₂.support)
    (hdisj0K : Disjoint Q.base.W.row₁.support Q.base.thirdRow.support)
    (hdisj1K : Disjoint Q.base.W.row₂.support Q.base.thirdRow.support)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪
        Q.base.thirdRow.support))
    (hcard13 : D.A.card = 13) :
    Nonempty
      (CardGeThirteenExact13DispatchRawPacket R surface firstRow secondRow Q P) := by
  let rawPartition :=
    raw_two_three_partition_of_exactThirteen_largeInterior P Q hrows
  let tightSupport := raw_tight_support_of_exact_cover R surface firstRow secondRow
    Q.base P hdisj01 hdisj0K hdisj1K hcover hcard13
  obtain ⟨fivePositionalRows⟩ :=
    nonempty_exactThirteenFivePositionalRows R surface firstRow secondRow Q.base P
  exact ⟨{
    namedRows_disjoint := hrows
    rawPartition := rawPartition
    tightSupport := tightSupport
    fivePositionalRows := fivePositionalRows }⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.nonempty_cardGeThirteenExact13DispatchRawPacket
