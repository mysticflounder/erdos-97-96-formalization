import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# FirstNonHit alias-aware blocker-fiber normalization

This scratch theorem isolates the exact multiplicity consequence available
from four named sources with one common actual blocker.  It does not assert a
FreshThird contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSurvivalCover

attribute [local instance] Classical.propDecidable

/-- Four pairwise-distinct named sources exhaust a common actual-blocker fiber. -/
theorem four_named_sources_saturate_actualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (c₁ c₂ q₁ q₂ : CriticalShellSystem.CarrierVertex A)
    (hc₁c₂ : c₁ ≠ c₂) (hq₁q₂ : q₁ ≠ q₂)
    (hc₁q₁ : c₁ ≠ q₁) (hc₁q₂ : c₁ ≠ q₂)
    (hc₂q₁ : c₂ ≠ q₁) (hc₂q₂ : c₂ ≠ q₂)
    (hc₁ : H.blockerVertex c₁ = H.blockerVertex q₁)
    (hc₂ : H.blockerVertex c₂ = H.blockerVertex q₁)
    (hq₂ : H.blockerVertex q₂ = H.blockerVertex q₁) :
    (actualBlockerFiber H q₁).card = 4 ∧
      (actualBlockerFiber H q₁).image (fun source => source.1) =
        (H.selectedAt q₁.1 q₁.2).toCriticalFourShell.support := by
  let named : Finset (CriticalShellSystem.CarrierVertex A) := {c₁, c₂, q₁, q₂}
  have hnamedSubset : named ⊆ actualBlockerFiber H q₁ := by
    intro source hsource
    simp only [named, Finset.mem_insert, Finset.mem_singleton] at hsource
    rcases hsource with rfl | rfl | rfl | rfl
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hc₁⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hc₂⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, rfl⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hq₂⟩
  have hnamedCard : named.card = 4 := by
    simp [named, hc₁c₂, hq₁q₂, hc₁q₁, hc₁q₂,
      hc₂q₁, hc₂q₂]
  have hfiberCard : (actualBlockerFiber H q₁).card = 4 := by
    have hle := actualBlockerFiber_card_le_four H q₁
    have hge : 4 ≤ (actualBlockerFiber H q₁).card := by
      simpa [hnamedCard] using Finset.card_le_card hnamedSubset
    omega
  exact ⟨hfiberCard,
    actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four H q₁ hfiberCard⟩

/-- Without assuming cross-packet freshness, common-blocker data yields either
one explicit `C`/`Q` alias or saturation of the four-point blocker fiber. -/
theorem four_named_sources_crossAlias_or_saturate_actualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (c₁ c₂ q₁ q₂ : CriticalShellSystem.CarrierVertex A)
    (hc₁c₂ : c₁ ≠ c₂) (hq₁q₂ : q₁ ≠ q₂)
    (hc₁ : H.blockerVertex c₁ = H.blockerVertex q₁)
    (hc₂ : H.blockerVertex c₂ = H.blockerVertex q₁)
    (hq₂ : H.blockerVertex q₂ = H.blockerVertex q₁) :
    c₁ = q₁ ∨ c₁ = q₂ ∨ c₂ = q₁ ∨ c₂ = q₂ ∨
      ((actualBlockerFiber H q₁).card = 4 ∧
        (actualBlockerFiber H q₁).image (fun source => source.1) =
          (H.selectedAt q₁.1 q₁.2).toCriticalFourShell.support) := by
  by_cases hc₁q₁ : c₁ = q₁
  · exact Or.inl hc₁q₁
  by_cases hc₁q₂ : c₁ = q₂
  · exact Or.inr (Or.inl hc₁q₂)
  by_cases hc₂q₁ : c₂ = q₁
  · exact Or.inr (Or.inr (Or.inl hc₂q₁))
  by_cases hc₂q₂ : c₂ = q₂
  · exact Or.inr (Or.inr (Or.inr (Or.inl hc₂q₂)))
  exact Or.inr (Or.inr (Or.inr (Or.inr
    (four_named_sources_saturate_actualBlockerFiber H c₁ c₂ q₁ q₂
      hc₁c₂ hq₁q₂ hc₁q₁ hc₁q₂ hc₂q₁ hc₂q₂
      hc₁ hc₂ hq₂))))

end ATailSurvivalCover

namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover

namespace TwoSourceExactCollisionRowsTerminal

/-- The equal-blocker/equal-blocker FreshThird arm either contains a cross
alias between its canonical sources and the fresh pair, or saturates the
fresh pair's complete actual-blocker fiber and selected row. -/
theorem freshThird_sameBlocker_sources_crossAlias_or_saturate
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hfirst :
      H.centerAt C.firstSource.1 C.firstSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hsecond :
      H.centerAt C.secondSource.1 C.secondSource.2 =
        H.centerAt Q.source₁.1 Q.source₁.2) :
    C.firstSource = Q.source₁ ∨ C.firstSource = Q.source₂ ∨
      C.secondSource = Q.source₁ ∨ C.secondSource = Q.source₂ ∨
      ((actualBlockerFiber H Q.source₁).card = 4 ∧
        (actualBlockerFiber H Q.source₁).image (fun source => source.1) =
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) := by
  apply four_named_sources_crossAlias_or_saturate_actualBlockerFiber
    H C.firstSource C.secondSource Q.source₁ Q.source₂
  · intro h
    exact C.sources_ne (congrArg Subtype.val h)
  · exact Q.sources_ne
  · exact Subtype.ext hfirst
  · exact Subtype.ext hsecond
  · exact Q.blockers_eq.symm

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
