/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DangerousRowCoupling
import FullParentFixedRadiusNormalForm

/-!
# Dangerous-retaining full-parent fixed-radius normal form

The live dangerous row must be installed in the critical-shell system before
the critical-pair frontier is selected.  This module composes that rebuild
with the current fixed-single-radius normal form while retaining the same
critical system throughout.

The result is a parent-facing connector, not a contradiction.  It keeps the
second-large-cap witness, the exact dangerous-row/source-blocker equivalence,
the chosen frontier, and the honest unique/coherent/spent split in one packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRDangerousRetainingFullParentNormalFormScratch

open ATailCriticalPairFrontier
open ATailRFullParentNormalFormScratch
open ATailRParentDangerousRowCouplingScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

set_option linter.unusedVariables false in
/-- Rebuild the live dangerous row into the critical-shell system before
frontier extraction, then run the current fixed-radius normal form using that
same system.

The returned `LiveDangerousRetainingSystem` exposes
`centerAt z = p ↔ z ∈ {q,t1,t2,t3}`.  Consequently every coherent branch can
use the exact dangerous-row coupling without transporting between unrelated
critical-system choices. -/
theorem fullParent_extracts_dangerousRetainingCurrentNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y)
      [p, q, t1, t2, t3, u])
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
      ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
        q ∈ S.surplusCap ∧
          ∃ radius : ℝ, 0 < radius ∧
            4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
              ∃ F : CriticalPairFrontier D S radius W.H,
                CurrentFirstApexFixedRadiusNormalForm F := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ j : Fin 3, j ≠ i ∧ 5 ≤ (CP.capAt j).card ∧
    ∃ W : LiveDangerousRetainingSystem D p q t1 t2 t3,
      q ∈ S.surplusCap ∧
        ∃ radius : ℝ, 0 < radius ∧
          4 ≤ (SelectedClass D.A S.oppApex1 radius).card ∧
            ∃ F : CriticalPairFrontier D S radius W.H,
              CurrentFirstApexFixedRadiusNormalForm F
  obtain ⟨j, hjne, hj5⟩ :=
    exists_secondLargeCap_of_noM44 MT hCirc CP hM hsurplus hNoM44
  rcases fullParent_extracts_dangerousRetainingFrontier
      MT hCirc CP i j rows hM hqCap hsurplus hqNonMoser
      hjne hj5 hNoM44 hcard hcritical hlocalNoQFree hfixed hbase
      Hlive hcenter hsupport with
    ⟨W, hqSurplus, radius, hradius, hfour, F, _hfirstSplit⟩
  exact ⟨j, hjne, hj5, W, hqSurplus, radius, hradius, hfour, F,
    Problem97.ATailRFullParentNormalFormScratch.CriticalPairFrontier.currentFirstApexFixedRadiusNormalForm
      F hradius hfour⟩

#print axioms fullParent_extracts_dangerousRetainingCurrentNormalForm

end ATailRDangerousRetainingFullParentNormalFormScratch
end Problem97
