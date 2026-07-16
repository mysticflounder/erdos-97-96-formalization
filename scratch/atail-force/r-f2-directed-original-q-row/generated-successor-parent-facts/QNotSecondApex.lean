/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GeneratedSuccessorParent

/-!
# Scratch: retain the non-Moser exclusion at the second apex

The full parent context already says that the distinguished point `q` is not
a vertex of the retained Moser triangle.  The second apex of the CP-derived
leaf packet is one of those three vertices, so it cannot equal `q`.

This is only a structural adapter.  It introduces no geometric assumption.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2GeneratedSuccessorParentFactsScratch

open ATailRF2GeneratedSuccessorParentScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- Raw structural form of the parent adapter. -/
theorem q_ne_leafSurplusPacket_oppApex2
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    {q : ℝ²} (hqNonMoser : q ∉ M.verts) :
    q ≠
      (leafSurplusPacket
        (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
        (hM := hM) (hsurplus := hsurplus)).oppApex2 := by
  subst M
  intro hq
  apply hqNonMoser
  rw [hq]
  fin_cases i <;>
    simp [leafSurplusPacket, SurplusCapPacket.oppApex2,
      SurplusCapPacket.triangle, MoserTriangle.verts]

/-- The original non-Moser hypothesis excludes the retained second apex of
the exact leaf packet. -/
theorem OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (P : OriginalQOutsideMiddleParentContext D p q t1 t2 t3 u) :
    q ≠ P.leafPacket.oppApex2 := by
  simpa [OriginalQOutsideMiddleParentContext.leafPacket] using
    q_ne_leafSurplusPacket_oppApex2
      P.MT P.hCirc P.CP P.i P.hM P.hsurplus P.hqNonMoser

#print axioms q_ne_leafSurplusPacket_oppApex2
#print axioms
  OriginalQOutsideMiddleParentContext.q_ne_leafPacket_oppApex2

end ATailRF2GeneratedSuccessorParentFactsScratch
end Problem97
