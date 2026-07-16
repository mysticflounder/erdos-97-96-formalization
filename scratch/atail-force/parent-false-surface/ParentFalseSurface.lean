/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Parent direct-false surface

This scratch module pins the exact theorem boundary for replacing the old
double-apex-pair/removable-vertex chain.  It deliberately does not postulate or
prove the missing geometric producer.  Instead, `CommonCriticalMapClosingProducer`
names that producer as an explicit input, while
`false_of_twoLargeCaps_commonCriticalMap_of_producer` kernel-checks all routine
parent wiring:

* derive the second large cap from `hNoM44`;
* build the CP-derived surplus packet;
* extract a `CriticalPairFrontier` indexed by the retained concrete critical
  system; and
* invoke the producer directly at `False`, without constructing the already
  forbidden double-apex pair or routing through removability.

The producer keeps the full current parent geometry and fixed/live row data.
It is therefore not the false geometry-free statement
`D, S, Hcritical -> False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILParentFalseSurface

open ATailCriticalPairFrontier
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

set_option linter.unusedVariables false in
/-- Exact content-bearing input expected from the future parent-level
classifier.  The outer arguments retain the full live U1 leaf; the quantified
arguments are precisely the two constructions already available before the
LIVE slot split: the second large cap and the common-system frontier.

This is an explicit open producer contract, not a theorem or an axiom. -/
abbrev CommonCriticalMapClosingProducer
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) : Prop :=
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  ∀ (j : Fin 3), j ≠ i → 5 ≤ (CP.capAt j).card →
    ∀ (r : ℝ), 0 < r →
      4 ≤ (SelectedClass D.A S.oppApex1 r).card →
        CriticalPairFrontier D S r Hcritical → False

/-- Routine parent adapter.  A proof of the explicit common-map producer
closes the live U1 leaf directly.  In particular, this proof contains no call
to `DoubleApexOffSurplusSharedRadiusPair`,
`exists_removableVertex_of_twoLargeCaps`, or `oppCap2_escape_gen`. -/
theorem false_of_twoLargeCaps_commonCriticalMap_of_producer
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hnotOppExact : ¬ CP.OppositePairExactAt i)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hcard : 9 < D.A.card)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (Hcritical : CriticalShellSystem D.A)
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y)
      [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (producer : CommonCriticalMapClosingProducer MT hCirc CP i hM hqCap
      hsurplus hqNonMoser hnotOppExact hNoM44 hcard hnoRem Hcritical
      hlocalNoQFree hfixed hbase H) :
    False := by
  let S := leafSurplusPacket
    (D := D) (MT := MT) (hCirc := hCirc) (CP := CP) (i := i)
    (hM := hM) (hsurplus := hsurplus)
  obtain ⟨j, hjne, hj5⟩ :=
    exists_secondLargeCap_of_noM44 MT hCirc CP hM hsurplus hNoM44
  obtain ⟨r, hr, hfour, ⟨F⟩⟩ :=
    exists_criticalPairFrontier_of_K4 D S Hcritical
  exact producer j hjne hj5 r hr hfour F

#print axioms false_of_twoLargeCaps_commonCriticalMap_of_producer

end ATAILParentFalseSurface
end Problem97
