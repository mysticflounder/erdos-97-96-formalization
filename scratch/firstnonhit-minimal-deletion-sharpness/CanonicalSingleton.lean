import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

namespace Problem97

open ATailMinimalUniqueFourCover

/-- The global minimal-deletion ingress for a selected critical row admits
the canonical one-point witness at that row's own blocker center. -/
theorem scratch_exists_canonical_singleton_blocking_subdeletion
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (q : ℝ²) (hq : q ∈ D.A) (s : ℝ²)
    (hs : s ∈ (H.selectedAt q hq).toCriticalFourShell.support) :
    let K := (H.selectedAt q hq).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ D.A \ K.support, ∃ V : Finset ℝ²,
      V.Nonempty ∧
      V ⊆ K.support ∧
      ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
      ∀ t ∈ V,
        HasNEquidistantPointsAt 4 (D.A \ (V.erase t)) center := by
  classical
  dsimp only
  let K := (H.selectedAt q hq).toCriticalFourShell.toSelectedFourClass
  have hcenterA : H.centerAt q hq ∈ D.A :=
    Finset.mem_of_mem_erase
      (H.selectedAt q hq).toCriticalFourShell.center_mem
  have hsUnique : s ∈ uniqueFourClass D.A (H.centerAt q hq) := by
    rw [uniqueFourClass_centerAt_eq_selectedAt_support H q hq]
    exact hs
  have hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A \ ({s} : Finset ℝ²))
        (H.centerAt q hq) := by
    simpa [Finset.sdiff_singleton_eq_erase] using
      not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass
        (isUniqueFourCenter_centerAt H q hq) hsUnique
  refine ⟨H.centerAt q hq, ?_, {s}, Finset.singleton_nonempty s, ?_, hblocked, ?_⟩
  · exact Finset.mem_sdiff.mpr ⟨hcenterA, K.center_not_mem⟩
  · simpa [K] using hs
  · intro t ht
    have hts : t = s := Finset.mem_singleton.mp ht
    subst t
    simpa using D.K4 (H.centerAt q hq) hcenterA

end Problem97
