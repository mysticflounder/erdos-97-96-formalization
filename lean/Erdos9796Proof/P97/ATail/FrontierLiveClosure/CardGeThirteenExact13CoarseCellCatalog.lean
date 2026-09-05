/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13CoarseCellIngress

/-!
# The exact-thirteen coarse-cell catalog

The exact-thirteen source signature has three finite choices: the direct or
mirror boundary orientation, the uncovered label in the five-label
`secondOppositeInterior` interval, and the two-or-three slice selected from the
other four labels.  This module records those choices as a computable finite
catalog.  The catalog is a source-side indexing device; it makes no geometric
or solver claim beyond the ingress theorem used by its membership bridge.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress

/-- The two boundary orientations retained by the exact-thirteen ingress. -/
inductive Exact13CoarseCellOrientation where
  | direct
  | mirror
deriving DecidableEq, Fintype

/-- One source-facing coarse cell: orientation, uncovered `I₂` label, and the
first second-apex slice in `I₂`.  The complementary slice is determined by the
five-label interval and is not stored redundantly. -/
structure Exact13CoarseCell where
  orientation : Exact13CoarseCellOrientation
  z : Fin 13
  k : Finset (Fin 13)
deriving DecidableEq

/-- The five-label interval selected by the exact-thirteen profile. -/
def exact13CoarseCellI2 : Finset (Fin 13) :=
  secondOppositeInterior (.secondOpposite : Profile)

/-- The complete `2 × 5 × (choose(4,2) + choose(4,3))` source catalog. -/
def exact13CoarseCellCatalog : Finset Exact13CoarseCell :=
  (Finset.univ : Finset Exact13CoarseCellOrientation).biUnion fun orientation =>
    exact13CoarseCellI2.biUnion fun z =>
      ((exact13CoarseCellI2.erase z).powerset.filter
        (fun k => k.card = 2 ∨ k.card = 3)).image fun k =>
          { orientation := orientation, z := z, k := k }

/-- The catalog contains exactly one hundred source cells. -/
theorem exact13CoarseCellCatalog_card :
    exact13CoarseCellCatalog.card = 100 := by
  set_option maxRecDepth 100000 in
    decide

/-- Select the catalog orientation exposed by a branch ingress. -/
def exact13CoarseCellOrientationOf
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) : Exact13CoarseCellOrientation :=
  if P.idx = directIndex P.profile then
    .direct
  else
    .mirror

/-- Map a source signature to its orientation, uncovered label, and first-row
`I₂` slice. -/
def exact13CoarseCellOfSignature
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (_U : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q P T O) : Exact13CoarseCell :=
  { orientation := exact13CoarseCellOrientationOf P
    z := T.zraw
    k := T.Kraw ∩ exact13CoarseCellI2 }

/-- Every exact-thirteen source signature maps to a catalog member. -/
theorem exact13CoarseCellOfSignature_mem_catalog
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (U : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q P T O) :
    exact13CoarseCellOfSignature R surface firstRow secondRow Q P T O U ∈
      exact13CoarseCellCatalog := by
  classical
  have hz : T.zraw ∈ exact13CoarseCellI2 := by
    simpa [exact13CoarseCellI2] using U.zraw_mem_I2
  have hk_subset : T.Kraw ∩ exact13CoarseCellI2 ⊆
      exact13CoarseCellI2.erase T.zraw := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxK, hxI2⟩
    refine Finset.mem_erase.mpr ⟨?_, hxI2⟩
    intro hzx
    apply U.zraw_not_mem_Kraw
    simpa [hzx] using hxK
  have hk_card :
      (T.Kraw ∩ exact13CoarseCellI2).card = 2 ∨
        (T.Kraw ∩ exact13CoarseCellI2).card = 3 := by
    rcases U.slice_cards with htwo | hthree
    · exact Or.inl (by simpa [exact13CoarseCellI2] using htwo.1)
    · exact Or.inr (by simpa [exact13CoarseCellI2] using hthree.1)
  change
    ({ orientation := exact13CoarseCellOrientationOf P
       z := T.zraw
       k := T.Kraw ∩ exact13CoarseCellI2 } : Exact13CoarseCell) ∈
      exact13CoarseCellCatalog
  refine Finset.mem_biUnion.mpr
    ⟨exact13CoarseCellOrientationOf P, Finset.mem_univ _, ?_⟩
  refine Finset.mem_biUnion.mpr ⟨T.zraw, hz, ?_⟩
  refine Finset.mem_image.mpr ⟨T.Kraw ∩ exact13CoarseCellI2, ?_, rfl⟩
  exact Finset.mem_filter.mpr
    ⟨Finset.mem_powerset.mpr hk_subset, hk_card⟩

