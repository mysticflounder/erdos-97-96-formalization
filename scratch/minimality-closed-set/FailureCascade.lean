import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion

/-!
# Failure cascades forced by global minimality

For a cardinality-minimal counterexample, every nonempty deletion seed
eventually grows to the whole carrier by repeatedly deleting a remaining
center which has already lost all K4 witnesses.  This is the exact abstract
closure theorem behind a "closed deleted set" argument.

The result is deliberately independent of the cap geometry.  To obtain a
contradiction from a geometric seed one must prove that its cascade is trapped
in a proper subset of the carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMinimalityClosedSet

open ATailGlobalMinimalDeletion

/-- `FailureCascade D U V` records a sequence from `U` to `V` in which each
newly deleted point is still present and is already a locally failed center. -/
inductive FailureCascade (D : CounterexampleData) :
    Finset ℝ² → Finset ℝ² → Prop
  | refl (U : Finset ℝ²) : FailureCascade D U U
  | delete {U V : Finset ℝ²} {center : ℝ²}
      (hcenter : center ∈ D.A \ U)
      (hblocked :
        ¬ HasNEquidistantPointsAt 4 (D.A \ U) center)
      (htail : FailureCascade D (insert center U) V) :
      FailureCascade D U V

/-- Global cardinal minimality says that every nonempty deletion seed
percolates to the full carrier under the local-failure deletion rule. -/
theorem failureCascade_to_full_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal)
    {seed : Finset ℝ²}
    (hseedSub : seed ⊆ D.A)
    (hseedNe : seed.Nonempty) :
    FailureCascade D seed D.A := by
  classical
  let rec go (U : Finset ℝ²)
      (hUsub : U ⊆ D.A)
      (hUne : U.Nonempty) :
      FailureCascade D U D.A := by
    by_cases hremainingEmpty : D.A \ U = ∅
    · have hAU : D.A ⊆ U :=
        Finset.sdiff_eq_empty_iff_subset.mp hremainingEmpty
      have hUA : U = D.A :=
        Finset.Subset.antisymm hUsub hAU
      subst U
      exact FailureCascade.refl D.A
    · have hremaining : (D.A \ U).Nonempty :=
        Finset.nonempty_iff_ne_empty.mpr hremainingEmpty
      have hproper : D.A \ U ≠ D.A := by
        intro heq
        rcases hUne with ⟨u, huU⟩
        have huRemaining : u ∈ D.A \ U := by
          rw [heq]
          exact hUsub huU
        exact (Finset.mem_sdiff.mp huRemaining).2 huU
      have hnotGlobal :
          ¬ HasNEquidistantProperty 4 (D.A \ U) :=
        not_hasNEquidistantProperty_of_nonempty_proper_subset
          hmin hremaining Finset.sdiff_subset hproper
      rcases exists_local_blocker_of_not_global_K4 hnotGlobal with
        ⟨center, hcenterRemaining, hcenterBlocked⟩
      have hcenterA : center ∈ D.A :=
        (Finset.mem_sdiff.mp hcenterRemaining).1
      have hnextSub : insert center U ⊆ D.A := by
        intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hxU
        · exact hcenterA
        · exact hUsub hxU
      have hnextNe : (insert center U).Nonempty :=
        ⟨center, Finset.mem_insert_self center U⟩
      have hdiff :
          D.A \ insert center U = (D.A \ U).erase center := by
        ext x
        simp only [Finset.mem_sdiff, Finset.mem_insert,
          Finset.mem_erase]
        aesop
      have hdecrease :
          (D.A \ insert center U).card < (D.A \ U).card := by
        rw [hdiff]
        exact Finset.card_erase_lt_of_mem hcenterRemaining
      exact FailureCascade.delete hcenterRemaining hcenterBlocked
        (go (insert center U) hnextSub hnextNe)
  termination_by (D.A \ U).card
  decreasing_by exact hdecrease
  exact go seed hseedSub hseedNe

#print axioms failureCascade_to_full_of_minimal

end ATailMinimalityClosedSet
end Problem97
