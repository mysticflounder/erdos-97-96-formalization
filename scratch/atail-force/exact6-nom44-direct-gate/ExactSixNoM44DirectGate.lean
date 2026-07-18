/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Exact-six mutual `noM44` direct gate

The displayed large-opposite-caps packet cannot consume the parent's global
`noM44` hypothesis: its second opposite cap has cardinality six.  Moreover,
no non-obtuse MEC support triangle can consist entirely of points from the
exact-five physical radius class.  Hence any alternative `(m,4,4)` packet
must use a genuinely nonphysical support vertex.  Cap arithmetic sharpens
its surplus cap to cardinality at least nine.

These are necessary conditions on a direct `noM44` closer, not a conditional
replacement for that closer.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailExactSixNoM44DirectGateScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem physicalVertex_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    q.1 ≠ S.oppApex2 := by
  intro h
  have hdist :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass q)).2
  rw [h, dist_self] at hdist
  linarith [profile.radius_pos]

/-- Three distinct points of the physical exact-five class cannot be the
vertices of a non-obtuse triangle.  If they were, their common physical apex
would lie in their convex hull, contradicting convex independence. -/
theorem not_nonobtuse_of_three_distinct_physicalVertices
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (a b c : PhysicalVertex profile)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ¬ (0 ≤ ⟪b.1 - a.1, c.1 - a.1⟫_ℝ ∧
      0 ≤ ⟪c.1 - b.1, a.1 - b.1⟫_ℝ ∧
      0 ≤ ⟪a.1 - c.1, b.1 - c.1⟫_ℝ) := by
  rintro ⟨hinnerA, hinnerB, hinnerC⟩
  have habPoints : a.1 ≠ b.1 := by
    intro h
    exact hab (Subtype.ext h)
  have hacPoints : a.1 ≠ c.1 := by
    intro h
    exact hac (Subtype.ext h)
  have hbcPoints : b.1 ≠ c.1 := by
    intro h
    exact hbc (Subtype.ext h)
  have harea : signedArea2 a.1 b.1 c.1 ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear
      (PhysicalVertex.mem_A a) (PhysicalVertex.mem_A b)
      (PhysicalVertex.mem_A c) habPoints hacPoints hbcPoints
      (collinear_of_signedArea2_eq_zero a.1 b.1 c.1 hzero)
  have habDist : dist S.oppApex2 a.1 = dist S.oppApex2 b.1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass a)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass b)).2.symm
  have hacDist : dist S.oppApex2 a.1 = dist S.oppApex2 c.1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass a)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass c)).2.symm
  have hapexHull :
      S.oppApex2 ∈ convexHull ℝ ({a.1, b.1, c.1} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea habDist hacDist
      hinnerA hinnerB hinnerC
  have htripleSubset :
      ({a.1, b.1, c.1} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    intro x hx
    rcases hx with (rfl | rfl | rfl)
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A a,
        by simpa using physicalVertex_ne_physicalApex a⟩
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A b,
        by simpa using physicalVertex_ne_physicalApex b⟩
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A c,
        by simpa using physicalVertex_ne_physicalApex c⟩
  exact D.convex S.oppApex2 (by exact_mod_cast oppApex2_mem_A S)
    (convexHull_mono htripleSubset hapexHull)

/-- Every non-obtuse MEC support triangle on the same carrier has at least
one vertex outside the exact-five physical class.  This applies in particular
to every hypothetical alternative `IsM44` packet. -/
theorem supportTriangle_has_nonphysical_vertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : SurplusCapPacket D.A) :
    T.triangle.v1 ∉ physicalVertices profile ∨
      T.triangle.v2 ∉ physicalVertices profile ∨
      T.triangle.v3 ∉ physicalVertices profile := by
  by_contra h
  push_neg at h
  let a : PhysicalVertex profile := ⟨T.triangle.v1, h.1⟩
  let b : PhysicalVertex profile := ⟨T.triangle.v2, h.2.1⟩
  let c : PhysicalVertex profile := ⟨T.triangle.v3, h.2.2⟩
  have hab : a ≠ b := by
    intro hab
    exact T.triangle.v12_ne (congrArg Subtype.val hab)
  have hac : a ≠ c := by
    intro hac
    exact T.triangle.v13_ne (congrArg Subtype.val hac)
  have hbc : b ≠ c := by
    intro hbc
    exact T.triangle.v23_ne (congrArg Subtype.val hbc)
  apply not_nonobtuse_of_three_distinct_physicalVertices a b c hab hac hbc
  exact ⟨by simpa [a, b, c, SurplusCapPacket.triangle] using
      T.triangleNonObtuse.inner_at_v1,
    by simpa [a, b, c, SurplusCapPacket.triangle] using
      T.triangleNonObtuse.inner_at_v2,
    by simpa [a, b, c, SurplusCapPacket.triangle] using
      T.triangleNonObtuse.inner_at_v3⟩

/-- The displayed exact-six packet is already not `IsM44`; this conclusion
does not consume the parent's quantified `noM44` hypothesis. -/
theorem currentPacket_not_isM44_of_secondCap_card_eq_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hcap : S.oppCap2.card = 6) :
    ¬ S.IsM44 := by
  intro hM44
  have hsecond := hM44.2
  omega