/-- The catalog orientation is source-faithful: its direct constructor is
chosen exactly when the ingress is direct, and otherwise the ingress
orientation field supplies the mirror equality. -/
theorem exact13CoarseCellOfSignature_orientation_spec
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (U : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q P T O) :
    ((exact13CoarseCellOfSignature R surface firstRow secondRow Q P T O U).orientation =
        .direct ∧ P.idx = directIndex P.profile) ∨
      ((exact13CoarseCellOfSignature R surface firstRow secondRow Q P T O U).orientation =
        .mirror ∧ P.idx = mirrorIndex P.profile) := by
  by_cases hdirect : P.idx = directIndex P.profile
  · left
    exact ⟨by
      simp [exact13CoarseCellOfSignature, exact13CoarseCellOrientationOf,
        hdirect], hdirect⟩
  · right
    exact ⟨by
      simp [exact13CoarseCellOfSignature, exact13CoarseCellOrientationOf,
        hdirect], U.orientation.resolve_left hdirect⟩

/-- The second outer support has exactly the complementary `I₂` slice.  This
is the source-side statement used when a catalog cell pins every label not in
`cell.k` into the second slice. -/
theorem exact13CoarseCellOfSignature_l_slice_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (U : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q P T O) :
    O.Lraw ∩ exact13CoarseCellI2 =
      exact13CoarseCellI2 \ (T.Kraw ∩ exact13CoarseCellI2) := by
  classical
  have hpartition :
      (T.Kraw ∩ exact13CoarseCellI2) ∪
          (O.Lraw ∩ exact13CoarseCellI2) = exact13CoarseCellI2 := by
    simpa [exact13CoarseCellI2] using U.slice_partition
  ext x
  simp only [Finset.mem_inter, Finset.mem_sdiff]
  constructor
  · intro hx
    refine ⟨hx.2, ?_⟩
    intro hxK
    exact (Finset.disjoint_left.mp U.Kraw_Lraw_disjoint) hxK.1 hx.1
  · intro hx
    have hxUnion : x ∈
        (T.Kraw ∩ exact13CoarseCellI2) ∪
          (O.Lraw ∩ exact13CoarseCellI2) := by
      rw [hpartition]
      exact hx.1
    rcases Finset.mem_union.mp hxUnion with hxK | hxL
    · exact False.elim (hx.2 (Finset.mem_inter.mp hxK))
    · exact Finset.mem_inter.mp hxL

/-- The map exposes exactly the three source fields recorded by the catalog. -/
theorem exact13CoarseCellOfSignature_fields
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (T : CardGeThirteenExact13RawTightSupport
      R surface firstRow secondRow Q.base P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P T)
    (U : ExactThirteenCoarseCellSignature
      R surface firstRow secondRow Q P T O) :
    let cell := exact13CoarseCellOfSignature R surface firstRow secondRow Q P T O U
    cell.orientation = exact13CoarseCellOrientationOf P ∧
      cell.z = T.zraw ∧ cell.k = T.Kraw ∩ exact13CoarseCellI2 := by
  simp [exact13CoarseCellOfSignature]

end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.exact13CoarseCellCatalog_card
