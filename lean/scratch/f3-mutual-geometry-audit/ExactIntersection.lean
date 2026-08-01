import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

theorem scratch_mutual_distinct_exact_intersection
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (source source' : CriticalShellSystem.CarrierVertex A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hforward :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (hbackward :
      source.1 ∈
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support)
    (hblockersNe : H.blockerVertex source ≠ H.blockerVertex source') :
    (H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support =
      {source.1, source'.1} := by
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
  let K' :=
    (H.selectedAt source'.1 source'.2).toCriticalFourShell.toSelectedFourClass
  have hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro h
    apply hblockersNe
    apply Subtype.ext
    exact h
  have hle : (K.support ∩ K'.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two K K' hcenters
  have hsubset :
      ({source.1, source'.1} : Finset ℝ²) ⊆ K.support ∩ K'.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support,
          hbackward⟩
    · exact Finset.mem_inter.mpr
        ⟨hforward,
          (H.selectedAt source'.1 source'.2).toCriticalFourShell.q_mem_support⟩
  have heq :
      ({source.1, source'.1} : Finset ℝ²) = K.support ∩ K'.support := by
    apply Finset.eq_of_subset_of_card_le hsubset
    simpa [hsourcesNe] using hle
  exact heq.symm

namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailOrientedPhysicalApexIngress

theorem scratch_same_firstApex_radius_closes_distinct_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {frontierRadius commonRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S frontierRadius H}
    (R : FrontierCommonDeletionParentResidual F)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hforward :
      source'.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support)
    (hbackward :
      source.1 ∈
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support)
    (hblockersNe : H.blockerVertex source ≠ H.blockerVertex source') :
    False := by
  apply hblockersNe
  apply Subtype.ext
  exact blocker_centers_eq_of_secondRadius_mutual_cross_membership
    R source.2 source'.2 hsourcesNe
    hsourceRadius hsourceRadius' hforward hbackward

end ATailFrontierLiveClosure
end Problem97
