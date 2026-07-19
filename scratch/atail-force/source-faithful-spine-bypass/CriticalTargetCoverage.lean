import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Global critical-source coverage

Copied from the `/opt/nfs` Round-159 checkpoint.  This bridge is uniform in
the carrier: at the actual blocker of each source, every selected four-class
contains that source, and the blocker owner is distinct from the source.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Round159CriticalTargetCoverage

attribute [local instance] Classical.propDecidable

theorem source_mem_faithfulRow_at_blocker
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (F : FaithfulCarrierPattern A)
    (q : CriticalShellSystem.CarrierVertex A) :
    q.1 ∈
      (F.classAt (H.blockerVertex q).1 (H.blockerVertex q).2).support := by
  exact H.source_mem_selectedFourClass q.1 q.2
    (F.classAt (H.blockerVertex q).1 (H.blockerVertex q).2)

theorem blocker_owner_ne_source
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A) :
    H.blockerVertex q ≠ q :=
  H.blockerVertex_ne q

theorem every_target_has_distinct_faithfulRow_owner
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (F : FaithfulCarrierPattern A)
    (q : CriticalShellSystem.CarrierVertex A) :
    ∃ c : CriticalShellSystem.CarrierVertex A,
      c ≠ q ∧ q.1 ∈ (F.classAt c.1 c.2).support := by
  exact ⟨H.blockerVertex q, H.blockerVertex_ne q,
    source_mem_faithfulRow_at_blocker H F q⟩

theorem exists_faithfulCarrierPattern_with_critical_target_coverage
    {A : Finset ℝ²} (hA : A.Nonempty)
    (hK4 : HasNEquidistantProperty 4 A)
    (H : CriticalShellSystem A) :
    ∃ F : FaithfulCarrierPattern A,
      ∀ q : CriticalShellSystem.CarrierVertex A,
        ∃ c : CriticalShellSystem.CarrierVertex A,
          c ≠ q ∧ q.1 ∈ (F.classAt c.1 c.2).support := by
  rcases hA with ⟨gauge, hgauge⟩
  rcases exists_faithfulCarrierPattern_of_globalK4 hK4 hgauge with ⟨F⟩
  exact ⟨F, every_target_has_distinct_faithfulRow_owner H F⟩

#print axioms source_mem_faithfulRow_at_blocker
#print axioms exists_faithfulCarrierPattern_with_critical_target_coverage

end Round159CriticalTargetCoverage
end Problem97
