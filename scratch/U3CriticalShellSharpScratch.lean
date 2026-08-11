import Erdos9796Proof.P97.U5GlobalIncidenceSupport

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

theorem CriticalFourShell.inter_dangerousTriple_card_le_one_scratch
    {D : CounterexampleData} {q p center : ℝ²} {T : Finset ℝ²}
    (H : U5DangerousTriple D q p T)
    (K : CriticalFourShell D.A q center)
    (hcenter_ne_p : center ≠ p) :
    (K.support ∩ T).card ≤ 1 := by
  classical
  have hq_not_T : q ∉ T := by
    intro hqT
    have hqS : q ∈ (D.skeleton q).erase p := H.T_subset hqT
    have hqSkel : q ∈ D.skeleton q := (Finset.mem_erase.mp hqS).2
    have hqErase : q ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hqSkel
    exact (Finset.mem_erase.mp hqErase).1 rfl
  have hinter : (K.support ∩ insert q T).card ≤ 2 :=
    K.inter_dangerous_p_circle_card_le_two H hcenter_ne_p
  have hq_not_inter : q ∉ K.support ∩ T := by
    simp [hq_not_T]
  have heq : K.support ∩ insert q T = insert q (K.support ∩ T) := by
    ext y
    by_cases hyq : y = q
    · subst y
      simp [K.q_mem_support]
    · simp [hyq]
  rw [heq, Finset.card_insert_of_notMem hq_not_inter] at hinter
  omega

end Problem97
