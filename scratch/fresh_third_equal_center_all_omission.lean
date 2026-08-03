import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Scratch check: equal-center fresh-third rows omit every collision endpoint
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailCriticalFiberRetainedRadiusSelector
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailTwoCollisionGlobalProducer

attribute [local instance] Classical.propDecidable

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- Scratch producer: the equal-cross-row-center residual omits every retained
collision endpoint, not merely one common endpoint. -/
theorem allCollisionEndpointsOmitted_of_equalCenterHits_scratch
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst : FreshThirdCrossRowHit P Pρ C.firstSource Q)
    (hsecond : FreshThirdCrossRowHit P Pρ C.secondSource Q)
    (hcenters :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt C.secondSource.1 C.secondSource.2) :
    AllCollisionEndpointsOmitted P Pρ C.firstSource C.secondSource := by
  classical
  have hexact :=
    freshThirdEqualCenterExactFourRow_of_hits
      (P := P) (Pρ := Pρ) C Q hfirst hsecond hcenters
  have hQ₁Outside :
      Q.source₁.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₁_ne_first₁ (Subtype.ext h),
          fun h => Q.source₁_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₁_ne_second₁ (Subtype.ext h),
        fun h => Q.source₁_ne_second₂ (Subtype.ext h)⟩
  have hQ₂Outside :
      Q.source₂.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂}) := by
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton,
      not_or]
    exact
      ⟨⟨fun h => Q.source₂_ne_first₁ (Subtype.ext h),
          fun h => Q.source₂_ne_first₂ (Subtype.ext h)⟩,
        fun h => Q.source₂_ne_second₁ (Subtype.ext h),
        fun h => Q.source₂_ne_second₂ (Subtype.ext h)⟩
  intro z hz
  have hzNeFirst : z ≠ C.firstSource.1 := by
    intro h
    subst z
    exact C.firstSource_data.2.2.1 hz
  have hzNeSecond : z ≠ C.secondSource.1 := by
    intro h
    subst z
    exact C.secondSource_data.2.2.1 hz
  have hzNeQ₁ : z ≠ Q.source₁.1 := by
    intro h
    subst z
    exact hQ₁Outside hz
  have hzNeQ₂ : z ≠ Q.source₂.1 := by
    intro h
    subst z
    exact hQ₂Outside hz
  constructor
  · rw [hexact.first_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))
  · rw [hexact.second_support_eq]
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro hzNeFirst (And.intro hzNeSecond (And.intro hzNeQ₁ hzNeQ₂))

#print axioms allCollisionEndpointsOmitted_of_equalCenterHits_scratch

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
