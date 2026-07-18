import Erdos9796Proof.P97.ATail.ParentExactFiveExactSix
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Physical exact-five triples cannot be non-obtuse support triangles

The arbitrary mutual-omission pair lives in one exact-five radius class at
the physical second apex.  Any third physical source is co-radial with that
pair.  If those three sources formed a non-obtuse triangle, the physical apex
would lie in their convex hull.  This contradicts convex independence because
the apex is a fourth carrier point.

Thus the most immediate `noM44` retriangulation -- using the mutual pair and a
third physical exact-five source -- is unavailable even before one asks for
MEC-boundary membership or exact cap counts.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailExactSixMutualMECNoM44Scratch

open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

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

/-- Three distinct physical exact-five sources cannot form a non-obtuse
triangle.  The conclusion is deliberately independent of the exact-six cap
count: the exact-five profile supplies a third source, but co-radiality already
rules out that triple as a replacement non-obtuse MEC support triangle. -/
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

private theorem mutualPair_source_ne_target
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : PhysicalActualCriticalMutualOmissionPair H profile) :
    P.source ≠ P.target := by
  intro h
  apply P.target_not_mem_sourceSupport
  simpa [h] using
    (H.selectedAt P.source.1
      (PhysicalVertex.mem_A P.source)).toCriticalFourShell.q_mem_support

/-- The mutual pair has a third physical exact-five source, but every such
completion is obtuse.  This is the exact obstruction to the most immediate
alternative-support-triangle construction. -/
theorem exists_third_physicalVertex_and_not_nonobtuse
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : ATailCriticalPairFrontier.CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : FullParentExactFiveMutualData L profile) :
    ∃ third : PhysicalVertex profile,
      third ≠ M.pair.source ∧
        third ≠ M.pair.target ∧
          ¬ (0 ≤ ⟪M.pair.target.1 - M.pair.source.1,
              third.1 - M.pair.source.1⟫_ℝ ∧
            0 ≤ ⟪third.1 - M.pair.target.1,
              M.pair.source.1 - M.pair.target.1⟫_ℝ ∧
            0 ≤ ⟪M.pair.source.1 - third.1,
              M.pair.target.1 - third.1⟫_ℝ) := by
  classical
  have hpair : M.pair.source ≠ M.pair.target :=
    mutualPair_source_ne_target M.pair
  have hthird :
      ∃ x ∈ physicalVertices profile,
        x ≠ M.pair.source.1 ∧ x ≠ M.pair.target.1 := by
    by_contra h
    push_neg at h
    have hsub :
        physicalVertices profile ⊆
          ({M.pair.source.1, M.pair.target.1} : Finset ℝ²) := by
      intro x hx
      by_cases hxSource : x = M.pair.source.1
      · simp [hxSource]
      · have hxTarget := h x hx hxSource
        simp [hxTarget]
    have hcard := Finset.card_le_card hsub
    have hpairPoints : M.pair.source.1 ≠ M.pair.target.1 := by
      intro heq
      exact hpair (Subtype.ext heq)
    rw [Finset.card_pair hpairPoints] at hcard
    have hthree := physicalVertices_card_ge_three profile
    omega
  rcases hthird with ⟨x, hx, hxSource, hxTarget⟩
  let third : PhysicalVertex profile := ⟨x, hx⟩
  have hthirdSource : third ≠ M.pair.source := by
    intro h
    exact hxSource (congrArg Subtype.val h)
  have hthirdTarget : third ≠ M.pair.target := by
    intro h
    exact hxTarget (congrArg Subtype.val h)
  exact ⟨third, hthirdSource, hthirdTarget,
    not_nonobtuse_of_three_distinct_physicalVertices
      M.pair.source M.pair.target third hpair hthirdSource.symm
        hthirdTarget.symm⟩

#print axioms not_nonobtuse_of_three_distinct_physicalVertices
#print axioms exists_third_physicalVertex_and_not_nonobtuse

end ATailExactSixMutualMECNoM44Scratch
end Problem97
