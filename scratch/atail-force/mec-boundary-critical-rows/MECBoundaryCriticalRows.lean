import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# MEC-boundary critical-row scratch lemmas

This file isolates the two facts that are automatic from the three critical
rows sourced at the MEC-boundary Moser vertices:

* subtracting the source and support circle equations turns MEC containment
  into a closed half-plane inequality; and
* once every source row can hit at most one of the other two sources, the
  cross-hit graph is either missing both directions on some pair or is a
  directed three-cycle.

No production theorem imports this scratch file.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailForce
namespace MECBoundaryCriticalRows

private theorem dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- If `q` is on the boundary of a disk centered at `O`, `z` is in that
disk, and `q,z` lie on one circle centered at `s`, then every such `z` lies
in the closed half-plane through `q` whose inward normal is `O-s`.

The identity behind the result is
`dist z O ^ 2 - dist q O ^ 2 = 2 * ⟪s - O, z - q⟫`.
-/
theorem shell_support_halfspace_of_mec
    {O q s z : ℝ²}
    (hDisk : dist z O ≤ dist q O)
    (hShell : dist s z = dist s q) :
    inner ℝ (s - O) (z - q) ≤ 0 := by
  have hDiskSq : dist z O ^ 2 ≤ dist q O ^ 2 := by
    have hz : 0 ≤ dist z O := dist_nonneg
    have hq : 0 ≤ dist q O := dist_nonneg
    nlinarith only [hDisk, hz, hq]
  have hShellSq : dist s z ^ 2 = dist s q ^ 2 :=
    congrArg (fun r : ℝ => r ^ 2) hShell
  rw [dist_sq_coords z O, dist_sq_coords q O] at hDiskSq
  rw [dist_sq_coords s z, dist_sq_coords s q] at hShellSq
  rw [PiLp.inner_apply]
  simp only [Fin.sum_univ_two, PiLp.sub_apply, RCLike.inner_apply,
    conj_trivial]
  nlinarith only [hDiskSq, hShellSq]

/-- Pure three-row endpoint.  Here `ab` means that the row sourced at `a`
contains `b`.  The first three hypotheses say that each source row contains
at most one of the other two sources.

Either some unordered pair misses in both directions (reciprocal deletion
survival), or all three hits form one of the two directed three-cycles.
-/
theorem three_source_hit_dichotomy
    (ab ac ba bc ca cb : Prop)
    (ha : ¬ (ab ∧ ac))
    (hb : ¬ (ba ∧ bc))
    (hc : ¬ (ca ∧ cb)) :
    ((¬ ab ∧ ¬ ba) ∨ (¬ bc ∧ ¬ cb) ∨ (¬ ca ∧ ¬ ac)) ∨
      (ab ∧ bc ∧ ca) ∨ (ac ∧ cb ∧ ba) := by
  tauto

#print axioms shell_support_halfspace_of_mec
#print axioms three_source_hit_dichotomy

end MECBoundaryCriticalRows
end ATailForce
end Problem97
