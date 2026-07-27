import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier

/-- If a named point is the blocker center of a selected critical shell, it is
omitted from that shell.  This is the polarity of every blocker/source
coincidence arm in the live two-collision leaf. -/
theorem blocker_eq_point_forces_point_not_mem_selectedShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source point : ℝ²} (hsource : source ∈ D.A)
    (hblocker : H.centerAt source hsource = point) :
    point ∉
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  simpa only [hblocker] using
    (H.selectedAt source hsource).toCriticalFourShell.center_not_mem_support

/-- The finite cap split used by the live leaf produces a large cap or a
cross-row omission, not a cross-row hit. -/
theorem capEight_or_crossBlockerCoincidence_reorients_to_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {p₁ p₂ u v : ℝ²}
    (hp₁ : p₁ ∈ D.A) (hu : u ∈ D.A)
    (h :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt p₁ hp₁ = u ∨
          H.centerAt p₁ hp₁ = v ∨
            H.centerAt u hu = p₁ ∨
              H.centerAt u hu = p₂) :
    8 ≤ (S.capByIndex S.oppIndex1).card ∨
      u ∉ (H.selectedAt p₁ hp₁).toCriticalFourShell.support ∨
        v ∉ (H.selectedAt p₁ hp₁).toCriticalFourShell.support ∨
          p₁ ∉ (H.selectedAt u hu).toCriticalFourShell.support ∨
            p₂ ∉ (H.selectedAt u hu).toCriticalFourShell.support := by
  rcases h with hcap | hpu | hpv | hup | huv
  · exact Or.inl hcap
  · exact Or.inr <| Or.inl <|
      blocker_eq_point_forces_point_not_mem_selectedShell hp₁ hpu
  · exact Or.inr <| Or.inr <| Or.inl <|
      blocker_eq_point_forces_point_not_mem_selectedShell hp₁ hpv
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inl <|
      blocker_eq_point_forces_point_not_mem_selectedShell hu hup
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <|
      blocker_eq_point_forces_point_not_mem_selectedShell hu huv

end ATailFrontierLiveClosure
end Problem97