/-- At the exact-six full-parent boundary, every hypothetical same-carrier
`IsM44` packet has a surplus cap of cardinality at least nine. -/
theorem alternativeM44_surplus_card_ge_nine
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (hcap : S.oppCap2.card = 6)
    {T : SurplusCapPacket D.A} (hT : T.IsM44) :
    9 ≤ T.surplusCap.card := by
  have hSsum := S.capSum
  have hTsum := T.capSum
  have hSsurplus := S.surplus_card_gt_four
  have hfirst := L.firstOppCap_card_ge_six
  have hTfirst := hT.1
  have hTsecond := hT.2
  omega

/-- Exact normalized gate for any attempted direct use of `R.noM44`: the
hypothetical witness must differ from the displayed packet, have a surplus
cap of size at least nine, and use a nonphysical support vertex. -/
theorem alternativeM44_exact_gate
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (hcap : S.oppCap2.card = 6)
    {T : SurplusCapPacket D.A} (hT : T.IsM44) :
    T ≠ S ∧
      9 ≤ T.surplusCap.card ∧
      (T.triangle.v1 ∉ physicalVertices profile ∨
        T.triangle.v2 ∉ physicalVertices profile ∨
        T.triangle.v3 ∉ physicalVertices profile) := by
  refine ⟨?_, alternativeM44_surplus_card_ge_nine L hcap hT,
    supportTriangle_has_nonphysical_vertex T⟩
  intro hTS
  subst T
  exact currentPacket_not_isM44_of_secondCap_card_eq_six hcap hT

/-- The origin-tagged unused continuation source is already outside the
physical exact-five class.  It is the only retained source role that meets
the nonphysical part of the alternative-support gate without further work;
the parent does not assert that it lies on the MEC boundary. -/
theorem continuationUnused_not_mem_physicalVertices
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) :
    M.continuation.unusedRow.unused.point ∉ physicalVertices profile := by
  intro hphysical
  exact M.continuation.unusedRow.unused.point_not_mem_radiusClass
    (Finset.mem_inter.mp hphysical).1

#print axioms not_nonobtuse_of_three_distinct_physicalVertices
#print axioms supportTriangle_has_nonphysical_vertex
#print axioms currentPacket_not_isM44_of_secondCap_card_eq_six
#print axioms alternativeM44_surplus_card_ge_nine
#print axioms alternativeM44_exact_gate
#print axioms continuationUnused_not_mem_physicalVertices

end

end ATailExactSixNoM44DirectGateScratch
end Problem97
