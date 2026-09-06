/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DispatchRawBridge

/-!
# Source-role ingress for the exact-thirteen CardGe arm

This module packages the source labels needed by the conditional direct-cell
assignment.  The two blocker labels are taken from the dispatch packet's
actual positional rows; the source and deletion labels are obtained from the
raw source witnesses.  No fixed cell, orientation, or solver conclusion is
asserted here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ExactThirteenBranchIngress

attribute [local instance] Classical.propDecidable

/-- Raw role labels exposed by an exact-thirteen dispatch packet.  The blocker
labels are retained with explicit equalities to the packet's actual source
rows, so a consumer cannot silently substitute fixed labels. -/
structure CardGeThirteenExact13SourceRoleWitnesses
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (X : CardGeThirteenExact13DispatchRawPacket
      R surface firstRow secondRow Q P) : Type where
  b0 : Fin 13
  b1 : Fin 13
  b0_eq : b0 = X.fivePositionalRows.blocker₁
  b1_eq : b1 = X.fivePositionalRows.blocker₂
  b0_image : P.pt b0 =
    (lateFirstApexSystem R).centerAt Q.base.W.source₁.1 Q.base.W.source₁.2
  b1_image : P.pt b1 =
    (lateFirstApexSystem R).centerAt Q.base.W.source₂.1 Q.base.W.source₂.2
  b0_not_C0 : b0 ∉ X.tightSupport.C0raw
  b1_not_C1 : b1 ∉ X.tightSupport.C1raw
  s0 : Fin 13
  s1 : Fin 13
  d : Fin 13
  s0_image : P.pt s0 = Q.base.W.source₁.1
  s1_image : P.pt s1 = Q.base.W.source₂.1
  source_ne : s0 ≠ s1
  s0_mem_C0 : s0 ∈ X.tightSupport.C0raw
  s1_mem_C1 : s1 ∈ X.tightSupport.C1raw
  s0_not_firstApex : s0 ∉ X.fivePositionalRows.firstApexRow.rawSupport
  s1_not_firstApex : s1 ∉ X.fivePositionalRows.firstApexRow.rawSupport
  d_image : P.pt d = Q.base.W.deleted
  d_mem_firstApex : d ∈ X.fivePositionalRows.firstApexRow.rawSupport
  d_not_C0 : d ∉ X.tightSupport.C0raw
  d_not_C1 : d ∉ X.tightSupport.C1raw
  d_z_or_K : d = X.tightSupport.zraw ∨ d ∈ X.tightSupport.Kraw

/-- Lift the raw source and deletion witnesses into the actual dispatch packet.
The source labels stay in their respective tight supports, both avoid the
actual first-apex row, and the deleted label lies in that row outside the two
source rows. -/
theorem nonempty_cardGeThirteenExact13SourceRoleWitnesses
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (X : CardGeThirteenExact13DispatchRawPacket
      R surface firstRow secondRow Q P) :
    Nonempty
      (CardGeThirteenExact13SourceRoleWitnesses
        R surface firstRow secondRow Q P X) := by
  classical
  let T := X.tightSupport
  let V := X.fivePositionalRows
  obtain ⟨s0, s1, _ib0, _ib1, d, hs0, hs1, _hib0, _hib1, hd,
    hsource_ne, _hblockers_ne, hs0C0, hs1C1, hdC0, hdC1,
    hgood0, hgood1, _hdrow0, _hdrow1⟩ :=
    exists_raw_goodSourceWitness_labels R surface Q.base P T
  have hs0_not_first : s0 ∉ V.firstApexRow.rawSupport := by
    exact raw_label_not_mem_of_goodOutsideSource R P
      V.firstApexRow.rawSupport_image hgood0 hs0
  have hs1_not_first : s1 ∉ V.firstApexRow.rawSupport := by
    exact raw_label_not_mem_of_goodOutsideSource R P
      V.firstApexRow.rawSupport_image hgood1 hs1
  obtain ⟨d', Traw, hd', hTraw_image, hd'Traw, hd'zK⟩ :=
    exists_raw_deleted_label_with_firstApex_support R surface Q.base P T
  have hd_eq : d' = d := by
    apply P.labelMap.injective
    exact hd'.trans hd.symm
  have hTraw_eq : Traw = V.firstApexRow.rawSupport := by
    apply raw_eq_of_image_eq P
    exact hTraw_image.trans V.firstApexRow.rawSupport_image.symm
  have hd_first : d ∈ V.firstApexRow.rawSupport := by
    rw [← hTraw_eq]
    simpa [hd_eq] using hd'Traw
  have hd_z_or_K : d = T.zraw ∨ d ∈ T.Kraw := by
    simpa [hd_eq] using hd'zK
  have hC0raw : T.C0raw = V.sourceRow₁.rawSupport := by
    apply raw_eq_of_image_eq P
    exact T.C0raw_image.trans V.sourceRow₁.rawSupport_image.symm
  have hC1raw : T.C1raw = V.sourceRow₂.rawSupport := by
    apply raw_eq_of_image_eq P
    exact T.C1raw_image.trans V.sourceRow₂.rawSupport_image.symm
  have hib0_eq : _ib0 = V.blocker₁ := by
    apply P.labelMap.injective
    exact _hib0.trans V.blocker₁_image.symm
  have hib1_eq : _ib1 = V.blocker₂ := by
    apply P.labelMap.injective
    exact _hib1.trans V.blocker₂_image.symm
  exact ⟨{
    b0 := _ib0
    b1 := _ib1
    b0_eq := hib0_eq
    b1_eq := hib1_eq
    b0_image := _hib0
    b1_image := _hib1
    b0_not_C0 := by
      intro hb0
      have hb0T : _ib0 ∈ T.C0raw := by
        simpa only [T] using hb0
      rw [hib0_eq, hC0raw] at hb0T
      apply V.sourceRow₁.center_not_mem
      rw [V.sourceRow₁.support_eq]
      exact Finset.mem_image.mpr ⟨V.blocker₁, hb0T, rfl⟩
    b1_not_C1 := by
      intro hb1
      have hb1T : _ib1 ∈ T.C1raw := by
        simpa only [T] using hb1
      rw [hib1_eq, hC1raw] at hb1T
      apply V.sourceRow₂.center_not_mem
      rw [V.sourceRow₂.support_eq]
      exact Finset.mem_image.mpr ⟨V.blocker₂, hb1T, rfl⟩
    s0 := s0
    s1 := s1
    d := d
    s0_image := hs0
    s1_image := hs1
    source_ne := hsource_ne
    s0_mem_C0 := hs0C0
    s1_mem_C1 := hs1C1
    s0_not_firstApex := hs0_not_first
    s1_not_firstApex := hs1_not_first
    d_image := hd
    d_mem_firstApex := hd_first
    d_not_C0 := hdC0
    d_not_C1 := hdC1
    d_z_or_K := hd_z_or_K }⟩

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.nonempty_cardGeThirteenExact13SourceRoleWitnesses
