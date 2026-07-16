/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Full-parent entry to the critical-pair frontier

This scratch module performs only the source-complete bookkeeping available
from the current `DoubleApexOffSurplusSharedRadiusPair` telescope.  It builds
the exact CP-derived surplus packet, retains a concrete critical-shell system,
extracts its critical-pair frontier, and exposes the frontier's first-apex
split.  It makes no claim that either split arm closes.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open U1LargeCapRouteBTailMetricResidualTarget

set_option linter.unusedVariables false in
/-- The complete live K-A parent telescope reaches a concrete
`CriticalPairFrontier` for its CP-derived surplus packet, together with the
frontier's first-apex split.  The remaining parent hypotheses are deliberately
retained in the signature for the subsequent branch-coupling theorem. -/
theorem fullParent_extracts_criticalPairFrontier_firstApexSplit
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² ↦ x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport :
      (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support =
        ({q, t1, t2, t3} : Finset ℝ²)) :
    let S := leafSurplusPacket
      (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
      (hM := hM) (hsurplus := hsurplus)
    ∃ Hcritical : CriticalShellSystem D.A,
      ∃ r : ℝ, 0 < r ∧
        4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
        ∃ F : CriticalPairFrontier D S r Hcritical,
          FirstApexSplit F.pair := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  change ∃ Hcritical : CriticalShellSystem D.A,
    ∃ r : ℝ, 0 < r ∧
      4 ≤ (SelectedClass D.A S.oppApex1 r).card ∧
      ∃ F : CriticalPairFrontier D S r Hcritical,
        FirstApexSplit F.pair
  rcases hcritical with ⟨Hcritical⟩
  rcases exists_criticalPairFrontier_of_K4 D S Hcritical with
    ⟨r, hr, hfour, ⟨F⟩⟩
  exact ⟨Hcritical, r, hr, hfour, F, F.firstApexSplit⟩

#print axioms fullParent_extracts_criticalPairFrontier_firstApexSplit

end ATailRFullParentEntryScratch
end Problem97
